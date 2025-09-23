import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// Repository for managing synchonisation online/offline.
final class SyncRepository {
  final _logger = LoggerApp('SyncRepository');

  /// The sync service client.
  final SyncServiceClient syncClientService;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// Access the singleton instance.
  static SyncRepository get instance => GetIt.I.get<SyncRepository>();

  /// Creates a new [SyncRepository].
  SyncRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : syncClientService = SyncServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Submit sync operations.
  Future<SubmitSyncOperationsResponse?> submitSyncOperations(
    SubmitSyncOperationsRequest request,
  ) async {
    try {
      final result = await syncClientService.submitSyncOperations(request);

      return result;
    } on Exception catch (e) {
      _logger.severe('Error submitting sync operations: $e');

      return null;
    }
  }
}
