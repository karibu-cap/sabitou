// import 'package:flutter/foundation.dart';
// import 'package:get_it/get_it.dart';

// import '../../utils/logger.dart';
// import '../auth/auth_api_client.dart';
// import '../auth/token_service.dart';
// import '../powersync/powersync_service.dart';

// /// Service to manage PowerSync connection state and provide sync controls.
// class SyncControlService extends ChangeNotifier {
//   static final SyncControlService instance = GetIt.I.get<SyncControlService>();

//   final _logger = LoggerApp('SyncControlService');
//   final PowerSyncService _powerSyncService;
//   final AuthApiClient _authApiClient;

//   bool _isSyncing = false;
//   bool _isReconnecting = false;

//   SyncControlService({
//     required PowerSyncService powerSyncService,
//     required AuthApiClient authApiClient,
//   })  : _powerSyncService = powerSyncService,
//         _authApiClient = authApiClient;

//   /// Current sync state
//   bool get isSyncing => _isSyncing;
//   bool get isReconnecting => _isReconnecting;

//   /// Stops PowerSync synchronization by disconnecting the sync stream
//   Future<void> stopSync() async {
//     try {
//       _logger.log('Stopping PowerSync synchronization...');
//       _isSyncing = false;
//       notifyListeners();

//       await _powerSyncService.db.disconnect();
//       _logger.log('PowerSync synchronization stopped');
//     } catch (e) {
//       _logger.severe('Failed to stop sync: $e');
//       rethrow;
//     }
//   }

//   /// Resynchronizes the database by reconnecting PowerSync
//   Future<void> resyncDatabase() async {
//     try {
//       _logger.log('Resynchronizing database...');
//       _isReconnecting = true;
//       notifyListeners();

//       // Get current user ID to maintain the same database
//       final userId = await TokenService.instance.getUserId();

//       // Close current connection and reopen with sync
//       await _powerSyncService.close();
//       await _powerSyncService.initialize(userId: userId);

//       _isSyncing = true;
//       _isReconnecting = false;
//       notifyListeners();

//       _logger.log('Database resynchronization completed');
//     } catch (e) {
//       _logger.severe('Failed to resync database: $e');
//       _isReconnecting = false;
//       notifyListeners();
//       rethrow;
//     }
//   }

//   /// Gets the current sync connection status
//   Future<bool> get isConnected async {
//     try {
//       final db = _powerSyncService.db;

//       return true;
//     } catch (e) {
//       _logger.warning('Failed to get sync status: $e');

//       return false;
//     }
//   }

//   /// Initializes the sync control service
//   Future<void> initialize() async {
//     try {
//       _isSyncing = await isConnected;
//       notifyListeners();
//       _logger.log('SyncControlService initialized. Sync status: $_isSyncing');
//     } catch (e) {
//       _logger.severe('Failed to initialize SyncControlService: $e');
//     }
//   }
// }
