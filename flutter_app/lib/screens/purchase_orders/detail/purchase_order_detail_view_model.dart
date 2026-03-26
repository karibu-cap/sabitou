import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/bill_repository.dart';
import '../../../repositories/purchase_order_repository.dart';
import '../components/po_utils.dart';

/// ViewModel scoped to ONE purchase order.
class PurchaseOrderDetailViewModel {
  /// A ViewModel scoped to ONE purchase order.
  /// [purchaseOrderId] The ID of the purchase order to manage.
  /// [storeId] The ID of the store this purchase order is related to.
  PurchaseOrderDetailViewModel({
    required this.purchaseOrderId,
    required this.storeId,
  });

  /// The ID of the purchase order to manage.
  final String purchaseOrderId;

  /// The ID of the store this purchase order is related to.
  final String storeId;

  final _poRepo = PurchaseOrderRepository.instance;
  final _billsRepo = BillRepository.instance;

  /// Watchs curren purchase order.
  Stream<PurchaseOrder?> get purchaseOrderStream =>
      _poRepo.watchPurchaseOrder(purchaseOrderId);

  /// The list of bill link to the purchase.
  Stream<List<Bill>> get billsStream =>
      _billsRepo.watchBills(storeId: storeId, purchaseOrderId: purchaseOrderId);

  ///The list of bill link to the purchase.
  Stream<List<ReceivingNote>> get receivingNotesStream => _poRepo
      .streamPurchaseReceivingNotes(storeId, purchaseOrderId)
      .map(
        (notes) => notes
            .where((n) => n.relatedPurchaseOrderId == purchaseOrderId)
            .toList(),
      );

  /// Merges all reactive streams into one snapshot used by the detail screen.
  Stream<PurchaseOrderDetailSnapshot> get detailStream => Rx.combineLatest3(
    purchaseOrderStream,
    billsStream,
    receivingNotesStream,
    (po, bills, notes) => PurchaseOrderDetailSnapshot(
      po: po,
      bills: bills,
      receivingNotes: notes,
    ),
  );

  /// Records goods received against this PO.
  Future<String?> createReceivingNote(ReceivingNote request) =>
      _poRepo.createReceivingNote(request);

  /// Cancels the purchase order with the given [poId].
  Future<bool> cancelPurchaseOrder(String poId) =>
      _poRepo.cancelPurchaseOrder(poId);

  /// Updates the status of a purchase order.
  Future<bool> updateStatus({
    required String purchaseOrderId,
    required PurchaseOrderStatus status,
  }) => _poRepo.updatePurchaseOrderStatus(
    purchaseOrderId: purchaseOrderId,
    status: status,
  );

  /// Creates a new bill.
  Future<bool> createBill(Bill request) => _billsRepo.createBill(request);
}
