import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/bill_repository.dart';
import '../../../repositories/purchase_order_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../components/po_utils.dart';
import 'purchase_order_detail_view_model.dart';

/// Controller for the purchase order detail screen.
class PurchaseOrderDetailController extends ChangeNotifier {
  /// Creates a new [PurchaseOrderDetailController].
  PurchaseOrderDetailController({
    required this.purchaseOrderId,
    required this.store,
  }) : _viewModel = PurchaseOrderDetailViewModel(
         purchaseOrderId: purchaseOrderId,
         storeId: store.refId,
       );

  final PurchaseOrderDetailViewModel _viewModel;

  /// The store to which this PO belongs.
  final Store store;

  /// The ID of the purchase order being viewed.
  final String purchaseOrderId;

  String _errorMessage = '';
  bool _isLoading = false;
  String _successMessage = '';

  /// `true` while an async operation is in progress.
  bool get isLoading => _isLoading;

  /// Non-empty when the last action produced an error.
  String get errorMessage => _errorMessage;

  /// Non-empty when the last action produced a success notification.
  String get successMessage => _successMessage;

  /// Returns `true` if [status] allows creating new receiving notes.
  ///
  /// Receiving is allowed on PENDING, ISSUED and CLOSED POs.  On a CLOSED PO
  /// (created via a direct bill) the receive form pre-fills and locks the
  /// quantities to match what was billed.
  bool canReceive(PurchaseOrderStatus status) =>
      PoStatusUtils.canReceive(status);

  /// Returns `true` if [status] allows generating a bill.
  bool canGenerateBill(PurchaseOrderStatus status) =>
      PoStatusUtils.canGenerateBill(status);

  /// Returns `true` if [status] allows cancellation.
  bool canCancel(PurchaseOrderStatus status) => PoStatusUtils.canCancel(status);

  /// Reactive stream combining the PO, its bills, and its receiving notes.
  Stream<PurchaseOrderDetailSnapshot> get detailStream =>
      _viewModel.detailStream;

  /// Records goods received against this PO.
  ///
  /// Returns the generated [ReceivingNote.refId] on success, or `null` on
  /// failure.
  Future<String?> createReceivingNote({
    required PurchaseOrder po,
    required String storeId,
    required String receivedByUserId,
    required DateTime receivedAt,
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
      receivedAt: Timestamp.fromDateTime(receivedAt),
      notes: notes,
      createdAt: Timestamp.fromDateTime(DateTime.now()),
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

  /// Generates a bill directly from [purchaseOrder] (the "full PO" path).
  ///
  /// This is called when the admin skips the receive step and bills the
  /// entire PO at once (Scenario 1).  Moving to
  /// [PurchaseOrderStatus.PO_STATUS_CLOSED] is triggered by
  /// [_syncPOStatus] after a successful save.
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
      storeId: store.refId,
      supplierId: purchaseOrder.supplierId,
      relatedPurchaseOrderId: purchaseOrder.refId,
      items: items,
      subTotal: purchaseOrder.subTotal,
      taxTotal: purchaseOrder.taxTotal,
      totalAmount: purchaseOrder.totalAmount,
      balanceDue: purchaseOrder.totalAmount,
      currency: purchaseOrder.currency,
      dueDate: Timestamp.fromDateTime(due),
      notes: notes,
      status: BillStatus.BILL_STATUS_OPEN,
    );

    final ok = await BillRepository.instance.createBill(request);
    if (!ok) {
      _errorMessage = Intls.to.impossibleToGenerateBill;
    } else {
      _successMessage = Intls.to.billGenerated;
      unawaited(_syncPOStatus());
    }
    _setLoading(false);

    return ok;
  }

  /// Deletes the bill identified by [billRefId] and re-evaluates PO status.
  ///
  /// If the deleted bill was the only one covering all items the PO reverts
  /// to [PurchaseOrderStatus.PO_STATUS_ISSUED] (receives still exist) or
  /// [PurchaseOrderStatus.PO_STATUS_PENDING].
  Future<bool> deleteBill(String billRefId) async {
    final result = await BillRepository.instance.deleteBill(billRefId);
    if (result) {
      // Re-sync PO status now that a bill has been removed.
      unawaited(_syncPOStatus());
      notifyListeners();
    }

    return result;
  }

  /// Asks [PurchaseOrderRepository] to re-evaluate and persist the correct
  /// PO status based on the current bills and receiving notes.
  Future<void> _syncPOStatus() async {
    await PurchaseOrderRepository.instance.syncPOStatusFromBills(
      purchaseOrderId: purchaseOrderId,
      storeId: store.refId,
    );
  }

  /// Explicitly updates the status of the purchase order.
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

  /// Cancels the purchase order.
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

  /// Re-fetches ancillary data (e.g. payments) that are not driven by the
  /// reactive [detailStream].
  Future<void> reload() async {
    // Reserved for future one-shot data (payments, attachments, etc.).
  }

  /// Clears the current error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Clears the current success message.
  void clearSuccess() {
    _successMessage = '';
    notifyListeners();
  }

  @override
  void dispose() {
    // ViewModel holds no closeable streams; nothing to close here.
    super.dispose();
  }

  void _setLoading(bool v) {
    _isLoading = v;
    _errorMessage = '';
    _successMessage = '';
    notifyListeners();
  }
}
