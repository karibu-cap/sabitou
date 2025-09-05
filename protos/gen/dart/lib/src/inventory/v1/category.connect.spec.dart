//
//  Generated code. Do not modify.
//  source: inventory/v1/category.proto
//

import "package:connectrpc/connect.dart" as connect;
import "category.pb.dart" as inventoryv1category;

abstract final class CategoryService {
  /// Fully-qualified name of the CategoryService service.
  static const name = 'inventory.v1.CategoryService';

  /// Creates a new category.
  static const createCategory = connect.Spec(
    '/$name/CreateCategory',
    connect.StreamType.unary,
    inventoryv1category.CreateCategoryRequest.new,
    inventoryv1category.CreateCategoryResponse.new,
  );

  /// Updates a category.
  static const updateCategory = connect.Spec(
    '/$name/UpdateCategory',
    connect.StreamType.unary,
    inventoryv1category.UpdateCategoryRequest.new,
    inventoryv1category.UpdateCategoryResponse.new,
  );

  /// Deletes a category.
  static const deleteCategory = connect.Spec(
    '/$name/DeleteCategory',
    connect.StreamType.unary,
    inventoryv1category.DeleteCategoryRequest.new,
    inventoryv1category.DeleteCategoryResponse.new,
  );

  /// Finds categories by name.
  static const findCategories = connect.Spec(
    '/$name/FindCategories',
    connect.StreamType.unary,
    inventoryv1category.FindCategoriesRequest.new,
    inventoryv1category.FindCategoriesResponse.new,
  );

  /// Gets a category by id.
  static const getCategory = connect.Spec(
    '/$name/GetCategory',
    connect.StreamType.unary,
    inventoryv1category.GetCategoryRequest.new,
    inventoryv1category.GetCategoryResponse.new,
  );
}
