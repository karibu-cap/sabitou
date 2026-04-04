import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart' show User;

import '../../repositories/auth_repository.dart';
import '../../services/auth/auth_api_client.dart';
import '../../services/auth/token_refresh_service.dart';
import '../../services/auth/token_service.dart';
import '../../services/internationalization/internationalization.dart';
import '../../services/powersync/powersync_service.dart';
import '../../utils/logger.dart';

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

  /// Constructs the new [AuthProvider].
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

    TokenRefreshService.instance.onUnauthorized = () {
      _logger.log('Refresh token révoqué — forcing logout');
      logout();
    };

    _restoreSession();
  }

  /// Singleton accessor.
  static AuthProvider get instance => GetIt.I.get<AuthProvider>();

  /// The currently authenticated user (proto User), or null when not logged in.
  User? get currentUser => _currentUser;

  /// The current authentication status.
  AuthStatus get status => _status;

  /// The current error message, if any.
  String? get errorMessage => _errorMessage;

  /// Whether the user is authenticated.
  bool get isAuthenticated => _status == AuthStatus.authenticated;

  /// A future that completes when the session restore is complete.
  Future<void> get initializationComplete => _initCompleter.future;

  Future<void> _restoreSession() async {
    try {
      final userId = await _tokenService.getUserId();
      if (userId == null || userId.isEmpty) {
        _setStatus(AuthStatus.unauthenticated);
        unawaited(TokenRefreshService.instance.scheduleNext());
        _logger.log('Session restored for user $userId');

        return;
      }

      // Initialize DB for this specific user session
      await _powerSync.initialize();

      final user = await _authRepository.restoreSession(userId);
      if (user != null) {
        _currentUser = user;
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

  /// Logs in the user with the given credentials.
  Future<bool> login(String email, String password) async {
    _errorMessage = null;
    _setStatus(AuthStatus.authenticating);

    final result = await _authRepository.login(
      email: email,
      password: password,
    );

    return switch (result) {
      AuthSuccess(:final user) => await _onAuthSuccess(
        user,
        email: email,
        password: password,
      ),
      AuthFailure(:final reason, :final message) => _onAuthFailure(
        reason,
        message,
      ),
    };
  }

  /// Registers a new user account.
  Future<bool> register({
    required String userName,
    required String email,
    required String password,
    String? phoneNumber,
    String? firstName,
    String? lastName,
  }) async {
    _errorMessage = null;
    _setStatus(AuthStatus.authenticating);

    final result = await _authRepository.register(
      userName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
    );

    return switch (result) {
      AuthSuccess(:final user) => await _onAuthSuccess(
        user,
        email: email,
        password: password,
      ),
      AuthFailure(:final reason, :final message) => _onAuthFailure(
        reason,
        message,
      ),
    };
  }

  /// Logs out the current user.
  Future<void> logout() async {
    TokenRefreshService.instance.cancel();
    await _authRepository.logout();
    await _powerSync.close();

    _currentUser = null;
    _errorMessage = null;
    _setStatus(AuthStatus.unauthenticated);
  }

  Future<bool> _onAuthSuccess(
    User user, {
    String? email,
    String? password,
  }) async {
    try {
      await _powerSync.initialize();

      if (email != null && password != null) {
        final cacheResult = await _authRepository.cacheCredentials(
          userId: user.refId,
          email: email,
          password: password,
        );

        if (!cacheResult) {
          _setStatus(AuthStatus.authenticationFailed);

          return false;
        }
      }

      _currentUser = await _authRepository.fetchProfile(user.refId);

      _setStatus(AuthStatus.authenticated);
      unawaited(TokenRefreshService.instance.scheduleNext());

      return true;
    } catch (e) {
      _logger.severe('Post-auth setup error: $e');
      _setError('Failed to initialise local database.');

      return false;
    }
  }

  bool _onAuthFailure(AuthFailureReason reason, String? message) {
    _setError(message ?? _defaultMessage(reason));

    return false;
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
    AuthFailureReason.invalidCredentials => Intls.to.invalidEmailOrPassword,
    AuthFailureReason.networkUnavailable => Intls.to.noConnection,
    AuthFailureReason.accountDisabled => Intls.to.accountDisabled,
    AuthFailureReason.serverError => Intls.to.serverError,
    AuthFailureReason.offlineUserNotFound => Intls.to.offlineUserNotFound,
  };
}
