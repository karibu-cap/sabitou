import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/reports/reports_screen.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_clients/services/storage/app_storage.dart';
import 'package:sabitou_clients/utils/app_constants.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

final reportsFakeTransport = FakeTransportBuilder()
  ..unary(StoreProductService.findStoreProducts, (req, _) async {
    final request = req;

    return FindStoreProductsResponse(
      products: [
        StoreProductWithGlobalProduct(
          storeProduct: StoreProduct()
            ..refId = 'sp_1'
            ..storeId = request.storeId
            ..globalProductId = 'gp_1'
            ..salePrice = 10000
            ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
          globalProduct: GlobalProduct()
            ..refId = 'gp_1'
            ..name = (Internationalized()
              ..en = 'Product One'
              ..fr = 'Produit Un')
            ..description = (Internationalized()
              ..en = 'Description One'
              ..fr = 'Description Un')
            ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        ),
        StoreProductWithGlobalProduct(
          storeProduct: StoreProduct()
            ..refId = 'sp_2'
            ..storeId = request.storeId
            ..globalProductId = 'gp_2'
            ..salePrice = 15000
            ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
          globalProduct: GlobalProduct()
            ..refId = 'gp_2'
            ..name = (Internationalized()
              ..en = 'Product Two'
              ..fr = 'Produit Deux')
            ..description = (Internationalized()
              ..en = 'Description Two'
              ..fr = 'Description Deux')
            ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        ),
        StoreProductWithGlobalProduct(
          storeProduct: StoreProduct()
            ..refId = 'sp_3'
            ..storeId = request.storeId
            ..globalProductId = 'gp_3'
            ..salePrice = 20000
            ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
          globalProduct: GlobalProduct()
            ..refId = 'gp_3'
            ..name = (Internationalized()
              ..en = 'Product Three'
              ..fr = 'Produit Trois')
            ..description = (Internationalized()
              ..en = 'Description Three'
              ..fr = 'Description Trois')
            ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        ),
      ],
      totalCount: 3,
    );
  })
  ..unary(StoreProductService.getStoreProduct, (req, _) async {
    final request = req;

    return GetStoreProductResponse(
      product: StoreProductWithGlobalProduct(
        storeProduct: StoreProduct()
          ..refId = request.storeProductId
          ..storeId = 'store_1'
          ..globalProductId = 'gp_${request.storeProductId.substring(3)}'
          ..salePrice =
              10000 + int.parse(request.storeProductId.substring(3)) * 5000
          ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
        globalProduct: GlobalProduct()
          ..refId = 'gp_${request.storeProductId.substring(3)}'
          ..name = (Internationalized()
            ..en = 'Product ${request.storeProductId.substring(3)}'
            ..fr = 'Produit ${request.storeProductId.substring(3)}')
          ..description = (Internationalized()
            ..en = 'Description ${request.storeProductId.substring(3)}'
            ..fr = 'Description ${request.storeProductId.substring(3)}')
          ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
      ),
    );
  })
  ..unary(InventoryService.getLowStockItems, (req, _) async {
    final request = req;

    return GetLowStockItemsResponse(
      lowStockItems: [
        InventoryLevel()
          ..storeProductId = 'sp_1'
          ..storeId = request.storeId
          ..quantityAvailable = 5
          ..quantityReserved = 0
          ..minThreshold = 10
          ..lastUpdated = Timestamp.fromDateTime(clock.now()),
        InventoryLevel()
          ..storeProductId = 'sp_2'
          ..storeId = request.storeId
          ..quantityAvailable = 8
          ..quantityReserved = 2
          ..minThreshold = 15
          ..lastUpdated = Timestamp.fromDateTime(clock.now()),
      ],
      totalCount: 2,
    );
  })
  ..unary(InventoryService.getResourceInventory, (req, _) async {
    final request = req;

    return GetResourceInventoryResponse(
      items: [
        InventoryLevel()
          ..storeProductId = 'sp_3'
          ..storeId = request.storeId
          ..quantityAvailable = 20
          ..quantityReserved = 0
          ..batches.add(
            Batch()
              ..documentId = 'batch_1'
              ..productId = 'sp_3'
              ..warehouseId = request.storeId
              ..quantity = 20
              ..expirationDate = Timestamp.fromDateTime(
                clock.now().add(const Duration(days: 45)),
              )
              ..receivedAt = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 30)),
              ),
          )
          ..batches.add(
            Batch()
              ..documentId = 'batch_2'
              ..productId = 'sp_3'
              ..warehouseId = request.storeId
              ..quantity = 0
              ..expirationDate = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 1)),
              )
              ..status = BatchStatus.BATCH_STATUS_EXPIRED,
          )
          ..lastUpdated = Timestamp.fromDateTime(clock.now()),
      ],
      totalQuantity: 20.0,
      snapshotDate: Timestamp.fromDateTime(clock.now()),
    );
  })
  ..unary(ReportingService.getSalesReport, (req, _) async {
    return GetSalesReportResponse(
      summaries: [
        SalesSummary()
          ..periodStart = Timestamp.fromDateTime(clock.now())
          ..periodEnd = Timestamp.fromDateTime(
            clock.now().add(const Duration(days: 1)),
          )
          ..salesAmount = 250000
          ..transactionCount = 8
          ..unitsSold = 50,
      ],
      totalSalesAmount: 500000,
      totalTransactions: 15,
      totalUnitsSold: 100,
      averageTransactionValue: 33333,
    );
  })
  ..unary(ReportingService.getPurchaseReport, (req, _) async {
    return GetPurchaseReportResponse(
      summaries: [
        PurchaseSummary()
          ..periodStart = Timestamp.fromDateTime(clock.now())
          ..periodEnd = Timestamp.fromDateTime(
            clock.now().add(const Duration(days: 1)),
          )
          ..purchaseAmount = 300000
          ..purchaseOrderCount = 5
          ..unitsPurchased = 15,
      ],
      totalPurchaseAmount: 600000,
      totalPurchaseOrders: 12,
      totalUnitsPurchased: 50,
    );
  })
  ..unary(ReportingService.getInventoryMovementReport, (req, _) async {
    return GetInventoryMovementReportResponse(
      product: StoreProduct()
        ..refId = req.productId
        ..globalProductId = 'gp_1'
        ..salePrice = 10000,
      openingBalance: 100.0,
      totalIn: 150.0,
      totalOut: 90.0,
      closingBalance: 160.0,
      transactions: [],
    );
  })
  ..unary(ReportingService.getBestSellingProducts, (req, _) async {
    return GetBestSellingProductsResponse(
      products: [
        BestSellingProduct()
          ..product = (StoreProduct()
            ..refId = 'sp_1'
            ..globalProductId = 'gp_1'
            ..salePrice = 10000)
          ..productName = 'Product One'
          ..totalRevenue = 50000
          ..transactionCount = 5
          ..unitsSold = 10,
        BestSellingProduct()
          ..product = (StoreProduct()
            ..refId = 'sp_2'
            ..globalProductId = 'gp_2'
            ..salePrice = 15000)
          ..productName = 'Product Two'
          ..totalRevenue = 75000
          ..transactionCount = 7
          ..unitsSold = 15,
      ],
    );
  })
  ..unary(ReportingService.getStorePurchaseHistory, (req, _) async {
    return GetStorePurchaseHistoryResponse(
      store: Store()
        ..refId = req.storeId
        ..name = 'Test Store',
      invoices: [
        Invoice()
          ..documentId = 'inv_1'
          ..issueDate = Timestamp.fromDateTime(clock.now())
          ..totalAmount = 100000,
        Invoice()
          ..documentId = 'inv_2'
          ..issueDate = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 1)),
          )
          ..totalAmount = 150000,
      ],
      totalPurchases: 250000,
      totalPaid: 200000,
      outstandingBalance: 50000,
      transactionCount: 2,
      lastPurchaseDate: Timestamp.fromDateTime(clock.now()),
    );
  })
  ..unary(ReportingService.getSupplierPerformanceReport, (req, _) async {
    return GetSupplierPerformanceReportResponse(
      supplier: Supplier()
        ..refId = req.supplierId
        ..name = 'Test Supplier',
      totalPurchaseOrders: 8,
      totalPurchaseValue: 250000,
      onTimeDeliveries: 6,
      lateDeliveries: 2,
      onTimePercentage: 75.0,
      qualityIssues: 1,
      averageDeliveryTimeDays: 3.5,
    );
  })
  ..unary(ReportingService.getProfitLossReport, (req, _) async {
    return GetProfitLossReportResponse(
      totalRevenue: 500000,
      costOfGoodsSold: 300000,
      grossProfit: 200000,
      grossProfitMargin: 0.4,
      returnsValue: 10000,
      adjustmentsValue: 5000,
      netProfit: 175000,
    );
  })
  ..unary(ReportingService.getStockAgingReport, (req, _) async {
    return GetStockAgingReportResponse(
      items: [
        StockAgingItem()
          ..product = (StoreProduct()
            ..refId = 'sp_1'
            ..globalProductId = 'gp_1'
            ..salePrice = 10000)
          ..quantity = 10.0
          ..stockValue = 100000
          ..lastMovementDate = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 15)),
          )
          ..daysSinceLastMovement = 15
          ..movementCategory =
              StockMovementCategory.STOCK_MOVEMENT_CATEGORY_FAST,
        StockAgingItem()
          ..product = (StoreProduct()
            ..refId = 'sp_2'
            ..globalProductId = 'gp_2'
            ..salePrice = 15000)
          ..quantity = 5.0
          ..stockValue = 75000
          ..lastMovementDate = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 30)),
          )
          ..daysSinceLastMovement = 30
          ..movementCategory =
              StockMovementCategory.STOCK_MOVEMENT_CATEGORY_MEDIUM,
      ],
      totalStockValue: 175000,
      slowMovingStockValue: 75000,
    );
  })
  ..unary(InventoryService.getRecentInventoryTransactions, (req, _) async {
    final request = req;

    return GetInventoryTransactionHistoryResponse(
      transactions: [
        InventoryTransaction()
          ..documentId = 'txn_1'
          ..storeId = request.storeId
          ..productId = 'sp_1'
          ..transactionType = TransactionType.TXN_TYPE_PURCHASE
          ..quantityChange = 10
          ..quantityBefore = 0
          ..quantityAfter = 10
          ..relatedDocumentType = 'Purchase Order'
          ..relatedDocumentId = 'po_1'
          ..performedByUserId = 'user_1'
          ..transactionTime = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(hours: 2)),
          )
          ..notes = 'Initial stock',
        InventoryTransaction()
          ..documentId = 'txn_2'
          ..storeId = request.storeId
          ..productId = 'sp_2'
          ..transactionType = TransactionType.TXN_TYPE_SALE
          ..quantityChange = -5
          ..quantityBefore = 15
          ..quantityAfter = 10
          ..relatedDocumentType = 'Sales Order'
          ..relatedDocumentId = 'so_1'
          ..performedByUserId = 'user_2'
          ..transactionTime = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(hours: 1)),
          )
          ..notes = 'Customer sale',
      ],
      totalCount: 2,
      totalQuantityIn: 10.0,
      totalQuantityOut: 5.0,
    );
  })
  ..unary(StoreProductService.findGlobalProducts, (req, _) async {
    return FindGlobalProductsResponse(
      products: [
        GlobalProduct()
          ..refId = 'gp_1'
          ..name = (Internationalized()
            ..en = 'Product One'
            ..fr = 'Produit Un')
          ..description = (Internationalized()
            ..en = 'Description One'
            ..fr = 'Description Un')
          ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        GlobalProduct()
          ..refId = 'gp_2'
          ..name = (Internationalized()
            ..en = 'Product Two'
            ..fr = 'Produit Deux')
          ..description = (Internationalized()
            ..en = 'Description Two'
            ..fr = 'Description Deux')
          ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
        GlobalProduct()
          ..refId = 'gp_3'
          ..name = (Internationalized()
            ..en = 'Product Three'
            ..fr = 'Produit Trois')
          ..description = (Internationalized()
            ..en = 'Description Three'
            ..fr = 'Description Trois')
          ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
      ],
    );
  })
  // Moc CategoryService.findCategories for product categories
  ..unary(CategoryService.findCategories, (req, _) async {
    return FindCategoriesResponse(
      categories: [
        Category()
          ..refId = 'cat_1'
          ..name = (Internationalized()
            ..en = 'Electronics'
            ..fr = 'Électronique')
          ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE
          ..businessId = 'business_1',
        Category()
          ..refId = 'cat_2'
          ..name = (Internationalized()
            ..en = 'Clothing'
            ..fr = 'Vêtements')
          ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE
          ..businessId = 'business_1',
      ],
      // totalCount: 2,
    );
  })
  ..unary(ReportsService.getDashboardReport, (req, _) async {
    return GetDashboardReportResponse(
      totalSalesAmount: 500000,
      totalTransactions: 15,
      averageTransactionValue: 33333.33,
      totalUnitsSold: 100,
      totalRevenue: 450000,
      netProfit: 150000,
      grossProfitMargin: 0.333,
      totalPurchases: 300000,
      totalProducts: 50,
      totalInventoryValue: 750000,
      lowStockCount: 5,
      salesAndProfitTrend: [
        TrendDataPoint()
          ..date = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 30)),
          )
          ..salesValue = 10000.0
          ..profitValue = 3000.0,
        TrendDataPoint()
          ..date = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 25)),
          )
          ..salesValue = 15000.0
          ..profitValue = 4500.0,
      ],
      categorySalesBreakdown: [
        CategorySalesData()
          ..categoryName = 'Electronics'
          ..totalSalesAmount = 250000.0
          ..totalUnitsSold = 45
          ..transactionCount = 8
          ..percentageOfTotal = 50.0,
      ],
      revenueVsExpenses: [
        RevenueExpenseDataPoint()
          ..periodStart = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 30)),
          )
          ..periodEnd = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 25)),
          )
          ..revenue = 10000.0
          ..expenses = 7000.0
          ..netAmount = 3000.0,
      ],
      inventoryMovement: [
        StockMovementDataPoint()
          ..date = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 30)),
          )
          ..stockLevel = 100.0
          ..movementQuantity = 10.0
          ..movementType = 'IN',
      ],
      salesComparison: SalesComparisonData()
        ..previousYearTotalSales = 400000
        ..previousYearTotalTransactions = 12
        ..previousYearAverageTransactionValue = 33333.33,
      financialComparison: FinancialComparisonData()
        ..previousYearTotalRevenue = 380000
        ..previousYearNetProfit = 120000
        ..previousYearGrossProfitMargin = 0.316
        ..previousYearTotalPurchases = 260000,
      topPerformingProducts: [
        BestSellingProduct()
          ..product = (StoreProduct()
            ..refId = 'sp_1'
            ..globalProductId = 'gp_1'
            ..salePrice = 10000)
          ..productName = 'Product One'
          ..totalRevenue = 50000
          ..transactionCount = 5
          ..unitsSold = 10,
      ],
      supplierPerformances: [
        SupplierPerformanceSummary()
          ..supplierId = 'supplier_1'
          ..supplierName = 'Supplier One'
          ..totalPurchaseValue = 150000
          ..onTimePercentage = 85.0
          ..totalOrders = 6,
      ],
      stockAgingItems: [
        StockAgingItem()
          ..product = (StoreProduct()
            ..refId = 'sp_1'
            ..globalProductId = 'gp_1'
            ..salePrice = 10000)
          ..quantity = 10.0
          ..stockValue = 100000
          ..lastMovementDate = Timestamp.fromDateTime(
            clock.now().subtract(const Duration(days: 15)),
          )
          ..daysSinceLastMovement = 15
          ..movementCategory =
              StockMovementCategory.STOCK_MOVEMENT_CATEGORY_FAST,
      ],
    );
  }).build();

void main() {
  group('Goldens', () {
    setUpAll(() {
      final storage = AppStorageService(AppStorageType.fake, {
        CollectionName.users: User()
          ..refId = 'user_1'
          ..email = 'test@example.com'
          ..firstName = 'Test'
          ..lastName = 'User',
        CollectionName.businesses: Business()
          ..refId = 'business_1'
          ..name = 'Test Business',
        CollectionName.stores: Store()
          ..refId = 'store_1'
          ..name = 'Test Store'
          ..businessId = 'business_1',
      });
      GetIt.I.registerSingletonIfAbsent<AppStorageService>(() => storage);
    });

    setUp(() {
      GetIt.I.registerSingletonIfAbsent<ConnectRPCService>(
        () => ConnectRPCService(clientChannel: reportsFakeTransport.build()),
      );
    });
    testGoldens('Reports view', (tester) async {
      return withClock(
        Clock.fixed(DateTime.parse('2025-09-01 15:30:00Z').toUtc()),
        () async {
          await multiScreenMultiLocaleGolden(
            tester,
            const ReportsScreen(),
            'reports_view',
          );
        },
      );
    });
  });
}
