import 'dart:async';

import 'package:clock/clock.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/inventory_repository.dart';
import '../../../repositories/store_products_repository.dart';
import '../../../utils/logger.dart';

/// View model for inventory detail screen.
class InventoryDetailViewModel {
  final LoggerApp _logger = LoggerApp('InventoryDetailViewModel');

  /// The current store.
  final Store store;

  /// The product ID to fetch.
  final String productId;

  /// Gets the inventory item subject.
  final _inventoryItemSubject =
      BehaviorSubject<InventoryLevelWithProduct?>.seeded(null);

  /// Gets the transactions subject for the selected item.
  final _transactionsSubject =
      BehaviorSubject<List<InventoryTransaction>>.seeded([]);

  /// Gets the transaction filter subject.
  final _transactionFilterSubject = BehaviorSubject<TransactionType>.seeded(
    TransactionType.TXN_TYPE_SALE,
  );

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the loading subject.
  final _loadingSubject = BehaviorSubject<bool>.seeded(true);

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the inventory item stream.
  Stream<InventoryLevelWithProduct?> get inventoryItemStream =>
      _inventoryItemSubject.stream;

  /// Gets the transactions stream.
  Stream<List<InventoryTransaction>> get transactionsStream =>
      _transactionsSubject.stream;

  /// Gets the transaction filter stream.
  Stream<TransactionType?> get transactionFilterStream =>
      _transactionFilterSubject.stream;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Constructor of [InventoryDetailViewModel].
  InventoryDetailViewModel({required this.productId, required this.store}) {
    _initData();
  }

  /// Initializes the data by fetching the specific product.
  Future<void> _initData() async {
    try {
      _loadingSubject.add(true);
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
        stockStatus: (levelReps?.quantityAvailable ?? 0) == 0
            ? StockStatus.STOCK_STATUS_OUT_OF_STOCK
            : (levelReps?.quantityAvailable ?? 0) >
                  ((productResp?.storeProduct.reorderPoint ?? 0) > 0
                      ? (productResp?.storeProduct.reorderPoint ?? 0)
                      : levelReps?.minThreshold ?? 0)
            ? StockStatus.STOCK_STATUS_OK
            : StockStatus.STOCK_STATUS_LOW,
        stockValue:
            ((levelReps?.quantityAvailable ?? 0) *
                    (productResp?.storeProduct.salePrice ?? 0))
                .truncate(),
      );

      _inventoryItemSubject.add(item);

      /// Fetch transactions for this item.
      await _fetchTransactions(item);

      _logger.info('Product details loaded successfully');
    } on Exception catch (e) {
      _logger.severe('Error loading product details: $e');
      _errorSubject.add(e.toString());
    } finally {
      _loadingSubject.add(false);
      if (!completer.isCompleted) {
        completer.complete(true);
      }
    }
  }

  /// Fetches transaction history for the item.
  Future<void> _fetchTransactions(InventoryLevelWithProduct item) async {
    try {
      final response = await InventoryRepository.instance
          .getInventoryTransactionHistory(
            GetInventoryTransactionHistoryRequest(
              storeId: store.refId,
              productId: item.product.refId,
              startDate: Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 365)),
              ),
              endDate: Timestamp.fromDateTime(
                clock.now().add(const Duration(days: 1)),
              ),
              pageSize: 100,
              pageNumber: 1,
            ),
          );
      _transactionsSubject.add(response);
    } on Exception catch (e) {
      _logger.severe('Error fetching transactions: $e');
      _transactionsSubject.add([]);
    }
  }

  /// Updates the transaction filter.
  void updateTransactionFilter(TransactionType filter) {
    _transactionFilterSubject.add(filter);
  }

  /// Refreshes the product data.
  Future<void> refresh() async {
    await _initData();
  }

  /// Disposes the view model.
  void dispose() {
    _inventoryItemSubject.close();
    _transactionsSubject.close();
    _transactionFilterSubject.close();
    _errorSubject.close();
    _loadingSubject.close();
  }
}
