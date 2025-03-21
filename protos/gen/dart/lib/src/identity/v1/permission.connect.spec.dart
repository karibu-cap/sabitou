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
  static const createPermissionsGroup = connect.Spec(
    '/$name/CreatePermissionsGroup',
    connect.StreamType.unary,
    identityv1permission.CreatePermissionsGroupRequest.new,
    identityv1permission.CreatePermissionsGroupResponse.new,
  );

  /// Gets a permission group by id.
  static const getPermissionsGroup = connect.Spec(
    '/$name/GetPermissionsGroup',
    connect.StreamType.unary,
    identityv1permission.GetPermissionsGroupRequest.new,
    identityv1permission.GetPermissionsGroupResponse.new,
  );

  /// Updates a permission group.
  static const updatePermissionsGroup = connect.Spec(
    '/$name/UpdatePermissionsGroup',
    connect.StreamType.unary,
    identityv1permission.UpdatePermissionsGroupRequest.new,
    identityv1permission.UpdatePermissionsGroupResponse.new,
  );

  /// Deletes a permission group.
  static const deletePermissionsGroup = connect.Spec(
    '/$name/DeletePermissionsGroup',
    connect.StreamType.unary,
    identityv1permission.DeletePermissionsGroupRequest.new,
    identityv1permission.DeletePermissionsGroupResponse.new,
  );

  /// Update the member permissions on the provided business.
  static const updateMemberPermissions = connect.Spec(
    '/$name/UpdateMemberPermissions',
    connect.StreamType.unary,
    identityv1permission.UpdateMemberPermissionsRequest.new,
    identityv1permission.UpdateMemberPermissionsResponse.new,
  );

  /// Gets the permission groups of the business.
  static const getBusinessPermissionsGroups = connect.Spec(
    '/$name/GetBusinessPermissionsGroups',
    connect.StreamType.unary,
    identityv1permission.GetBusinessPermissionsGroupsRequest.new,
    identityv1permission.GetBusinessPermissionsGroupsResponse.new,
  );

  /// Checks if the member has the provided permission for the provided resource.
  static const checkPermission = connect.Spec(
    '/$name/CheckPermission',
    connect.StreamType.unary,
    identityv1permission.CheckPermissionRequest.new,
    identityv1permission.CheckPermissionResponse.new,
  );
}
