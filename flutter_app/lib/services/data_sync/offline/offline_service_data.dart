import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../entities/sync_operation_isar.dart';
import '../../../utils/logger.dart';
import '../../isar_database/isar_database.dart';
import '../../network_status_provider/network_status_provider.dart';

/// Offline operations management service
///
/// This service uses existing Isar entities (SyncOperationIsar) and generated
/// protobuf types to manage the offline operations queue, retry with
/// exponential backoff, and synchronization via connectRPC.
class OfflineServiceData {
  final _logger = LoggerApp('OfflineServiceData');

  /// Isar database
  final IsarDatabase _isarDatabase = GetIt.instance<IsarDatabase>();

  /// Network status provider
  final NetworkStatusProvider _networkStatusProvider =
      GetIt.instance<NetworkStatusProvider>();

  /// The sync service client.
  final SyncServiceClient syncServiceClient;

  /// Stream of pending operations
  final BehaviorSubject<List<SyncOperationIsar>> _operationsController =
      BehaviorSubject<List<SyncOperationIsar>>.seeded([]);

  /// Stream of synchronization status
  final BehaviorSubject<bool> _syncStatusController =
      BehaviorSubject<bool>.seeded(false);

  /// Subscription to listen for connectivity changes
  StreamSubscription<bool>? _networkSubscription;

  /// Timer for periodic retries
  Timer? _retryTimer;

  /// Whether the service is active
  bool _isActive = false;

  /// Constructor
  OfflineServiceData({required connect.Transport transport})
    : syncServiceClient = SyncServiceClient(transport);

  /// Stream of pending operations
  Stream<List<SyncOperationIsar>> get operationsStream =>
      _operationsController.stream;

  /// Stream of synchronization status
  Stream<bool> get syncStatusStream => _syncStatusController.stream;

  /// Number of pending operations
  int get pendingOperationsCount => _operationsController.value.length;

  /// Starts the service
  Future<void> start() async {
    if (_isActive) return;

    _logger.info('Starting offline service');
    _isActive = true;

    // Load existing operations
    await _loadPendingOperations();

    // Listen for connectivity changes
    _networkSubscription = _networkStatusProvider.connectivityStream.listen((
      isConnected,
    ) {
      if (isConnected) {
        _logger.info('Connection restored, starting synchronization');
        _startSync();
      } else {
        _logger.info('Connection lost, stopping synchronization');
        _stopSync();
      }
    });

    // Start retry timer
    _startRetryTimer();

    // Check connectivity and start sync if connected
    final isConnected = await _networkStatusProvider.checkConnectivity();
    if (isConnected) {
      _startSync();
    }
  }

  /// Stops the service
  Future<void> stop() async {
    if (!_isActive) return;

    _logger.info('Stopping offline service');
    _isActive = false;

    await _networkSubscription?.cancel();
    _networkSubscription = null;

    _retryTimer?.cancel();
    _retryTimer = null;

    _stopSync();
  }

  /// Disposes resources
  Future<void> dispose() async {
    await stop();
    await _operationsController.close();
    await _syncStatusController.close();
  }

  /// Loads pending operations from Isar
  Future<void> _loadPendingOperations() async {
    try {
      final operations = await _isarDatabase.syncOperationsIsars
          .filter()
          .statusEqualTo(
            SyncOperationStatus.SYNC_OPERATION_STATUS_PENDING.value,
          )
          .or()
          .statusEqualTo(
            SyncOperationStatus.SYNC_OPERATION_STATUS_RETRYING.value,
          )
          .or()
          .statusEqualTo(SyncOperationStatus.SYNC_OPERATION_STATUS_FAILED.value)
          .findAll();

      _operationsController.add(operations);
      _logger.info('${operations.length} pending operations loaded');
    } on Exception catch (e) {
      _logger.warning('Error loading operations: $e');
    }
  }

  /// Starts synchronization
  void _startSync() {
    _syncStatusController.add(true);
    _processPendingOperations();
  }

  /// Stops synchronization
  void _stopSync() {
    _syncStatusController.add(false);
  }

  /// Starts the retry timer
  void _startRetryTimer() {
    _retryTimer?.cancel();
    _retryTimer = Timer.periodic(const Duration(minutes: 1), (_) async {
      if (_isActive) {
        final isConnected = await _networkStatusProvider.checkConnectivity();
        if (isConnected) {
          await _processPendingOperations();
        }

        // Auto-cleanup old operations every hour (when minute is 0)
        final now = DateTime.now();
        if (now.minute == 0) {
          await _performAutoCleanup();
        }
      }
    });
  }

  /// Performs automatic cleanup of old operations
  Future<void> _performAutoCleanup() async {
    try {
      // Clear operations older than 7 days (SUCCESS and ABANDONED only)
      await clearOldOperations(olderThanDays: 30);

      // Get stats for logging
      final stats = await getOperationsStats();
      _logger.info('Auto-cleanup completed. Current stats: $stats');
    } on Exception catch (e) {
      _logger.warning('Auto-cleanup failed: $e');
    }
  }

  /// Processes pending operations
  Future<void> _processPendingOperations() async {
    if (!_isActive) return;

    final isConnected = await _networkStatusProvider.checkConnectivity();
    if (!isConnected) return;

    final operations = _operationsController.value;
    final readyOperations = operations
        .where((op) => op.isReadyForRetry)
        .toList();

    if (readyOperations.isEmpty) return;

    _logger.info('Processing ${readyOperations.length} operations');

    for (final operation in readyOperations) {
      await _processOperation(operation);
    }

    // Reload operations after processing
    await _loadPendingOperations();
  }

  /// Processes an individual operation
  Future<void> _processOperation(SyncOperationIsar operation) async {
    try {
      _logger.info('Processing operation ${operation.operationId}');

      // Mark as in progress
      await _updateOperationStatus(
        operation,
        SyncOperationStatus.SYNC_OPERATION_STATUS_IN_PROGRESS.value,
      );

      // Convert to proto and send
      final syncOp = operation.toProto();

      // Submit operation via connectRPC
      final result = await syncServiceClient.submitSyncOperations(
        SubmitSyncOperationsRequest(operations: [syncOp]),
      );

      // Handle API response
      if (result.operationResults.isNotEmpty) {
        final operationResult = result.operationResults.first;

        if (operationResult.status ==
            SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS) {
          // Mark as successful
          await _updateOperationStatus(
            operation,
            SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS.value,
          );
          _logger.info(
            'Operation ${operation.operationId} successfully synced',
          );
        } else {
          // Handle failed operation from server
          final errorMessage = operationResult.hasErrorMessage()
              ? operationResult.errorMessage
              : 'Server returned failure status';

          throw Exception('Server sync failed: $errorMessage');
        }
      } else {
        // No results in response - treat as error
        throw Exception('No results returned from sync service');
      }

      _logger.info('Operation ${operation.operationId} successful');
    } on Exception catch (e) {
      _logger.warning(
        'Error processing operation ${operation.operationId}: $e',
      );

      // Increment retry or mark as abandoned
      if (operation.hasExceededMaxRetries) {
        await _updateOperationStatus(
          operation,
          SyncOperationStatus.SYNC_OPERATION_STATUS_ABANDONED.value,
          errorMessage: e.toString(),
        );
      } else {
        final retryOperation = operation.copyWithRetry(
          newErrorMessage: e.toString(),
        );
        await _saveOperation(retryOperation);
      }
    }
  }

  /// Updates an operation status
  Future<void> _updateOperationStatus(
    SyncOperationIsar operation,
    int newStatus, {
    String? errorMessage,
  }) async {
    final updatedOperation = operation.copyWithStatus(
      newStatus,
      newErrorMessage: errorMessage,
    );
    await _saveOperation(updatedOperation);
  }

  /// Saves an operation to Isar
  Future<void> _saveOperation(SyncOperationIsar operation) async {
    await _isarDatabase.writeTxn(() async {
      await _isarDatabase.syncOperationsIsars.put(operation);
    });
  }

  /// Clears all completed operations (SUCCESS)
  Future<void> clearCompletedOperations() async {
    await _isarDatabase.writeTxn(() async {
      await _isarDatabase.syncOperationsIsars
          .filter()
          .statusEqualTo(
            SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS.value,
          )
          .deleteAll();
    });

    await _loadPendingOperations();
    _logger.info('Completed operations cleared');
  }

  /// Clears all abandoned operations (ABANDONED)
  Future<void> clearAbandonedOperations() async {
    await _isarDatabase.writeTxn(() async {
      await _isarDatabase.syncOperationsIsars
          .filter()
          .statusEqualTo(
            SyncOperationStatus.SYNC_OPERATION_STATUS_ABANDONED.value,
          )
          .deleteAll();
    });

    await _loadPendingOperations();
    _logger.info('Abandoned operations cleared');
  }

  /// Clears old operations (older than specified days)
  Future<void> clearOldOperations({int olderThanDays = 7}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: olderThanDays));

    await _isarDatabase.writeTxn(() async {
      await _isarDatabase.syncOperationsIsars
          .filter()
          .createdAtLessThan(cutoffDate)
          .and()
          .group(
            (q) => q
                .statusEqualTo(
                  SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS.value,
                )
                .or()
                .statusEqualTo(
                  SyncOperationStatus.SYNC_OPERATION_STATUS_ABANDONED.value,
                ),
          )
          .deleteAll();
    });

    await _loadPendingOperations();
    _logger.info('Old operations (>$olderThanDays days) cleared');
  }

  /// Gets operations statistics
  Future<Map<String, int>> getOperationsStats() async {
    final allOperations = await _isarDatabase.syncOperationsIsars
        .where()
        .findAll();

    final stats = <String, int>{
      'total': allOperations.length,
      'pending': 0,
      'in_progress': 0,
      'success': 0,
      'failed': 0,
      'retrying': 0,
      'abandoned': 0,
    };

    for (final op in allOperations) {
      switch (op.status) {
        case 1: // PENDING
          stats['pending'] = (stats['pending'] ?? 0) + 1;
          break;
        case 2: // IN_PROGRESS
          stats['in_progress'] = (stats['in_progress'] ?? 0) + 1;
          break;
        case 3: // SUCCESS
          stats['success'] = (stats['success'] ?? 0) + 1;
          break;
        case 4: // FAILED
          stats['failed'] = (stats['failed'] ?? 0) + 1;
          break;
        case 5: // RETRYING
          stats['retrying'] = (stats['retrying'] ?? 0) + 1;
          break;
        case 6: // ABANDONED
          stats['abandoned'] = (stats['abandoned'] ?? 0) + 1;
          break;
      }
    }

    return stats;
  }
}
