import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/internationalization/internationalization.dart';
import 'bills_view_model.dart';

/// Controller for the Bills screen.
/// Bridges ViewModel → UI; holds loading/error state and selected bill.
class BillsController extends ChangeNotifier {
  BillsController(this._viewModel, this._intl) {
    searchController = TextEditingController();
  }

  final BillsViewModel _viewModel;

  final AppInternationalizationService _intl;

  late final TextEditingController searchController;

  bool _isLoading = false;
  String _errorMessage = '';

  /// Currently selected bill (for desktop split view).
  String? _selectedBill;

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String? get selectedBill => _selectedBill;
  bool get isFiltered => _viewModel.isFiltered;

  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;
  BehaviorSubject<BillStatus?> get statusFilter => _viewModel.statusFilter;

  Stream<List<Bill>> get billsStream => _viewModel.billsStream;
  Stream<List<Bill>> get filteredBillsStream => _viewModel.filteredBillsStream;

  Stream<List<Bill>> billsForPurchaseOrder(String purchaseOrderId) =>
      _viewModel.billsForPurchaseOrder(purchaseOrderId);

  /// Selection (desktop split view).
  void selectBill(String? billId) {
    _selectedBill = billId;
    notifyListeners();
  }

  // ── Create Bill from a PurchaseOrder ──
  Future<bool> createBillFromPurchaseOrder({
    required PurchaseOrder po,
    required String storeId,
    DateTime? dueDate,
    String notes = '',
  }) async {
    _setLoading(true);

    final items = po.items
        .map(
          (i) => BillLineItem(
            productId: i.productId,
            description: i.productName.fr.isNotEmpty
                ? i.productName.fr
                : i.productName.en,
            quantity: i.quantityOrdered,
            unitPrice: i.unitPrice,
            taxAmount: i.taxAmount,
            total: i.total,
          ),
        )
        .toList();

    final due = dueDate ?? DateTime.now().add(const Duration(days: 30));

    final request = Bill(
      storeId: storeId,
      supplierId: po.supplierId,
      relatedPurchaseOrderId: po.refId,
      items: items,
      subTotal: po.subTotal,
      taxTotal: po.taxTotal,
      totalAmount: po.totalAmount,
      balanceDue: po.totalAmount,
      currency: po.currency ?? 'XAF',
      dueDate: Timestamp.fromDateTime(due),
      notes: notes,
      status: BillStatus.BILL_STATUS_OPEN,
    );

    final result = await _viewModel.createBill(request);
    if (!result) {
      _errorMessage = _intl.impossibleToCreateBill;
    }
    _setLoading(false);

    return result;
  }

  /// Creates a manual bill (from the bill form).
  Future<bool> createBill(Bill request) async {
    _setLoading(true);
    final result = await _viewModel.createBill(request);
    if (!result) {
      _errorMessage = _intl.impossibleToCreateBill;
    }
    _setLoading(false);

    return result;
  }

  /// Clears current filters and search.
  void clearFilters() {
    searchQuery.add('');
    statusFilter.add(null);
    searchController.clear();
    notifyListeners();
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
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
