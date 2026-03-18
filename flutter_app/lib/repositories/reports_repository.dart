import 'dart:async';

import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../services/powersync/schema.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';

/// The report repository.
final class ReportsRepository {
  final _logger = LoggerApp('ReportsRepository');

  /// The [LocalDataSource] implementation.
  final LocalDataSource dataSource;

  /// The instance of [ReportsRepository].
  static ReportsRepository get instance => GetIt.I.get<ReportsRepository>();

  /// Constructs a new [ReportsRepository].
  ReportsRepository({required this.dataSource});

  /// Get sales data by period.
  Future<GetSalesReportResponse> getSalesByPeriod({
    required String storeId,
    required DateTime startDate,
    required DateTime endDate,
  }) async {
    try {
      final startStr = startDate.toIso8601String();
      final endStr = endDate.toIso8601String();

      // 1. Core sales metrics
      final salesRaw = await dataSource.executeRaw(
        'SELECT '
        'SUM(${CashReceiptsFields.totalAmount}) as total_sales, '
        'COUNT(*) as total_tx '
        'FROM ${CollectionName.cashReceipts} '
        'WHERE ${CashReceiptsFields.storeId} = ? '
        'AND ${CashReceiptsFields.transactionTime} BETWEEN ? AND ?',
        [storeId, startStr, endStr],
      );

      final salesRow = salesRaw.firstOrNull ?? {};
      final totalSales = (salesRow['total_sales'] as num?)?.toDouble() ?? 0.0;
      final totalTransactions = (salesRow['total_tx'] as num?)?.toInt() ?? 0;

      // 2. Units sold
      final unitsSoldRaw = await dataSource.executeRaw(
        "SELECT SUM(json_extract(item.value, '\$.quantity')) as total_units "
        'FROM ${CollectionName.cashReceipts} cr, json_each(cr.${CashReceiptsFields.items}) item '
        'WHERE cr.${CashReceiptsFields.storeId} = ? '
        'AND cr.${CashReceiptsFields.transactionTime} BETWEEN ? AND ?',
        [storeId, startStr, endStr],
      );
      final totalUnitsSold =
          (unitsSoldRaw.firstOrNull?['total_units'] as num?)?.toInt() ?? 0;

      // 3. Daily summary for charts
      final dailyRaw = await dataSource.executeRaw(
        'SELECT '
        "strftime('%Y-%m-%d', ${CashReceiptsFields.transactionTime}) as day, "
        'SUM(${CashReceiptsFields.totalAmount}) as day_sales, '
        'COUNT(*) as day_tx '
        'FROM ${CollectionName.cashReceipts} '
        'WHERE ${CashReceiptsFields.storeId} = ? '
        'AND ${CashReceiptsFields.transactionTime} BETWEEN ? AND ? '
        'GROUP BY day ORDER BY day ASC',
        [storeId, startStr, endStr],
      );

      final summaries = dailyRaw.map((r) {
        final dayDate = DateTime.parse(r['day'] as String);

        return SalesSummary(
          periodStart: Timestamp.fromDateTime(dayDate),
          periodEnd: Timestamp.fromDateTime(
            dayDate.add(const Duration(days: 1)),
          ),
          salesAmount: (r['day_sales'] as num?)?.toDouble() ?? 0.0,
          transactionCount: (r['day_tx'] as num?)?.toInt() ?? 0,
        );
      }).toList();

      return GetSalesReportResponse(
        summaries: summaries,
        totalSalesAmount: totalSales,
        totalTransactions: totalTransactions,
        totalUnitsSold: totalUnitsSold,
        averageTransactionValue: totalTransactions > 0
            ? totalSales / totalTransactions
            : 0.0,
      );
    } catch (e) {
      _logger.severe('getSalesByPeriod Error: $e');
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
      if (storeId == null) return GetDashboardReportResponse();

      final startStr = startDate.toIso8601String();
      final endStr = endDate.toIso8601String();

      // 1. Sales metrics
      final salesReport = await getSalesByPeriod(
        storeId: storeId,
        startDate: startDate,
        endDate: endDate,
      );

      // 2. Purchases metrics
      final purchasesRaw = await dataSource.executeRaw(
        'SELECT SUM(${PurchaseOrdersFields.totalAmount}) as total '
        'FROM ${CollectionName.purchaseOrders} '
        'WHERE ${PurchaseOrdersFields.buyerId} = ? '
        'AND ${PurchaseOrdersFields.createdAt} BETWEEN ? AND ?',
        [storeId, startStr, endStr],
      );
      final totalPurchases =
          (purchasesRaw.firstOrNull?['total'] as num?)?.toDouble() ?? 0.0;

      // 3. Inventory metrics
      final invRaw = await dataSource.executeRaw(
        'SELECT '
        'SUM(il.${InventoryLevelsFields.quantityAvailable} * sp.${StoreProductsFields.salePrice}) as inv_value, '
        'COUNT(*) as total_prod '
        'FROM ${CollectionName.inventoryLevels} il '
        'JOIN ${CollectionName.storeProducts} sp ON il.${InventoryLevelsFields.storeProductId} = sp.${StoreProductsFields.refId} '
        'WHERE il.${InventoryLevelsFields.storeId} = ?',
        [storeId],
      );
      final inv = invRaw.firstOrNull ?? {};
      final inventoryValue = (inv['inv_value'] as num?)?.toDouble() ?? 0.0;
      final totalProducts = (inv['total_prod'] as num?)?.toInt() ?? 0;

      final lowStockCount = await dataSource.count(
        CollectionName.inventoryLevels,
        filters: [
          SqlQuery.equals(InventoryLevelsFields.storeId, storeId),
          SqlQuery.columnComparison(
            InventoryLevelsFields.quantityAvailable,
            InventoryLevelsFields.minThreshold,
            SqlCondition.isLessThanOrEqualTo,
          ),
        ],
      );

      // 4. Best selling products
      final topProductsRaw = await dataSource.executeRaw(
        'SELECT '
        'sp.${StoreProductsFields.refId} as sp_id, '
        'sp.${StoreProductsFields.salePrice} as sp_price, '
        'gp.${GlobalProductsFields.name} as gp_name, '
        "SUM(json_extract(item.value, '\$.quantity')) as units, "
        "SUM(json_extract(item.value, '\$.total')) as revenue, "
        'COUNT(DISTINCT cr.ref_id) as tx_count '
        'FROM ${CollectionName.cashReceipts} cr, json_each(cr.${CashReceiptsFields.items}) item '
        "JOIN ${CollectionName.storeProducts} sp ON json_extract(item.value, '\$.productId') = sp.${StoreProductsFields.refId} "
        'JOIN ${CollectionName.globalProducts} gp ON sp.${StoreProductsFields.globalProductId} = gp.${GlobalProductsFields.refId} '
        'WHERE cr.${CashReceiptsFields.storeId} = ? '
        'AND cr.${CashReceiptsFields.transactionTime} BETWEEN ? AND ? '
        'GROUP BY sp_id ORDER BY revenue DESC LIMIT 5',
        [storeId, startStr, endStr],
      );

      final topProducts = topProductsRaw.map((r) {
        return BestSellingProduct(
          product: StoreProduct(
            refId: r['sp_id'] as String,
            salePrice: (r['sp_price'] as num).toInt(),
          ),
          productName: r['gp_name'] as String,
          totalRevenue: (r['revenue'] as num).toDouble(),
          unitsSold: (r['units'] as num).toInt(),
          transactionCount: (r['tx_count'] as num).toInt(),
        );
      }).toList();

      // Construct final response
      return GetDashboardReportResponse(
        totalSalesAmount: salesReport.totalSalesAmount,
        totalTransactions: salesReport.totalTransactions,
        averageTransactionValue: salesReport.averageTransactionValue,
        totalUnitsSold: salesReport.totalUnitsSold,
        totalRevenue: salesReport.totalSalesAmount,
        totalPurchases: totalPurchases,
        totalInventoryValue: inventoryValue,
        totalProducts: totalProducts,
        lowStockCount: lowStockCount,
        topPerformingProducts: topProducts,
        salesAndProfitTrend: salesReport.summaries
            .map(
              (s) => TrendDataPoint(
                date: s.periodStart,
                salesValue: s.salesAmount,
                profitValue: 0.0, // Mocked for now
              ),
            )
            .toList(),
      );
    } catch (e) {
      _logger.severe('getDashboardReport Error: $e');
      rethrow;
    }
  }
}
