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

  /// Adds a product to a business.
  Future<inventoryv1product.AddProductResponse> addProduct(
    inventoryv1product.AddProductRequest input, {
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

  /// Gets a business product by id.
  Future<inventoryv1product.GetProductResponse> getProduct(
    inventoryv1product.GetProductRequest input, {
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

  /// Updates a business product.
  Future<inventoryv1product.UpdateProductResponse> updateProduct(
    inventoryv1product.UpdateProductRequest input, {
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

  /// Deletes a business product.
  /// Only business products that are not in any store and orders can be
  /// deleted.
  Future<inventoryv1product.DeleteProductResponse> deleteProduct(
    inventoryv1product.DeleteProductRequest input, {
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
}
