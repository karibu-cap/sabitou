//
//  Generated code. Do not modify.
//  source: identity/v1/authentication.proto
//

import "package:connectrpc/connect.dart" as connect;
import "authentication.pb.dart" as identityv1authentication;
import "authentication.connect.spec.dart" as specs;

extension type AuthServiceClient (connect.Transport _transport) {
  /// Authenticate the user with the given credentials.
  Future<identityv1authentication.LoginResponse> login(
    identityv1authentication.LoginRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuthService.login,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Request the password reset of the user.
  Future<identityv1authentication.RequestPasswordResetResponse> requestPasswordReset(
    identityv1authentication.RequestPasswordResetRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuthService.requestPasswordReset,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Process the password reset request.
  Future<identityv1authentication.ResetPasswordResponse> resetPassword(
    identityv1authentication.ResetPasswordRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.AuthService.resetPassword,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
