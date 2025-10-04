import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';

import '../../utils/common_functions.dart';
import 'cash_recipe_view_model.dart';

/// Controller for cash recipe screen
final class CashRecipeController extends ChangeNotifier {
  final CashRecipeViewModel _viewModel = CashRecipeViewModel();

  /// Get the view model
  CashRecipeViewModel get viewModel => _viewModel;

  /// Stream for loading state
  Stream<bool> get isLoadingStream => _viewModel.isLoadingStream;

  /// Stream for error state
  Stream<String?> get errorStream => _viewModel.errorStream;

  /// Stream for cash receipts list
  Stream<List<CashReceipt>> get cashReceiptsStream =>
      _viewModel.cashReceiptsStream;

  /// Stream for filtered cash receipts
  Stream<List<CashReceipt>> get filteredCashReceiptsStream =>
      _viewModel.filteredCashReceiptsStream;

  /// Current loading state
  bool get isLoading => _viewModel.isLoading;

  /// Current cash receipts list
  List<CashReceipt> get cashReceipts => _viewModel.cashReceipts;

  /// Current filtered cash receipts list
  List<CashReceipt> get filteredCashReceipts => _viewModel.filteredCashReceipts;

  /// Load cash receipts
  Future<void> loadCashReceipts() async {
    await _viewModel.loadCashReceipts();
  }

  /// Refresh cash receipts
  Future<void> refreshCashReceipts() async {
    await _viewModel.refreshCashReceipts();
  }

  /// Update search query
  void updateSearchQuery(String query) {
    _viewModel.updateSearchQuery(query);
  }

  /// Clear search
  void clearSearch() {
    _viewModel.clearSearch();
  }

  /// Handle cash receipt tap
  void onCashReceiptTap(BuildContext context, CashReceipt receipt) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Receipt ${receipt.documentId} tapped')),
    );
  }

  /// Show receipt preview
  Future<void> showReceiptPreview(
    BuildContext context,
    CashReceipt receipt,
  ) async {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Preview for ${receipt.documentId}')),
    );
  }

  /// Print receipt
  Future<void> printReceipt(BuildContext context, CashReceipt receipt) async {
    try {
      // TODO: Implement receipt printing
      showSuccessToast(context: context, message: 'Printing initiated');
    } on Exception catch (e) {
      showErrorToast(context: context, message: 'Printing failed');
    }
  }

  /// Dispose of the controller
  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
