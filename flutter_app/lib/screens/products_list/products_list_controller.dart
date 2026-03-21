import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'products_list_view_model.dart';

/// Controller for products list screen
class ProductsListController extends ChangeNotifier {
  final ProductsListViewModel _viewModel;

  /// The search query controller.
  final TextEditingController searchQueryController = TextEditingController(
    text: '',
  );

  /// The category select for filter.
  final ShadSelectController<String> selectedCategory = ShadSelectController();

  /// The status select for filter.
  final ShadSelectController<ProductStatus?> selectedStatus =
      ShadSelectController();

  /// Constructor of [ProductsListController].
  ProductsListController(this._viewModel) {
    _viewModel.productsSubject.listen((_) => notifyListeners());
    searchQueryController.addListener(notifyListeners);
    selectedCategory.addListener(notifyListeners);
    selectedStatus.addListener(notifyListeners);
  }

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<StoreProductWithGlobalProduct>>
  get productsSubject => _viewModel.productsSubject;

  /// Gets the business categories.
  UnmodifiableListView<Category> get businessCategories =>
      _viewModel.businessCategories;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// Gets the filtered products synchronously.
  List<StoreProductWithGlobalProduct> get filteredProducts =>
      _viewModel.getFilteredProducts(
        searchQuery: searchQueryController.value.text,
        selectedCategory: selectedCategory.value.firstOrNull ?? '',
        selectedStatus: selectedStatus.value.lastOrNull,
      );

  /// Clears all filters.
  void clearFilters() {
    searchQueryController.clear();
    selectedCategory.value.clear();
    selectedStatus.value.clear();
    notifyListeners();
  }

  // --- Actions ---
  /// Refreshes products.
  Future<void> refreshProducts() async {
    await _viewModel.refreshProducts(onLoaded: notifyListeners);
  }

  /// Updates product status.
  Future<bool> updateProductStatus(
    String storeProductId,
    ProductStatus status,
  ) async {
    return await _viewModel.updateProductStatus(
      storeProductId,
      status,
      onLoaded: notifyListeners,
    );
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
