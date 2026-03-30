import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../core/database/query/sql_condition.dart';
import '../../../repositories/bill_repository.dart';
import '../../../repositories/payments_repository.dart';
import '../../../utils/logger.dart';

/// View model for bill detail screen.
class BillDetailViewModel {
  final LoggerApp _logger = LoggerApp('BillDetailViewModel');

  /// The bill ID to fetch.
  final String billId;

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the bill item stream.
  Stream<Bill?> get billItemStream => BillRepository.instance.watchBill(billId);

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Constructor of [BillDetailViewModel].
  BillDetailViewModel({required this.billId});

  /// Watch the related bill payment.
  Stream<List<Payment>>
  get watchBillPayment => PaymentsRepository.instance.watchPayments([
    SqlQuery(
      "EXISTS (SELECT 1 FROM json_each(related_docs) WHERE json_extract(value, '\$.docId') = '$billId')",
      null,
      SqlCondition.raw,
    ),
  ]);

  /// Merges all reactive streams into one snapshot used by the detail screen.
  Stream<BillDetailSnapshot> get detailStream => Rx.combineLatest2(
    billItemStream,
    watchBillPayment,
    (bill, payments) => BillDetailSnapshot(bill: bill, payments: payments),
  );

  /// Disposes the view model.
  void dispose() {
    _errorSubject.close();
  }
}

/// Snapshot of a bill and its linked documents.
class BillDetailSnapshot {
  /// Constructor of new [BillDetailSnapshot].
  const BillDetailSnapshot({this.bill, required this.payments});

  /// The bill order. `null` if not available.
  final Bill? bill;

  /// The payments associated with the bill.
  final List<Payment> payments;
}
