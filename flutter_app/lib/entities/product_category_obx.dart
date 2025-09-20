import 'package:objectbox/objectbox.dart';
import 'package:sabitou_rpc/models.dart';

@Entity()
/// ProductCategory ObjectBox entity
class ProductCategoryObx {
  @Id()
  /// ObjectBox ID.
  int id = 0;

  @Unique()
  /// ProductCategory refId.
  String refId;

  /// The name of the category.
  String name;

  /// Constructs a new ProductCategoryObx.
  ProductCategoryObx({required this.refId, required this.name});

  /// Converts a proto object to ProductCategoryObx object.
  factory ProductCategoryObx.fromProto(ProductCategory p) =>
      ProductCategoryObx(refId: p.refId, name: p.name);

  /// Converts this object to a proto object.
  ProductCategory toProto() {
    return ProductCategory()
      ..refId = refId
      ..name = name;
  }
}
