//
//  Generated code. Do not modify.
//  source: identity/v1/authentication.proto
//

import "package:connectrpc/connect.dart" as connect;
import "authentication.pb.dart" as identityv1authentication;

abstract final class AuthService {
  /// Fully-qualified name of the AuthService service.
  static const name = 'identity.v1.AuthService';

  /// Authenticate the user with the given credentials.
  static const login = connect.Spec(
    '/$name/Login',
    connect.StreamType.unary,
    identityv1authentication.LoginRequest.new,
    identityv1authentication.LoginResponse.new,
  );

  /// Request the password reset of the user.
  static const requestPasswordReset = connect.Spec(
    '/$name/RequestPasswordReset',
    connect.StreamType.unary,
    identityv1authentication.RequestPasswordResetRequest.new,
    identityv1authentication.RequestPasswordResetResponse.new,
  );

  /// Process the password reset request.
  static const resetPassword = connect.Spec(
    '/$name/ResetPassword',
    connect.StreamType.unary,
    identityv1authentication.ResetPasswordRequest.new,
    identityv1authentication.ResetPasswordResponse.new,
  );
}
