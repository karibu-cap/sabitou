import 'dart:async';
import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../repositories/reports_repository.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// The reports view model.
class ReportsViewModel {
  final LoggerApp _logger = LoggerApp('ReportsViewModel');

  /// The user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// The total value.
  double totalValue = 0;

  /// The aging items.
  List<StockAgingItem> agingItems = [];

  /// The movement summary.
  InventoryMovementSummary movementSummary = InventoryMovementSummary(
    totalIn: 0.0,
    totalOut: 0.0,
    netChange: 0.0,
  );

  /// The sales and profit data.
  List<TrendDataPoint> salesAndProfitData = [];

  /// The category sales data.
  List<CategorySalesData> categorySalesData = [];

  /// The top performing products.
  List<BestSellingProduct> topPerformingProducts = [];

  /// The revenue vs expenses data.
  List<RevenueExpenseDataPoint> revenueVsExpensesData = [];

  /// The monthly cash flow data.
  List<CashFlowData> monthlyCashFlowData = [];

  /// The number of orders.
  int numberOfOrders = 0;

  /// The average order value.
  double averageOrderValue = 0;

  /// The net profit.
  double netProfit = 0;

  /// The total revenue.
  double totalRevenue = 0;

  /// The average order value.
  double previousYearsAverageOrderValue = 0;

  /// The net profit.
  double previousYearsNetProfit = 0;

  /// The total revenue.
  double previousYearsTotalRevenue = 0;

  /// The number of orders.
  int previousYearsNumberOfOrders = 0;

  /// The total products.
  int totalProducts = 0;

  /// The total purchases.
  double totalPurchases = 0;

  /// The total inventory value.
  double totalInventoryValue = 0;

  /// The low stock count.
  int lowStockCount = 0;

  /// Gets the selected date range subject.
  final _selectedDateRangeSubject = BehaviorSubject<ShadDateTimeRange?>.seeded(
    null,
  );

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the orders subject.
  final List<dynamic> storeOrders = [];

  /// Gets the transactions subject.
  final List<dynamic> storeTransactions = [];

  /// Gets the selected date range stream.
  BehaviorSubject<ShadDateTimeRange?> get selectedDateRange =>
      _selectedDateRangeSubject;

  ///Constructor of new [ReportsViewModel].
  ReportsViewModel() {
    initTheData();
  }

  /// Initializes the data.
  Future<void> initTheData() async {
    _logger.info('initTheData is called');

    try {
      // Get comprehensive dashboard data from backend
      final businessId = userPreferences.business?.refId;
      final store = userPreferences.store;
      if (businessId == null || store == null) {
        throw Exception('Business or store not found');
      }

      final dashboardData = await ReportsRepository.instance.getDashboardReport(
        storeId: store.refId,
        startDate: clock.now().subtract(const Duration(days: 30)),
        endDate: clock.now(),
      );

      // Map dashboard data to the format expected by components
      _mapDashboardData(dashboardData);

      completer.complete(true);
    } catch (e) {
      _logger.severe('Error initializing report data: $e');
      completer.complete(false);
    }
  }

  /// Maps dashboard data from the comprehensive dashboard report.
  void _mapDashboardData(GetDashboardReportResponse dashboardData) {
    totalRevenue = dashboardData.totalRevenue.toDouble() / 100;
    netProfit = dashboardData.netProfit.toDouble() / 100;
    totalPurchases = dashboardData.totalPurchases.toDouble();

    totalProducts = dashboardData.totalProducts;
    totalInventoryValue = dashboardData.totalInventoryValue.toDouble();
    lowStockCount = dashboardData.lowStockCount;
    salesAndProfitData = dashboardData.salesAndProfitTrend;
    categorySalesData = dashboardData.categorySalesBreakdown;
    revenueVsExpensesData = dashboardData.revenueVsExpenses;
    topPerformingProducts = dashboardData.topPerformingProducts;
    monthlyCashFlowData = dashboardData.supplierPerformances.map((supplier) {
      return CashFlowData(clock.now(), supplier.totalPurchaseValue.toDouble());
    }).toList();
    previousYearsTotalRevenue =
        dashboardData.salesComparison.previousYearTotalSales.toDouble() / 100;
    previousYearsNumberOfOrders =
        dashboardData.salesComparison.previousYearTotalTransactions;
    previousYearsAverageOrderValue =
        dashboardData.salesComparison.previousYearAverageTransactionValue;

    previousYearsNetProfit =
        dashboardData.financialComparison.previousYearNetProfit.toDouble() /
        100;
    previousYearsTotalRevenue =
        dashboardData.financialComparison.previousYearTotalRevenue.toDouble() /
        100;

    // Set calculated metrics
    numberOfOrders = dashboardData.totalTransactions;
    averageOrderValue = dashboardData.averageTransactionValue;
    totalValue = dashboardData.totalInventoryValue.toDouble();
    agingItems = dashboardData.stockAgingItems;
  }

  /// Disposes the view model.
  void dispose() {
    _selectedDateRangeSubject.close();
  }
}

/// The graph data point.
class GraphDataPoint {
  /// The date.
  final DateTime date;

  /// The value.
  final double value;

  /// Constructs a new [GraphDataPoint].
  GraphDataPoint(this.date, this.value);
}

/// The chart data.
class ChartData<T> {
  /// Constructs a new [ChartData].
  ChartData({required this.x, this.y, this.y1, this.pointColor});

  /// The x value.
  final T x;

  /// The y value.
  final double? y;

  /// The y1 value.
  final double? y1;

  /// The point color.
  final Color? pointColor;
}

/// The cash flow data.
class CashFlowData {
  /// The month.
  final DateTime month;

  /// The cash flow.
  final double cashFlow;

  /// Constructs a new [CashFlowData].
  CashFlowData(this.month, this.cashFlow);
}
