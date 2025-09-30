//
//  Generated code. Do not modify.
//  source: order/v1/purchase_order.proto
//

import "package:connectrpc/connect.dart" as connect;
import "purchase_order.pb.dart" as orderv1purchase_order;
import "purchase_order.connect.spec.dart" as specs;

extension type PurchaseOrderServiceClient (connect.Transport _transport) {
  /// Create a purchase order to supplier
  Future<orderv1purchase_order.CreatePurchaseOrderResponse> createPurchaseOrder(
    orderv1purchase_order.CreatePurchaseOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PurchaseOrderService.createPurchaseOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get purchase order details
  Future<orderv1purchase_order.GetPurchaseOrderResponse> getPurchaseOrder(
    orderv1purchase_order.GetPurchaseOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PurchaseOrderService.getPurchaseOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// List purchase orders
  Future<orderv1purchase_order.ListPurchaseOrdersResponse> listPurchaseOrders(
    orderv1purchase_order.ListPurchaseOrdersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PurchaseOrderService.listPurchaseOrders,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Update purchase order status
  Future<orderv1purchase_order.UpdatePurchaseOrderStatusResponse> updatePurchaseOrderStatus(
    orderv1purchase_order.UpdatePurchaseOrderStatusRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PurchaseOrderService.updatePurchaseOrderStatus,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Cancel purchase order
  Future<orderv1purchase_order.CancelPurchaseOrderResponse> cancelPurchaseOrder(
    orderv1purchase_order.CancelPurchaseOrderRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PurchaseOrderService.cancelPurchaseOrder,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Create receiving note when goods arrive
  Future<orderv1purchase_order.CreateReceivingNoteResponse> createReceivingNote(
    orderv1purchase_order.CreateReceivingNoteRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PurchaseOrderService.createReceivingNote,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get suggested purchase orders (low stock items)
  Future<orderv1purchase_order.GetSuggestedPurchaseOrdersResponse> getSuggestedPurchaseOrders(
    orderv1purchase_order.GetSuggestedPurchaseOrdersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PurchaseOrderService.getSuggestedPurchaseOrders,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
