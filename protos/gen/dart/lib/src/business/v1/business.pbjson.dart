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

import '../../google/protobuf/timestamp.pbjson.dart' as $1;
import '../../identity/v1/permission.pbjson.dart' as $0;
import '../../link/v1/link.pbjson.dart' as $2;

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
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
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
    'a3NJZHNCCQoHX3JlZl9pZEIOCgxfZGVzY3JpcHRpb25CDwoNX2xvZ29fbGlua19pZA==');

@$core.Deprecated('Use businessMemberDescriptor instead')
const BusinessMember$json = {
  '1': 'BusinessMember',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '10': 'businessId'},
    {
      '1': 'permissions',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.Permission',
      '10': 'permissions'
    },
    {
      '1': 'permissions_groups_ids',
      '3': 4,
      '4': 3,
      '5': 9,
      '10': 'permissionsGroupsIds'
    },
    {
      '1': 'member_since',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'memberSince'
    },
  ],
};

/// Descriptor for `BusinessMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessMemberDescriptor = $convert.base64Decode(
    'Cg5CdXNpbmVzc01lbWJlchIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSHwoLYnVzaW5lc3NfaW'
    'QYAiABKAlSCmJ1c2luZXNzSWQSOQoLcGVybWlzc2lvbnMYAyADKAsyFy5pZGVudGl0eS52MS5Q'
    'ZXJtaXNzaW9uUgtwZXJtaXNzaW9ucxI0ChZwZXJtaXNzaW9uc19ncm91cHNfaWRzGAQgAygJUh'
    'RwZXJtaXNzaW9uc0dyb3Vwc0lkcxI9CgxtZW1iZXJfc2luY2UYBSABKAsyGi5nb29nbGUucHJv'
    'dG9idWYuVGltZXN0YW1wUgttZW1iZXJTaW5jZQ==');

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

@$core.Deprecated('Use changeBusinessCurrencyRequestDescriptor instead')
const ChangeBusinessCurrencyRequest$json = {
  '1': 'ChangeBusinessCurrencyRequest',
  '2': [
    {
      '1': 'currency_change_policy',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.business.v1.CurrencyChangePolicyType',
      '10': 'currencyChangePolicy'
    },
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '10': 'businessId'},
    {'1': 'country_code', '3': 3, '4': 1, '5': 9, '10': 'countryCode'},
  ],
};

/// Descriptor for `ChangeBusinessCurrencyRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeBusinessCurrencyRequestDescriptor = $convert.base64Decode(
    'Ch1DaGFuZ2VCdXNpbmVzc0N1cnJlbmN5UmVxdWVzdBJbChZjdXJyZW5jeV9jaGFuZ2VfcG9saW'
    'N5GAEgASgOMiUuYnVzaW5lc3MudjEuQ3VycmVuY3lDaGFuZ2VQb2xpY3lUeXBlUhRjdXJyZW5j'
    'eUNoYW5nZVBvbGljeRIfCgtidXNpbmVzc19pZBgCIAEoCVIKYnVzaW5lc3NJZBIhCgxjb3VudH'
    'J5X2NvZGUYAyABKAlSC2NvdW50cnlDb2Rl');

@$core.Deprecated('Use changeBusinessCurrencyResponseDescriptor instead')
const ChangeBusinessCurrencyResponse$json = {
  '1': 'ChangeBusinessCurrencyResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `ChangeBusinessCurrencyResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List changeBusinessCurrencyResponseDescriptor =
    $convert.base64Decode(
        'Ch5DaGFuZ2VCdXNpbmVzc0N1cnJlbmN5UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2'
        'Vzcw==');

@$core.Deprecated('Use getMyBusinessesRequestDescriptor instead')
const GetMyBusinessesRequest$json = {
  '1': 'GetMyBusinessesRequest',
};

/// Descriptor for `GetMyBusinessesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyBusinessesRequestDescriptor =
    $convert.base64Decode('ChZHZXRNeUJ1c2luZXNzZXNSZXF1ZXN0');

@$core.Deprecated('Use getMyBusinessesResponseDescriptor instead')
const GetMyBusinessesResponse$json = {
  '1': 'GetMyBusinessesResponse',
  '2': [
    {
      '1': 'businesses',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.business.v1.Business',
      '10': 'businesses'
    },
  ],
};

/// Descriptor for `GetMyBusinessesResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyBusinessesResponseDescriptor =
    $convert.base64Decode(
        'ChdHZXRNeUJ1c2luZXNzZXNSZXNwb25zZRI1CgpidXNpbmVzc2VzGAEgAygLMhUuYnVzaW5lc3'
        'MudjEuQnVzaW5lc3NSCmJ1c2luZXNzZXM=');

@$core.Deprecated('Use getBusinessDetailsRequestDescriptor instead')
const GetBusinessDetailsRequest$json = {
  '1': 'GetBusinessDetailsRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `GetBusinessDetailsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessDetailsRequestDescriptor =
    $convert.base64Decode(
        'ChlHZXRCdXNpbmVzc0RldGFpbHNSZXF1ZXN0EisKC2J1c2luZXNzX2lkGAEgASgJQgq6SAfIAQ'
        'FyAhADUgpidXNpbmVzc0lk');

@$core.Deprecated('Use getBusinessDetailsResponseDescriptor instead')
const GetBusinessDetailsResponse$json = {
  '1': 'GetBusinessDetailsResponse',
  '2': [
    {
      '1': 'business',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.business.v1.Business',
      '10': 'business'
    },
  ],
};

/// Descriptor for `GetBusinessDetailsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessDetailsResponseDescriptor =
    $convert.base64Decode(
        'ChpHZXRCdXNpbmVzc0RldGFpbHNSZXNwb25zZRIxCghidXNpbmVzcxgBIAEoCzIVLmJ1c2luZX'
        'NzLnYxLkJ1c2luZXNzUghidXNpbmVzcw==');

@$core.Deprecated('Use updateBusinessRequestDescriptor instead')
const UpdateBusinessRequest$json = {
  '1': 'UpdateBusinessRequest',
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

/// Descriptor for `UpdateBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVCdXNpbmVzc1JlcXVlc3QSMQoIYnVzaW5lc3MYASABKAsyFS5idXNpbmVzcy52MS'
    '5CdXNpbmVzc1IIYnVzaW5lc3MSKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0lt'
    'YWdliAEBEjwKDmV4dGVybmFsX2xpbmtzGAMgAygLMhUubGluay52MS5SZXNvdXJjZUxpbmtSDW'
    'V4dGVybmFsTGlua3NCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use updateBusinessResponseDescriptor instead')
const UpdateBusinessResponse$json = {
  '1': 'UpdateBusinessResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessResponseDescriptor =
    $convert.base64Decode(
        'ChZVcGRhdGVCdXNpbmVzc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

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

@$core.Deprecated('Use addUserToBusinessRequestDescriptor instead')
const AddUserToBusinessRequest$json = {
  '1': 'AddUserToBusinessRequest',
  '2': [
    {'1': 'user_name', '3': 1, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
    {'1': 'business_id', '3': 3, '4': 1, '5': 9, '10': 'businessId'},
  ],
};

/// Descriptor for `AddUserToBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToBusinessRequestDescriptor = $convert.base64Decode(
    'ChhBZGRVc2VyVG9CdXNpbmVzc1JlcXVlc3QSGwoJdXNlcl9uYW1lGAEgASgJUgh1c2VyTmFtZR'
    'IaCghwYXNzd29yZBgCIAEoCVIIcGFzc3dvcmQSHwoLYnVzaW5lc3NfaWQYAyABKAlSCmJ1c2lu'
    'ZXNzSWQ=');

@$core.Deprecated('Use addUserToBusinessResponseDescriptor instead')
const AddUserToBusinessResponse$json = {
  '1': 'AddUserToBusinessResponse',
  '2': [
    {
      '1': 'business_member',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.business.v1.BusinessMember',
      '10': 'businessMember'
    },
  ],
};

/// Descriptor for `AddUserToBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToBusinessResponseDescriptor =
    $convert.base64Decode(
        'ChlBZGRVc2VyVG9CdXNpbmVzc1Jlc3BvbnNlEkQKD2J1c2luZXNzX21lbWJlchgBIAEoCzIbLm'
        'J1c2luZXNzLnYxLkJ1c2luZXNzTWVtYmVyUg5idXNpbmVzc01lbWJlcg==');

@$core.Deprecated('Use removeUserFromBusinessRequestDescriptor instead')
const RemoveUserFromBusinessRequest$json = {
  '1': 'RemoveUserFromBusinessRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `RemoveUserFromBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromBusinessRequestDescriptor =
    $convert.base64Decode(
        'Ch1SZW1vdmVVc2VyRnJvbUJ1c2luZXNzUmVxdWVzdBIjCgd1c2VyX2lkGAEgASgJQgq6SAfIAQ'
        'FyAhADUgZ1c2VySWQSKwoLYnVzaW5lc3NfaWQYAiABKAlCCrpIB8gBAXICEANSCmJ1c2luZXNz'
        'SWQ=');

@$core.Deprecated('Use removeUserFromBusinessResponseDescriptor instead')
const RemoveUserFromBusinessResponse$json = {
  '1': 'RemoveUserFromBusinessResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveUserFromBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromBusinessResponseDescriptor =
    $convert.base64Decode(
        'Ch5SZW1vdmVVc2VyRnJvbUJ1c2luZXNzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2'
        'Vzcw==');

@$core.Deprecated('Use getBusinessMembersRequestDescriptor instead')
const GetBusinessMembersRequest$json = {
  '1': 'GetBusinessMembersRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `GetBusinessMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessMembersRequestDescriptor =
    $convert.base64Decode(
        'ChlHZXRCdXNpbmVzc01lbWJlcnNSZXF1ZXN0EisKC2J1c2luZXNzX2lkGAEgASgJQgq6SAfIAQ'
        'FyAhADUgpidXNpbmVzc0lk');

@$core.Deprecated('Use getBusinessMembersResponseDescriptor instead')
const GetBusinessMembersResponse$json = {
  '1': 'GetBusinessMembersResponse',
  '2': [
    {
      '1': 'business_members',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.business.v1.BusinessMember',
      '10': 'businessMembers'
    },
  ],
};

/// Descriptor for `GetBusinessMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessMembersResponseDescriptor =
    $convert.base64Decode(
        'ChpHZXRCdXNpbmVzc01lbWJlcnNSZXNwb25zZRJGChBidXNpbmVzc19tZW1iZXJzGAEgAygLMh'
        'suYnVzaW5lc3MudjEuQnVzaW5lc3NNZW1iZXJSD2J1c2luZXNzTWVtYmVycw==');

const $core.Map<$core.String, $core.dynamic> BusinessServiceBase$json = {
  '1': 'BusinessService',
  '2': [
    {
      '1': 'CreateBusiness',
      '2': '.business.v1.CreateBusinessRequest',
      '3': '.business.v1.CreateBusinessResponse'
    },
    {
      '1': 'GetMyBusinesses',
      '2': '.business.v1.GetMyBusinessesRequest',
      '3': '.business.v1.GetMyBusinessesResponse'
    },
    {
      '1': 'GetBusinessDetails',
      '2': '.business.v1.GetBusinessDetailsRequest',
      '3': '.business.v1.GetBusinessDetailsResponse'
    },
    {
      '1': 'UpdateBusiness',
      '2': '.business.v1.UpdateBusinessRequest',
      '3': '.business.v1.UpdateBusinessResponse'
    },
    {
      '1': 'RequestDeleteBusiness',
      '2': '.business.v1.RequestDeleteBusinessRequest',
      '3': '.business.v1.RequestDeleteBusinessResponse'
    },
    {
      '1': 'AddUserToBusiness',
      '2': '.business.v1.AddUserToBusinessRequest',
      '3': '.business.v1.AddUserToBusinessResponse'
    },
    {
      '1': 'RemoveUserFromBusiness',
      '2': '.business.v1.RemoveUserFromBusinessRequest',
      '3': '.business.v1.RemoveUserFromBusinessResponse'
    },
    {
      '1': 'ChangeBusinessCurrency',
      '2': '.business.v1.ChangeBusinessCurrencyRequest',
      '3': '.business.v1.ChangeBusinessCurrencyResponse'
    },
    {
      '1': 'GetBusinessMembers',
      '2': '.business.v1.GetBusinessMembersRequest',
      '3': '.business.v1.GetBusinessMembersResponse'
    },
  ],
};

@$core.Deprecated('Use businessServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    BusinessServiceBase$messageJson = {
  '.business.v1.CreateBusinessRequest': CreateBusinessRequest$json,
  '.business.v1.Business': Business$json,
  '.link.v1.ResourceLink': $2.ResourceLink$json,
  '.business.v1.CreateBusinessResponse': CreateBusinessResponse$json,
  '.business.v1.GetMyBusinessesRequest': GetMyBusinessesRequest$json,
  '.business.v1.GetMyBusinessesResponse': GetMyBusinessesResponse$json,
  '.business.v1.GetBusinessDetailsRequest': GetBusinessDetailsRequest$json,
  '.business.v1.GetBusinessDetailsResponse': GetBusinessDetailsResponse$json,
  '.business.v1.UpdateBusinessRequest': UpdateBusinessRequest$json,
  '.business.v1.UpdateBusinessResponse': UpdateBusinessResponse$json,
  '.business.v1.RequestDeleteBusinessRequest':
      RequestDeleteBusinessRequest$json,
  '.business.v1.RequestDeleteBusinessResponse':
      RequestDeleteBusinessResponse$json,
  '.business.v1.AddUserToBusinessRequest': AddUserToBusinessRequest$json,
  '.business.v1.AddUserToBusinessResponse': AddUserToBusinessResponse$json,
  '.business.v1.BusinessMember': BusinessMember$json,
  '.identity.v1.Permission': $0.Permission$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.business.v1.RemoveUserFromBusinessRequest':
      RemoveUserFromBusinessRequest$json,
  '.business.v1.RemoveUserFromBusinessResponse':
      RemoveUserFromBusinessResponse$json,
  '.business.v1.ChangeBusinessCurrencyRequest':
      ChangeBusinessCurrencyRequest$json,
  '.business.v1.ChangeBusinessCurrencyResponse':
      ChangeBusinessCurrencyResponse$json,
  '.business.v1.GetBusinessMembersRequest': GetBusinessMembersRequest$json,
  '.business.v1.GetBusinessMembersResponse': GetBusinessMembersResponse$json,
};

/// Descriptor for `BusinessService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List businessServiceDescriptor = $convert.base64Decode(
    'Cg9CdXNpbmVzc1NlcnZpY2USWQoOQ3JlYXRlQnVzaW5lc3MSIi5idXNpbmVzcy52MS5DcmVhdG'
    'VCdXNpbmVzc1JlcXVlc3QaIy5idXNpbmVzcy52MS5DcmVhdGVCdXNpbmVzc1Jlc3BvbnNlElwK'
    'D0dldE15QnVzaW5lc3NlcxIjLmJ1c2luZXNzLnYxLkdldE15QnVzaW5lc3Nlc1JlcXVlc3QaJC'
    '5idXNpbmVzcy52MS5HZXRNeUJ1c2luZXNzZXNSZXNwb25zZRJlChJHZXRCdXNpbmVzc0RldGFp'
    'bHMSJi5idXNpbmVzcy52MS5HZXRCdXNpbmVzc0RldGFpbHNSZXF1ZXN0GicuYnVzaW5lc3Mudj'
    'EuR2V0QnVzaW5lc3NEZXRhaWxzUmVzcG9uc2USWQoOVXBkYXRlQnVzaW5lc3MSIi5idXNpbmVz'
    'cy52MS5VcGRhdGVCdXNpbmVzc1JlcXVlc3QaIy5idXNpbmVzcy52MS5VcGRhdGVCdXNpbmVzc1'
    'Jlc3BvbnNlEm4KFVJlcXVlc3REZWxldGVCdXNpbmVzcxIpLmJ1c2luZXNzLnYxLlJlcXVlc3RE'
    'ZWxldGVCdXNpbmVzc1JlcXVlc3QaKi5idXNpbmVzcy52MS5SZXF1ZXN0RGVsZXRlQnVzaW5lc3'
    'NSZXNwb25zZRJiChFBZGRVc2VyVG9CdXNpbmVzcxIlLmJ1c2luZXNzLnYxLkFkZFVzZXJUb0J1'
    'c2luZXNzUmVxdWVzdBomLmJ1c2luZXNzLnYxLkFkZFVzZXJUb0J1c2luZXNzUmVzcG9uc2UScQ'
    'oWUmVtb3ZlVXNlckZyb21CdXNpbmVzcxIqLmJ1c2luZXNzLnYxLlJlbW92ZVVzZXJGcm9tQnVz'
    'aW5lc3NSZXF1ZXN0GisuYnVzaW5lc3MudjEuUmVtb3ZlVXNlckZyb21CdXNpbmVzc1Jlc3Bvbn'
    'NlEnEKFkNoYW5nZUJ1c2luZXNzQ3VycmVuY3kSKi5idXNpbmVzcy52MS5DaGFuZ2VCdXNpbmVz'
    'c0N1cnJlbmN5UmVxdWVzdBorLmJ1c2luZXNzLnYxLkNoYW5nZUJ1c2luZXNzQ3VycmVuY3lSZX'
    'Nwb25zZRJlChJHZXRCdXNpbmVzc01lbWJlcnMSJi5idXNpbmVzcy52MS5HZXRCdXNpbmVzc01l'
    'bWJlcnNSZXF1ZXN0GicuYnVzaW5lc3MudjEuR2V0QnVzaW5lc3NNZW1iZXJzUmVzcG9uc2U=');
