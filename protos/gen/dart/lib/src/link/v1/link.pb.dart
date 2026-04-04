// This is a generated file - do not edit.
//
// Generated from link/v1/link.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// TODO: Auto delete resource link not linked to any other resource.
class ResourceLink extends $pb.GeneratedMessage {
  factory ResourceLink({
    $core.String? refId,
    $core.String? targetUri,
    $core.String? iconUri,
    $core.String? info,
    $core.String? label,
    $core.bool? isOrphan,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (targetUri != null) result.targetUri = targetUri;
    if (iconUri != null) result.iconUri = iconUri;
    if (info != null) result.info = info;
    if (label != null) result.label = label;
    if (isOrphan != null) result.isOrphan = isOrphan;
    return result;
  }

  ResourceLink._();

  factory ResourceLink.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResourceLink.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResourceLink',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'link.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'targetUri')
    ..aOS(3, _omitFieldNames ? '' : 'iconUri')
    ..aOS(4, _omitFieldNames ? '' : 'info')
    ..aOS(5, _omitFieldNames ? '' : 'label')
    ..aOB(6, _omitFieldNames ? '' : 'isOrphan')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResourceLink clone() => ResourceLink()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResourceLink copyWith(void Function(ResourceLink) updates) =>
      super.copyWith((message) => updates(message as ResourceLink))
          as ResourceLink;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceLink create() => ResourceLink._();
  @$core.override
  ResourceLink createEmptyInstance() => create();
  static $pb.PbList<ResourceLink> createRepeated() =>
      $pb.PbList<ResourceLink>();
  @$core.pragma('dart2js:noInline')
  static ResourceLink getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResourceLink>(create);
  static ResourceLink? _defaultInstance;

  /// The unique identifier of the resource link.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The link of the resource link.
  @$pb.TagNumber(2)
  $core.String get targetUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetUri($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTargetUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUri() => $_clearField(2);

  /// The icon of the resource type or owner.
  @$pb.TagNumber(3)
  $core.String get iconUri => $_getSZ(2);
  @$pb.TagNumber(3)
  set iconUri($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIconUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearIconUri() => $_clearField(3);

  /// The meta data of the resource link.
  /// It can be the title of the target resource.
  @$pb.TagNumber(4)
  $core.String get info => $_getSZ(3);
  @$pb.TagNumber(4)
  set info($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearInfo() => $_clearField(4);

  /// The label use to identify the resource type.
  @$pb.TagNumber(5)
  $core.String get label => $_getSZ(4);
  @$pb.TagNumber(5)
  set label($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasLabel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLabel() => $_clearField(5);

  /// Whether the resource link is orphan.
  @$pb.TagNumber(6)
  $core.bool get isOrphan => $_getBF(5);
  @$pb.TagNumber(6)
  set isOrphan($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIsOrphan() => $_has(5);
  @$pb.TagNumber(6)
  void clearIsOrphan() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
