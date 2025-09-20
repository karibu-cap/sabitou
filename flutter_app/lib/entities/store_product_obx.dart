import 'package:objectbox/objectbox.dart';
import 'package:sabitou_rpc/models.dart';

@Entity()
/// StoreProduct ObjectBox entity
class StoreProductObx {
  @Id()
  /// ObjectBox ID
  int id = 0;

  @Unique()
  /// StoreProduct refId
  String refId;

  /// Store ID
  String storeId;

  /// GlobalProduct ID
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
  Timestamp? inboundDate;

  /// Expiration date
  Timestamp? expirationDate;

  /// Created at
  Timestamp? createdAt;

  /// Updated at
  Timestamp? updatedAt;

  /// Constructs a new StoreProductObx.
  StoreProductObx({
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

  /// Converts a proto object to StoreProductObx object.
  factory StoreProductObx.fromProto(StoreProduct p) => StoreProductObx(
    refId: p.refId,
    storeId: p.storeId,
    globalProductId: p.globalProductId,
    price: p.hasPrice() ? p.price : null,
    imagesLinksIds: p.imagesLinksIds,
    stockQuantity: p.stockQuantity,
    minStockThreshold: p.minStockThreshold,
    supplierId: p.hasSupplierId() ? p.supplierId : null,
    inboundDate: p.hasInboundDate() ? p.inboundDate : null,
    expirationDate: p.hasExpirationDate() ? p.expirationDate : null,
    createdAt: p.hasCreatedAt() ? p.createdAt : null,
    updatedAt: p.hasUpdatedAt() ? p.updatedAt : null,
  );

  /// Converts this object to a proto object.
  StoreProduct toProto() => StoreProduct()
    ..refId = refId
    ..storeId = storeId
    ..globalProductId = globalProductId
    ..price = price ?? 0
    ..inboundDate = inboundDate ?? Timestamp()
    ..expirationDate = expirationDate ?? Timestamp()
    ..createdAt = createdAt ?? Timestamp()
    ..updatedAt = updatedAt ?? Timestamp()
    ..imagesLinksIds.addAll(imagesLinksIds ?? [])
    ..stockQuantity = stockQuantity
    ..minStockThreshold = minStockThreshold
    ..supplierId = supplierId ?? '';
}
