//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//

import "package:connectrpc/connect.dart" as connect;
import "permission.pb.dart" as identityv1permission;
import "permission.connect.spec.dart" as specs;

extension type PermissionServiceClient (connect.Transport _transport) {
  /// Create store permission
  Future<identityv1permission.SuccessResponse> createStorePermission(
    identityv1permission.CreateStorePermissionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.createStorePermission,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Update store permission
  Future<identityv1permission.SuccessResponse> updateStorePermission(
    identityv1permission.UpdateStorePermissionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.updateStorePermission,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Delete store permission
  Future<identityv1permission.SuccessResponse> deleteStorePermission(
    identityv1permission.DeleteStorePermissionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.deleteStorePermission,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Check if a user has a store permission
  Future<identityv1permission.CheckStorePermissionResponse> checkStorePermission(
    identityv1permission.CheckStorePermissionRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PermissionService.checkStorePermission,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
