import 'package:sabitou_rpc/sabitou_rpc.dart';

/// Alert model.
class Alert {
  /// Constructs a new [Alert].
  Alert({
    required this.id,
    required this.type,
    required this.message,
    required this.severity,
    this.productId,
    required this.createdAtInUtc,
    required this.read,
  });

  /// The ID of the alert.
  final String id;

  /// The type of the alert.
  final AlertType type;

  /// The message of the alert.
  final String message;

  /// The severity of the alert.
  final SeverityType severity;

  /// The ID of the product associated with the alert.
  final String? productId;

  /// The date and time when the alert was created.
  final DateTime createdAtInUtc;

  /// Whether the alert has been read.
  final bool read;
}

/// Alert type.
enum AlertType {
  /// Low stock alert.
  lowstock,

  /// Expiry alert.
  expiry,

  /// Backup alert.
  backup,
}

/// Alert severity.
enum SeverityType {
  /// Low severity.
  low,

  /// Medium severity.
  medium,

  /// High severity.
  high,
}

/// Product model.
final class Product {
  /// The business product.
  BusinessProduct businessProduct;

  /// The global product.
  GlobalProduct globalProduct;

  /// Constructs a new [Product].
  Product({required this.businessProduct, required this.globalProduct});
}
