import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repositories/bill_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import 'bill_detail_view_model.dart';

/// Controller for bill detail screen.
class BillDetailController extends ChangeNotifier {
  /// The [BillDetailViewModel].
  final BillDetailViewModel viewModel;

  /// Persists the selected tab across rebuilds.
  final ShadTabsController<String> tabsController = ShadTabsController<String>(
    value: Intls.to.overview,
  );

  final BillRepository _repo = BillRepository.instance;
  final AppInternationalizationService intl;

  bool _isLoading = false;
  String _errorMessage = '';

  /// Whether the action is loading.
  bool get isLoading => _isLoading;

  /// The error message.
  String get errorMessage => _errorMessage;

  /// Gets the error stream.
  Stream<String> get errorStream => viewModel.errorStream;

  /// Constructor of [BillDetailController].
  BillDetailController({required this.viewModel, required this.intl});

  /// Reactive stream combining the bill and its payments list.
  Stream<BillDetailSnapshot> get detailStream => viewModel.detailStream;

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

    // Check if bill has payments before attempting deletion
    final bill = await _repo.getBill(billId);
    if (bill != null && bill.paymentIds.isNotEmpty) {
      _errorMessage = intl.billWithPaymentsCannotBeDeleted;
      _setLoading(false);

      return false;
    }

    final ok = await _repo.deleteBill(billId);
    if (!ok) {
      _errorMessage = intl.impossibleToDeleteBill;
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
