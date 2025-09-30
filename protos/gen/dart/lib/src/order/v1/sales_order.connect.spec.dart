//
//  Generated code. Do not modify.
//  source: order/v1/sales_order.proto
//

import "package:connectrpc/connect.dart" as connect;
import "sales_order.pb.dart" as orderv1sales_order;

abstract final class SalesOrderService {
  /// Fully-qualified name of the SalesOrderService service.
  static const name = 'order.v1.SalesOrderService';

  /// Create a sales order (customer order)
  static const createSalesOrder = connect.Spec(
    '/$name/CreateSalesOrder',
    connect.StreamType.unary,
    orderv1sales_order.CreateSalesOrderRequest.new,
    orderv1sales_order.CreateSalesOrderResponse.new,
  );

  /// Get sales order details
  static const getSalesOrder = connect.Spec(
    '/$name/GetSalesOrder',
    connect.StreamType.unary,
    orderv1sales_order.GetSalesOrderRequest.new,
    orderv1sales_order.GetSalesOrderResponse.new,
  );

  /// List sales orders with filtering
  static const listSalesOrders = connect.Spec(
    '/$name/ListSalesOrders',
    connect.StreamType.unary,
    orderv1sales_order.ListSalesOrdersRequest.new,
    orderv1sales_order.ListSalesOrdersResponse.new,
  );

  /// Update sales order status
  static const updateSalesOrderStatus = connect.Spec(
    '/$name/UpdateSalesOrderStatus',
    connect.StreamType.unary,
    orderv1sales_order.UpdateSalesOrderStatusRequest.new,
    orderv1sales_order.UpdateSalesOrderStatusResponse.new,
  );

  /// Cancel a sales order
  static const cancelSalesOrder = connect.Spec(
    '/$name/CancelSalesOrder',
    connect.StreamType.unary,
    orderv1sales_order.CancelSalesOrderRequest.new,
    orderv1sales_order.CancelSalesOrderResponse.new,
  );

  /// Create delivery note from sales order
  static const createDeliveryNote = connect.Spec(
    '/$name/CreateDeliveryNote',
    connect.StreamType.unary,
    orderv1sales_order.CreateDeliveryNoteRequest.new,
    orderv1sales_order.CreateDeliveryNoteResponse.new,
  );

  /// Create invoice from sales order
  static const createInvoiceFromSalesOrder = connect.Spec(
    '/$name/CreateInvoiceFromSalesOrder',
    connect.StreamType.unary,
    orderv1sales_order.CreateInvoiceFromSalesOrderRequest.new,
    orderv1sales_order.CreateInvoiceFromSalesOrderResponse.new,
  );
}
