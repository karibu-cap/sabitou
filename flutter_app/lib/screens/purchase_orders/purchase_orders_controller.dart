import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../services/internationalization/internationalization.dart';
import '../bills/bills_controller.dart';
import 'purchase_orders_view_model.dart';

/// Controller for the Purchase Orders module.
/// Manages list state, detail loading, and all PO actions.
class PurchaseOrdersController extends ChangeNotifier {
  PurchaseOrdersController(this._viewModel, this._intl, this._billsController);

  final PurchaseOrdersViewModel _viewModel;
  final AppInternationalizationService _intl;
  final BillsController _billsController;

  final TextEditingController searchController = TextEditingController();

  bool _isLoading = false;
  String _errorMessage = '';
  String _successMessage = '';

  /// Currently selected PO for desktop split view.
  String? _selectedPo;

  bool _isLoadingDetail = false;

  bool get isLoading => _isLoading;
  bool get isLoadingDetail => _isLoadingDetail;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;
  String? get selectedPo => _selectedPo;
  bool get isFiltered => _viewModel.isFiltered;

  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;
  BehaviorSubject<PurchaseOrderStatus?> get statusFilter =>
      _viewModel.statusFilter;

  Stream<List<PurchaseOrder>> get purchaseOrdersStream =>
      _viewModel.purchaseOrdersStream;

  Stream<List<PurchaseOrder>> get filteredPurchaseOrdersStream =>
      _viewModel.filteredPurchaseOrdersStream;

  /// Select a purchase order.
  Future<void> selectPurchaseOrder(String poId) async {
    _selectedPo = poId;
    _isLoadingDetail = true;
    notifyListeners();

    _isLoadingDetail = false;
    notifyListeners();
  }

  void clearSelection() {
    _selectedPo = null;
    notifyListeners();
  }

  /// Creates a new PO. Status is always PENDING.
  Future<String?> createPurchaseOrder({
    required String supplierId,
    required String storeId,
    required String createdByUserId,
    required List<PurchaseOrderLineItems> items,
    required DateTime expectedDeliveryDate,
    String notes = '',
    String destinationAddress = '',
  }) async {
    _setLoading(true);
    _clearMessages();

    final request = PurchaseOrder(
      supplierId: supplierId,
      storeId: storeId,
      items: items,
      expectedDeliveryDate: Timestamp.fromDateTime(expectedDeliveryDate),
      createdByUserId: createdByUserId,
      notes: notes,
      destinationAddress: destinationAddress,
    );

    final response = await _viewModel.createPurchaseOrder(request);
    if (response == null) {
      _errorMessage = _intl.failedToCreateThePurchaseOrder;
    } else {
      _successMessage = _intl.purchaseOrderSuccessfullCreate;
    }
    _setLoading(false);

    return response;
  }

  /// Records a receipt against a PO.
  /// The backend increments quantity_received on PO line items, updates
  /// PO status (PARTIALLY_RECEIVED or RECEIVED), and updates inventory.
  Future<String?> createReceivingNote({
    required PurchaseOrder po,
    required String storeId,
    required String receivedByUserId,
    required List<ReceivingNoteLineItem> items,
    String notes = '',
  }) async {
    _setLoading(true);
    _clearMessages();

    final request = ReceivingNote(
      relatedPurchaseOrderId: po.refId,
      supplierId: po.supplierId,
      storeId: storeId,
      items: items,
      receivedByUserId: receivedByUserId,
      notes: notes,
    );

    final response = await _viewModel.createReceivingNote(request);
    if (response == null) {
      _errorMessage = Intls.to.impossibleToRecordReceiving;
    } else {
      _successMessage = Intls.to.receivingRecorded.trParams({
        'refId': response,
      });
      if (_selectedPo == po.refId) {
        await selectPurchaseOrder(po.refId);
      }
    }
    _setLoading(false);

    return response;
  }

  /// Generates a bill from a PO. Delegates to BillsController.
  Future<bool> generateBill({
    required PurchaseOrder po,
    required String storeId,
    DateTime? dueDate,
    String notes = '',
  }) async {
    _setLoading(true);
    _clearMessages();

    final bill = await _billsController.createBillFromPurchaseOrder(
      po: po,
      storeId: storeId,
      dueDate: dueDate,
      notes: notes,
    );

    _successMessage = Intls.to.billGenerated;
    if (_selectedPo == po.refId) {
      await selectPurchaseOrder(po.refId);
    }
    _setLoading(false);

    return bill;
  }

  /// Cancel the purchase .
  Future<bool> cancelPurchaseOrder(PurchaseOrder po, String reason) async {
    _setLoading(true);
    _clearMessages();

    final ok = await _viewModel.cancelPurchaseOrder(po.refId);

    if (!ok) {
      _errorMessage = Intls.to.impossibleToCancelPurchaseOrder;
    } else {
      if (_selectedPo == po.refId) clearSelection();
    }
    _setLoading(false);

    return ok;
  }

  /// Clears the filters.
  void clearFilters() {
    searchQuery.add('');
    statusFilter.add(null);
    searchController.clear();
    notifyListeners();
  }

  /// Clear the error.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Clear the success.
  void clearSuccess() {
    _successMessage = '';
    notifyListeners();
  }

  void _clearMessages() {
    _errorMessage = '';
    _successMessage = '';
  }

  void _setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }

  @override
  void dispose() {
    searchController.dispose();
    _viewModel.dispose();
    super.dispose();
  }
}
