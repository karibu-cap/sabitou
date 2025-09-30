//
//  Generated code. Do not modify.
//  source: inventory/v1/inventory.proto
//

import "package:connectrpc/connect.dart" as connect;
import "inventory.pb.dart" as inventoryv1inventory;
import "inventory.connect.spec.dart" as specs;

extension type InventoryServiceClient (connect.Transport _transport) {
  /// Gets the inventory levels of a product.
  Future<inventoryv1inventory.GetProductInventoryLevelsResponse> getProductInventoryLevels(
    inventoryv1inventory.GetProductInventoryLevelsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InventoryService.getProductInventoryLevels,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Checks if a product is available in a warehouse.
  Future<inventoryv1inventory.CheckProductAvailabilityResponse> checkProductAvailability(
    inventoryv1inventory.CheckProductAvailabilityRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InventoryService.checkProductAvailability,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets low stock items for a store.
  Future<inventoryv1inventory.GetLowStockItemsResponse> getLowStockItems(
    inventoryv1inventory.GetLowStockItemsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InventoryService.getLowStockItems,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets a snapshot of store inventory.
  Future<inventoryv1inventory.GetResourceInventoryResponse> getResourceInventory(
    inventoryv1inventory.GetResourceInventoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InventoryService.getResourceInventory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets recent inventory transactions for a store (for dashboard activity).
  Future<inventoryv1inventory.GetInventoryTransactionHistoryResponse> getRecentInventoryTransactions(
    inventoryv1inventory.GetInventoryTransactionHistoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InventoryService.getRecentInventoryTransactions,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets the transaction history of a product.
  Future<inventoryv1inventory.GetProductTransactionHistoryResponse> getProductTransactionHistory(
    inventoryv1inventory.GetProductTransactionHistoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InventoryService.getProductTransactionHistory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
