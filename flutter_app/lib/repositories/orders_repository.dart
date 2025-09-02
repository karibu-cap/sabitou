import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';

/// The orders repository.
final class OrdersRepository extends GetxService {
  /// The order service client.
  final OrderServiceClient orderServiceClient;

  /// The instance of [OrdersRepository].
  static final instance = Get.find<OrdersRepository>();

  /// Constructs a new [OrdersRepository].
  OrdersRepository()
    : orderServiceClient = OrderServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets list of order with filter by supplier id.
  Future<List<Order>> getOrdersByQuery({String? supplierId}) async {
    try {
      final result = await orderServiceClient.findOrders(
        FindOrdersRequest(fromId: supplierId),
      );

      return result.orders;
    } catch (e) {
      debugPrint(e.toString());
      print(e);

      return [];
    }
  }

  /// Gets the order by ref-id.
  Future<Order> getOrderByRefId(String refId) async {
    try {
      final result = await orderServiceClient.getOrder(
        GetOrderRequest(orderId: refId),
      );

      return result.order;
    } catch (e) {
      debugPrint(e.toString());

      return Order();
    }
  }
}
