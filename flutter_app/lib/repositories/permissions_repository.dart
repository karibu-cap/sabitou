import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';

import '../services/rpc/connect_rpc.dart';

/// Repository for managing permissions and roles.
///
/// Handles all permission-related operations including role management,
/// permission assignments, and access control.
final class PermissionsRepository {
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
}
