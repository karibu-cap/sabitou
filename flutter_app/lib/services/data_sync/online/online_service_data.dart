import 'dart:async';
import 'dart:core';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/store_products_repository.dart';
import '../../../utils/logger.dart';
import '../../hive_database/hive_database.dart';
import '../../network_status_provider/network_status_provider.dart';

/// Fetch all data operation with continuous stream support.
class OnlineServiceData {
  final _logger = LoggerApp('OnlineServiceData');

  /// The hive database.
  final hiveDatabase = GetIt.I.get<HiveDatabase>();

  /// The network status provider.
  final networkStatusProvider = GetIt.I.get<NetworkStatusProvider>();

  /// The product repository.
  final StoreProductsRepository productsRepository;

  /// Stream controller for store ID changes.
  final _storeIdController = BehaviorSubject<String?>();

  /// Stream subscription for connectivity and data sync.
  StreamSubscription<void>? _syncSubscription;

  /// Current store ID.
  String? _currentStoreId;

  /// Whether the service is currently active.
  bool _isActive = false;

  /// Contructs a new [OnlineServiceData].
  OnlineServiceData({required connect.Transport transport})
    : productsRepository = StoreProductsRepository(transport: transport);

  /// Gets the current store ID.
  String? get currentStoreId => _currentStoreId;

  /// Gets whether the service is currently active.
  bool get isActive => _isActive;

  /// Stream of store ID changes.
  Stream<String?> get storeIdStream => _storeIdController.stream;

  /// Fetches and saves global products.
  Future<void> fetchAndSaveGlobalProducts(String storeId) async {
    try {
      int totalFetched = 0;
      await for (final products in productsRepository.streamGlobalProducts(
        StreamGlobalProductsRequest()..storeId = storeId,
      )) {
        for (final product in products) {
          await hiveDatabase.globalProducts.put(product.refId, product);
        }
        totalFetched += products.length;
      }
      _logger.info('Synced $totalFetched global products');
    } on Exception catch (e) {
      _logger.severe('Failed to sync global products: $e');
    }
  }

  /// Fetches and saves store products.
  Future<void> fetchAndSaveStoreProducts(String storeId) async {
    try {
      int totalFetched = 0;
      await for (final products in productsRepository.streamStoreProducts(
        StreamStoreProductsRequest()..storeId = storeId,
      )) {
        for (final product in products) {
          await hiveDatabase.storeProducts.put(product.refId, product);
        }
        totalFetched += products.length;
      }
      _logger.info('Synced $totalFetched store products for $storeId');
    } on Exception catch (e) {
      _logger.severe('Failed to sync store products: $e');
    }
  }

  /// Starts continuous data synchronization.
  Future<void> startContinuousSync({String? initialStoreId}) async {
    if (_isActive) {
      stopContinuousSync();
    }

    _isActive = true;
    _currentStoreId = initialStoreId;
    _logger.info('Starting continuous sync for store: $initialStoreId');

    if (initialStoreId != null) {
      _storeIdController.add(initialStoreId);
    }

    // Listen to connectivity and store changes
    _syncSubscription =
        Rx.combineLatest2<bool, String?, void>(
              networkStatusProvider.connectivityStream,
              _storeIdController.stream.where((storeId) => storeId != null),
              (isConnected, storeId) => null,
            )
            .where((event) => _isActive)
            .asyncMap((event) async {
              final isConnected = await networkStatusProvider
                  .checkConnectivity();
              final storeId = _storeIdController.valueOrNull;

              if (isConnected && storeId != null) {
                _logger.info('Syncing data for store: $storeId');
                await _performDataSync(storeId);
              }
            })
            .listen(
              null,
              onError: (error) => _logger.severe('Sync error: $error'),
            );
  }

  /// Updates the store ID for data synchronization.
  void updateStoreId(String storeId) {
    if (_currentStoreId != storeId) {
      _logger.info('Updating store ID from $_currentStoreId to $storeId');
      _currentStoreId = storeId;
      _storeIdController.add(storeId);
    }
  }

  /// Stops continuous data synchronization and cleans up resources.
  void stopContinuousSync() {
    _isActive = false;
    _syncSubscription?.cancel();
    _syncSubscription = null;
    _logger.info('Continuous data sync stopped');
  }

  /// Disposes all resources.
  void dispose() {
    stopContinuousSync();
    _storeIdController.close();
    _logger.info('FetchAllData disposed');
  }

  /// Performs the actual data synchronization.
  Future<void> _performDataSync(String storeId) async {
    try {
      // Sync global products for the store
      await fetchAndSaveGlobalProducts(storeId);

      // Then sync store-specific products
      await fetchAndSaveStoreProducts(storeId);

      _logger.info('Data sync completed successfully for store: $storeId');
    } on Exception catch (e) {
      _logger.severe('Data sync failed for store $storeId: $e');
      rethrow;
    }
  }

  /// Manual data initialization (one-time sync).
  Future<void> manualSync(String storeId) async {
    try {
      _logger.info('Manual data initialization for store: $storeId');
      await _performDataSync(storeId);
    } on Exception catch (e) {
      _logger.severe('manualSync Error: $e');
      rethrow;
    }
  }
}
