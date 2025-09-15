//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//

import "package:connectrpc/connect.dart" as connect;
import "permission.pb.dart" as identityv1permission;

abstract final class PermissionService {
  /// Fully-qualified name of the PermissionService service.
  static const name = 'identity.v1.PermissionService';

  /// Creates a new business permission.
  static const createBusinessPermission = connect.Spec(
    '/$name/CreateBusinessPermission',
    connect.StreamType.unary,
    identityv1permission.CreateBusinessPermissionRequest.new,
    identityv1permission.CreateBusinessPermissionResponse.new,
  );

  /// Updates a business permission.
  static const updateBusinessPermission = connect.Spec(
    '/$name/UpdateBusinessPermission',
    connect.StreamType.unary,
    identityv1permission.UpdateBusinessPermissionRequest.new,
    identityv1permission.UpdateBusinessPermissionResponse.new,
  );

  /// Deletes a business permission.
  static const deleteBusinessPermission = connect.Spec(
    '/$name/DeleteBusinessPermission',
    connect.StreamType.unary,
    identityv1permission.DeleteBusinessPermissionRequest.new,
    identityv1permission.DeleteBusinessPermissionResponse.new,
  );

  /// Creates a new store permission.
  static const createStorePermission = connect.Spec(
    '/$name/CreateStorePermission',
    connect.StreamType.unary,
    identityv1permission.CreateStorePermissionRequest.new,
    identityv1permission.CreateStorePermissionResponse.new,
  );

  /// Updates a store permission.
  static const updateStorePermission = connect.Spec(
    '/$name/UpdateStorePermission',
    connect.StreamType.unary,
    identityv1permission.UpdateStorePermissionRequest.new,
    identityv1permission.UpdateStorePermissionResponse.new,
  );

  /// Deletes a store permission.
  static const deleteStorePermission = connect.Spec(
    '/$name/DeleteStorePermission',
    connect.StreamType.unary,
    identityv1permission.DeleteStorePermissionRequest.new,
    identityv1permission.DeleteStorePermissionResponse.new,
  );

  /// Checks if a member has a business permission.
  static const checkBusinessPermission = connect.Spec(
    '/$name/CheckBusinessPermission',
    connect.StreamType.unary,
    identityv1permission.CheckBusinessPermissionRequest.new,
    identityv1permission.CheckBusinessPermissionResponse.new,
  );

  /// Checks if a member has a store permission.
  static const checkStorePermission = connect.Spec(
    '/$name/CheckStorePermission',
    connect.StreamType.unary,
    identityv1permission.CheckStorePermissionRequest.new,
    identityv1permission.CheckStorePermissionResponse.new,
  );
}
