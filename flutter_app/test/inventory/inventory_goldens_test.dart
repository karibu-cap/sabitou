import 'package:clock/clock.dart';
import 'package:fixnum/fixnum.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/inventory/inventory_screen.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_clients/services/storage/app_storage.dart';
import 'package:sabitou_clients/utils/app_constants.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

final inventoryFakeTransport = FakeTransportBuilder()
  ..unary(StoreProductService.listStoreProducts, (req, _) async {
    final request = req;

    return ListStoreProductsResponse(
      products: [
        StoreProduct()
          ..refId = 'sp_1'
          ..storeId = request.storeId
          ..globalProductId = 'gp_1'
          ..salePrice = 10000
          ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
        StoreProduct()
          ..refId = 'sp_2'
          ..storeId = request.storeId
          ..globalProductId = 'gp_2'
          ..salePrice = 15000
          ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
        StoreProduct()
          ..refId = 'sp_3'
          ..storeId = request.storeId
          ..globalProductId = 'gp_3'
          ..salePrice = 20000
          ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
      ],
      totalCount: 3,
    );
  })
  ..unary(StoreProductService.getStoreProduct, (req, _) async {
    final request = req;

    return GetStoreProductResponse(
      storeProduct: StoreProduct()
        ..refId = request.storeProductId
        ..storeId = 'store_1'
        ..globalProductId = 'gp_${request.storeProductId.substring(3)}'
        ..salePrice =
            10000 + int.parse(request.storeProductId.substring(3)) * 5000
        ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
    );
  })
  ..unary(InventoryService.getLowStockItems, (req, _) async {
    final request = req;

    return GetLowStockItemsResponse(
      lowStockItems: [
        InventoryLevel()
          ..storeProductId = 'sp_1'
          ..storeId = request.storeId
          ..quantityAvailable = 5.0
          ..quantityReserved = 0.0
          ..minThreshold = 10.0
          ..lastUpdated = Timestamp.fromDateTime(clock.now()),
        InventoryLevel()
          ..storeProductId = 'sp_2'
          ..storeId = request.storeId
          ..quantityAvailable = 8.0
          ..quantityReserved = 2.0
          ..minThreshold = 15.0
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
          ..quantityAvailable = 20.0
          ..quantityReserved = 0.0
          ..batches.add(
            Batch()
              ..documentId = 'batch_1'
              ..productId = 'sp_3'
              ..warehouseId = request.storeId
              ..quantity = 20.0
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
              ..quantity = 0.0
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
          ..salesAmount = Int64(250000)
          ..transactionCount = 8
          ..unitsSold = 50,
      ],
      totalSalesAmount: Int64(500000),
      totalTransactions: 15,
      totalUnitsSold: 100,
      averageTransactionValue: Int64(33333),
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
          ..quantityChange = 10.0
          ..quantityBefore = 0.0
          ..quantityAfter = 10.0
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
          ..quantityChange = -5.0
          ..quantityBefore = 15.0
          ..quantityAfter = 10.0
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
        () => ConnectRPCService(clientChannel: inventoryFakeTransport.build()),
      );
    });
    testGoldens('Inventory view', (tester) async {
      return withClock(
        Clock.fixed(DateTime.parse('2025-09-01 15:30:00Z').toUtc()),
        () async {
          await multiScreenMultiLocaleGolden(
            tester,
            const InventoryScreen(),
            'inventory_view',
          );
        },
      );
    });
  });
}
