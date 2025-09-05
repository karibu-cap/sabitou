import 'dart:async';

import 'package:clock/clock.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/orders_repository.dart';
import '../../repositories/products_repository.dart';
import '../../repositories/suppliers_repository.dart';
import '../../repositories/transactions_repository.dart';
import '../../utils/common_functions.dart';
import '../../utils/user_preference.dart';

/// Data class for dashboard statistics.
typedef DashboardStatsData = ({
  int totalProducts,
  int lowStockItems,
  int expiringItems,
  double todaySales,
  int todayTransactions,
  int totalSuppliers,
  List<Transaction> transactions,
  List<Transaction> yesterdayTransactions,
  double yesterdaySales,
});

/// The [DashboardViewModel].
final class DashboardViewModel {
  /// The user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Error message if any.
  String error = '';

  /// List of low stock products.
  List<BusinessProduct> lowStockProducts = <BusinessProduct>[];

  /// List of expiring products (improved to include soon-to-expire, not just expired).
  List<BusinessProduct> expiringProducts = <BusinessProduct>[];

  /// Map of global products for quick lookup (only for low stock and expiring).
  Map<String, GlobalProduct> globalProducts = <String, GlobalProduct>{};

  /// Completer for loading state.
  final Completer<bool> completer = Completer<bool>();

  /// Constructs of new [DashboardViewModel].
  DashboardViewModel() {
    fetchDashboardData();
  }

  /// Dashboard stats.
  DashboardStatsData stats = (
    totalProducts: 0,
    lowStockItems: 0,
    expiringItems: 0,
    todaySales: 0.0,
    todayTransactions: 0,
    totalSuppliers: 0,
    transactions: <Transaction>[],
    yesterdayTransactions: <Transaction>[],
    yesterdaySales: 0.0,
  );

  /// Fetches all dashboard data in one go to avoid duplicate fetches.
  Future<void> fetchDashboardData() async {
    error = '';
    try {
      // Check permissions once (assuming hasPermission is async, combine if needed).
      if (!await hasPermission(
            ResourceType.RESOURCE_TYPE_STORE_ORDER,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          ) ||
          !await hasPermission(
            ResourceType.RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_READ,
          )) {
        throw Exception('User lacks permission to view dashboard data');
      }
      final businessId = userPreferences.business?.refId;
      final store = userPreferences.store;
      if (businessId == null || store == null) {
        throw Exception('Business or store not found');
      }
      final now = clock.now();
      // Fetch all data in parallel.
      final [
        orders as List<Order>,
        businessProducts as List<BusinessProduct>,
        suppliers as List<Supplier>,
        recentTransactions as List<Transaction>,
        yesterdayTransactions as List<Transaction>,
      ] = await Future.wait([
        OrdersRepository.instance.getOrdersByQuery(supplierId: store.refId),
        ProductsRepository.instance.getProductsByBusinessId(businessId),
        SuppliersRepository.instance.getSuppliersByBusinessId(businessId),
        TransactionsRepository.instance.getCompleteTransactionsByBusinessId(
          businessId: businessId,
          startOfDay: now.subtract(const Duration(days: 30)),
          endOfDay: now,
        ),
        TransactionsRepository.instance.getCompleteTransactionsByBusinessId(
          businessId: businessId,
          startOfDay: DateTime(
            now.year,
            now.month,
            now.day,
          ).subtract(const Duration(days: 1)),
          endOfDay: DateTime(now.year, now.month, now.day),
        ),
      ]);
      // Filter business products to match businessId (safety).
      final filteredProducts = businessProducts
          .where((p) => p.businessId == businessId)
          .toList();

      /// Today's transactions.
      final todayTransactions = recentTransactions
          .where(
            (t) =>
                t.createdAt.toDateTime().year == now.year &&
                t.createdAt.toDateTime().month == now.month &&
                t.createdAt.toDateTime().day == now.day,
          )
          .toList();

      // Compute low stock.
      lowStockProducts = filteredProducts.where(_isLowStock).toList();

      // Compute expiring products (improved: expiring in next 30 days, including already expired).
      expiringProducts = _computeExpiringProducts(filteredProducts);

      // Compute total products.
      final totalProductsCount = filteredProducts.length;

      // Total suppliers.
      final totalSuppliersCount = suppliers.length;

      // Update stats.
      stats = (
        totalProducts: totalProductsCount,
        lowStockItems: lowStockProducts.length,
        expiringItems: expiringProducts.length,
        todaySales: _computeSales(todayTransactions, store.refId),
        todayTransactions: todayTransactions.length,
        totalSuppliers: totalSuppliersCount,
        transactions: recentTransactions,
        yesterdayTransactions: yesterdayTransactions,
        yesterdaySales: _computeSales(yesterdayTransactions, store.refId),
      );

      // Fetch global products for low stock and expiring in parallel.
      final uniqueGlobalIds = <String>{
        ...lowStockProducts.map((p) => p.globalProductId),
        ...expiringProducts.map((p) => p.globalProductId),
      };
      final globalFutures = uniqueGlobalIds.map(
        ProductsRepository.instance.getGlobalProductByRefId,
      );
      final globals = await Future.wait(globalFutures);
      final globalMap = Map<String, GlobalProduct>.fromIterables(
        uniqueGlobalIds.toList(),
        globals.whereType<GlobalProduct>(),
      );
      globalProducts = globalMap;
    } catch (e) {
      error = e.toString();
      print(e);
    } finally {
      completer.complete(true);
    }
  }

  /// Compute sales.
  double _computeSales(List<Transaction> transactions, String storeRefId) {
    return transactions
        .where(
          (t) =>
              (t.type == TransactionType.TRANSACTION_TYPE_SALE ||
                  t.type == TransactionType.TRANSACTION_TYPE_REFUND) &&
              (t.storeId == storeRefId),
        )
        .fold(0.0, (sum, t) {
          if (t.type == TransactionType.TRANSACTION_TYPE_SALE) {
            return sum + t.amountInCents.toDouble();
          } else if (t.type == TransactionType.TRANSACTION_TYPE_REFUND) {
            return sum - t.amountInCents.abs().toDouble();
          }

          return sum;
        });
  }

  /// Checks if a product is low in stock.
  bool _isLowStock(BusinessProduct businessProduct) {
    return businessProduct.stockQuantity <= businessProduct.minStockThreshold;
  }

  /// Computes expiring products (improved to next 30 days).
  List<BusinessProduct> _computeExpiringProducts(
    List<BusinessProduct> businessProducts,
  ) {
    final now = clock.now();
    final threshold = now.add(const Duration(days: 60));

    return businessProducts.where((p) {
      if (!p.hasExpirationDate()) return false;
      final expiry = p.expirationDate.toDateTime();

      return expiry.isBefore(threshold);
    }).toList()..sort(
      (a, b) => a.expirationDate.toDateTime().compareTo(
        b.expirationDate.toDateTime(),
      ),
    );
  }
}
