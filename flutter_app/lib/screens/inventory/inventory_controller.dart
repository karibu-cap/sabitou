import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/models.dart';

import 'inventory_view_model.dart';

/// Controller for inventory screen
class InventoryController extends ChangeNotifier {
  final InventoryViewModel _viewModel;

  /// Gets the filtered products stream.
  Stream<List<InventoryLevelWithProduct>> get filteredProductsStream =>
      _viewModel.filteredProductsStream;

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<InventoryLevelWithProduct>>
  get invLevelSubject => _viewModel.invLevelSubject;

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
  BehaviorSubject<StockStatus?> get selectedStatus => _viewModel.selectedStatus;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// Gets the selected item stream.
  Stream<InventoryLevelWithProduct?> get selectedItemStream =>
      _viewModel.selectedItemStream;

  /// Gets the transactions stream.
  Stream<List<InventoryTransaction>> get transactionsStream =>
      _viewModel.transactionsStream;

  /// Gets the transaction filter stream.
  Stream<TransactionType?> get transactionFilterStream =>
      _viewModel.transactionFilterStream;

  /// Constructor of [InventoryController].
  InventoryController(this._viewModel);

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

  /// Adjusts the inventory.
  Future<bool> adjustInventory(
    String storeId,
    String productId,
    int quantityChange,
    String reason,
    String notes,
  ) async {
    final result = await _viewModel.adjustInventory(
      storeId,
      productId,
      quantityChange,
      reason,
      notes,
    );

    return result;
  }

  /// Selects an inventory item.
  Future<void> selectItem(InventoryLevelWithProduct item) async {
    await _viewModel.selectItem(item);
    notifyListeners();
  }

  /// Selects an inventory item by product ID.
  Future<void> selectItemById(String productId) async {
    await _viewModel.selectItemById(productId);
    notifyListeners();
  }

  /// Clears the selected item.
  void clearSelection() {
    _viewModel.clearSelection();
    notifyListeners();
  }

  /// Updates the transaction filter.
  void updateTransactionFilter(TransactionType filter) {
    _viewModel.updateTransactionFilter(filter);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
