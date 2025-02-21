//
//  Generated code. Do not modify.
//  source: media/v1/media.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use mediaTypeDescriptor instead')
const MediaType$json = {
  '1': 'MediaType',
  '2': [
    {'1': 'MEDIA_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'MEDIA_TYPE_IMAGE', '2': 1},
    {'1': 'MEDIA_TYPE_VIDEO', '2': 2},
  ],
};

/// Descriptor for `MediaType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List mediaTypeDescriptor = $convert.base64Decode(
    'CglNZWRpYVR5cGUSGgoWTUVESUFfVFlQRV9VTlNQRUNJRklFRBAAEhQKEE1FRElBX1RZUEVfSU'
    '1BR0UQARIUChBNRURJQV9UWVBFX1ZJREVPEAI=');

@$core.Deprecated('Use mediaDescriptor instead')
const Media$json = {
  '1': 'Media',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'type', '3': 2, '4': 1, '5': 14, '6': '.media.v1.MediaType', '10': 'type'},
    {'1': 'link', '3': 3, '4': 1, '5': 9, '10': 'link'},
    {'1': 'meta', '3': 4, '4': 1, '5': 9, '10': 'meta'},
    {'1': 'created_at', '3': 5, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'last_accessed_at', '3': 6, '4': 1, '5': 9, '10': 'lastAccessedAt'},
  ],
};

/// Descriptor for `Media`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List mediaDescriptor = $convert.base64Decode(
    'CgVNZWRpYRIQCgN1aWQYASABKAlSA3VpZBInCgR0eXBlGAIgASgOMhMubWVkaWEudjEuTWVkaW'
    'FUeXBlUgR0eXBlEhIKBGxpbmsYAyABKAlSBGxpbmsSEgoEbWV0YRgEIAEoCVIEbWV0YRIdCgpj'
    'cmVhdGVkX2F0GAUgASgJUgljcmVhdGVkQXQSKAoQbGFzdF9hY2Nlc3NlZF9hdBgGIAEoCVIObG'
    'FzdEFjY2Vzc2VkQXQ=');

@$core.Deprecated('Use getMediasRequestDescriptor instead')
const GetMediasRequest$json = {
  '1': 'GetMediasRequest',
  '2': [
    {'1': 'uids', '3': 1, '4': 3, '5': 9, '10': 'uids'},
  ],
};

/// Descriptor for `GetMediasRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMediasRequestDescriptor = $convert.base64Decode(
    'ChBHZXRNZWRpYXNSZXF1ZXN0EhIKBHVpZHMYASADKAlSBHVpZHM=');

@$core.Deprecated('Use getMediasResponseDescriptor instead')
const GetMediasResponse$json = {
  '1': 'GetMediasResponse',
  '2': [
    {'1': 'media', '3': 1, '4': 3, '5': 11, '6': '.media.v1.Media', '10': 'media'},
  ],
};

/// Descriptor for `GetMediasResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMediasResponseDescriptor = $convert.base64Decode(
    'ChFHZXRNZWRpYXNSZXNwb25zZRIlCgVtZWRpYRgBIAMoCzIPLm1lZGlhLnYxLk1lZGlhUgVtZW'
    'RpYQ==');

const $core.Map<$core.String, $core.dynamic> MediaServiceBase$json = {
  '1': 'MediaService',
  '2': [
    {'1': 'GetMedias', '2': '.media.v1.GetMediasRequest', '3': '.media.v1.GetMediasResponse'},
  ],
};

@$core.Deprecated('Use mediaServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> MediaServiceBase$messageJson = {
  '.media.v1.GetMediasRequest': GetMediasRequest$json,
  '.media.v1.GetMediasResponse': GetMediasResponse$json,
  '.media.v1.Media': Media$json,
};

/// Descriptor for `MediaService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List mediaServiceDescriptor = $convert.base64Decode(
    'CgxNZWRpYVNlcnZpY2USRAoJR2V0TWVkaWFzEhoubWVkaWEudjEuR2V0TWVkaWFzUmVxdWVzdB'
    'obLm1lZGlhLnYxLkdldE1lZGlhc1Jlc3BvbnNl');

