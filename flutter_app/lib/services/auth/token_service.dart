import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

// ---------------------------------------------------------------------------
// Single storage key — all session data is stored as ONE JSON blob.
// ---------------------------------------------------------------------------
// flutter_secure_storage on web has a known bug (issue #381) where it
// regenerates the shared AES-GCM encryption key on EVERY write. When you
// write multiple keys in parallel (or even in sequence), each write
// invalidates the previous key. The result: reading any key other than the
// most-recently-written one throws `OperationError`.
//
// Workaround (from issue #381 — comment-2413494979):
//   Map ALL values into a single JSON-encoded string stored under ONE key.
//   Only one write ever happens, so the encryption key is never regenerated.
// ---------------------------------------------------------------------------
const _kSessionKey = 'sabitou.session';

// JSON field names inside the blob (not exposed externally).
abstract final class _Field {
  static const String accessToken = 'access_token';
  static const String refreshToken = 'refresh_token';
  static const String userId = 'user_id';
}

/// Persists and manages JWT tokens using the platform's secure keystore.
///
/// **Web — single-blob workaround:**
/// All token fields are stored as one JSON-encoded string under the single
/// key `sabitou.session`. This avoids the `flutter_secure_storage` web bug
/// where writing multiple keys regenerates the shared AES-GCM encryption key,
/// making all previously-written values unreadable (`OperationError`).
///
/// **In-memory cache:**
/// After [saveTokens] the decoded map is also kept in [_cache]. All getters
/// consult the cache before touching storage, so PowerSync's frequent
/// `credentialsCallback` never waits on an IndexedDB read.
class TokenService {
  TokenService._();

  /// The singleton instance.
  static final TokenService instance = TokenService._();

  static const FlutterSecureStorage _storage = FlutterSecureStorage(
    iOptions: IOSOptions(accessibility: KeychainAccessibility.first_unlock),
  );

  // In-memory session cache. Populated by saveTokens() / _loadCache().
  // Cleared by clearAll().
  Map<String, String> _cache = {};

  /// True if a non-expired access token is stored.
  Future<bool> get isAccessTokenValid async {
    final token = await getAccessToken();

    return token != null && !_isExpired(token);
  }

  /// True if any access token is stored, even an expired one.
  /// Used to decide whether offline auth can be offered.
  Future<bool> get hasStoredSession async {
    final token = await getAccessToken();

    return token != null;
  }

  /// Persists a new token pair and the JWT claims under a single storage key.
  ///
  /// The in-memory [_cache] is updated synchronously so subsequent reads
  /// (including the PowerSync credentials callback that fires milliseconds
  /// after login) are served from memory without an IndexedDB round-trip.
  Future<void> saveTokens({
    required String accessToken,
    required String refreshToken,
  }) async {
    final claims = _decodePayload(accessToken);

    final session = <String, String>{
      _Field.accessToken: accessToken,
      _Field.refreshToken: refreshToken,
      _Field.userId: claims?['sub'] as String? ?? '',
    };

    // Update in-memory cache immediately.
    _cache = Map.of(session);

    // Persist as a single JSON blob — ONE write, ONE encryption key.
    try {
      await _storage.write(key: _kSessionKey, value: jsonEncode(session));
    } catch (e) {
      // Write failure is non-fatal for the current session (_cache is set).
      // The user will need to re-login after a cold start if storage is broken.
      debugPrint('[TokenService] saveTokens storage write error (ignored): $e');
    }
  }

  /// Gets the access token from the cache.
  Future<String?> getAccessToken() => _cachedField(_Field.accessToken);

  /// Gets the refresh token from the cache.
  Future<String?> getRefreshToken() => _cachedField(_Field.refreshToken);

  /// Gets the user id from the cache.
  Future<String?> getUserId() => _cachedField(_Field.userId);

  /// Whether the token is expired.
  bool isExpired(String token) => _isExpired(token);

  /// Returns the stored access token only if it exists AND has not expired.
  Future<String?> getValidAccessToken() async {
    final token = await getAccessToken();
    if (token == null) return null;

    return _isExpired(token) ? null : token;
  }

  /// Clears the cache.
  Future<void> clearAll() async {
    _cache = {};
    try {
      await _storage.deleteAll();
    } catch (e) {
      debugPrint('[TokenService] clearAll error (ignored): $e');
    }
  }

  /// Returns the cached value for [field], loading from storage on first miss.
  Future<String?> _cachedField(String field) async {
    // Hot path: cache already populated this session.
    final cached = _cache[field];
    if (cached != null && cached.isNotEmpty) return cached;

    // Cache miss — read the single blob and populate the full cache.
    await _loadCache();
    final loaded = _cache[field];

    return (loaded != null && loaded.isNotEmpty) ? loaded : null;
  }

  /// Reads the session JSON blob and populates [_cache].
  /// Silently returns on any error — callers treat null as "not logged in".
  Future<void> _loadCache() async {
    try {
      final raw = await _storage.read(key: _kSessionKey);
      if (raw == null || raw.isEmpty) return;

      final decoded = jsonDecode(raw) as Map<String, dynamic>;
      _cache = decoded.map((k, v) => MapEntry(k, v?.toString() ?? ''));
    } catch (e) {
      final msg = e.toString();
      if (msg.contains('OperationError') || msg.contains('operation error')) {
        debugPrint(
          '[TokenService] Web Crypto OperationError loading session blob — '
          'storage is corrupted or key is missing. Wiping tokens.',
        );
        try {
          await _storage.deleteAll();
        } catch (_) {}
      } else {
        debugPrint('[TokenService] _loadCache error: $e');
      }
      _cache = {};
    }
  }

  /// Decodes a JWT payload without signature verification.
  static Map<String, dynamic>? _decodePayload(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return null;
      final normalized = base64.normalize(
        parts[1].replaceAll('-', '+').replaceAll('_', '/'),
      );

      return jsonDecode(utf8.decode(base64.decode(normalized)))
          as Map<String, dynamic>;
    } catch (e) {
      debugPrint('[TokenService] JWT decode error: $e');

      return null;
    }
  }

  /// Returns true if the token's `exp` claim is in the past.
  static bool _isExpired(String token) {
    try {
      final claims = _decodePayload(token);
      if (claims == null) return true;
      final exp = claims['exp'];
      if (exp == null) return false;
      final expiry = DateTime.fromMillisecondsSinceEpoch((exp as int) * 1000);

      return DateTime.now().isAfter(
        expiry.subtract(const Duration(seconds: 30)),
      );
    } catch (_) {
      return true;
    }
  }
}
