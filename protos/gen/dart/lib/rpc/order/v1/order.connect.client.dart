//
//  Generated code. Do not modify.
//  source: order/v1/order.proto
//

import "package:connectrpc/connect.dart" as connect;
import "order.pb.dart" as orderv1order;
import "order.connect.spec.dart" as specs;

extension type OrderServiceClient (connect.Transport _transport) {
  /// Creates a new order.
  Future<orderv1order.CreateOrderResponse> createOrder(
    orderv1order.CreateOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.OrderService.createOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Gets an order by id.
  Future<orderv1order.GetOrderResponse> getOrder(
    orderv1order.GetOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.OrderService.getOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Deletes an order.
  Future<orderv1order.DeleteOrderResponse> deleteOrder(
    orderv1order.DeleteOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.OrderService.deleteOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
