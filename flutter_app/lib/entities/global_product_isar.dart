import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

import 'product_category_isar.dart';

part 'global_product_isar.g.dart';

@collection
/// GlobalProduct isar entity
class GlobalProductIsar {
  /// Auto increment id.
  Id id = Isar.autoIncrement;

  /// GlobalProduct refId.
  @Index(unique: true)
  String refId;

  /// The name of the product.
  String name;

  /// The description of the product.
  String? description;

  /// Bar code value.
  String? barCodeValue;

  /// Media ids of the images of the product.
  List<String>? imagesLinksIds;

  /// The ids of the categories of the product.
  IsarLinks<ProductCategoryIsar> categories = IsarLinks<ProductCategoryIsar>();

  /// Constructs a new GlobalProductObx.
  GlobalProductIsar({
    required this.refId,
    required this.name,
    required this.description,
    this.barCodeValue,
    this.imagesLinksIds,
  });

  /// Converts a proto object to GlobalProductObx object.
  factory GlobalProductIsar.fromProto(GlobalProduct p) {
    final gp = GlobalProductIsar(
      refId: p.refId,
      name: p.name,
      description: p.description,
      barCodeValue: p.barCodeValue,
      imagesLinksIds: p.imagesLinksIds,
    );
    gp.categories.addAll(p.categories.map(ProductCategoryIsar.fromProto));

    return gp;
  }

  /// Converts this object to a proto object.
  GlobalProduct toProto() => GlobalProduct()
    ..refId = refId
    ..name = name
    ..description = description ?? ''
    ..barCodeValue = barCodeValue ?? ''
    ..categories.addAll(categories.map((e) => e.toProto()))
    ..imagesLinksIds.addAll(imagesLinksIds ?? []);
}
