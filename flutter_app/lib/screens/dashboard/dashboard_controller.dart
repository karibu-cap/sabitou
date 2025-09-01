import 'package:clock/clock.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/orders_repository.dart';
import '../../repositories/products_repository.dart';
import '../../repositories/suppliers_repository.dart';
import '../../repositories/transactions_repository.dart';
import '../../utils/common_functions.dart';
import '../../utils/user_preference.dart';

/// The dashboard controller.
class DashboardController extends GetxController {
  /// The user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Loading state.
  RxBool isLoading = true.obs;

  /// Error message if any.
  RxString error = ''.obs;

  /// Dashboard stats.
  Rx<DashboardStatsData> stats = (
    totalProducts: 0,
    lowStockItems: 0,
    expiringItems: 0,
    todaySales: 0.0,
    todayTransactions: 0,
    totalSuppliers: 0,
    transactions: <Transaction>[],
    yesterdayTransactions: <Transaction>[],
    yesterdaySales: 0.0,
  ).obs;

  /// List of low stock products.
  RxList<BusinessProduct> lowStockProducts = <BusinessProduct>[].obs;

  /// List of expiring products (improved to include soon-to-expire, not just expired).
  RxList<BusinessProduct> expiringProducts = <BusinessProduct>[].obs;

  /// Map of global products for quick lookup (only for low stock and expiring).
  RxMap<String, GlobalProduct> globalProducts = <String, GlobalProduct>{}.obs;

  @override
  void onInit() {
    super.onInit();
    fetchDashboardData();
  }

  /// Fetches all dashboard data in one go to avoid duplicate fetches.
  Future<void> fetchDashboardData() async {
    isLoading.value = true;
    error.value = '';

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

      if (businessId == null) {
        throw Exception('Business not found');
      }
      if (store == null) {
        throw Exception('Store not found');
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
        SuppliersRepository.instance.getSupliersByBusinessId(businessId),
        TransactionsRepository.instance.getConpleteTransactionsByBusinessId(
          businessId: businessId,
          startOfDay: DateTime(now.year, now.month, now.day),
          endOfDay: DateTime(
            now.year,
            now.month,
            now.day,
          ).add(const Duration(days: 1)),
        ),
        TransactionsRepository.instance.getConpleteTransactionsByBusinessId(
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

      // Compute today's sales.
      final todaySales = _computeSales(recentTransactions, store.refId);

      // Compute yesterday's sales.
      final yesterdaySales = _computeSales(yesterdayTransactions, store.refId);

      // Compute low stock.
      lowStockProducts.value = filteredProducts.where(_isLowStock).toList();

      // Compute expiring products (improved: expiring in next 30 days, including already expired).
      expiringProducts.value = _computeExpiringProducts(filteredProducts);

      // Compute total products.
      final totalProductsCount = filteredProducts.length;

      // Total suppliers.
      final totalSuppliersCount = suppliers.length;

      // Update stats.
      stats.value = (
        totalProducts: totalProductsCount,
        lowStockItems: lowStockProducts.length,
        expiringItems: expiringProducts.length,
        todaySales: todaySales,
        todayTransactions: recentTransactions.length,
        totalSuppliers: totalSuppliersCount,
        transactions: recentTransactions,
        yesterdayTransactions: yesterdayTransactions,
        yesterdaySales: yesterdaySales,
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
        uniqueGlobalIds,
        globals.whereType<GlobalProduct>(),
      );
      globalProducts.value = globalMap;
    } catch (e) {
      error.value = e.toString();
    } finally {
      isLoading.value = false;
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
      if (p.expirationDate.isEmpty) return false;
      final expiry = DateTime.tryParse(p.expirationDate);

      return expiry != null && expiry.isBefore(threshold);
    }).toList()..sort((a, b) => a.expirationDate.compareTo(b.expirationDate));
  }

  /// Calculates the percentage change.
  double calculatePercentChange(num current, num? previous) {
    if (previous == null || previous == 0) return 0;

    return ((current - previous) / previous) * 100;
  }

  /// Refresh data.
  void refreshData() {
    fetchDashboardData();
  }
}

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
