import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

part 'product_category_isar.g.dart';

@collection
/// ProductCategory isar entity
class ProductCategoryIsar {
  /// Auto increment id.
  Id id = Isar.autoIncrement;

  /// ProductCategory refId.
  @Index(unique: true)
  String refId;

  /// The name of the category.
  String name;

  /// Constructs a new ProductCategoryIsar.
  ProductCategoryIsar({required this.refId, required this.name});

  /// Converts a proto object to ProductCategoryIsar object.
  factory ProductCategoryIsar.fromProto(ProductCategory p) =>
      ProductCategoryIsar(refId: p.refId, name: p.name);

  /// Converts this object to a proto object.
  ProductCategory toProto() {
    return ProductCategory()
      ..refId = refId
      ..name = name;
  }
}
