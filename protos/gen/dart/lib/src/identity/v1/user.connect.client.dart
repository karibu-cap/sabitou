//
//  Generated code. Do not modify.
//  source: identity/v1/user.proto
//

import "package:connectrpc/connect.dart" as connect;
import "user.pb.dart" as identityv1user;
import "user.connect.spec.dart" as specs;

extension type UserServiceClient (connect.Transport _transport) {
  /// Get the user information for the currently authenticated user.
  /// @deprecated use GetCurrentUser instead.
  Future<identityv1user.GetMeResponse> getMe(
    identityv1user.GetMeRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getMe,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get the user information for the currently authenticated user.
  Future<identityv1user.GetCurrentUserResponse> getCurrentUser(
    identityv1user.GetCurrentUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getCurrentUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get the public information for the given user id.
  Future<identityv1user.GetUserResponse> getUser(
    identityv1user.GetUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.getUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Update the user information for the currently authenticated user.
  Future<identityv1user.UpdateMeResponse> updateMe(
    identityv1user.UpdateMeRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.updateMe,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Request the deletion of the user account.
  /// This will send a verification code to the user's email address
  /// or phone number.
  Future<identityv1user.RequestDeleteUserResponse> requestDeleteUser(
    identityv1user.RequestDeleteUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.requestDeleteUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Processes the deletion of the user account requested by the user.
  Future<identityv1user.DeleteUserResponse> deleteUser(
    identityv1user.DeleteUserRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.deleteUser,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Change the password for the currently authenticated user.
  Future<identityv1user.ChangePasswordResponse> changePassword(
    identityv1user.ChangePasswordRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.UserService.changePassword,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
