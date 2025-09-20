import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/internationalization/internationalization.dart';
import '../../widgets/sidebar/sidebar_menu_item.dart';
import 'reports_view_model.dart';

/// The reports tab.
enum ReportsTab {
  /// The business info tab.
  salesAnalytics,

  /// The store info tab.
  inventoryReport,

  /// The system tab.
  financialSummary,
}

/// The [ReportsController].
class ReportsController extends ChangeNotifier {
  /// The reports view model.
  final ReportsViewModel viewModel;

  /// The selected tab.
  ReportsTab _selectedTab = ReportsTab.salesAnalytics;

  /// The selected tab.
  ReportsTab get selectedTab => _selectedTab;

  /// The sales and profit data.
  List<TrendDataPoint> get salesAndProfitData => viewModel.salesAndProfitData;

  /// The category sales data.
  List<CategorySalesData> get categorySalesData => viewModel.categorySalesData;

  /// The number of orders.
  int get numberOfOrders => viewModel.numberOfOrders;

  /// The average order value.
  double get averageOrderValue => viewModel.averageOrderValue;

  /// The net profit.
  double get netProfit => viewModel.netProfit;

  /// The total revenue.
  double get totalRevenue => viewModel.totalRevenue;

  /// The previous years average order value.
  double get previousYearsAverageOrderValue =>
      viewModel.previousYearsAverageOrderValue;

  /// The previous years net profit.
  double get previousYearsNetProfit => viewModel.previousYearsNetProfit;

  /// The previous years total revenue.
  double get previousYearsTotalRevenue => viewModel.previousYearsTotalRevenue;

  /// The previous years number of orders.
  int get previousYearsNumberOfOrders => viewModel.previousYearsNumberOfOrders;

  /// The store products.
  List<StoreProduct> get storeProducts => viewModel.storeProducts;

  /// The top performing products.
  List<TopPerformingProduct> get topPerformingProducts =>
      viewModel.topPerformingProducts;

  /// The stock movement data.
  List<StockMovementDataPoint> get stockMovementData =>
      viewModel.stockMovementData;

  /// The revenue vs expenses data.
  List<RevenueExpenseData> get revenueVsExpensesData =>
      viewModel.revenueVsExpensesData;

  /// The monthly cash flow data.
  List<CashFlowData> get monthlyCashFlowData => viewModel.monthlyCashFlowData;

  /// Gets the completer.
  Completer<bool> get completer => viewModel.completer;

  /// Constructors of new [ReportsController].
  ReportsController(this.viewModel);

  /// Sets the selected tab.
  void setSelectedTab(SideBarItem<ReportsTab> tab) {
    _selectedTab = tab.id;
    notifyListeners();
  }

  /// The different in percentage between 2 data(previous and new).
  double differentInPercentage(double previous, double current) {
    if (previous == 0) {
      return 0;
    }

    return (((current - previous) / previous) * 100).abs();
  }

  /// The string to color.
  Color stringToColor(String input) {
    int hash = 0;
    for (var i = 0; i < input.length; i++) {
      hash = input.codeUnitAt(i) + ((hash << 5) - hash);
    }
    final r = (hash & 0xFF0000) >> 16;
    final g = (hash & 0x00FF00) >> 8;
    final b = hash & 0x0000FF;

    return Color.fromRGBO(r, g, b, 1.0);
  }
}

/// The reports tab extension.
extension ReportsTabExtension on ReportsTab {
  /// The report title.
  String get title {
    switch (this) {
      case ReportsTab.salesAnalytics:
        return Intls.to.salesAnalytics;
      case ReportsTab.inventoryReport:
        return Intls.to.inventoryReport;
      case ReportsTab.financialSummary:
        return Intls.to.financialSummary;
    }
  }
}
