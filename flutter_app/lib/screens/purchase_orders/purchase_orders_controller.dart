import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'purchase_orders_view_model.dart';

/// Controller for purchase orders screen
class PurchaseOrdersController extends ChangeNotifier {
  final PurchaseOrdersViewModel _viewModel;

  /// Gets the filtered purchase orders stream.
  Stream<List<PurchaseOrder>> get filteredPurchaseOrdersStream =>
      _viewModel.filteredPurchaseOrdersStream;

  /// Gets the purchase orders stream.
  BehaviorSubject<UnmodifiableListView<PurchaseOrder>>
  get purchaseOrdersSubject => _viewModel.purchaseOrdersSubject;

  /// Gets the suppliers stream.
  BehaviorSubject<UnmodifiableListView<Supplier>> get suppliersSubject =>
      _viewModel.suppliersSubject;

  /// Gets the stores stream.
  UnmodifiableListView<StoreProductWithGlobalProduct> get storeProducts =>
      _viewModel.storeProducts;

  /// Gets the error stream.
  Stream<String> get errorStream => _viewModel.errorStream;

  /// Gets the loading stream.
  Stream<bool> get loadingStream => _viewModel.loadingStream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets the selected supplier filter.
  BehaviorSubject<String> get selectedSupplierFilter =>
      _viewModel.selectedSupplierFilter;

  /// Gets the selected status filter.
  BehaviorSubject<PurchaseOrderStatus?> get selectedStatusFilter =>
      _viewModel.selectedStatusFilter;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// Gets the purchase orders data.
  PurchaseOrdersData get purchaseOrdersData => _viewModel.purchaseOrdersData;

  /// Constructor of [PurchaseOrdersController].
  PurchaseOrdersController(this._viewModel);

  /// Refreshes purchase orders.
  Future<void> refreshPurchaseOrders() async {
    await _viewModel.refreshPurchaseOrders();
    notifyListeners();
  }

  /// Creates a new purchase order.
  Future<bool> createPurchaseOrder(CreatePurchaseOrderRequest request) async {
    final result = await _viewModel.createPurchaseOrder(request);

    notifyListeners();

    return result;
  }

  /// Updates purchase order status.
  Future<bool> updatePurchaseOrderStatus(
    String purchaseOrderId,
    PurchaseOrderStatus newStatus,
  ) async {
    final result = await _viewModel.updatePurchaseOrderStatus(
      purchaseOrderId,
      newStatus,
    );
    notifyListeners();

    return result;
  }

  /// Cancels a purchase order.
  Future<bool> cancelPurchaseOrder(
    String purchaseOrderId,
    String reason,
  ) async {
    final result = await _viewModel.cancelPurchaseOrder(
      purchaseOrderId,
      reason,
    );
    notifyListeners();

    return result;
  }

  /// Creates a receiving note.
  Future<bool> createReceivingNote(CreateReceivingNoteRequest request) async {
    final result = await _viewModel.createReceivingNote(request);
    notifyListeners();

    return result;
  }

  /// Updates the search query.
  void updateSearchQuery(String query) {
    _viewModel.updateSearchQuery(query);
  }

  /// Updates the selected supplier filter.
  void updateSelectedSupplierFilter(String supplierId) {
    _viewModel.updateSelectedSupplierFilter(supplierId);
  }

  /// Updates the selected status filter.
  void updateSelectedStatusFilter(PurchaseOrderStatus? status) {
    _viewModel.updateSelectedStatusFilter(status);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
