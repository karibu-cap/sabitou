// flutter_app/lib/providers/auth/auth_provider.dart

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart' show User;

import '../../repositories/auth_repository.dart';
import '../../services/auth/auth_api_client.dart';
import '../../services/auth/token_service.dart';
import '../../services/powersync/powersync_service.dart';
import '../../utils/logger.dart';

// ---------------------------------------------------------------------------
// Auth state
// ---------------------------------------------------------------------------

/// The possible authentication states of the application.
enum AuthStatus {
  /// Initial state — not yet determined (checking stored session).
  initializing,

  /// No authenticated session.
  unauthenticated,

  /// A login (or restore) is in progress.
  authenticating,

  /// The user is authenticated.
  authenticated,

  /// The last authentication attempt failed.
  authenticationFailed,
}

// ---------------------------------------------------------------------------
// Provider
// ---------------------------------------------------------------------------

/// Central authentication state manager.
///
/// Lifecycle:
///   1. On construction, [_restoreSession] checks for a stored user ID in
///      flutter_secure_storage and, if found, opens the PowerSync database
///      and sets status to [AuthStatus.authenticated] — skipping the login
///      screen on warm restarts.
///   2. [login] delegates to [AuthRepository], then opens the PowerSync DB.
///   3. [logout] closes the PowerSync DB, clears tokens, resets state.
///
/// The [currentUser] is a proto [User] message populated from:
///   - The local PowerSync `users` table (session restore and offline login)
///   - [AuthRepository._buildUserFromLocalCache] (online login, after sync)
class AuthProvider extends ChangeNotifier {
  final _logger = LoggerApp('AuthProvider');

  // Dependencies.
  final AuthRepository _authRepository;
  final TokenService _tokenService;
  final PowerSyncService _powerSync;
  final AuthApiClient _authApiClient;

  // State.
  User? _currentUser;
  AuthStatus _status = AuthStatus.initializing;
  String? _errorMessage;

  /// Completes when session-restore finishes. Await in the router to avoid
  /// flashing the login screen before we know if the user is already logged in.
  final Completer<void> _initCompleter = Completer<void>();

  // ---------------------------------------------------------------------------
  // Construction
  // ---------------------------------------------------------------------------

  AuthProvider({
    AuthRepository? authRepository,
    TokenService? tokenService,
    PowerSyncService? powerSync,
    AuthApiClient? authApiClient,
  }) : _authRepository = authRepository ?? AuthRepository.instance,
       _tokenService = tokenService ?? TokenService.instance,
       _powerSync = powerSync ?? PowerSyncService.instance,
       _authApiClient = authApiClient ?? GetIt.I.get<AuthApiClient>() {
    // When the Connect RPC interceptor cannot refresh a token, it calls this
    // to force the user back to the login screen.
    _authApiClient.onUnauthorized = () {
      _logger.log('Token refresh failed — forcing logout');
      logout();
    };
    _restoreSession();
  }

  /// Singleton accessor.
  static AuthProvider get instance => GetIt.I.get<AuthProvider>();

  // ---------------------------------------------------------------------------
  // Getters
  // ---------------------------------------------------------------------------

  /// The currently authenticated user (proto User), or null when not logged in.
  User? get currentUser => _currentUser;
  AuthStatus get status => _status;
  String? get errorMessage => _errorMessage;
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  Future<void> get initializationComplete => _initCompleter.future;

  // ---------------------------------------------------------------------------
  // Session restore (called once on construction)
  // ---------------------------------------------------------------------------

  Future<void> _restoreSession() async {
    try {
      final userId = await _tokenService.getUserId();
      if (userId == null || userId.isEmpty) {
        _setStatus(AuthStatus.unauthenticated);

        return;
      }

      // Open the per-user PowerSync database.
      // connectSync = true: PowerSyncConnector handles token refresh internally.
      await _powerSync.open(userId: userId, authApiClient: _authApiClient);

      // Read the user profile from the local SQLite `users` table.
      final rows = await _powerSync.db.getAll(
        '''
        SELECT ref_id, user_name, email, first_name, last_name,
               phone_number, account_status
        FROM users WHERE ref_id = ? LIMIT 1
        ''',
        [userId],
      );

      if (rows.isNotEmpty) {
        _currentUser = _userFromRow(rows.first);
        _setStatus(AuthStatus.authenticated);
        _logger.log('Session restored for user $userId');
      } else {
        // User ID in storage but no local record yet (first boot / fresh DB).
        // If a token exists, stay authenticated and wait for the sync to
        // deliver the user record.
        final hasToken = await _tokenService.hasStoredSession;
        _setStatus(
          hasToken ? AuthStatus.authenticated : AuthStatus.unauthenticated,
        );
        if (hasToken) {
          _logger.log('Token present but user not yet synced for $userId');
        }
      }
    } catch (e) {
      _logger.severe('Session restore error: $e');
      _setStatus(AuthStatus.unauthenticated);
    } finally {
      if (!_initCompleter.isCompleted) _initCompleter.complete();
    }
  }

  // ---------------------------------------------------------------------------
  // Login
  // ---------------------------------------------------------------------------

  Future<bool> login(String email, String password) async {
    _errorMessage = null;
    _setStatus(AuthStatus.authenticating);

    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    return switch (result) {
      AuthSuccess(:final user) => await _onAuthSuccess(user),
      AuthFailure(:final reason, :final message) => _onAuthFailure(
        reason,
        message,
      ),
    };
  }

  // ---------------------------------------------------------------------------
  // Register
  // ---------------------------------------------------------------------------

  Future<bool> register({
    required String userName,
    required String email,
    required String password,
  }) async {
    _errorMessage = null;
    _setStatus(AuthStatus.authenticating);

    final result = await _authRepository.register(
      userName: userName,
      email: email,
      password: password,
    );

    return switch (result) {
      AuthSuccess(:final user) => await _onAuthSuccess(user),
      AuthFailure(:final reason, :final message) => _onAuthFailure(
        reason,
        message,
      ),
    };
  }

  // ---------------------------------------------------------------------------
  // Logout
  // ---------------------------------------------------------------------------

  Future<void> logout() async {
    await _authRepository.logout();
    await _powerSync.close();

    _currentUser = null;
    _errorMessage = null;
    _setStatus(AuthStatus.unauthenticated);
  }

  // ---------------------------------------------------------------------------
  // Internal helpers
  // ---------------------------------------------------------------------------

  Future<bool> _onAuthSuccess(User user) async {
    try {
      // Open (or reuse) the per-user PowerSync database and connect sync.
      // AuthRepository._loginOnline already calls open() before returning,
      // so this is a no-op for online login — it only acts when called from
      // session restore (where the repository was not involved).
      if (!_powerSync.isOpenFor(user.refId)) {
        await _powerSync.open(
          userId: user.refId,
          authApiClient: _authApiClient,
        );
      }

      _currentUser = user;
      _setStatus(AuthStatus.authenticated);

      return true;
    } catch (e) {
      _logger.severe('Post-auth PowerSync setup error: $e');
      _setError('Failed to initialise local database.');

      return false;
    }
  }

  bool _onAuthFailure(AuthFailureReason reason, String? message) {
    _setError(message ?? _defaultMessage(reason));

    return false;
  }

  /// Builds a proto [User] from a PowerSync SQLite row.
  User _userFromRow(Map<String, dynamic> row) {
    return User(
      refId: row['ref_id'] as String?,
      userName: row['user_name'] as String? ?? '',
      email: row['email'] as String?,
      firstName: row['first_name'] as String?,
      lastName: row['last_name'] as String?,
      phoneNumber: row['phone_number'] as String?,
    );
  }

  void _setStatus(AuthStatus status) {
    _status = status;
    notifyListeners();
  }

  void _setError(String message) {
    _errorMessage = message;
    _status = AuthStatus.authenticationFailed;
    notifyListeners();
  }

  String _defaultMessage(AuthFailureReason reason) => switch (reason) {
    AuthFailureReason.invalidCredentials => 'Invalid email or password.',
    AuthFailureReason.networkUnavailable =>
      'No connection. Please connect to the network.',
    AuthFailureReason.accountDisabled => 'This account has been disabled.',
    AuthFailureReason.serverError =>
      'A server error occurred. Please try again.',
    AuthFailureReason.offlineUserNotFound =>
      'Offline login unavailable. Please connect to the network for your first login on this device.',
  };
}
