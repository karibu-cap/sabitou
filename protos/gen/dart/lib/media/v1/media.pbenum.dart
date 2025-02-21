//
//  Generated code. Do not modify.
//  source: media/v1/media.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class MediaType extends $pb.ProtobufEnum {
  static const MediaType MEDIA_TYPE_UNSPECIFIED = MediaType._(0, _omitEnumNames ? '' : 'MEDIA_TYPE_UNSPECIFIED');
  static const MediaType MEDIA_TYPE_IMAGE = MediaType._(1, _omitEnumNames ? '' : 'MEDIA_TYPE_IMAGE');
  static const MediaType MEDIA_TYPE_VIDEO = MediaType._(2, _omitEnumNames ? '' : 'MEDIA_TYPE_VIDEO');

  static const $core.List<MediaType> values = <MediaType> [
    MEDIA_TYPE_UNSPECIFIED,
    MEDIA_TYPE_IMAGE,
    MEDIA_TYPE_VIDEO,
  ];

  static final $core.Map<$core.int, MediaType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static MediaType? valueOf($core.int value) => _byValue[value];

  const MediaType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
