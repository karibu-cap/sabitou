// This is a generated file - do not edit.
//
// Generated from store/v1/supplier.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

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
  Link clone() => Link()..mergeFromMessage(this);
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
    ..e<SupplierStatus>(9, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: SupplierStatus.SUPPLIER_STATUS_UNSPECIFIED,
        valueOf: SupplierStatus.valueOf,
        enumValues: SupplierStatus.values)
    ..pPS(10, _omitFieldNames ? '' : 'storeIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Supplier clone() => Supplier()..mergeFromMessage(this);
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
