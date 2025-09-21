import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

import 'order_item_isar.dart';
import 'order_status_history_isar.dart';

part 'order_isar.g.dart';

@collection
/// Order Isar entity for local order storage and synchronization.
class OrderIsar {
  /// Auto increment id for Isar database
  Id id = Isar.autoIncrement;

  /// The unique identifier of the order
  @Index(unique: true)
  String refId;

  /// The id of the client or the supplier if available
  String? fromId;

  /// Whether the order is from the client or the supplier
  String isClientOrder;

  /// The list of items in the order (relation to OrderItemIsar)
  /// This allows efficient querying of order items
  IsarLinks<OrderItemIsar> orderItems = IsarLinks<OrderItemIsar>();

  /// The status history (relation to OrderStatusHistoryIsar)
  /// This allows efficient querying of status changes
  IsarLinks<OrderStatusHistoryIsar> statusHistory =
      IsarLinks<OrderStatusHistoryIsar>();

  /// The total price of the order in XAF
  int totalPrice;

  /// The status of the order
  /// Maps to OrderStatus enum values:
  /// - 0: UNSPECIFIED
  /// - 1: PENDING
  /// - 2: PROCESSING
  /// - 3: COMPLETED
  /// - 4: CANCELLED
  @Index()
  int status;

  /// The date and time the order was created
  DateTime createdAt;

  /// The date and time the order was last updated
  DateTime? updatedAt;

  /// The unique identifier of the store associated with the order
  @Index()
  String storeId;

  /// The unique identifier of the user who initiated the order
  String initiatedBy;

  /// Constructs a new OrderIsar
  OrderIsar({
    required this.refId,
    this.fromId,
    required this.isClientOrder,
    required this.totalPrice,
    required this.status,
    required this.createdAt,
    this.updatedAt,
    required this.storeId,
    required this.initiatedBy,
  });

  /// Gets a human-readable description of the order status
  String get statusDescription {
    switch (status) {
      case 0:
        return 'Unspecified';
      case 1:
        return 'Pending';
      case 2:
        return 'Processing';
      case 3:
        return 'Completed';
      case 4:
        return 'Cancelled';
      default:
        return 'Unknown';
    }
  }

  /// Gets the number of items in the order
  int get itemCount => orderItems.length;

  /// Checks if the order is completed
  bool get isCompleted => status == 3;

  /// Checks if the order is cancelled
  bool get isCancelled => status == 4;

  /// Checks if the order can be modified
  bool get canBeModified => status == 1; // Only pending orders can be modified

  /// Converts a proto Order to OrderIsar object
  factory OrderIsar.fromProto(Order proto) {
    final order = OrderIsar(
      refId: proto.hasRefId() ? proto.refId : '',
      fromId: proto.hasFromId() ? proto.fromId : null,
      isClientOrder: proto.isClientOrder,
      totalPrice: proto.totalPrice,
      status: proto.status.value,
      createdAt: proto.hasCreatedAt()
          ? proto.createdAt.toDateTime()
          : DateTime.now(),
      updatedAt: proto.hasUpdatedAt() ? proto.updatedAt.toDateTime() : null,
      storeId: proto.storeId,
      initiatedBy: proto.initiatedBy,
    );

    // Add order items using Isar relations
    order.orderItems.addAll(proto.orderItems.map(OrderItemIsar.fromProto));

    // Add status history using Isar relations
    order.statusHistory.addAll(
      proto.statusHistory.map(OrderStatusHistoryIsar.fromProto),
    );

    return order;
  }

  /// Converts this Isar object to a proto Order
  Order toProto() {
    return Order()
      ..refId = refId
      ..fromId = fromId ?? ''
      ..isClientOrder = isClientOrder
      ..totalPrice = totalPrice
      ..status =
          OrderStatus.valueOf(status) ?? OrderStatus.ORDER_STATUS_UNSPECIFIED
      ..orderItems.addAll(orderItems.map((item) => item.toProto()))
      ..statusHistory.addAll(statusHistory.map((history) => history.toProto()))
      ..createdAt = Timestamp.fromDateTime(createdAt)
      ..updatedAt = updatedAt != null
          ? Timestamp.fromDateTime(updatedAt ?? DateTime.now())
          : Timestamp.fromDateTime(DateTime.now())
      ..storeId = storeId
      ..initiatedBy = initiatedBy;
  }

  /// Creates a copy of this order with updated status
  OrderIsar copyWithStatus(int newStatus, String updatedBy) {
    final now = DateTime.now();

    // Create new status history entry
    final newStatusHistoryEntry = OrderStatusHistoryIsar(
      status: newStatus,
      updatedBy: updatedBy,
      updatedAt: now,
    );

    final newOrder = OrderIsar(
      refId: refId,
      fromId: fromId,
      isClientOrder: isClientOrder,
      totalPrice: totalPrice,
      status: newStatus,
      createdAt: createdAt,
      updatedAt: now,
      storeId: storeId,
      initiatedBy: initiatedBy,
    );

    // Copy existing order items and status history
    newOrder.orderItems.addAll(
      orderItems.map((e) => OrderItemIsar.fromProto(e.toProto())),
    );
    newOrder.statusHistory.addAll(
      statusHistory.map((e) => OrderStatusHistoryIsar.fromProto(e.toProto())),
    );

    // Add new status history entry
    newOrder.statusHistory.add(newStatusHistoryEntry);

    return newOrder;
  }

  @override
  String toString() {
    return 'OrderIsar('
        'id: $id, '
        'refId: $refId, '
        'storeId: $storeId, '
        'status: $statusDescription, '
        'totalPrice: $totalPrice, '
        'itemCount: $itemCount'
        ')';
  }
}
