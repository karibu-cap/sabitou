import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/sync_repository.dart';
import '../../../utils/logger.dart';
import '../../hive_database/hive_database.dart';
import '../../network_status_provider/network_status_provider.dart';

/// Offline operations management service
///
/// This service uses existing  entities (SyncOperation) and generated
/// protobuf types to manage the offline operations queue, retry with
/// exponential backoff, and synchronization via connectRPC.
class OfflineServiceData {
  final _logger = LoggerApp('OfflineServiceData');

  ///  database
  final HiveDatabase _hiveDatabase = GetIt.instance<HiveDatabase>();

  /// Network status provider
  final NetworkStatusProvider _networkStatusProvider =
      GetIt.instance<NetworkStatusProvider>();

  /// The sync service client.
  final SyncRepository syncRepository;

  /// Stream of pending operations
  final BehaviorSubject<List<SyncOperation>> _operationsController =
      BehaviorSubject<List<SyncOperation>>.seeded([]);

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
    : syncRepository = SyncRepository(transport: transport);

  /// Stream of pending operations
  Stream<List<SyncOperation>> get operationsStream =>
      _operationsController.stream;

  /// Stream of synchronization status
  Stream<bool> get syncStatusStream => _syncStatusController.stream;

  /// Number of pending operations
  int get pendingOperationsCount => _operationsController.value.length;

  /// Starts the service
  Future<void> startContinuousSync() async {
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

  /// Loads pending operations from
  Future<void> _loadPendingOperations() async {
    try {
      final box = _hiveDatabase.syncOperations;
      final allOperations = box.values.toList();

      // Filter operations by status (pending, retrying, or failed)
      final operations = allOperations.where((op) {
        return op.status == SyncOperationStatus.SYNC_OPERATION_STATUS_PENDING ||
            op.status == SyncOperationStatus.SYNC_OPERATION_STATUS_RETRYING ||
            op.status == SyncOperationStatus.SYNC_OPERATION_STATUS_FAILED;
      }).toList();

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
    _retryTimer = Timer.periodic(const Duration(minutes: 5), (_) async {
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
    if (!_isActive) {
      _logger.info('Service not active, skipping operation processing');

      return;
    }

    final isConnected = await _networkStatusProvider.checkConnectivity();
    if (!isConnected) {
      _logger.info('No connection, skipping operation processing');

      return;
    }

    final operations = _operationsController.value;

    // Only log if there are operations to check
    if (operations.isNotEmpty) {
      _logger.info('Found ${operations.length} total operations to check');

      // Log details about each operation
      for (int i = 0; i < operations.length; i++) {
        final op = operations[i];
        final ready = isReadyForRetry(op);
        _logger.info(
          'Operation $i: ${op.refId} - Status: ${op.status} - RetryCount: ${op.retryCount}/${op.maxRetries} - Ready: $ready',
        );
        if (!ready) {
          _logger.info('  -> Not ready because: ${_getNotReadyReason(op)}');
        }
      }
    }

    final readyOperations = operations.where(isReadyForRetry).toList();

    // Only log if there are operations or if this is the first time we see 0 operations
    if (operations.isNotEmpty || readyOperations.isNotEmpty) {
      _logger.info('${readyOperations.length} operations are ready for retry');
    }

    if (readyOperations.isEmpty) {
      // Only log if there were operations to check
      if (operations.isNotEmpty) {
        _logger.info('No operations ready for processing');
      }

      return;
    }

    _logger.info('Processing ${readyOperations.length} operations');

    for (final operation in readyOperations) {
      await _processOperation(operation);
    }

    // Reload operations after processing
    await _loadPendingOperations();
  }

  /// Processes an individual operation
  Future<void> _processOperation(SyncOperation operation) async {
    try {
      _logger.info('Processing operation ${operation.refId}');

      // Mark as in progress
      await _updateOperationStatus(
        operation,
        SyncOperationStatus.SYNC_OPERATION_STATUS_IN_PROGRESS,
      );

      // Convert to proto and send
      final syncOp = operation;

      // Submit operation via connectRPC
      final result = await syncRepository.submitSyncOperations(
        SubmitSyncOperationsRequest(operations: [syncOp]),
      );

      // Handle API response
      if (result?.operationResults.isNotEmpty ?? false) {
        final operationResult = result?.operationResults.first;

        if (operationResult == null) {
          throw Exception('No operation result returned from sync service');
        }

        if (operationResult.status ==
            SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS) {
          // Mark as successful
          await _updateOperationStatus(
            operation,
            SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS,
          );
          _logger.info('Operation ${operation.refId} successfully synced');
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

      _logger.info('Operation ${operation.refId} successful');
    } on Exception catch (e) {
      _logger.warning('Error processing operation ${operation.refId}: $e');

      // Increment retry or mark as abandoned
      if (operation.retryCount >= operation.maxRetries) {
        await _updateOperationStatus(
          operation,
          SyncOperationStatus.SYNC_OPERATION_STATUS_ABANDONED,
          errorMessage: e.toString(),
        );
      } else {
        final retryOperation = operation..errorMessage = e.toString();
        await _saveOperation(retryOperation);
      }
    }
  }

  /// Updates an operation status
  Future<void> _updateOperationStatus(
    SyncOperation operation,
    SyncOperationStatus newStatus, {
    String? errorMessage,
  }) async {
    final updatedOperation = operation
      ..status = newStatus
      ..errorMessage = errorMessage ?? '';
    await _saveOperation(updatedOperation);
  }

  /// Saves an operation to Isar
  Future<void> _saveOperation(SyncOperation operation) async {
    await _hiveDatabase.syncOperations.put(operation.refId, operation);
  }

  /// Clears all completed operations (SUCCESS)
  Future<void> clearCompletedOperations() async {
    final box = _hiveDatabase.syncOperations;
    final completedKeys = <String>[];

    // Find all completed operations
    for (final entry in box.toMap().entries) {
      if (entry.value.status ==
          SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS) {
        completedKeys.add(entry.key as String);
      }
    }

    // Delete completed operations
    await box.deleteAll(completedKeys);

    await _loadPendingOperations();
    _logger.info('Completed operations cleared');
  }

  /// Clears all abandoned operations (ABANDONED)
  Future<void> clearAbandonedOperations() async {
    final box = _hiveDatabase.syncOperations;
    final abandonedKeys = <String>[];

    // Find all abandoned operations
    for (final entry in box.toMap().entries) {
      if (entry.value.status ==
          SyncOperationStatus.SYNC_OPERATION_STATUS_ABANDONED) {
        abandonedKeys.add(entry.key as String);
      }
    }

    // Delete abandoned operations
    await box.deleteAll(abandonedKeys);

    await _loadPendingOperations();
    _logger.info('Abandoned operations cleared');
  }

  /// Clears old operations (older than specified days)
  Future<void> clearOldOperations({int olderThanDays = 7}) async {
    final cutoffDate = DateTime.now().subtract(Duration(days: olderThanDays));

    final box = _hiveDatabase.syncOperations;
    final oldKeys = <String>[];

    // Find old operations that are completed or abandoned
    for (final entry in box.toMap().entries) {
      final operation = entry.value;
      final isOld = operation.createdAt.toDateTime().isBefore(cutoffDate);
      final isCompletedOrAbandoned =
          operation.status ==
              SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS ||
          operation.status ==
              SyncOperationStatus.SYNC_OPERATION_STATUS_ABANDONED;

      if (isOld && isCompletedOrAbandoned) {
        oldKeys.add(entry.key as String);
      }
    }

    // Delete old operations
    await box.deleteAll(oldKeys);

    await _loadPendingOperations();
    _logger.info('Old operations (>$olderThanDays days) cleared');
  }

  /// Gets operations statistics
  Future<Map<String, int>> getOperationsStats() async {
    final box = _hiveDatabase.syncOperations;
    final allOperations = box.values.toList();

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
        case SyncOperationStatus.SYNC_OPERATION_STATUS_PENDING: // PENDING
          stats['pending'] = (stats['pending'] ?? 0) + 1;
          break;
        case SyncOperationStatus
            .SYNC_OPERATION_STATUS_IN_PROGRESS: // IN_PROGRESS
          stats['in_progress'] = (stats['in_progress'] ?? 0) + 1;
          break;
        case SyncOperationStatus.SYNC_OPERATION_STATUS_SUCCESS: // SUCCESS
          stats['success'] = (stats['success'] ?? 0) + 1;
          break;
        case SyncOperationStatus.SYNC_OPERATION_STATUS_FAILED: // FAILED
          stats['failed'] = (stats['failed'] ?? 0) + 1;
          break;
        case SyncOperationStatus.SYNC_OPERATION_STATUS_RETRYING: // RETRYING
          stats['retrying'] = (stats['retrying'] ?? 0) + 1;
          break;
        case SyncOperationStatus.SYNC_OPERATION_STATUS_ABANDONED: // ABANDONED
          stats['abandoned'] = (stats['abandoned'] ?? 0) + 1;
          break;
      }
    }

    return stats;
  }

  /// Checks if this operation is ready for processing
  ///
  /// Returns true if the operation is pending, failed and ready for retry,
  /// or currently retrying and ready for retry.
  bool isReadyForRetry(SyncOperation operation) {
    // PENDING operations are always ready to be processed
    if (operation.status == SyncOperationStatus.SYNC_OPERATION_STATUS_PENDING) {
      return true;
    }

    // For FAILED or RETRYING operations, check retry conditions
    if (operation.status != SyncOperationStatus.SYNC_OPERATION_STATUS_FAILED &&
        operation.status !=
            SyncOperationStatus.SYNC_OPERATION_STATUS_RETRYING) {
      return false; // Not PENDING, FAILED or RETRYING
    }

    if (operation.retryCount >= operation.maxRetries) {
      return false; // Exceeded max retries
    }

    final _nextRetryAt = operation.nextRetryAt;

    return DateTime.now().isAfter(
      _nextRetryAt.toDateTime(),
    ); // Retry time has passed
  }

  /// Gets the reason why an operation is not ready for retry
  String _getNotReadyReason(SyncOperation operation) {
    if (operation.status != SyncOperationStatus.SYNC_OPERATION_STATUS_FAILED &&
        operation.status !=
            SyncOperationStatus.SYNC_OPERATION_STATUS_RETRYING) {
      return 'Status is ${operation.status} (needs FAILED or RETRYING)';
    }
    if (operation.retryCount >= operation.maxRetries) {
      return 'Exceeded max retries (${operation.retryCount}/${operation.maxRetries})';
    }
    final nextRetryAt = operation.nextRetryAt.toDateTime();
    final now = DateTime.now();
    if (!now.isAfter(nextRetryAt)) {
      final waitTime = nextRetryAt.difference(now);

      return 'Next retry at $nextRetryAt (wait ${waitTime.inSeconds}s more)';
    }

    return 'Unknown reason';
  }
}
