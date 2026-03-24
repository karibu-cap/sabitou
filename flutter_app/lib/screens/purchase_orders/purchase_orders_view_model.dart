import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/purchase_order_repository.dart';

/// ViewModel for Purchase Orders module.
class PurchaseOrdersViewModel {
  PurchaseOrdersViewModel({required this.storeId}) {
    _init();
  }

  final String storeId;

  final _repo = PurchaseOrderRepository.instance;

  final _searchSubject = BehaviorSubject<String>.seeded('');
  final _purchaseOrdersStream = BehaviorSubject<List<PurchaseOrder>>.seeded([]);
  final _statusFilterSubject = BehaviorSubject<PurchaseOrderStatus?>.seeded(
    null,
  );

  BehaviorSubject<String> get searchQuery => _searchSubject;
  BehaviorSubject<PurchaseOrderStatus?> get statusFilter =>
      _statusFilterSubject;

  bool get isFiltered =>
      _searchSubject.value.isNotEmpty || _statusFilterSubject.value != null;

  BehaviorSubject<List<PurchaseOrder>> get purchaseOrdersStream =>
      _purchaseOrdersStream;

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

  Future<String?> createPurchaseOrder(PurchaseOrder request) =>
      _repo.createPurchaseOrder(request);

  Future<bool> updateStatus({
    required String purchaseOrderId,
    required PurchaseOrderStatus status,
  }) => _repo.updatePurchaseOrderStatus(
    status: status,
    purchaseOrderId: purchaseOrderId,
  );

  Future<bool> cancelPurchaseOrder(String purchaseOrderId) =>
      _repo.cancelPurchaseOrder(purchaseOrderId);

  Future<String?> createReceivingNote(ReceivingNote request) =>
      _repo.createReceivingNote(request);

  void dispose() {
    _searchSubject.close();
    _statusFilterSubject.close();
  }
}
