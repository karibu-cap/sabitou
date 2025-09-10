// This is a generated file - do not edit.
//
// Generated from inventory/v1/product.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class ProductCategory extends $pb.GeneratedMessage {
  factory ProductCategory({
    $core.String? refId,
    $core.String? name,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    return result;
  }

  ProductCategory._();

  factory ProductCategory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProductCategory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProductCategory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProductCategory clone() => ProductCategory()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProductCategory copyWith(void Function(ProductCategory) updates) =>
      super.copyWith((message) => updates(message as ProductCategory))
          as ProductCategory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProductCategory create() => ProductCategory._();
  @$core.override
  ProductCategory createEmptyInstance() => create();
  static $pb.PbList<ProductCategory> createRepeated() =>
      $pb.PbList<ProductCategory>();
  @$core.pragma('dart2js:noInline')
  static ProductCategory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProductCategory>(create);
  static ProductCategory? _defaultInstance;

  /// The unique identifier of the product category.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the product category.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);
}

class GlobalProduct extends $pb.GeneratedMessage {
  factory GlobalProduct({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    $core.String? barCodeValue,
    $core.Iterable<ProductCategory>? categories,
    $core.Iterable<$core.String>? imagesLinksIds,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (barCodeValue != null) result.barCodeValue = barCodeValue;
    if (categories != null) result.categories.addAll(categories);
    if (imagesLinksIds != null) result.imagesLinksIds.addAll(imagesLinksIds);
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
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'barCodeValue')
    ..pc<ProductCategory>(
        5, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM,
        subBuilder: ProductCategory.create)
    ..pPS(6, _omitFieldNames ? '' : 'imagesLinksIds')
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
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// The description of the product.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

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
  $pb.PbList<ProductCategory> get categories => $_getList(4);

  /// The list of image related to the product.
  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get imagesLinksIds => $_getList(5);
}

class SupplyEntry extends $pb.GeneratedMessage {
  factory SupplyEntry({
    $core.int? quantity,
    $core.int? priceInXaf,
    $core.String? supplierId,
  }) {
    final result = create();
    if (quantity != null) result.quantity = quantity;
    if (priceInXaf != null) result.priceInXaf = priceInXaf;
    if (supplierId != null) result.supplierId = supplierId;
    return result;
  }

  SupplyEntry._();

  factory SupplyEntry.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SupplyEntry.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SupplyEntry',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'priceInXaf', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'supplierId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupplyEntry clone() => SupplyEntry()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SupplyEntry copyWith(void Function(SupplyEntry) updates) =>
      super.copyWith((message) => updates(message as SupplyEntry))
          as SupplyEntry;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SupplyEntry create() => SupplyEntry._();
  @$core.override
  SupplyEntry createEmptyInstance() => create();
  static $pb.PbList<SupplyEntry> createRepeated() => $pb.PbList<SupplyEntry>();
  @$core.pragma('dart2js:noInline')
  static SupplyEntry getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SupplyEntry>(create);
  static SupplyEntry? _defaultInstance;

  /// The quantity of the product.
  @$pb.TagNumber(1)
  $core.int get quantity => $_getIZ(0);
  @$pb.TagNumber(1)
  set quantity($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasQuantity() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuantity() => $_clearField(1);

  /// The price in XAF of the product.
  @$pb.TagNumber(2)
  $core.int get priceInXaf => $_getIZ(1);
  @$pb.TagNumber(2)
  set priceInXaf($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPriceInXaf() => $_has(1);
  @$pb.TagNumber(2)
  void clearPriceInXaf() => $_clearField(2);

  /// The unique identifier of the supplier.
  @$pb.TagNumber(3)
  $core.String get supplierId => $_getSZ(2);
  @$pb.TagNumber(3)
  set supplierId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupplierId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupplierId() => $_clearField(3);
}

class StoreProduct extends $pb.GeneratedMessage {
  factory StoreProduct({
    $core.String? refId,
    $core.String? storeId,
    $core.String? globalProductId,
    $core.int? priceInXaf,
    $core.Iterable<$core.String>? imagesLinkIds,
    $core.int? stockQuantity,
    $core.int? minStockThreshold,
    $0.Timestamp? expirationDate,
    $0.Timestamp? inboundDate,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    $core.String? supplierId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (storeId != null) result.storeId = storeId;
    if (globalProductId != null) result.globalProductId = globalProductId;
    if (priceInXaf != null) result.priceInXaf = priceInXaf;
    if (imagesLinkIds != null) result.imagesLinkIds.addAll(imagesLinkIds);
    if (stockQuantity != null) result.stockQuantity = stockQuantity;
    if (minStockThreshold != null) result.minStockThreshold = minStockThreshold;
    if (expirationDate != null) result.expirationDate = expirationDate;
    if (inboundDate != null) result.inboundDate = inboundDate;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (supplierId != null) result.supplierId = supplierId;
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
    ..a<$core.int>(4, _omitFieldNames ? '' : 'priceInXaf', $pb.PbFieldType.O3)
    ..pPS(5, _omitFieldNames ? '' : 'imagesLinkIds')
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'stockQuantity', $pb.PbFieldType.O3)
    ..a<$core.int>(
        7, _omitFieldNames ? '' : 'minStockThreshold', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'expirationDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'inboundDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'supplierId')
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

  /// The price in XAF of the product.
  /// The currency is determined by the business.
  @$pb.TagNumber(4)
  $core.int get priceInXaf => $_getIZ(3);
  @$pb.TagNumber(4)
  set priceInXaf($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPriceInXaf() => $_has(3);
  @$pb.TagNumber(4)
  void clearPriceInXaf() => $_clearField(4);

  /// The media ids of the images of the product.
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get imagesLinkIds => $_getList(4);

  /// The stock quantity of the product.
  @$pb.TagNumber(6)
  $core.int get stockQuantity => $_getIZ(5);
  @$pb.TagNumber(6)
  set stockQuantity($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasStockQuantity() => $_has(5);
  @$pb.TagNumber(6)
  void clearStockQuantity() => $_clearField(6);

  /// The minimum stock threshold of the product.
  @$pb.TagNumber(7)
  $core.int get minStockThreshold => $_getIZ(6);
  @$pb.TagNumber(7)
  set minStockThreshold($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasMinStockThreshold() => $_has(6);
  @$pb.TagNumber(7)
  void clearMinStockThreshold() => $_clearField(7);

  /// The expiration date of the product.
  @$pb.TagNumber(8)
  $0.Timestamp get expirationDate => $_getN(7);
  @$pb.TagNumber(8)
  set expirationDate($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasExpirationDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearExpirationDate() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureExpirationDate() => $_ensure(7);

  /// The inbound date.
  @$pb.TagNumber(9)
  $0.Timestamp get inboundDate => $_getN(8);
  @$pb.TagNumber(9)
  set inboundDate($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasInboundDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearInboundDate() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureInboundDate() => $_ensure(8);

  /// The creation date of the product.
  @$pb.TagNumber(10)
  $0.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($0.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureCreatedAt() => $_ensure(9);

  /// The last update date of the product.
  @$pb.TagNumber(11)
  $0.Timestamp get updatedAt => $_getN(10);
  @$pb.TagNumber(11)
  set updatedAt($0.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdatedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureUpdatedAt() => $_ensure(10);

  /// The supplier.
  @$pb.TagNumber(12)
  $core.String get supplierId => $_getSZ(11);
  @$pb.TagNumber(12)
  set supplierId($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasSupplierId() => $_has(11);
  @$pb.TagNumber(12)
  void clearSupplierId() => $_clearField(12);
}

class FindStoreProductsRequest extends $pb.GeneratedMessage {
  factory FindStoreProductsRequest({
    $core.String? storeId,
    $core.String? refId,
    $core.String? globalProductId,
    $0.Timestamp? expirationDate,
    $core.String? supplierId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (refId != null) result.refId = refId;
    if (globalProductId != null) result.globalProductId = globalProductId;
    if (expirationDate != null) result.expirationDate = expirationDate;
    if (supplierId != null) result.supplierId = supplierId;
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
    ..aOS(2, _omitFieldNames ? '' : 'refId')
    ..aOS(3, _omitFieldNames ? '' : 'globalProductId')
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'expirationDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(5, _omitFieldNames ? '' : 'supplierId')
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
  $core.String get refId => $_getSZ(1);
  @$pb.TagNumber(2)
  set refId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRefId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRefId() => $_clearField(2);

  /// The unique identifier of the global product.
  @$pb.TagNumber(3)
  $core.String get globalProductId => $_getSZ(2);
  @$pb.TagNumber(3)
  set globalProductId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasGlobalProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGlobalProductId() => $_clearField(3);

  /// Identify the products that are expired.
  @$pb.TagNumber(4)
  $0.Timestamp get expirationDate => $_getN(3);
  @$pb.TagNumber(4)
  set expirationDate($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasExpirationDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearExpirationDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureExpirationDate() => $_ensure(3);

  /// Identify the products by supplier.
  @$pb.TagNumber(5)
  $core.String get supplierId => $_getSZ(4);
  @$pb.TagNumber(5)
  set supplierId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSupplierId() => $_has(4);
  @$pb.TagNumber(5)
  void clearSupplierId() => $_clearField(5);
}

class FindStoreProductsResponse extends $pb.GeneratedMessage {
  factory FindStoreProductsResponse({
    $core.Iterable<StoreProduct>? products,
  }) {
    final result = create();
    if (products != null) result.products.addAll(products);
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
    ..pc<StoreProduct>(1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM,
        subBuilder: StoreProduct.create)
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
  $pb.PbList<StoreProduct> get products => $_getList(0);
}

class FindGlobalProductsRequest extends $pb.GeneratedMessage {
  factory FindGlobalProductsRequest({
    $core.String? refId,
    $core.Iterable<ProductCategory>? categories,
    $core.String? name,
    $core.String? barCodeValue,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (categories != null) result.categories.addAll(categories);
    if (name != null) result.name = name;
    if (barCodeValue != null) result.barCodeValue = barCodeValue;
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
    ..pc<ProductCategory>(
        2, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM,
        subBuilder: ProductCategory.create)
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(4, _omitFieldNames ? '' : 'barCodeValue')
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
  $pb.PbList<ProductCategory> get categories => $_getList(1);

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

class FindCategoryRequest extends $pb.GeneratedMessage {
  factory FindCategoryRequest({
    $core.String? query,
  }) {
    final result = create();
    if (query != null) result.query = query;
    return result;
  }

  FindCategoryRequest._();

  factory FindCategoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindCategoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindCategoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindCategoryRequest clone() => FindCategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindCategoryRequest copyWith(void Function(FindCategoryRequest) updates) =>
      super.copyWith((message) => updates(message as FindCategoryRequest))
          as FindCategoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest create() => FindCategoryRequest._();
  @$core.override
  FindCategoryRequest createEmptyInstance() => create();
  static $pb.PbList<FindCategoryRequest> createRepeated() =>
      $pb.PbList<FindCategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindCategoryRequest>(create);
  static FindCategoryRequest? _defaultInstance;

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

class FindCategoryResponse extends $pb.GeneratedMessage {
  factory FindCategoryResponse({
    $core.Iterable<ProductCategory>? categories,
  }) {
    final result = create();
    if (categories != null) result.categories.addAll(categories);
    return result;
  }

  FindCategoryResponse._();

  factory FindCategoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindCategoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindCategoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<ProductCategory>(
        1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM,
        subBuilder: ProductCategory.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindCategoryResponse clone() =>
      FindCategoryResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindCategoryResponse copyWith(void Function(FindCategoryResponse) updates) =>
      super.copyWith((message) => updates(message as FindCategoryResponse))
          as FindCategoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCategoryResponse create() => FindCategoryResponse._();
  @$core.override
  FindCategoryResponse createEmptyInstance() => create();
  static $pb.PbList<FindCategoryResponse> createRepeated() =>
      $pb.PbList<FindCategoryResponse>();
  @$core.pragma('dart2js:noInline')
  static FindCategoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindCategoryResponse>(create);
  static FindCategoryResponse? _defaultInstance;

  /// The unique identifiers of the product categories.
  /// WARN: all returned product categories will only have their id and name.
  @$pb.TagNumber(1)
  $pb.PbList<ProductCategory> get categories => $_getList(0);
}

class AddProductRequest extends $pb.GeneratedMessage {
  factory AddProductRequest({
    GlobalProduct? globalProduct,
    $core.String? storeId,
    $core.int? priceInXaf,
    $core.Iterable<$core.List<$core.int>>? imagesRawImages,
    $core.int? stockQuantity,
    $core.int? minStockThreshold,
    $0.Timestamp? expirationDate,
  }) {
    final result = create();
    if (globalProduct != null) result.globalProduct = globalProduct;
    if (storeId != null) result.storeId = storeId;
    if (priceInXaf != null) result.priceInXaf = priceInXaf;
    if (imagesRawImages != null) result.imagesRawImages.addAll(imagesRawImages);
    if (stockQuantity != null) result.stockQuantity = stockQuantity;
    if (minStockThreshold != null) result.minStockThreshold = minStockThreshold;
    if (expirationDate != null) result.expirationDate = expirationDate;
    return result;
  }

  AddProductRequest._();

  factory AddProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<GlobalProduct>(1, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'priceInXaf', $pb.PbFieldType.O3)
    ..p<$core.List<$core.int>>(
        4, _omitFieldNames ? '' : 'imagesRawImages', $pb.PbFieldType.PY)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'stockQuantity', $pb.PbFieldType.O3)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'minStockThreshold', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'expirationDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddProductRequest clone() => AddProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddProductRequest copyWith(void Function(AddProductRequest) updates) =>
      super.copyWith((message) => updates(message as AddProductRequest))
          as AddProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddProductRequest create() => AddProductRequest._();
  @$core.override
  AddProductRequest createEmptyInstance() => create();
  static $pb.PbList<AddProductRequest> createRepeated() =>
      $pb.PbList<AddProductRequest>();
  @$core.pragma('dart2js:noInline')
  static AddProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddProductRequest>(create);
  static AddProductRequest? _defaultInstance;

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

  /// The unique identifier of the store.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// The price in XAF of the product.
  /// The currency is determined by the store.
  @$pb.TagNumber(3)
  $core.int get priceInXaf => $_getIZ(2);
  @$pb.TagNumber(3)
  set priceInXaf($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPriceInXaf() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriceInXaf() => $_clearField(3);

  /// The media ids of the images of the product.
  @$pb.TagNumber(4)
  $pb.PbList<$core.List<$core.int>> get imagesRawImages => $_getList(3);

  /// The stock quantity of the product.
  @$pb.TagNumber(5)
  $core.int get stockQuantity => $_getIZ(4);
  @$pb.TagNumber(5)
  set stockQuantity($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStockQuantity() => $_has(4);
  @$pb.TagNumber(5)
  void clearStockQuantity() => $_clearField(5);

  /// The minimum stock threshold of the product.
  @$pb.TagNumber(6)
  $core.int get minStockThreshold => $_getIZ(5);
  @$pb.TagNumber(6)
  set minStockThreshold($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMinStockThreshold() => $_has(5);
  @$pb.TagNumber(6)
  void clearMinStockThreshold() => $_clearField(6);

  /// The expiration date of the product.
  @$pb.TagNumber(7)
  $0.Timestamp get expirationDate => $_getN(6);
  @$pb.TagNumber(7)
  set expirationDate($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasExpirationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpirationDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureExpirationDate() => $_ensure(6);
}

class AddProductResponse extends $pb.GeneratedMessage {
  factory AddProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  AddProductResponse._();

  factory AddProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddProductResponse clone() => AddProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddProductResponse copyWith(void Function(AddProductResponse) updates) =>
      super.copyWith((message) => updates(message as AddProductResponse))
          as AddProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddProductResponse create() => AddProductResponse._();
  @$core.override
  AddProductResponse createEmptyInstance() => create();
  static $pb.PbList<AddProductResponse> createRepeated() =>
      $pb.PbList<AddProductResponse>();
  @$core.pragma('dart2js:noInline')
  static AddProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddProductResponse>(create);
  static AddProductResponse? _defaultInstance;

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

class GetProductRequest extends $pb.GeneratedMessage {
  factory GetProductRequest({
    $core.String? productId,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    return result;
  }

  GetProductRequest._();

  factory GetProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductRequest clone() => GetProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductRequest copyWith(void Function(GetProductRequest) updates) =>
      super.copyWith((message) => updates(message as GetProductRequest))
          as GetProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductRequest create() => GetProductRequest._();
  @$core.override
  GetProductRequest createEmptyInstance() => create();
  static $pb.PbList<GetProductRequest> createRepeated() =>
      $pb.PbList<GetProductRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProductRequest>(create);
  static GetProductRequest? _defaultInstance;

  /// The unique identifier of the store product.
  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);
}

class GetProductResponse extends $pb.GeneratedMessage {
  factory GetProductResponse({
    StoreProduct? product,
  }) {
    final result = create();
    if (product != null) result.product = product;
    return result;
  }

  GetProductResponse._();

  factory GetProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<StoreProduct>(1, _omitFieldNames ? '' : 'product',
        subBuilder: StoreProduct.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductResponse clone() => GetProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductResponse copyWith(void Function(GetProductResponse) updates) =>
      super.copyWith((message) => updates(message as GetProductResponse))
          as GetProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductResponse create() => GetProductResponse._();
  @$core.override
  GetProductResponse createEmptyInstance() => create();
  static $pb.PbList<GetProductResponse> createRepeated() =>
      $pb.PbList<GetProductResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProductResponse>(create);
  static GetProductResponse? _defaultInstance;

  /// The retrieved store product data.
  @$pb.TagNumber(1)
  StoreProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product(StoreProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreProduct ensureProduct() => $_ensure(0);
}

class UpdateProductRequest extends $pb.GeneratedMessage {
  factory UpdateProductRequest({
    StoreProduct? product,
    GlobalProduct? globalProduct,
    $core.Iterable<$core.List<$core.int>>? imagesRawImages,
  }) {
    final result = create();
    if (product != null) result.product = product;
    if (globalProduct != null) result.globalProduct = globalProduct;
    if (imagesRawImages != null) result.imagesRawImages.addAll(imagesRawImages);
    return result;
  }

  UpdateProductRequest._();

  factory UpdateProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<StoreProduct>(1, _omitFieldNames ? '' : 'product',
        subBuilder: StoreProduct.create)
    ..aOM<GlobalProduct>(2, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: GlobalProduct.create)
    ..p<$core.List<$core.int>>(
        3, _omitFieldNames ? '' : 'imagesRawImages', $pb.PbFieldType.PY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProductRequest clone() =>
      UpdateProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProductRequest copyWith(void Function(UpdateProductRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateProductRequest))
          as UpdateProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProductRequest create() => UpdateProductRequest._();
  @$core.override
  UpdateProductRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProductRequest> createRepeated() =>
      $pb.PbList<UpdateProductRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProductRequest>(create);
  static UpdateProductRequest? _defaultInstance;

  /// The store product information to update.
  /// Note:Only the fields that are set will be updated.
  /// Some fields cannot be updated like the product id, store id, and all
  /// product fields.
  @$pb.TagNumber(1)
  StoreProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product(StoreProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreProduct ensureProduct() => $_ensure(0);

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

class UpdateProductResponse extends $pb.GeneratedMessage {
  factory UpdateProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateProductResponse._();

  factory UpdateProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProductResponse clone() =>
      UpdateProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateProductResponse copyWith(
          void Function(UpdateProductResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateProductResponse))
          as UpdateProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProductResponse create() => UpdateProductResponse._();
  @$core.override
  UpdateProductResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProductResponse> createRepeated() =>
      $pb.PbList<UpdateProductResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateProductResponse>(create);
  static UpdateProductResponse? _defaultInstance;

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

class DeleteProductRequest extends $pb.GeneratedMessage {
  factory DeleteProductRequest({
    $core.String? storeProductId,
  }) {
    final result = create();
    if (storeProductId != null) result.storeProductId = storeProductId;
    return result;
  }

  DeleteProductRequest._();

  factory DeleteProductRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteProductRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProductRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeProductId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProductRequest clone() =>
      DeleteProductRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProductRequest copyWith(void Function(DeleteProductRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteProductRequest))
          as DeleteProductRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProductRequest create() => DeleteProductRequest._();
  @$core.override
  DeleteProductRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteProductRequest> createRepeated() =>
      $pb.PbList<DeleteProductRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteProductRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProductRequest>(create);
  static DeleteProductRequest? _defaultInstance;

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

class DeleteProductResponse extends $pb.GeneratedMessage {
  factory DeleteProductResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteProductResponse._();

  factory DeleteProductResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteProductResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteProductResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProductResponse clone() =>
      DeleteProductResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteProductResponse copyWith(
          void Function(DeleteProductResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteProductResponse))
          as DeleteProductResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProductResponse create() => DeleteProductResponse._();
  @$core.override
  DeleteProductResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteProductResponse> createRepeated() =>
      $pb.PbList<DeleteProductResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteProductResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteProductResponse>(create);
  static DeleteProductResponse? _defaultInstance;

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

class ProductServiceApi {
  final $pb.RpcClient _client;

  ProductServiceApi(this._client);

  /// Finds products by name.
  $async.Future<FindGlobalProductsResponse> findGlobalProducts(
          $pb.ClientContext? ctx, FindGlobalProductsRequest request) =>
      _client.invoke<FindGlobalProductsResponse>(ctx, 'ProductService',
          'FindGlobalProducts', request, FindGlobalProductsResponse());

  /// Finds categories by name.
  $async.Future<FindCategoryResponse> findCategory(
          $pb.ClientContext? ctx, FindCategoryRequest request) =>
      _client.invoke<FindCategoryResponse>(ctx, 'ProductService',
          'FindCategory', request, FindCategoryResponse());

  /// Adds a product to a store.
  $async.Future<AddProductResponse> addProduct(
          $pb.ClientContext? ctx, AddProductRequest request) =>
      _client.invoke<AddProductResponse>(
          ctx, 'ProductService', 'AddProduct', request, AddProductResponse());

  /// Gets a store product by id.
  $async.Future<GetProductResponse> getProduct(
          $pb.ClientContext? ctx, GetProductRequest request) =>
      _client.invoke<GetProductResponse>(
          ctx, 'ProductService', 'GetProduct', request, GetProductResponse());

  /// Updates a store product.
  $async.Future<UpdateProductResponse> updateProduct(
          $pb.ClientContext? ctx, UpdateProductRequest request) =>
      _client.invoke<UpdateProductResponse>(ctx, 'ProductService',
          'UpdateProduct', request, UpdateProductResponse());

  /// Deletes a store product.
  /// Only store products that are not in any orders can be deleted.
  $async.Future<DeleteProductResponse> deleteProduct(
          $pb.ClientContext? ctx, DeleteProductRequest request) =>
      _client.invoke<DeleteProductResponse>(ctx, 'ProductService',
          'DeleteProduct', request, DeleteProductResponse());

  /// Finds products by name.
  $async.Future<FindStoreProductsResponse> findStoreProducts(
          $pb.ClientContext? ctx, FindStoreProductsRequest request) =>
      _client.invoke<FindStoreProductsResponse>(ctx, 'ProductService',
          'FindStoreProducts', request, FindStoreProductsResponse());

  /// Streams all products for a store for real-time updates.
  $async.Future<StreamStoreProductsResponse> streamStoreProducts(
          $pb.ClientContext? ctx, StreamStoreProductsRequest request) =>
      _client.invoke<StreamStoreProductsResponse>(ctx, 'ProductService',
          'StreamStoreProducts', request, StreamStoreProductsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
