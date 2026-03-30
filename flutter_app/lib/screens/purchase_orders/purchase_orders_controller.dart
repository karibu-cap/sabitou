import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'components/po_utils.dart';
import 'purchase_orders_view_model.dart';

/// Controller for the Purchase Orders module.
class PurchaseOrdersController extends ChangeNotifier {
  /// Controller for the Purchase Orders module.
  PurchaseOrdersController(this._viewModel);

  /// The view model associated with this controller.
  final PurchaseOrdersViewModel _viewModel;

  /// The text editing controller for the search input field.
  final TextEditingController searchController = TextEditingController();

  /// The currently selected purchase order ID for desktop split view.
  String? _selectedPo;

  /// The currently selected purchase order ID for desktop split view.
  String? get selectedPo => _selectedPo;

  /// Whether the list is filtered.
  bool get isFiltered => _viewModel.isFiltered;

  /// The stream of search queries.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// The stream of selected status filters.
  BehaviorSubject<PurchaseOrderStatus?> get statusFilter =>
      _viewModel.statusFilter;

  /// The stream of all purchase orders.
  Stream<List<PurchaseOrder>> get purchaseOrdersStream =>
      _viewModel.purchaseOrdersStream;

  /// The stream of filtered purchase orders.
  Stream<List<PurchaseOrder>> get filteredPurchaseOrdersStream =>
      _viewModel.filteredPurchaseOrdersStream;

  /// The stream of purchase order details.
  Stream<PurchaseOrderDetailSnapshot> detailStream(String purchaseOrderId) =>
      _viewModel.detailStream(purchaseOrderId);

  /// Selects a purchase order.
  Future<void> selectPurchaseOrder(String poId) async {
    if (_selectedPo == poId) {
      return;
    }
    _selectedPo = poId;
    notifyListeners();
  }

  /// Clears the selected purchase order.
  void clearSelection() {
    _selectedPo = null;
    notifyListeners();
  }

  /// Clears the filters.
  void clearFilters() {
    searchQuery.add('');
    statusFilter.add(null);
    searchController.clear();
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    _viewModel.dispose();
    super.dispose();
  }
}
