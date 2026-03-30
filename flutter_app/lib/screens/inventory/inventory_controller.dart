import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import 'inventory_view_model.dart';

/// Controller for inventory screen
class InventoryController extends ChangeNotifier {
  final InventoryViewModel _viewModel;

  /// The current store.
  Store get store => _viewModel.store;

  /// Persists the selected tab in the detail panel across rebuilds.
  final ShadTabsController<String> tabsController = ShadTabsController<String>(
    value: Intls.to.overview,
  );

  /// The category select for filter.
  final ShadSelectController<String> selectedCategory = ShadSelectController();

  /// The status select for filter.
  final ShadSelectController<StockStatus?> selectedStatus =
      ShadSelectController();

  /// Constructor of [InventoryController].
  InventoryController(this._viewModel) {
    _viewModel.initPartialData(onLoaded: notifyListeners);
    _viewModel.invLevelSubject.listen((_) => notifyListeners());
    searchQueryController.addListener(notifyListeners);
    selectedCategory.addListener(notifyListeners);
    selectedStatus.addListener(notifyListeners);
  }

  /// The search query controller.
  final TextEditingController searchQueryController = TextEditingController(
    text: '',
  );

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<InventoryLevelWithProduct>>
  get invLevelSubject => _viewModel.invLevelSubject;

  /// Gets the error stream.
  Stream<String> get errorStream => _viewModel.errorStream;

  /// Gets the filtered products synchronously.
  List<InventoryLevelWithProduct> get filteredProducts =>
      _viewModel.getFilteredProducts(
        searchQuery: searchQueryController.value.text,
        selectedCategory: selectedCategory.value.firstOrNull ?? '',
        selectedStatus: selectedStatus.value.lastOrNull,
      );

  /// Gets the business categories.
  UnmodifiableListView<Category> get businessCategories =>
      _viewModel.businessCategories;

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

  /// Watchs the inventory item.
  Stream<InventoryLevel?> watchProductInventory({
    required String productId,
    required String storeId,
  }) {
    return _viewModel.watchProductInventory(
      productId: productId,
      storeId: storeId,
    );
  }

  /// Clears all filters.
  void clearFilters() {
    searchQueryController.clear();
    selectedCategory.value.clear();
    selectedStatus.value.clear();
    notifyListeners();
  }

  /// Refreshes products.
  Future<void> refreshProducts() async {
    await _viewModel.refreshProducts(onLoaded: notifyListeners);
  }

  /// Adjusts the inventory.
  Future<bool> adjustInventory(
    String userId,
    String storeId,
    String productId,
    int quantityChange,
    String reason,
    String notes,
  ) async {
    final result = await _viewModel.adjustInventory(
      userId,
      storeId,
      productId,
      quantityChange,
      reason,
      notes,
      onLoaded: notifyListeners,
    );

    // If we have a selected item, refresh its transaction history
    final selectedItem = _viewModel.currentSelectedItem;
    if (selectedItem != null && selectedItem.product.refId == productId) {
      await _viewModel.selectItem(selectedItem);
    }

    return result;
  }

  /// Selects an inventory item.
  Future<void> selectItem(InventoryLevelWithProduct item) async {
    if (item.product.refId ==
        _viewModel.selectedItemStream.value?.product.refId) {
      return;
    }
    tabsController.select(Intls.to.overview);
    await _viewModel.selectItem(item);
  }

  /// Selects an inventory item by product ID.
  Future<void> selectItemById(String productId) async {
    tabsController.select(Intls.to.overview);
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
    tabsController.dispose();
    _viewModel.dispose();
    super.dispose();
  }
}
