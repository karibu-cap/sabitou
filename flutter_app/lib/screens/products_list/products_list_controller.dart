import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/models.dart';

import 'products_list_view_model.dart';

/// Controller for products list screen
class ProductsListController extends ChangeNotifier {
  final ProductsListViewModel _viewModel;

  /// Gets the filtered products stream.
  Stream<List<StoreProductWithGlobalProduct>> get filteredProductsStream =>
      _viewModel.filteredProductsStream;

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<StoreProductWithGlobalProduct>>
  get productsSubject => _viewModel.productsSubject;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets the selected category.
  BehaviorSubject<String> get selectedCategory => _viewModel.selectedCategory;

  /// Gets the business categories.
  UnmodifiableListView<Category> get businessCategories =>
      _viewModel.businessCategories;

  /// Gets the selected status.
  BehaviorSubject<ProductStatus?> get selectedStatus =>
      _viewModel.selectedStatus;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// Constructor of [ProductsListController].
  ProductsListController(this._viewModel);

  /// Refreshes products.
  Future<void> refreshProducts() async {
    await _viewModel.refreshProducts();
    notifyListeners();
  }

  /// Deletes product.
  Future<bool> deleteProduct(String storeProductId) async {
    final result = await _viewModel.deleteProduct(storeProductId);

    return result;
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
