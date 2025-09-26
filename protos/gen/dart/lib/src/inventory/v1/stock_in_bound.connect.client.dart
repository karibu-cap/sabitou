//
//  Generated code. Do not modify.
//  source: inventory/v1/stock_in_bound.proto
//

import "package:connectrpc/connect.dart" as connect;
import "stock_in_bound.pb.dart" as inventoryv1stock_in_bound;
import "stock_in_bound.connect.spec.dart" as specs;

extension type StockInboundServiceClient (connect.Transport _transport) {
  /// Creates a stock in bound.
  Future<inventoryv1stock_in_bound.CreateStockInboundResponse> createStockInbound(
    inventoryv1stock_in_bound.CreateStockInboundRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StockInboundService.createStockInbound,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Updates the stock in bound.
  Future<inventoryv1stock_in_bound.UpdateStockInboundResponse> updateStockInbound(
    inventoryv1stock_in_bound.UpdateStockInboundRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.StockInboundService.updateStockInbound,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
