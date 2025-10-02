//
//  Generated code. Do not modify.
//  source: inventory/v1/inventory.proto
//

import "package:connectrpc/connect.dart" as connect;
import "inventory.pb.dart" as inventoryv1inventory;

abstract final class InventoryService {
  /// Fully-qualified name of the InventoryService service.
  static const name = 'inventory.v1.InventoryService';

  /// Gets the inventory levels of a product.
  static const getProductInventoryLevels = connect.Spec(
    '/$name/GetProductInventoryLevels',
    connect.StreamType.unary,
    inventoryv1inventory.GetProductInventoryLevelsRequest.new,
    inventoryv1inventory.GetProductInventoryLevelsResponse.new,
  );

  /// Checks if a product is available in a warehouse.
  static const checkProductAvailability = connect.Spec(
    '/$name/CheckProductAvailability',
    connect.StreamType.unary,
    inventoryv1inventory.CheckProductAvailabilityRequest.new,
    inventoryv1inventory.CheckProductAvailabilityResponse.new,
  );

  /// Gets low stock items for a store.
  static const getLowStockItems = connect.Spec(
    '/$name/GetLowStockItems',
    connect.StreamType.unary,
    inventoryv1inventory.GetLowStockItemsRequest.new,
    inventoryv1inventory.GetLowStockItemsResponse.new,
  );

  /// Gets a snapshot of store inventory.
  static const getResourceInventory = connect.Spec(
    '/$name/GetResourceInventory',
    connect.StreamType.unary,
    inventoryv1inventory.GetResourceInventoryRequest.new,
    inventoryv1inventory.GetResourceInventoryResponse.new,
  );

  /// Gets recent inventory transactions for a store (for dashboard activity).
  static const getRecentInventoryTransactions = connect.Spec(
    '/$name/GetRecentInventoryTransactions',
    connect.StreamType.unary,
    inventoryv1inventory.GetInventoryTransactionHistoryRequest.new,
    inventoryv1inventory.GetInventoryTransactionHistoryResponse.new,
  );

  /// Gets the transaction history of a product.
  static const getProductTransactionHistory = connect.Spec(
    '/$name/GetProductTransactionHistory',
    connect.StreamType.unary,
    inventoryv1inventory.GetProductTransactionHistoryRequest.new,
    inventoryv1inventory.GetProductTransactionHistoryResponse.new,
  );

  /// Gets the products by supplier.
  static const listProductsBySupplier = connect.Spec(
    '/$name/ListProductsBySupplier',
    connect.StreamType.unary,
    inventoryv1inventory.ListProductsBySupplierRequest.new,
    inventoryv1inventory.ListProductsBySupplierResponse.new,
  );
}
