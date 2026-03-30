import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/bill_repository.dart';
import '../../services/internationalization/internationalization.dart';
import 'bills_view_model.dart';

/// Controller for the Bills screen.
/// Bridges ViewModel → UI; holds loading/error state and selected bill.
class BillsController extends ChangeNotifier {
  /// Controller for the Bills screen.
  BillsController(this._viewModel, this._intl);

  /// ViewModel for the Bills screen.
  final BillsViewModel _viewModel;

  /// Service for internationalization.
  final AppInternationalizationService _intl;

  /// Text editing controller for the search bar.
  final TextEditingController searchController = TextEditingController();

  /// Whether the screen is currently loading data.
  bool _isLoading = false;

  /// Error message to display to the user.
  String _errorMessage = '';

  /// Currently selected bill (for desktop split view).
  String? _selectedBill;

  /// Whether the screen is currently loading data.
  bool get isLoading => _isLoading;

  /// Error message to display to the user.
  String get errorMessage => _errorMessage;

  /// Currently selected bill (for desktop split view).
  String? get selectedBill => _selectedBill;

  /// Whether the screen is currently filtered.
  bool get isFiltered => _viewModel.isFiltered;

  /// Stream of search queries.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Stream of status filters.
  BehaviorSubject<BillStatus?> get statusFilter => _viewModel.statusFilter;

  /// Stream of all bills.
  Stream<List<Bill>> get billsStream => _viewModel.billsStream;

  /// Stream of filtered bills.
  Stream<List<Bill>> get filteredBillsStream => _viewModel.filteredBillsStream;

  /// Stream of bills for a given purchase order.
  Stream<List<Bill>> billsForPurchaseOrder(String purchaseOrderId) =>
      _viewModel.billsForPurchaseOrder(purchaseOrderId);

  /// Selection (desktop split view).
  void selectBill(String? billId) {
    if (_selectedBill == billId) {
      return;
    }
    _selectedBill = billId;
    notifyListeners();
  }

  /// Create Bill from a PurchaseOrder.
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
      currency: po.currency,
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

  /// Deletes the bill.
  Future<bool> deleteBill(String refId) async {
    // Check if bill has payments before attempting deletion
    final bill = await BillRepository.instance.getBill(refId);
    if (bill != null && bill.paymentIds.isNotEmpty) {
      _errorMessage = _intl.billWithPaymentsCannotBeDeleted;
      notifyListeners();

      return false;
    }

    final result = await BillRepository.instance.deleteBill(refId);

    if (!result) {
      _errorMessage = _intl.impossibleToDeleteBill;
    }

    notifyListeners();

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
