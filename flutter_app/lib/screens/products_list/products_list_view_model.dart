import 'dart:async';
import 'dart:collection';
import 'dart:ui';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/categories_repository.dart';
import '../../repositories/store_products_repository.dart';
import '../../utils/extensions/category_extension.dart';
import '../../utils/extensions/global_product_extension.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for products list screen
class ProductsListViewModel {
  final LoggerApp _logger = LoggerApp('ProductsListViewModel');

  bool _isDisposed = false;

  /// The current buisiness.
  final Business buisiness;

  /// The current store.
  final Store store;

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the products subject.
  final _productsSubject =
      BehaviorSubject<UnmodifiableListView<CustomProduct>>.seeded(
        UnmodifiableListView([]),
      );

  /// Gets the business categories.
  UnmodifiableListView<Category> businessCategories =
      UnmodifiableListView<Category>([]);

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<CustomProduct>> get productsSubject =>
      _productsSubject;

  /// Returns the filtered product list synchronously based on the provided
  /// filter values.
  List<CustomProduct> getFilteredProducts({
    required String searchQuery,
    required String selectedCategory,
    required ProductStatus? selectedStatus,
  }) {
    var filtered = _productsSubject.value.toList();

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
          .where((p) => p.storeProduct.status == selectedStatus)
          .toList();
    }

    filtered.sort(
      (a, b) => b.storeProduct.createdAt.toDateTime().compareTo(
        a.storeProduct.createdAt.toDateTime(),
      ),
    );

    return filtered;
  }

  /// Constructor of [ProductsListViewModel].
  ProductsListViewModel({required this.store, required this.buisiness}) {
    initTheData();
  }

  /// Fetches global products.
  Future<void> initTheData({VoidCallback? onLoaded}) async {
    try {
      _logger.info('initTheData is called');

      StoreProductsRepository.instance.streamStoreProducts(store.refId).listen((
        products,
      ) {
        if (_isDisposed) return;
        _productsSubject.add(UnmodifiableListView(products));
      });

      final categories = await CategoriesRepository.instance
          .getCategoriesByBusinessId(buisiness.refId);
      businessCategories = UnmodifiableListView(categories);

      if (_isDisposed) return;
    } on Exception catch (e) {
      _logger.severe('Error loading inventory data: $e');
    } finally {
      if (!completer.isCompleted) {
        completer.complete(true);
      }
      onLoaded?.call();
    }
  }

  /// Updates the product status.
  Future<bool> updateProductStatus(
    String storeProductId,
    ProductStatus status, {
    VoidCallback? onLoaded,
  }) async {
    final product = await StoreProductsRepository.instance.getStoreProduct(
      storeProductId,
    );
    if (product == null) {
      return false;
    }
    product.storeProduct.status = status;

    final result = await StoreProductsRepository.instance.updateProduct(
      storeProduct: product.storeProduct,
    );
    if (result) {
      unawaited(initTheData(onLoaded: onLoaded));
    }

    return result;
  }

  /// Refreshes the products.
  Future<void> refreshProducts({VoidCallback? onLoaded}) async {
    await initTheData(onLoaded: onLoaded);
  }

  /// Disposes the view model.
  void dispose() {
    _isDisposed = true;
    _productsSubject.close();
  }
}
