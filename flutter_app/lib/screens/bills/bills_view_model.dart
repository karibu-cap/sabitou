import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/bill_repository.dart';
import 'components/bill_status.dart';

/// ViewModel for the Bills list screen.
/// Handles streams, filtering, and data access — no UI state.
class BillsViewModel {
  BillsViewModel({required this.storeId});

  final String storeId;

  final BillRepository _repo = BillRepository.instance;

  final _searchSubject = BehaviorSubject<String>.seeded('');
  final _statusFilterSubject = BehaviorSubject<BillStatus?>.seeded(null);

  BehaviorSubject<String> get searchQuery => _searchSubject;
  BehaviorSubject<BillStatus?> get statusFilter => _statusFilterSubject;

  bool get isFiltered =>
      _searchSubject.value.isNotEmpty || _statusFilterSubject.value != null;

  Stream<List<Bill>> get billsStream => _repo.watchBills(storeId: storeId);

  Stream<List<Bill>> get filteredBillsStream => Rx.combineLatest3(
    billsStream,
    _searchSubject.stream,
    _statusFilterSubject.stream,
    (bills, search, status) {
      var list = bills.toList();
      if (search.isNotEmpty) {
        list = list
            .where(
              (b) =>
                  b.refId.toLowerCase().contains(search.toLowerCase()) ||
                  (b.relatedPurchaseOrderId.toLowerCase().contains(
                    search.toLowerCase(),
                  )),
            )
            .toList();
      }
      if (status != null) {
        list = list
            .where((b) => BillStatusUtils.effectiveStatus(b) == status)
            .toList();
      }

      return list;
    },
  );

  // ── Stream for a single PO's bills ──
  Stream<List<Bill>> billsForPurchaseOrder(String purchaseOrderId) =>
      _repo.watchBills(storeId: storeId, purchaseOrderId: purchaseOrderId);

  // ── CRUD ──
  Future<bool> createBill(Bill bill) => _repo.createBill(bill);

  void dispose() {
    _searchSubject.close();
    _statusFilterSubject.close();
  }
}
