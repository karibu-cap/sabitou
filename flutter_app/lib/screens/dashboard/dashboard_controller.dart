import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'dashboard_view_model.dart';

/// The dashboard controller.
class DashboardController extends ChangeNotifier {
  /// The dashboard view model.
  final DashboardViewModel viewModel = DashboardViewModel();

  /// Error message if any.
  String get error => viewModel.error;

  /// Dashboard stats.
  DashboardStatsData get stats => viewModel.stats;

  /// List of low stock products.
  List<StoreProduct> get lowStockProducts => viewModel.lowStockProducts;

  /// List of expiring products.
  List<StoreProduct> get expiringProducts => viewModel.expiringProducts;

  /// Map of global products for quick lookup (only for low stock and expiring).
  Map<String, GlobalProduct> get globalProducts => viewModel.globalProducts;

  /// Completer for loading state.
  Completer<bool> get completer => viewModel.completer;

  /// Calculates the percentage change.
  double calculatePercentChange(num current, num? previous) {
    if (previous == null || previous == 0) return 0;

    return ((current - previous) / previous) * 100;
  }
}
