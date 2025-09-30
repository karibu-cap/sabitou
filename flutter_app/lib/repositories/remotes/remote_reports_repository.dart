import 'package:connectrpc/connect.dart' as connect;
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/rpc/connect_rpc.dart';
import '../../utils/logger.dart';

/// Remote repository for reports operations.
class RemoteReportsRepository {
  final _logger = LoggerApp('RemoteReportsRepository');

  /// The reporting service client.
  final ReportingServiceClient reportingServiceClient;

  /// Constructs a new [RemoteReportsRepository].
  RemoteReportsRepository({connect.Transport? transport})
    : reportingServiceClient = ReportingServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Gets sales report.
  Future<GetSalesReportResponse?> getSalesReport(
    GetSalesReportRequest request,
  ) async {
    try {
      final response = await reportingServiceClient.getSalesReport(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('getSalesReport Error: $e');

      return null;
    }
  }

  /// Gets purchase report.
  Future<GetPurchaseReportResponse?> getPurchaseReport(
    GetPurchaseReportRequest request,
  ) async {
    try {
      final response = await reportingServiceClient.getPurchaseReport(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('getPurchaseReport Error: $e');

      return null;
    }
  }

  /// Gets inventory movement report.
  Future<GetInventoryMovementReportResponse?> getInventoryMovementReport(
    GetInventoryMovementReportRequest request,
  ) async {
    try {
      final response = await reportingServiceClient.getInventoryMovementReport(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('getInventoryMovementReport Error: $e');

      return null;
    }
  }

  /// Gets best selling products.
  Future<GetBestSellingProductsResponse?> getBestSellingProducts(
    GetBestSellingProductsRequest request,
  ) async {
    try {
      final response = await reportingServiceClient.getBestSellingProducts(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('getBestSellingProducts Error: $e');

      return null;
    }
  }

  /// Gets store purchase history.
  Future<GetStorePurchaseHistoryResponse?> getStorePurchaseHistory(
    GetStorePurchaseHistoryRequest request,
  ) async {
    try {
      final response = await reportingServiceClient.getStorePurchaseHistory(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('getStorePurchaseHistory Error: $e');

      return null;
    }
  }

  /// Gets supplier performance report.
  Future<GetSupplierPerformanceReportResponse?> getSupplierPerformanceReport(
    GetSupplierPerformanceReportRequest request,
  ) async {
    try {
      final response = await reportingServiceClient
          .getSupplierPerformanceReport(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('getSupplierPerformanceReport Error: $e');

      return null;
    }
  }

  /// Gets profit and loss report.
  Future<GetProfitLossReportResponse?> getProfitLossReport(
    GetProfitLossReportRequest request,
  ) async {
    try {
      final response = await reportingServiceClient.getProfitLossReport(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('getProfitLossReport Error: $e');

      return null;
    }
  }

  /// Gets stock aging report.
  Future<GetStockAgingReportResponse?> getStockAgingReport(
    GetStockAgingReportRequest request,
  ) async {
    try {
      final response = await reportingServiceClient.getStockAgingReport(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('getStockAgingReport Error: $e');

      return null;
    }
  }
}
