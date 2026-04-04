//
//  Generated code. Do not modify.
//  source: inventory/v1/store_product.proto
//

import "package:connectrpc/connect.dart" as connect;
import "store_product.pb.dart" as inventoryv1store_product;
import "store_product.connect.spec.dart" as specs;

extension type StoreProductServiceClient (connect.Transport _transport) {
  /// Deletes a global product.
  Future<inventoryv1store_product.DeleteGlobalProductResponse> deleteGlobalProduct(
    inventoryv1store_product.DeleteGlobalProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.deleteGlobalProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  Future<inventoryv1store_product.DeleteStoreProductResponse> deleteStoreProduct(
    inventoryv1store_product.DeleteStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.deleteStoreProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
