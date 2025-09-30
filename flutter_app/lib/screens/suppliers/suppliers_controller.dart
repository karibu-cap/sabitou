import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import 'suppliers_view_model.dart';

/// The suppliers controller.
///
/// Manages the state and store logic for the suppliers module.
/// Uses ChangeNotifier for state management with Provider pattern.
class SuppliersController extends ChangeNotifier {
  /// The view model that handles data operations for suppliers
  final SuppliersViewModel _viewModel;
  final AppInternationalizationService _intl;

  /// Constructs a new SuppliersController.
  SuppliersController(
    SuppliersViewModel viewModel,
    AppInternationalizationService intl,
  ) : _viewModel = viewModel,
      _intl = intl;

  /// Loading state for general suppliers operations.
  bool _isLoading = false;

  /// Error message to display when operations fail.
  String _errorMessage = '';

  /// Text controller for search input field.
  final TextEditingController searchController = TextEditingController();

  /// Text controller for status filter input field.
  final ShadSelectController<SupplierStatus>? statusFilterController =
      ShadSelectController<SupplierStatus>();

  /// Gets the selected category status.
  BehaviorSubject<SupplierStatus?> get selectedStatus =>
      _viewModel.selectedStatus;

  /// Loading state for suppliers operations.
  bool get isLoading => _isLoading;

  /// Returns the last error message from failed operations.
  String get errorMessage => _errorMessage;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Wether if list is filtered.
  bool get isFiltered => _viewModel.isFiltered;

  /// Gets filtered suppliers stream for reactive UI updates
  Stream<List<Supplier>> get filteredSuppliersStream =>
      _viewModel.filteredSuppliersStream;

  /// Gets suppliers stream for reactive UI updates
  Stream<List<Supplier>> get suppliersStream => _viewModel.suppliersStream;

  /// Gets products stream for reactive UI updates
  Stream<List<InventoryLevelWithProduct>> get invStream =>
      _viewModel.productsStream;

  /// Deletes a supplier from the system.
  Future<bool> deleteSupplier(String supplierId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await _viewModel.deleteSupplier(supplierId);
    _errorMessage = _intl.failedToDeleteSupplier;
    notifyListeners();

    return result;
  }

  /// Clears error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Gets products for a specific supplier
  List<StoreProduct> getProductsForSupplier(
    String supplierRefId,
    List<StoreProduct> allProducts,
  ) {
    return allProducts.where((p) => p.supplierId == supplierRefId).toList();
  }

  /// Calculates total products count
  int calculateTotalProducts(List<StoreProduct> products) {
    return products.length;
  }

  /// Calculates average products per supplier
  String calculateAverageProductsPerSupplier(
    int totalProducts,
    int totalSuppliers,
  ) {
    return totalSuppliers > 0
        ? (totalProducts / totalSuppliers).toStringAsFixed(1)
        : '0.0';
  }

  /// Calculates total inventory value from all products
  double calculateTotalValue(List<InventoryLevelWithProduct> inv) {
    return inv.fold<double>(
      0.0,
      (sum, inv) => sum + (inv.product.salePrice * inv.level.quantityAvailable),
    );
  }

  /// Clears filters.
  void clearFilters() {
    searchQuery.add('');
    selectedStatus.add(null);
    searchController.clear();
  }
}
