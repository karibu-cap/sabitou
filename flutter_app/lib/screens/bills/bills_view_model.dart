import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/bill_repository.dart';
import 'components/bill_status.dart';

/// ViewModel for the Bills list screen.
/// Handles streams, filtering, and data access — no UI state.
class BillsViewModel {
  /// ViewModel for the Bills list screen.
  BillsViewModel({required this.storeId});

  /// The ID of the store.
  final String storeId;

  final BillRepository _repo = BillRepository.instance;

  final _searchSubject = BehaviorSubject<String>.seeded('');
  final _statusFilterSubject = BehaviorSubject<BillStatus?>.seeded(null);

  /// The search query subject.
  BehaviorSubject<String> get searchQuery => _searchSubject;

  /// The status filter subject.
  BehaviorSubject<BillStatus?> get statusFilter => _statusFilterSubject;

  /// Whether the bills are filtered.
  bool get isFiltered =>
      _searchSubject.value.isNotEmpty || _statusFilterSubject.value != null;

  /// The future of the bills.
  Future<List<Bill>> get billsFuture => _repo.listBills(storeId: storeId);

  /// The stream of the filtered bills.
  Stream<List<Bill>> get filteredBillsStream => Rx.combineLatest3(
    Stream.fromFuture(billsFuture),
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

  /// Stream for a single PO's bills.
  Stream<List<Bill>> billsForPurchaseOrder(String purchaseOrderId) =>
      _repo.watchBills(storeId: storeId, purchaseOrderId: purchaseOrderId);

  /// Create a bill.
  Future<bool> createBill(Bill bill) => _repo.createBill(bill);

/// Dispose data.
  void dispose() {
    _searchSubject.close();
    _statusFilterSubject.close();
  }
}
