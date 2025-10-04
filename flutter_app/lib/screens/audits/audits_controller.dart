import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/common_functions.dart';
import 'audits_view_model.dart';

/// The [AuditsController].
final class AuditsController extends ChangeNotifier {
  final AuditsViewModel _viewModel = AuditsViewModel();

  /// Completer for initialization
  final Completer<bool>? completer = Completer<bool>();

  /// Get the view model
  AuditsViewModel get viewModel => _viewModel;

  /// Stream for loading state
  Stream<bool> get isLoadingStream => _viewModel.isLoadingStream;

  /// Stream for error state
  Stream<String?> get errorStream => _viewModel.errorStream;

  /// Stream for inventory transactions
  Stream<List<InventoryTransaction>> get inventoryTransactionsStream =>
      _viewModel.inventoryTransactionsStream;

  /// Stream for voucher transactions
  Stream<List<VoucherTransaction>> get voucherTransactionsStream =>
      _viewModel.voucherTransactionsStream;

  /// Stream for filtered inventory transactions
  Stream<List<InventoryTransaction>> get filteredInventoryTransactionsStream =>
      _viewModel.filteredInventoryTransactionsStream;

  /// Stream for filtered voucher transactions
  Stream<List<VoucherTransaction>> get filteredVoucherTransactionsStream =>
      _viewModel.filteredVoucherTransactionsStream;

  /// Stream for active tab
  Stream<TransactionTab> get activeTabStream => _viewModel.activeTabStream;

  /// Current loading state
  bool get isLoading => _viewModel.isLoading;

  /// Current error state
  String? get error => _viewModel.error;

  /// Current inventory transactions
  List<InventoryTransaction> get inventoryTransactions =>
      _viewModel.inventoryTransactions;

  /// Current voucher transactions
  List<VoucherTransaction> get voucherTransactions =>
      _viewModel.voucherTransactions;

  /// Current filtered inventory transactions
  List<InventoryTransaction> get filteredInventoryTransactions =>
      _viewModel.filteredInventoryTransactions;

  /// Current filtered voucher transactions
  List<VoucherTransaction> get filteredVoucherTransactions =>
      _viewModel.filteredVoucherTransactions;

  /// Current active tab
  TransactionTab get activeTab => _viewModel.activeTab;

  /// Constructor of new [AuditsController].
  AuditsController(AuditsViewModel viewModel) {
    _initialize();
  }

  /// Initialize the controller
  Future<void> _initialize() async {
    try {
      // Listen to error stream to show error toasts
      _viewModel.errorStream.listen((error) {
        if (error != null && error.isNotEmpty) {
          // The error will be handled by the UI listening to the stream
        }
      });

      // Load initial data
      await _viewModel.loadTransactions();

      // Mark initialization as complete
      completer?.complete(true);
    } on Exception catch (e) {
      if (completer != null && !(completer?.isCompleted ?? true)) {
        completer?.completeError(e);
      }
    }
  }

  /// Load all transactions
  Future<void> loadTransactions() async {
    await _viewModel.loadTransactions();
  }

  /// Refresh all transactions
  Future<void> refreshTransactions() async {
    await _viewModel.refreshTransactions();
  }

  /// Update search query
  void updateSearchQuery(String query) {
    _viewModel.updateSearchQuery(query);
  }

  /// Clear search
  void clearSearch() {
    _viewModel.clearSearch();
  }

  /// Update date filter
  void updateDateFilter(String dateFilter) {
    _viewModel.updateDateFilter(dateFilter);
  }

  /// Switch to inventory tab
  void switchToInventoryTab() {
    _viewModel.switchToInventoryTab();
  }

  /// Switch to voucher tab
  void switchToVoucherTab() {
    _viewModel.switchToVoucherTab();
  }

  /// Handle transaction tap
  void onTransactionTap(BuildContext context, dynamic transaction) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text('Transaction tapped')));
  }

  /// Export transactions
  Future<void> exportTransactions(BuildContext context) async {
    try {
      showSuccessToast(context: context, message: Intls.to.exportInitiated);
    } on Exception catch (e) {
      showErrorToast(context: context, message: Intls.to.exportFailed);
    }
  }

  /// Dispose of the controller
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }

  /// Static method to get the controller from context
  static AuditsController of(BuildContext context) {
    return Provider.of<AuditsController>(context, listen: false);
  }

  /// Static method to watch the controller from context
  static AuditsController watch(BuildContext context) {
    return Provider.of<AuditsController>(context);
  }
}
