// This is a generated file - do not edit.
//
// Generated from link/v1/link.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resourceLinkDescriptor instead')
const ResourceLink$json = {
  '1': 'ResourceLink',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'target_uri', '3': 2, '4': 1, '5': 9, '10': 'targetUri'},
    {
      '1': 'icon_uri',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'iconUri',
      '17': true
    },
    {'1': 'info', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'info', '17': true},
    {'1': 'label', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'label', '17': true},
    {'1': 'is_orphan', '3': 6, '4': 1, '5': 8, '10': 'isOrphan'},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_icon_uri'},
    {'1': '_info'},
    {'1': '_label'},
  ],
};

/// Descriptor for `ResourceLink`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List resourceLinkDescriptor = $convert.base64Decode(
    'CgxSZXNvdXJjZUxpbmsSGgoGcmVmX2lkGAEgASgJSABSBXJlZklkiAEBEh0KCnRhcmdldF91cm'
    'kYAiABKAlSCXRhcmdldFVyaRIeCghpY29uX3VyaRgDIAEoCUgBUgdpY29uVXJpiAEBEhcKBGlu'
    'Zm8YBCABKAlIAlIEaW5mb4gBARIZCgVsYWJlbBgFIAEoCUgDUgVsYWJlbIgBARIbCglpc19vcn'
    'BoYW4YBiABKAhSCGlzT3JwaGFuQgkKB19yZWZfaWRCCwoJX2ljb25fdXJpQgcKBV9pbmZvQggK'
    'Bl9sYWJlbA==');
