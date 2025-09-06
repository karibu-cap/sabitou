import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';

import '../../utils/extends_models.dart';
import 'inventory_view_model.dart';

/// Controller for inventory screen
final class InventoryController extends ChangeNotifier {
  final InventoryViewModel _viewModel;

  final TextEditingController _searchController = TextEditingController();
  final ValueNotifier<String> _selectedCategory = ValueNotifier('');

  /// Gets error message.
  String get error => _viewModel.error;

  /// Gets filtered products.
  List<Product> get filteredProducts => _viewModel.filteredProducts;

  /// Controller for search input.
  TextEditingController get searchController => _searchController;

  /// Currently selected category ID.
  ValueNotifier<String> get selectedCategory => _selectedCategory;

  /// Gets List of business categories.
  UnmodifiableListView<Category> get businessCategories =>
      UnmodifiableListView(_viewModel.businessCategories);

  /// Gets List of products.
  UnmodifiableListView<Product> get products =>
      UnmodifiableListView(_viewModel.products);

  /// Completer for loading state.
  Completer<bool> get completer => _viewModel.completer;

  /// Constructors of new [InventoryController].
  InventoryController(this._viewModel) {
    _searchController.addListener(updateSearchQuery);
  }

  @override
  void dispose() {
    _searchController.removeListener(updateSearchQuery);
    super.dispose();
  }

  /// Updates the search query
  void updateSearchQuery() {
    final searchByName = _searchController.text;
    UnmodifiableListView<Product> filterResult = UnmodifiableListView([
      ..._viewModel.products,
    ]);
    if (searchByName.isNotEmpty) {
      filterResult = UnmodifiableListView<Product>(
        filterResult
            .where(
              (p) =>
                  p.globalProduct.name.toLowerCase().contains(
                    searchByName.toLowerCase(),
                  ) ||
                  p.globalProduct.barCodeValue.toLowerCase().contains(
                    searchByName.toLowerCase(),
                  ),
            )
            .toList(),
      );
    }
    if (_selectedCategory.value.isNotEmpty) {
      filterResult = UnmodifiableListView<Product>(
        filterResult
            .where(
              (p) => p.globalProduct.categories.any(
                (c) =>
                    c.name.toLowerCase() ==
                    _selectedCategory.value.toLowerCase(),
              ),
            )
            .toList(),
      );
    }
    filteredProducts
      ..clear()
      ..addAll(filterResult);

    notifyListeners();
  }

  /// Deletes product.
  Future<bool> deleteProduct(String businessId) async =>
      await _viewModel.deleteProduct(businessId);
}
