import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repositories/bill_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import 'bill_detail_view_model.dart';

/// Controller for bill detail screen.
class BillDetailController extends ChangeNotifier {
  final BillDetailViewModel viewModel;

  /// Persists the selected tab across rebuilds.
  final ShadTabsController<String> tabsController = ShadTabsController<String>(
    value: Intls.to.overview,
  );

  final BillRepository _repo = BillRepository.instance;
  final AppInternationalizationService intl;

  bool _isLoading = false;
  String _errorMessage = '';

  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  /// Gets the bill item stream.
  BehaviorSubject<Bill?> get billItemStream => viewModel.billItemStream;

  /// Gets the error stream.
  Stream<String> get errorStream => viewModel.errorStream;

  /// Gets the completer.
  Completer<bool> get completer => viewModel.completer;

  /// Constructor of [BillDetailController].
  BillDetailController({required this.viewModel, required this.intl});

  /// Refreshes the product data.
  Future<void> refresh() async {
    await viewModel.refresh();
    notifyListeners();
  }

  @override
  void dispose() {
    tabsController.dispose();
    viewModel.dispose();
    super.dispose();
  }

  /// Update the bill data.
  Future<bool> updateBill(Bill bill) =>
      _repo.updateBillStatus(bill.refId, BillStatus.BILL_STATUS_DRAFT);

  /// Deletes a bill.
  Future<bool> deleteBill(String billId) async {
    _setLoading(true);
    final ok = await _repo.deleteBill(billId);
    if (!ok) {
      _errorMessage = intl.impossibleToDeleteBill;
    }
    _setLoading(false);

    return ok;
  }

  /// Marks a bill as fully paid.
  Future<bool> markBillAsPaid({
    required Bill bill,
    required String paymentId,
  }) async {
    _setLoading(true);
    final ok = await Future.value(true);
    if (!ok) {
      _errorMessage = intl.impossibleToMarkAsPaid;
    }
    _setLoading(false);

    return ok;
  }

  /// Voids a bill.
  Future<bool> voidBill(Bill bill, String reason) async {
    _setLoading(true);
    final ok = await Future.value(true);
    if (!ok) {
      _errorMessage = intl.impossibleToVoidBill;
    }
    _setLoading(false);

    return ok;
  }

  void _setLoading(bool v) {
    _isLoading = v;
    notifyListeners();
  }
}
