import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/products_repository.dart';
import '../../utils/extends_models.dart';
import '../../utils/extensions/global_product_extension.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for point of sales screen
final class NewOrderViewModel {
  final LoggerApp _logger = LoggerApp('NewOrderViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the list of stores products.
  final _productsSubject = BehaviorSubject<List<Product>>.seeded([]);

  /// Gets the list of stores products.
  BehaviorSubject<List<Product>> get productsSubject => _productsSubject;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the filtered products stream.
  Stream<List<Product>> get filteredProductsStream => Rx.combineLatest2(
    _productsSubject.stream,
    _searchQuerySubject.stream,
    (products, searchQuery) {
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

      return filtered;
    },
  );

  /// Constructor of [NewOrderViewModel].
  NewOrderViewModel() {
    initTheData();
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
      _productsSubject.add(products);
    } on Exception catch (e) {
      _logger.severe('initTheData failed: $e');
    } finally {
      _logger.info('initTheData is done');
    }
  }

  /// Disposes the view model.
  void dispose() {
    _productsSubject.close();
    _searchQuerySubject.close();
  }
}
