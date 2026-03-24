import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/bill_repository.dart';
import '../../../repositories/purchase_order_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../components/po_utils.dart';
import 'purchase_order_detail_view_model.dart';

/// Controller scoped to the detail view of ONE purchase order.
///
/// - A reactive [detailStream] (PO + bills + receiving notes, live updates)
/// - One-time [payments] from the full RPC response
/// - Loading / error state
///
/// Created and provided by [PurchaseOrderDetailController].
class PurchaseOrderDetailController extends ChangeNotifier {
  PurchaseOrderDetailController({
    required this.purchaseOrderId,
    required this.storeId,
  }) : _viewModel = PurchaseOrderDetailViewModel(
         purchaseOrderId: purchaseOrderId,
         storeId: storeId,
       ) {
    _init();
  }

  final PurchaseOrderDetailViewModel _viewModel;
  final String storeId;
  final String purchaseOrderId;
  String _errorMessage = '';
  bool _isLoading = false;
  String _successMessage = '';
  final List<Payment> _payments = [];

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;
  String get successMessage => _successMessage;

  bool canReceive(PurchaseOrderStatus status) =>
      PoStatusUtils.canReceive(status);
  bool canGenerateBill(PurchaseOrderStatus status) =>
      PoStatusUtils.canGenerateBill(status);
  bool canCancel(PurchaseOrderStatus status) => PoStatusUtils.canCancel(status);

  List<Payment> get payments => _payments;

  /// Live stream: PO + bills + receiving notes updated reactively.
  Stream<PurchaseOrderDetailSnapshot> get detailStream =>
      _viewModel.detailStream;

  Future<void> _init() async {
    await _fetchPayments();
  }

  /// Fetches the one-time data (payments) from the full RPC response.
  /// The PO / bills / receiving notes are handled reactively via [detailStream].
  Future<void> _fetchPayments() async {
    // _isLoading = true;
    // _errorMessage = '';
    // notifyListeners();

    // final response = await _viewModel.fetchDetail();
    // if (response == null) {
    //   _errorMessage = Intls.to.impossibleToLoadPurchaseOrderData;
    // } else {
    //   _payments = response.payments.toList();
    // }

    // _isLoading = false;
    // notifyListeners();
  }

  /// Called by [CommonPurchaseDetailController] after a mutation
  /// that requires refreshing the payments list (e.g. after marking a bill paid).
  Future<void> reload() => _fetchPayments();

  @override
  void dispose() {
    _viewModel; // no streams to close here — owned by ViewModel
    super.dispose();
  }

  /// Records goods received against this PO.
  ///
  /// The backend:
  /// 1. Creates the [ReceivingNote]
  /// 2. Increments [PurchaseOrderLineItems.quantityReceived]
  /// 3. Sets PO status → PARTIALLY_RECEIVED or RECEIVED
  /// 4. Updates [InventoryLevel.quantityOnHand] and [quantityAvailable]
  /// 5. Creates [Batch] entries with purchase price + expiration
  /// 6. Creates [InventoryTransaction] of type PURCHASE
  Future<String?> createReceivingNote({
    required PurchaseOrder po,
    required String storeId,
    required String receivedByUserId,
    required List<ReceivingNoteLineItem> items,
    String notes = '',
  }) async {
    _setLoading(true);

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
    }
    _setLoading(false);

    return response;
  }

  /// Generates a bill from this PO.
  ///
  /// Freezes sub_total, tax_total, total_amount from the PO.
  /// Created with [BillStatus.BILL_STATUS_OPEN].
  /// Due date defaults to 30 days from today if not specified.
  Future<bool?> generateBill({
    DateTime? dueDate,
    String notes = '',
    required PurchaseOrder purchaseOrder,
  }) async {
    _setLoading(true);

    final items = purchaseOrder.items
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
      supplierId: purchaseOrder.supplierId,
      relatedPurchaseOrderId: purchaseOrder.refId,
      items: items,
      subTotal: purchaseOrder.subTotal,
      taxTotal: purchaseOrder.taxTotal,
      totalAmount: purchaseOrder.totalAmount,
      balanceDue: purchaseOrder.totalAmount,
      currency: purchaseOrder.currency ?? 'XAF',
      dueDate: Timestamp.fromDateTime(due),
      notes: notes,
      status: BillStatus.BILL_STATUS_OPEN,
    );

    final bill = await BillRepository.instance.createBill(request);
    if (!bill) {
      _errorMessage = Intls.to.impossibleToGenerateBill;
    } else {
      _successMessage = Intls.to.billGenerated;
    }
    _setLoading(false);

    return bill;
  }

  Future<bool> cancelPurchaseOrder({
    String reason = '',
    required String userId,
  }) async {
    _setLoading(true);

    final ok = await PurchaseOrderRepository.instance.cancelPurchaseOrder(
      purchaseOrderId,
    );

    if (!ok) {
      _errorMessage = Intls.to.impossibleToCancelPurchaseOrder;
    } else {
      _successMessage = Intls.to.purchaseOrderCancelled;
    }
    _setLoading(false);

    return ok;
  }

  Future<bool> updateStatus({
    required PurchaseOrderStatus newStatus,
    String notes = '',
  }) async {
    _setLoading(true);

    final ok = await PurchaseOrderRepository.instance.updatePurchaseOrderStatus(
      purchaseOrderId: purchaseOrderId,
      status: newStatus,
    );

    if (!ok) {
      _errorMessage = Intls.to.impossibleToUpdateStatus;
    }
    _setLoading(false);

    return ok;
  }

  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  void clearSuccess() {
    _successMessage = '';
    notifyListeners();
  }

  void _setLoading(bool v) {
    _isLoading = v;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();
  }
}
