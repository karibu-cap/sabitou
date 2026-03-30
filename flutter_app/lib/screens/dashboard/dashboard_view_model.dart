import 'dart:async';

import 'package:clock/clock.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/business_repository.dart';
import '../../repositories/inventory_repository.dart';
import '../../repositories/reports_repository.dart';
import '../../repositories/store_products_repository.dart';
import '../../repositories/stores_repository.dart';
import '../../repositories/users_repository.dart';
import '../../services/internationalization/internationalization.dart';
import '../../utils/logger.dart';

/// The [DashboardViewModel].
final class DashboardViewModel {
  final logger = LoggerApp('DashboardViewModel');

  /// The store.
  final Store store;

  /// The  buisiness repository instance.
  final BusinessRepository businessRepository = BusinessRepository.instance;

  /// The store repository instance.
  final StoresRepository storesRepository = StoresRepository.instance;

  /// the user repository.
  final UserRepository usersRepository = UserRepository.instance;

  /// Error message if any.
  String initErrorMessage = '';

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
  DashboardViewModel({required this.store}) {
    fetchDashboardData();
  }

  /// Fetches all dashboard data in one go to avoid duplicate fetches.
  Future<DashboardData?> fetchDashboardData() async {
    try {
      // Execute all calls in parallel for better performance
      final results = await Future.wait([
        StoreProductsRepository.instance.findStoreProducts(
          FindStoreProductsRequest(storeId: store.refId),
        ),
        InventoryRepository.instance.getStoreInventory(store.refId),
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
      final storeInventory = results[1] as List<InventoryLevelWithProduct>;
      final lowStockItems = storeInventory.where(
        (l) =>
            l.level.quantityAvailable <= l.level.minThreshold &&
            l.level.quantityAvailable > 0,
      );
      final expiringItems = storeInventory.where(
        (e) => e.level.batches.any((batch) {
          final now = clock.now();
          final expiry = batch.expirationDate.toDateTime();

          return expiry.difference(now).inDays <= 60;
        }),
      );

      final salesReport = results[2] as GetSalesReportResponse;
      final recentActivities = results[3] as List<InventoryTransaction>;

      final newStats = DashboardData(
        totalProducts: totalProducts.length,
        lowStockItemsCount: lowStockItems.length,
        expiringItemsCount: expiringItems.length,
        expiringTimeframe: 'Next 60 days',
        todaySales: salesReport.totalSalesAmount,
        todayTransactions: salesReport.totalTransactions,
        recentActivities: recentActivities,
        lowStockAlerts: lowStockItems.toList(),
        expirationAlerts: expiringItems.toList(),
      );
      stats = newStats;

      return stats;
    } catch (e) {
      logger.severe('Error loading dashboard data: $e');

      initErrorMessage = Intls.to.genericErrorMessage;

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
