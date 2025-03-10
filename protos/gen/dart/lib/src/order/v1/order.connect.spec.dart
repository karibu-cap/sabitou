//
//  Generated code. Do not modify.
//  source: order/v1/order.proto
//

import "package:connectrpc/connect.dart" as connect;
import "order.pb.dart" as orderv1order;

abstract final class OrderService {
  /// Fully-qualified name of the OrderService service.
  static const name = 'order.v1.OrderService';

  /// Creates a new order.
  static const createOrder = connect.Spec(
    '/$name/CreateOrder',
    connect.StreamType.unary,
    orderv1order.CreateOrderRequest.new,
    orderv1order.CreateOrderResponse.new,
  );

  /// Gets an order by id.
  static const getOrder = connect.Spec(
    '/$name/GetOrder',
    connect.StreamType.unary,
    orderv1order.GetOrderRequest.new,
    orderv1order.GetOrderResponse.new,
  );

  /// Deletes an order.
  static const deleteOrder = connect.Spec(
    '/$name/DeleteOrder',
    connect.StreamType.unary,
    orderv1order.DeleteOrderRequest.new,
    orderv1order.DeleteOrderResponse.new,
  );
}
