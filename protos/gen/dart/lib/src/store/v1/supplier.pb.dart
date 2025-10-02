// This is a generated file - do not edit.
//
// Generated from store/v1/supplier.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../link/v1/link.pb.dart' as $0;
import 'supplier.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'supplier.pbenum.dart';

class Link extends $pb.GeneratedMessage {
  factory Link({
    $core.String? label,
    $core.String? url,
  }) {
    final result = create();
    if (label != null) result.label = label;
    if (url != null) result.url = url;
    return result;
  }

  Link._();

  factory Link.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Link.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Link',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'label')
    ..aOS(2, _omitFieldNames ? '' : 'url')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Link clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Link copyWith(void Function(Link) updates) =>
      super.copyWith((message) => updates(message as Link)) as Link;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Link create() => Link._();
  @$core.override
  Link createEmptyInstance() => create();
  static $pb.PbList<Link> createRepeated() => $pb.PbList<Link>();
  @$core.pragma('dart2js:noInline')
  static Link getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Link>(create);
  static Link? _defaultInstance;

  /// The label of the link.
  @$pb.TagNumber(1)
  $core.String get label => $_getSZ(0);
  @$pb.TagNumber(1)
  set label($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasLabel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLabel() => $_clearField(1);

  /// The url of the link.
  /// Todo: We must automatically retrieve the icon of the link.
  @$pb.TagNumber(2)
  $core.String get url => $_getSZ(1);
  @$pb.TagNumber(2)
  set url($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUrl() => $_has(1);
  @$pb.TagNumber(2)
  void clearUrl() => $_clearField(2);
}

class Supplier extends $pb.GeneratedMessage {
  factory Supplier({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    $core.String? logoLinkId,
    $core.Iterable<$core.String>? externalLinksIds,
    $core.String? contactPhone,
    $core.String? contactEmail,
    $core.String? contactAddress,
    SupplierStatus? status,
    $core.Iterable<$core.String>? storeIds,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (logoLinkId != null) result.logoLinkId = logoLinkId;
    if (externalLinksIds != null)
      result.externalLinksIds.addAll(externalLinksIds);
    if (contactPhone != null) result.contactPhone = contactPhone;
    if (contactEmail != null) result.contactEmail = contactEmail;
    if (contactAddress != null) result.contactAddress = contactAddress;
    if (status != null) result.status = status;
    if (storeIds != null) result.storeIds.addAll(storeIds);
    return result;
  }

  Supplier._();

  factory Supplier.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Supplier.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Supplier',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..aOS(4, _omitFieldNames ? '' : 'logoLinkId')
    ..pPS(5, _omitFieldNames ? '' : 'externalLinksIds')
    ..aOS(6, _omitFieldNames ? '' : 'contactPhone')
    ..aOS(7, _omitFieldNames ? '' : 'contactEmail')
    ..aOS(8, _omitFieldNames ? '' : 'contactAddress')
    ..aE<SupplierStatus>(9, _omitFieldNames ? '' : 'status',
        enumValues: SupplierStatus.values)
    ..pPS(10, _omitFieldNames ? '' : 'storeIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Supplier clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Supplier copyWith(void Function(Supplier) updates) =>
      super.copyWith((message) => updates(message as Supplier)) as Supplier;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Supplier create() => Supplier._();
  @$core.override
  Supplier createEmptyInstance() => create();
  static $pb.PbList<Supplier> createRepeated() => $pb.PbList<Supplier>();
  @$core.pragma('dart2js:noInline')
  static Supplier getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Supplier>(create);
  static Supplier? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the supplier.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// The description of the supplier.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// The id of the media of the logo of the supplier.
  @$pb.TagNumber(4)
  $core.String get logoLinkId => $_getSZ(3);
  @$pb.TagNumber(4)
  set logoLinkId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLogoLinkId() => $_has(3);
  @$pb.TagNumber(4)
  void clearLogoLinkId() => $_clearField(4);

  /// The links of the supplier.
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get externalLinksIds => $_getList(4);

  /// The contact phone number.
  @$pb.TagNumber(6)
  $core.String get contactPhone => $_getSZ(5);
  @$pb.TagNumber(6)
  set contactPhone($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasContactPhone() => $_has(5);
  @$pb.TagNumber(6)
  void clearContactPhone() => $_clearField(6);

  /// The contact email.
  @$pb.TagNumber(7)
  $core.String get contactEmail => $_getSZ(6);
  @$pb.TagNumber(7)
  set contactEmail($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasContactEmail() => $_has(6);
  @$pb.TagNumber(7)
  void clearContactEmail() => $_clearField(7);

  /// The contact address.
  @$pb.TagNumber(8)
  $core.String get contactAddress => $_getSZ(7);
  @$pb.TagNumber(8)
  set contactAddress($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasContactAddress() => $_has(7);
  @$pb.TagNumber(8)
  void clearContactAddress() => $_clearField(8);

  /// Whether the supplier is active.
  @$pb.TagNumber(9)
  SupplierStatus get status => $_getN(8);
  @$pb.TagNumber(9)
  set status(SupplierStatus value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearStatus() => $_clearField(9);

  /// The ids of the store of the supplier.
  @$pb.TagNumber(10)
  $pb.PbList<$core.String> get storeIds => $_getList(9);
}

class CreateSupplierRequest extends $pb.GeneratedMessage {
  factory CreateSupplierRequest({
    Supplier? supplier,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$0.ResourceLink>? externalLinks,
  }) {
    final result = create();
    if (supplier != null) result.supplier = supplier;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    if (externalLinks != null) result.externalLinks.addAll(externalLinks);
    return result;
  }

  CreateSupplierRequest._();

  factory CreateSupplierRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSupplierRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSupplierRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier',
        subBuilder: Supplier.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..pPM<$0.ResourceLink>(3, _omitFieldNames ? '' : 'externalLinks',
        subBuilder: $0.ResourceLink.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSupplierRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSupplierRequest copyWith(
          void Function(CreateSupplierRequest) updates) =>
      super.copyWith((message) => updates(message as CreateSupplierRequest))
          as CreateSupplierRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSupplierRequest create() => CreateSupplierRequest._();
  @$core.override
  CreateSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSupplierRequest> createRepeated() =>
      $pb.PbList<CreateSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSupplierRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSupplierRequest>(create);
  static CreateSupplierRequest? _defaultInstance;

  /// The supplier information to create.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => $_clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);

  /// The raw image of the logo of the supplier.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);

  /// The links of the supplier.
  @$pb.TagNumber(3)
  $pb.PbList<$0.ResourceLink> get externalLinks => $_getList(2);
}

class CreateSupplierResponse extends $pb.GeneratedMessage {
  factory CreateSupplierResponse({
    $core.String? supplierId,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    return result;
  }

  CreateSupplierResponse._();

  factory CreateSupplierResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSupplierResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSupplierResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'supplierId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSupplierResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSupplierResponse copyWith(
          void Function(CreateSupplierResponse) updates) =>
      super.copyWith((message) => updates(message as CreateSupplierResponse))
          as CreateSupplierResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSupplierResponse create() => CreateSupplierResponse._();
  @$core.override
  CreateSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSupplierResponse> createRepeated() =>
      $pb.PbList<CreateSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSupplierResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSupplierResponse>(create);
  static CreateSupplierResponse? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get supplierId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supplierId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplierId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplierId() => $_clearField(1);
}

class GetSupplierRequest extends $pb.GeneratedMessage {
  factory GetSupplierRequest({
    $core.String? supplierId,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    return result;
  }

  GetSupplierRequest._();

  factory GetSupplierRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSupplierRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSupplierRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'supplierId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierRequest copyWith(void Function(GetSupplierRequest) updates) =>
      super.copyWith((message) => updates(message as GetSupplierRequest))
          as GetSupplierRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSupplierRequest create() => GetSupplierRequest._();
  @$core.override
  GetSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<GetSupplierRequest> createRepeated() =>
      $pb.PbList<GetSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSupplierRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSupplierRequest>(create);
  static GetSupplierRequest? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get supplierId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supplierId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplierId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplierId() => $_clearField(1);
}

class GetSupplierResponse extends $pb.GeneratedMessage {
  factory GetSupplierResponse({
    Supplier? supplier,
  }) {
    final result = create();
    if (supplier != null) result.supplier = supplier;
    return result;
  }

  GetSupplierResponse._();

  factory GetSupplierResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSupplierResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSupplierResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier',
        subBuilder: Supplier.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSupplierResponse copyWith(void Function(GetSupplierResponse) updates) =>
      super.copyWith((message) => updates(message as GetSupplierResponse))
          as GetSupplierResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSupplierResponse create() => GetSupplierResponse._();
  @$core.override
  GetSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<GetSupplierResponse> createRepeated() =>
      $pb.PbList<GetSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSupplierResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSupplierResponse>(create);
  static GetSupplierResponse? _defaultInstance;

  /// The retrieved supplier data.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => $_clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);
}

class GetStoreSuppliersRequest extends $pb.GeneratedMessage {
  factory GetStoreSuppliersRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetStoreSuppliersRequest._();

  factory GetStoreSuppliersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreSuppliersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreSuppliersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreSuppliersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreSuppliersRequest copyWith(
          void Function(GetStoreSuppliersRequest) updates) =>
      super.copyWith((message) => updates(message as GetStoreSuppliersRequest))
          as GetStoreSuppliersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreSuppliersRequest create() => GetStoreSuppliersRequest._();
  @$core.override
  GetStoreSuppliersRequest createEmptyInstance() => create();
  static $pb.PbList<GetStoreSuppliersRequest> createRepeated() =>
      $pb.PbList<GetStoreSuppliersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStoreSuppliersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreSuppliersRequest>(create);
  static GetStoreSuppliersRequest? _defaultInstance;

  /// The reference id to the store identifier.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetStoreSuppliersResponse extends $pb.GeneratedMessage {
  factory GetStoreSuppliersResponse({
    $core.Iterable<Supplier>? suppliers,
  }) {
    final result = create();
    if (suppliers != null) result.suppliers.addAll(suppliers);
    return result;
  }

  GetStoreSuppliersResponse._();

  factory GetStoreSuppliersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreSuppliersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreSuppliersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..pPM<Supplier>(1, _omitFieldNames ? '' : 'suppliers',
        subBuilder: Supplier.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreSuppliersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreSuppliersResponse copyWith(
          void Function(GetStoreSuppliersResponse) updates) =>
      super.copyWith((message) => updates(message as GetStoreSuppliersResponse))
          as GetStoreSuppliersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreSuppliersResponse create() => GetStoreSuppliersResponse._();
  @$core.override
  GetStoreSuppliersResponse createEmptyInstance() => create();
  static $pb.PbList<GetStoreSuppliersResponse> createRepeated() =>
      $pb.PbList<GetStoreSuppliersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStoreSuppliersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreSuppliersResponse>(create);
  static GetStoreSuppliersResponse? _defaultInstance;

  /// The list of suppliers of the store.
  /// Note: Only the ids and names of the suppliers are returned.
  @$pb.TagNumber(1)
  $pb.PbList<Supplier> get suppliers => $_getList(0);
}

class StreamStoreSuppliersRequest extends $pb.GeneratedMessage {
  factory StreamStoreSuppliersRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  StreamStoreSuppliersRequest._();

  factory StreamStoreSuppliersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreSuppliersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreSuppliersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreSuppliersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreSuppliersRequest copyWith(
          void Function(StreamStoreSuppliersRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StreamStoreSuppliersRequest))
          as StreamStoreSuppliersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreSuppliersRequest create() =>
      StreamStoreSuppliersRequest._();
  @$core.override
  StreamStoreSuppliersRequest createEmptyInstance() => create();
  static $pb.PbList<StreamStoreSuppliersRequest> createRepeated() =>
      $pb.PbList<StreamStoreSuppliersRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreSuppliersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreSuppliersRequest>(create);
  static StreamStoreSuppliersRequest? _defaultInstance;

  /// The reference id to the store identifier.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class StreamStoreSuppliersResponse extends $pb.GeneratedMessage {
  factory StreamStoreSuppliersResponse({
    $core.Iterable<Supplier>? suppliers,
  }) {
    final result = create();
    if (suppliers != null) result.suppliers.addAll(suppliers);
    return result;
  }

  StreamStoreSuppliersResponse._();

  factory StreamStoreSuppliersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreSuppliersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreSuppliersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..pPM<Supplier>(1, _omitFieldNames ? '' : 'suppliers',
        subBuilder: Supplier.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreSuppliersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreSuppliersResponse copyWith(
          void Function(StreamStoreSuppliersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StreamStoreSuppliersResponse))
          as StreamStoreSuppliersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreSuppliersResponse create() =>
      StreamStoreSuppliersResponse._();
  @$core.override
  StreamStoreSuppliersResponse createEmptyInstance() => create();
  static $pb.PbList<StreamStoreSuppliersResponse> createRepeated() =>
      $pb.PbList<StreamStoreSuppliersResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreSuppliersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreSuppliersResponse>(create);
  static StreamStoreSuppliersResponse? _defaultInstance;

  /// The list of suppliers of the store.
  /// Note: Only the ids and names of the suppliers are returned.
  @$pb.TagNumber(1)
  $pb.PbList<Supplier> get suppliers => $_getList(0);
}

class UpdateSupplierRequest extends $pb.GeneratedMessage {
  factory UpdateSupplierRequest({
    Supplier? supplier,
    $core.List<$core.int>? logoRawImage,
    $core.Iterable<$0.ResourceLink>? externalLinks,
  }) {
    final result = create();
    if (supplier != null) result.supplier = supplier;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    if (externalLinks != null) result.externalLinks.addAll(externalLinks);
    return result;
  }

  UpdateSupplierRequest._();

  factory UpdateSupplierRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSupplierRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSupplierRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier',
        subBuilder: Supplier.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..pPM<$0.ResourceLink>(3, _omitFieldNames ? '' : 'externalLinks',
        subBuilder: $0.ResourceLink.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSupplierRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSupplierRequest copyWith(
          void Function(UpdateSupplierRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateSupplierRequest))
          as UpdateSupplierRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSupplierRequest create() => UpdateSupplierRequest._();
  @$core.override
  UpdateSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSupplierRequest> createRepeated() =>
      $pb.PbList<UpdateSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSupplierRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSupplierRequest>(create);
  static UpdateSupplierRequest? _defaultInstance;

  /// The supplier information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => $_clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);

  /// The raw image of the logo of the supplier.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);

  /// The links of the supplier.
  @$pb.TagNumber(3)
  $pb.PbList<$0.ResourceLink> get externalLinks => $_getList(2);
}

class UpdateSupplierResponse extends $pb.GeneratedMessage {
  factory UpdateSupplierResponse({
    Supplier? supplier,
  }) {
    final result = create();
    if (supplier != null) result.supplier = supplier;
    return result;
  }

  UpdateSupplierResponse._();

  factory UpdateSupplierResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSupplierResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSupplierResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Supplier>(1, _omitFieldNames ? '' : 'supplier',
        subBuilder: Supplier.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSupplierResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSupplierResponse copyWith(
          void Function(UpdateSupplierResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateSupplierResponse))
          as UpdateSupplierResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSupplierResponse create() => UpdateSupplierResponse._();
  @$core.override
  UpdateSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSupplierResponse> createRepeated() =>
      $pb.PbList<UpdateSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSupplierResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSupplierResponse>(create);
  static UpdateSupplierResponse? _defaultInstance;

  /// The updated supplier data.
  @$pb.TagNumber(1)
  Supplier get supplier => $_getN(0);
  @$pb.TagNumber(1)
  set supplier(Supplier value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplier() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplier() => $_clearField(1);
  @$pb.TagNumber(1)
  Supplier ensureSupplier() => $_ensure(0);
}

class DeleteSupplierRequest extends $pb.GeneratedMessage {
  factory DeleteSupplierRequest({
    $core.String? supplierId,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    return result;
  }

  DeleteSupplierRequest._();

  factory DeleteSupplierRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSupplierRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSupplierRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'supplierId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSupplierRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSupplierRequest copyWith(
          void Function(DeleteSupplierRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteSupplierRequest))
          as DeleteSupplierRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSupplierRequest create() => DeleteSupplierRequest._();
  @$core.override
  DeleteSupplierRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteSupplierRequest> createRepeated() =>
      $pb.PbList<DeleteSupplierRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteSupplierRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSupplierRequest>(create);
  static DeleteSupplierRequest? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get supplierId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supplierId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplierId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplierId() => $_clearField(1);
}

class DeleteSupplierResponse extends $pb.GeneratedMessage {
  factory DeleteSupplierResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteSupplierResponse._();

  factory DeleteSupplierResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteSupplierResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteSupplierResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSupplierResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteSupplierResponse copyWith(
          void Function(DeleteSupplierResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteSupplierResponse))
          as DeleteSupplierResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteSupplierResponse create() => DeleteSupplierResponse._();
  @$core.override
  DeleteSupplierResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteSupplierResponse> createRepeated() =>
      $pb.PbList<DeleteSupplierResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteSupplierResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteSupplierResponse>(create);
  static DeleteSupplierResponse? _defaultInstance;

  /// Whether the supplier was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class SupplierServiceApi {
  final $pb.RpcClient _client;

  SupplierServiceApi(this._client);

  /// Creates a new supplier.
  $async.Future<CreateSupplierResponse> createSupplier(
          $pb.ClientContext? ctx, CreateSupplierRequest request) =>
      _client.invoke<CreateSupplierResponse>(ctx, 'SupplierService',
          'CreateSupplier', request, CreateSupplierResponse());

  /// Gets a supplier by id.
  $async.Future<GetSupplierResponse> getSupplier(
          $pb.ClientContext? ctx, GetSupplierRequest request) =>
      _client.invoke<GetSupplierResponse>(ctx, 'SupplierService', 'GetSupplier',
          request, GetSupplierResponse());

  /// Gets all suppliers of a store.
  $async.Future<GetStoreSuppliersResponse> getStoreSuppliers(
          $pb.ClientContext? ctx, GetStoreSuppliersRequest request) =>
      _client.invoke<GetStoreSuppliersResponse>(ctx, 'SupplierService',
          'GetStoreSuppliers', request, GetStoreSuppliersResponse());

  /// Streams all suppliers of a store with real-time updates.
  /// This is a server streaming RPC that will send updates whenever suppliers change.
  $async.Future<StreamStoreSuppliersResponse> streamStoreSuppliers(
          $pb.ClientContext? ctx, StreamStoreSuppliersRequest request) =>
      _client.invoke<StreamStoreSuppliersResponse>(ctx, 'SupplierService',
          'StreamStoreSuppliers', request, StreamStoreSuppliersResponse());

  /// Updates a supplier.
  /// Note:Only the fields that are set will be updated. array fields like external_links will be replaced.
  $async.Future<UpdateSupplierResponse> updateSupplier(
          $pb.ClientContext? ctx, UpdateSupplierRequest request) =>
      _client.invoke<UpdateSupplierResponse>(ctx, 'SupplierService',
          'UpdateSupplier', request, UpdateSupplierResponse());

  /// Deletes a supplier.
  $async.Future<DeleteSupplierResponse> deleteSupplier(
          $pb.ClientContext? ctx, DeleteSupplierRequest request) =>
      _client.invoke<DeleteSupplierResponse>(ctx, 'SupplierService',
          'DeleteSupplier', request, DeleteSupplierResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
