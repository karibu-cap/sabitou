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

  /// Gets the business categories.
  UnmodifiableListView<Category> businessCategories =
      UnmodifiableListView<Category>([]);

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// InventoryData data.
  InventoryData stats = InventoryData(
    totalProducts: 0,
    lowStockItemsCount: 0,
    inventoryLevels: [],
    totalSales: 0,
  );

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected category.
  BehaviorSubject<String> get selectedCategory => _selectedCategorySubject;

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<InventoryLevelWithProduct>>
  get invLevelSubject => _invLevelSubject;

  /// Gets the selected status.
  BehaviorSubject<StockStatus?> get selectedStatus => _selectedStatusSubject;

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
  Future<InventoryData> initTheData() async {
    try {
      _logger.info('initTheData is called');
      final businessId = userPreferences.business?.refId;
      final store = userPreferences.store;
      if (businessId == null || store == null) {
        throw Exception('Business or store not found');
      }

      // Execute all calls in parallel for better performance
      final results = await Future.wait([
        StoreProductsRepository.instance.findStoreProducts(
          FindStoreProductsRequest(storeId: store.refId),
        ),
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

      final totalProducts =
          results.first as List<StoreProductWithGlobalProduct>;
      final lowStockItems = results[1] as List<InventoryLevelWithProduct>;
      final inventoryLevels = results[3] as List<InventoryLevelWithProduct>;
      final sales = results[2] as GetSalesReportResponse;

      final newStats = InventoryData(
        totalProducts: totalProducts.length,
        lowStockItemsCount: lowStockItems.length,
        inventoryLevels: inventoryLevels,
        totalSales: sales.totalSalesAmount.toDouble(),
      );
      stats = newStats;

      _invLevelSubject.add(UnmodifiableListView(inventoryLevels));

      return stats;
    } catch (e) {
      print('Error loading inventory data: $e');

      return stats;
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

  /// Updates the search query.
  void updateSearchQuery(String query) {
    _searchQuerySubject.add(query);
  }

  /// Updates the selected category.
  void updateSelectedCategory(String category) {
    _selectedCategorySubject.add(category);
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
