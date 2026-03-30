import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../core/database/query/sql_condition.dart';
import '../../../repositories/payments_repository.dart';
import '../../../services/powersync/schema.dart';

/// View model for the Payments screen.
class PaymentsViewModel {
  /// The store ID to fetch payments for.
  final String storeId;

  /// Constructs a new [PaymentsViewModel].
  PaymentsViewModel({required this.storeId});

  /// The payments for the store.
  Future<List<Payment>> get paymentsFuture {
    return PaymentsRepository.instance.findWhere([
      SqlQuery.equals(PaymentsFields.payerId, storeId),
    ]);
  }
}
