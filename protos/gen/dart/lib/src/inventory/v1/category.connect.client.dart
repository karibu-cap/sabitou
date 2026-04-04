//
//  Generated code. Do not modify.
//  source: inventory/v1/category.proto
//

import "package:connectrpc/connect.dart" as connect;
import "category.pb.dart" as inventoryv1category;
import "category.connect.spec.dart" as specs;

extension type CategoryServiceClient (connect.Transport _transport) {
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
}
