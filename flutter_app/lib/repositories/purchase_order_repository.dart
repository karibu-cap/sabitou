import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The purchase order repository.
class PurchaseOrderRepository {
  final _logger = LoggerApp('PurchaseOrderRepository');

  /// The purchase order service client.
  final PurchaseOrderServiceClient purchaseOrderServiceClient;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The instance of [PurchaseOrderRepository].
  static final instance = GetIt.I.get<PurchaseOrderRepository>();

  /// Constructs a new [PurchaseOrderRepository].
  PurchaseOrderRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : purchaseOrderServiceClient = PurchaseOrderServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Creates a purchase order.
  Future<CreatePurchaseOrderResponse?> createPurchaseOrder(
    CreatePurchaseOrderRequest request,
  ) async {
    try {
      final response = await purchaseOrderServiceClient.createPurchaseOrder(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('createPurchaseOrder Error: $e');

      return null;
    }
  }

  /// Gets a purchase order.
  Future<GetPurchaseOrderResponse?> getPurchaseOrder(
    GetPurchaseOrderRequest request,
  ) async {
    try {
      final response = await purchaseOrderServiceClient.getPurchaseOrder(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('getPurchaseOrder Error: $e');

      return null;
    }
  }

  /// Lists purchase orders.
  Future<ListPurchaseOrdersResponse?> listPurchaseOrders(
    ListPurchaseOrdersRequest request,
  ) async {
    try {
      final response = await purchaseOrderServiceClient.listPurchaseOrders(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('listPurchaseOrders Error: $e');

      return null;
    }
  }

  /// Updates purchase order status.
  Future<UpdatePurchaseOrderStatusResponse?> updatePurchaseOrderStatus(
    UpdatePurchaseOrderStatusRequest request,
  ) async {
    try {
      final response = await purchaseOrderServiceClient
          .updatePurchaseOrderStatus(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('updatePurchaseOrderStatus Error: $e');

      return null;
    }
  }

  /// Cancels a purchase order.
  Future<CancelPurchaseOrderResponse?> cancelPurchaseOrder(
    CancelPurchaseOrderRequest request,
  ) async {
    try {
      final response = await purchaseOrderServiceClient.cancelPurchaseOrder(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('cancelPurchaseOrder Error: $e');

      return null;
    }
  }

  /// Creates a receiving note.
  Future<CreateReceivingNoteResponse?> createReceivingNote(
    CreateReceivingNoteRequest request,
  ) async {
    try {
      final response = await purchaseOrderServiceClient.createReceivingNote(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('createReceivingNote Error: $e');

      return null;
    }
  }

  /// Gets suggested purchase orders.
  Future<GetSuggestedPurchaseOrdersResponse?> getSuggestedPurchaseOrders(
    GetSuggestedPurchaseOrdersRequest request,
  ) async {
    try {
      final response = await purchaseOrderServiceClient
          .getSuggestedPurchaseOrders(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('getSuggestedPurchaseOrders Error: $e');

      return null;
    }
  }
}
