import 'dart:async';
import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'sales_view_model.dart';

/// Controller for sales screen
class SalesController extends ChangeNotifier {
  final SalesViewModel _viewModel;

  /// Gets the filtered orders stream.
  Stream<List<Order>> get filteredOrdersStream =>
      _viewModel.filteredOrdersStream;

  /// Gets the selected date range.
  BehaviorSubject<ShadDateTimeRange?> get selectedDateRange =>
      _viewModel.selectedDateRange;

  /// Gets the orders stream.
  BehaviorSubject<UnmodifiableListView<Order>> get ordersStream =>
      _viewModel.ordersStream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets the selected status.
  BehaviorSubject<OrderStatus?> get selectedStatus => _viewModel.selectedStatus;

  /// Gets the completer.
  Completer<bool> get completer => _viewModel.completer;

  /// Constructor of [SalesController].
  SalesController(this._viewModel);

  /// Refreshes orders.
  Future<void> refreshOrders() async {
    await _viewModel.refreshOrders();
  }

  @override
  void dispose() {
    _viewModel.dispose();
    super.dispose();
  }
}
