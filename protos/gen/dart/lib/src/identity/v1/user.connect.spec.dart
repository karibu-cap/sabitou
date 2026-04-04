//
//  Generated code. Do not modify.
//  source: identity/v1/user.proto
//

import "package:connectrpc/connect.dart" as connect;
import "user.pb.dart" as identityv1user;

abstract final class UserService {
  /// Fully-qualified name of the UserService service.
  static const name = 'identity.v1.UserService';

  /// Update the user information for the user.
  static const update = connect.Spec(
    '/$name/Update',
    connect.StreamType.unary,
    identityv1user.UpdateRequest.new,
    identityv1user.UpdateResponse.new,
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

  /// [Admin] Create a user directly with a password (internal/cashier flow).
  static const createUserDirect = connect.Spec(
    '/$name/CreateUserDirect',
    connect.StreamType.unary,
    identityv1user.CreateUserDirectRequest.new,
    identityv1user.CreateUserDirectResponse.new,
  );

  /// [Admin] Invite an external user via email link (invite flow).
  static const inviteUser = connect.Spec(
    '/$name/InviteUser',
    connect.StreamType.unary,
    identityv1user.InviteUserRequest.new,
    identityv1user.InviteUserResponse.new,
  );

  /// [Admin] Cancel a pending invitation.
  static const cancelInvitation = connect.Spec(
    '/$name/CancelInvitation',
    connect.StreamType.unary,
    identityv1user.CancelInvitationRequest.new,
    identityv1user.CancelInvitationResponse.new,
  );

  /// [Admin] Resend an expired or pending invitation.
  static const resendInvitation = connect.Spec(
    '/$name/ResendInvitation',
    connect.StreamType.unary,
    identityv1user.ResendInvitationRequest.new,
    identityv1user.ResendInvitationResponse.new,
  );

  /// [Invited user] Accept invitation and set password.
  static const acceptInvitation = connect.Spec(
    '/$name/AcceptInvitation',
    connect.StreamType.unary,
    identityv1user.AcceptInvitationRequest.new,
    identityv1user.AcceptInvitationResponse.new,
  );
}
