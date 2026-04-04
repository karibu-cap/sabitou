import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'global_products_view_model.dart';

/// The global products controller.
///
/// Manages the state and business logic for the global products module.
/// Uses ChangeNotifier for state management with Provider pattern.
class GlobalProductsController extends ChangeNotifier {
  /// The view model that handles data operations for global products
  final GlobalProductsViewModel _viewModel = GlobalProductsViewModel();

  /// Text controller for search input field.
  final TextEditingController searchController = TextEditingController();

  /// Text controller for status filter input field.
  final ShadSelectController<GlobalProductStatus>? statusFilterController =
      ShadSelectController<GlobalProductStatus>();

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets the selected status.
  BehaviorSubject<GlobalProductStatus?> get selectedStatus =>
      _viewModel.selectedStatus;

  /// Wether if list is filtered.
  bool get isFiltered => _viewModel.isFiltered;

  /// Gets global products stream for reactive UI updates
  Stream<List<GlobalProduct>> get globalProductsStream =>
      _viewModel.globalProductsStream;

  /// Gets filtered global products stream for reactive UI updates
  Stream<List<GlobalProduct>> get filteredGlobalProductsStream =>
      _viewModel.filteredGlobalProductsStream;

  /// Deletes a global product from the system.
  Future<bool> deleteGlobalProduct(String globalProductId) async {
    return await _viewModel.deleteGlobalProduct(globalProductId);
  }

  /// Calculates total global products count
  int calculateTotalGlobalProducts(List<GlobalProduct> globalProducts) {
    return globalProducts.length;
  }

  /// Calculates active global products count
  int calculateActiveGlobalProducts(List<GlobalProduct> globalProducts) {
    return globalProducts
        .where(
          (c) => c.status == GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        )
        .length;
  }

  /// Calculates inactive global products count
  int calculateInactiveGlobalProducts(List<GlobalProduct> globalProducts) {
    return globalProducts
        .where(
          (c) => c.status == GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE,
        )
        .length;
  }

  /// Refreshes global products from local database.
  Future<void> refreshGlobalProducts() async {
    await _viewModel.loadGlobalProducts();
  }

  /// Clears filters.
  void clearFilters() {
    searchQuery.add('');
    selectedStatus.add(null);
    searchController.clear();
  }

  /// Calculates global product statistics.
  CategoriesStatsData calculateGlobalProductStats(
    List<GlobalProduct> globalProducts,
  ) {
    return (
      total: calculateTotalGlobalProducts(globalProducts),
      active: calculateActiveGlobalProducts(globalProducts),
      inactive: calculateInactiveGlobalProducts(globalProducts),
    );
  }
}

/// The categories stats data.
typedef CategoriesStatsData = ({int total, int active, int inactive});
