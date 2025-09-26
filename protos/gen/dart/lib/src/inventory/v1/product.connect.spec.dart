//
//  Generated code. Do not modify.
//  source: inventory/v1/product.proto
//

import "package:connectrpc/connect.dart" as connect;
import "product.pb.dart" as inventoryv1product;

abstract final class ProductService {
  /// Fully-qualified name of the ProductService service.
  static const name = 'inventory.v1.ProductService';

  /// Finds products by name.
  static const findGlobalProducts = connect.Spec(
    '/$name/FindGlobalProducts',
    connect.StreamType.unary,
    inventoryv1product.FindGlobalProductsRequest.new,
    inventoryv1product.FindGlobalProductsResponse.new,
  );

  /// Finds categories by name.
  static const findProductCategory = connect.Spec(
    '/$name/FindProductCategory',
    connect.StreamType.unary,
    inventoryv1product.FindProductCategoryRequest.new,
    inventoryv1product.FindProductCategoryResponse.new,
  );

  /// Creates a global product.
  static const createGlobalProduct = connect.Spec(
    '/$name/CreateGlobalProduct',
    connect.StreamType.unary,
    inventoryv1product.CreateGlobalProductRequest.new,
    inventoryv1product.CreateGlobalProductResponse.new,
  );

  /// Updates a global product.
  static const updateGlobalProduct = connect.Spec(
    '/$name/UpdateGlobalProduct',
    connect.StreamType.unary,
    inventoryv1product.UpdateGlobalProductRequest.new,
    inventoryv1product.UpdateGlobalProductResponse.new,
  );

  /// Deletes a global product.
  static const deleteGlobalProduct = connect.Spec(
    '/$name/DeleteGlobalProduct',
    connect.StreamType.unary,
    inventoryv1product.DeleteGlobalProductRequest.new,
    inventoryv1product.DeleteGlobalProductResponse.new,
  );

  /// Adds a product to a store.
  static const addProduct = connect.Spec(
    '/$name/AddProduct',
    connect.StreamType.unary,
    inventoryv1product.AddStoreProductRequest.new,
    inventoryv1product.AddStoreProductResponse.new,
  );

  /// Gets a store product by id.
  static const getProduct = connect.Spec(
    '/$name/GetProduct',
    connect.StreamType.unary,
    inventoryv1product.GetStoreProductRequest.new,
    inventoryv1product.GetStoreProductResponse.new,
  );

  /// Updates a store product.
  static const updateProduct = connect.Spec(
    '/$name/UpdateProduct',
    connect.StreamType.unary,
    inventoryv1product.UpdateStoreProductRequest.new,
    inventoryv1product.UpdateStoreProductResponse.new,
  );

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  static const deleteProduct = connect.Spec(
    '/$name/DeleteProduct',
    connect.StreamType.unary,
    inventoryv1product.DeleteStoreProductRequest.new,
    inventoryv1product.DeleteStoreProductResponse.new,
  );

  /// Finds products by name.
  static const findStoreProducts = connect.Spec(
    '/$name/FindStoreProducts',
    connect.StreamType.unary,
    inventoryv1product.FindStoreProductsRequest.new,
    inventoryv1product.FindStoreProductsResponse.new,
  );

  /// Streams all products for a store for real-time updates.
  static const streamStoreProducts = connect.Spec(
    '/$name/StreamStoreProducts',
    connect.StreamType.server,
    inventoryv1product.StreamStoreProductsRequest.new,
    inventoryv1product.StreamStoreProductsResponse.new,
  );

  /// Streams all global products for real-time updates.
  static const streamGlobalProducts = connect.Spec(
    '/$name/StreamGlobalProducts',
    connect.StreamType.server,
    inventoryv1product.StreamGlobalProductsRequest.new,
    inventoryv1product.StreamGlobalProductsResponse.new,
  );
}
