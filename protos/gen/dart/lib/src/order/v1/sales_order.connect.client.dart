//
//  Generated code. Do not modify.
//  source: order/v1/sales_order.proto
//

import "package:connectrpc/connect.dart" as connect;
import "sales_order.pb.dart" as orderv1sales_order;
import "sales_order.connect.spec.dart" as specs;

extension type SalesOrderServiceClient (connect.Transport _transport) {
  /// Create a sales order (customer order)
  Future<orderv1sales_order.CreateSalesOrderResponse> createSalesOrder(
    orderv1sales_order.CreateSalesOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SalesOrderService.createSalesOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get sales order details
  Future<orderv1sales_order.GetSalesOrderResponse> getSalesOrder(
    orderv1sales_order.GetSalesOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SalesOrderService.getSalesOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// List sales orders with filtering
  Future<orderv1sales_order.ListSalesOrdersResponse> listSalesOrders(
    orderv1sales_order.ListSalesOrdersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SalesOrderService.listSalesOrders,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Update sales order status
  Future<orderv1sales_order.UpdateSalesOrderStatusResponse> updateSalesOrderStatus(
    orderv1sales_order.UpdateSalesOrderStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SalesOrderService.updateSalesOrderStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Cancel a sales order
  Future<orderv1sales_order.CancelSalesOrderResponse> cancelSalesOrder(
    orderv1sales_order.CancelSalesOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SalesOrderService.cancelSalesOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Create delivery note from sales order
  Future<orderv1sales_order.CreateDeliveryNoteResponse> createDeliveryNote(
    orderv1sales_order.CreateDeliveryNoteRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SalesOrderService.createDeliveryNote,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Create invoice from sales order
  Future<orderv1sales_order.CreateInvoiceFromSalesOrderResponse> createInvoiceFromSalesOrder(
    orderv1sales_order.CreateInvoiceFromSalesOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.SalesOrderService.createInvoiceFromSalesOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
