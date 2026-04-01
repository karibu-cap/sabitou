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
        'SELECT SUM(${CashReceiptItemsFields.quantity}) as total_units '
        'FROM ${CollectionName.cashReceipts} cr '
        'JOIN ${CollectionName.cashReceiptItems} cri ON cr.${CashReceiptsFields.refId} = cri.${CashReceiptItemsFields.receiptId} '
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
        'WHERE ${PurchaseOrdersFields.storeId} = ? '
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
        'SUM(cri.${CashReceiptItemsFields.quantity}) as units, '
        'SUM(cri.${CashReceiptItemsFields.total}) as revenue, '
        'COUNT(DISTINCT cr.ref_id) as tx_count '
        'FROM ${CollectionName.cashReceipts} cr '
        'JOIN ${CollectionName.cashReceiptItems} cri ON cr.${CashReceiptsFields.refId} = cri.${CashReceiptItemsFields.receiptId} '
        'JOIN ${CollectionName.storeProducts} sp ON cri.${CashReceiptItemsFields.productId} = sp.${StoreProductsFields.refId} '
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

      // 5. Category sales breakdown - skip for now as categories is JSON field
      final categorySalesData = <CategorySalesData>[];
      final totalRevenue = salesReport.totalSalesAmount;

      // 6. Supplier performance summary
      final supplierRaw = await dataSource.executeRaw(
        'SELECT '
        's.${SuppliersFields.refId} as supplier_id, '
        's.${SuppliersFields.name} as supplier_name, '
        'SUM(po.${PurchaseOrdersFields.totalAmount}) as total_value, '
        'COUNT(*) as order_count '
        'FROM ${CollectionName.purchaseOrders} po '
        'JOIN ${CollectionName.suppliers} s ON po.${PurchaseOrdersFields.supplierId} = s.${SuppliersFields.refId} '
        'WHERE po.${PurchaseOrdersFields.storeId} = ? '
        'AND po.${PurchaseOrdersFields.createdAt} BETWEEN ? AND ? '
        'GROUP BY supplier_id ORDER BY total_value DESC',
        [storeId, startStr, endStr],
      );

      final supplierPerformances = supplierRaw.map((r) {
        return SupplierPerformanceSummary(
          supplierId: r['supplier_id'] as String,
          supplierName: r['supplier_name'] as String,
          totalPurchaseValue: (r['total_value'] as num).toDouble(),
          totalOrders: (r['order_count'] as num).toInt(),
          onTimePercentage: 0.0, // TODO: Calculate from receiving notes
        );
      }).toList();

      // 7. Calculate estimated net profit (revenue - purchases)
      // This is a simplified calculation - in reality would need COGS
      final netProfit = totalRevenue - totalPurchases;
      final grossProfitMargin = totalRevenue > 0
          ? netProfit / totalRevenue
          : 0.0;

      // 8. Revenue vs Expenses data (daily breakdown)
      final revenueExpenseRaw = await dataSource.executeRaw(
        'SELECT '
        "strftime('%Y-%m-%d', ${CashReceiptsFields.transactionTime}) as day, "
        'SUM(${CashReceiptsFields.totalAmount}) as revenue '
        'FROM ${CollectionName.cashReceipts} '
        'WHERE ${CashReceiptsFields.storeId} = ? '
        'AND ${CashReceiptsFields.transactionTime} BETWEEN ? AND ? '
        'GROUP BY day ORDER BY day ASC',
        [storeId, startStr, endStr],
      );

      final revenueVsExpenses = revenueExpenseRaw.map((r) {
        final day = DateTime.parse(r['day'] as String);
        final revenue = (r['revenue'] as num?)?.toDouble() ?? 0.0;
        // Estimate daily expenses as proportion of total purchases
        final estimatedDailyExpense = totalPurchases / revenueExpenseRaw.length;

        return RevenueExpenseDataPoint(
          periodStart: Timestamp.fromDateTime(day),
          periodEnd: Timestamp.fromDateTime(day.add(const Duration(days: 1))),
          revenue: revenue,
          expenses: estimatedDailyExpense,
          netAmount: revenue - estimatedDailyExpense,
        );
      }).toList();

      // 9. Stock aging items - simplified for now
      // Would need complex query with inventory transactions for accurate aging
      final stockAgingItems = <StockAgingItem>[];

      // 10. Previous year comparison (mock data for now - would query same period last year)
      final salesComparison = SalesComparisonData(
        previousYearTotalSales: totalRevenue * 0.85, // Mock: 15% growth
        previousYearTotalTransactions: (salesReport.totalTransactions * 0.9)
            .toInt(),
        previousYearAverageTransactionValue:
            salesReport.averageTransactionValue * 0.95,
      );

      final financialComparison = FinancialComparisonData(
        previousYearNetProfit: netProfit * 0.8,
        previousYearTotalRevenue: totalRevenue * 0.85,
        previousYearGrossProfitMargin: grossProfitMargin * 0.9,
        previousYearTotalPurchases: totalPurchases * 0.9,
      );

      // Construct final response with all fields
      return GetDashboardReportResponse(
        totalSalesAmount: salesReport.totalSalesAmount,
        totalTransactions: salesReport.totalTransactions,
        averageTransactionValue: salesReport.averageTransactionValue,
        totalUnitsSold: salesReport.totalUnitsSold,
        totalRevenue: salesReport.totalSalesAmount,
        netProfit: netProfit,
        grossProfitMargin: grossProfitMargin,
        totalPurchases: totalPurchases,
        totalProducts: totalProducts,
        totalInventoryValue: inventoryValue,
        lowStockCount: lowStockCount,
        topPerformingProducts: topProducts,
        categorySalesBreakdown: categorySalesData,
        supplierPerformances: supplierPerformances,
        revenueVsExpenses: revenueVsExpenses,
        stockAgingItems: stockAgingItems,
        salesComparison: salesComparison,
        financialComparison: financialComparison,
        salesAndProfitTrend: salesReport.summaries
            .map(
              (s) => TrendDataPoint(
                date: s.periodStart,
                salesValue: s.salesAmount,
                profitValue: s.salesAmount * 0.2, // Estimate 20% profit margin
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
