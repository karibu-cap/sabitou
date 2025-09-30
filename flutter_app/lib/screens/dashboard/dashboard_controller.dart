import 'dart:async';

import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';

import 'dashboard_view_model.dart';

/// The dashboard controller.
class DashboardController extends ChangeNotifier {
  /// The dashboard view model.
  final DashboardViewModel viewModel = DashboardViewModel();

  /// Error message if any.
  String get error => viewModel.error;

  /// Dashboard stats.
  DashboardData get stats => viewModel.stats;

  /// Completer for loading state.
  Completer<bool> get completer => viewModel.completer;

  /// Calculates the percentage change.
  /// Takes into account Int64 values for monetary amounts.
  /// Returns the percentage change between two values as a double.
  double calculatePercentChange(dynamic current, dynamic previous) {
    // Handle Int64 values
    final num currentValue = current is Int64
        ? current.toInt()
        : (current as num? ?? 0);
    final num previousValue = previous is Int64
        ? previous.toInt()
        : (previous as num? ?? 0);

    if (previousValue == 0) return 0.0;

    return ((currentValue - previousValue) / previousValue) * 100.0;
  }
}
