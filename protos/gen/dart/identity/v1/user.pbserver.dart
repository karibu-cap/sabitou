//
//  Generated code. Do not modify.
//  source: identity/v1/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'user.pb.dart' as $7;
import 'user.pbjson.dart';

export 'user.pb.dart';

abstract class UserServiceBase extends $pb.GeneratedService {
  $async.Future<$7.GetMeResponse> getMe($pb.ServerContext ctx, $7.GetMeRequest request);
  $async.Future<$7.GetUserResponse> getUser($pb.ServerContext ctx, $7.GetUserRequest request);
  $async.Future<$7.UpdateMeResponse> updateMe($pb.ServerContext ctx, $7.UpdateMeRequest request);
  $async.Future<$7.RequestDeleteUserResponse> requestDeleteUser($pb.ServerContext ctx, $7.RequestDeleteUserRequest request);
  $async.Future<$7.DeleteUserResponse> deleteUser($pb.ServerContext ctx, $7.DeleteUserRequest request);
  $async.Future<$7.ChangePasswordResponse> changePassword($pb.ServerContext ctx, $7.ChangePasswordRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'GetMe': return $7.GetMeRequest();
      case 'GetUser': return $7.GetUserRequest();
      case 'UpdateMe': return $7.UpdateMeRequest();
      case 'RequestDeleteUser': return $7.RequestDeleteUserRequest();
      case 'DeleteUser': return $7.DeleteUserRequest();
      case 'ChangePassword': return $7.ChangePasswordRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'GetMe': return this.getMe(ctx, request as $7.GetMeRequest);
      case 'GetUser': return this.getUser(ctx, request as $7.GetUserRequest);
      case 'UpdateMe': return this.updateMe(ctx, request as $7.UpdateMeRequest);
      case 'RequestDeleteUser': return this.requestDeleteUser(ctx, request as $7.RequestDeleteUserRequest);
      case 'DeleteUser': return this.deleteUser(ctx, request as $7.DeleteUserRequest);
      case 'ChangePassword': return this.changePassword(ctx, request as $7.ChangePasswordRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => UserServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => UserServiceBase$messageJson;
}

