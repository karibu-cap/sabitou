import 'dart:async';
import 'dart:convert';

import 'package:connectrpc/connect.dart' as connect;
import 'package:flutter/foundation.dart' show VoidCallback;
import 'package:get_it/get_it.dart';

import '../../utils/logger.dart';
import 'auth_api_client.dart';
import 'token_service.dart';

/// Manages proactive JWT renewal via a [Timer].
///
/// **Why this service exists:**
/// - The PowerSync credentials callback (SharedWorker → main thread bridge)
///   cannot execute Connect RPC or Dio with explicit generics on web
///   (dart2js RTI bug: `T[_eval] is not a function`).
/// - The solution: NEVER do network calls inside [fetchCredentials].
///   This service renews the token 90s before expiry on the main event
///   loop (normal Timer callback), where Connect RPC works correctly.
/// - [fetchCredentials] awaits [activeRefresh] if a refresh is in progress,
///   otherwise calls [refreshNow] with `unawaited()` and returns `null` so
///   PowerSync retries in a few seconds.
class TokenRefreshService {
  final _logger = LoggerApp('TokenRefreshService');
  final AuthApiClient _authApiClient;

  Timer? _timer;

  /// In-progress Future if a refresh is active. Awaitable for deduplication.
  Future<void>? activeRefresh;

  /// Called when the refresh token is revoked (401) → triggers logout.
  VoidCallback? onUnauthorized;

  /// Singleton instance.
  static TokenRefreshService get instance => GetIt.I.get<TokenRefreshService>();

  /// Constructs a new [TokenRefreshService].
  TokenRefreshService({required AuthApiClient authApiClient})
    : _authApiClient = authApiClient;

  // ---------------------------------------------------------------------------
  // Public API
  // ---------------------------------------------------------------------------

  /// Schedules the next refresh 90s before the current token's expiry.
  /// Call this after every successful [TokenService.saveTokens].
  Future<void> scheduleNext() async {
    _timer?.cancel();

    final token = await TokenService.instance.getAccessToken();
    if (token == null || token.isEmpty) return;

    if (TokenService.instance.isExpired(token)) {
      // Already expired — refresh immediately (via Timer.zero to stay off the
      // current call stack).
      _timer = Timer(Duration.zero, refreshNow);

      return;
    }

    final exp = _extractExp(token);
    if (exp == null) return;

    final expiry = DateTime.fromMillisecondsSinceEpoch(exp * 1000);
    // 90s before the real expiry. _isExpired already has a 30s buffer,
    // so we have 60s of margin before fetchCredentials sees the token as expired.
    final refreshAt = expiry.subtract(const Duration(seconds: 90));
    var delay = refreshAt.difference(DateTime.now());
    if (delay.inSeconds < 5) delay = const Duration(seconds: 5);

    _logger.log(
      'Next refresh in ${delay.inSeconds}s '
      '(expiry: ${expiry.toLocal()})',
    );
    _timer = Timer(delay, refreshNow);
  }

  /// Triggers an immediate refresh if none is already in progress.
  ///
  /// Thread-safe: [activeRefresh] is assigned synchronously before any
  /// `await`, so concurrent callers see the in-progress Future.
  ///
  /// Designed to be called with `unawaited()` from [fetchCredentials]:
  /// the actual work runs on the main event loop, outside the credentials
  /// callback context, which avoids the dart2js RTI bug.
  Future<void> refreshNow() async {
    if (activeRefresh != null) {
      _logger.log('refreshNow: refresh already in progress, skipping');

      return;
    }

    // Assign before any await → concurrent callers see the in-progress Future.
    activeRefresh = _doRefresh();
    try {
      await activeRefresh;
    } finally {
      activeRefresh = null;
    }
  }

  /// Stops the timer. Call this on logout.
  void cancel() {
    _timer?.cancel();
    _timer = null;
    // Do not nullify activeRefresh here — a refresh may still be in flight.
  }

  // ---------------------------------------------------------------------------
  // Internal implementation
  // ---------------------------------------------------------------------------

  Future<void> _doRefresh() async {
    final refreshToken = await TokenService.instance.getRefreshToken();
    if (refreshToken == null) {
      _logger.severe('_doRefresh: no refresh token available');

      return;
    }

    _logger.log('Token refresh started...');
    try {
      final tokens = await _authApiClient.refreshTokens(refreshToken);
      await TokenService.instance.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );
      _logger.log('Token refresh succeeded');
      // Schedule the next refresh based on the new token's expiry.
      await scheduleNext();
    } on connect.ConnectException catch (e) {
      _logger.severe(
        'Token refresh ConnectException: ${e.code} — ${e.message}',
      );
      if (e.code == connect.Code.unauthenticated) {
        _logger.severe('Refresh token revoked → forcing logout');
        onUnauthorized?.call();
      }
      // Other codes → let PowerSync retry via fetchCredentials.
    } catch (e) {
      _logger.severe('Token refresh unexpected error: $e');
    }
  }

  /// Extracts the `exp` claim without verifying the signature.
  static int? _extractExp(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final normalized = base64.normalize(
        parts[1].replaceAll('-', '+').replaceAll('_', '/'),
      );
      final payload =
          jsonDecode(utf8.decode(base64.decode(normalized)))
              as Map<String, dynamic>;

      return payload['exp'] as int?;
    } catch (_) {
      return null;
    }
  }
}
