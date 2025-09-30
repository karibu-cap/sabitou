//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//

import "package:connectrpc/connect.dart" as connect;
import "permission.pb.dart" as identityv1permission;

abstract final class PermissionService {
  /// Fully-qualified name of the PermissionService service.
  static const name = 'identity.v1.PermissionService';

  /// Create store permission
  static const createStorePermission = connect.Spec(
    '/$name/CreateStorePermission',
    connect.StreamType.unary,
    identityv1permission.CreateStorePermissionRequest.new,
    identityv1permission.SuccessResponse.new,
  );

  /// Update store permission
  static const updateStorePermission = connect.Spec(
    '/$name/UpdateStorePermission',
    connect.StreamType.unary,
    identityv1permission.UpdateStorePermissionRequest.new,
    identityv1permission.SuccessResponse.new,
  );

  /// Delete store permission
  static const deleteStorePermission = connect.Spec(
    '/$name/DeleteStorePermission',
    connect.StreamType.unary,
    identityv1permission.DeleteStorePermissionRequest.new,
    identityv1permission.SuccessResponse.new,
  );

  /// Check if a user has a store permission
  static const checkStorePermission = connect.Spec(
    '/$name/CheckStorePermission',
    connect.StreamType.unary,
    identityv1permission.CheckStorePermissionRequest.new,
    identityv1permission.CheckStorePermissionResponse.new,
  );
}
