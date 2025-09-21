import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

part 'store_product_isar.g.dart';

@collection
/// StoreProduct Isar entity
class StoreProductIsar {
  /// Auto increment id.
  Id id = Isar.autoIncrement;

  /// StoreProduct refId
  @Index(unique: true)
  String refId;

  /// Store ID
  @Index()
  String storeId;

  /// GlobalProduct ID
  @Index()
  String globalProductId;

  /// Price
  int? price;

  /// Stock quantity
  int stockQuantity;

  /// Minimum stock threshold
  int minStockThreshold;

  /// Supplier ID
  String? supplierId;

  /// Media ids of the images of the product
  List<String>? imagesLinksIds;

  /// Inbound date
  DateTime? inboundDate;

  /// Expiration date
  DateTime? expirationDate;

  /// Created at
  DateTime? createdAt;

  /// Updated at
  DateTime? updatedAt;

  /// Constructs a new StoreProductIsar.
  StoreProductIsar({
    required this.refId,
    required this.storeId,
    required this.globalProductId,
    required this.stockQuantity,
    required this.minStockThreshold,
    this.price,
    this.imagesLinksIds,
    this.supplierId,
    this.inboundDate,
    this.expirationDate,
    this.createdAt,
    this.updatedAt,
  });

  /// Converts a proto object to StoreProductIsar object
  factory StoreProductIsar.fromProto(StoreProduct p) => StoreProductIsar(
    refId: p.refId,
    storeId: p.storeId,
    globalProductId: p.globalProductId,
    price: p.hasPrice() ? p.price : null,
    imagesLinksIds: p.imagesLinksIds,
    stockQuantity: p.stockQuantity,
    minStockThreshold: p.minStockThreshold,
    supplierId: p.hasSupplierId() ? p.supplierId : null,
    inboundDate: p.hasInboundDate() ? p.inboundDate.toDateTime() : null,
    expirationDate: p.hasExpirationDate()
        ? p.expirationDate.toDateTime()
        : null,
    createdAt: p.hasCreatedAt() ? p.createdAt.toDateTime() : null,
    updatedAt: p.hasUpdatedAt() ? p.updatedAt.toDateTime() : null,
  );

  /// Converts this object to a proto object
  StoreProduct toProto() => StoreProduct()
    ..refId = refId
    ..storeId = storeId
    ..globalProductId = globalProductId
    ..price = price ?? 0
    ..stockQuantity = stockQuantity
    ..minStockThreshold = minStockThreshold
    ..supplierId = supplierId ?? ''
    ..imagesLinksIds.addAll(imagesLinksIds ?? [])
    ..inboundDate = inboundDate != null
        ? Timestamp.fromDateTime(inboundDate ?? DateTime.now())
        : Timestamp.fromDateTime(DateTime.now())
    ..expirationDate = expirationDate != null
        ? Timestamp.fromDateTime(expirationDate ?? DateTime.now())
        : Timestamp.fromDateTime(DateTime.now())
    ..createdAt = createdAt != null
        ? Timestamp.fromDateTime(createdAt ?? DateTime.now())
        : Timestamp.fromDateTime(DateTime.now())
    ..updatedAt = updatedAt != null
        ? Timestamp.fromDateTime(updatedAt ?? DateTime.now())
        : Timestamp.fromDateTime(DateTime.now());
}
