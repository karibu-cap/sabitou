import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import 'inventory_detail_view_model.dart';

/// Controller for inventory detail screen.
class InventoryDetailController extends ChangeNotifier {
  final InventoryDetailViewModel _viewModel;

  /// Persists the selected tab across rebuilds.
  final ShadTabsController<String> tabsController = ShadTabsController<String>(
    value: Intls.to.overview,
  );

  /// Gets the inventory item stream.
  Stream<InventoryLevelWithProduct?> get inventoryItemStream =>
      _viewModel.inventoryItemStream;

  /// Gets the transactions stream.
  Stream<List<InventoryTransaction>> get transactionsStream =>
      _viewModel.transactionsStream;

  /// Gets the transaction filter stream.
  Stream<TransactionType?> get transactionFilterStream =>
      _viewModel.transactionFilterStream;

  /// Gets the error stream.
  Stream<String> get errorStream => _viewModel.errorStream;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// Constructor of [InventoryDetailController].
  InventoryDetailController(this._viewModel);

  /// Updates the transaction filter.
  ///
  /// Delegates to the view model which pushes the new value into
  /// [transactionFilterStream]. The [StreamBuilder] in [TransactionsTab]
  /// reacts automatically — no [notifyListeners] needed here.
  void updateTransactionFilter(TransactionType filter) {
    _viewModel.updateTransactionFilter(filter);
  }

  /// Refreshes the product data.
  Future<void> refresh() async {
    await _viewModel.refresh();
    notifyListeners();
  }

  @override
  void dispose() {
    tabsController.dispose();
    _viewModel.dispose();
    super.dispose();
  }
}
