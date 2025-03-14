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
  static const findCategory = connect.Spec(
    '/$name/FindCategory',
    connect.StreamType.unary,
    inventoryv1product.FindCategoryRequest.new,
    inventoryv1product.FindCategoryResponse.new,
  );

  /// Adds a product to a business.
  static const addProduct = connect.Spec(
    '/$name/AddProduct',
    connect.StreamType.unary,
    inventoryv1product.AddProductRequest.new,
    inventoryv1product.AddProductResponse.new,
  );

  /// Gets a business product by id.
  static const getProduct = connect.Spec(
    '/$name/GetProduct',
    connect.StreamType.unary,
    inventoryv1product.GetProductRequest.new,
    inventoryv1product.GetProductResponse.new,
  );

  /// Updates a business product.
  static const updateProduct = connect.Spec(
    '/$name/UpdateProduct',
    connect.StreamType.unary,
    inventoryv1product.UpdateProductRequest.new,
    inventoryv1product.UpdateProductResponse.new,
  );

  /// Deletes a business product.
  /// Only business products that are not in any store and orders can be
  /// deleted.
  static const deleteProduct = connect.Spec(
    '/$name/DeleteProduct',
    connect.StreamType.unary,
    inventoryv1product.DeleteProductRequest.new,
    inventoryv1product.DeleteProductResponse.new,
  );
}
