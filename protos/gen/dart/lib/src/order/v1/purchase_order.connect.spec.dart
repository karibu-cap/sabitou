//
//  Generated code. Do not modify.
//  source: order/v1/purchase_order.proto
//

import "package:connectrpc/connect.dart" as connect;
import "purchase_order.pb.dart" as orderv1purchase_order;

abstract final class PurchaseOrderService {
  /// Fully-qualified name of the PurchaseOrderService service.
  static const name = 'order.v1.PurchaseOrderService';

  /// Create a purchase order to supplier
  static const createPurchaseOrder = connect.Spec(
    '/$name/CreatePurchaseOrder',
    connect.StreamType.unary,
    orderv1purchase_order.CreatePurchaseOrderRequest.new,
    orderv1purchase_order.CreatePurchaseOrderResponse.new,
  );

  /// Get purchase order details
  static const getPurchaseOrder = connect.Spec(
    '/$name/GetPurchaseOrder',
    connect.StreamType.unary,
    orderv1purchase_order.GetPurchaseOrderRequest.new,
    orderv1purchase_order.GetPurchaseOrderResponse.new,
  );

  /// List purchase orders
  static const listPurchaseOrders = connect.Spec(
    '/$name/ListPurchaseOrders',
    connect.StreamType.unary,
    orderv1purchase_order.ListPurchaseOrdersRequest.new,
    orderv1purchase_order.ListPurchaseOrdersResponse.new,
  );

  /// Update purchase order status
  static const updatePurchaseOrderStatus = connect.Spec(
    '/$name/UpdatePurchaseOrderStatus',
    connect.StreamType.unary,
    orderv1purchase_order.UpdatePurchaseOrderStatusRequest.new,
    orderv1purchase_order.UpdatePurchaseOrderStatusResponse.new,
  );

  /// Cancel purchase order
  static const cancelPurchaseOrder = connect.Spec(
    '/$name/CancelPurchaseOrder',
    connect.StreamType.unary,
    orderv1purchase_order.CancelPurchaseOrderRequest.new,
    orderv1purchase_order.CancelPurchaseOrderResponse.new,
  );

  /// Create receiving note when goods arrive
  static const createReceivingNote = connect.Spec(
    '/$name/CreateReceivingNote',
    connect.StreamType.unary,
    orderv1purchase_order.CreateReceivingNoteRequest.new,
    orderv1purchase_order.CreateReceivingNoteResponse.new,
  );
}
