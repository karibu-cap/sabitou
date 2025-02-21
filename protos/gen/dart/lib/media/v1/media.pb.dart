//
//  Generated code. Do not modify.
//  source: media/v1/media.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'media.pbenum.dart';

export 'media.pbenum.dart';

/// TODO: Auto delete media not linked to any other resource.
class Media extends $pb.GeneratedMessage {
  factory Media({
    $core.String? uid,
    MediaType? type,
    $core.String? link,
    $core.String? meta,
    $core.String? createdAt,
    $core.String? lastAccessedAt,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    if (type != null) {
      $result.type = type;
    }
    if (link != null) {
      $result.link = link;
    }
    if (meta != null) {
      $result.meta = meta;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (lastAccessedAt != null) {
      $result.lastAccessedAt = lastAccessedAt;
    }
    return $result;
  }
  Media._() : super();
  factory Media.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Media.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Media', package: const $pb.PackageName(_omitMessageNames ? '' : 'media.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..e<MediaType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE, defaultOrMaker: MediaType.MEDIA_TYPE_UNSPECIFIED, valueOf: MediaType.valueOf, enumValues: MediaType.values)
    ..aOS(3, _omitFieldNames ? '' : 'link')
    ..aOS(4, _omitFieldNames ? '' : 'meta')
    ..aOS(5, _omitFieldNames ? '' : 'createdAt')
    ..aOS(6, _omitFieldNames ? '' : 'lastAccessedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Media clone() => Media()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Media copyWith(void Function(Media) updates) => super.copyWith((message) => updates(message as Media)) as Media;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Media create() => Media._();
  Media createEmptyInstance() => create();
  static $pb.PbList<Media> createRepeated() => $pb.PbList<Media>();
  @$core.pragma('dart2js:noInline')
  static Media getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Media>(create);
  static Media? _defaultInstance;

  /// The unique identifier of the media.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  /// The type of the media.
  @$pb.TagNumber(2)
  MediaType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(MediaType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => clearField(2);

  /// The link of the media.
  @$pb.TagNumber(3)
  $core.String get link => $_getSZ(2);
  @$pb.TagNumber(3)
  set link($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasLink() => $_has(2);
  @$pb.TagNumber(3)
  void clearLink() => clearField(3);

  /// The meta data of the media.
  @$pb.TagNumber(4)
  $core.String get meta => $_getSZ(3);
  @$pb.TagNumber(4)
  set meta($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasMeta() => $_has(3);
  @$pb.TagNumber(4)
  void clearMeta() => clearField(4);

  /// The date and time the media was created.
  @$pb.TagNumber(5)
  $core.String get createdAt => $_getSZ(4);
  @$pb.TagNumber(5)
  set createdAt($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasCreatedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedAt() => clearField(5);

  /// The date and time the media was last accessed.
  @$pb.TagNumber(6)
  $core.String get lastAccessedAt => $_getSZ(5);
  @$pb.TagNumber(6)
  set lastAccessedAt($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasLastAccessedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastAccessedAt() => clearField(6);
}

class GetMediasRequest extends $pb.GeneratedMessage {
  factory GetMediasRequest({
    $core.Iterable<$core.String>? uids,
  }) {
    final $result = create();
    if (uids != null) {
      $result.uids.addAll(uids);
    }
    return $result;
  }
  GetMediasRequest._() : super();
  factory GetMediasRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMediasRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMediasRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'media.v1'), createEmptyInstance: create)
    ..pPS(1, _omitFieldNames ? '' : 'uids')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMediasRequest clone() => GetMediasRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMediasRequest copyWith(void Function(GetMediasRequest) updates) => super.copyWith((message) => updates(message as GetMediasRequest)) as GetMediasRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMediasRequest create() => GetMediasRequest._();
  GetMediasRequest createEmptyInstance() => create();
  static $pb.PbList<GetMediasRequest> createRepeated() => $pb.PbList<GetMediasRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMediasRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMediasRequest>(create);
  static GetMediasRequest? _defaultInstance;

  /// A list of unique identifiers of the media to retrieve.
  @$pb.TagNumber(1)
  $core.List<$core.String> get uids => $_getList(0);
}

class GetMediasResponse extends $pb.GeneratedMessage {
  factory GetMediasResponse({
    $core.Iterable<Media>? media,
  }) {
    final $result = create();
    if (media != null) {
      $result.media.addAll(media);
    }
    return $result;
  }
  GetMediasResponse._() : super();
  factory GetMediasResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetMediasResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetMediasResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'media.v1'), createEmptyInstance: create)
    ..pc<Media>(1, _omitFieldNames ? '' : 'media', $pb.PbFieldType.PM, subBuilder: Media.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetMediasResponse clone() => GetMediasResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetMediasResponse copyWith(void Function(GetMediasResponse) updates) => super.copyWith((message) => updates(message as GetMediasResponse)) as GetMediasResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMediasResponse create() => GetMediasResponse._();
  GetMediasResponse createEmptyInstance() => create();
  static $pb.PbList<GetMediasResponse> createRepeated() => $pb.PbList<GetMediasResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMediasResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetMediasResponse>(create);
  static GetMediasResponse? _defaultInstance;

  /// The retrieved media data list.
  @$pb.TagNumber(1)
  $core.List<Media> get media => $_getList(0);
}

class MediaServiceApi {
  $pb.RpcClient _client;
  MediaServiceApi(this._client);

  $async.Future<GetMediasResponse> getMedias($pb.ClientContext? ctx, GetMediasRequest request) =>
    _client.invoke<GetMediasResponse>(ctx, 'MediaService', 'GetMedias', request, GetMediasResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
