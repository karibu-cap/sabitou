//
//  Generated code. Do not modify.
//  source: sync/v1/sync.proto
//

import "package:connectrpc/connect.dart" as connect;
import "sync.pb.dart" as syncv1sync;
import "sync.connect.spec.dart" as specs;

/// Sync service definition
extension type SyncServiceClient (connect.Transport _transport) {
  /// Submit sync operations for processing
  Future<syncv1sync.SubmitSyncOperationsResponse> submitSyncOperations(
    syncv1sync.SubmitSyncOperationsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SyncService.submitSyncOperations,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get status of sync operations
  Future<syncv1sync.GetSyncOperationsStatusResponse> getSyncOperationsStatus(
    syncv1sync.GetSyncOperationsStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SyncService.getSyncOperationsStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Stream sync operations updates in real-time
  Stream<syncv1sync.StreamSyncOperationsResponse> streamSyncOperations(
    syncv1sync.StreamSyncOperationsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.SyncService.streamSyncOperations,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Retry failed sync operations
  Future<syncv1sync.RetrySyncOperationsResponse> retrySyncOperations(
    syncv1sync.RetrySyncOperationsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SyncService.retrySyncOperations,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
