//
//  Generated code. Do not modify.
//  source: inventory/v1/product.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ProductCategory extends $pb.GeneratedMessage {
  factory ProductCategory({
    $core.String? refId,
    $core.String? name,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (name != null) {
      $result.name = name;
    }
    return $result;
  }
  ProductCategory._() : super();
  factory ProductCategory.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ProductCategory.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ProductCategory', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ProductCategory clone() => ProductCategory()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ProductCategory copyWith(void Function(ProductCategory) updates) => super.copyWith((message) => updates(message as ProductCategory)) as ProductCategory;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProductCategory create() => ProductCategory._();
  ProductCategory createEmptyInstance() => create();
  static $pb.PbList<ProductCategory> createRepeated() => $pb.PbList<ProductCategory>();
  @$core.pragma('dart2js:noInline')
  static ProductCategory getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ProductCategory>(create);
  static ProductCategory? _defaultInstance;

  /// The unique identifier of the product category.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The name of the product category.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);
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
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (barCodeValue != null) {
      $result.barCodeValue = barCodeValue;
    }
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    if (imagesLinksIds != null) {
      $result.imagesLinksIds.addAll(imagesLinksIds);
    }
    return $result;
  }
  GlobalProduct._() : super();
  factory GlobalProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GlobalProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GlobalProduct', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'barCodeValue')
    ..pc<ProductCategory>(5, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM, subBuilder: ProductCategory.create)
    ..pPS(6, _omitFieldNames ? '' : 'imagesLinksIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GlobalProduct clone() => GlobalProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GlobalProduct copyWith(void Function(GlobalProduct) updates) => super.copyWith((message) => updates(message as GlobalProduct)) as GlobalProduct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GlobalProduct create() => GlobalProduct._();
  GlobalProduct createEmptyInstance() => create();
  static $pb.PbList<GlobalProduct> createRepeated() => $pb.PbList<GlobalProduct>();
  @$core.pragma('dart2js:noInline')
  static GlobalProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GlobalProduct>(create);
  static GlobalProduct? _defaultInstance;

  /// The unique identifier of the product.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The name of the product.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// The description of the product.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  /// The bar code value of the product.
  @$pb.TagNumber(4)
  $core.String get barCodeValue => $_getSZ(3);
  @$pb.TagNumber(4)
  set barCodeValue($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasBarCodeValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearBarCodeValue() => clearField(4);

  /// The product categories of the product.
  @$pb.TagNumber(5)
  $core.List<ProductCategory> get categories => $_getList(4);

  /// The list of image related to the product.
  @$pb.TagNumber(6)
  $core.List<$core.String> get imagesLinksIds => $_getList(5);
}

class BusinessProduct extends $pb.GeneratedMessage {
  factory BusinessProduct({
    $core.String? refId,
    $core.String? businessId,
    $core.String? globalProductId,
    $core.int? priceInCents,
    $core.Iterable<$core.String>? imagesLinkIds,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    if (globalProductId != null) {
      $result.globalProductId = globalProductId;
    }
    if (priceInCents != null) {
      $result.priceInCents = priceInCents;
    }
    if (imagesLinkIds != null) {
      $result.imagesLinkIds.addAll(imagesLinkIds);
    }
    return $result;
  }
  BusinessProduct._() : super();
  factory BusinessProduct.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory BusinessProduct.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'BusinessProduct', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..aOS(3, _omitFieldNames ? '' : 'globalProductId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'priceInCents', $pb.PbFieldType.O3)
    ..pPS(5, _omitFieldNames ? '' : 'imagesLinkIds')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  BusinessProduct clone() => BusinessProduct()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  BusinessProduct copyWith(void Function(BusinessProduct) updates) => super.copyWith((message) => updates(message as BusinessProduct)) as BusinessProduct;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessProduct create() => BusinessProduct._();
  BusinessProduct createEmptyInstance() => create();
  static $pb.PbList<BusinessProduct> createRepeated() => $pb.PbList<BusinessProduct>();
  @$core.pragma('dart2js:noInline')
  static BusinessProduct getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<BusinessProduct>(create);
  static BusinessProduct? _defaultInstance;

  /// The unique identifier of the business product.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => clearField(2);

  /// The unique identifier of the global product.
  @$pb.TagNumber(3)
  $core.String get globalProductId => $_getSZ(2);
  @$pb.TagNumber(3)
  set globalProductId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasGlobalProductId() => $_has(2);
  @$pb.TagNumber(3)
  void clearGlobalProductId() => clearField(3);

  /// The price in cents of the product.
  /// The currency is determined by the business.
  @$pb.TagNumber(4)
  $core.int get priceInCents => $_getIZ(3);
  @$pb.TagNumber(4)
  set priceInCents($core.int v) { $_setSignedInt32(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasPriceInCents() => $_has(3);
  @$pb.TagNumber(4)
  void clearPriceInCents() => clearField(4);

  /// The media ids of the images of the product.
  @$pb.TagNumber(5)
  $core.List<$core.String> get imagesLinkIds => $_getList(4);
}

class FindGlobalProductsRequest extends $pb.GeneratedMessage {
  factory FindGlobalProductsRequest({
    $core.String? query,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  FindGlobalProductsRequest._() : super();
  factory FindGlobalProductsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindGlobalProductsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindGlobalProductsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindGlobalProductsRequest clone() => FindGlobalProductsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindGlobalProductsRequest copyWith(void Function(FindGlobalProductsRequest) updates) => super.copyWith((message) => updates(message as FindGlobalProductsRequest)) as FindGlobalProductsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsRequest create() => FindGlobalProductsRequest._();
  FindGlobalProductsRequest createEmptyInstance() => create();
  static $pb.PbList<FindGlobalProductsRequest> createRepeated() => $pb.PbList<FindGlobalProductsRequest>();
  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindGlobalProductsRequest>(create);
  static FindGlobalProductsRequest? _defaultInstance;

  /// The query to search for products.
  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
}

class FindGlobalProductsResponse extends $pb.GeneratedMessage {
  factory FindGlobalProductsResponse({
    $core.Iterable<GlobalProduct>? products,
  }) {
    final $result = create();
    if (products != null) {
      $result.products.addAll(products);
    }
    return $result;
  }
  FindGlobalProductsResponse._() : super();
  factory FindGlobalProductsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindGlobalProductsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindGlobalProductsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..pc<GlobalProduct>(1, _omitFieldNames ? '' : 'products', $pb.PbFieldType.PM, subBuilder: GlobalProduct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindGlobalProductsResponse clone() => FindGlobalProductsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindGlobalProductsResponse copyWith(void Function(FindGlobalProductsResponse) updates) => super.copyWith((message) => updates(message as FindGlobalProductsResponse)) as FindGlobalProductsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsResponse create() => FindGlobalProductsResponse._();
  FindGlobalProductsResponse createEmptyInstance() => create();
  static $pb.PbList<FindGlobalProductsResponse> createRepeated() => $pb.PbList<FindGlobalProductsResponse>();
  @$core.pragma('dart2js:noInline')
  static FindGlobalProductsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindGlobalProductsResponse>(create);
  static FindGlobalProductsResponse? _defaultInstance;

  /// The unique identifiers of the products.
  /// WARN: all returned products will only have their id and name.
  @$pb.TagNumber(1)
  $core.List<GlobalProduct> get products => $_getList(0);
}

class FindCategoryRequest extends $pb.GeneratedMessage {
  factory FindCategoryRequest({
    $core.String? query,
  }) {
    final $result = create();
    if (query != null) {
      $result.query = query;
    }
    return $result;
  }
  FindCategoryRequest._() : super();
  factory FindCategoryRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindCategoryRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindCategoryRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'query')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindCategoryRequest clone() => FindCategoryRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindCategoryRequest copyWith(void Function(FindCategoryRequest) updates) => super.copyWith((message) => updates(message as FindCategoryRequest)) as FindCategoryRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest create() => FindCategoryRequest._();
  FindCategoryRequest createEmptyInstance() => create();
  static $pb.PbList<FindCategoryRequest> createRepeated() => $pb.PbList<FindCategoryRequest>();
  @$core.pragma('dart2js:noInline')
  static FindCategoryRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindCategoryRequest>(create);
  static FindCategoryRequest? _defaultInstance;

  /// The query to search for product categories.
  @$pb.TagNumber(1)
  $core.String get query => $_getSZ(0);
  @$pb.TagNumber(1)
  set query($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasQuery() => $_has(0);
  @$pb.TagNumber(1)
  void clearQuery() => clearField(1);
}

class FindCategoryResponse extends $pb.GeneratedMessage {
  factory FindCategoryResponse({
    $core.Iterable<ProductCategory>? categories,
  }) {
    final $result = create();
    if (categories != null) {
      $result.categories.addAll(categories);
    }
    return $result;
  }
  FindCategoryResponse._() : super();
  factory FindCategoryResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory FindCategoryResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'FindCategoryResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..pc<ProductCategory>(1, _omitFieldNames ? '' : 'categories', $pb.PbFieldType.PM, subBuilder: ProductCategory.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  FindCategoryResponse clone() => FindCategoryResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  FindCategoryResponse copyWith(void Function(FindCategoryResponse) updates) => super.copyWith((message) => updates(message as FindCategoryResponse)) as FindCategoryResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindCategoryResponse create() => FindCategoryResponse._();
  FindCategoryResponse createEmptyInstance() => create();
  static $pb.PbList<FindCategoryResponse> createRepeated() => $pb.PbList<FindCategoryResponse>();
  @$core.pragma('dart2js:noInline')
  static FindCategoryResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<FindCategoryResponse>(create);
  static FindCategoryResponse? _defaultInstance;

  /// The unique identifiers of the product categories.
  /// WARN: all returned product categories will only have their id and name.
  @$pb.TagNumber(1)
  $core.List<ProductCategory> get categories => $_getList(0);
}

class AddProductRequest extends $pb.GeneratedMessage {
  factory AddProductRequest({
    GlobalProduct? globalProduct,
    $core.String? businessId,
    $core.int? priceInCents,
    $core.Iterable<$core.List<$core.int>>? imagesRawImages,
  }) {
    final $result = create();
    if (globalProduct != null) {
      $result.globalProduct = globalProduct;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    if (priceInCents != null) {
      $result.priceInCents = priceInCents;
    }
    if (imagesRawImages != null) {
      $result.imagesRawImages.addAll(imagesRawImages);
    }
    return $result;
  }
  AddProductRequest._() : super();
  factory AddProductRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddProductRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddProductRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOM<GlobalProduct>(1, _omitFieldNames ? '' : 'globalProduct', subBuilder: GlobalProduct.create)
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'priceInCents', $pb.PbFieldType.O3)
    ..p<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'imagesRawImages', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddProductRequest clone() => AddProductRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddProductRequest copyWith(void Function(AddProductRequest) updates) => super.copyWith((message) => updates(message as AddProductRequest)) as AddProductRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddProductRequest create() => AddProductRequest._();
  AddProductRequest createEmptyInstance() => create();
  static $pb.PbList<AddProductRequest> createRepeated() => $pb.PbList<AddProductRequest>();
  @$core.pragma('dart2js:noInline')
  static AddProductRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddProductRequest>(create);
  static AddProductRequest? _defaultInstance;

  /// The product to add.
  /// If the product does not exist, it will be created.
  @$pb.TagNumber(1)
  GlobalProduct get globalProduct => $_getN(0);
  @$pb.TagNumber(1)
  set globalProduct(GlobalProduct v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasGlobalProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearGlobalProduct() => clearField(1);
  @$pb.TagNumber(1)
  GlobalProduct ensureGlobalProduct() => $_ensure(0);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => clearField(2);

  /// The price in cents of the product.
  /// The currency is determined by the business.
  @$pb.TagNumber(3)
  $core.int get priceInCents => $_getIZ(2);
  @$pb.TagNumber(3)
  set priceInCents($core.int v) { $_setSignedInt32(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPriceInCents() => $_has(2);
  @$pb.TagNumber(3)
  void clearPriceInCents() => clearField(3);

  /// The media ids of the images of the product.
  @$pb.TagNumber(4)
  $core.List<$core.List<$core.int>> get imagesRawImages => $_getList(3);
}

class AddProductResponse extends $pb.GeneratedMessage {
  factory AddProductResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  AddProductResponse._() : super();
  factory AddProductResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddProductResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddProductResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddProductResponse clone() => AddProductResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddProductResponse copyWith(void Function(AddProductResponse) updates) => super.copyWith((message) => updates(message as AddProductResponse)) as AddProductResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddProductResponse create() => AddProductResponse._();
  AddProductResponse createEmptyInstance() => create();
  static $pb.PbList<AddProductResponse> createRepeated() => $pb.PbList<AddProductResponse>();
  @$core.pragma('dart2js:noInline')
  static AddProductResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddProductResponse>(create);
  static AddProductResponse? _defaultInstance;

  /// Whether the product was successfully added.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class GetProductRequest extends $pb.GeneratedMessage {
  factory GetProductRequest({
    $core.String? productId,
  }) {
    final $result = create();
    if (productId != null) {
      $result.productId = productId;
    }
    return $result;
  }
  GetProductRequest._() : super();
  factory GetProductRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProductRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProductRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProductRequest clone() => GetProductRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProductRequest copyWith(void Function(GetProductRequest) updates) => super.copyWith((message) => updates(message as GetProductRequest)) as GetProductRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductRequest create() => GetProductRequest._();
  GetProductRequest createEmptyInstance() => create();
  static $pb.PbList<GetProductRequest> createRepeated() => $pb.PbList<GetProductRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProductRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProductRequest>(create);
  static GetProductRequest? _defaultInstance;

  /// The unique identifier of the business product.
  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => clearField(1);
}

class GetProductResponse extends $pb.GeneratedMessage {
  factory GetProductResponse({
    BusinessProduct? product,
  }) {
    final $result = create();
    if (product != null) {
      $result.product = product;
    }
    return $result;
  }
  GetProductResponse._() : super();
  factory GetProductResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetProductResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetProductResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOM<BusinessProduct>(1, _omitFieldNames ? '' : 'product', subBuilder: BusinessProduct.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetProductResponse clone() => GetProductResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetProductResponse copyWith(void Function(GetProductResponse) updates) => super.copyWith((message) => updates(message as GetProductResponse)) as GetProductResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductResponse create() => GetProductResponse._();
  GetProductResponse createEmptyInstance() => create();
  static $pb.PbList<GetProductResponse> createRepeated() => $pb.PbList<GetProductResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProductResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetProductResponse>(create);
  static GetProductResponse? _defaultInstance;

  /// The retrieved business product data.
  @$pb.TagNumber(1)
  BusinessProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product(BusinessProduct v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => clearField(1);
  @$pb.TagNumber(1)
  BusinessProduct ensureProduct() => $_ensure(0);
}

class UpdateProductRequest extends $pb.GeneratedMessage {
  factory UpdateProductRequest({
    BusinessProduct? product,
    $core.Iterable<$core.List<$core.int>>? imagesRawImages,
  }) {
    final $result = create();
    if (product != null) {
      $result.product = product;
    }
    if (imagesRawImages != null) {
      $result.imagesRawImages.addAll(imagesRawImages);
    }
    return $result;
  }
  UpdateProductRequest._() : super();
  factory UpdateProductRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProductRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOM<BusinessProduct>(1, _omitFieldNames ? '' : 'product', subBuilder: BusinessProduct.create)
    ..p<$core.List<$core.int>>(4, _omitFieldNames ? '' : 'imagesRawImages', $pb.PbFieldType.PY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProductRequest clone() => UpdateProductRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProductRequest copyWith(void Function(UpdateProductRequest) updates) => super.copyWith((message) => updates(message as UpdateProductRequest)) as UpdateProductRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProductRequest create() => UpdateProductRequest._();
  UpdateProductRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateProductRequest> createRepeated() => $pb.PbList<UpdateProductRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateProductRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProductRequest>(create);
  static UpdateProductRequest? _defaultInstance;

  /// The business product information to update.
  /// Note:Only the fields that are set will be updated.
  /// Some fields cannot be updated like the product id, business id, and all
  /// product fields.
  @$pb.TagNumber(1)
  BusinessProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product(BusinessProduct v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => clearField(1);
  @$pb.TagNumber(1)
  BusinessProduct ensureProduct() => $_ensure(0);

  /// The media ids of the images of the product.
  @$pb.TagNumber(4)
  $core.List<$core.List<$core.int>> get imagesRawImages => $_getList(1);
}

class UpdateProductResponse extends $pb.GeneratedMessage {
  factory UpdateProductResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdateProductResponse._() : super();
  factory UpdateProductResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateProductResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateProductResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateProductResponse clone() => UpdateProductResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateProductResponse copyWith(void Function(UpdateProductResponse) updates) => super.copyWith((message) => updates(message as UpdateProductResponse)) as UpdateProductResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateProductResponse create() => UpdateProductResponse._();
  UpdateProductResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateProductResponse> createRepeated() => $pb.PbList<UpdateProductResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateProductResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateProductResponse>(create);
  static UpdateProductResponse? _defaultInstance;

  /// Whether the business product was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class DeleteProductRequest extends $pb.GeneratedMessage {
  factory DeleteProductRequest({
    $core.String? productId,
  }) {
    final $result = create();
    if (productId != null) {
      $result.productId = productId;
    }
    return $result;
  }
  DeleteProductRequest._() : super();
  factory DeleteProductRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteProductRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteProductRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteProductRequest clone() => DeleteProductRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteProductRequest copyWith(void Function(DeleteProductRequest) updates) => super.copyWith((message) => updates(message as DeleteProductRequest)) as DeleteProductRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProductRequest create() => DeleteProductRequest._();
  DeleteProductRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteProductRequest> createRepeated() => $pb.PbList<DeleteProductRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteProductRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteProductRequest>(create);
  static DeleteProductRequest? _defaultInstance;

  /// The unique identifier of the business product.
  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => clearField(1);
}

class DeleteProductResponse extends $pb.GeneratedMessage {
  factory DeleteProductResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteProductResponse._() : super();
  factory DeleteProductResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteProductResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteProductResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteProductResponse clone() => DeleteProductResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteProductResponse copyWith(void Function(DeleteProductResponse) updates) => super.copyWith((message) => updates(message as DeleteProductResponse)) as DeleteProductResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteProductResponse create() => DeleteProductResponse._();
  DeleteProductResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteProductResponse> createRepeated() => $pb.PbList<DeleteProductResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteProductResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteProductResponse>(create);
  static DeleteProductResponse? _defaultInstance;

  /// Whether the business product was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class ProductServiceApi {
  $pb.RpcClient _client;
  ProductServiceApi(this._client);

  $async.Future<FindGlobalProductsResponse> findGlobalProducts($pb.ClientContext? ctx, FindGlobalProductsRequest request) =>
    _client.invoke<FindGlobalProductsResponse>(ctx, 'ProductService', 'FindGlobalProducts', request, FindGlobalProductsResponse())
  ;
  $async.Future<FindCategoryResponse> findCategory($pb.ClientContext? ctx, FindCategoryRequest request) =>
    _client.invoke<FindCategoryResponse>(ctx, 'ProductService', 'FindCategory', request, FindCategoryResponse())
  ;
  $async.Future<AddProductResponse> addProduct($pb.ClientContext? ctx, AddProductRequest request) =>
    _client.invoke<AddProductResponse>(ctx, 'ProductService', 'AddProduct', request, AddProductResponse())
  ;
  $async.Future<GetProductResponse> getProduct($pb.ClientContext? ctx, GetProductRequest request) =>
    _client.invoke<GetProductResponse>(ctx, 'ProductService', 'GetProduct', request, GetProductResponse())
  ;
  $async.Future<UpdateProductResponse> updateProduct($pb.ClientContext? ctx, UpdateProductRequest request) =>
    _client.invoke<UpdateProductResponse>(ctx, 'ProductService', 'UpdateProduct', request, UpdateProductResponse())
  ;
  $async.Future<DeleteProductResponse> deleteProduct($pb.ClientContext? ctx, DeleteProductRequest request) =>
    _client.invoke<DeleteProductResponse>(ctx, 'ProductService', 'DeleteProduct', request, DeleteProductResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
