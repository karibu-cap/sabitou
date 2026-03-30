import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'payment_detail_view_model.dart';

/// A controller for the payment detail screen.
class PaymentDetailController extends ChangeNotifier {
  /// The view model for the payment detail screen.
  final PaymentDetailViewModel viewModel;

  /// A payment item future.
  Future<Payment?> get paymentFuture => viewModel.paymentFuture;

  /// Creates a [PaymentDetailController] with the given [viewModel].
  PaymentDetailController({required this.viewModel});

  /// Deletes the payment associated with this controller.
  Future<bool> deletePayment() => viewModel.deletePayment();
}
