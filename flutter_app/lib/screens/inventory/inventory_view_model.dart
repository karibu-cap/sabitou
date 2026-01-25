import 'dart:async';
import 'dart:collection';

import 'package:clock/clock.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/categories_repository.dart';
import '../../repositories/inventory_repository.dart';
import '../../repositories/reports_repository.dart';
import '../../repositories/store_products_repository.dart';
import '../../utils/extensions/category_extension.dart';
import '../../utils/extensions/global_product_extension.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for inventory screen
class InventoryViewModel {
  final LoggerApp _logger = LoggerApp('InventoryViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the products subject.
  final _invLevelSubject =
      BehaviorSubject<UnmodifiableListView<InventoryLevelWithProduct>>.seeded(
        UnmodifiableListView([]),
      );

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected category subject.
  final _selectedCategorySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected status subject.
  final _selectedStatusSubject = BehaviorSubject<StockStatus?>.seeded(null);

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

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected category.
  BehaviorSubject<String> get selectedCategory => _selectedCategorySubject;

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<InventoryLevelWithProduct>>
  get invLevelSubject => _invLevelSubject;

  /// Gets the selected status.
  BehaviorSubject<StockStatus?> get selectedStatus => _selectedStatusSubject;

  /// Gets the selected item stream.
  Stream<InventoryLevelWithProduct?> get selectedItemStream =>
      _selectedItemSubject.stream;

  /// Gets the transactions stream.
  Stream<List<InventoryTransaction>> get transactionsStream =>
      _transactionsSubject.stream;

  /// Gets the transaction filter stream.
  Stream<TransactionType?> get transactionFilterStream =>
      _transactionFilterSubject.stream;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Gets the filtered products stream.
  Stream<List<InventoryLevelWithProduct>> get filteredProductsStream =>
      Rx.combineLatest4(
        _invLevelSubject.stream,
        _searchQuerySubject.stream,
        _selectedCategorySubject.stream,
        _selectedStatusSubject.stream,
        (products, searchQuery, category, status) {
          var filtered = products.toList();
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
          if (category.isNotEmpty) {
            filtered = filtered
                .where(
                  (p) => p.globalProduct.categories.any(
                    (c) => c.label.toLowerCase() == category.toLowerCase(),
                  ),
                )
                .toList();
          }

          if (status != null) {
            filtered = filtered
                .where(
                  (p) => switch (status) {
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
        },
      );

  /// Constructor of [InventoryViewModel].
  InventoryViewModel() {
    initTheData();
    initPartialData();
  }

  /// Initiates the partial data.
  Future<void> initPartialData() async {
    _logger.info('initPartialData is called');
    final businessId = userPreferences.business?.refId;
    if (businessId == null) {
      return;
    }

    final categories = await CategoriesRepository.to.getCategoriesByBusinessId(
      businessId,
    );
    businessCategories = UnmodifiableListView(categories);
    _logger.info('initPartialData is done');
  }

  /// Fetches global products.
  Future<void> initTheData() async {
    try {
      _logger.info('initTheData is called');
      final store = userPreferences.store;
      if (store == null) {
        throw Exception('Store not found');
      }

      // Execute all calls in parallel for better performance
      final results = await Future.wait([
        InventoryRepository.instance.getLowStockItems(store.refId),
        ReportsRepository.instance.getSalesByPeriod(
          storeId: store.refId,
          startDate: store.hasCreatedAt()
              ? store.createdAt.toDateTime()
              : clock.now(),
          endDate: clock.now().add(const Duration(days: 1)),
        ),
        InventoryRepository.instance.getStoreInventory(store.refId),
      ]);

      final inventoryLevels = results[2] as List<InventoryLevelWithProduct>;

      _invLevelSubject.add(UnmodifiableListView(inventoryLevels));
    } on Exception catch (e) {
      _logger.severe('Error loading inventory data: $e');
    } finally {
      if (!completer.isCompleted) {
        completer.complete(true);
      }
    }
  }

  /// Deletes a product.
  Future<bool> deleteProduct(String storeProductId) async {
    final result = await StoreProductsRepository.instance.deleteProduct(
      DeleteStoreProductRequest(storeProductId: storeProductId),
    );
    if (result) {
      unawaited(initTheData());
    }

    return result;
  }

  /// Adjusts the inventory.
  Future<bool> adjustInventory(
    String storeId,
    String productId,
    int quantityChange,
    String reason,
    String notes,
  ) async {
    try {
      final response = await InventoryRepository.instance.adjustInventory(
        AdjustInventoryRequest(
          storeId: storeId,
          productId: productId,
          newQuantity: quantityChange,
          reason: reason,
          notes: notes,
        ),
      );

      if (response.success) {
        unawaited(initTheData());
      }

      return response.success;
    } on Exception catch (e) {
      _logger.severe('Error adjusting inventory: $e');

      return false;
    }
  }

  /// Updates the search query.
  void updateSearchQuery(String query) {
    _searchQuerySubject.add(query);
  }

  /// Updates the selected category.
  void updateSelectedCategory(String category) {
    _selectedCategorySubject.add(category);
  }

  /// Selects an inventory item and fetches its transaction history.
  Future<void> selectItem(InventoryLevelWithProduct item) async {
    _selectedItemSubject.add(item);
    await _fetchTransactions(item);
  }

  /// Clears the selected item.
  void clearSelection() {
    _selectedItemSubject.add(null);
    _transactionsSubject.add([]);
    _transactionFilterSubject.add(TransactionType.TXN_TYPE_SALE);
  }

  /// Updates the transaction filter.
  void updateTransactionFilter(TransactionType filter) {
    _transactionFilterSubject.add(filter);
  }

  /// Fetches transaction history for the selected item.
  Future<void> _fetchTransactions(InventoryLevelWithProduct item) async {
    try {
      final store = userPreferences.store;
      if (store == null) {
        _logger.warning('Store not found when fetching transactions');

        return;
      }

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

      _transactionsSubject.add(response.transactions);
    } on Exception catch (e) {
      _logger.severe('Error fetching transactions: $e');
      _transactionsSubject.add([]);
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
  Future<void> refreshProducts() async {
    await initTheData();
  }

  /// Disposes the view model.
  void dispose() {
    _invLevelSubject.close();
    _errorSubject.close();
    _searchQuerySubject.close();
    _selectedCategorySubject.close();
    _selectedStatusSubject.close();
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
