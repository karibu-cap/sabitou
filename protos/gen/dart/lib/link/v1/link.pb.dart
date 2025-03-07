//
//  Generated code. Do not modify.
//  source: link/v1/link.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// TODO: Auto delete resource link not linked to any other resource.
class ResourceLink extends $pb.GeneratedMessage {
  factory ResourceLink({
    $core.String? refId,
    $core.String? targetUri,
    $core.String? iconUri,
    $core.String? info,
    $core.String? label,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (targetUri != null) {
      $result.targetUri = targetUri;
    }
    if (iconUri != null) {
      $result.iconUri = iconUri;
    }
    if (info != null) {
      $result.info = info;
    }
    if (label != null) {
      $result.label = label;
    }
    return $result;
  }
  ResourceLink._() : super();
  factory ResourceLink.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory ResourceLink.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'ResourceLink', package: const $pb.PackageName(_omitMessageNames ? '' : 'link.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'targetUri')
    ..aOS(3, _omitFieldNames ? '' : 'iconUri')
    ..aOS(4, _omitFieldNames ? '' : 'info')
    ..aOS(5, _omitFieldNames ? '' : 'label')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  ResourceLink clone() => ResourceLink()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  ResourceLink copyWith(void Function(ResourceLink) updates) => super.copyWith((message) => updates(message as ResourceLink)) as ResourceLink;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResourceLink create() => ResourceLink._();
  ResourceLink createEmptyInstance() => create();
  static $pb.PbList<ResourceLink> createRepeated() => $pb.PbList<ResourceLink>();
  @$core.pragma('dart2js:noInline')
  static ResourceLink getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<ResourceLink>(create);
  static ResourceLink? _defaultInstance;

  /// The unique identifier of the resource link.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The link of the resource link.
  @$pb.TagNumber(2)
  $core.String get targetUri => $_getSZ(1);
  @$pb.TagNumber(2)
  set targetUri($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasTargetUri() => $_has(1);
  @$pb.TagNumber(2)
  void clearTargetUri() => clearField(2);

  /// The icon of the resource type or owner.
  @$pb.TagNumber(3)
  $core.String get iconUri => $_getSZ(2);
  @$pb.TagNumber(3)
  set iconUri($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasIconUri() => $_has(2);
  @$pb.TagNumber(3)
  void clearIconUri() => clearField(3);

  /// The meta data of the resource link.
  /// It can be the title of the target resource.
  @$pb.TagNumber(4)
  $core.String get info => $_getSZ(3);
  @$pb.TagNumber(4)
  set info($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasInfo() => $_has(3);
  @$pb.TagNumber(4)
  void clearInfo() => clearField(4);

  /// The label use to identify the resource type.
  @$pb.TagNumber(5)
  $core.String get label => $_getSZ(4);
  @$pb.TagNumber(5)
  set label($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasLabel() => $_has(4);
  @$pb.TagNumber(5)
  void clearLabel() => clearField(5);
}

class GetResourceLinksRequest extends $pb.GeneratedMessage {
  factory GetResourceLinksRequest({
    $core.Iterable<$core.String>? ids,
  }) {
    final $result = create();
    if (ids != null) {
      $result.ids.addAll(ids);
    }
    return $result;
  }
  GetResourceLinksRequest._() : super();
  factory GetResourceLinksRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResourceLinksRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetResourceLinksRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'link.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'ids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResourceLinksRequest clone() => GetResourceLinksRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResourceLinksRequest copyWith(void Function(GetResourceLinksRequest) updates) => super.copyWith((message) => updates(message as GetResourceLinksRequest)) as GetResourceLinksRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetResourceLinksRequest create() => GetResourceLinksRequest._();
  GetResourceLinksRequest createEmptyInstance() => create();
  static $pb.PbList<GetResourceLinksRequest> createRepeated() => $pb.PbList<GetResourceLinksRequest>();
  @$core.pragma('dart2js:noInline')
  static GetResourceLinksRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResourceLinksRequest>(create);
  static GetResourceLinksRequest? _defaultInstance;

  /// A list of unique identifiers of the resource link to retrieve.
  @$pb.TagNumber(1)
  $core.List<$core.String> get ids => $_getList(0);
}

class GetResourceLinksResponse extends $pb.GeneratedMessage {
  factory GetResourceLinksResponse({
    $core.Map<$core.String, ResourceLink>? link,
  }) {
    final $result = create();
    if (link != null) {
      $result.link.addAll(link);
    }
    return $result;
  }
  GetResourceLinksResponse._() : super();
  factory GetResourceLinksResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetResourceLinksResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetResourceLinksResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'link.v1'), createEmptyInstance: create)
    ..m<$core.String, ResourceLink>(1, _omitFieldNames ? '' : 'link', entryClassName: 'GetResourceLinksResponse.LinkEntry', keyFieldType: $pb.PbFieldType.OS, valueFieldType: $pb.PbFieldType.OM, valueCreator: ResourceLink.create, valueDefaultOrMaker: ResourceLink.getDefault, packageName: const $pb.PackageName('link.v1'))
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetResourceLinksResponse clone() => GetResourceLinksResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetResourceLinksResponse copyWith(void Function(GetResourceLinksResponse) updates) => super.copyWith((message) => updates(message as GetResourceLinksResponse)) as GetResourceLinksResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetResourceLinksResponse create() => GetResourceLinksResponse._();
  GetResourceLinksResponse createEmptyInstance() => create();
  static $pb.PbList<GetResourceLinksResponse> createRepeated() => $pb.PbList<GetResourceLinksResponse>();
  @$core.pragma('dart2js:noInline')
  static GetResourceLinksResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetResourceLinksResponse>(create);
  static GetResourceLinksResponse? _defaultInstance;

  /// The retrieved resource link data list.
  @$pb.TagNumber(1)
  $core.Map<$core.String, ResourceLink> get link => $_getMap(0);
}

class ResourceLinkServiceApi {
  $pb.RpcClient _client;
  ResourceLinkServiceApi(this._client);

  $async.Future<GetResourceLinksResponse> getResourceLinks($pb.ClientContext? ctx, GetResourceLinksRequest request) =>
    _client.invoke<GetResourceLinksResponse>(ctx, 'ResourceLinkService', 'GetResourceLinks', request, GetResourceLinksResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
