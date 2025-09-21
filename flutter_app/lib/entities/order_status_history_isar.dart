import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

part 'order_status_history_isar.g.dart';

@collection
/// Order status history Isar entity for tracking status changes.
class OrderStatusHistoryIsar {
  /// Auto increment id for Isar database
  Id id = Isar.autoIncrement;

  /// The status value (maps to OrderStatus enum)
  int status;

  /// The user who updated the status
  String updatedBy;

  /// The date and time when the status was updated
  DateTime updatedAt;

  /// Constructor
  OrderStatusHistoryIsar({
    required this.status,
    required this.updatedBy,
    required this.updatedAt,
  });

  /// Gets human-readable status description
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

  /// Converts a proto StatusHistory to OrderStatusHistoryIsar object
  factory OrderStatusHistoryIsar.fromProto(StatusHistory proto) {
    return OrderStatusHistoryIsar(
      status: proto.status.value,
      updatedBy: proto.updatedBy,
      updatedAt: proto.updatedAt.toDateTime(),
    );
  }

  /// Converts OrderStatusHistoryIsar to proto StatusHistory
  StatusHistory toProto() {
    return StatusHistory()
      ..status =
          OrderStatus.valueOf(status) ?? OrderStatus.ORDER_STATUS_UNSPECIFIED
      ..updatedBy = updatedBy
      ..updatedAt = Timestamp.fromDateTime(updatedAt);
  }

  @override
  String toString() {
    return 'OrderStatusHistoryIsar('
        'id: $id, '
        'status: $statusDescription, '
        'updatedBy: $updatedBy, '
        'updatedAt: $updatedAt'
        ')';
  }
}
