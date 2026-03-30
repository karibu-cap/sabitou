import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/bill_repository.dart';
import '../../../repositories/payments_repository.dart';
import 'payments_view_model.dart';

/// The controller for the Payments screen.
class PaymentsController extends ChangeNotifier {
  /// The view model.
  final PaymentsViewModel _viewModel;

  /// The search query subject.
  final BehaviorSubject<String> searchQuery = BehaviorSubject<String>.seeded(
    '',
  );

  /// The status filter subject.
  final BehaviorSubject<PaymentStatus?> statusFilter =
      BehaviorSubject<PaymentStatus?>.seeded(null);

  /// The currently selected payment ID (for desktop split view).
  String? _selectedPayment;

  /// The filtered payments stream.
  Stream<List<Payment>> filteredPaymentsStream = Stream.value([]);

  /// The selected payment.
  String? get selectedPayment => _selectedPayment;

  /// Constructs a new [PaymentsController].
  PaymentsController(this._viewModel) {
    filteredPaymentsStream = Rx.combineLatest3(
      Stream.fromFuture(_viewModel.paymentsFuture),
      searchQuery.stream,
      statusFilter.stream,
      (payments, query, status) {
        var filtered = payments;

        if (status != null) {
          filtered = filtered.where((p) => p.status == status).toList();
        }

        if (query.isNotEmpty) {
          final q = query.toLowerCase();
          filtered = filtered.where((p) {
            return p.refId.toLowerCase().contains(q) ||
                p.referenceNumber.toLowerCase().contains(q) ||
                p.receiverRef.toLowerCase().contains(q);
          }).toList();
        }

        // Sort by date descending
        filtered.sort(
          (a, b) =>
              b.paymentDate.toDateTime().compareTo(a.paymentDate.toDateTime()),
        );

        return filtered;
      },
    ).asBroadcastStream();
  }

  /// Selects a payment.
  void selectPayment(String? paymentId) {
    if (_selectedPayment == paymentId) {
      return;
    }
    _selectedPayment = paymentId;
    notifyListeners();
  }

  /// Deletes a payment and reverts all linked bills.
  Future<void> deletePayment(String paymentId) async {
    // Fetch the payment first so we can read its relatedDocs.
    final payment = await PaymentsRepository.instance.findById(paymentId);

    if (payment != null) {
      // Revert each bill that this payment partially/fully covered.
      for (final doc in payment.relatedDocs) {
        await BillRepository.instance.revertPayment(doc.docId, payment);
      }
    }

    await PaymentsRepository.instance.deletePayment(paymentId);

    if (_selectedPayment == paymentId) {
      _selectedPayment = null;
      notifyListeners();
    }
  }

  @override
  void dispose() {
    searchQuery.close();
    statusFilter.close();
    super.dispose();
  }
}
