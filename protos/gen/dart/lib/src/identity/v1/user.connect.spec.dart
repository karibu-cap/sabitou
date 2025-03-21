//
//  Generated code. Do not modify.
//  source: identity/v1/user.proto
//

import "package:connectrpc/connect.dart" as connect;
import "user.pb.dart" as identityv1user;

abstract final class UserService {
  /// Fully-qualified name of the UserService service.
  static const name = 'identity.v1.UserService';

  /// Get the user information for the currently authenticated user.
  static const getMe = connect.Spec(
    '/$name/GetMe',
    connect.StreamType.unary,
    identityv1user.GetMeRequest.new,
    identityv1user.GetMeResponse.new,
  );

  /// Get the public information for the given user id.
  static const getUser = connect.Spec(
    '/$name/GetUser',
    connect.StreamType.unary,
    identityv1user.GetUserRequest.new,
    identityv1user.GetUserResponse.new,
  );

  /// Update the user information for the currently authenticated user.
  static const updateMe = connect.Spec(
    '/$name/UpdateMe',
    connect.StreamType.unary,
    identityv1user.UpdateMeRequest.new,
    identityv1user.UpdateMeResponse.new,
  );

  /// Request the deletion of the user account.
  /// This will send a verification code to the user's email address
  /// or phone number.
  static const requestDeleteUser = connect.Spec(
    '/$name/RequestDeleteUser',
    connect.StreamType.unary,
    identityv1user.RequestDeleteUserRequest.new,
    identityv1user.RequestDeleteUserResponse.new,
  );

  /// Processes the deletion of the user account requested by the user.
  static const deleteUser = connect.Spec(
    '/$name/DeleteUser',
    connect.StreamType.unary,
    identityv1user.DeleteUserRequest.new,
    identityv1user.DeleteUserResponse.new,
  );

  /// Change the password for the currently authenticated user.
  static const changePassword = connect.Spec(
    '/$name/ChangePassword',
    connect.StreamType.unary,
    identityv1user.ChangePasswordRequest.new,
    identityv1user.ChangePasswordResponse.new,
  );
}
