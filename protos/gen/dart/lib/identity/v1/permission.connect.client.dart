//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//

import "package:connectrpc/connect.dart" as connect;
import "permission.pb.dart" as identityv1permission;
import "permission.connect.spec.dart" as specs;

extension type PermissionServiceClient (connect.Transport _transport) {
  /// Creates a new permission group.
  Future<identityv1permission.CreatePermissionGroupResponse> createPermissionGroup(
    identityv1permission.CreatePermissionGroupRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.createPermissionGroup,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a permission group by id.
  Future<identityv1permission.GetPermissionGroupResponse> getPermissionGroup(
    identityv1permission.GetPermissionGroupRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.getPermissionGroup,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a permission group.
  Future<identityv1permission.UpdatePermissionGroupResponse> updatePermissionGroup(
    identityv1permission.UpdatePermissionGroupRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.updatePermissionGroup,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a permission group.
  Future<identityv1permission.DeletePermissionGroupResponse> deletePermissionGroup(
    identityv1permission.DeletePermissionGroupRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.deletePermissionGroup,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets the permissions of the user.
  Future<identityv1permission.GetUserPermissionsResponse> getUserPermissions(
    identityv1permission.GetUserPermissionsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.getUserPermissions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Removes a permission from the user.
  Future<identityv1permission.RemoveUserPermissionResponse> removeUserPermission(
    identityv1permission.RemoveUserPermissionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.removeUserPermission,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Adds a permission to the user.
  Future<identityv1permission.AddUserPermissionResponse> addUserPermission(
    identityv1permission.AddUserPermissionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.addUserPermission,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets the permission groups of the business.
  Future<identityv1permission.GetBusinessPermissionGroupsResponse> getBusinessPermissionGroups(
    identityv1permission.GetBusinessPermissionGroupsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.getBusinessPermissionGroups,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Checks if the user has the provided permission for the provided resource.
  Future<identityv1permission.CheckPermissionResponse> checkPermission(
    identityv1permission.CheckPermissionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.checkPermission,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
