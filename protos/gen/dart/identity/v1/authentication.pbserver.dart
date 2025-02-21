//
//  Generated code. Do not modify.
//  source: identity/v1/authentication.proto
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

import 'authentication.pb.dart' as $2;
import 'authentication.pbjson.dart';

export 'authentication.pb.dart';

abstract class AuthServiceBase extends $pb.GeneratedService {
  $async.Future<$2.LoginResponse> login($pb.ServerContext ctx, $2.LoginRequest request);
  $async.Future<$2.RegisterResponse> register($pb.ServerContext ctx, $2.RegisterRequest request);
  $async.Future<$2.RequestPasswordResetResponse> requestPasswordReset($pb.ServerContext ctx, $2.RequestPasswordResetRequest request);
  $async.Future<$2.ResetPasswordResponse> resetPassword($pb.ServerContext ctx, $2.ResetPasswordRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'Login': return $2.LoginRequest();
      case 'Register': return $2.RegisterRequest();
      case 'RequestPasswordReset': return $2.RequestPasswordResetRequest();
      case 'ResetPassword': return $2.ResetPasswordRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'Login': return this.login(ctx, request as $2.LoginRequest);
      case 'Register': return this.register(ctx, request as $2.RegisterRequest);
      case 'RequestPasswordReset': return this.requestPasswordReset(ctx, request as $2.RequestPasswordResetRequest);
      case 'ResetPassword': return this.resetPassword(ctx, request as $2.ResetPasswordRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => AuthServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => AuthServiceBase$messageJson;
}

