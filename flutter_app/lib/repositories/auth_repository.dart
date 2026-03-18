import 'dart:async';
import 'dart:convert';

import 'package:bcrypt/bcrypt.dart';
import 'package:connectrpc/connect.dart' as connect;
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/auth/auth_api_client.dart';
import '../services/auth/token_service.dart';
import '../services/powersync/schema.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/network_utils.dart';

/// The outcome of an authentication attempt.
sealed class AuthResult {
  const AuthResult();
}

/// Authentication succeeded — carries the proto [User] from the identity service.
final class AuthSuccess extends AuthResult {
  /// The authenticated user.
  /// Online login: populated from the JWT claims stored in [TokenService].
  /// Offline login: reconstructed from the local PowerSync `users` table.
  final User user;

  /// Constructs an [AuthSuccess] result.
  const AuthSuccess(this.user);
}

/// Authentication failed with a user-visible reason.
final class AuthFailure extends AuthResult {
  /// The reason for the failure.
  final AuthFailureReason reason;

  /// An optional message.
  final String? message;

  /// Constructs an [AuthFailure] result.
  const AuthFailure(this.reason, {this.message});
}

/// The possible failure reasons.
enum AuthFailureReason {
  /// Invalid credentials.
  invalidCredentials,

  /// Network unavailable.
  networkUnavailable,

  /// Account disabled.
  accountDisabled,

  /// Server error.
  serverError,

  /// Offline user not found.
  offlineUserNotFound,
}

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
class AuthRepository extends BaseRepository<User> {
  final _logger = LoggerApp('AuthRepository');

  /// The [AuthApiClient] implementation.
  final AuthApiClient _apiClient;

  /// The [TokenService] implementation.
  final TokenService _tokenService;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.users;

  /// Singleton accessor.
  static AuthRepository get instance => GetIt.I.get<AuthRepository>();

  /// Constructs an [AuthRepository].
  AuthRepository({
    required this.dataSource,
    AuthApiClient? apiClient,
    TokenService? tokenService,
  }) : _apiClient = apiClient ?? GetIt.I.get<AuthApiClient>(),
       _tokenService = tokenService ?? TokenService.instance;

  @override
  User fromRow(RawRow row) => fromRowToUser(row);

  @override
  RawRow toRow(User entity) => fromUsertoRaw(entity);

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

  /// Restores the session from the local SQLite `users` table.
  Future<User?> restoreSession(String userId) async {
    try {
      // Read the user profile from the local SQLite `users` table.

      final rows = await findById(userId);

      return rows;
    } catch (e) {
      _logger.severe('Session restore error: $e');

      return null;
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

      // We don't write to the DB here because the PowerSync scoped file
      // might not be open yet for this specific user.
      // We return a User stub containing only the ID so the provider
      // can open the DB and then call cache/fetch methods.
      return AuthSuccess(User(refId: userId));
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
      final rows = await dataSource.getCollection(
        CollectionName.localAuth,
        filters: [
          SqlQuery.equals(LocalAuthFields.email, email.toLowerCase().trim()),
        ],
        limit: 1,
      );

      if (rows.isEmpty) {
        return const AuthFailure(
          AuthFailureReason.offlineUserNotFound,
          message:
              'This account has not been used on this device. Connect to the network for first login.',
        );
      }

      final storedHash = rows.first[LocalAuthFields.passwordHash] as String;
      final userId = rows.first[LocalAuthFields.userId] as String;

      final matches = await compute(
        (args) => BCrypt.checkpw(args.$1, args.$2),
        (password, storedHash),
      );

      if (!matches) {
        return const AuthFailure(AuthFailureReason.invalidCredentials);
      }

      // 4. Return identity only. The provider will handle DB re-init and profile fetch.
      return AuthSuccess(User(refId: userId));
    } catch (e) {
      _logger.severe('Offline login error: $e');

      return AuthFailure(AuthFailureReason.serverError, message: e.toString());
    }
  }

  /// Registers a new user account. Requires a server connection.
  Future<AuthResult> register({
    required String userName,
    required String email,
    required String password,
    String? phoneNumber,
    String? firstName,
    String? lastName,
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
        phoneNumber: phoneNumber,
        firstName: firstName,
        lastName: lastName,
      );

      await _tokenService.saveTokens(
        accessToken: tokens.accessToken,
        refreshToken: tokens.refreshToken,
      );

      final userId = await _tokenService.getUserId() ?? '';

      return AuthSuccess(User(refId: userId));
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

  /// Logs out the current user.
  Future<void> logout() async {
    try {
      await _apiClient.logout();
    } catch (e) {
      _logger.severe('Server logout failed (ignoring): $e');
    }
    await _tokenService.clearAll();
  }

  /// Returns true if a valid (non-expired) session token exists.
  Future<bool> hasValidSession() => _tokenService.isAccessTokenValid;

  /// Returns true if any session token exists (even expired).
  Future<bool> hasAnySession() => _tokenService.hasStoredSession;

  /// Returns the stored user ID from the last successful login.
  Future<String?> getStoredUserId() => _tokenService.getUserId();

  /// Builds a proto [User] from the local `users` PowerSync table.
  ///
  /// Falls back to a minimal [User] with only the ref_id when the DB row is
  /// not yet available (e.g. right after registration, before first sync).
  Future<User?> fetchProfile(String userId) async {
    try {
      // 1. Try immediate lookup from local SQLite.
      final immediate = await findById(userId);
      if (immediate != null && immediate.email.isNotEmpty) return immediate;

      // 2. If not found or incomplete, wait for PowerSync to deliver the record.
      _logger.log('User $userId not in local cache, waiting for sync...');

      return await watchOne(userId)
          .where((user) => user != null && user.email.isNotEmpty)
          .first
          .timeout(
            const Duration(seconds: 15),
            onTimeout: () {
              _logger.warning(
                'Timeout waiting for user $userId sync. Proceeding with stub.',
              );

              return User(refId: userId);
            },
          );
    } catch (e) {
      _logger.severe('fetchProfile error: $e');

      return User(refId: userId);
    }
  }

  /// Stores a bcrypt hash of [password] in the local `local_auth` table.
  Future<bool> cacheCredentials({
    required String userId,
    required String email,
    required String password,
  }) async {
    try {
      final hash = await compute(
        (p) => BCrypt.hashpw(p, BCrypt.gensalt()),
        password,
      );

      final emailNormalized = email.toLowerCase().trim();

      await dataSource.deleteWhere(
        table: CollectionName.localAuth,
        filters: [
          SqlQuery.equals(LocalAuthFields.userId, userId),
          SqlQuery.equals(LocalAuthFields.email, emailNormalized),
        ],
      );

      await dataSource.createRecord(
        table: CollectionName.localAuth,
        record: {
          LocalAuthFields.id: 'local_$userId',
          LocalAuthFields.userId: userId,
          LocalAuthFields.email: emailNormalized,
          LocalAuthFields.passwordHash: hash,
          LocalAuthFields.storedAt:
              DateTime.now().millisecondsSinceEpoch ~/ 1000,
        },
      );

      _logger.log('local_auth cached for user $userId');

      return true;
    } catch (e) {
      _logger.severe('Failed to cache local_auth: $e');

      return false;
    }
  }
}
