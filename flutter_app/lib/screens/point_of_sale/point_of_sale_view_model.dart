import 'package:sabitou_rpc/models.dart';

import '../../repositories/inventory_repository.dart';
import '../../repositories/store_products_repository.dart';

/// View model for the point of sale screen.
///
/// Handles all data-fetching concerns, keeping [PointOfSaleController] focused
/// on business logic.
final class PointOfSaleViewModel {
  /// Creates a [PointOfSaleViewModel] for [store].
  PointOfSaleViewModel({required this.store});

  /// The active store used to scope queries.
  final Store store;

  /// Returns products matching [query] for the active store.
  ///
  /// When [query] is empty, returns the full product catalogue.
  Future<List<StoreProductWithGlobalProduct>> searchProducts(
    String query,
  ) async {
    if (query.isEmpty) {
      return StoreProductsRepository.instance.findStoreProducts(
        FindStoreProductsRequest(storeId: store.refId),
      );
    }

    return StoreProductsRepository.instance.searchProducts(
      SearchStoreProductsRequest(searchQuery: query, storeId: store.refId),
    );
  }

  /// Returns the local inventory level for [storeProductId].
  ///
  /// Returns `null` when the product has not been synced yet.
  ///
  /// Useful to display available stock next to search results in the UI
  /// without making an extra gRPC call.
  Future<({bool available, int committed, int onHand})?> getInventoryLevel(
    String storeProductId,
  ) async {
    final result = await InventoryRepository.instance.getProductInventoryLevels(
      storeProductId,
      store.refId,
    );

    if (result == null) {
      return null;
    }

    return (
      available: result.quantityAvailable > 0,
      onHand: result.quantityOnHand,
      committed: result.quantityCommitted,
    );
  }
}
