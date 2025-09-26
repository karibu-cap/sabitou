import 'dart:async';
import 'dart:ui';

import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../repositories/orders_repository.dart';
import '../../repositories/products_repository.dart';
import '../../repositories/transactions_repository.dart';
import '../../utils/extensions/category_extension.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// The reports view model.
class ReportsViewModel {
  final LoggerApp _logger = LoggerApp('ReportsViewModel');

  /// The sales and profit data.
  List<TrendDataPoint> salesAndProfitData = [];

  /// The category sales data.
  List<CategorySalesData> categorySalesData = [];

  /// The top performing products.
  List<TopPerformingProduct> topPerformingProducts = [];

  /// The stores product.
  List<StoreProduct> storeProducts = [];

  /// The stock movement data.
  List<StockMovementDataPoint> stockMovementData = [];

  /// The revenue vs expenses data.
  List<RevenueExpenseData> revenueVsExpensesData = [];

  /// The monthly cash flow data.
  List<CashFlowData> monthlyCashFlowData = [];

  /// The number of orders.
  int numberOfOrders = 0;

  /// The average order value.
  double averageOrderValue = 0;

  /// The net profit.
  double netProfit = 0;

  /// The total revenue.
  double totalRevenue = 0;

  /// The average order value.
  double previousYearsAverageOrderValue = 0;

  /// The net profit.
  double previousYearsNetProfit = 0;

  /// The total revenue.
  double previousYearsTotalRevenue = 0;

  /// The number of orders.
  int previousYearsNumberOfOrders = 0;

  /// Gets the selected date range subject.
  final _selectedDateRangeSubject = BehaviorSubject<ShadDateTimeRange?>.seeded(
    null,
  );

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the orders subject.
  final List<Order> storeOrders = [];

  /// Gets the transactions subject.
  final List<Transaction> storeTransactions = [];

  /// Gets the selected date range stream.
  BehaviorSubject<ShadDateTimeRange?> get selectedDateRange =>
      _selectedDateRangeSubject;

  ///Constructor of new [ReportsViewModel].
  ReportsViewModel() {
    initTheData();
  }

  /// Gets the filtered data by date range stream.
  Stream<List<Order>> get filteredOrdersStream =>
      _selectedDateRangeSubject.stream.map((dateRange) {
        var filteredOrder = storeOrders.toList();
        var filteredTransactions = storeTransactions.toList();

        if (dateRange != null) {
          filteredOrder = filteredOrder.where((p) {
            final start = dateRange.start;
            final end = dateRange.end;
            if (start == null && end == null) {
              return true;
            }

            if (start != null && end == null) {
              return p.createdAt.toDateTime().isSameDay(start);
            }

            if (start != null && end != null) {
              return p.createdAt.toDateTime().isAfter(start) &&
                  p.createdAt.toDateTime().isBefore(end);
            }

            return false;
          }).toList();
          filteredTransactions = filteredTransactions.where((p) {
            final start = dateRange.start;
            final end = dateRange.end;
            if (start == null && end == null) {
              return true;
            }

            if (start != null && end == null) {
              return p.createdAt.toDateTime().isSameDay(start);
            }

            if (start != null && end != null) {
              return p.createdAt.toDateTime().isAfter(start) &&
                  p.createdAt.toDateTime().isBefore(end);
            }

            return false;
          }).toList();
        }

        // sort by date
        filteredOrder..sort(
          (a, b) =>
              b.createdAt.toDateTime().compareTo(a.createdAt.toDateTime()),
        );

        return filteredOrder;
      });

  /// Initializes the data.
  // ignore: long-method
  Future<void> initTheData() async {
    _logger.info('initTheData is called');
    final storeId = UserPreferences.instance.store?.refId;
    if (storeId == null) {
      completer.complete(true);

      return;
    }
    final orders = await OrdersRepository.instance.getOrdersByQuery(
      FindOrdersRequest(storeId: storeId),
    );
    storeOrders.addAll(orders);
    final transactions = await TransactionsRepository.instance
        .getCompleteTransactionsByStoreId(storeId: storeId);
    storeTransactions.addAll(transactions);

    salesAndProfitData = generateSalesAndProfitTrendData(
      storeOrders,
      storeTransactions,
      ShadDateTimeRange(start: DateTime(clock.now().year), end: clock.now()),
    );
    categorySalesData = await generateSalesByCategoryData(
      storeOrders,
      storeTransactions,
      ShadDateTimeRange(start: DateTime(clock.now().year), end: clock.now()),
    );
    numberOfOrders = calculateOrders(
      storeOrders,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year),
        end: clock.now(),
      ),
    );
    averageOrderValue = calculateAverageOrderValue(
      storeOrders,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year),
        end: clock.now(),
      ),
    );
    netProfit = calculateNetProfit(
      storeOrders,
      storeTransactions,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year),
        end: clock.now(),
      ),
    );
    totalRevenue = calculateTotalRevenue(
      storeOrders,
      storeTransactions,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year),
        end: clock.now(),
      ),
    );

    previousYearsAverageOrderValue = calculateAverageOrderValue(
      storeOrders,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year - 1),
        end: DateTime(clock.now().year - 1, 12, 31),
      ),
    );
    previousYearsNetProfit = calculateNetProfit(
      storeOrders,
      storeTransactions,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year - 1),
        end: DateTime(clock.now().year - 1, 12, 31),
      ),
    );
    previousYearsTotalRevenue = calculateTotalRevenue(
      storeOrders,
      storeTransactions,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year - 1),
        end: DateTime(clock.now().year - 1, 12, 31),
      ),
    );
    previousYearsNumberOfOrders = calculateOrders(
      storeOrders,
      dateRange: ShadDateTimeRange(
        start: DateTime(clock.now().year - 1),
        end: DateTime(clock.now().year - 1, 12, 31),
      ),
    );

    topPerformingProducts = generateTopPerformingProducts(
      storeOrders,
      ShadDateTimeRange(start: DateTime(clock.now().year), end: clock.now()),
    );

    storeProducts = await _getStoresProducts(storeId);
    stockMovementData = _getStockMovementData(
      storeTransactions,
      ShadDateTimeRange(start: DateTime(clock.now().year), end: clock.now()),
    );

    revenueVsExpensesData = generateRevenueVsExpensesData(
      storeOrders,
      storeTransactions,
      ShadDateTimeRange(start: DateTime(clock.now().year), end: clock.now()),
    );

    monthlyCashFlowData = generateMonthlyCashFlowData(
      storeOrders,
      storeTransactions,
      ShadDateTimeRange(start: DateTime(clock.now().year), end: clock.now()),
    );

    completer.complete(true);
  }

  /// Gets the stock movement data.
  List<StockMovementDataPoint> _getStockMovementData(
    List<Transaction> transactions,
    ShadDateTimeRange? dateRange,
  ) {
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    // Aggregate sales by category from completed orders
    final relevantTransactions = transactions.where((transaction) {
      final orderDate = transaction.createdAt.toDateTime();

      return (orderDate.isAfter(startDate) ||
              orderDate.isAtSameMomentAs(startDate)) &&
          (orderDate.isBefore(endDate) || orderDate.isAtSameMomentAs(endDate));
    }).toList();

    return relevantTransactions.map((transaction) {
      return StockMovementDataPoint(transaction.createdAt.toDateTime(), 1);
    }).toList();
  }

  /// Generates the top performing products.
  List<TopPerformingProduct> generateTopPerformingProducts(
    List<Order> orders,
    ShadDateTimeRange? dateRange,
  ) {
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    final Map<String, TopPerformingProduct> setProduct = {};

    // Aggregate sales by category from completed orders
    final relevantOrders = orders.where((order) {
      final orderDate = order.createdAt.toDateTime();

      return order.status == OrderStatus.ORDER_STATUS_COMPLETED &&
          (orderDate.isAfter(startDate) ||
              orderDate.isAtSameMomentAs(startDate)) &&
          (orderDate.isBefore(endDate) || orderDate.isAtSameMomentAs(endDate));
    }).toList();

    for (var order in relevantOrders) {
      for (var item in order.orderItems) {
        final existing = setProduct[item.storeProductId];
        if (existing != null) {
          existing
            ..quantity += item.quantity
            ..salesValue += item.quantity * item.unitPrice;
        } else {
          setProduct[item.storeProductId] = TopPerformingProduct(
            productName: item.itemName,
            quantity: item.quantity.toDouble(),
            salesValue: item.quantity * item.unitPrice.toDouble(),
          );
        }
      }
    }
    final topPerformingProducts = setProduct.values.toList()
      ..sort((a, b) => b.quantity.compareTo(a.quantity));

    return topPerformingProducts;
  }

  /// Generates the sales by category data.
  Future<List<CategorySalesData>> generateSalesByCategoryData(
    List<Order> orders,
    List<Transaction> transactions,
    ShadDateTimeRange? dateRange,
  ) async {
    final data = <CategorySalesData>{};
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    // Aggregate sales by category from completed orders
    final relevantOrders = orders.where((order) {
      final orderDate = order.createdAt.toDateTime();

      return order.status == OrderStatus.ORDER_STATUS_COMPLETED &&
          (orderDate.isAfter(startDate) ||
              orderDate.isAtSameMomentAs(startDate)) &&
          (orderDate.isBefore(endDate) || orderDate.isAtSameMomentAs(endDate));
    }).toList();

    for (var order in relevantOrders) {
      for (var item in order.orderItems) {
        final category = await _getCategoryNameByStoreProductId(
          item.storeProductId,
        );

        final orderContribution = item.quantity;
        final existing = data.firstWhereOrNull(
          (d) => category?.any((c) => c.label == d.categoryName) == true,
        );
        if (existing != null) {
          existing.itemQuantity += orderContribution;
        } else {
          data.addAll(
            category?.map(
                  (c) =>
                      CategorySalesData(c.label, orderContribution.toDouble()),
                ) ??
                [],
          );
        }
      }
    }

    // Adjust for refunds (simplified, assume category is tied to transaction product)
    final relevantTransactions = transactions.where((tx) {
      final txDate = tx.createdAt.toDateTime();

      return tx.type == TransactionType.TRANSACTION_TYPE_REFUND &&
          tx.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED &&
          (txDate.isAfter(startDate) || txDate.isAtSameMomentAs(startDate)) &&
          (txDate.isBefore(endDate) || txDate.isAtSameMomentAs(endDate));
    }).toList();

    for (var tx in relevantTransactions) {
      final category = await _getCategoryNameByStoreProductId(
        tx.storeProductId,
      );
      final existing = data.firstWhereOrNull(
        (d) => category?.any((c) => c.label == d.categoryName) == true,
      );
      existing?.itemQuantity -= tx.amount;
    }

    return data.toList();
  }

  /// Generates the sales and profit trend data.
  List<TrendDataPoint> generateSalesAndProfitTrendData(
    List<Order> orders,
    List<Transaction> transactions,
    ShadDateTimeRange? dateRange,
  ) {
    final data = <TrendDataPoint>[];
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      final currentDate = startDate.add(Duration(days: i));
      final dailyOrders = orders.where((order) {
        final orderDate = order.createdAt.toDateTime();

        return order.status == OrderStatus.ORDER_STATUS_COMPLETED &&
            orderDate.year == currentDate.year &&
            orderDate.month == currentDate.month &&
            orderDate.day == currentDate.day;
      }).toList();

      final dailyTransactions = transactions.where((tx) {
        final txDate = tx.createdAt.toDateTime();

        return tx.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED &&
            txDate.year == currentDate.year &&
            txDate.month == currentDate.month &&
            txDate.day == currentDate.day;
      }).toList();

      final double dailySales = dailyOrders.fold(
        0,
        (sum, order) => sum + order.orderPrices.grandTotal,
      );
      final double dailyRefunds = dailyTransactions
          .where((tx) => tx.type == TransactionType.TRANSACTION_TYPE_REFUND)
          .fold(0, (sum, tx) => sum + tx.amount);
      final double dailyAdjustments = dailyTransactions
          .where((tx) => tx.type == TransactionType.TRANSACTION_TYPE_ADJUSTMENT)
          .fold(0, (sum, tx) => sum + tx.amount);

      final double dailyProfit = dailySales - dailyRefunds - dailyAdjustments;
      data.add(TrendDataPoint(currentDate, dailySales, dailyProfit));
    }

    return data;
  }

  /// Calculates the net profit.
  double calculateNetProfit(
    List<Order> orders,
    List<Transaction> transactions, {
    ShadDateTimeRange? dateRange,
  }) {
    final totalRevenue = calculateTotalRevenue(
      orders,
      transactions,
      dateRange: dateRange,
    );

    // Simplified: Subtract refunds and adjustments (no COGS yet)
    final relevantTransactions = _filterTransactionsByDate(
      transactions,
      dateRange,
    );
    double totalAdjustments = 0;
    for (var transaction in relevantTransactions) {
      if (transaction.type == TransactionType.TRANSACTION_TYPE_ADJUSTMENT &&
          transaction.status ==
              TransactionStatus.TRANSACTION_STATUS_COMPLETED) {
        totalAdjustments += transaction.amount;
      }
    }

    // Net Profit = Total Revenue - Refunds - Adjustments (no COGS)
    return totalRevenue - totalAdjustments;
  }

  /// Calculates the number of orders.
  int calculateOrders(List<Order> orders, {ShadDateTimeRange? dateRange}) {
    final relevantOrders = _filterOrdersByDate(orders, dateRange);

    return relevantOrders
        .where((order) => order.status == OrderStatus.ORDER_STATUS_COMPLETED)
        .length;
  }

  /// Calculates the average order value.
  double calculateAverageOrderValue(
    List<Order> orders, {
    ShadDateTimeRange? dateRange,
  }) {
    final relevantOrders = _filterOrdersByDate(orders, dateRange);
    final completedOrders = relevantOrders
        .where((order) => order.status == OrderStatus.ORDER_STATUS_COMPLETED)
        .toList();

    if (completedOrders.isEmpty) return 0.0;
    final totalValue = completedOrders.fold<int>(
      0,
      (sum, order) => sum + order.orderPrices.grandTotal,
    );

    return totalValue / completedOrders.length / 100;
  }

  /// Generates the monthly cash flow data.
  List<CashFlowData> generateMonthlyCashFlowData(
    List<Order> orders,
    List<Transaction> transactions,
    ShadDateTimeRange? dateRange,
  ) {
    final data = <CashFlowData>[];
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    final monthlySales = orders
        .where((order) {
          final orderDate = order.createdAt.toDateTime();

          return order.status == OrderStatus.ORDER_STATUS_COMPLETED &&
              orderDate.year == startDate.year &&
              orderDate.month == startDate.month &&
              (orderDate.isAfter(startDate) ||
                  orderDate.isAtSameMomentAs(startDate)) &&
              (orderDate.isBefore(endDate) ||
                  orderDate.isAtSameMomentAs(endDate));
        })
        .fold(0, (sum, order) => sum + order.orderPrices.grandTotal);

    final double purchaseTransactions = transactions
        .where((tx) {
          final txDate = tx.createdAt.toDateTime();

          return tx.type == TransactionType.TRANSACTION_TYPE_PURCHASE &&
              tx.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED &&
              txDate.year == startDate.year &&
              txDate.month == startDate.month &&
              (txDate.isAfter(startDate) ||
                  txDate.isAtSameMomentAs(startDate)) &&
              (txDate.isBefore(endDate) || txDate.isAtSameMomentAs(endDate));
        })
        .fold(0, (sum, tx) => sum + tx.amount);

    final double adjustmentTransactions = transactions
        .where((tx) {
          final txDate = tx.createdAt.toDateTime();

          return tx.type == TransactionType.TRANSACTION_TYPE_ADJUSTMENT &&
              tx.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED &&
              txDate.year == startDate.year &&
              txDate.month == startDate.month &&
              (txDate.isAfter(startDate) ||
                  txDate.isAtSameMomentAs(startDate)) &&
              (txDate.isBefore(endDate) || txDate.isAtSameMomentAs(endDate));
        })
        .fold(0, (sum, tx) => sum + tx.amount);

    final monthlyCashFlow =
        monthlySales - purchaseTransactions - adjustmentTransactions;
    data.add(CashFlowData(startDate, monthlyCashFlow));

    return data;
  }

  /// Generates the revenue vs expenses data.
  List<RevenueExpenseData> generateRevenueVsExpensesData(
    List<Order> orders,
    List<Transaction> transactions,
    ShadDateTimeRange? dateRange,
  ) {
    final data = <RevenueExpenseData>[];
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    for (int i = 0; i <= endDate.difference(startDate).inDays; i++) {
      final currentDate = startDate.add(Duration(days: i));
      final salesOrders = orders.where((order) {
        final orderDate = order.createdAt.toDateTime();

        return order.status == OrderStatus.ORDER_STATUS_COMPLETED &&
            orderDate.year == currentDate.year &&
            orderDate.month == currentDate.month &&
            orderDate.day == currentDate.day;
      }).toList();

      final purchaseTransactions = transactions.where((tx) {
        final txDate = tx.createdAt.toDateTime();

        return tx.type == TransactionType.TRANSACTION_TYPE_PURCHASE &&
            tx.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED &&
            txDate.year == currentDate.year &&
            txDate.month == currentDate.month &&
            txDate.day == currentDate.day;
      }).toList();

      final adjustmentTransactions = transactions.where((tx) {
        final txDate = tx.createdAt.toDateTime();

        return tx.type == TransactionType.TRANSACTION_TYPE_ADJUSTMENT &&
            tx.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED &&
            txDate.year == currentDate.year &&
            txDate.month == currentDate.month &&
            txDate.day == currentDate.day;
      }).toList();

      final double dailyRevenue = salesOrders.fold(
        0,
        (sum, order) => sum + order.orderPrices.grandTotal,
      );
      final double dailyExpenses =
          purchaseTransactions.fold(0, (sum, tx) => sum + tx.amount.toInt()) +
          adjustmentTransactions.fold(0, (sum, tx) => sum + tx.amount);

      data.add(RevenueExpenseData(currentDate, dailyRevenue, dailyExpenses));
    }

    return data;
  }

  /// Calculates the total revenue.
  double calculateTotalRevenue(
    List<Order> orders,
    List<Transaction> transactions, {
    ShadDateTimeRange? dateRange,
  }) {
    final relevantOrders = _filterOrdersByDate(orders, dateRange);
    double totalRevenue = 0;

    for (var order in relevantOrders) {
      if (order.status == OrderStatus.ORDER_STATUS_COMPLETED) {
        totalRevenue += order.orderPrices.grandTotal;
      }
    }

    // Adjust for refunds
    final relevantTransactions = _filterTransactionsByDate(
      transactions,
      dateRange,
    );
    for (var transaction in relevantTransactions) {
      if (transaction.type == TransactionType.TRANSACTION_TYPE_REFUND &&
          transaction.status ==
              TransactionStatus.TRANSACTION_STATUS_COMPLETED) {
        totalRevenue -= transaction.amount;
      }
    }

    return totalRevenue;
  }

  /// Filters the orders by date.
  List<Order> _filterOrdersByDate(
    List<Order> orders,
    ShadDateTimeRange? dateRange,
  ) {
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    return orders.where((order) {
      final orderDate = order.createdAt.toDateTime();
      final isAfterStart =
          orderDate.isAfter(startDate) || orderDate.isAtSameMomentAs(startDate);
      final isBeforeEnd =
          orderDate.isBefore(endDate) || orderDate.isAtSameMomentAs(endDate);

      return isAfterStart && isBeforeEnd;
    }).toList();
  }

  List<Transaction> _filterTransactionsByDate(
    List<Transaction> transactions,
    ShadDateTimeRange? dateRange,
  ) {
    final startDate =
        dateRange?.start ?? clock.now().subtract(const Duration(days: 7));
    final endDate = dateRange?.end ?? clock.now();

    return transactions.where((transaction) {
      final transactionDate = transaction.createdAt.toDateTime();
      final isAfterStart =
          dateRange?.start == null ||
          transactionDate.isAfter(startDate) ||
          transactionDate.isAtSameMomentAs(startDate);
      final isBeforeEnd =
          dateRange?.end == null ||
          transactionDate.isBefore(endDate) ||
          transactionDate.isAtSameMomentAs(endDate);

      return isAfterStart && isBeforeEnd;
    }).toList();
  }

  Future<List<Category>?> _getCategoryNameByStoreProductId(
    String storeProductId,
  ) async {
    final product = await ProductsRepository.instance.getProduct(
      GetStoreProductRequest(storeProductId: storeProductId),
    );
    if (product == null) {
      return null;
    }
    final globalProduct = await ProductsRepository.instance.findGlobalProduct(
      FindGlobalProductsRequest(refId: product.globalProductId),
    );

    return globalProduct.firstOrNull?.categories.toList();
  }

  Future<List<StoreProduct>> _getStoresProducts(String storeId) async {
    final storeProducts = await ProductsRepository.instance.findStoreProducts(
      FindStoreProductsRequest(storeId: storeId),
    );

    return storeProducts;
  }

  /// Disposes the view model.
  void dispose() {
    _selectedDateRangeSubject.close();
  }
}

/// The graph data point.
class GraphDataPoint {
  /// The date.
  final DateTime date;

  /// The value.
  final double value;

  /// Constructs a new [GraphDataPoint].
  GraphDataPoint(this.date, this.value);
}

/// The category sales data.
class CategorySalesData {
  /// The category name.
  String categoryName;

  /// The item quantity.
  double itemQuantity;

  /// Constructs a new [CategorySalesData].
  CategorySalesData(this.categoryName, this.itemQuantity);
}

/// The trend data point.
class TrendDataPoint {
  /// The date.
  final DateTime date;

  /// The sales value.
  final double salesValue;

  /// The profit value.
  final double profitValue;

  /// Constructs a new [TrendDataPoint].
  TrendDataPoint(this.date, this.salesValue, this.profitValue);
}

/// The stock movement data point.
class StockMovementDataPoint {
  /// The date.
  final DateTime date;

  /// The sales value.
  final double nbOfTransaction;

  /// Constructs a new [StockMovementDataPoint].
  StockMovementDataPoint(this.date, this.nbOfTransaction);
}

/// The top performing product.
class TopPerformingProduct {
  /// The date.
  final String productName;

  /// The sales value.
  double salesValue;

  /// The profit value.
  double quantity;

  /// Constructs a new [TopPerformingProduct].
  TopPerformingProduct({
    required this.productName,
    required this.quantity,
    required this.salesValue,
  });
}

/// The chart data.
class ChartData<T> {
  /// Constructs a new [ChartData].
  ChartData({required this.x, this.y, this.y1, this.pointColor});

  /// The x value.
  final T x;

  /// The y value.
  final double? y;

  /// The y1 value.
  final double? y1;

  /// The point color.
  final Color? pointColor;
}

/// The revenue expense data.
class RevenueExpenseData {
  /// The date.
  final DateTime date;

  /// The revenue.
  final double revenue;

  /// The expenses.
  final double expenses;

  /// Constructs a new [RevenueExpenseData].
  RevenueExpenseData(this.date, this.revenue, this.expenses);
}

/// The cash flow data.
class CashFlowData {
  /// The month.
  final DateTime month;

  /// The cash flow.
  final double cashFlow;

  /// Constructs a new [CashFlowData].
  CashFlowData(this.month, this.cashFlow);
}
