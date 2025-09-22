//
//  Generated code. Do not modify.
//  source: sync/v1/sync.proto
//

import "package:connectrpc/connect.dart" as connect;
import "sync.pb.dart" as syncv1sync;

/// Sync service definition
abstract final class SyncService {
  /// Fully-qualified name of the SyncService service.
  static const name = 'sync.v1.SyncService';

  /// Submit sync operations for processing
  static const submitSyncOperations = connect.Spec(
    '/$name/SubmitSyncOperations',
    connect.StreamType.unary,
    syncv1sync.SubmitSyncOperationsRequest.new,
    syncv1sync.SubmitSyncOperationsResponse.new,
  );

  /// Get status of sync operations
  static const getSyncOperationsStatus = connect.Spec(
    '/$name/GetSyncOperationsStatus',
    connect.StreamType.unary,
    syncv1sync.GetSyncOperationsStatusRequest.new,
    syncv1sync.GetSyncOperationsStatusResponse.new,
  );

  /// Stream sync operations updates in real-time
  static const streamSyncOperations = connect.Spec(
    '/$name/StreamSyncOperations',
    connect.StreamType.server,
    syncv1sync.StreamSyncOperationsRequest.new,
    syncv1sync.StreamSyncOperationsResponse.new,
  );

  /// Retry failed sync operations
  static const retrySyncOperations = connect.Spec(
    '/$name/RetrySyncOperations',
    connect.StreamType.unary,
    syncv1sync.RetrySyncOperationsRequest.new,
    syncv1sync.RetrySyncOperationsResponse.new,
  );
}
