//
//  Generated code. Do not modify.
//  source: reports/v1/reports.proto
//

import "package:connectrpc/connect.dart" as connect;
import "reports.pb.dart" as reportsv1reports;

abstract final class ReportingService {
  /// Fully-qualified name of the ReportingService service.
  static const name = 'reports.v1.ReportingService';

  /// Sales report by period
  static const getSalesReport = connect.Spec(
    '/$name/GetSalesReport',
    connect.StreamType.unary,
    reportsv1reports.GetSalesReportRequest.new,
    reportsv1reports.GetSalesReportResponse.new,
  );

  /// Purchase report by period
  static const getPurchaseReport = connect.Spec(
    '/$name/GetPurchaseReport',
    connect.StreamType.unary,
    reportsv1reports.GetPurchaseReportRequest.new,
    reportsv1reports.GetPurchaseReportResponse.new,
  );

  /// Inventory movement report
  static const getInventoryMovementReport = connect.Spec(
    '/$name/GetInventoryMovementReport',
    connect.StreamType.unary,
    reportsv1reports.GetInventoryMovementReportRequest.new,
    reportsv1reports.GetInventoryMovementReportResponse.new,
  );

  /// Best selling products
  static const getBestSellingProducts = connect.Spec(
    '/$name/GetBestSellingProducts',
    connect.StreamType.unary,
    reportsv1reports.GetBestSellingProductsRequest.new,
    reportsv1reports.GetBestSellingProductsResponse.new,
  );

  /// Store purchase history
  static const getStorePurchaseHistory = connect.Spec(
    '/$name/GetStorePurchaseHistory',
    connect.StreamType.unary,
    reportsv1reports.GetStorePurchaseHistoryRequest.new,
    reportsv1reports.GetStorePurchaseHistoryResponse.new,
  );

  /// Supplier performance report
  static const getSupplierPerformanceReport = connect.Spec(
    '/$name/GetSupplierPerformanceReport',
    connect.StreamType.unary,
    reportsv1reports.GetSupplierPerformanceReportRequest.new,
    reportsv1reports.GetSupplierPerformanceReportResponse.new,
  );

  /// Profit & Loss report
  static const getProfitLossReport = connect.Spec(
    '/$name/GetProfitLossReport',
    connect.StreamType.unary,
    reportsv1reports.GetProfitLossReportRequest.new,
    reportsv1reports.GetProfitLossReportResponse.new,
  );

  /// Stock aging report
  static const getStockAgingReport = connect.Spec(
    '/$name/GetStockAgingReport',
    connect.StreamType.unary,
    reportsv1reports.GetStockAgingReportRequest.new,
    reportsv1reports.GetStockAgingReportResponse.new,
  );

  /// Comprehensive inventory report with aggregates
  static const getInventoryReport = connect.Spec(
    '/$name/GetInventoryReport',
    connect.StreamType.unary,
    reportsv1reports.GetInventoryReportRequest.new,
    reportsv1reports.GetInventoryReportResponse.new,
  );

  /// Full sales report including best sellers
  static const getSalesReportFull = connect.Spec(
    '/$name/GetSalesReportFull',
    connect.StreamType.unary,
    reportsv1reports.GetSalesReportRequest.new,
    reportsv1reports.GetSalesReportFullResponse.new,
  );

  /// Comprehensive financial report with purchases and balances
  static const getFinancialReport = connect.Spec(
    '/$name/GetFinancialReport',
    connect.StreamType.unary,
    reportsv1reports.GetFinancialReportRequest.new,
    reportsv1reports.GetFinancialReportResponse.new,
  );
}
/// Comprehensive dashboard data service for aggregated calculations
abstract final class ReportsService {
  /// Fully-qualified name of the ReportsService service.
  static const name = 'reports.v1.ReportsService';

  /// Get comprehensive dashboard data with all calculated fields
  static const getDashboardReport = connect.Spec(
    '/$name/GetDashboardReport',
    connect.StreamType.unary,
    reportsv1reports.GetDashboardReportRequest.new,
    reportsv1reports.GetDashboardReportResponse.new,
  );
}
