import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/categories_repository.dart';
import '../../../repositories/store_products_repository.dart';

/// ViewModel for add global product management.
class AddGlobalProductViewModel {
  /// The products repository instance.
  final StoreProductsRepository _productsRepository =
      StoreProductsRepository.instance;

  /// The categories repository instance.
  final CategoriesRepository _categoriesRepository =
      CategoriesRepository.instance;

  /// Gets categories.
  Future<List<Category>> getCategories(String businessId) async {
    return await _categoriesRepository.getCategories(
      status: CategoryStatus.CATEGORY_STATUS_ACTIVE,
      businessId: businessId,
    );
  }

  /// Gets categories.
  Future<List<Category>> findCategories(String query, String businessId) async {
    if (query.isEmpty) {
      return _categoriesRepository.getCategories(
        status: CategoryStatus.CATEGORY_STATUS_ACTIVE,
        businessId: businessId,
      );
    }

    return await _categoriesRepository.findCategories(query, businessId);
  }

  /// Creates a new global product.
  Future<bool> createGlobalProduct(GlobalProduct globalProduct) async {
    return await _productsRepository.createGlobalProduct(globalProduct);
  }

  /// Updates an existing global product.
  Future<bool> updateGlobalProduct(GlobalProduct globalProductt) async {
    return await _productsRepository.updateGlobalProduct(globalProductt);
  }

  /// Creates a new category.
  Future<bool> createCategory(Category category) async {
    return await _categoriesRepository.createCategory(category);
  }
}
