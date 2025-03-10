//
//  Generated code. Do not modify.
//  source: link/v1/link.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resourceLinkDescriptor instead')
const ResourceLink$json = {
  '1': 'ResourceLink',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'target_uri', '3': 2, '4': 1, '5': 9, '10': 'targetUri'},
    {'1': 'icon_uri', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'iconUri', '17': true},
    {'1': 'info', '3': 4, '4': 1, '5': 9, '9': 2, '10': 'info', '17': true},
    {'1': 'label', '3': 5, '4': 1, '5': 9, '9': 3, '10': 'label', '17': true},
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
    'Zm8YBCABKAlIAlIEaW5mb4gBARIZCgVsYWJlbBgFIAEoCUgDUgVsYWJlbIgBAUIJCgdfcmVmX2'
    'lkQgsKCV9pY29uX3VyaUIHCgVfaW5mb0IICgZfbGFiZWw=');

@$core.Deprecated('Use getResourceLinksRequestDescriptor instead')
const GetResourceLinksRequest$json = {
  '1': 'GetResourceLinksRequest',
  '2': [
    {'1': 'ids', '3': 1, '4': 3, '5': 9, '10': 'ids'},
  ],
};

/// Descriptor for `GetResourceLinksRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResourceLinksRequestDescriptor = $convert.base64Decode(
    'ChdHZXRSZXNvdXJjZUxpbmtzUmVxdWVzdBIQCgNpZHMYASADKAlSA2lkcw==');

@$core.Deprecated('Use getResourceLinksResponseDescriptor instead')
const GetResourceLinksResponse$json = {
  '1': 'GetResourceLinksResponse',
  '2': [
    {'1': 'link', '3': 1, '4': 3, '5': 11, '6': '.link.v1.GetResourceLinksResponse.LinkEntry', '10': 'link'},
  ],
  '3': [GetResourceLinksResponse_LinkEntry$json],
};

@$core.Deprecated('Use getResourceLinksResponseDescriptor instead')
const GetResourceLinksResponse_LinkEntry$json = {
  '1': 'LinkEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 11, '6': '.link.v1.ResourceLink', '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `GetResourceLinksResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResourceLinksResponseDescriptor = $convert.base64Decode(
    'ChhHZXRSZXNvdXJjZUxpbmtzUmVzcG9uc2USPwoEbGluaxgBIAMoCzIrLmxpbmsudjEuR2V0Um'
    'Vzb3VyY2VMaW5rc1Jlc3BvbnNlLkxpbmtFbnRyeVIEbGluaxpOCglMaW5rRW50cnkSEAoDa2V5'
    'GAEgASgJUgNrZXkSKwoFdmFsdWUYAiABKAsyFS5saW5rLnYxLlJlc291cmNlTGlua1IFdmFsdW'
    'U6AjgB');

const $core.Map<$core.String, $core.dynamic> ResourceLinkServiceBase$json = {
  '1': 'ResourceLinkService',
  '2': [
    {'1': 'GetResourceLinks', '2': '.link.v1.GetResourceLinksRequest', '3': '.link.v1.GetResourceLinksResponse'},
  ],
};

@$core.Deprecated('Use resourceLinkServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> ResourceLinkServiceBase$messageJson = {
  '.link.v1.GetResourceLinksRequest': GetResourceLinksRequest$json,
  '.link.v1.GetResourceLinksResponse': GetResourceLinksResponse$json,
  '.link.v1.GetResourceLinksResponse.LinkEntry': GetResourceLinksResponse_LinkEntry$json,
  '.link.v1.ResourceLink': ResourceLink$json,
};

/// Descriptor for `ResourceLinkService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List resourceLinkServiceDescriptor = $convert.base64Decode(
    'ChNSZXNvdXJjZUxpbmtTZXJ2aWNlElcKEEdldFJlc291cmNlTGlua3MSIC5saW5rLnYxLkdldF'
    'Jlc291cmNlTGlua3NSZXF1ZXN0GiEubGluay52MS5HZXRSZXNvdXJjZUxpbmtzUmVzcG9uc2U=');

