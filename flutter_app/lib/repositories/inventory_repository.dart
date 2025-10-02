import 'package:clock/clock.dart';
import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The inventory repository.
class InventoryRepository {
  final _logger = LoggerApp('InventoryRepository');

  /// The instance of [InventoryRepository].
  static final instance = GetIt.I.get<InventoryRepository>();

  /// The inventory service client.
  final InventoryServiceClient inventoryServiceClient;

  /// The Store product service client for product-related operations.
  final StoreProductServiceClient storeProductService;

  /// Constructs a new [InventoryRepository].
  InventoryRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : inventoryServiceClient = InventoryServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       storeProductService = StoreProductServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       );

  /// Gets the inventory levels of a product.
  Future<GetProductInventoryLevelsResponse> getProductInventoryLevels(
    String productId,
  ) async {
    try {
      return await inventoryServiceClient.getProductInventoryLevels(
        GetProductInventoryLevelsRequest(productId: productId),
      );
    } on Exception catch (e) {
      _logger.severe('getProductInventoryLevels Error: $e');

      return GetProductInventoryLevelsResponse();
    }
  }

  /// Checks if a product is available in a warehouse.
  Future<CheckProductAvailabilityResponse> checkProductAvailability(
    CheckProductAvailabilityRequest request,
  ) async {
    try {
      return await inventoryServiceClient.checkProductAvailability(request);
    } on Exception catch (e) {
      _logger.severe('checkProductAvailability Error: $e');

      return CheckProductAvailabilityResponse();
    }
  }

  /// Gets low stock items for a store.
  /// Get low stock items for a store.
  Future<List<InventoryLevelWithProduct>> getLowStockItems(
    String storeId,
  ) async {
    try {
      final request = GetLowStockItemsRequest(storeId: storeId);
      final response = await inventoryServiceClient.getLowStockItems(request);

      final items = <InventoryLevelWithProduct>[];
      for (final level in response.lowStockItems) {
        final productReq = GetStoreProductRequest(
          storeProductId: level.storeProductId,
        );
        final productResp = await storeProductService.getStoreProduct(
          productReq,
        );

        if (!productResp.hasProduct()) {
          continue;
        }

        items.add(
          InventoryLevelWithProduct(
            level: level,
            product: productResp.product.storeProduct,
            globalProduct: productResp.product.globalProduct,
            stockValue:
                (level.quantityAvailable *
                        productResp.product.storeProduct.salePrice)
                    .truncate(),
          ),
        );
      }

      return items;
    } catch (e) {
      _logger.severe('Error getting low stock items: $e');
      rethrow;
    }
  }

  /// Gets the store inventory.
  Future<List<InventoryLevelWithProduct>> getStoreInventory(
    String storeId,
  ) async {
    try {
      final request = GetResourceInventoryRequest(storeId: storeId);
      final response = await inventoryServiceClient.getResourceInventory(
        request,
      );

      final items = <InventoryLevelWithProduct>[];
      for (final level in response.items) {
        final productReq = GetStoreProductRequest(
          storeProductId: level.storeProductId,
        );
        final productResp = await storeProductService.getStoreProduct(
          productReq,
        );

        if (!productResp.hasProduct()) {
          continue;
        }

        items.add(
          InventoryLevelWithProduct(
            level: level,
            product: productResp.product.storeProduct,
            globalProduct: productResp.product.globalProduct,
            stockStatus: level.quantityAvailable == 0
                ? StockStatus.STOCK_STATUS_OUT_OF_STOCK
                : level.quantityAvailable > level.minThreshold
                ? StockStatus.STOCK_STATUS_OK
                : StockStatus.STOCK_STATUS_LOW,
            stockValue:
                (level.quantityAvailable *
                        productResp.product.storeProduct.salePrice)
                    .truncate(),
          ),
        );
      }

      return items;
    } catch (e) {
      _logger.severe('Error getting store inventory: $e');
      rethrow;
    }
  }

  /// Get expiring items for a store.
  Future<List<InventoryLevelWithProduct>> getExpiringItems(
    String storeId, {
    int numberOfDays = 60,
  }) async {
    try {
      final response = await getStoreInventory(storeId);

      final items = <InventoryLevelWithProduct>[];
      for (final inv in response) {
        // Check if any batch is expiring
        final hasExpiringBatch = inv.level.batches.any((batch) {
          final now = clock.now();
          final expiry = batch.expirationDate.toDateTime();

          return expiry.difference(now).inDays <= numberOfDays;
        });

        if (hasExpiringBatch) {
          items.add(inv);
        }
      }

      return items;
    } catch (e) {
      _logger.severe('Error getting expiring items: $e');
      rethrow;
    }
  }

  /// Gets recent inventory transactions history  .
  Future<GetInventoryTransactionHistoryResponse> getInventoryTransactionHistory(
    GetInventoryTransactionHistoryRequest request,
  ) async {
    try {
      return await inventoryServiceClient.getRecentInventoryTransactions(
        request,
      );
    } on Exception catch (e) {
      _logger.severe('getInventoryTransactionHistory Error: $e');

      return GetInventoryTransactionHistoryResponse();
    }
  }
}
