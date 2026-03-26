import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/payments_repository.dart';
import 'payments_view_model.dart';

/// The controller for the Payments screen.
class PaymentsController extends ChangeNotifier {
  /// The view model.
  final PaymentsViewModel _viewModel;

  /// The search query subject.
  final BehaviorSubject<String> searchQuery = BehaviorSubject<String>.seeded('');

  /// The status filter subject.
  final BehaviorSubject<PaymentStatus?> statusFilter =
      BehaviorSubject<PaymentStatus?>.seeded(null);

  /// The currently selected payment ID (for desktop split view).
  String? _selectedPayment;
  String? get selectedPayment => _selectedPayment;

  /// Selects a payment.
  void selectPayment(String? paymentId) {
    _selectedPayment = paymentId;
    notifyListeners();
  }

  /// The filtered payments stream.
  late final Stream<List<Payment>> filteredPaymentsStream;

  /// Constructs a new [PaymentsController].
  PaymentsController(this._viewModel) {
    filteredPaymentsStream = Rx.combineLatest3(
      _viewModel.paymentsStream,
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
                   p.receiver.toLowerCase().contains(q);
          }).toList();
        }
        
        // Sort by date descending
        filtered.sort((a, b) => b.paymentDate.compareTo(a.paymentDate));

        return filtered;
      },
    ).asBroadcastStream();
  }

  /// Deletes a payment.
  Future<void> deletePayment(String paymentId) async {
    await PaymentsRepository.instance.delete(paymentId);
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
