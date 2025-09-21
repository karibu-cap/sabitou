import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

part 'order_item_isar.g.dart';

@collection
/// OrderItem Isar entity for individual order items with queryable fields.
/// This allows efficient querying of products within orders and stock management.
class OrderItemIsar {
  /// Auto increment id for Isar database
  Id id = Isar.autoIncrement;

  /// The unique identifier of the store product
  @Index()
  String storeProductId;

  /// The quantity of the product ordered
  int quantity;

  /// The unit price in XAF of the product at time of order
  int unitPrice;

  /// The name of the product at time of order
  String itemName;

  /// The date and time the order item was created
  DateTime createdAt;

  /// Constructor
  OrderItemIsar({
    required this.storeProductId,
    required this.quantity,
    required this.unitPrice,
    required this.itemName,
    required this.createdAt,
  });

  /// Gets the total price for this item (quantity * unitPrice)
  int get totalPrice => quantity * unitPrice;

  /// Converts a proto OrderItem to OrderItemIsar object
  factory OrderItemIsar.fromProto(OrderItem proto) {
    return OrderItemIsar(
      storeProductId: proto.storeProductId,
      quantity: proto.quantity,
      unitPrice: proto.unitPrice,
      itemName: proto.itemName,
      createdAt: DateTime.now(),
    );
  }

  /// Converts OrderItemIsar to proto OrderItem
  OrderItem toProto() {
    return OrderItem()
      ..storeProductId = storeProductId
      ..quantity = quantity
      ..unitPrice = unitPrice
      ..itemName = itemName;
  }

  /// Checks if this item has sufficient stock available
  /// This method should be used with a StoreProductIsar query
  bool hasSufficientStock(int availableStock) {
    return availableStock >= quantity;
  }

  @override
  String toString() {
    return 'OrderItemIsar('
        'id: $id, '
        'storeProductId: $storeProductId, '
        'quantity: $quantity, '
        'unitPrice: $unitPrice, '
        'itemName: $itemName, '
        'totalPrice: $totalPrice'
        ')';
  }
}
