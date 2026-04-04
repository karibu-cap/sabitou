import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/categories_repository.dart';

/// ViewModel for add category management.
class AddCategoryViewModel {
  /// The   categories repository instance.
  final CategoriesRepository _categoriesRepository =
      CategoriesRepository.instance;

  /// Creates a new category.
  Future<bool> createCategory(Category category) async {
    final success = await _categoriesRepository.createCategory(category);

    return success;
  }

  /// Updates an existing category.
  Future<bool> updateCategory(Category category) async {
    final success = await _categoriesRepository.updateCategory(category);

    return success;
  }
}
