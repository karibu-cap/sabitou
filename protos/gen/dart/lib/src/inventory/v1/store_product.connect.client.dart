//
//  Generated code. Do not modify.
//  source: inventory/v1/store_product.proto
//

import "package:connectrpc/connect.dart" as connect;
import "store_product.pb.dart" as inventoryv1store_product;
import "store_product.connect.spec.dart" as specs;

extension type StoreProductServiceClient (connect.Transport _transport) {
  /// Finds products by name.
  Future<inventoryv1store_product.FindGlobalProductsResponse> findGlobalProducts(
    inventoryv1store_product.FindGlobalProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.findGlobalProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Creates a global product.
  Future<inventoryv1store_product.CreateGlobalProductResponse> createGlobalProduct(
    inventoryv1store_product.CreateGlobalProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.createGlobalProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a global product.
  Future<inventoryv1store_product.UpdateGlobalProductResponse> updateGlobalProduct(
    inventoryv1store_product.UpdateGlobalProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.updateGlobalProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

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

  /// Adds a product to a store.
  Future<inventoryv1store_product.AddStoreProductResponse> addProduct(
    inventoryv1store_product.AddStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.addProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a store product by id.
  Future<inventoryv1store_product.GetStoreProductResponse> getStoreProduct(
    inventoryv1store_product.GetStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.getStoreProduct,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a store product.
  Future<inventoryv1store_product.UpdateStoreProductResponse> updateStoreProduct(
    inventoryv1store_product.UpdateStoreProductRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.updateStoreProduct,
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

  /// Finds products by name.
  Future<inventoryv1store_product.FindStoreProductsResponse> findStoreProducts(
    inventoryv1store_product.FindStoreProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.findStoreProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Streams all products for a store for real-time updates.
  Stream<inventoryv1store_product.StreamStoreProductsResponse> streamStoreProducts(
    inventoryv1store_product.StreamStoreProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.StoreProductService.streamStoreProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Streams all global products for real-time updates.
  Stream<inventoryv1store_product.StreamGlobalProductsResponse> streamGlobalProducts(
    inventoryv1store_product.StreamGlobalProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).server(
      specs.StoreProductService.streamGlobalProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Lists products with pagination and filters.
  Future<inventoryv1store_product.ListStoreProductsResponse> listStoreProducts(
    inventoryv1store_product.ListStoreProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StoreProductService.listStoreProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
