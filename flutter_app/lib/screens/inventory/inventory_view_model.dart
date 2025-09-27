import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/categories_repository.dart';
import '../../repositories/products_repository.dart';
import '../../utils/common_functions.dart';
import '../../utils/extends_models.dart';
import '../../utils/extensions/category_extension.dart';
import '../../utils/extensions/global_product_extension.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// Enum for product status.
enum ProductInventoryStatus {
  /// In stock.
  inStock,

  /// Out of stock.
  outOfStock,

  /// Low stock.
  lowStock,
}

/// View model for inventory screen
class InventoryViewModel {
  final LoggerApp _logger = LoggerApp('InventoryViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the products subject.
  final _productsSubject =
      BehaviorSubject<UnmodifiableListView<Product>>.seeded(
        UnmodifiableListView([]),
      );

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected category subject.
  final _selectedCategorySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected status subject.
  final _selectedStatusSubject =
      BehaviorSubject<ProductInventoryStatus?>.seeded(null);

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
  BehaviorSubject<UnmodifiableListView<Product>> get productsStream =>
      _productsSubject;

  /// Gets the selected status.
  BehaviorSubject<ProductInventoryStatus?> get selectedStatus =>
      _selectedStatusSubject;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Gets the filtered products stream.
  Stream<List<Product>> get filteredProductsStream => Rx.combineLatest4(
    _productsSubject.stream,
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
                ProductInventoryStatus.inStock =>
                  p.storeProduct.stockQuantity > 0 &&
                      !isLowStock(p.storeProduct),
                ProductInventoryStatus.outOfStock =>
                  p.storeProduct.stockQuantity <= 0,
                ProductInventoryStatus.lowStock => isLowStock(p.storeProduct),
              },
            )
            .toList();
      }

      filtered.sort(
        (a, b) => b.storeProduct.createdAt.toDateTime().compareTo(
          a.storeProduct.createdAt.toDateTime(),
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
      final businessId = userPreferences.business?.refId;
      final store = userPreferences.store;
      if (businessId == null || store == null) {
        throw Exception('Business or store not found');
      }

      final storeProducts = await ProductsRepository.instance
          .getProductsByStoreId(store.refId);
      final uniqueGlobalIds = <String>{
        ...storeProducts.map((p) => p.globalProductId),
      };
      final globalFutures = uniqueGlobalIds.map(
        (id) => ProductsRepository.instance.findGlobalProducts(
          FindGlobalProductsRequest(refId: id),
        ),
      );
      final globals = await Future.wait(globalFutures);
      final globalMap = Map<String, GlobalProduct>.fromIterables(
        uniqueGlobalIds.toList(),
        globals.expand((g) => g),
      );

      final products = storeProducts
          .map((e) {
            final globalProduct = globalMap[e.globalProductId];

            return globalProduct != null
                ? Product(storeProduct: e, globalProduct: globalProduct)
                : null;
          })
          .whereType<Product>()
          .toList();
      _productsSubject.add(UnmodifiableListView(products));
      _errorSubject.add('');
    } on Exception catch (e) {
      _logger.severe('initTheData failed: $e');
      _errorSubject.add(e.toString());
    } finally {
      _logger.info('initTheData is done');
      if (!completer.isCompleted) completer.complete(true);
    }
  }

  /// Deletes a product.
  Future<bool> deleteProduct(String storeProductId) async {
    final result = await ProductsRepository.instance.deleteProduct(
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
    _productsSubject.close();
    _errorSubject.close();
    _searchQuerySubject.close();
    _selectedCategorySubject.close();
    _selectedStatusSubject.close();
  }
}
