// This is a generated file - do not edit.
//
// Generated from store/v1/store.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use storeDescriptor instead')
const Store$json = {
  '1': 'Store',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'name', '3': 3, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'description',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'description',
      '17': true
    },
    {
      '1': 'logo_link_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'logoLinkId',
      '17': true
    },
    {
      '1': 'external_links_ids',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'externalLinksIds',
      '17': true
    },
    {'1': 'business_id', '3': 8, '4': 1, '5': 9, '10': 'businessId'},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
    {'1': '_external_links_ids'},
  ],
};

/// Descriptor for `Store`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeDescriptor = $convert.base64Decode(
    'CgVTdG9yZRIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESEgoEbmFtZRgDIAEoCVIEbmFtZR'
    'IlCgtkZXNjcmlwdGlvbhgFIAEoCUgBUgtkZXNjcmlwdGlvbogBARIlCgxsb2dvX2xpbmtfaWQY'
    'BiABKAlIAlIKbG9nb0xpbmtJZIgBARIxChJleHRlcm5hbF9saW5rc19pZHMYByABKAlIA1IQZX'
    'h0ZXJuYWxMaW5rc0lkc4gBARIfCgtidXNpbmVzc19pZBgIIAEoCVIKYnVzaW5lc3NJZEIJCgdf'
    'cmVmX2lkQg4KDF9kZXNjcmlwdGlvbkIPCg1fbG9nb19saW5rX2lkQhUKE19leHRlcm5hbF9saW'
    '5rc19pZHM=');

@$core.Deprecated('Use createStoreRequestDescriptor instead')
const CreateStoreRequest$json = {
  '1': 'CreateStoreRequest',
  '2': [
    {
      '1': 'store',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Store',
      '10': 'store'
    },
    {
      '1': 'logo_raw_image',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'logoRawImage',
      '17': true
    },
  ],
  '8': [
    {'1': '_logo_raw_image'},
  ],
};

/// Descriptor for `CreateStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStoreRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVTdG9yZVJlcXVlc3QSJQoFc3RvcmUYASABKAsyDy5zdG9yZS52MS5TdG9yZVIFc3'
    'RvcmUSKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0ltYWdliAEBQhEKD19sb2dv'
    'X3Jhd19pbWFnZQ==');

@$core.Deprecated('Use createStoreResponseDescriptor instead')
const CreateStoreResponse$json = {
  '1': 'CreateStoreResponse',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `CreateStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStoreResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVTdG9yZVJlc3BvbnNlEiUKCHN0b3JlX2lkGAEgASgJQgq6SAfIAQFyAhADUgdzdG'
    '9yZUlk');

@$core.Deprecated('Use getStoreRequestDescriptor instead')
const GetStoreRequest$json = {
  '1': 'GetStoreRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `GetStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRTdG9yZVJlcXVlc3QSJQoIc3RvcmVfaWQYASABKAlCCrpIB8gBAXICEANSB3N0b3JlSW'
    'Q=');

@$core.Deprecated('Use getStoreResponseDescriptor instead')
const GetStoreResponse$json = {
  '1': 'GetStoreResponse',
  '2': [
    {
      '1': 'store',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Store',
      '10': 'store'
    },
  ],
};

/// Descriptor for `GetStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreResponseDescriptor = $convert.base64Decode(
    'ChBHZXRTdG9yZVJlc3BvbnNlEiUKBXN0b3JlGAEgASgLMg8uc3RvcmUudjEuU3RvcmVSBXN0b3'
    'Jl');

@$core.Deprecated('Use updateStoreRequestDescriptor instead')
const UpdateStoreRequest$json = {
  '1': 'UpdateStoreRequest',
  '2': [
    {
      '1': 'store',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Store',
      '10': 'store'
    },
    {
      '1': 'logo_raw_image',
      '3': 2,
      '4': 1,
      '5': 12,
      '9': 0,
      '10': 'logoRawImage',
      '17': true
    },
  ],
  '8': [
    {'1': '_logo_raw_image'},
  ],
};

/// Descriptor for `UpdateStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStoreRequestDescriptor = $convert.base64Decode(
    'ChJVcGRhdGVTdG9yZVJlcXVlc3QSJQoFc3RvcmUYASABKAsyDy5zdG9yZS52MS5TdG9yZVIFc3'
    'RvcmUSKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0ltYWdliAEBQhEKD19sb2dv'
    'X3Jhd19pbWFnZQ==');

@$core.Deprecated('Use updateStoreResponseDescriptor instead')
const UpdateStoreResponse$json = {
  '1': 'UpdateStoreResponse',
  '2': [
    {
      '1': 'store',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Store',
      '10': 'store'
    },
  ],
};

/// Descriptor for `UpdateStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStoreResponseDescriptor = $convert.base64Decode(
    'ChNVcGRhdGVTdG9yZVJlc3BvbnNlEiUKBXN0b3JlGAEgASgLMg8uc3RvcmUudjEuU3RvcmVSBX'
    'N0b3Jl');

@$core.Deprecated('Use deleteStoreRequestDescriptor instead')
const DeleteStoreRequest$json = {
  '1': 'DeleteStoreRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `DeleteStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteStoreRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVTdG9yZVJlcXVlc3QSJQoIc3RvcmVfaWQYASABKAlCCrpIB8gBAXICEANSB3N0b3'
    'JlSWQ=');

@$core.Deprecated('Use deleteStoreResponseDescriptor instead')
const DeleteStoreResponse$json = {
  '1': 'DeleteStoreResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteStoreResponseDescriptor =
    $convert.base64Decode(
        'ChNEZWxldGVTdG9yZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

const $core.Map<$core.String, $core.dynamic> StoreServiceBase$json = {
  '1': 'StoreService',
  '2': [
    {
      '1': 'CreateStore',
      '2': '.store.v1.CreateStoreRequest',
      '3': '.store.v1.CreateStoreResponse',
      '4': {}
    },
    {
      '1': 'GetStore',
      '2': '.store.v1.GetStoreRequest',
      '3': '.store.v1.GetStoreResponse',
      '4': {}
    },
    {
      '1': 'UpdateStore',
      '2': '.store.v1.UpdateStoreRequest',
      '3': '.store.v1.UpdateStoreResponse',
      '4': {}
    },
    {
      '1': 'DeleteStore',
      '2': '.store.v1.DeleteStoreRequest',
      '3': '.store.v1.DeleteStoreResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use storeServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    StoreServiceBase$messageJson = {
  '.store.v1.CreateStoreRequest': CreateStoreRequest$json,
  '.store.v1.Store': Store$json,
  '.store.v1.CreateStoreResponse': CreateStoreResponse$json,
  '.store.v1.GetStoreRequest': GetStoreRequest$json,
  '.store.v1.GetStoreResponse': GetStoreResponse$json,
  '.store.v1.UpdateStoreRequest': UpdateStoreRequest$json,
  '.store.v1.UpdateStoreResponse': UpdateStoreResponse$json,
  '.store.v1.DeleteStoreRequest': DeleteStoreRequest$json,
  '.store.v1.DeleteStoreResponse': DeleteStoreResponse$json,
};

/// Descriptor for `StoreService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List storeServiceDescriptor = $convert.base64Decode(
    'CgxTdG9yZVNlcnZpY2USTAoLQ3JlYXRlU3RvcmUSHC5zdG9yZS52MS5DcmVhdGVTdG9yZVJlcX'
    'Vlc3QaHS5zdG9yZS52MS5DcmVhdGVTdG9yZVJlc3BvbnNlIgASQwoIR2V0U3RvcmUSGS5zdG9y'
    'ZS52MS5HZXRTdG9yZVJlcXVlc3QaGi5zdG9yZS52MS5HZXRTdG9yZVJlc3BvbnNlIgASTAoLVX'
    'BkYXRlU3RvcmUSHC5zdG9yZS52MS5VcGRhdGVTdG9yZVJlcXVlc3QaHS5zdG9yZS52MS5VcGRh'
    'dGVTdG9yZVJlc3BvbnNlIgASTAoLRGVsZXRlU3RvcmUSHC5zdG9yZS52MS5EZWxldGVTdG9yZV'
    'JlcXVlc3QaHS5zdG9yZS52MS5EZWxldGVTdG9yZVJlc3BvbnNlIgA=');
