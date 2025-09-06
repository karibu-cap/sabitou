import 'dart:async';
import 'dart:collection';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/categories_repository.dart';
import '../../repositories/products_repository.dart';
import '../../utils/extends_models.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// Provider for managing inventory UI state
class InventoryViewModel {
  final LoggerApp _logger = LoggerApp('InventoryViewModel');

  /// The user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Error message if any.
  String error = '';

  /// The filtered products.
  List<Product> filteredProducts = [];

  /// The list of products.
  UnmodifiableListView<Product> products = UnmodifiableListView<Product>([]);

  /// The app global product.
  UnmodifiableListView<GlobalProduct> globalProducts =
      UnmodifiableListView<GlobalProduct>([]);

  /// The list of business categories.
  UnmodifiableListView<Category> businessCategories =
      UnmodifiableListView<Category>([]);

  /// Completer for loading state.
  final Completer<bool> completer = Completer<bool>();

  /// Constructs of new [InventoryViewModel].
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

    final _businessCategories = await CategoriesRepository.to
        .getCategoriesByBusinessId(businessId);

    businessCategories = UnmodifiableListView(_businessCategories);

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

      final _businessProducts = await ProductsRepository.instance
          .getProductsByBusinessId(businessId);
      final uniqueGlobalIds = <String>{
        ..._businessProducts.map((p) => p.globalProductId),
      };
      final globalFutures = uniqueGlobalIds.map(
        (id) => ProductsRepository.instance.findGlobalProduct(
          FindGlobalProductsRequest(refId: id),
        ),
      );

      final globals = await Future.wait(globalFutures);

      final globalMap = Map<String, GlobalProduct>.fromIterables(
        uniqueGlobalIds.toList(),
        globals.expand((g) => g),
      );

      final _products = _businessProducts
          .map((e) {
            final globalProduct = globalMap[e.globalProductId];

            if (globalProduct != null) {
              return Product(businessProduct: e, globalProduct: globalProduct);
            }

            return null;
          })
          .whereType<Product>()
          .toList();
      filteredProducts = [..._products];
      products = UnmodifiableListView([..._products]);
    } on Exception catch (e) {
      _logger.severe(e.toString());
      error = e.toString();
    } finally {
      _logger.info('initTheData is done');
      completer.complete(true);
    }
  }

  /// Deletes product.
  Future<bool> deleteProduct(String businessId) async {
    try {
      // await ProductsRepository.instance.deleteProduct(businessId);

      return true;
    } catch (e) {
      return false;
    }
  }
}
