import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The report repository.
class ReportRepository {
  final _logger = LoggerApp('ReportRepository');

  /// The reporting service client for reports and analytics.
  final ReportingServiceClient _reportingService;

  /// The instance of [ReportRepository].
  static final instance = GetIt.I.get<ReportRepository>();

  /// Constructs a new [ReportRepository].
  ReportRepository({connect.Transport? transport})
    : _reportingService = ReportingServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Get sales data by period.
  Future<GetSalesReportResponse> getSalesByPeriod({
    required String storeId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final request = GetSalesReportRequest(
        storeId: storeId,
        startDate: Timestamp.fromDateTime(startDate),
        endDate: Timestamp.fromDateTime(endDate),
      );
      final response = await _reportingService.getSalesReport(request);

      return response;
    } catch (e) {
      _logger.severe('Error getting sales by period: $e');
      rethrow;
    }
  }

  /// Get comprehensive dashboard report with all calculated data.
  Future<GetDashboardReportResponse> getDashboardReport({
    String? storeId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      // Using DashboardReportingService instead of ReportingService
      final dashboardService = DashboardReportingServiceClient(
        ConnectRPCService.to.clientChannel,
      );

      final request = GetDashboardReportRequest(
        storeId: storeId,
        startDate: Timestamp.fromDateTime(startDate),
        endDate: Timestamp.fromDateTime(endDate),
      );
      final response = await dashboardService.getDashboardReport(request);

      return response;
    } catch (e) {
      _logger.severe('Error getting dashboard report: $e');
      rethrow;
    }
  }
}
