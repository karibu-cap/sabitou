import 'package:objectbox/objectbox.dart';
import 'package:sabitou_rpc/models.dart';

@Entity()
/// GlobalProduct ObjectBox entity
class GlobalProductObx {
  @Id()
  /// ObjectBox ID.
  int id = 0;

  @Unique()
  /// GlobalProduct refId.
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
  List<String>? categoriesIds;

  /// Constructs a new GlobalProductObx.
  GlobalProductObx({
    required this.refId,
    required this.name,
    required this.description,
    this.barCodeValue,
    this.imagesLinksIds,
    this.categoriesIds,
  });

  /// Converts a proto object to GlobalProductObx object.
  factory GlobalProductObx.fromProto(GlobalProduct p) => GlobalProductObx(
    refId: p.refId,
    name: p.name,
    description: p.description,
    barCodeValue: p.barCodeValue,
    imagesLinksIds: p.imagesLinksIds,
    categoriesIds: p.categories.map((c) => c.refId).toList(),
  );

  /// Converts this object to a proto object.
  GlobalProduct toProto() {
    final pbCats = (categoriesIds ?? [])
        .map((categoriesId) => ProductCategory()..refId = categoriesId)
        .toList();

    return GlobalProduct()
      ..refId = refId
      ..name = name
      ..description = description ?? ''
      ..barCodeValue = barCodeValue ?? ''
      ..categories.addAll(pbCats)
      ..imagesLinksIds.addAll(imagesLinksIds ?? []);
  }
}
