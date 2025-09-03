import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The orders repository.
final class OrdersRepository extends GetxService {
  final _logger = LoggerApp('OrdersRepository');

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
    } on Exception catch (e) {
      _logger.severe('getOrdersByQuery Error: $e');

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
    } on Exception catch (e) {
      _logger.severe('getOrderByRefId Error: $e');

      return Order();
    }
  }
}
