import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'transactions_view_model.dart';

/// Controller for transactions screen
class TransactionsController extends ChangeNotifier {
  final TransactionsViewModel _viewModel;

  /// Gets the filtered products stream.
  Stream<List<Transaction>> get filteredTransactionsStream =>
      _viewModel.filteredTransactionsStream;

  /// Gets the products stream.
  BehaviorSubject<UnmodifiableListView<Transaction>> get transactionsStream =>
      _viewModel.transactionStream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets the selected type.
  BehaviorSubject<TransactionType?> get selectedType => _viewModel.selectedType;

  /// Gets the selected status.
  BehaviorSubject<TransactionStatus?> get selectedStatus =>
      _viewModel.selectedStatus;

  /// Gets the selected date range.
  BehaviorSubject<ShadDateTimeRange?> get selectedDateRange =>
      _viewModel.selectedDateRange;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// Constructor of [TransactionsController].
  TransactionsController(this._viewModel);

  /// Refreshes transactions.
  Future<void> refreshTransactions() async {
    await _viewModel.refreshTransactions();
  }

  /// Calculates transaction metrics including Total Sales, Total Refunds,
  /// Net Revenue, and Pending transactions.
  /// [Transaction] is a list of Transaction objects from the proto model.
  /// Returns a map with the calculated metrics.
  TransactionsMetric calculateTransactionMetrics() {
    final transactions = _viewModel.transactionStream.value;
    double totalSales = 0.0;
    double totalRefunds = 0.0;
    int pendingCount = 0;

    for (var transaction in transactions) {
      // Process based on transaction type and status
      switch (transaction.type) {
        case TransactionType.TRANSACTION_TYPE_SALE:
          if (transaction.status ==
              TransactionStatus.TRANSACTION_STATUS_COMPLETED) {
            totalSales += transaction.amount;
          }
          break;
        case TransactionType.TRANSACTION_TYPE_REFUND:
          if (transaction.status ==
              TransactionStatus.TRANSACTION_STATUS_COMPLETED) {
            totalRefunds += transaction.amount;
          }
          break;
        default:
          // Ignore other transaction types (PURCHASE, ADJUSTMENT, etc.)
          break;
      }

      // Count pending transactions
      if (transaction.status == TransactionStatus.TRANSACTION_STATUS_PENDING) {
        pendingCount++;
      }
    }

    // Calculate net revenue (Total Sales - Total Refunds)
    final double netRevenue = totalSales - totalRefunds;

    return TransactionsMetric(
      totalSales: totalSales,
      totalRefunds: totalRefunds,
      netRevenue: netRevenue,
      pendingTransactions: pendingCount,
    );
  }

  /// Gets the current user.
  Future<User?> getCurrentUser(String userId) {
    return _viewModel.getCurrentUser(userId);
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}

/// The transactions metric.
class TransactionsMetric {
  /// The total sales.
  final double totalSales;

  /// The total refunds.
  final double totalRefunds;

  /// The net revenue.
  final double netRevenue;

  /// The pending transactions.
  final int pendingTransactions;

  /// Constructor of [TransactionsMetric].
  TransactionsMetric({
    required this.totalSales,
    required this.totalRefunds,
    required this.netRevenue,
    required this.pendingTransactions,
  });
}
