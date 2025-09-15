import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/models.dart';

import '../../utils/extends_models.dart';
import 'inventory_view_model.dart';

/// Controller for inventory screen
class InventoryController extends ChangeNotifier {
  final InventoryViewModel _viewModel;

  /// Gets the filtered products stream.
  Stream<List<Product>> get filteredProductsStream =>
      _viewModel.filteredProductsStream;

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<Product>> get productsStream =>
      _viewModel.productsStream;

  /// Gets the error stream.
  Stream<String> get errorStream => _viewModel.errorStream;

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

  /// Constructor of [InventoryController].
  InventoryController(this._viewModel);

  /// Refreshes products.
  Future<void> refreshProducts() async {
    await _viewModel.refreshProducts();
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
