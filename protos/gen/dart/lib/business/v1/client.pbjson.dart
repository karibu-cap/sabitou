//
//  Generated code. Do not modify.
//  source: business/v1/client.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use businessClientDescriptor instead')
const BusinessClient$json = {
  '1': 'BusinessClient',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'phone_number', '3': 3, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'logo_media_id', '3': 4, '4': 1, '5': 9, '9': 1, '10': 'logoMediaId', '17': true},
    {'1': 'business_id', '3': 5, '4': 1, '5': 9, '10': 'businessId'},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_logo_media_id'},
  ],
};

/// Descriptor for `BusinessClient`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessClientDescriptor = $convert.base64Decode(
    'Cg5CdXNpbmVzc0NsaWVudBIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESEgoEbmFtZRgCIA'
    'EoCVIEbmFtZRIhCgxwaG9uZV9udW1iZXIYAyABKAlSC3Bob25lTnVtYmVyEicKDWxvZ29fbWVk'
    'aWFfaWQYBCABKAlIAVILbG9nb01lZGlhSWSIAQESHwoLYnVzaW5lc3NfaWQYBSABKAlSCmJ1c2'
    'luZXNzSWRCCQoHX3JlZl9pZEIQCg5fbG9nb19tZWRpYV9pZA==');

@$core.Deprecated('Use createBusinessClientRequestDescriptor instead')
const CreateBusinessClientRequest$json = {
  '1': 'CreateBusinessClientRequest',
  '2': [
    {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.business.v1.BusinessClient', '10': 'client'},
    {'1': 'logo_raw_image', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'logoRawImage', '17': true},
  ],
  '8': [
    {'1': '_logo_raw_image'},
  ],
};

/// Descriptor for `CreateBusinessClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessClientRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVCdXNpbmVzc0NsaWVudFJlcXVlc3QSMwoGY2xpZW50GAEgASgLMhsuYnVzaW5lc3'
    'MudjEuQnVzaW5lc3NDbGllbnRSBmNsaWVudBIpCg5sb2dvX3Jhd19pbWFnZRgCIAEoDEgAUgxs'
    'b2dvUmF3SW1hZ2WIAQFCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use createBusinessClientResponseDescriptor instead')
const CreateBusinessClientResponse$json = {
  '1': 'CreateBusinessClientResponse',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
  ],
};

/// Descriptor for `CreateBusinessClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessClientResponseDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVCdXNpbmVzc0NsaWVudFJlc3BvbnNlEiEKBnJlZl9pZBgBIAEoCUIKukgHyAEBcg'
    'IQA1IFcmVmSWQ=');

@$core.Deprecated('Use getBusinessClientRequestDescriptor instead')
const GetBusinessClientRequest$json = {
  '1': 'GetBusinessClientRequest',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
  ],
};

/// Descriptor for `GetBusinessClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessClientRequestDescriptor = $convert.base64Decode(
    'ChhHZXRCdXNpbmVzc0NsaWVudFJlcXVlc3QSIQoGcmVmX2lkGAEgASgJQgq6SAfIAQFyAhADUg'
    'VyZWZJZA==');

@$core.Deprecated('Use getBusinessClientResponseDescriptor instead')
const GetBusinessClientResponse$json = {
  '1': 'GetBusinessClientResponse',
  '2': [
    {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.business.v1.BusinessClient', '10': 'client'},
  ],
};

/// Descriptor for `GetBusinessClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessClientResponseDescriptor = $convert.base64Decode(
    'ChlHZXRCdXNpbmVzc0NsaWVudFJlc3BvbnNlEjMKBmNsaWVudBgBIAEoCzIbLmJ1c2luZXNzLn'
    'YxLkJ1c2luZXNzQ2xpZW50UgZjbGllbnQ=');

@$core.Deprecated('Use updateBusinessClientRequestDescriptor instead')
const UpdateBusinessClientRequest$json = {
  '1': 'UpdateBusinessClientRequest',
  '2': [
    {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.business.v1.BusinessClient', '10': 'client'},
    {'1': 'logo_raw_image', '3': 2, '4': 1, '5': 12, '9': 0, '10': 'logoRawImage', '17': true},
  ],
  '8': [
    {'1': '_logo_raw_image'},
  ],
};

/// Descriptor for `UpdateBusinessClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessClientRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVCdXNpbmVzc0NsaWVudFJlcXVlc3QSMwoGY2xpZW50GAEgASgLMhsuYnVzaW5lc3'
    'MudjEuQnVzaW5lc3NDbGllbnRSBmNsaWVudBIpCg5sb2dvX3Jhd19pbWFnZRgCIAEoDEgAUgxs'
    'b2dvUmF3SW1hZ2WIAQFCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use updateBusinessClientResponseDescriptor instead')
const UpdateBusinessClientResponse$json = {
  '1': 'UpdateBusinessClientResponse',
  '2': [
    {'1': 'client', '3': 1, '4': 1, '5': 11, '6': '.business.v1.BusinessClient', '10': 'client'},
  ],
};

/// Descriptor for `UpdateBusinessClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessClientResponseDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVCdXNpbmVzc0NsaWVudFJlc3BvbnNlEjMKBmNsaWVudBgBIAEoCzIbLmJ1c2luZX'
    'NzLnYxLkJ1c2luZXNzQ2xpZW50UgZjbGllbnQ=');

@$core.Deprecated('Use deleteBusinessClientRequestDescriptor instead')
const DeleteBusinessClientRequest$json = {
  '1': 'DeleteBusinessClientRequest',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
  ],
};

/// Descriptor for `DeleteBusinessClientRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessClientRequestDescriptor = $convert.base64Decode(
    'ChtEZWxldGVCdXNpbmVzc0NsaWVudFJlcXVlc3QSIQoGcmVmX2lkGAEgASgJQgq6SAfIAQFyAh'
    'ADUgVyZWZJZA==');

@$core.Deprecated('Use deleteBusinessClientResponseDescriptor instead')
const DeleteBusinessClientResponse$json = {
  '1': 'DeleteBusinessClientResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteBusinessClientResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessClientResponseDescriptor = $convert.base64Decode(
    'ChxEZWxldGVCdXNpbmVzc0NsaWVudFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3'
    'M=');

const $core.Map<$core.String, $core.dynamic> BusinessClientServiceBase$json = {
  '1': 'BusinessClientService',
  '2': [
    {'1': 'CreateBusinessClient', '2': '.business.v1.CreateBusinessClientRequest', '3': '.business.v1.CreateBusinessClientResponse', '4': {}},
    {'1': 'GetBusinessClient', '2': '.business.v1.GetBusinessClientRequest', '3': '.business.v1.GetBusinessClientResponse', '4': {}},
    {'1': 'UpdateBusinessClient', '2': '.business.v1.UpdateBusinessClientRequest', '3': '.business.v1.UpdateBusinessClientResponse', '4': {}},
    {'1': 'DeleteBusinessClient', '2': '.business.v1.DeleteBusinessClientRequest', '3': '.business.v1.DeleteBusinessClientResponse', '4': {}},
  ],
};

@$core.Deprecated('Use businessClientServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> BusinessClientServiceBase$messageJson = {
  '.business.v1.CreateBusinessClientRequest': CreateBusinessClientRequest$json,
  '.business.v1.BusinessClient': BusinessClient$json,
  '.business.v1.CreateBusinessClientResponse': CreateBusinessClientResponse$json,
  '.business.v1.GetBusinessClientRequest': GetBusinessClientRequest$json,
  '.business.v1.GetBusinessClientResponse': GetBusinessClientResponse$json,
  '.business.v1.UpdateBusinessClientRequest': UpdateBusinessClientRequest$json,
  '.business.v1.UpdateBusinessClientResponse': UpdateBusinessClientResponse$json,
  '.business.v1.DeleteBusinessClientRequest': DeleteBusinessClientRequest$json,
  '.business.v1.DeleteBusinessClientResponse': DeleteBusinessClientResponse$json,
};

/// Descriptor for `BusinessClientService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List businessClientServiceDescriptor = $convert.base64Decode(
    'ChVCdXNpbmVzc0NsaWVudFNlcnZpY2USbQoUQ3JlYXRlQnVzaW5lc3NDbGllbnQSKC5idXNpbm'
    'Vzcy52MS5DcmVhdGVCdXNpbmVzc0NsaWVudFJlcXVlc3QaKS5idXNpbmVzcy52MS5DcmVhdGVC'
    'dXNpbmVzc0NsaWVudFJlc3BvbnNlIgASZAoRR2V0QnVzaW5lc3NDbGllbnQSJS5idXNpbmVzcy'
    '52MS5HZXRCdXNpbmVzc0NsaWVudFJlcXVlc3QaJi5idXNpbmVzcy52MS5HZXRCdXNpbmVzc0Ns'
    'aWVudFJlc3BvbnNlIgASbQoUVXBkYXRlQnVzaW5lc3NDbGllbnQSKC5idXNpbmVzcy52MS5VcG'
    'RhdGVCdXNpbmVzc0NsaWVudFJlcXVlc3QaKS5idXNpbmVzcy52MS5VcGRhdGVCdXNpbmVzc0Ns'
    'aWVudFJlc3BvbnNlIgASbQoURGVsZXRlQnVzaW5lc3NDbGllbnQSKC5idXNpbmVzcy52MS5EZW'
    'xldGVCdXNpbmVzc0NsaWVudFJlcXVlc3QaKS5idXNpbmVzcy52MS5EZWxldGVCdXNpbmVzc0Ns'
    'aWVudFJlc3BvbnNlIgA=');

