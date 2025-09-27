//
//  Generated code. Do not modify.
//  source: inventory/v1/stock_in_bound.proto
//

import "package:connectrpc/connect.dart" as connect;
import "stock_in_bound.pb.dart" as inventoryv1stock_in_bound;

abstract final class StockInboundService {
  /// Fully-qualified name of the StockInboundService service.
  static const name = 'inventory.v1.StockInboundService';

  /// Creates a stock in bound.
  static const createStockInbound = connect.Spec(
    '/$name/CreateStockInbound',
    connect.StreamType.unary,
    inventoryv1stock_in_bound.CreateStockInboundRequest.new,
    inventoryv1stock_in_bound.CreateStockInboundResponse.new,
  );

  /// Updates the stock in bound.
  static const updateStockInbound = connect.Spec(
    '/$name/UpdateStockInbound',
    connect.StreamType.unary,
    inventoryv1stock_in_bound.UpdateStockInboundRequest.new,
    inventoryv1stock_in_bound.UpdateStockInboundResponse.new,
  );

  /// Finds the stock in bounds.
  static const findStockInbounds = connect.Spec(
    '/$name/FindStockInbounds',
    connect.StreamType.unary,
    inventoryv1stock_in_bound.FindStockInboundRequest.new,
    inventoryv1stock_in_bound.FindStockInboundResponse.new,
  );
}
