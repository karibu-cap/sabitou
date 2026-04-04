// This is a generated file - do not edit.
//
// Generated from business/v1/business.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../link/v1/link.pbjson.dart' as $1;

@$core.Deprecated('Use businessStatusTypeDescriptor instead')
const BusinessStatusType$json = {
  '1': 'BusinessStatusType',
  '2': [
    {'1': 'BUSINESS_STATUS_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'BUSINESS_STATUS_TYPE_ACTIVE', '2': 1},
    {'1': 'BUSINESS_STATUS_TYPE_INACTIVE', '2': 2},
  ],
};

/// Descriptor for `BusinessStatusType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List businessStatusTypeDescriptor = $convert.base64Decode(
    'ChJCdXNpbmVzc1N0YXR1c1R5cGUSJAogQlVTSU5FU1NfU1RBVFVTX1RZUEVfVU5TUEVDSUZJRU'
    'QQABIfChtCVVNJTkVTU19TVEFUVVNfVFlQRV9BQ1RJVkUQARIhCh1CVVNJTkVTU19TVEFUVVNf'
    'VFlQRV9JTkFDVElWRRAC');

@$core.Deprecated('Use currencyChangePolicyTypeDescriptor instead')
const CurrencyChangePolicyType$json = {
  '1': 'CurrencyChangePolicyType',
  '2': [
    {'1': 'CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'CURRENCY_CHANGE_POLICY_TYPE_KEEP_PREVIOUS_CURRENCY_VALUE', '2': 1},
    {
      '1': 'CURRENCY_CHANGE_POLICY_TYPE_CONVERT_BASED_ON_CURRENT_EXCHANGE_RATE',
      '2': 2
    },
  ],
};

/// Descriptor for `CurrencyChangePolicyType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List currencyChangePolicyTypeDescriptor = $convert.base64Decode(
    'ChhDdXJyZW5jeUNoYW5nZVBvbGljeVR5cGUSKwonQ1VSUkVOQ1lfQ0hBTkdFX1BPTElDWV9UWV'
    'BFX1VOU1BFQ0lGSUVEEAASPAo4Q1VSUkVOQ1lfQ0hBTkdFX1BPTElDWV9UWVBFX0tFRVBfUFJF'
    'VklPVVNfQ1VSUkVOQ1lfVkFMVUUQARJGCkJDVVJSRU5DWV9DSEFOR0VfUE9MSUNZX1RZUEVfQ0'
    '9OVkVSVF9CQVNFRF9PTl9DVVJSRU5UX0VYQ0hBTkdFX1JBVEUQAg==');

@$core.Deprecated('Use businessMemberStatusDescriptor instead')
const BusinessMemberStatus$json = {
  '1': 'BusinessMemberStatus',
  '2': [
    {'1': 'BUSINESS_MEMBER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'BUSINESS_MEMBER_STATUS_ACTIVE', '2': 1},
    {'1': 'BUSINESS_MEMBER_STATUS_PENDING', '2': 2},
    {'1': 'BUSINESS_MEMBER_STATUS_INACTIVE', '2': 3},
    {'1': 'BUSINESS_MEMBER_STATUS_BANNED', '2': 4},
  ],
};

/// Descriptor for `BusinessMemberStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List businessMemberStatusDescriptor = $convert.base64Decode(
    'ChRCdXNpbmVzc01lbWJlclN0YXR1cxImCiJCVVNJTkVTU19NRU1CRVJfU1RBVFVTX1VOU1BFQ0'
    'lGSUVEEAASIQodQlVTSU5FU1NfTUVNQkVSX1NUQVRVU19BQ1RJVkUQARIiCh5CVVNJTkVTU19N'
    'RU1CRVJfU1RBVFVTX1BFTkRJTkcQAhIjCh9CVVNJTkVTU19NRU1CRVJfU1RBVFVTX0lOQUNUSV'
    'ZFEAMSIQodQlVTSU5FU1NfTUVNQkVSX1NUQVRVU19CQU5ORUQQBA==');

@$core.Deprecated('Use businessDescriptor instead')
const Business$json = {
  '1': 'Business',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {
      '1': 'description',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'description',
      '17': true
    },
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.business.v1.BusinessStatusType',
      '10': 'status'
    },
    {'1': 'owner_id', '3': 5, '4': 1, '5': 9, '10': 'ownerId'},
    {
      '1': 'logo_link_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'logoLinkId',
      '17': true
    },
    {'1': 'country_code', '3': 7, '4': 1, '5': 9, '10': 'countryCode'},
    {'1': 'currency_code', '3': 8, '4': 1, '5': 9, '10': 'currencyCode'},
    {
      '1': 'external_links_ids',
      '3': 9,
      '4': 3,
      '5': 9,
      '10': 'externalLinksIds'
    },
    {
      '1': 'contact_info',
      '3': 10,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'contactInfo',
      '17': true
    },
    {
      '1': 'address',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'address',
      '17': true
    },
    {'1': 'email', '3': 12, '4': 1, '5': 9, '9': 5, '10': 'email', '17': true},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
    {'1': '_contact_info'},
    {'1': '_address'},
    {'1': '_email'},
  ],
};

/// Descriptor for `Business`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessDescriptor = $convert.base64Decode(
    'CghCdXNpbmVzcxIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgBUgtkZXNjcmlwdGlvbogBARI3CgZzdGF0dXMYBCAB'
    'KA4yHy5idXNpbmVzcy52MS5CdXNpbmVzc1N0YXR1c1R5cGVSBnN0YXR1cxIZCghvd25lcl9pZB'
    'gFIAEoCVIHb3duZXJJZBIlCgxsb2dvX2xpbmtfaWQYBiABKAlIAlIKbG9nb0xpbmtJZIgBARIh'
    'Cgxjb3VudHJ5X2NvZGUYByABKAlSC2NvdW50cnlDb2RlEiMKDWN1cnJlbmN5X2NvZGUYCCABKA'
    'lSDGN1cnJlbmN5Q29kZRIsChJleHRlcm5hbF9saW5rc19pZHMYCSADKAlSEGV4dGVybmFsTGlu'
    'a3NJZHMSJgoMY29udGFjdF9pbmZvGAogASgJSANSC2NvbnRhY3RJbmZviAEBEh0KB2FkZHJlc3'
    'MYCyABKAlIBFIHYWRkcmVzc4gBARIZCgVlbWFpbBgMIAEoCUgFUgVlbWFpbIgBAUIJCgdfcmVm'
    'X2lkQg4KDF9kZXNjcmlwdGlvbkIPCg1fbG9nb19saW5rX2lkQg8KDV9jb250YWN0X2luZm9CCg'
    'oIX2FkZHJlc3NCCAoGX2VtYWls');

@$core.Deprecated('Use businessMemberDescriptor instead')
const BusinessMember$json = {
  '1': 'BusinessMember',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '10': 'businessId'},
    {
      '1': 'member_since',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'memberSince'
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.business.v1.BusinessMemberStatus',
      '10': 'status'
    },
  ],
};

/// Descriptor for `BusinessMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessMemberDescriptor = $convert.base64Decode(
    'Cg5CdXNpbmVzc01lbWJlchIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHwoLYnVzaW5lc3NfaW'
    'QYAiABKAlSCmJ1c2luZXNzSWQSPQoMbWVtYmVyX3NpbmNlGAQgASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFILbWVtYmVyU2luY2USOQoGc3RhdHVzGAUgASgOMiEuYnVzaW5lc3Mudj'
    'EuQnVzaW5lc3NNZW1iZXJTdGF0dXNSBnN0YXR1cw==');

@$core.Deprecated('Use createBusinessRequestDescriptor instead')
const CreateBusinessRequest$json = {
  '1': 'CreateBusinessRequest',
  '2': [
    {
      '1': 'business',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.business.v1.Business',
      '10': 'business'
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
    {
      '1': 'external_links',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.link.v1.ResourceLink',
      '10': 'externalLinks'
    },
  ],
  '8': [
    {'1': '_logo_raw_image'},
  ],
};

/// Descriptor for `CreateBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVCdXNpbmVzc1JlcXVlc3QSMQoIYnVzaW5lc3MYASABKAsyFS5idXNpbmVzcy52MS'
    '5CdXNpbmVzc1IIYnVzaW5lc3MSKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0lt'
    'YWdliAEBEjwKDmV4dGVybmFsX2xpbmtzGAMgAygLMhUubGluay52MS5SZXNvdXJjZUxpbmtSDW'
    'V4dGVybmFsTGlua3NCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use createBusinessResponseDescriptor instead')
const CreateBusinessResponse$json = {
  '1': 'CreateBusinessResponse',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `CreateBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessResponseDescriptor =
    $convert.base64Decode(
        'ChZDcmVhdGVCdXNpbmVzc1Jlc3BvbnNlEisKC2J1c2luZXNzX2lkGAEgASgJQgq6SAfIAQFyAh'
        'ADUgpidXNpbmVzc0lk');

@$core.Deprecated('Use requestDeleteBusinessRequestDescriptor instead')
const RequestDeleteBusinessRequest$json = {
  '1': 'RequestDeleteBusinessRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `RequestDeleteBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeleteBusinessRequestDescriptor =
    $convert.base64Decode(
        'ChxSZXF1ZXN0RGVsZXRlQnVzaW5lc3NSZXF1ZXN0EisKC2J1c2luZXNzX2lkGAEgASgJQgq6SA'
        'fIAQFyAhADUgpidXNpbmVzc0lkEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');

@$core.Deprecated('Use requestDeleteBusinessResponseDescriptor instead')
const RequestDeleteBusinessResponse$json = {
  '1': 'RequestDeleteBusinessResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'notice_period', '3': 2, '4': 1, '5': 9, '10': 'noticePeriod'},
  ],
};

/// Descriptor for `RequestDeleteBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List requestDeleteBusinessResponseDescriptor =
    $convert.base64Decode(
        'Ch1SZXF1ZXN0RGVsZXRlQnVzaW5lc3NSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
        'NzEiMKDW5vdGljZV9wZXJpb2QYAiABKAlSDG5vdGljZVBlcmlvZA==');

const $core.Map<$core.String, $core.dynamic> BusinessServiceBase$json = {
  '1': 'BusinessService',
  '2': [
    {
      '1': 'CreateBusiness',
      '2': '.business.v1.CreateBusinessRequest',
      '3': '.business.v1.CreateBusinessResponse'
    },
    {
      '1': 'RequestDeleteBusiness',
      '2': '.business.v1.RequestDeleteBusinessRequest',
      '3': '.business.v1.RequestDeleteBusinessResponse'
    },
  ],
};

@$core.Deprecated('Use businessServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    BusinessServiceBase$messageJson = {
  '.business.v1.CreateBusinessRequest': CreateBusinessRequest$json,
  '.business.v1.Business': Business$json,
  '.link.v1.ResourceLink': $1.ResourceLink$json,
  '.business.v1.CreateBusinessResponse': CreateBusinessResponse$json,
  '.business.v1.RequestDeleteBusinessRequest':
      RequestDeleteBusinessRequest$json,
  '.business.v1.RequestDeleteBusinessResponse':
      RequestDeleteBusinessResponse$json,
};

/// Descriptor for `BusinessService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List businessServiceDescriptor = $convert.base64Decode(
    'Cg9CdXNpbmVzc1NlcnZpY2USWQoOQ3JlYXRlQnVzaW5lc3MSIi5idXNpbmVzcy52MS5DcmVhdG'
    'VCdXNpbmVzc1JlcXVlc3QaIy5idXNpbmVzcy52MS5DcmVhdGVCdXNpbmVzc1Jlc3BvbnNlEm4K'
    'FVJlcXVlc3REZWxldGVCdXNpbmVzcxIpLmJ1c2luZXNzLnYxLlJlcXVlc3REZWxldGVCdXNpbm'
    'Vzc1JlcXVlc3QaKi5idXNpbmVzcy52MS5SZXF1ZXN0RGVsZXRlQnVzaW5lc3NSZXNwb25zZQ==');
