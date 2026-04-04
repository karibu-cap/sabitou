//
//  Generated code. Do not modify.
//  source: inventory/v1/store_product.proto
//

import "package:connectrpc/connect.dart" as connect;
import "store_product.pb.dart" as inventoryv1store_product;

abstract final class StoreProductService {
  /// Fully-qualified name of the StoreProductService service.
  static const name = 'inventory.v1.StoreProductService';

  /// Deletes a global product.
  static const deleteGlobalProduct = connect.Spec(
    '/$name/DeleteGlobalProduct',
    connect.StreamType.unary,
    inventoryv1store_product.DeleteGlobalProductRequest.new,
    inventoryv1store_product.DeleteGlobalProductResponse.new,
  );

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  static const deleteStoreProduct = connect.Spec(
    '/$name/DeleteStoreProduct',
    connect.StreamType.unary,
    inventoryv1store_product.DeleteStoreProductRequest.new,
    inventoryv1store_product.DeleteStoreProductResponse.new,
  );
}
