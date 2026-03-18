import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/inventory_repository.dart';
import '../../../repositories/store_products_repository.dart';
import '../../../utils/logger.dart';
import '../../../utils/user_preference.dart';

/// View model for inventory adjustment screen.
class InventoryAdjustmentViewModel {
  final LoggerApp _logger = LoggerApp('InventoryAdjustmentViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// The product ID to fetch.
  final String productId;

  /// The current store.
  final Store store;

  /// Gets the inventory item subject.
  InventoryLevelWithProduct? _inventoryItemSubject;

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the inventory item stream.
  InventoryLevelWithProduct? get inventoryItemStream => _inventoryItemSubject;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Constructor of [InventoryAdjustmentViewModel].
  InventoryAdjustmentViewModel({required this.productId, required this.store}) {
    _initData();
  }

  /// Initializes the data by fetching the specific product.
  Future<void> _initData() async {
    try {
      _logger.info('Fetching product details for: $productId');

      final inventoryLevels = await InventoryRepository.instance
          .getProductInventoryLevels(productId, store.refId);

      /// Fetch the specific inventory item.
      final storeProduct = await StoreProductsRepository.instance
          .getStoreProduct(GetStoreProductRequest(storeProductId: productId));

      final levelReps = inventoryLevels;

      final productResp = storeProduct;

      final item = InventoryLevelWithProduct(
        level: levelReps,
        product: productResp?.storeProduct,
        globalProduct: productResp?.globalProduct,
        stockStatus: levelReps?.quantityAvailable == 0
            ? StockStatus.STOCK_STATUS_OUT_OF_STOCK
            : (levelReps?.quantityAvailable ?? 0) >
                  ((productResp?.storeProduct.reorderPoint ?? 0) > 0
                      ? (productResp?.storeProduct.reorderPoint ?? 0)
                      : (levelReps?.minThreshold ?? 0))
            ? StockStatus.STOCK_STATUS_OK
            : StockStatus.STOCK_STATUS_LOW,
        stockValue:
            ((levelReps?.quantityAvailable ?? 0) *
                    (productResp?.storeProduct.salePrice ?? 0))
                .truncate(),
      );

      _inventoryItemSubject = item;

      _logger.info('Product details loaded successfully');
    } on Exception catch (e) {
      _logger.severe('Error loading product details: $e');
      _errorSubject.add(e.toString());
    } finally {
      if (!completer.isCompleted) {
        completer.complete(true);
      }
    }
  }

  /// Adjusts the inventory.
  Future<bool> adjustInventory({
    required String storeId,
    required String productId,
    required int quantityChange,
    required String reason,
    String? notes,
    String? batchId,
  }) async {
    try {
      await InventoryRepository.instance.adjustInventory(
        AdjustInventoryRequest(
          storeId: storeId,
          productId: productId,
          newQuantity: quantityChange,
          batchId: batchId,
          reason: reason,
          notes: notes,
        ),
      );

      // Refresh data after adjustment
      unawaited(_initData());

      return true;
    } on Exception catch (e) {
      _logger.severe('Error adjusting inventory: $e');
      _errorSubject.add(e.toString());

      return false;
    }
  }

  /// Disposes the view model.
  void dispose() {
    _errorSubject.close();
  }
}
