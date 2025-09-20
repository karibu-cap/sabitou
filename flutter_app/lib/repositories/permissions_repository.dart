import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';

/// Repository for managing permissions and roles.
///
/// Handles all permission-related operations including role management,
/// permission assignments, and access control.
final class PermissionsRepository {
  /// The permission service client.
  final PermissionServiceClient permissionClientService;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// Access the singleton instance.
  static PermissionsRepository get instance =>
      GetIt.I.get<PermissionsRepository>();

  /// Creates a new [PermissionsRepository].
  PermissionsRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : permissionClientService = PermissionServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();
}
