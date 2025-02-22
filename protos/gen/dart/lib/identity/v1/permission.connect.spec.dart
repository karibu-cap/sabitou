//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//

import "package:connectrpc/connect.dart" as connect;
import "permission.pb.dart" as identityv1permission;

abstract final class PermissionService {
  /// Fully-qualified name of the PermissionService service.
  static const name = 'identity.v1.PermissionService';

  /// Creates a new permission group.
  static const createPermissionGroup = connect.Spec(
    '/$name/CreatePermissionGroup',
    connect.StreamType.unary,
    identityv1permission.CreatePermissionGroupRequest.new,
    identityv1permission.CreatePermissionGroupResponse.new,
  );

  /// Gets a permission group by id.
  static const getPermissionGroup = connect.Spec(
    '/$name/GetPermissionGroup',
    connect.StreamType.unary,
    identityv1permission.GetPermissionGroupRequest.new,
    identityv1permission.GetPermissionGroupResponse.new,
  );

  /// Updates a permission group.
  static const updatePermissionGroup = connect.Spec(
    '/$name/UpdatePermissionGroup',
    connect.StreamType.unary,
    identityv1permission.UpdatePermissionGroupRequest.new,
    identityv1permission.UpdatePermissionGroupResponse.new,
  );

  /// Deletes a permission group.
  static const deletePermissionGroup = connect.Spec(
    '/$name/DeletePermissionGroup',
    connect.StreamType.unary,
    identityv1permission.DeletePermissionGroupRequest.new,
    identityv1permission.DeletePermissionGroupResponse.new,
  );

  /// Gets the permissions of the user.
  static const getUserPermissions = connect.Spec(
    '/$name/GetUserPermissions',
    connect.StreamType.unary,
    identityv1permission.GetUserPermissionsRequest.new,
    identityv1permission.GetUserPermissionsResponse.new,
  );

  /// Removes a permission from the user.
  static const removeUserPermission = connect.Spec(
    '/$name/RemoveUserPermission',
    connect.StreamType.unary,
    identityv1permission.RemoveUserPermissionRequest.new,
    identityv1permission.RemoveUserPermissionResponse.new,
  );

  /// Adds a permission to the user.
  static const addUserPermission = connect.Spec(
    '/$name/AddUserPermission',
    connect.StreamType.unary,
    identityv1permission.AddUserPermissionRequest.new,
    identityv1permission.AddUserPermissionResponse.new,
  );

  /// Gets the permission groups of the business.
  static const getBusinessPermissionGroups = connect.Spec(
    '/$name/GetBusinessPermissionGroups',
    connect.StreamType.unary,
    identityv1permission.GetBusinessPermissionGroupsRequest.new,
    identityv1permission.GetBusinessPermissionGroupsResponse.new,
  );

  /// Checks if the user has the provided permission for the provided resource.
  static const checkPermission = connect.Spec(
    '/$name/CheckPermission',
    connect.StreamType.unary,
    identityv1permission.CheckPermissionRequest.new,
    identityv1permission.CheckPermissionResponse.new,
  );
}
