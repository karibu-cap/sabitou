//
//  Generated code. Do not modify.
//  source: inventory/v1/category.proto
//

import "package:connectrpc/connect.dart" as connect;
import "category.pb.dart" as inventoryv1category;

abstract final class CategoryService {
  /// Fully-qualified name of the CategoryService service.
  static const name = 'inventory.v1.CategoryService';

  /// Deletes a category.
  static const deleteCategory = connect.Spec(
    '/$name/DeleteCategory',
    connect.StreamType.unary,
    inventoryv1category.DeleteCategoryRequest.new,
    inventoryv1category.DeleteCategoryResponse.new,
  );
}
