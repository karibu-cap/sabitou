import 'dart:async';

import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../repositories/bill_repository.dart';
import '../../../../repositories/payments_repository.dart';

/// A view model for the payment detail screen.
class PaymentDetailViewModel {
  /// The ID of the payment to retrieve.
  final String paymentId;

  /// Creates a new [PaymentDetailViewModel] with the given [paymentId].
  PaymentDetailViewModel({required this.paymentId});

  /// Retrieves the payment associated with [paymentId] from the repository.
  Future<Payment?> get paymentFuture {
    return PaymentsRepository.instance.findById(paymentId);
  }

  /// Deletes the payment and reverts all linked bills.
  Future<bool> deletePayment() async {
    final payment = await paymentFuture;
    if (payment == null) {
      return false;
    }

    // Revert each bill that was partially/fully paid by this payment.
    for (final doc in payment.relatedDocs) {
      await BillRepository.instance.revertPayment(doc.docId, payment);
    }

    return PaymentsRepository.instance.deletePayment(paymentId);
  }
}
