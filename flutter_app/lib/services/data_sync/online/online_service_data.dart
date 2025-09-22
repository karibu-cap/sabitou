import 'dart:async';
import 'dart:core';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

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

  /// The product service client.
  final ProductServiceClient productServiceClient;

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
    : productServiceClient = ProductServiceClient(transport);

  /// Gets the current store ID.
  String? get currentStoreId => _currentStoreId;

  /// Gets whether the service is currently active.
  bool get isActive => _isActive;

  /// Stream of store ID changes.
  Stream<String?> get storeIdStream => _storeIdController.stream;

  /// Fetches and saves global product.
  Future<void> fetchAndSaveGlobalProducts() async {
    try {
      await for (final response in productServiceClient.streamGlobalProducts(
        StreamGlobalProductsRequest(),
      )) {
        if (response.products.isNotEmpty) {
          await hiveDatabase.globalProducts.clear();
        }
        for (final product in response.products) {
          await hiveDatabase.globalProducts.put(product.refId, product);
        }
      }
    } on Exception catch (e) {
      _logger.severe('fetchAndSaveGlobalProducts Error: $e');

      return;
    }
  }

  /// Fetches and saves store product.
  Future<void> fetchAndSaveStoreProducts(String storeId) async {
    try {
      await for (final response in productServiceClient.streamStoreProducts(
        StreamStoreProductsRequest()..storeId = storeId,
      )) {
        if (response.products.isNotEmpty) {
          await hiveDatabase.storeProducts.clear();
          final box = hiveDatabase.storeProducts;
          final keysToDelete = <String>[];

          // Find all products for this store to delete
          for (final entry in box.toMap().entries) {
            if (entry.value.storeId == storeId) {
              keysToDelete.add(entry.key as String);
            }
          }

          // Delete existing products for this store
          await box.deleteAll(keysToDelete);
        }
        for (final product in response.products) {
          await hiveDatabase.storeProducts.put(product.refId, product);
        }
      }
    } on Exception catch (e) {
      _logger.severe('fetchAndSaveStoreProducts Error: $e');

      return;
    }
  }

  /// Starts continuous data synchronization.
  /// This method will listen to network connectivity and sync data automatically.
  void startContinuousSync({String? initialStoreId}) {
    if (_isActive) {
      _logger.warning(
        'Continuous sync already active. Stopping previous sync.',
      );
      stopContinuousSync();
    }

    _isActive = true;
    _currentStoreId = initialStoreId;

    if (initialStoreId != null) {
      _storeIdController.add(initialStoreId);
    }

    // Combine connectivity stream with store ID stream
    _syncSubscription =
        Rx.combineLatest2<bool, String?, void>(
              networkStatusProvider.connectivityStream,
              _storeIdController.stream.where((storeId) => storeId != null),
              (isConnected, storeId) => null,
            )
            .where((event) => _isActive) // Only process if service is active
            .asyncMap((event) async {
              final isConnected =
                  await networkStatusProvider.connectivityStream.first;
              final storeId = _storeIdController.valueOrNull;

              if (isConnected && storeId != null) {
                _logger.info(
                  'Network connected. Syncing data for store: $storeId',
                );
                await _performDataSync(storeId);
              } else {
                _logger.info(
                  'Network disconnected or no store selected. Skipping sync.',
                );
              }
            })
            .listen(
              (event) {
                _logger.info('Continuous sync event success: $event');
              },
              onError: (error) {
                _logger.severe('Continuous sync error: $error');
              },
            );

    _logger.info('Continuous data sync started');
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
      // Sync global products first
      await fetchAndSaveGlobalProducts();

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
