//
//  Generated code. Do not modify.
//  source: inventory/v1/product.proto
//

import "package:connectrpc/connect.dart" as connect;
import "product.pb.dart" as inventoryv1product;
import "product.connect.spec.dart" as specs;

extension type ProductServiceClient (connect.Transport _transport) {
  /// Finds products by name.
  Future<inventoryv1product.FindGlobalProductsResponse> findGlobalProducts(
    inventoryv1product.FindGlobalProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProductService.findGlobalProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Finds categories by name.
  Future<inventoryv1product.FindCategoryResponse> findCategory(
    inventoryv1product.FindCategoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProductService.findCategory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Adds a product to a store.
  Future<inventoryv1product.AddStoreProductResponse> addProduct(
    inventoryv1product.AddStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProductService.addProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a store product by id.
  Future<inventoryv1product.GetStoreProductResponse> getProduct(
    inventoryv1product.GetStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProductService.getProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a store product.
  Future<inventoryv1product.UpdateStoreProductResponse> updateProduct(
    inventoryv1product.UpdateStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProductService.updateProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  Future<inventoryv1product.DeleteStoreProductResponse> deleteProduct(
    inventoryv1product.DeleteStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProductService.deleteProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Finds products by name.
  Future<inventoryv1product.FindStoreProductsResponse> findStoreProducts(
    inventoryv1product.FindStoreProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ProductService.findStoreProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Streams all products for a store for real-time updates.
  Stream<inventoryv1product.StreamStoreProductsResponse> streamStoreProducts(
    inventoryv1product.StreamStoreProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.ProductService.streamStoreProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
