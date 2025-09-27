import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/categories_repository.dart';
import '../../../services/rpc/fake_transport/category.dart';

/// ViewModel for add category management.
class AddCategoryViewModel {
  /// The   categories repository instance.
  final CategoriesRepository _categoriesRepository = CategoriesRepository(
    transport: categoryFakeTransport,
  );

  /// Creates a new category.
  Future<bool> createCategory(CreateCategoryRequest request) async {
    final success = await _categoriesRepository.createCategory(request);

    return success;
  }

  /// Updates an existing category.
  Future<bool> updateCategory(UpdateCategoryRequest request) async {
    final success = await _categoriesRepository.updateCategory(request);

    return success;
  }
}
