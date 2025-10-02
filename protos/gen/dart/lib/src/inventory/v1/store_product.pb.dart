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
    $core.String? supplierId,
    ProductStatus? status,
    $core.String? sku,
    ExpirationType? expirationType,
    $1.Timestamp? createdAt,
    $1.Timestamp? updatedAt,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (storeId != null) result.storeId = storeId;
    if (globalProductId != null) result.globalProductId = globalProductId;
    if (salePrice != null) result.salePrice = salePrice;
    if (imagesLinksIds != null) result.imagesLinksIds.addAll(imagesLinksIds);
    if (supplierId != null) result.supplierId = supplierId;
    if (status != null) result.status = status;
    if (sku != null) result.sku = sku;
    if (expirationType != null) result.expirationType = expirationType;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
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
    ..aOS(6, _omitFieldNames ? '' : 'supplierId')
    ..e<ProductStatus>(7, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ProductStatus.PRODUCT_STATUS_UNSPECIFIED,
        valueOf: ProductStatus.valueOf,
        enumValues: ProductStatus.values)
    ..aOS(8, _omitFieldNames ? '' : 'sku')
    ..e<ExpirationType>(
        9, _omitFieldNames ? '' : 'expirationType', $pb.PbFieldType.OE,
        defaultOrMaker: ExpirationType.EXPIRATION_TYPE_UNSPECIFIED,
        valueOf: ExpirationType.valueOf,
        enumValues: ExpirationType.values)
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $1.Timestamp.create)
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

  /// The supplier.
  @$pb.TagNumber(6)
  $core.String get supplierId => $_getSZ(5);
  @$pb.TagNumber(6)
  set supplierId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSupplierId() => $_has(5);
  @$pb.TagNumber(6)
  void clearSupplierId() => $_clearField(6);

  /// The status of the product.
  @$pb.TagNumber(7)
  ProductStatus get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(ProductStatus value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  /// The stock keeping unit.
  @$pb.TagNumber(8)
  $core.String get sku => $_getSZ(7);
  @$pb.TagNumber(8)
  set sku($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSku() => $_has(7);
  @$pb.TagNumber(8)
  void clearSku() => $_clearField(8);

  /// The type of expiration of the product.
  @$pb.TagNumber(9)
  ExpirationType get expirationType => $_getN(8);
  @$pb.TagNumber(9)
  set expirationType(ExpirationType value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasExpirationType() => $_has(8);
  @$pb.TagNumber(9)
  void clearExpirationType() => $_clearField(9);

  /// The creation date of the product.
  @$pb.TagNumber(10)
  $1.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureCreatedAt() => $_ensure(9);

  /// The last update date of the product.
  @$pb.TagNumber(11)
  $1.Timestamp get updatedAt => $_getN(10);
  @$pb.TagNumber(11)
  set updatedAt($1.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdatedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureUpdatedAt() => $_ensure(10);
}

class CreateGlobalProductRequest extends $pb.GeneratedMessage {
  factory CreateGlobalProductRequest({
    GlobalProduct? globalProduct,
  }) {
    final result = create();
    if (globalProduct != null) result.globalProduct = globalProduct;
    return result;
  }

  CreateGlobalProductRequest._();

  factory CreateGlobalProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateGlobalProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateGlobalProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<GlobalProduct>(1, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalProductRequest clone() =>
      CreateGlobalProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalProductRequest copyWith(
          void Function(CreateGlobalProductRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateGlobalProductRequest))
          as CreateGlobalProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGlobalProductRequest create() => CreateGlobalProductRequest._();
  @$core.override
  CreateGlobalProductRequest createEmptyInstance() => create();
  static $pb.PbList<CreateGlobalProductRequest> createRepeated() =>
      $pb.PbList<CreateGlobalProductRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateGlobalProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateGlobalProductRequest>(create);
  static CreateGlobalProductRequest? _defaultInstance;

  /// The global product to add.
  @$pb.TagNumber(1)
  GlobalProduct get globalProduct => $_getN(0);
  @$pb.TagNumber(1)
  set globalProduct(GlobalProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGlobalProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearGlobalProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  GlobalProduct ensureGlobalProduct() => $_ensure(0);
}

class CreateGlobalProductResponse extends $pb.GeneratedMessage {
  factory CreateGlobalProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  CreateGlobalProductResponse._();

  factory CreateGlobalProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateGlobalProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateGlobalProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalProductResponse clone() =>
      CreateGlobalProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateGlobalProductResponse copyWith(
          void Function(CreateGlobalProductResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateGlobalProductResponse))
          as CreateGlobalProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateGlobalProductResponse create() =>
      CreateGlobalProductResponse._();
  @$core.override
  CreateGlobalProductResponse createEmptyInstance() => create();
  static $pb.PbList<CreateGlobalProductResponse> createRepeated() =>
      $pb.PbList<CreateGlobalProductResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateGlobalProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateGlobalProductResponse>(create);
  static CreateGlobalProductResponse? _defaultInstance;

  /// Whether the global product was successfully added.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UpdateGlobalProductRequest extends $pb.GeneratedMessage {
  factory UpdateGlobalProductRequest({
    $core.String? globalProductId,
    GlobalProduct? globalProduct,
  }) {
    final result = create();
    if (globalProductId != null) result.globalProductId = globalProductId;
    if (globalProduct != null) result.globalProduct = globalProduct;
    return result;
  }

  UpdateGlobalProductRequest._();

  factory UpdateGlobalProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateGlobalProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateGlobalProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'globalProductId')
    ..aOM<GlobalProduct>(2, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalProductRequest clone() =>
      UpdateGlobalProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalProductRequest copyWith(
          void Function(UpdateGlobalProductRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateGlobalProductRequest))
          as UpdateGlobalProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGlobalProductRequest create() => UpdateGlobalProductRequest._();
  @$core.override
  UpdateGlobalProductRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateGlobalProductRequest> createRepeated() =>
      $pb.PbList<UpdateGlobalProductRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateGlobalProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateGlobalProductRequest>(create);
  static UpdateGlobalProductRequest? _defaultInstance;

  /// The unique identifier of the global product.
  @$pb.TagNumber(1)
  $core.String get globalProductId => $_getSZ(0);
  @$pb.TagNumber(1)
  set globalProductId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasGlobalProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearGlobalProductId() => $_clearField(1);

  /// The global product to update.
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

class UpdateGlobalProductResponse extends $pb.GeneratedMessage {
  factory UpdateGlobalProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateGlobalProductResponse._();

  factory UpdateGlobalProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateGlobalProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateGlobalProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalProductResponse clone() =>
      UpdateGlobalProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateGlobalProductResponse copyWith(
          void Function(UpdateGlobalProductResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateGlobalProductResponse))
          as UpdateGlobalProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateGlobalProductResponse create() =>
      UpdateGlobalProductResponse._();
  @$core.override
  UpdateGlobalProductResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateGlobalProductResponse> createRepeated() =>
      $pb.PbList<UpdateGlobalProductResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateGlobalProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateGlobalProductResponse>(create);
  static UpdateGlobalProductResponse? _defaultInstance;

  /// Whether the global product was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
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

class FindStoreProductsRequest extends $pb.GeneratedMessage {
  factory FindStoreProductsRequest({
    $core.String? storeId,
    $core.String? storeProductId,
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (storeProductId != null) result.storeProductId = storeProductId;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageToken != null) result.pageToken = pageToken;
    return result;
  }

  FindStoreProductsRequest._();

  factory FindStoreProductsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindStoreProductsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindStoreProductsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'storeProductId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(5, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStoreProductsRequest clone() =>
      FindStoreProductsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStoreProductsRequest copyWith(
          void Function(FindStoreProductsRequest) updates) =>
      super.copyWith((message) => updates(message as FindStoreProductsRequest))
          as FindStoreProductsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindStoreProductsRequest create() => FindStoreProductsRequest._();
  @$core.override
  FindStoreProductsRequest createEmptyInstance() => create();
  static $pb.PbList<FindStoreProductsRequest> createRepeated() =>
      $pb.PbList<FindStoreProductsRequest>();
  @$core.pragma('dart2js:noInline')
  static FindStoreProductsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindStoreProductsRequest>(create);
  static FindStoreProductsRequest? _defaultInstance;

  /// The query to search for store products.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// The unique identifier of the product.
  @$pb.TagNumber(2)
  $core.String get storeProductId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeProductId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreProductId() => $_clearField(2);

  /// The page size.
  @$pb.TagNumber(4)
  $core.int get pageSize => $_getIZ(2);
  @$pb.TagNumber(4)
  set pageSize($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(4)
  $core.bool hasPageSize() => $_has(2);
  @$pb.TagNumber(4)
  void clearPageSize() => $_clearField(4);

  /// The page token.
  @$pb.TagNumber(5)
  $core.String get pageToken => $_getSZ(3);
  @$pb.TagNumber(5)
  set pageToken($core.String value) => $_setString(3, value);
  @$pb.TagNumber(5)
  $core.bool hasPageToken() => $_has(3);
  @$pb.TagNumber(5)
  void clearPageToken() => $_clearField(5);
}

class FindStoreProductsResponse extends $pb.GeneratedMessage {
  factory FindStoreProductsResponse({
    $core.Iterable<StoreProductWithGlobalProduct>? products,
    $core.int? totalCount,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
    if (totalCount != null) result.totalCount = totalCount;
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  FindStoreProductsResponse._();

  factory FindStoreProductsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindStoreProductsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindStoreProductsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<StoreProductWithGlobalProduct>(
        1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM,
        subBuilder: StoreProductWithGlobalProduct.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStoreProductsResponse clone() =>
      FindStoreProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStoreProductsResponse copyWith(
          void Function(FindStoreProductsResponse) updates) =>
      super.copyWith((message) => updates(message as FindStoreProductsResponse))
          as FindStoreProductsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindStoreProductsResponse create() => FindStoreProductsResponse._();
  @$core.override
  FindStoreProductsResponse createEmptyInstance() => create();
  static $pb.PbList<FindStoreProductsResponse> createRepeated() =>
      $pb.PbList<FindStoreProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static FindStoreProductsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindStoreProductsResponse>(create);
  static FindStoreProductsResponse? _defaultInstance;

  /// The unique identifiers of the products.
  /// WARN: all returned products will only have their id and name.
  @$pb.TagNumber(1)
  $pb.PbList<StoreProductWithGlobalProduct> get products => $_getList(0);

  /// The total count of products.
  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  /// The next page token.
  @$pb.TagNumber(3)
  $core.String get nextPageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextPageToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNextPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextPageToken() => $_clearField(3);
}

class StoreProductWithGlobalProduct extends $pb.GeneratedMessage {
  factory StoreProductWithGlobalProduct({
    StoreProduct? storeProduct,
    GlobalProduct? globalProduct,
  }) {
    final result = create();
    if (storeProduct != null) result.storeProduct = storeProduct;
    if (globalProduct != null) result.globalProduct = globalProduct;
    return result;
  }

  StoreProductWithGlobalProduct._();

  factory StoreProductWithGlobalProduct.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreProductWithGlobalProduct.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreProductWithGlobalProduct',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<StoreProduct>(1, _omitFieldNames ? '' : 'storeProduct',
        subBuilder: StoreProduct.create)
    ..aOM<GlobalProduct>(2, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreProductWithGlobalProduct clone() =>
      StoreProductWithGlobalProduct()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreProductWithGlobalProduct copyWith(
          void Function(StoreProductWithGlobalProduct) updates) =>
      super.copyWith(
              (message) => updates(message as StoreProductWithGlobalProduct))
          as StoreProductWithGlobalProduct;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreProductWithGlobalProduct create() =>
      StoreProductWithGlobalProduct._();
  @$core.override
  StoreProductWithGlobalProduct createEmptyInstance() => create();
  static $pb.PbList<StoreProductWithGlobalProduct> createRepeated() =>
      $pb.PbList<StoreProductWithGlobalProduct>();
  @$core.pragma('dart2js:noInline')
  static StoreProductWithGlobalProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreProductWithGlobalProduct>(create);
  static StoreProductWithGlobalProduct? _defaultInstance;

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

class FindGlobalProductsRequest extends $pb.GeneratedMessage {
  factory FindGlobalProductsRequest({
    $core.String? refId,
    $core.Iterable<$0.Category>? categories,
    $core.String? name,
    $core.String? barCodeValue,
    GlobalProductStatus? status,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (categories != null) result.categories.addAll(categories);
    if (name != null) result.name = name;
    if (barCodeValue != null) result.barCodeValue = barCodeValue;
    if (status != null) result.status = status;
    return result;
  }

  FindGlobalProductsRequest._();

  factory FindGlobalProductsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindGlobalProductsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindGlobalProductsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..pc<$0.Category>(
        2, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM,
        subBuilder: $0.Category.create)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'barCodeValue')
    ..e<GlobalProductStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: GlobalProductStatus.GLOBAL_PRODUCT_STATUS_UNSPECIFIED,
        valueOf: GlobalProductStatus.valueOf,
        enumValues: GlobalProductStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindGlobalProductsRequest clone() =>
      FindGlobalProductsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindGlobalProductsRequest copyWith(
          void Function(FindGlobalProductsRequest) updates) =>
      super.copyWith((message) => updates(message as FindGlobalProductsRequest))
          as FindGlobalProductsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsRequest create() => FindGlobalProductsRequest._();
  @$core.override
  FindGlobalProductsRequest createEmptyInstance() => create();
  static $pb.PbList<FindGlobalProductsRequest> createRepeated() =>
      $pb.PbList<FindGlobalProductsRequest>();
  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindGlobalProductsRequest>(create);
  static FindGlobalProductsRequest? _defaultInstance;

  /// The reference id to the global product identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The query to search for products by category.
  @$pb.TagNumber(2)
  $pb.PbList<$0.Category> get categories => $_getList(1);

  /// Query the product name.
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  /// Identify the products by bar code.
  @$pb.TagNumber(4)
  $core.String get barCodeValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set barCodeValue($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBarCodeValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBarCodeValue() => $_clearField(4);

  /// Identify the products by store.
  @$pb.TagNumber(5)
  GlobalProductStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(GlobalProductStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);
}

class FindGlobalProductsResponse extends $pb.GeneratedMessage {
  factory FindGlobalProductsResponse({
    $core.Iterable<GlobalProduct>? products,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
    return result;
  }

  FindGlobalProductsResponse._();

  factory FindGlobalProductsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindGlobalProductsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindGlobalProductsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<GlobalProduct>(
        1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM,
        subBuilder: GlobalProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindGlobalProductsResponse clone() =>
      FindGlobalProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindGlobalProductsResponse copyWith(
          void Function(FindGlobalProductsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as FindGlobalProductsResponse))
          as FindGlobalProductsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsResponse create() => FindGlobalProductsResponse._();
  @$core.override
  FindGlobalProductsResponse createEmptyInstance() => create();
  static $pb.PbList<FindGlobalProductsResponse> createRepeated() =>
      $pb.PbList<FindGlobalProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindGlobalProductsResponse>(create);
  static FindGlobalProductsResponse? _defaultInstance;

  /// The unique identifiers of the products.
  /// WARN: all returned products will only have their id and name.
  @$pb.TagNumber(1)
  $pb.PbList<GlobalProduct> get products => $_getList(0);
}

class FindProductCategoryRequest extends $pb.GeneratedMessage {
  factory FindProductCategoryRequest({
    $core.String? query,
  }) {
    final result = create();
    if (query != null) result.query = query;
    return result;
  }

  FindProductCategoryRequest._();

  factory FindProductCategoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindProductCategoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindProductCategoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindProductCategoryRequest clone() =>
      FindProductCategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindProductCategoryRequest copyWith(
          void Function(FindProductCategoryRequest) updates) =>
      super.copyWith(
              (message) => updates(message as FindProductCategoryRequest))
          as FindProductCategoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindProductCategoryRequest create() => FindProductCategoryRequest._();
  @$core.override
  FindProductCategoryRequest createEmptyInstance() => create();
  static $pb.PbList<FindProductCategoryRequest> createRepeated() =>
      $pb.PbList<FindProductCategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static FindProductCategoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindProductCategoryRequest>(create);
  static FindProductCategoryRequest? _defaultInstance;

  /// The query to search for product categories.
  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => $_clearField(1);
}

class FindProductCategoryResponse extends $pb.GeneratedMessage {
  factory FindProductCategoryResponse({
    $core.Iterable<$0.Category>? categories,
  }) {
    final result = create();
    if (categories != null) result.categories.addAll(categories);
    return result;
  }

  FindProductCategoryResponse._();

  factory FindProductCategoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindProductCategoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindProductCategoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<$0.Category>(
        1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM,
        subBuilder: $0.Category.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindProductCategoryResponse clone() =>
      FindProductCategoryResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindProductCategoryResponse copyWith(
          void Function(FindProductCategoryResponse) updates) =>
      super.copyWith(
              (message) => updates(message as FindProductCategoryResponse))
          as FindProductCategoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindProductCategoryResponse create() =>
      FindProductCategoryResponse._();
  @$core.override
  FindProductCategoryResponse createEmptyInstance() => create();
  static $pb.PbList<FindProductCategoryResponse> createRepeated() =>
      $pb.PbList<FindProductCategoryResponse>();
  @$core.pragma('dart2js:noInline')
  static FindProductCategoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindProductCategoryResponse>(create);
  static FindProductCategoryResponse? _defaultInstance;

  /// The unique identifiers of the product categories.
  /// WARN: all returned product categories will only have their id and name.
  @$pb.TagNumber(1)
  $pb.PbList<$0.Category> get categories => $_getList(0);
}

class AddStoreProductRequest extends $pb.GeneratedMessage {
  factory AddStoreProductRequest({
    GlobalProduct? globalProduct,
    StoreProduct? storeProduct,
  }) {
    final result = create();
    if (globalProduct != null) result.globalProduct = globalProduct;
    if (storeProduct != null) result.storeProduct = storeProduct;
    return result;
  }

  AddStoreProductRequest._();

  factory AddStoreProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddStoreProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddStoreProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<GlobalProduct>(1, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..aOM<StoreProduct>(2, _omitFieldNames ? '' : 'storeProduct',
        subBuilder: StoreProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddStoreProductRequest clone() =>
      AddStoreProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddStoreProductRequest copyWith(
          void Function(AddStoreProductRequest) updates) =>
      super.copyWith((message) => updates(message as AddStoreProductRequest))
          as AddStoreProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddStoreProductRequest create() => AddStoreProductRequest._();
  @$core.override
  AddStoreProductRequest createEmptyInstance() => create();
  static $pb.PbList<AddStoreProductRequest> createRepeated() =>
      $pb.PbList<AddStoreProductRequest>();
  @$core.pragma('dart2js:noInline')
  static AddStoreProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddStoreProductRequest>(create);
  static AddStoreProductRequest? _defaultInstance;

  /// The product to add.
  /// If the product does not exist, it will be created.
  @$pb.TagNumber(1)
  GlobalProduct get globalProduct => $_getN(0);
  @$pb.TagNumber(1)
  set globalProduct(GlobalProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasGlobalProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearGlobalProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  GlobalProduct ensureGlobalProduct() => $_ensure(0);

  /// The store product to add.
  @$pb.TagNumber(2)
  StoreProduct get storeProduct => $_getN(1);
  @$pb.TagNumber(2)
  set storeProduct(StoreProduct value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreProduct() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreProduct() => $_clearField(2);
  @$pb.TagNumber(2)
  StoreProduct ensureStoreProduct() => $_ensure(1);
}

class AddStoreProductResponse extends $pb.GeneratedMessage {
  factory AddStoreProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  AddStoreProductResponse._();

  factory AddStoreProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddStoreProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddStoreProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddStoreProductResponse clone() =>
      AddStoreProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddStoreProductResponse copyWith(
          void Function(AddStoreProductResponse) updates) =>
      super.copyWith((message) => updates(message as AddStoreProductResponse))
          as AddStoreProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddStoreProductResponse create() => AddStoreProductResponse._();
  @$core.override
  AddStoreProductResponse createEmptyInstance() => create();
  static $pb.PbList<AddStoreProductResponse> createRepeated() =>
      $pb.PbList<AddStoreProductResponse>();
  @$core.pragma('dart2js:noInline')
  static AddStoreProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddStoreProductResponse>(create);
  static AddStoreProductResponse? _defaultInstance;

  /// Whether the product was successfully added.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetStoreProductRequest extends $pb.GeneratedMessage {
  factory GetStoreProductRequest({
    $core.String? storeProductId,
  }) {
    final result = create();
    if (storeProductId != null) result.storeProductId = storeProductId;
    return result;
  }

  GetStoreProductRequest._();

  factory GetStoreProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeProductId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreProductRequest clone() =>
      GetStoreProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreProductRequest copyWith(
          void Function(GetStoreProductRequest) updates) =>
      super.copyWith((message) => updates(message as GetStoreProductRequest))
          as GetStoreProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreProductRequest create() => GetStoreProductRequest._();
  @$core.override
  GetStoreProductRequest createEmptyInstance() => create();
  static $pb.PbList<GetStoreProductRequest> createRepeated() =>
      $pb.PbList<GetStoreProductRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStoreProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreProductRequest>(create);
  static GetStoreProductRequest? _defaultInstance;

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

class GetStoreProductResponse extends $pb.GeneratedMessage {
  factory GetStoreProductResponse({
    StoreProductWithGlobalProduct? product,
  }) {
    final result = create();
    if (product != null) result.product = product;
    return result;
  }

  GetStoreProductResponse._();

  factory GetStoreProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<StoreProductWithGlobalProduct>(1, _omitFieldNames ? '' : 'product',
        subBuilder: StoreProductWithGlobalProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreProductResponse clone() =>
      GetStoreProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreProductResponse copyWith(
          void Function(GetStoreProductResponse) updates) =>
      super.copyWith((message) => updates(message as GetStoreProductResponse))
          as GetStoreProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreProductResponse create() => GetStoreProductResponse._();
  @$core.override
  GetStoreProductResponse createEmptyInstance() => create();
  static $pb.PbList<GetStoreProductResponse> createRepeated() =>
      $pb.PbList<GetStoreProductResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStoreProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreProductResponse>(create);
  static GetStoreProductResponse? _defaultInstance;

  /// The retrieved store product data.
  @$pb.TagNumber(1)
  StoreProductWithGlobalProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product(StoreProductWithGlobalProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreProductWithGlobalProduct ensureProduct() => $_ensure(0);
}

class UpdateStoreProductRequest extends $pb.GeneratedMessage {
  factory UpdateStoreProductRequest({
    StoreProduct? storeProduct,
    GlobalProduct? globalProduct,
    $core.Iterable<$core.List<$core.int>>? imagesRawImages,
  }) {
    final result = create();
    if (storeProduct != null) result.storeProduct = storeProduct;
    if (globalProduct != null) result.globalProduct = globalProduct;
    if (imagesRawImages != null) result.imagesRawImages.addAll(imagesRawImages);
    return result;
  }

  UpdateStoreProductRequest._();

  factory UpdateStoreProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<StoreProduct>(1, _omitFieldNames ? '' : 'storeProduct',
        subBuilder: StoreProduct.create)
    ..aOM<GlobalProduct>(2, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'imagesRawImages', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreProductRequest clone() =>
      UpdateStoreProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreProductRequest copyWith(
          void Function(UpdateStoreProductRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreProductRequest))
          as UpdateStoreProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreProductRequest create() => UpdateStoreProductRequest._();
  @$core.override
  UpdateStoreProductRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreProductRequest> createRepeated() =>
      $pb.PbList<UpdateStoreProductRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreProductRequest>(create);
  static UpdateStoreProductRequest? _defaultInstance;

  /// The store product information to update.
  /// Note:Only the fields that are set will be updated.
  /// Some fields cannot be updated like the product id, store id, and all
  /// product fields.
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

  /// The global product information to update.
  /// Note:Only the fields that are set will be updated if there is no
  /// ref_id set for the global product or will be created in other case.
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

  /// The media ids of the images of the product.
  @$pb.TagNumber(3)
  $pb.PbList<$core.List<$core.int>> get imagesRawImages => $_getList(2);
}

class UpdateStoreProductResponse extends $pb.GeneratedMessage {
  factory UpdateStoreProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateStoreProductResponse._();

  factory UpdateStoreProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreProductResponse clone() =>
      UpdateStoreProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreProductResponse copyWith(
          void Function(UpdateStoreProductResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateStoreProductResponse))
          as UpdateStoreProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreProductResponse create() => UpdateStoreProductResponse._();
  @$core.override
  UpdateStoreProductResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreProductResponse> createRepeated() =>
      $pb.PbList<UpdateStoreProductResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreProductResponse>(create);
  static UpdateStoreProductResponse? _defaultInstance;

  /// Whether the store product was successfully updated.
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

class StreamStoreProductsRequest extends $pb.GeneratedMessage {
  factory StreamStoreProductsRequest({
    $core.String? storeId,
    $core.String? supplierId,
    $core.String? globalProductId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (supplierId != null) result.supplierId = supplierId;
    if (globalProductId != null) result.globalProductId = globalProductId;
    return result;
  }

  StreamStoreProductsRequest._();

  factory StreamStoreProductsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreProductsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreProductsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'supplierId')
    ..aOS(3, _omitFieldNames ? '' : 'globalProductId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreProductsRequest clone() =>
      StreamStoreProductsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreProductsRequest copyWith(
          void Function(StreamStoreProductsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StreamStoreProductsRequest))
          as StreamStoreProductsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreProductsRequest create() => StreamStoreProductsRequest._();
  @$core.override
  StreamStoreProductsRequest createEmptyInstance() => create();
  static $pb.PbList<StreamStoreProductsRequest> createRepeated() =>
      $pb.PbList<StreamStoreProductsRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreProductsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreProductsRequest>(create);
  static StreamStoreProductsRequest? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// Optional filter by supplier ID.
  @$pb.TagNumber(2)
  $core.String get supplierId => $_getSZ(1);
  @$pb.TagNumber(2)
  set supplierId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSupplierId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupplierId() => $_clearField(2);

  /// Optional filter by global product ID.
  @$pb.TagNumber(3)
  $core.String get globalProductId => $_getSZ(2);
  @$pb.TagNumber(3)
  set globalProductId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGlobalProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGlobalProductId() => $_clearField(3);
}

class StreamStoreProductsResponse extends $pb.GeneratedMessage {
  factory StreamStoreProductsResponse({
    $core.Iterable<StoreProduct>? products,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
    return result;
  }

  StreamStoreProductsResponse._();

  factory StreamStoreProductsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreProductsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreProductsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<StoreProduct>(1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM,
        subBuilder: StoreProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreProductsResponse clone() =>
      StreamStoreProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreProductsResponse copyWith(
          void Function(StreamStoreProductsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StreamStoreProductsResponse))
          as StreamStoreProductsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreProductsResponse create() =>
      StreamStoreProductsResponse._();
  @$core.override
  StreamStoreProductsResponse createEmptyInstance() => create();
  static $pb.PbList<StreamStoreProductsResponse> createRepeated() =>
      $pb.PbList<StreamStoreProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreProductsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreProductsResponse>(create);
  static StreamStoreProductsResponse? _defaultInstance;

  /// The store products for the specified store.
  @$pb.TagNumber(1)
  $pb.PbList<StoreProduct> get products => $_getList(0);
}

class StreamGlobalProductsRequest extends $pb.GeneratedMessage {
  factory StreamGlobalProductsRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  StreamGlobalProductsRequest._();

  factory StreamGlobalProductsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamGlobalProductsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamGlobalProductsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamGlobalProductsRequest clone() =>
      StreamGlobalProductsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamGlobalProductsRequest copyWith(
          void Function(StreamGlobalProductsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StreamGlobalProductsRequest))
          as StreamGlobalProductsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamGlobalProductsRequest create() =>
      StreamGlobalProductsRequest._();
  @$core.override
  StreamGlobalProductsRequest createEmptyInstance() => create();
  static $pb.PbList<StreamGlobalProductsRequest> createRepeated() =>
      $pb.PbList<StreamGlobalProductsRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamGlobalProductsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamGlobalProductsRequest>(create);
  static StreamGlobalProductsRequest? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class StreamGlobalProductsResponse extends $pb.GeneratedMessage {
  factory StreamGlobalProductsResponse({
    $core.Iterable<GlobalProduct>? products,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
    return result;
  }

  StreamGlobalProductsResponse._();

  factory StreamGlobalProductsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamGlobalProductsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamGlobalProductsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<GlobalProduct>(
        1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM,
        subBuilder: GlobalProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamGlobalProductsResponse clone() =>
      StreamGlobalProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamGlobalProductsResponse copyWith(
          void Function(StreamGlobalProductsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StreamGlobalProductsResponse))
          as StreamGlobalProductsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamGlobalProductsResponse create() =>
      StreamGlobalProductsResponse._();
  @$core.override
  StreamGlobalProductsResponse createEmptyInstance() => create();
  static $pb.PbList<StreamGlobalProductsResponse> createRepeated() =>
      $pb.PbList<StreamGlobalProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamGlobalProductsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamGlobalProductsResponse>(create);
  static StreamGlobalProductsResponse? _defaultInstance;

  /// The global products for the specified store.
  @$pb.TagNumber(1)
  $pb.PbList<GlobalProduct> get products => $_getList(0);
}

class SearchStoreProductsRequest extends $pb.GeneratedMessage {
  factory SearchStoreProductsRequest({
    $core.String? storeId,
    $core.String? searchQuery,
    $core.Iterable<$core.String>? categoryIds,
    ProductStatus? status,
    $core.int? pageSize,
    $core.String? pageToken,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (searchQuery != null) result.searchQuery = searchQuery;
    if (categoryIds != null) result.categoryIds.addAll(categoryIds);
    if (status != null) result.status = status;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageToken != null) result.pageToken = pageToken;
    return result;
  }

  SearchStoreProductsRequest._();

  factory SearchStoreProductsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchStoreProductsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchStoreProductsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'searchQuery')
    ..pPS(3, _omitFieldNames ? '' : 'categoryIds')
    ..e<ProductStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ProductStatus.PRODUCT_STATUS_UNSPECIFIED,
        valueOf: ProductStatus.valueOf,
        enumValues: ProductStatus.values)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..aOS(6, _omitFieldNames ? '' : 'pageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStoreProductsRequest clone() =>
      SearchStoreProductsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStoreProductsRequest copyWith(
          void Function(SearchStoreProductsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SearchStoreProductsRequest))
          as SearchStoreProductsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchStoreProductsRequest create() => SearchStoreProductsRequest._();
  @$core.override
  SearchStoreProductsRequest createEmptyInstance() => create();
  static $pb.PbList<SearchStoreProductsRequest> createRepeated() =>
      $pb.PbList<SearchStoreProductsRequest>();
  @$core.pragma('dart2js:noInline')
  static SearchStoreProductsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchStoreProductsRequest>(create);
  static SearchStoreProductsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get searchQuery => $_getSZ(1);
  @$pb.TagNumber(2)
  set searchQuery($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSearchQuery() => $_has(1);
  @$pb.TagNumber(2)
  void clearSearchQuery() => $_clearField(2);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get categoryIds => $_getList(2);

  @$pb.TagNumber(4)
  ProductStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(ProductStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get pageSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set pageSize($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPageSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearPageSize() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get pageToken => $_getSZ(5);
  @$pb.TagNumber(6)
  set pageToken($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPageToken() => $_has(5);
  @$pb.TagNumber(6)
  void clearPageToken() => $_clearField(6);
}

class SearchStoreProductsResponse extends $pb.GeneratedMessage {
  factory SearchStoreProductsResponse({
    $core.Iterable<StoreProductWithGlobalProduct>? products,
    $core.int? totalCount,
    $core.String? nextPageToken,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
    if (totalCount != null) result.totalCount = totalCount;
    if (nextPageToken != null) result.nextPageToken = nextPageToken;
    return result;
  }

  SearchStoreProductsResponse._();

  factory SearchStoreProductsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SearchStoreProductsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SearchStoreProductsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<StoreProductWithGlobalProduct>(
        1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM,
        subBuilder: StoreProductWithGlobalProduct.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'nextPageToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStoreProductsResponse clone() =>
      SearchStoreProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SearchStoreProductsResponse copyWith(
          void Function(SearchStoreProductsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SearchStoreProductsResponse))
          as SearchStoreProductsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SearchStoreProductsResponse create() =>
      SearchStoreProductsResponse._();
  @$core.override
  SearchStoreProductsResponse createEmptyInstance() => create();
  static $pb.PbList<SearchStoreProductsResponse> createRepeated() =>
      $pb.PbList<SearchStoreProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static SearchStoreProductsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SearchStoreProductsResponse>(create);
  static SearchStoreProductsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<StoreProductWithGlobalProduct> get products => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get nextPageToken => $_getSZ(2);
  @$pb.TagNumber(3)
  set nextPageToken($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasNextPageToken() => $_has(2);
  @$pb.TagNumber(3)
  void clearNextPageToken() => $_clearField(3);
}

class StoreProductServiceApi {
  final $pb.RpcClient _client;

  StoreProductServiceApi(this._client);

  /// Finds products by name.
  $async.Future<FindGlobalProductsResponse> findGlobalProducts(
          $pb.ClientContext? ctx, FindGlobalProductsRequest request) =>
      _client.invoke<FindGlobalProductsResponse>(ctx, 'StoreProductService',
          'FindGlobalProducts', request, FindGlobalProductsResponse());

  /// Finds categories by name.
  $async.Future<FindProductCategoryResponse> findProductCategory(
          $pb.ClientContext? ctx, FindProductCategoryRequest request) =>
      _client.invoke<FindProductCategoryResponse>(ctx, 'StoreProductService',
          'FindProductCategory', request, FindProductCategoryResponse());

  /// Creates a global product.
  $async.Future<CreateGlobalProductResponse> createGlobalProduct(
          $pb.ClientContext? ctx, CreateGlobalProductRequest request) =>
      _client.invoke<CreateGlobalProductResponse>(ctx, 'StoreProductService',
          'CreateGlobalProduct', request, CreateGlobalProductResponse());

  /// Updates a global product.
  $async.Future<UpdateGlobalProductResponse> updateGlobalProduct(
          $pb.ClientContext? ctx, UpdateGlobalProductRequest request) =>
      _client.invoke<UpdateGlobalProductResponse>(ctx, 'StoreProductService',
          'UpdateGlobalProduct', request, UpdateGlobalProductResponse());

  /// Deletes a global product.
  $async.Future<DeleteGlobalProductResponse> deleteGlobalProduct(
          $pb.ClientContext? ctx, DeleteGlobalProductRequest request) =>
      _client.invoke<DeleteGlobalProductResponse>(ctx, 'StoreProductService',
          'DeleteGlobalProduct', request, DeleteGlobalProductResponse());

  /// Adds a product to a store.
  $async.Future<AddStoreProductResponse> addProduct(
          $pb.ClientContext? ctx, AddStoreProductRequest request) =>
      _client.invoke<AddStoreProductResponse>(ctx, 'StoreProductService',
          'AddProduct', request, AddStoreProductResponse());

  /// Gets a store product by id.
  $async.Future<GetStoreProductResponse> getStoreProduct(
          $pb.ClientContext? ctx, GetStoreProductRequest request) =>
      _client.invoke<GetStoreProductResponse>(ctx, 'StoreProductService',
          'GetStoreProduct', request, GetStoreProductResponse());

  /// Updates a store product.
  $async.Future<UpdateStoreProductResponse> updateStoreProduct(
          $pb.ClientContext? ctx, UpdateStoreProductRequest request) =>
      _client.invoke<UpdateStoreProductResponse>(ctx, 'StoreProductService',
          'UpdateStoreProduct', request, UpdateStoreProductResponse());

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  $async.Future<DeleteStoreProductResponse> deleteStoreProduct(
          $pb.ClientContext? ctx, DeleteStoreProductRequest request) =>
      _client.invoke<DeleteStoreProductResponse>(ctx, 'StoreProductService',
          'DeleteStoreProduct', request, DeleteStoreProductResponse());

  /// Finds products by name.
  $async.Future<FindStoreProductsResponse> findStoreProducts(
          $pb.ClientContext? ctx, FindStoreProductsRequest request) =>
      _client.invoke<FindStoreProductsResponse>(ctx, 'StoreProductService',
          'FindStoreProducts', request, FindStoreProductsResponse());

  /// Streams all products for a store for real-time updates.
  $async.Future<StreamStoreProductsResponse> streamStoreProducts(
          $pb.ClientContext? ctx, StreamStoreProductsRequest request) =>
      _client.invoke<StreamStoreProductsResponse>(ctx, 'StoreProductService',
          'StreamStoreProducts', request, StreamStoreProductsResponse());

  /// Streams all global products for real-time updates.
  $async.Future<StreamGlobalProductsResponse> streamGlobalProducts(
          $pb.ClientContext? ctx, StreamGlobalProductsRequest request) =>
      _client.invoke<StreamGlobalProductsResponse>(ctx, 'StoreProductService',
          'StreamGlobalProducts', request, StreamGlobalProductsResponse());

  /// Search products with pagination and filters.
  $async.Future<SearchStoreProductsResponse> searchStoreProducts(
          $pb.ClientContext? ctx, SearchStoreProductsRequest request) =>
      _client.invoke<SearchStoreProductsResponse>(ctx, 'StoreProductService',
          'SearchStoreProducts', request, SearchStoreProductsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
