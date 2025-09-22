import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'locales/local_orders_repository.dart';
import 'remotes/remote_orders_repository.dart';

/// The orders repository.
class OrdersRepository {
  final _logger = LoggerApp('OrdersRepository');

  /// The order service client.
  final OrderServiceClient orderServiceClient;

  /// The instance of [OrdersRepository].
  static final instance = GetIt.I.get<OrdersRepository>();

  /// The network status provider.
  final NetworkStatusProvider _network;

  /// The local products repository.
  final LocalOrdersRepository localOrdersRepository = LocalOrdersRepository();

  /// The remote orders repository.
  final RemoteOrdersRepository remoteOrdersRepository;

  /// Constructs a new [OrdersRepository].
  OrdersRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : orderServiceClient = OrderServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       remoteOrdersRepository = RemoteOrdersRepository(
         transport: transport ?? ConnectRPCService.to.clientChannel,
       ),
       _network = networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Gets list of order with filter by supplier id.
  Future<List<Order>> getOrdersByQuery(FindOrdersRequest request) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        return await remoteOrdersRepository.getOrdersByQuery(request);
      }

      return localOrdersRepository.getOrdersByQuery(request);
    } on Exception catch (e) {
      _logger.severe('getOrdersByQuery Error: $e');

      return [];
    }
  }

  /// Gets the order by ref-id.
  Future<Order> getOrderByRefId(String refId) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        return await remoteOrdersRepository.getOrderByRefId(refId);
      }

      return localOrdersRepository.getOrderByRefId(refId);
    } on Exception catch (e) {
      _logger.severe('getOrderByRefId Error: $e');

      return Order();
    }
  }

  /// Adds an order.
  Future<String?> addOrder(CreateOrderRequest request) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        return await remoteOrdersRepository.addOrder(request);
      }

      return localOrdersRepository.addOrder(request);
    } on Exception catch (e) {
      _logger.severe('addOrder Error: $e');
    }

    return null;
  }
}
