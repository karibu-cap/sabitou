import 'dart:async';
import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:connectrpc/connect.dart' as connect;
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/auth/auth_api_client.dart';
import '../services/auth/token_service.dart';
import '../services/powersync/powersync_service.dart';
import '../utils/logger.dart';
import '../utils/network_utils.dart';

// ---------------------------------------------------------------------------
// Result types
// ---------------------------------------------------------------------------

/// The outcome of an authentication attempt.
sealed class AuthResult {
  const AuthResult();
}

/// Authentication succeeded — carries the proto [User] from the identity service.
final class AuthSuccess extends AuthResult {
  /// The authenticated user.
  ///
  /// Online login: populated from the JWT claims stored in [TokenService].
  /// Offline login: reconstructed from the local PowerSync `users` table.
  final User user;

  const AuthSuccess(this.user);
}

/// Authentication failed with a user-visible reason.
final class AuthFailure extends AuthResult {
  final AuthFailureReason reason;
  final String? message;

  const AuthFailure(this.reason, {this.message});
}

enum AuthFailureReason {
  invalidCredentials,
  networkUnavailable,
  accountDisabled,
  serverError,
  offlineUserNotFound,
}

// ---------------------------------------------------------------------------
// Repository
// ---------------------------------------------------------------------------

/// Handles all authentication operations: online login, offline login,
/// registration, token refresh, and logout.
///
/// **Online login** (server reachable):
///   1. Call `AuthService.Login` via Connect RPC.
///   2. Persist tokens to [TokenService] (flutter_secure_storage).
///   3. Cache the bcrypt password hash in `local_auth` for offline use.
///
/// **Offline login** (no server reachable):
///   1. Look up the user's `local_auth` row by email.
///   2. Verify password against the stored bcrypt hash.
///   3. Reconstruct a [User] from the synced `users` PowerSync table.
class AuthRepository {
  final _logger = LoggerApp('AuthRepository');

  /// Singleton accessor.
  static AuthRepository get instance => GetIt.I.get<AuthRepository>();

  final AuthApiClient _apiClient;
  final TokenService _tokenService;

  AuthRepository({AuthApiClient? apiClient, TokenService? tokenService})
    : _apiClient = apiClient ?? GetIt.I.get<AuthApiClient>(),
      _tokenService = tokenService ?? TokenService.instance;

  // ---------------------------------------------------------------------------
  // Login
  // ---------------------------------------------------------------------------

  /// Attempts login. Automatically selects online or offline strategy based on
  /// network reachability.
  Future<AuthResult> login({
    required String email,
    required String password,
  }) async {
    final isOnline = await NetworkUtils.isServerReachable();

    if (isOnline) {
      return _loginOnline(email: email, password: password);
    } else {
      _logger.log('No server reachable — attempting offline login');

      return _loginOffline(email: email, password: password);
    }
  }

  Future<AuthResult> _loginOnline({
    required String email,
    required String password,
  }) async {
    try {
      // 1. Authenticate — returns tokens only (Connect RPC).
      final tokens = await _apiClient.login(email: email, password: password);

      // 2. Persist tokens so the interceptor can inject them on subsequent calls.
      await _tokenService.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );

      // 3. Extract userId directly from the JWT payload we already have in
      //    memory. Calling _tokenService.getUserId() would do a storage
      //    round-trip which can race with the write on Flutter Web (IndexedDB +
      //    Web Crypto AES-GCM is async and may not be committed yet).
      final userId = _extractUserIdFromToken(tokens.accessToken);

      // 4. Open PowerSync DB NOW — _cacheLocalAuth and _buildUserFromLocalCache
      //    both require the database to be open. We open it here rather than
      //    leaving it to AuthProvider._onAuthSuccess so the DB is ready before
      //    we try to write to it.
      await PowerSyncService.instance.open(
        userId: userId,
        authApiClient: _apiClient,
      );

      // 5. Cache credentials for offline use (non-blocking, best-effort).
      unawaited(
        _cacheLocalAuth(userId: userId, email: email, password: password),
      );

      // 6. Build a User object — from local cache if already synced,
      //    or a minimal stub (just refId) that gets filled in after sync.
      final user = await _buildUserFromLocalCache(userId);

      return AuthSuccess(user);
    } on connect.ConnectException catch (e) {
      _logger.severe('Online login Connect error: ${e.code} — ${e.message}');

      return switch (e.code) {
        connect.Code.unauthenticated => const AuthFailure(
          AuthFailureReason.invalidCredentials,
        ),
        connect.Code.permissionDenied => const AuthFailure(
          AuthFailureReason.accountDisabled,
        ),
        _ => AuthFailure(AuthFailureReason.serverError, message: e.message),
      };
    } catch (e) {
      _logger.severe('Online login unexpected error: $e');

      return AuthFailure(AuthFailureReason.serverError, message: e.toString());
    }
  }

  /// Decodes the `sub` (subject / user_id) claim from a JWT without verifying
  /// the signature. Safe to use for non-security-critical identity extraction
  /// (the token came directly from our own auth server over TLS).
  String _extractUserIdFromToken(String token) {
    try {
      final parts = token.split('.');
      if (parts.length != 3) return '';
      final padded = base64.normalize(
        parts[1].replaceAll('-', '+').replaceAll('_', '/'),
      );
      final payload =
          jsonDecode(utf8.decode(base64.decode(padded)))
              as Map<String, dynamic>;

      return payload['sub'] as String? ?? payload['user_id'] as String? ?? '';
    } catch (e) {
      _logger.severe('Failed to decode userId from token: $e');

      return '';
    }
  }

  Future<AuthResult> _loginOffline({
    required String email,
    required String password,
  }) async {
    try {
      final storedUserId = await _tokenService.getUserId();
      if (storedUserId == null ||
          !PowerSyncService.instance.isOpenFor(storedUserId)) {
        return const AuthFailure(
          AuthFailureReason.offlineUserNotFound,
          message:
              'No cached session found. Please connect to the server for first login.',
        );
      }

      final db = PowerSyncService.instance.db;

      final rows = await db.getAll(
        'SELECT user_id, password_hash FROM local_auth WHERE email = ? LIMIT 1',
        [email.toLowerCase().trim()],
      );

      if (rows.isEmpty) {
        return const AuthFailure(
          AuthFailureReason.offlineUserNotFound,
          message:
              'This account has not been used on this device. Connect to the network for first login.',
        );
      }

      final storedHash = rows.first['password_hash'] as String;
      final userId = rows.first['user_id'] as String;

      final matches = await compute(
        (args) => BCrypt.checkpw(args.$1, args.$2),
        (password, storedHash),
      );

      if (!matches) {
        return const AuthFailure(AuthFailureReason.invalidCredentials);
      }

      final user = await _buildUserFromLocalCache(userId);
      _logger.log('Offline login successful for user $userId');

      return AuthSuccess(user);
    } catch (e) {
      _logger.severe('Offline login error: $e');

      return AuthFailure(AuthFailureReason.serverError, message: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Register
  // ---------------------------------------------------------------------------

  /// Registers a new user account. Requires a server connection.
  Future<AuthResult> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    final isOnline = await NetworkUtils.isServerReachable();
    if (!isOnline) {
      return const AuthFailure(
        AuthFailureReason.networkUnavailable,
        message: 'Registration requires a server connection.',
      );
    }

    try {
      final tokens = await _apiClient.register(
        userName: userName,
        email: email,
        password: password,
      );

      await _tokenService.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );

      final userId = await _tokenService.getUserId() ?? '';
      await _cacheLocalAuth(userId: userId, email: email, password: password);

      final user = await _buildUserFromLocalCache(userId);

      return AuthSuccess(user);
    } on connect.ConnectException catch (e) {
      _logger.severe('Register Connect error: $e');
      if (e.code == connect.Code.alreadyExists) {
        return const AuthFailure(
          AuthFailureReason.invalidCredentials,
          message: 'Email already registered.',
        );
      }

      return AuthFailure(AuthFailureReason.serverError, message: e.message);
    } catch (e) {
      _logger.severe('Register error: $e');

      return AuthFailure(AuthFailureReason.serverError, message: e.toString());
    }
  }

  // ---------------------------------------------------------------------------
  // Logout
  // ---------------------------------------------------------------------------

  Future<void> logout() async {
    try {
      await _apiClient.logout();
    } catch (e) {
      _logger.severe('Server logout failed (ignoring): $e');
    }
    await _tokenService.clearAll();
  }

  // ---------------------------------------------------------------------------
  // Session helpers
  // ---------------------------------------------------------------------------

  /// Returns true if a valid (non-expired) session token exists.
  Future<bool> hasValidSession() => _tokenService.isAccessTokenValid;

  /// Returns true if any session token exists (even expired).
  Future<bool> hasAnySession() => _tokenService.hasStoredSession;

  /// Returns the stored user ID from the last successful login.
  Future<String?> getStoredUserId() => _tokenService.getUserId();

  // ---------------------------------------------------------------------------
  // Internals
  // ---------------------------------------------------------------------------

  /// Builds a proto [User] from the local `users` PowerSync table.
  ///
  /// Falls back to a minimal [User] with only the ref_id when the DB row is
  /// not yet available (e.g. right after registration, before first sync).
  Future<User> _buildUserFromLocalCache(String userId) async {
    try {
      final db = PowerSyncService.instance.db;
      final rows = await db.getAll(
        '''
        SELECT ref_id, user_name, email, first_name, last_name,
               phone_number, account_status
        FROM users WHERE ref_id = ? LIMIT 1
        ''',
        [userId],
      );

      if (rows.isEmpty) {
        return User(refId: userId);
      }

      final row = rows.first;

      return User(
        refId: row['ref_id'] as String?,
        userName: row['user_name'] as String? ?? '',
        email: row['email'] as String?,
        firstName: row['first_name'] as String?,
        lastName: row['last_name'] as String?,
        phoneNumber: row['phone_number'] as String?,
      );
    } catch (e) {
      _logger.severe('_buildUserFromLocalCache error: $e');

      return User(refId: userId);
    }
  }

  /// Stores a bcrypt hash of [password] in the local `local_auth` table.
  /// Device-local only — never synced to the server.
  ///
  /// PowerSync `Table.localOnly(...)` creates a view with `INSTEAD OF INSERT`
  /// and `INSTEAD OF UPDATE` triggers over `ps_data_local__local_auth`.
  /// The view supports simple `INSERT OR REPLACE` (routed through the trigger)
  /// but NOT `ON CONFLICT(column) DO UPDATE` (which requires a real table).
  /// We use `INSERT OR REPLACE` with `id = 'local_' + userId` so repeated
  /// logins overwrite the previous cached hash.
  Future<void> _cacheLocalAuth({
    required String userId,
    required String email,
    required String password,
  }) async {
    try {
      final hash = await compute(
        (p) => BCrypt.hashpw(p, BCrypt.gensalt()),
        password,
      );

      final id = 'local_$userId';
      final db = PowerSyncService.instance.db;

      await db.execute(
        '''
        INSERT OR REPLACE INTO local_auth
              (id, user_id, email, password_hash, stored_at)
        VALUES (?, ?, ?, ?, ?)
        ''',
        [
          id,
          userId,
          email.toLowerCase().trim(),
          hash,
          DateTime.now().millisecondsSinceEpoch ~/ 1000,
        ],
      );
      _logger.log('local_auth cached for user $userId');
    } catch (e) {
      _logger.severe('Failed to cache local_auth: $e');
    }
  }
}
