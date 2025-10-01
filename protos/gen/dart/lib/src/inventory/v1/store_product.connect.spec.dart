//
//  Generated code. Do not modify.
//  source: inventory/v1/store_product.proto
//

import "package:connectrpc/connect.dart" as connect;

import "store_product.pb.dart" as inventoryv1store_product;

abstract final class StoreProductService {
  /// Fully-qualified name of the StoreProductService service.
  static const name = 'inventory.v1.StoreProductService';

  /// Finds products by name.
  static const findGlobalProducts = connect.Spec(
    '/$name/FindGlobalProducts',
    connect.StreamType.unary,
    inventoryv1store_product.FindGlobalProductsRequest.new,
    inventoryv1store_product.FindGlobalProductsResponse.new,
  );

  /// Creates a global product.
  static const createGlobalProduct = connect.Spec(
    '/$name/CreateGlobalProduct',
    connect.StreamType.unary,
    inventoryv1store_product.CreateGlobalProductRequest.new,
    inventoryv1store_product.CreateGlobalProductResponse.new,
  );

  /// Updates a global product.
  static const updateGlobalProduct = connect.Spec(
    '/$name/UpdateGlobalProduct',
    connect.StreamType.unary,
    inventoryv1store_product.UpdateGlobalProductRequest.new,
    inventoryv1store_product.UpdateGlobalProductResponse.new,
  );

  /// Deletes a global product.
  static const deleteGlobalProduct = connect.Spec(
    '/$name/DeleteGlobalProduct',
    connect.StreamType.unary,
    inventoryv1store_product.DeleteGlobalProductRequest.new,
    inventoryv1store_product.DeleteGlobalProductResponse.new,
  );

  /// Adds a product to a store.
  static const addProduct = connect.Spec(
    '/$name/AddProduct',
    connect.StreamType.unary,
    inventoryv1store_product.AddStoreProductRequest.new,
    inventoryv1store_product.AddStoreProductResponse.new,
  );

  /// Gets a store product by id.
  static const getStoreProduct = connect.Spec(
    '/$name/GetStoreProduct',
    connect.StreamType.unary,
    inventoryv1store_product.GetStoreProductRequest.new,
    inventoryv1store_product.GetStoreProductResponse.new,
  );

  /// Updates a store product.
  static const updateStoreProduct = connect.Spec(
    '/$name/UpdateStoreProduct',
    connect.StreamType.unary,
    inventoryv1store_product.UpdateStoreProductRequest.new,
    inventoryv1store_product.UpdateStoreProductResponse.new,
  );

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  static const deleteStoreProduct = connect.Spec(
    '/$name/DeleteStoreProduct',
    connect.StreamType.unary,
    inventoryv1store_product.DeleteStoreProductRequest.new,
    inventoryv1store_product.DeleteStoreProductResponse.new,
  );

  /// Finds products by name.
  static const findProducts = connect.Spec(
    '/$name/FindProducts',
    connect.StreamType.unary,
    inventoryv1store_product.FindProductsRequest.new,
    inventoryv1store_product.FindProductsResponse.new,
  );

  /// Streams all products for a store for real-time updates.
  static const streamStoreProducts = connect.Spec(
    '/$name/StreamStoreProducts',
    connect.StreamType.server,
    inventoryv1store_product.StreamStoreProductsRequest.new,
    inventoryv1store_product.StreamStoreProductsResponse.new,
  );

  /// Streams all global products for real-time updates.
  static const streamGlobalProducts = connect.Spec(
    '/$name/StreamGlobalProducts',
    connect.StreamType.server,
    inventoryv1store_product.StreamGlobalProductsRequest.new,
    inventoryv1store_product.StreamGlobalProductsResponse.new,
  );

  /// Lists products with pagination and filters.
  static const listStoreProducts = connect.Spec(
    '/$name/ListStoreProducts',
    connect.StreamType.unary,
    inventoryv1store_product.ListStoreProductsRequest.new,
    inventoryv1store_product.ListStoreProductsResponse.new,
  );
}
