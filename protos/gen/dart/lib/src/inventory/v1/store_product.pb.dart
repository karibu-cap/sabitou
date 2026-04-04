// This is a generated file - do not edit.
//
// Generated from inventory/v1/store_product.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $1;
import 'category.pb.dart' as $0;
import 'store_product.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'store_product.pbenum.dart';

class GlobalProduct extends $pb.GeneratedMessage {
  factory GlobalProduct({
    $core.String? refId,
    $0.Internationalized? name,
    $0.Internationalized? description,
    $core.String? barCodeValue,
    $core.Iterable<$0.Category>? categories,
    $core.Iterable<$core.String>? imagesLinksIds,
    GlobalProductStatus? status,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (barCodeValue != null) result.barCodeValue = barCodeValue;
    if (categories != null) result.categories.addAll(categories);
    if (imagesLinksIds != null) result.imagesLinksIds.addAll(imagesLinksIds);
    if (status != null) result.status = status;
    return result;
  }

  GlobalProduct._();

  factory GlobalProduct.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GlobalProduct.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GlobalProduct',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOM<$0.Internationalized>(2, _omitFieldNames ? '' : 'name',
        subBuilder: $0.Internationalized.create)
    ..aOM<$0.Internationalized>(3, _omitFieldNames ? '' : 'description',
        subBuilder: $0.Internationalized.create)
    ..aOS(4, _omitFieldNames ? '' : 'barCodeValue')
    ..pc<$0.Category>(
        5, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM,
        subBuilder: $0.Category.create)
    ..pPS(6, _omitFieldNames ? '' : 'imagesLinksIds')
    ..e<GlobalProductStatus>(
        7, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: GlobalProductStatus.GLOBAL_PRODUCT_STATUS_UNSPECIFIED,
        valueOf: GlobalProductStatus.valueOf,
        enumValues: GlobalProductStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GlobalProduct clone() => GlobalProduct()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GlobalProduct copyWith(void Function(GlobalProduct) updates) =>
      super.copyWith((message) => updates(message as GlobalProduct))
          as GlobalProduct;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GlobalProduct create() => GlobalProduct._();
  @$core.override
  GlobalProduct createEmptyInstance() => create();
  static $pb.PbList<GlobalProduct> createRepeated() =>
      $pb.PbList<GlobalProduct>();
  @$core.pragma('dart2js:noInline')
  static GlobalProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GlobalProduct>(create);
  static GlobalProduct? _defaultInstance;

  /// The unique identifier of the product.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the product.
  @$pb.TagNumber(2)
  $0.Internationalized get name => $_getN(1);
  @$pb.TagNumber(2)
  set name($0.Internationalized value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Internationalized ensureName() => $_ensure(1);

  /// The description of the product.
  @$pb.TagNumber(3)
  $0.Internationalized get description => $_getN(2);
  @$pb.TagNumber(3)
  set description($0.Internationalized value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Internationalized ensureDescription() => $_ensure(2);

  /// The bar code value of the product.
  @$pb.TagNumber(4)
  $core.String get barCodeValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set barCodeValue($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBarCodeValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBarCodeValue() => $_clearField(4);

  /// The product categories of the product.
  @$pb.TagNumber(5)
  $pb.PbList<$0.Category> get categories => $_getList(4);

  /// The list of image related to the product.
  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get imagesLinksIds => $_getList(5);

  /// The status of the product.
  @$pb.TagNumber(7)
  GlobalProductStatus get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(GlobalProductStatus value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);
}

class StoreProduct extends $pb.GeneratedMessage {
  factory StoreProduct({
    $core.String? refId,
    $core.String? storeId,
    $core.String? globalProductId,
    $core.int? salePrice,
    $core.Iterable<$core.String>? imagesLinksIds,
    ProductStatus? status,
    $core.String? sku,
    ExpirationType? expirationType,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
    $core.int? reorderPoint,
    $core.int? openingStock,
    $core.double? openingStockPerUnit,
    $core.double? defaultPurchasePrice,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (storeId != null) result.storeId = storeId;
    if (globalProductId != null) result.globalProductId = globalProductId;
    if (salePrice != null) result.salePrice = salePrice;
    if (imagesLinksIds != null) result.imagesLinksIds.addAll(imagesLinksIds);
    if (status != null) result.status = status;
    if (sku != null) result.sku = sku;
    if (expirationType != null) result.expirationType = expirationType;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (reorderPoint != null) result.reorderPoint = reorderPoint;
    if (openingStock != null) result.openingStock = openingStock;
    if (openingStockPerUnit != null)
      result.openingStockPerUnit = openingStockPerUnit;
    if (defaultPurchasePrice != null)
      result.defaultPurchasePrice = defaultPurchasePrice;
    return result;
  }

  StoreProduct._();

  factory StoreProduct.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreProduct.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreProduct',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOS(3, _omitFieldNames ? '' : 'globalProductId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'salePrice', $pb.PbFieldType.O3)
    ..pPS(5, _omitFieldNames ? '' : 'imagesLinksIds')
    ..e<ProductStatus>(6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ProductStatus.PRODUCT_STATUS_UNSPECIFIED,
        valueOf: ProductStatus.valueOf,
        enumValues: ProductStatus.values)
    ..aOS(7, _omitFieldNames ? '' : 'sku')
    ..e<ExpirationType>(
        8, _omitFieldNames ? '' : 'expirationType', $pb.PbFieldType.OE,
        defaultOrMaker: ExpirationType.EXPIRATION_TYPE_UNSPECIFIED,
        valueOf: ExpirationType.valueOf,
        enumValues: ExpirationType.values)
    ..aOM<$1.Timestamp>(9, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $1.Timestamp.create)
    ..a<$core.int>(
        11, _omitFieldNames ? '' : 'reorderPoint', $pb.PbFieldType.O3)
    ..a<$core.int>(
        12, _omitFieldNames ? '' : 'openingStock', $pb.PbFieldType.O3)
    ..a<$core.double>(
        13, _omitFieldNames ? '' : 'openingStockPerUnit', $pb.PbFieldType.OD)
    ..a<$core.double>(
        14, _omitFieldNames ? '' : 'defaultPurchasePrice', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreProduct clone() => StoreProduct()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreProduct copyWith(void Function(StoreProduct) updates) =>
      super.copyWith((message) => updates(message as StoreProduct))
          as StoreProduct;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreProduct create() => StoreProduct._();
  @$core.override
  StoreProduct createEmptyInstance() => create();
  static $pb.PbList<StoreProduct> createRepeated() =>
      $pb.PbList<StoreProduct>();
  @$core.pragma('dart2js:noInline')
  static StoreProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreProduct>(create);
  static StoreProduct? _defaultInstance;

  /// The unique identifier of the business product.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The unique identifier of the store.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// The unique identifier of the global product.
  @$pb.TagNumber(3)
  $core.String get globalProductId => $_getSZ(2);
  @$pb.TagNumber(3)
  set globalProductId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGlobalProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGlobalProductId() => $_clearField(3);

  /// The sale price in XAF of the product.
  /// The currency is determined by the business.
  @$pb.TagNumber(4)
  $core.int get salePrice => $_getIZ(3);
  @$pb.TagNumber(4)
  set salePrice($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSalePrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearSalePrice() => $_clearField(4);

  /// The media ids of the images of the product.
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get imagesLinksIds => $_getList(4);

  /// The status of the product.
  @$pb.TagNumber(6)
  ProductStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(ProductStatus value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  /// The stock keeping unit.
  @$pb.TagNumber(7)
  $core.String get sku => $_getSZ(6);
  @$pb.TagNumber(7)
  set sku($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSku() => $_has(6);
  @$pb.TagNumber(7)
  void clearSku() => $_clearField(7);

  /// The type of expiration of the product.
  @$pb.TagNumber(8)
  ExpirationType get expirationType => $_getN(7);
  @$pb.TagNumber(8)
  set expirationType(ExpirationType value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasExpirationType() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpirationType() => $_clearField(8);

  /// The creation date of the product.
  @$pb.TagNumber(9)
  $1.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($1.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $1.Timestamp ensureCreatedAt() => $_ensure(8);

  /// The last update date of the product.
  @$pb.TagNumber(10)
  $1.Timestamp get updatedAt => $_getN(9);
  @$pb.TagNumber(10)
  set updatedAt($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureUpdatedAt() => $_ensure(9);

  /// The reorder point.
  @$pb.TagNumber(11)
  $core.int get reorderPoint => $_getIZ(10);
  @$pb.TagNumber(11)
  set reorderPoint($core.int value) => $_setSignedInt32(10, value);
  @$pb.TagNumber(11)
  $core.bool hasReorderPoint() => $_has(10);
  @$pb.TagNumber(11)
  void clearReorderPoint() => $_clearField(11);

  /// The open stock.
  @$pb.TagNumber(12)
  $core.int get openingStock => $_getIZ(11);
  @$pb.TagNumber(12)
  set openingStock($core.int value) => $_setSignedInt32(11, value);
  @$pb.TagNumber(12)
  $core.bool hasOpeningStock() => $_has(11);
  @$pb.TagNumber(12)
  void clearOpeningStock() => $_clearField(12);

  /// The open stock per unit.
  /// How much per unit the product is cost during the creation.
  @$pb.TagNumber(13)
  $core.double get openingStockPerUnit => $_getN(12);
  @$pb.TagNumber(13)
  set openingStockPerUnit($core.double value) => $_setDouble(12, value);
  @$pb.TagNumber(13)
  $core.bool hasOpeningStockPerUnit() => $_has(12);
  @$pb.TagNumber(13)
  void clearOpeningStockPerUnit() => $_clearField(13);

  /// The default purchase price.
  @$pb.TagNumber(14)
  $core.double get defaultPurchasePrice => $_getN(13);
  @$pb.TagNumber(14)
  set defaultPurchasePrice($core.double value) => $_setDouble(13, value);
  @$pb.TagNumber(14)
  $core.bool hasDefaultPurchasePrice() => $_has(13);
  @$pb.TagNumber(14)
  void clearDefaultPurchasePrice() => $_clearField(14);
}

class CustomProduct extends $pb.GeneratedMessage {
  factory CustomProduct({
    StoreProduct? storeProduct,
    GlobalProduct? globalProduct,
  }) {
    final result = create();
    if (storeProduct != null) result.storeProduct = storeProduct;
    if (globalProduct != null) result.globalProduct = globalProduct;
    return result;
  }

  CustomProduct._();

  factory CustomProduct.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CustomProduct.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CustomProduct',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<StoreProduct>(1, _omitFieldNames ? '' : 'storeProduct',
        subBuilder: StoreProduct.create)
    ..aOM<GlobalProduct>(2, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomProduct clone() => CustomProduct()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CustomProduct copyWith(void Function(CustomProduct) updates) =>
      super.copyWith((message) => updates(message as CustomProduct))
          as CustomProduct;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CustomProduct create() => CustomProduct._();
  @$core.override
  CustomProduct createEmptyInstance() => create();
  static $pb.PbList<CustomProduct> createRepeated() =>
      $pb.PbList<CustomProduct>();
  @$core.pragma('dart2js:noInline')
  static CustomProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CustomProduct>(create);
  static CustomProduct? _defaultInstance;

  /// The store product.
  @$pb.TagNumber(1)
  StoreProduct get storeProduct => $_getN(0);
  @$pb.TagNumber(1)
  set storeProduct(StoreProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreProduct ensureStoreProduct() => $_ensure(0);

  /// The global product.
  @$pb.TagNumber(2)
  GlobalProduct get globalProduct => $_getN(1);
  @$pb.TagNumber(2)
  set globalProduct(GlobalProduct value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasGlobalProduct() => $_has(1);
  @$pb.TagNumber(2)
  void clearGlobalProduct() => $_clearField(2);
  @$pb.TagNumber(2)
  GlobalProduct ensureGlobalProduct() => $_ensure(1);
}

class DeleteGlobalProductRequest extends $pb.GeneratedMessage {
  factory DeleteGlobalProductRequest({
    $core.String? globalProductId,
  }) {
    final result = create();
    if (globalProductId != null) result.globalProductId = globalProductId;
    return result;
  }

  DeleteGlobalProductRequest._();

  factory DeleteGlobalProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteGlobalProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteGlobalProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'globalProductId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalProductRequest clone() =>
      DeleteGlobalProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalProductRequest copyWith(
          void Function(DeleteGlobalProductRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteGlobalProductRequest))
          as DeleteGlobalProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGlobalProductRequest create() => DeleteGlobalProductRequest._();
  @$core.override
  DeleteGlobalProductRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteGlobalProductRequest> createRepeated() =>
      $pb.PbList<DeleteGlobalProductRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteGlobalProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteGlobalProductRequest>(create);
  static DeleteGlobalProductRequest? _defaultInstance;

  /// The unique identifier of the global product.
  @$pb.TagNumber(1)
  $core.String get globalProductId => $_getSZ(0);
  @$pb.TagNumber(1)
  set globalProductId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGlobalProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGlobalProductId() => $_clearField(1);
}

class DeleteGlobalProductResponse extends $pb.GeneratedMessage {
  factory DeleteGlobalProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteGlobalProductResponse._();

  factory DeleteGlobalProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteGlobalProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteGlobalProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalProductResponse clone() =>
      DeleteGlobalProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteGlobalProductResponse copyWith(
          void Function(DeleteGlobalProductResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteGlobalProductResponse))
          as DeleteGlobalProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteGlobalProductResponse create() =>
      DeleteGlobalProductResponse._();
  @$core.override
  DeleteGlobalProductResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteGlobalProductResponse> createRepeated() =>
      $pb.PbList<DeleteGlobalProductResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteGlobalProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteGlobalProductResponse>(create);
  static DeleteGlobalProductResponse? _defaultInstance;

  /// Whether the global product was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class DeleteStoreProductRequest extends $pb.GeneratedMessage {
  factory DeleteStoreProductRequest({
    $core.String? storeProductId,
  }) {
    final result = create();
    if (storeProductId != null) result.storeProductId = storeProductId;
    return result;
  }

  DeleteStoreProductRequest._();

  factory DeleteStoreProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStoreProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStoreProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeProductId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreProductRequest clone() =>
      DeleteStoreProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreProductRequest copyWith(
          void Function(DeleteStoreProductRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteStoreProductRequest))
          as DeleteStoreProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreProductRequest create() => DeleteStoreProductRequest._();
  @$core.override
  DeleteStoreProductRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreProductRequest> createRepeated() =>
      $pb.PbList<DeleteStoreProductRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStoreProductRequest>(create);
  static DeleteStoreProductRequest? _defaultInstance;

  /// The unique identifier of the store product.
  @$pb.TagNumber(1)
  $core.String get storeProductId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeProductId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreProductId() => $_clearField(1);
}

class DeleteStoreProductResponse extends $pb.GeneratedMessage {
  factory DeleteStoreProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteStoreProductResponse._();

  factory DeleteStoreProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStoreProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStoreProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreProductResponse clone() =>
      DeleteStoreProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreProductResponse copyWith(
          void Function(DeleteStoreProductResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteStoreProductResponse))
          as DeleteStoreProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreProductResponse create() => DeleteStoreProductResponse._();
  @$core.override
  DeleteStoreProductResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreProductResponse> createRepeated() =>
      $pb.PbList<DeleteStoreProductResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStoreProductResponse>(create);
  static DeleteStoreProductResponse? _defaultInstance;

  /// Whether the store product was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class StoreProductServiceApi {
  final $pb.RpcClient _client;

  StoreProductServiceApi(this._client);

  /// Deletes a global product.
  $async.Future<DeleteGlobalProductResponse> deleteGlobalProduct(
          $pb.ClientContext? ctx, DeleteGlobalProductRequest request) =>
      _client.invoke<DeleteGlobalProductResponse>(ctx, 'StoreProductService',
          'DeleteGlobalProduct', request, DeleteGlobalProductResponse());

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  $async.Future<DeleteStoreProductResponse> deleteStoreProduct(
          $pb.ClientContext? ctx, DeleteStoreProductRequest request) =>
      _client.invoke<DeleteStoreProductResponse>(ctx, 'StoreProductService',
          'DeleteStoreProduct', request, DeleteStoreProductResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
