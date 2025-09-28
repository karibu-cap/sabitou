import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/categories_repository.dart';
import '../../../repositories/products_repository.dart';
import '../../../services/rpc/fake_transport/global_product.dart';

/// ViewModel for add global product management.
class AddGlobalProductViewModel {
  /// The products repository instance.
  final ProductsRepository _productsRepository = ProductsRepository(
    transport: globalProductFakeTransport,
  );

  /// The categories repository instance.
  final CategoriesRepository _categoriesRepository = CategoriesRepository(
    transport: globalProductFakeTransport,
  );

  /// The categories list.
  List<Category> categories = [];

  /// Gets categories.
  Future<void> getCategories() async {
    categories = await _categoriesRepository.getCategories(
      FindCategoriesRequest(
        type: CategoryType.CATEGORY_TYPE_BUSINESS,
        status: CategoryStatus.CATEGORY_STATUS_ACTIVE,
      ),
    );
  }

  /// Creates a new global product.
  Future<bool> createGlobalProduct(CreateGlobalProductRequest request) async {
    return await _productsRepository.createGlobalProduct(request);
  }

  /// Updates an existing global product.
  Future<bool> updateGlobalProduct(UpdateGlobalProductRequest request) async {
    return await _productsRepository.updateGlobalProduct(request);
  }
}
