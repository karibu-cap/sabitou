//
//  Generated code. Do not modify.
//  source: business/v1/supplier.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../link/v1/link.pb.dart' as $5;

class Link extends $pb.GeneratedMessage {
  factory Link({
    $core.String? label,
    $core.String? url,
  }) {
    final $result = create();
    if (label != null) {
      $result.label = label;
    }
    if (url != null) {
      $result.url = url;
    }
    return $result;
  }
  Link._() : super();
  factory Link.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Link.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Link', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Link clone() => Link()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Link copyWith(void Function(Link) updates) => super.copyWith((message) => updates(message as Link)) as Link;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Link create() => Link._();
  Link createEmptyInstance() => create();
  static $pb.PbList<Link> createRepeated() => $pb.PbList<Link>();
  @$core.pragma('dart2js:noInline')
  static Link getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Link>(create);
  static Link? _defaultInstance;

  /// The label of the link.
  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => clearField(1);

  /// The url of the link.
  /// Todo: We must automatically retrieve the icon of the link.
  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => clearField(2);
}

class Supplier extends $pb.GeneratedMessage {
  factory Supplier({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    $core.String? logoMediaId,
    $core.Iterable<$core.String>? externalLinksIds,
    $core.String? businessId,
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
    if (logoMediaId != null) {
      $result.logoMediaId = logoMediaId;
    }
    if (externalLinksIds != null) {
      $result.externalLinksIds.addAll(externalLinksIds);
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  Supplier._() : super();
  factory Supplier.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Supplier.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Supplier', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'logoMediaId')
    ..pPS(5, _omitFieldNames ? '' : 'externalLinksIds')
    ..aOS(6, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Supplier clone() => Supplier()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Supplier copyWith(void Function(Supplier) updates) => super.copyWith((message) => updates(message as Supplier)) as Supplier;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Supplier create() => Supplier._();
  Supplier createEmptyInstance() => create();
  static $pb.PbList<Supplier> createRepeated() => $pb.PbList<Supplier>();
  @$core.pragma('dart2js:noInline')
  static Supplier getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Supplier>(create);
  static Supplier? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The name of the supplier.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// The description of the supplier.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  /// The id of the media of the logo of the supplier.
  @$pb.TagNumber(4)
  $core.String get logoMediaId => $_getSZ(3);
  @$pb.TagNumber(4)
  set logoMediaId($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasLogoMediaId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoMediaId() => clearField(4);

  /// The links of the supplier.
  @$pb.TagNumber(5)
  $core.List<$core.String> get externalLinksIds => $_getList(4);

  /// The id of the business of the supplier.
  @$pb.TagNumber(6)
  $core.String get businessId => $_getSZ(5);
  @$pb.TagNumber(6)
  set businessId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasBusinessId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBusinessId() => clearField(6);
}

class CreateSupplierRequest extends $pb.GeneratedMessage {
  factory CreateSupplierRequest({
    Supplier? supplier,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$5.ResourceLink>? externalLinks,
  }) {
    final $result = create();
    if (supplier != null) {
      $result.supplier = supplier;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    if (externalLinks != null) {
      $result.externalLinks.addAll(externalLinks);
    }
    return $result;
  }
  CreateSupplierRequest._() : super();
  factory CreateSupplierRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSupplierRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSupplierRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier', subBuilder: Supplier.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..pc<$5.ResourceLink>(5, _omitFieldNames ? '' : 'externalLinks', $pb.PbFieldType.PM, subBuilder: $5.ResourceLink.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSupplierRequest clone() => CreateSupplierRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSupplierRequest copyWith(void Function(CreateSupplierRequest) updates) => super.copyWith((message) => updates(message as CreateSupplierRequest)) as CreateSupplierRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSupplierRequest create() => CreateSupplierRequest._();
  CreateSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSupplierRequest> createRepeated() => $pb.PbList<CreateSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSupplierRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSupplierRequest>(create);
  static CreateSupplierRequest? _defaultInstance;

  /// The supplier information to create.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);

  /// The raw image of the logo of the supplier.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);

  /// The links of the supplier.
  @$pb.TagNumber(5)
  $core.List<$5.ResourceLink> get externalLinks => $_getList(2);
}

class CreateSupplierResponse extends $pb.GeneratedMessage {
  factory CreateSupplierResponse({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  CreateSupplierResponse._() : super();
  factory CreateSupplierResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateSupplierResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateSupplierResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateSupplierResponse clone() => CreateSupplierResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateSupplierResponse copyWith(void Function(CreateSupplierResponse) updates) => super.copyWith((message) => updates(message as CreateSupplierResponse)) as CreateSupplierResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSupplierResponse create() => CreateSupplierResponse._();
  CreateSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSupplierResponse> createRepeated() => $pb.PbList<CreateSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSupplierResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateSupplierResponse>(create);
  static CreateSupplierResponse? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class GetSupplierRequest extends $pb.GeneratedMessage {
  factory GetSupplierRequest({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  GetSupplierRequest._() : super();
  factory GetSupplierRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSupplierRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSupplierRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSupplierRequest clone() => GetSupplierRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSupplierRequest copyWith(void Function(GetSupplierRequest) updates) => super.copyWith((message) => updates(message as GetSupplierRequest)) as GetSupplierRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSupplierRequest create() => GetSupplierRequest._();
  GetSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<GetSupplierRequest> createRepeated() => $pb.PbList<GetSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSupplierRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSupplierRequest>(create);
  static GetSupplierRequest? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class GetSupplierResponse extends $pb.GeneratedMessage {
  factory GetSupplierResponse({
    Supplier? supplier,
  }) {
    final $result = create();
    if (supplier != null) {
      $result.supplier = supplier;
    }
    return $result;
  }
  GetSupplierResponse._() : super();
  factory GetSupplierResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetSupplierResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetSupplierResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier', subBuilder: Supplier.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetSupplierResponse clone() => GetSupplierResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetSupplierResponse copyWith(void Function(GetSupplierResponse) updates) => super.copyWith((message) => updates(message as GetSupplierResponse)) as GetSupplierResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSupplierResponse create() => GetSupplierResponse._();
  GetSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<GetSupplierResponse> createRepeated() => $pb.PbList<GetSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSupplierResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetSupplierResponse>(create);
  static GetSupplierResponse? _defaultInstance;

  /// The retrieved supplier data.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);
}

class GetBusinessSuppliersRequest extends $pb.GeneratedMessage {
  factory GetBusinessSuppliersRequest({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  GetBusinessSuppliersRequest._() : super();
  factory GetBusinessSuppliersRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessSuppliersRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessSuppliersRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessSuppliersRequest clone() => GetBusinessSuppliersRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessSuppliersRequest copyWith(void Function(GetBusinessSuppliersRequest) updates) => super.copyWith((message) => updates(message as GetBusinessSuppliersRequest)) as GetBusinessSuppliersRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessSuppliersRequest create() => GetBusinessSuppliersRequest._();
  GetBusinessSuppliersRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessSuppliersRequest> createRepeated() => $pb.PbList<GetBusinessSuppliersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessSuppliersRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessSuppliersRequest>(create);
  static GetBusinessSuppliersRequest? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class GetBusinessSuppliersResponse extends $pb.GeneratedMessage {
  factory GetBusinessSuppliersResponse({
    $core.Iterable<Supplier>? suppliers,
  }) {
    final $result = create();
    if (suppliers != null) {
      $result.suppliers.addAll(suppliers);
    }
    return $result;
  }
  GetBusinessSuppliersResponse._() : super();
  factory GetBusinessSuppliersResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessSuppliersResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessSuppliersResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..pc<Supplier>(1, _omitFieldNames ? '' : 'suppliers', $pb.PbFieldType.PM, subBuilder: Supplier.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessSuppliersResponse clone() => GetBusinessSuppliersResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessSuppliersResponse copyWith(void Function(GetBusinessSuppliersResponse) updates) => super.copyWith((message) => updates(message as GetBusinessSuppliersResponse)) as GetBusinessSuppliersResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessSuppliersResponse create() => GetBusinessSuppliersResponse._();
  GetBusinessSuppliersResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessSuppliersResponse> createRepeated() => $pb.PbList<GetBusinessSuppliersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessSuppliersResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessSuppliersResponse>(create);
  static GetBusinessSuppliersResponse? _defaultInstance;

  /// The list of suppliers of the business.
  /// Note: Only the ids and names of the suppliers are returned.
  @$pb.TagNumber(1)
  $core.List<Supplier> get suppliers => $_getList(0);
}

class UpdateSupplierRequest extends $pb.GeneratedMessage {
  factory UpdateSupplierRequest({
    Supplier? supplier,
    $core.List<$core.int>? logoRawImage,
  }) {
    final $result = create();
    if (supplier != null) {
      $result.supplier = supplier;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    return $result;
  }
  UpdateSupplierRequest._() : super();
  factory UpdateSupplierRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSupplierRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSupplierRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier', subBuilder: Supplier.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSupplierRequest clone() => UpdateSupplierRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSupplierRequest copyWith(void Function(UpdateSupplierRequest) updates) => super.copyWith((message) => updates(message as UpdateSupplierRequest)) as UpdateSupplierRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSupplierRequest create() => UpdateSupplierRequest._();
  UpdateSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSupplierRequest> createRepeated() => $pb.PbList<UpdateSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSupplierRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSupplierRequest>(create);
  static UpdateSupplierRequest? _defaultInstance;

  /// The supplier information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);

  /// The raw image of the logo of the supplier.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);
}

class UpdateSupplierResponse extends $pb.GeneratedMessage {
  factory UpdateSupplierResponse({
    Supplier? supplier,
  }) {
    final $result = create();
    if (supplier != null) {
      $result.supplier = supplier;
    }
    return $result;
  }
  UpdateSupplierResponse._() : super();
  factory UpdateSupplierResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateSupplierResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateSupplierResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier', subBuilder: Supplier.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateSupplierResponse clone() => UpdateSupplierResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateSupplierResponse copyWith(void Function(UpdateSupplierResponse) updates) => super.copyWith((message) => updates(message as UpdateSupplierResponse)) as UpdateSupplierResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSupplierResponse create() => UpdateSupplierResponse._();
  UpdateSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSupplierResponse> createRepeated() => $pb.PbList<UpdateSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSupplierResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateSupplierResponse>(create);
  static UpdateSupplierResponse? _defaultInstance;

  /// The updated supplier data.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);
}

class DeleteSupplierRequest extends $pb.GeneratedMessage {
  factory DeleteSupplierRequest({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  DeleteSupplierRequest._() : super();
  factory DeleteSupplierRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSupplierRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSupplierRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSupplierRequest clone() => DeleteSupplierRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSupplierRequest copyWith(void Function(DeleteSupplierRequest) updates) => super.copyWith((message) => updates(message as DeleteSupplierRequest)) as DeleteSupplierRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSupplierRequest create() => DeleteSupplierRequest._();
  DeleteSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSupplierRequest> createRepeated() => $pb.PbList<DeleteSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSupplierRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSupplierRequest>(create);
  static DeleteSupplierRequest? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class DeleteSupplierResponse extends $pb.GeneratedMessage {
  factory DeleteSupplierResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteSupplierResponse._() : super();
  factory DeleteSupplierResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteSupplierResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteSupplierResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'business.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteSupplierResponse clone() => DeleteSupplierResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteSupplierResponse copyWith(void Function(DeleteSupplierResponse) updates) => super.copyWith((message) => updates(message as DeleteSupplierResponse)) as DeleteSupplierResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSupplierResponse create() => DeleteSupplierResponse._();
  DeleteSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSupplierResponse> createRepeated() => $pb.PbList<DeleteSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSupplierResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteSupplierResponse>(create);
  static DeleteSupplierResponse? _defaultInstance;

  /// Whether the supplier was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class SupplierServiceApi {
  $pb.RpcClient _client;
  SupplierServiceApi(this._client);

  $async.Future<CreateSupplierResponse> createSupplier($pb.ClientContext? ctx, CreateSupplierRequest request) =>
    _client.invoke<CreateSupplierResponse>(ctx, 'SupplierService', 'CreateSupplier', request, CreateSupplierResponse())
  ;
  $async.Future<GetSupplierResponse> getSupplier($pb.ClientContext? ctx, GetSupplierRequest request) =>
    _client.invoke<GetSupplierResponse>(ctx, 'SupplierService', 'GetSupplier', request, GetSupplierResponse())
  ;
  $async.Future<GetBusinessSuppliersResponse> getBusinessSuppliers($pb.ClientContext? ctx, GetBusinessSuppliersRequest request) =>
    _client.invoke<GetBusinessSuppliersResponse>(ctx, 'SupplierService', 'GetBusinessSuppliers', request, GetBusinessSuppliersResponse())
  ;
  $async.Future<UpdateSupplierResponse> updateSupplier($pb.ClientContext? ctx, UpdateSupplierRequest request) =>
    _client.invoke<UpdateSupplierResponse>(ctx, 'SupplierService', 'UpdateSupplier', request, UpdateSupplierResponse())
  ;
  $async.Future<DeleteSupplierResponse> deleteSupplier($pb.ClientContext? ctx, DeleteSupplierRequest request) =>
    _client.invoke<DeleteSupplierResponse>(ctx, 'SupplierService', 'DeleteSupplier', request, DeleteSupplierResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
