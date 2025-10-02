import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/store_products_repository.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for point of sales screen
final class PointOfSaleViewModel {
  final LoggerApp _logger = LoggerApp('PointOfSaleViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the filtered products stream.
  Stream<List<StoreProductWithGlobalProduct>> get filteredProductsStream =>
      _searchQuerySubject.stream.switchMap((searchQuery) async* {
        if (searchQuery.isNotEmpty) {
          final currentStore = userPreferences.store;
          if (currentStore == null) {
            throw Exception('Store not found');
          }
          try {
            final response = await StoreProductsRepository.instance
                .searchProducts(
                  SearchStoreProductsRequest(
                    searchQuery: searchQuery,
                    storeId: currentStore.refId,
                  ),
                );

            final storeProducts = response.products;
            yield storeProducts;
          } on Exception catch (e) {
            _logger.warning('Search failed: $e');
            yield <StoreProductWithGlobalProduct>[];
          }
        } else {
          yield <StoreProductWithGlobalProduct>[];
        }
      });

  /// Constructor of [PointOfSaleViewModel].
  PointOfSaleViewModel() {
    // initTheData();
  }

  // /// Fetches global products.
  // Future<void> initTheData() async {
  //   try {
  //     _logger.info('initTheData is called');
  //     final businessId = userPreferences.business?.refId;
  //     final store = userPreferences.store;
  //     if (businessId == null || store == null) {
  //       throw Exception('Business or store not found');
  //     }

  //     final storeProducts = await ProductsRepository.instance
  //         .getProductsByStoreId(store.refId);
  //     final uniqueGlobalIds = <String>{
  //       ...storeProducts.map((p) => p.globalProductId),
  //     };
  //     final globalFutures = uniqueGlobalIds.map(
  //       (id) => ProductsRepository.instance.findGlobalProducts(
  //         FindGlobalProductsRequest(refId: id),
  //       ),
  //     );
  //     final globals = await Future.wait(globalFutures);
  //     final globalMap = Map<String, GlobalProduct>.fromIterables(
  //       uniqueGlobalIds.toList(),
  //       globals.expand((g) => g),
  //     );

  //     final products = storeProducts
  //         .map((e) {
  //           final globalProduct = globalMap[e.globalProductId];

  //           return globalProduct != null
  //               ? Product(storeProduct: e, globalProduct: globalProduct)
  //               : null;
  //         })
  //         .whereType<Product>()
  //         .toList();
  //     _productsSubject.add(products);
  //   } on Exception catch (e) {
  //     _logger.severe('initTheData failed: $e');
  //   } finally {
  //     _logger.info('initTheData is done');
  //   }
  // }

  /// Disposes the view model.
  void dispose() {
    _searchQuerySubject.close();
  }
}
