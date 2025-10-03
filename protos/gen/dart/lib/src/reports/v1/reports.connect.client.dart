//
//  Generated code. Do not modify.
//  source: reports/v1/reports.proto
//

import "package:connectrpc/connect.dart" as connect;
import "reports.pb.dart" as reportsv1reports;
import "reports.connect.spec.dart" as specs;

extension type ReportingServiceClient (connect.Transport _transport) {
  /// Sales report by period
  Future<reportsv1reports.GetSalesReportResponse> getSalesReport(
    reportsv1reports.GetSalesReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getSalesReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Purchase report by period
  Future<reportsv1reports.GetPurchaseReportResponse> getPurchaseReport(
    reportsv1reports.GetPurchaseReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getPurchaseReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Inventory movement report
  Future<reportsv1reports.GetInventoryMovementReportResponse> getInventoryMovementReport(
    reportsv1reports.GetInventoryMovementReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getInventoryMovementReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Best selling products
  Future<reportsv1reports.GetBestSellingProductsResponse> getBestSellingProducts(
    reportsv1reports.GetBestSellingProductsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getBestSellingProducts,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Store purchase history
  Future<reportsv1reports.GetStorePurchaseHistoryResponse> getStorePurchaseHistory(
    reportsv1reports.GetStorePurchaseHistoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getStorePurchaseHistory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Supplier performance report
  Future<reportsv1reports.GetSupplierPerformanceReportResponse> getSupplierPerformanceReport(
    reportsv1reports.GetSupplierPerformanceReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getSupplierPerformanceReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Profit & Loss report
  Future<reportsv1reports.GetProfitLossReportResponse> getProfitLossReport(
    reportsv1reports.GetProfitLossReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getProfitLossReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Stock aging report
  Future<reportsv1reports.GetStockAgingReportResponse> getStockAgingReport(
    reportsv1reports.GetStockAgingReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getStockAgingReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Comprehensive inventory report with aggregates
  Future<reportsv1reports.GetInventoryReportResponse> getInventoryReport(
    reportsv1reports.GetInventoryReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getInventoryReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Full sales report including best sellers
  Future<reportsv1reports.GetSalesReportFullResponse> getSalesReportFull(
    reportsv1reports.GetSalesReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getSalesReportFull,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Comprehensive financial report with purchases and balances
  Future<reportsv1reports.GetFinancialReportResponse> getFinancialReport(
    reportsv1reports.GetFinancialReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportingService.getFinancialReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
/// Comprehensive dashboard data service for aggregated calculations
extension type ReportsServiceClient (connect.Transport _transport) {
  /// Get comprehensive dashboard data with all calculated fields
  Future<reportsv1reports.GetDashboardReportResponse> getDashboardReport(
    reportsv1reports.GetDashboardReportRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.ReportsService.getDashboardReport,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
