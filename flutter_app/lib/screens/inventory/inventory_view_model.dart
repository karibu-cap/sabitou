import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/categories_repository.dart';
import '../../repositories/inventory_repository.dart';
import '../../repositories/store_products_repository.dart';
import '../../utils/extensions/category_extension.dart';
import '../../utils/extensions/global_product_extension.dart';
import '../../utils/logger.dart';

/// View model for inventory screen
class InventoryViewModel {
  final LoggerApp _logger = LoggerApp('InventoryViewModel');

  /// The store.
  final Store store;

  /// The business.
  final Business business;

  /// Gets the products subject.
  final _invLevelSubject =
      BehaviorSubject<UnmodifiableListView<InventoryLevelWithProduct>>.seeded(
        UnmodifiableListView([]),
      );

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected item subject.
  final _selectedItemSubject =
      BehaviorSubject<InventoryLevelWithProduct?>.seeded(null);

  /// Gets the transactions subject for the selected item.
  final _transactionsSubject =
      BehaviorSubject<List<InventoryTransaction>>.seeded([]);

  /// Gets the transaction filter subject.
  final _transactionFilterSubject = BehaviorSubject<TransactionType>.seeded(
    TransactionType.TXN_TYPE_SALE,
  );

  /// Gets the business categories.
  UnmodifiableListView<Category> businessCategories =
      UnmodifiableListView<Category>([]);

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<InventoryLevelWithProduct>>
  get invLevelSubject => _invLevelSubject;

  /// Gets the selected item stream.
  Stream<InventoryLevelWithProduct?> get selectedItemStream =>
      _selectedItemSubject.stream;

  /// Gets the current selected item value.
  InventoryLevelWithProduct? get currentSelectedItem =>
      _selectedItemSubject.value;

  /// Gets the transactions stream.
  Stream<List<InventoryTransaction>> get transactionsStream =>
      _transactionsSubject.stream;

  /// Gets the transaction filter stream.
  Stream<TransactionType?> get transactionFilterStream =>
      _transactionFilterSubject.stream;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Computes the filtered products synchronously based on the provided params.
  List<InventoryLevelWithProduct> getFilteredProducts({
    required String searchQuery,
    required String selectedCategory,
    required StockStatus? selectedStatus,
  }) {
    var filtered = _invLevelSubject.value.toList();

    if (searchQuery.isNotEmpty) {
      filtered = filtered
          .where(
            (p) =>
                p.globalProduct.label.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ) ||
                p.globalProduct.barCodeValue.toLowerCase().contains(
                  searchQuery.toLowerCase(),
                ),
          )
          .toList();
    }

    if (selectedCategory.isNotEmpty) {
      filtered = filtered
          .where(
            (p) => p.globalProduct.categories.any(
              (c) => c.label.toLowerCase() == selectedCategory.toLowerCase(),
            ),
          )
          .toList();
    }

    if (selectedStatus != null) {
      filtered = filtered
          .where(
            (p) => switch (selectedStatus) {
              StockStatus.STOCK_STATUS_OK =>
                p.stockStatus == StockStatus.STOCK_STATUS_OK,
              StockStatus.STOCK_STATUS_OUT_OF_STOCK =>
                p.stockStatus == StockStatus.STOCK_STATUS_OUT_OF_STOCK,
              StockStatus.STOCK_STATUS_LOW =>
                p.stockStatus == StockStatus.STOCK_STATUS_LOW,
              _ => false,
            },
          )
          .toList();
    }

    filtered.sort(
      (a, b) => b.product.createdAt.toDateTime().compareTo(
        a.product.createdAt.toDateTime(),
      ),
    );

    return filtered;
  }

  /// Constructor of [InventoryViewModel].
  InventoryViewModel({required this.store, required this.business}) {
    initTheData();
  }

  /// Initiates the partial data.
  Future<void> initPartialData({VoidCallback? onLoaded}) async {
    _logger.info('initPartialData is called');
    final businessId = business.refId;

    final categories = await CategoriesRepository.to.getCategoriesByBusinessId(
      businessId,
    );
    businessCategories = UnmodifiableListView(categories);
    _logger.info('initPartialData is done');
    onLoaded?.call();
  }

  /// Fetches global products.
  Future<void> initTheData({VoidCallback? onLoaded}) async {
    try {
      _logger.info('initTheData is called');

      final inventoryLevels = await InventoryRepository.instance
          .getStoreInventory(store.refId);

      if (!_invLevelSubject.isClosed) {
        _invLevelSubject.add(UnmodifiableListView(inventoryLevels));
      }
    } on Exception catch (e) {
      _logger.severe('Error loading inventory data: $e');
    } finally {
      if (!completer.isCompleted) {
        completer.complete(true);
      }
      onLoaded?.call();
    }
  }

  /// Deletes a product.
  Future<bool> deleteProduct(
    String storeProductId, {
    VoidCallback? onLoaded,
  }) async {
    final result = await StoreProductsRepository.instance.deleteProduct(
      DeleteStoreProductRequest(storeProductId: storeProductId),
    );
    if (result) {
      unawaited(initTheData(onLoaded: onLoaded));
    }

    return result;
  }

  /// Adjusts the inventory.
  Future<bool> adjustInventory(
    String storeId,
    String productId,
    int quantityChange,
    String reason,
    String notes, {
    VoidCallback? onLoaded,
  }) async {
    try {
      final isSucceeded = await InventoryRepository.instance.adjustInventory(
        AdjustInventoryRequest(
          storeId: storeId,
          productId: productId,
          newQuantity: quantityChange,
          reason: reason,
          notes: notes,
        ),
      );

      if (isSucceeded) {
        unawaited(initTheData(onLoaded: onLoaded));
      }

      return isSucceeded;
    } on Exception catch (e) {
      _logger.severe('Error adjusting inventory: $e');

      return false;
    }
  }

  /// Selects an inventory item and fetches its transaction history.
  Future<void> selectItem(InventoryLevelWithProduct item) async {
    _selectedItemSubject.add(item);
    await _fetchTransactions(item);
  }

  /// Clears the selected item.
  void clearSelection() {
    if (!_selectedItemSubject.isClosed) {
      _selectedItemSubject.add(null);
    }
    if (!_transactionsSubject.isClosed) {
      _transactionsSubject.add([]);
    }
    if (!_transactionFilterSubject.isClosed) {
      _transactionFilterSubject.add(TransactionType.TXN_TYPE_SALE);
    }
  }

  /// Updates the transaction filter.
  void updateTransactionFilter(TransactionType filter) {
    if (!_transactionFilterSubject.isClosed) {
      _transactionFilterSubject.add(filter);
    }
  }

  /// Fetches transaction history for the selected item.
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
      if (!_transactionsSubject.isClosed) {
        _transactionsSubject.add(response);
      }
    } on Exception catch (e) {
      _logger.severe('Error fetching transactions: $e');
      if (!_transactionsSubject.isClosed) {
        _transactionsSubject.add([]);
      }
    }
  }

  /// Selects an inventory item by product ID.
  Future<void> selectItemById(String productId) async {
    final products = _invLevelSubject.value;
    final item = products.firstWhere(
      (p) => p.product.refId == productId,
      orElse: () => throw Exception('Product not found: $productId'),
    );
    await selectItem(item);
  }

  /// Refreshes the products.
  Future<void> refreshProducts({VoidCallback? onLoaded}) async {
    await initTheData(onLoaded: onLoaded);
  }

  /// Disposes the view model.
  void dispose() {
    _invLevelSubject.close();
    _errorSubject.close();
    _selectedItemSubject.close();
    _transactionsSubject.close();
    _transactionFilterSubject.close();
  }
}

/// The dashboard data model.
class InventoryData {
  /// The total products.
  final int totalProducts;

  /// The low stock items count.
  final int lowStockItemsCount;

  /// The total sales.
  final double totalSales;

  /// Recent Activity
  final List<InventoryLevelWithProduct> inventoryLevels;

  /// Constructs a new [InventoryData].
  InventoryData({
    required this.totalProducts,
    required this.lowStockItemsCount,
    required this.inventoryLevels,
    required this.totalSales,
  });
}
