import 'package:connectrpc/connect.dart' as connect;
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/rpc/connect_rpc.dart';
import '../../utils/logger.dart';

/// Remote repository for sales order operations.
class RemoteSalesOrderRepository {
  final _logger = LoggerApp('RemoteSalesOrderRepository');

  /// The sales order service client.
  final SalesOrderServiceClient salesOrderServiceClient;

  /// Constructs a new [RemoteSalesOrderRepository].
  RemoteSalesOrderRepository({connect.Transport? transport})
    : salesOrderServiceClient = SalesOrderServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Creates a sales order.
  Future<CreateSalesOrderResponse?> createSalesOrder(
    CreateSalesOrderRequest request,
  ) async {
    try {
      final response = await salesOrderServiceClient.createSalesOrder(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('createSalesOrder Error: $e');

      return null;
    }
  }

  /// Gets a sales order by ID.
  Future<GetSalesOrderResponse?> getSalesOrder(
    GetSalesOrderRequest request,
  ) async {
    try {
      final response = await salesOrderServiceClient.getSalesOrder(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('getSalesOrder Error: $e');

      return null;
    }
  }

  /// Lists sales orders with filters.
  Future<ListSalesOrdersResponse?> listSalesOrders(
    ListSalesOrdersRequest request,
  ) async {
    try {
      final response = await salesOrderServiceClient.listSalesOrders(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('listSalesOrders Error: $e');

      return null;
    }
  }

  /// Updates sales order status.
  Future<UpdateSalesOrderStatusResponse?> updateSalesOrderStatus(
    UpdateSalesOrderStatusRequest request,
  ) async {
    try {
      final response = await salesOrderServiceClient.updateSalesOrderStatus(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('updateSalesOrderStatus Error: $e');

      return null;
    }
  }

  /// Cancels a sales order.
  Future<CancelSalesOrderResponse?> cancelSalesOrder(
    CancelSalesOrderRequest request,
  ) async {
    try {
      final response = await salesOrderServiceClient.cancelSalesOrder(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('cancelSalesOrder Error: $e');

      return null;
    }
  }

  /// Creates a delivery note from sales order.
  Future<CreateDeliveryNoteResponse?> createDeliveryNote(
    CreateDeliveryNoteRequest request,
  ) async {
    try {
      final response = await salesOrderServiceClient.createDeliveryNote(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('createDeliveryNote Error: $e');

      return null;
    }
  }

  /// Creates an invoice from sales order.
  Future<CreateInvoiceFromSalesOrderResponse?> createInvoiceFromSalesOrder(
    CreateInvoiceFromSalesOrderRequest request,
  ) async {
    try {
      final response = await salesOrderServiceClient
          .createInvoiceFromSalesOrder(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('createInvoiceFromSalesOrder Error: $e');

      return null;
    }
  }
}
