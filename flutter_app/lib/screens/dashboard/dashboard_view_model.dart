import 'dart:async';

import 'package:clock/clock.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/inventory_repository.dart';
import '../../repositories/reports_repository.dart';
import '../../repositories/store_products_repository.dart';
import '../../utils/user_preference.dart';

/// The [DashboardViewModel].
final class DashboardViewModel {
  /// The user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Error message if any.
  String error = '';

  /// Completer for loading state.
  final Completer<bool> completer = Completer<bool>();

  /// Dashboard data.
  DashboardData stats = DashboardData(
    totalProducts: 0,
    lowStockItemsCount: 0,
    expiringItemsCount: 0,
    expiringTimeframe: '',
    todaySales: 0,
    todayTransactions: 0,
    recentActivities: [],
    lowStockAlerts: [],
    expirationAlerts: [],
  );

  /// Constructs of new [DashboardViewModel].
  DashboardViewModel() {
    fetchDashboardData();
  }

  /// Fetches all dashboard data in one go to avoid duplicate fetches.
  Future<DashboardData> fetchDashboardData() async {
    try {
      final businessId = userPreferences.business?.refId;
      final store = userPreferences.store;
      if (businessId == null || store == null) {
        throw Exception('Business or store not found');
      }

      // Execute all calls in parallel for better performance
      final results = await Future.wait([
        StoreProductsRepository.instance.findProducts(
          FindProductsRequest(storeId: store.refId),
        ),
        InventoryRepository.instance.getLowStockItems(store.refId),
        InventoryRepository.instance.getExpiringItems(store.refId),
        ReportsRepository.instance.getSalesByPeriod(
          storeId: store.refId,
          startDate: clock.now(),
          endDate: clock.now().add(const Duration(days: 1)),
        ),
        InventoryRepository.instance.getInventoryTransactionHistory(
          GetInventoryTransactionHistoryRequest(
            storeId: store.refId,
            pageSize: 10,
          ),
        ),
      ]);

      final totalProducts =
          results.first as List<StoreProductWithGlobalProduct>;
      final lowStockItems = results[1] as List<InventoryLevelWithProduct>;
      final expiringItems = results[2] as List<InventoryLevelWithProduct>;
      final salesReport = results[3] as GetSalesReportResponse;
      final recentActivities =
          results[4] as GetInventoryTransactionHistoryResponse;

      final newStats = DashboardData(
        totalProducts: totalProducts.length,
        lowStockItemsCount: lowStockItems.length,
        expiringItemsCount: expiringItems.length,
        expiringTimeframe: 'Next 60 days',
        todaySales: salesReport.totalSalesAmount,
        todayTransactions: salesReport.totalTransactions,
        recentActivities: recentActivities.transactions,
        lowStockAlerts: lowStockItems,
        expirationAlerts: expiringItems,
      );
      stats = newStats;

      return stats;
    } catch (e) {
      print('Error loading dashboard data: $e');

      error = e.toString();

      return stats;
    } finally {
      if (!completer.isCompleted) {
        completer.complete(true);
      }
    }
  }
}

/// The dashboard data model.
class DashboardData {
  /// The total products.
  final int totalProducts;

  /// The low stock items count.
  final int lowStockItemsCount;

  /// The expiring items count.
  final int expiringItemsCount;

  /// The expiring timeframe.
  final String expiringTimeframe; // "Next 2 months"

  /// Sales
  final double todaySales;

  /// Transactionsd
  final int todayTransactions;

  /// Recent Activity
  final List<InventoryTransaction> recentActivities;

  /// Low Stock Alerts
  final List<InventoryLevelWithProduct> lowStockAlerts;

  /// Expiration Alerts
  final List<InventoryLevelWithProduct> expirationAlerts;

  /// Constructs a new [DashboardData].
  DashboardData({
    required this.totalProducts,
    required this.lowStockItemsCount,
    required this.expiringItemsCount,
    required this.expiringTimeframe,
    required this.todaySales,
    required this.todayTransactions,
    required this.recentActivities,
    required this.lowStockAlerts,
    required this.expirationAlerts,
  });
}
