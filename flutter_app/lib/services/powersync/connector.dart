// flutter_app/lib/services/powersync/connector.dart

import 'package:dio/dio.dart';
import 'package:powersync/powersync.dart';

import '../../utils/app_config.dart';
import '../../utils/logger.dart';
import '../auth/auth_api_client.dart';
import '../auth/token_service.dart';

/// [PowerSyncConnector] bridges the PowerSync client to our Go connector.
///
/// Responsibilities:
///   1. Provide a valid JWT to PowerSync so it can open the sync stream.
///   2. Forward local CRUD operations to the connector's upload endpoint.
///
/// PowerSync calls these methods internally — your application code does not
/// call them directly.
///
/// **Web / dart2js note — why we use Dio for token refresh:**
/// `fetchCredentials` is invoked from the PowerSync SDK credential callback.
/// Calling Connect RPC clients (`AuthServiceClient.refreshToken`) from inside
/// this callback on web causes a `JSNoSuchMethodError: T[_eval]` — a dart2js
/// generic-type-erasure bug that surfaces when Connect RPC's typed Future chain
/// is invoked through certain callback boundaries.
///
/// The workaround: use Dio (XMLHttpRequest on web, dart:io on native) to call
/// the Connect RPC JSON protocol endpoint directly. This is mechanically
/// identical to what the Connect SDK does, but avoids the generic type chain
/// that triggers the dart2js bug.
class PowerSyncConnector extends PowerSyncBackendConnector {
  final AuthApiClient _authApiClient;
  final _logger = LoggerApp('PowerSyncConnector');

  /// Separate Dio instance for credential refresh only.
  /// Must NOT share the main app Dio instance — fetchCredentials can be called
  /// from any async context and we don't want interceptor side-effects here.
  final Dio _refreshDio = Dio(
    BaseOptions(
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {
        'Content-Type': 'application/json',
        'Connect-Protocol-Version': '1',
      },
    ),
  );

  Future<String?>? _refreshFuture;

  PowerSyncConnector(this._authApiClient);

  // ---------------------------------------------------------------------------
  // 1. Token provision
  // ---------------------------------------------------------------------------

  @override
  Future<PowerSyncCredentials?> fetchCredentials() async {
    try {
      // Try a valid (non-expired) stored token first — no network call needed.
      var token = await TokenService.instance.getValidAccessToken();

      if (token == null) {
        // Access token expired — attempt a silent refresh via Dio (not Connect
        // RPC client) to avoid the dart2js JSNoSuchMethodError on web.
        final refreshToken = await TokenService.instance.getRefreshToken();
        if (refreshToken == null) {
          _logger.severe('fetchCredentials: no refresh token stored');

          return null;
        }

        if (_refreshFuture != null) {
          _logger.log('Waiting for in-progress silent token refresh...');
          token = await _refreshFuture;
        } else {
          _logger.log('Access token expired, attempting silent refresh...');
          _refreshFuture = _refreshViaDio(refreshToken);
          try {
            token = await _refreshFuture;
          } finally {
            _refreshFuture = null;
          }
        }

        if (token == null) return null;
      }

      return PowerSyncCredentials(
        endpoint: AppConfig.powerSyncUrl,
        token: token,
        userId: await TokenService.instance.getUserId(),
      );
    } catch (e) {
      _logger.severe('fetchCredentials failed: ${e.runtimeType} — $e');

      return null;
    }
  }

  /// Refreshes the token pair by calling the Connect RPC endpoint directly
  /// over Dio (JSON body). Returns the new access token on success, null on
  /// any failure.
  ///
  /// Connect RPC JSON protocol:
  ///   POST {baseUrl}/{package}.{Service}/{Method}
  ///   Content-Type: application/json
  ///   Body: { ...request fields in camelCase... }
  Future<String?> _refreshViaDio(String refreshToken) async {
    try {
      final response = await _refreshDio.post<Map<String, dynamic>>(
        '${AppConfig.connectorUrl}/identity.v1.AuthService/RefreshToken',
        data: {'refreshToken': refreshToken},
      );

      final data = response.data;
      if (data == null) return null;

      final newAccessToken = data['token'] as String?;
      final newRefreshToken = data['refreshToken'] as String?;

      if (newAccessToken == null || newRefreshToken == null) {
        _logger.severe('_refreshViaDio: missing token fields in response');

        return null;
      }

      await TokenService.instance.saveTokens(
        accessToken: newAccessToken,
        refreshToken: newRefreshToken,
      );

      _logger.log('Silent token refresh succeeded');

      return newAccessToken;
    } on DioException catch (e) {
      _logger.severe(
        '_refreshViaDio failed: ${e.response?.statusCode} — ${e.response?.data}',
      );

      // If the back-end says the refresh token is invalid/expired (401),
      // we must trigger app-level logout. Otherwise PowerSync just stays
      // disconnected indefinitely.
      if (e.response?.statusCode == 401) {
        _authApiClient.onUnauthorized?.call();
      }

      return null;
    } catch (e) {
      _logger.severe('_refreshViaDio unexpected error: $e');

      return null;
    }
  }

  // ---------------------------------------------------------------------------
  // 2. Upload local mutations to Postgres via the Go connector
  // ---------------------------------------------------------------------------

  @override
  Future<void> uploadData(PowerSyncDatabase database) async {
    final transaction = await database.getNextCrudTransaction();
    if (transaction == null) return;

    final operations = <Map<String, dynamic>>[];
    for (final entry in transaction.crud) {
      operations.add({
        'op': _crudOpToString(entry.op),
        'table': entry.table,
        'id': entry.id,
        if (entry.opData != null) 'data': entry.opData,
      });
    }

    try {
      final token = await TokenService.instance.getValidAccessToken();
      await _refreshDio.post<void>(
        '${AppConfig.connectorUrl}/api/v1/sync/upload',
        data: {'operations': operations},
        options: Options(
          headers: {if (token != null) 'Authorization': 'Bearer $token'},
          validateStatus: (status) => status == 204,
        ),
      );
      await transaction.complete();
    } on DioException catch (e) {
      _logger.severe(
        'uploadData failed: ${e.response?.statusCode} — ${e.response?.data}',
      );
      rethrow;
    } catch (e) {
      _logger.severe('uploadData unexpected error: $e');
      rethrow;
    }
  }

  String _crudOpToString(UpdateType op) => switch (op) {
    UpdateType.put => 'PUT',
    UpdateType.delete => 'DELETE',
    UpdateType.patch => 'PATCH',
  };
}
