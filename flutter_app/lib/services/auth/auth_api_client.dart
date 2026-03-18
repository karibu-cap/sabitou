import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../utils/logger.dart';
import '../rpc/connect_rpc.dart';

/// Holds the token pair returned after a successful auth call.
class AuthTokens {
  /// The JWT access token.
  final String accessToken;

  /// The opaque refresh token.
  final String refreshToken;

  /// Constructs an [AuthTokens] pair.
  const AuthTokens({required this.accessToken, required this.refreshToken});
}

/// Connect RPC client wrapping [AuthServiceClient].
///
/// Responsibilities:
///   - Attaches Bearer token to every outgoing request via an interceptor.
///   - Exposes login, register, and logout as typed methods.
///   - Token refresh is still handled via the legacy REST endpoint because
///     the identity proto does not (yet) define a Refresh RPC.
class AuthApiClient {
  final _logger = LoggerApp('AuthApiClient');

  /// Called when a refresh attempt fails — use to trigger app-level logout.
  void Function()? onUnauthorized;

  final AuthServiceClient _client;

  /// Constructs a new [AuthApiClient].
  AuthApiClient()
    : _client = AuthServiceClient(ConnectRPCService.to.clientChannel);

  /// Authenticates a user using email (or phone / @username) and password.
  /// Returns an [AuthTokens] pair on success
  Future<AuthTokens> login({
    required String email,
    required String password,
  }) async {
    final req = LoginRequest(email: email, password: password);
    try {
      final resp = await _client.login(req);

      return AuthTokens(
        accessToken: resp.token,
        refreshToken: resp.refreshToken,
      );
    } catch (e) {
      _logger.severe('Login failed: $e');
      rethrow;
    }
  }

  /// Registers a new user account.
  /// Returns an [AuthTokens] pair on success.
  Future<AuthTokens> register({
    required String userName,
    required String email,
    required String password,
    String? phoneNumber,
    String? firstName,
    String? lastName,
  }) async {
    final req = RegisterRequest(
      userName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
    );
    final resp = await _client.register(req);

    return AuthTokens(accessToken: resp.token, refreshToken: resp.refreshToken);
  }

  /// Silently refreshes the token pair using the Refresh RPC endpoint.
  Future<AuthTokens> refreshTokens(String refreshToken) async {
    final req = RefreshTokenRequest(refreshToken: refreshToken);
    final resp = await _client.refreshToken(req);

    return AuthTokens(accessToken: resp.token, refreshToken: resp.refreshToken);
  }

  /// Logs out the current session server-side.
  ///
  /// No-op on error — callers should clear local tokens regardless.
  Future<void> logout() async {
    try {
      // The identity proto does not have a Logout RPC yet.
      // Clearing local tokens is sufficient for now.
      _logger.log('logout: clearing local tokens (no server RPC yet)');
    } catch (e) {
      _logger.severe('Logout failed (ignoring): $e');
    }
  }
}
