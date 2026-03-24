import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/bill_repository.dart';
import '../../../repositories/purchase_order_repository.dart';

/// ViewModel scoped to ONE purchase order.
///
/// Unlike [PurchaseOrderDetailViewModel] which handles the full list,
/// this one only cares about a single [purchaseOrderId].
/// Provides reactive streams for the PO itself, its linked bills,
/// and its linked receiving notes.
class PurchaseOrderDetailViewModel {
  PurchaseOrderDetailViewModel({
    required this.purchaseOrderId,
    required this.storeId,
  });

  final String purchaseOrderId;
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

  // Merges all reactive streams into one snapshot used by the detail screen.
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

  Future<String?> createReceivingNote(ReceivingNote request) =>
      _poRepo.createReceivingNote(request);

  Future<bool> cancelPurchaseOrder(String poId) =>
      _poRepo.cancelPurchaseOrder(poId);

  Future<bool> updateStatus({
    required String purchaseOrderId,
    required PurchaseOrderStatus status,
  }) => _poRepo.updatePurchaseOrderStatus(
    purchaseOrderId: purchaseOrderId,
    status: status,
  );

  Future<bool> createBill(Bill request) => _billsRepo.createBill(request);
}

/// Snapshot of a PO and its linked documents — emitted by [PurchaseOrderDetailSnapshot.detailStream].
/// Snapshot of a PO and its linked documents — emitted by [PurchaseOrderDetailSnapshot.detailStream].
class PurchaseOrderDetailSnapshot {
  const PurchaseOrderDetailSnapshot({
    required this.po,
    required this.bills,
    required this.receivingNotes,
  });

  final PurchaseOrder? po;
  final List<Bill> bills;
  final List<ReceivingNote> receivingNotes;

  bool get hasPo => po != null;
}
