import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/bill_repository.dart';
import '../../repositories/purchase_order_repository.dart';
import 'components/po_utils.dart';

/// ViewModel for Purchase Orders module.
class PurchaseOrdersViewModel {
  /// Constructor of new [PurchaseOrdersViewModel].
  PurchaseOrdersViewModel({required this.storeId}) {
    _init();
  }

  /// The current store id.
  final String storeId;

  final _repo = PurchaseOrderRepository.instance;

  final _searchSubject = BehaviorSubject<String>.seeded('');
  final _purchaseOrdersStream = BehaviorSubject<List<PurchaseOrder>>.seeded([]);
  final _statusFilterSubject = BehaviorSubject<PurchaseOrderStatus?>.seeded(
    null,
  );
  final _poRepo = PurchaseOrderRepository.instance;
  final _billsRepo = BillRepository.instance;

  /// The [searchQuery].
  BehaviorSubject<String> get searchQuery => _searchSubject;

  ///  The [statusFilter].
  BehaviorSubject<PurchaseOrderStatus?> get statusFilter =>
      _statusFilterSubject;

  /// Whether we are filtered.
  bool get isFiltered =>
      _searchSubject.value.isNotEmpty || _statusFilterSubject.value != null;

  /// Stream the purchase order.
  BehaviorSubject<List<PurchaseOrder>> get purchaseOrdersStream =>
      _purchaseOrdersStream;

  /// Filter the purchases order.
  Stream<List<PurchaseOrder>> get filteredPurchaseOrdersStream =>
      Rx.combineLatest3(
        purchaseOrdersStream,
        _searchSubject.stream,
        _statusFilterSubject.stream,
        (orders, search, status) {
          var list = orders.toList();
          if (search.isNotEmpty) {
            final q = search.toLowerCase();
            list = list
                .where(
                  (o) =>
                      o.refId.toLowerCase().contains(q) ||
                      (o.supplierName).toLowerCase().contains(q),
                )
                .toList();
          }
          if (status != null) {
            list = list.where((o) => o.status == status).toList();
          }
          // Sort by order_date descending
          list.sort(
            (a, b) =>
                b.orderDate.toDateTime().compareTo(a.orderDate.toDateTime()),
          );

          return list;
        },
      );

  Future<void> _init() async {
    _repo
        .watchPurchaseOrders(storeId: storeId)
        .listen(_purchaseOrdersStream.add);
  }

  /// The list of bill link to the purchase.
  Stream<List<Bill>> billsStream(String purchaseOrderId) =>
      _billsRepo.watchBills(storeId: storeId, purchaseOrderId: purchaseOrderId);

  ///The list of bill link to the purchase.
  Stream<List<ReceivingNote>> receivingNotesStream(String purchaseOrderId) =>
      _poRepo
          .streamPurchaseReceivingNotes(storeId, purchaseOrderId)
          .map(
            (notes) => notes
                .where((n) => n.relatedPurchaseOrderId == purchaseOrderId)
                .toList(),
          );

  /// Merges all reactive streams into one snapshot used by the detail screen.
  Stream<PurchaseOrderDetailSnapshot> detailStream(String purchaseOrderId) =>
      Rx.combineLatest3(
        Stream.value(null),
        billsStream(purchaseOrderId),
        receivingNotesStream(purchaseOrderId),
        (po, bills, notes) => PurchaseOrderDetailSnapshot(
          bills: bills,
          receivingNotes: notes,
        ),
      );

  /// Disposes and close the stream.
  void dispose() {
    _searchSubject.close();
    _statusFilterSubject.close();
    _purchaseOrdersStream.close();
  }
}
