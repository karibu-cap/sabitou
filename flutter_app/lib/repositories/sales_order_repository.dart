import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'remotes/remote_sales_order_repository.dart';

/// The sales order repository.
class SalesOrderRepository {
  final _logger = LoggerApp('SalesOrderRepository');

  /// The instance of [SalesOrderRepository].
  static final instance = GetIt.I.get<SalesOrderRepository>();

  /// The remote sales order repository.
  final RemoteSalesOrderRepository remoteSalesOrderRepository;

  /// Constructs a new [SalesOrderRepository].
  SalesOrderRepository({connect.Transport? transport})
    : remoteSalesOrderRepository = RemoteSalesOrderRepository(
        transport: transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Creates a sales order.
  Future<CreateSalesOrderResponse?> createSalesOrder(
    CreateSalesOrderRequest request,
  ) async {
    try {
      return await remoteSalesOrderRepository.createSalesOrder(request);
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
      return await remoteSalesOrderRepository.getSalesOrder(request);
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
      return await remoteSalesOrderRepository.listSalesOrders(request);
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
      return await remoteSalesOrderRepository.updateSalesOrderStatus(request);
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
      return await remoteSalesOrderRepository.cancelSalesOrder(request);
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
      return await remoteSalesOrderRepository.createDeliveryNote(request);
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
      return await remoteSalesOrderRepository.createInvoiceFromSalesOrder(
        request,
      );
    } on Exception catch (e) {
      _logger.severe('createInvoiceFromSalesOrder Error: $e');

      return null;
    }
  }
}
