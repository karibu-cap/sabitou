import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// Repository for managing permissions and roles.
///
/// Handles all permission-related operations including role management,
/// permission assignments, and access control.
final class PermissionsRepository {
  final _logger = LoggerApp('PermissionsRepository');

  /// The permission service client.
  final PermissionServiceClient permissionClientService;

  /// Access the singleton instance.
  static PermissionsRepository get instance =>
      GetIt.I.get<PermissionsRepository>();

  /// Creates a new [PermissionsRepository].
  PermissionsRepository([connect.Transport? transport])
    : permissionClientService = PermissionServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Creates a new permissions group.
  Future<String?> createPermissionsGroup(
    CreatePermissionsGroupRequest request,
  ) async {
    try {
      final result = await permissionClientService.createPermissionsGroup(
        request,
      );
      _logger.log('Created permissions group: ${result.permissionGroupId}');

      return result.permissionGroupId;
    } on Exception catch (e) {
      _logger.severe('Error creating permissions group: $e');

      return null;
    }
  }

  /// Gets a permissions group by ID.
  Future<PermissionsGroup?> getPermissionsGroup(
    GetPermissionsGroupRequest request,
  ) async {
    try {
      final result = await permissionClientService.getPermissionsGroup(request);
      _logger.log(
        'Retrieved permissions group: ${result.permissionsGroup.writeToJson()}',
      );

      return result.permissionsGroup;
    } on Exception catch (e) {
      _logger.severe('Error getting permissions group: $e');

      return null;
    }
  }

  /// Updates a permissions group.
  Future<bool> updatePermissionsGroup(
    UpdatePermissionsGroupRequest request,
  ) async {
    try {
      final result = await permissionClientService.updatePermissionsGroup(
        request,
      );
      _logger.log('Updated permissions group success: ${result.success}');

      return result.success;
    } on Exception catch (e) {
      _logger.severe('Error updating permissions group: $e');

      return false;
    }
  }

  /// Deletes a permissions group.
  Future<bool> deletePermissionsGroup(
    DeletePermissionsGroupRequest request,
  ) async {
    try {
      final result = await permissionClientService.deletePermissionsGroup(
        request,
      );
      _logger.log('Deleted permissions group success: ${result.success}');

      return result.success;
    } on Exception catch (e) {
      _logger.severe('Error deleting permissions group: $e');

      return false;
    }
  }

  /// Updates member permissions.
  Future<bool> updateMemberPermissions(
    UpdateMemberPermissionsRequest request,
  ) async {
    try {
      final result = await permissionClientService.updateMemberPermissions(
        request,
      );
      _logger.log('Updated member permissions success: ${result.success}');

      return result.success;
    } on Exception catch (e) {
      _logger.severe('Error updating member permissions: $e');

      return false;
    }
  }

  /// Gets business permissions groups.
  Future<List<PermissionsGroup>> getBusinessPermissionsGroups(
    GetBusinessPermissionsGroupsRequest request,
  ) async {
    try {
      final result = await permissionClientService.getBusinessPermissionsGroups(
        request,
      );
      _logger.log(
        'Retrieved ${result.permissionsGroups.length} business permissions groups.',
      );

      return result.permissionsGroups;
    } on Exception catch (e) {
      _logger.severe('Error getting business permissions groups: $e');

      return [];
    }
  }

  /// Checks if a user has a specific permission.
  Future<bool> checkPermission(CheckPermissionRequest request) async {
    try {
      final result = await permissionClientService.checkPermission(request);
      _logger.log('Permission check result: ${result.hasPermission}');

      return result.hasPermission;
    } on Exception catch (e) {
      _logger.severe('Error checking permission: $e');

      return false;
    }
  }

  /// Streams business permissions groups with real-time updates.
  Stream<List<PermissionsGroup>> streamBusinessPermissionsGroups(
    StreamBusinessPermissionsGroupsRequest request,
  ) {
    try {
      return permissionClientService.streamBusinessPermissionsGroups(request).map((
        response,
      ) {
        _logger.log(
          'Streamed ${response.permissionsGroups.length} business permissions groups.',
        );

        return response.permissionsGroups;
      });
    } on Exception catch (e) {
      _logger.severe('Error streaming business permissions groups: $e');

      return Stream.value([]);
    }
  }
}
