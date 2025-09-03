//
//  Generated code. Do not modify.
//  source: inventory/v1/category.proto
//

import "package:connectrpc/connect.dart" as connect;
import "category.pb.dart" as inventoryv1category;
import "category.connect.spec.dart" as specs;

extension type CategoryServiceClient (connect.Transport _transport) {
  /// Creates a new category.
  Future<inventoryv1category.CreateCategoryResponse> createCategory(
    inventoryv1category.CreateCategoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.CategoryService.createCategory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates a category.
  Future<inventoryv1category.UpdateCategoryResponse> updateCategory(
    inventoryv1category.UpdateCategoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.CategoryService.updateCategory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes a category.
  Future<inventoryv1category.DeleteCategoryResponse> deleteCategory(
    inventoryv1category.DeleteCategoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.CategoryService.deleteCategory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Finds categories by name.
  Future<inventoryv1category.FindCategoriesResponse> findCategories(
    inventoryv1category.FindCategoriesRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.CategoryService.findCategories,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a category by id.
  Future<inventoryv1category.GetCategoryResponse> getCategory(
    inventoryv1category.GetCategoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.CategoryService.getCategory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
