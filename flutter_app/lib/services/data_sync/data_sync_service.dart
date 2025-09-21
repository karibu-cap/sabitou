import 'package:connectrpc/connect.dart' as connect;

import '../../entities/sync_operation_isar.dart';
import '../../utils/logger.dart';
import 'offline/offline_service_data.dart';
import 'online/online_service_data.dart';

/// The data synchronization service (online and offline)
///
/// This service coordinates:
/// - Online synchronization via OnlineServiceData
/// - Offline management via OfflineServiceData
/// - Automatic transition between modes
class DataSyncIsarService {
  final _logger = LoggerApp('DataSyncIsarService');

  /// The online synchronization service
  OnlineServiceData? _onlineServiceData;

  /// The offline management service
  OfflineServiceData? _offlineServiceData;

  /// Transport for RPC connections
  final connect.Transport _transport;

  /// Current store ID
  String? get currentStoreId => _onlineServiceData?.currentStoreId;

  /// Whether the service is active
  bool get isActive => _onlineServiceData?.isActive ?? false;

  /// Stream of store ID changes
  Stream<String?> get storeIdStream =>
      _onlineServiceData?.storeIdStream ?? const Stream.empty();

  /// Stream of pending offline operations
  Stream<List<SyncOperationIsar>> get offlineOperationsStream =>
      _offlineServiceData?.operationsStream ?? const Stream.empty();

  /// Stream of offline synchronization status
  Stream<bool> get offlineSyncStatusStream =>
      _offlineServiceData?.syncStatusStream ?? const Stream.empty();

  /// Number of pending offline operations
  int get pendingOfflineOperations =>
      _offlineServiceData?.pendingOperationsCount ?? 0;

  /// Constructs a new [DataSyncIsarService].
  DataSyncIsarService({required connect.Transport transport})
    : _transport = transport;

  /// Starts the continuous data sync.
  void startSync({String? initialStoreId}) {
    // Dispose the old instance if it exists
    _onlineServiceData?.dispose();
    _offlineServiceData?.dispose();

    // Create a new instance
    _onlineServiceData = OnlineServiceData(transport: _transport);
    _offlineServiceData = OfflineServiceData(transport: _transport);

    // Start the continuous sync
    _onlineServiceData?.startContinuousSync(initialStoreId: initialStoreId);

    _logger.info('Data sync service started with store: $initialStoreId');
  }

  /// Changes the store ID for the sync.
  void changeStore(String newStoreId) {
    if (_onlineServiceData != null && _onlineServiceData?.isActive == true) {
      _onlineServiceData?.updateStoreId(newStoreId);
      _logger.info('Store changed to: $newStoreId');
    } else {
      _logger.warning(
        'No active sync service. Starting new sync with store: $newStoreId',
      );
      startSync(initialStoreId: newStoreId);
    }
  }

  /// Stops the continuous sync.
  void stopSync() {
    _onlineServiceData?.stopContinuousSync();
    _logger.info('Data sync service stopped');
  }

  /// Performs a manual sync.
  Future<void> manualSync(String storeId) async {
    if (_onlineServiceData != null && _onlineServiceData?.isActive == true) {
      await _onlineServiceData?.manualSync(storeId);
    } else {
      _logger.warning('No fetch data instance available for manual sync');
    }
  }

  /// Disposes all resources.
  void dispose() {
    _onlineServiceData?.dispose();
    _offlineServiceData?.dispose();
    _onlineServiceData = null;
    _offlineServiceData = null;
    _logger.info('Data sync service disposed');
  }
}
