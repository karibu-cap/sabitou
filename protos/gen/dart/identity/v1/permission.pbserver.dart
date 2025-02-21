//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
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

import 'permission.pb.dart' as $3;
import 'permission.pbjson.dart';

export 'permission.pb.dart';

abstract class PermissionServiceBase extends $pb.GeneratedService {
  $async.Future<$3.CreatePermissionGroupResponse> createPermissionGroup($pb.ServerContext ctx, $3.CreatePermissionGroupRequest request);
  $async.Future<$3.GetPermissionGroupResponse> getPermissionGroup($pb.ServerContext ctx, $3.GetPermissionGroupRequest request);
  $async.Future<$3.UpdatePermissionGroupResponse> updatePermissionGroup($pb.ServerContext ctx, $3.UpdatePermissionGroupRequest request);
  $async.Future<$3.DeletePermissionGroupResponse> deletePermissionGroup($pb.ServerContext ctx, $3.DeletePermissionGroupRequest request);
  $async.Future<$3.GetUserPermissionsResponse> getUserPermissions($pb.ServerContext ctx, $3.GetUserPermissionsRequest request);
  $async.Future<$3.RemoveUserPermissionResponse> removeUserPermission($pb.ServerContext ctx, $3.RemoveUserPermissionRequest request);
  $async.Future<$3.AddUserPermissionResponse> addUserPermission($pb.ServerContext ctx, $3.AddUserPermissionRequest request);
  $async.Future<$3.GetBusinessPermissionGroupsResponse> getBusinessPermissionGroups($pb.ServerContext ctx, $3.GetBusinessPermissionGroupsRequest request);
  $async.Future<$3.CheckPermissionResponse> checkPermission($pb.ServerContext ctx, $3.CheckPermissionRequest request);

  $pb.GeneratedMessage createRequest($core.String methodName) {
    switch (methodName) {
      case 'CreatePermissionGroup': return $3.CreatePermissionGroupRequest();
      case 'GetPermissionGroup': return $3.GetPermissionGroupRequest();
      case 'UpdatePermissionGroup': return $3.UpdatePermissionGroupRequest();
      case 'DeletePermissionGroup': return $3.DeletePermissionGroupRequest();
      case 'GetUserPermissions': return $3.GetUserPermissionsRequest();
      case 'RemoveUserPermission': return $3.RemoveUserPermissionRequest();
      case 'AddUserPermission': return $3.AddUserPermissionRequest();
      case 'GetBusinessPermissionGroups': return $3.GetBusinessPermissionGroupsRequest();
      case 'CheckPermission': return $3.CheckPermissionRequest();
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $async.Future<$pb.GeneratedMessage> handleCall($pb.ServerContext ctx, $core.String methodName, $pb.GeneratedMessage request) {
    switch (methodName) {
      case 'CreatePermissionGroup': return this.createPermissionGroup(ctx, request as $3.CreatePermissionGroupRequest);
      case 'GetPermissionGroup': return this.getPermissionGroup(ctx, request as $3.GetPermissionGroupRequest);
      case 'UpdatePermissionGroup': return this.updatePermissionGroup(ctx, request as $3.UpdatePermissionGroupRequest);
      case 'DeletePermissionGroup': return this.deletePermissionGroup(ctx, request as $3.DeletePermissionGroupRequest);
      case 'GetUserPermissions': return this.getUserPermissions(ctx, request as $3.GetUserPermissionsRequest);
      case 'RemoveUserPermission': return this.removeUserPermission(ctx, request as $3.RemoveUserPermissionRequest);
      case 'AddUserPermission': return this.addUserPermission(ctx, request as $3.AddUserPermissionRequest);
      case 'GetBusinessPermissionGroups': return this.getBusinessPermissionGroups(ctx, request as $3.GetBusinessPermissionGroupsRequest);
      case 'CheckPermission': return this.checkPermission(ctx, request as $3.CheckPermissionRequest);
      default: throw $core.ArgumentError('Unknown method: $methodName');
    }
  }

  $core.Map<$core.String, $core.dynamic> get $json => PermissionServiceBase$json;
  $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> get $messageJson => PermissionServiceBase$messageJson;
}

