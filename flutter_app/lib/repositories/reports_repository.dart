import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'remotes/remote_reports_repository.dart';

/// The reports repository.
class ReportsRepository {
  final _logger = LoggerApp('ReportsRepository');

  /// The remote reports repository.
  final RemoteReportsRepository remoteReportsRepository;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The instance of [ReportsRepository].
  static final instance = GetIt.I.get<ReportsRepository>();

  /// Constructs a new [ReportsRepository].
  ReportsRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : remoteReportsRepository = RemoteReportsRepository(
         transport: transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Gets sales report.
  Future<GetSalesReportResponse?> getSalesReport(
    GetSalesReportRequest request,
  ) async {
    try {
      return await remoteReportsRepository.getSalesReport(request);
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
      return await remoteReportsRepository.getPurchaseReport(request);
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
      return await remoteReportsRepository.getInventoryMovementReport(request);
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
      return await remoteReportsRepository.getBestSellingProducts(request);
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
      return await remoteReportsRepository.getStorePurchaseHistory(request);
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
      return await remoteReportsRepository.getSupplierPerformanceReport(
        request,
      );
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
      return await remoteReportsRepository.getProfitLossReport(request);
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
      return await remoteReportsRepository.getStockAgingReport(request);
    } on Exception catch (e) {
      _logger.severe('getStockAgingReport Error: $e');

      return null;
    }
  }
}
