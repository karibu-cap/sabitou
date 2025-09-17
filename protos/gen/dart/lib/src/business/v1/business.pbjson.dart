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
      '1': 'permissions',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'permissions'
    },
    {
      '1': 'member_since',
      '3': 4,
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
    'QYAiABKAlSCmJ1c2luZXNzSWQSQQoLcGVybWlzc2lvbnMYAyADKAsyHy5pZGVudGl0eS52MS5C'
    'dXNpbmVzc1Blcm1pc3Npb25SC3Blcm1pc3Npb25zEj0KDG1lbWJlcl9zaW5jZRgEIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC21lbWJlclNpbmNl');

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
  '2': [
    {'1': 'owner_id', '3': 1, '4': 1, '5': 9, '10': 'ownerId'},
  ],
};

/// Descriptor for `GetMyBusinessesRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getMyBusinessesRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRNeUJ1c2luZXNzZXNSZXF1ZXN0EhkKCG93bmVyX2lkGAEgASgJUgdvd25lcklk');

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

@$core.Deprecated('Use createUserToBusinessRequestDescriptor instead')
const CreateUserToBusinessRequest$json = {
  '1': 'CreateUserToBusinessRequest',
  '2': [
    {'1': 'first_name', '3': 1, '4': 1, '5': 9, '10': 'firstName'},
    {'1': 'last_name', '3': 2, '4': 1, '5': 9, '10': 'lastName'},
    {'1': 'user_name', '3': 3, '4': 1, '5': 9, '10': 'userName'},
    {'1': 'phone_number', '3': 4, '4': 1, '5': 9, '10': 'phoneNumber'},
    {'1': 'email', '3': 5, '4': 1, '5': 9, '10': 'email'},
    {'1': 'password', '3': 6, '4': 1, '5': 9, '10': 'password'},
    {'1': 'business_id', '3': 7, '4': 1, '5': 9, '10': 'businessId'},
    {
      '1': 'permissions',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'permissions'
    },
  ],
};

/// Descriptor for `CreateUserToBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserToBusinessRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVVc2VyVG9CdXNpbmVzc1JlcXVlc3QSHQoKZmlyc3RfbmFtZRgBIAEoCVIJZmlyc3'
    'ROYW1lEhsKCWxhc3RfbmFtZRgCIAEoCVIIbGFzdE5hbWUSGwoJdXNlcl9uYW1lGAMgASgJUgh1'
    'c2VyTmFtZRIhCgxwaG9uZV9udW1iZXIYBCABKAlSC3Bob25lTnVtYmVyEhQKBWVtYWlsGAUgAS'
    'gJUgVlbWFpbBIaCghwYXNzd29yZBgGIAEoCVIIcGFzc3dvcmQSHwoLYnVzaW5lc3NfaWQYByAB'
    'KAlSCmJ1c2luZXNzSWQSQQoLcGVybWlzc2lvbnMYCCADKAsyHy5pZGVudGl0eS52MS5CdXNpbm'
    'Vzc1Blcm1pc3Npb25SC3Blcm1pc3Npb25z');

@$core.Deprecated('Use createUserToBusinessResponseDescriptor instead')
const CreateUserToBusinessResponse$json = {
  '1': 'CreateUserToBusinessResponse',
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

/// Descriptor for `CreateUserToBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserToBusinessResponseDescriptor =
    $convert.base64Decode(
        'ChxDcmVhdGVVc2VyVG9CdXNpbmVzc1Jlc3BvbnNlEkQKD2J1c2luZXNzX21lbWJlchgBIAEoCz'
        'IbLmJ1c2luZXNzLnYxLkJ1c2luZXNzTWVtYmVyUg5idXNpbmVzc01lbWJlcg==');

@$core.Deprecated('Use associateUserToBusinessRequestDescriptor instead')
const AssociateUserToBusinessRequest$json = {
  '1': 'AssociateUserToBusinessRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '10': 'businessId'},
    {
      '1': 'permissions',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'permissions'
    },
  ],
};

/// Descriptor for `AssociateUserToBusinessRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List associateUserToBusinessRequestDescriptor =
    $convert.base64Decode(
        'Ch5Bc3NvY2lhdGVVc2VyVG9CdXNpbmVzc1JlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlck'
        'lkEh8KC2J1c2luZXNzX2lkGAIgASgJUgpidXNpbmVzc0lkEkEKC3Blcm1pc3Npb25zGAMgAygL'
        'Mh8uaWRlbnRpdHkudjEuQnVzaW5lc3NQZXJtaXNzaW9uUgtwZXJtaXNzaW9ucw==');

@$core.Deprecated('Use associateUserToBusinessResponseDescriptor instead')
const AssociateUserToBusinessResponse$json = {
  '1': 'AssociateUserToBusinessResponse',
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

/// Descriptor for `AssociateUserToBusinessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List associateUserToBusinessResponseDescriptor =
    $convert.base64Decode(
        'Ch9Bc3NvY2lhdGVVc2VyVG9CdXNpbmVzc1Jlc3BvbnNlEkQKD2J1c2luZXNzX21lbWJlchgBIA'
        'EoCzIbLmJ1c2luZXNzLnYxLkJ1c2luZXNzTWVtYmVyUg5idXNpbmVzc01lbWJlcg==');

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

@$core.Deprecated('Use updateBusinessMemberRequestDescriptor instead')
const UpdateBusinessMemberRequest$json = {
  '1': 'UpdateBusinessMemberRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {
      '1': 'add_permissions',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'addPermissions'
    },
    {
      '1': 'remove_permissions',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'removePermissions'
    },
  ],
};

/// Descriptor for `UpdateBusinessMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessMemberRequestDescriptor = $convert.base64Decode(
    'ChtVcGRhdGVCdXNpbmVzc01lbWJlclJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyAEBcg'
    'IQA1IGdXNlcklkEisKC2J1c2luZXNzX2lkGAIgASgJQgq6SAfIAQFyAhADUgpidXNpbmVzc0lk'
    'EkgKD2FkZF9wZXJtaXNzaW9ucxgFIAMoCzIfLmlkZW50aXR5LnYxLkJ1c2luZXNzUGVybWlzc2'
    'lvblIOYWRkUGVybWlzc2lvbnMSTgoScmVtb3ZlX3Blcm1pc3Npb25zGAYgAygLMh8uaWRlbnRp'
    'dHkudjEuQnVzaW5lc3NQZXJtaXNzaW9uUhFyZW1vdmVQZXJtaXNzaW9ucw==');

@$core.Deprecated('Use updateBusinessMemberResponseDescriptor instead')
const UpdateBusinessMemberResponse$json = {
  '1': 'UpdateBusinessMemberResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'business_member',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.business.v1.BusinessMember',
      '10': 'businessMember'
    },
  ],
};

/// Descriptor for `UpdateBusinessMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessMemberResponseDescriptor =
    $convert.base64Decode(
        'ChxVcGRhdGVCdXNpbmVzc01lbWJlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3'
        'MSRAoPYnVzaW5lc3NfbWVtYmVyGAIgASgLMhsuYnVzaW5lc3MudjEuQnVzaW5lc3NNZW1iZXJS'
        'DmJ1c2luZXNzTWVtYmVy');

@$core.Deprecated('Use getBusinessMemberRequestDescriptor instead')
const GetBusinessMemberRequest$json = {
  '1': 'GetBusinessMemberRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `GetBusinessMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessMemberRequestDescriptor =
    $convert.base64Decode(
        'ChhHZXRCdXNpbmVzc01lbWJlclJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyAEBcgIQA1'
        'IGdXNlcklkEisKC2J1c2luZXNzX2lkGAIgASgJQgq6SAfIAQFyAhADUgpidXNpbmVzc0lk');

@$core.Deprecated('Use getBusinessMemberResponseDescriptor instead')
const GetBusinessMemberResponse$json = {
  '1': 'GetBusinessMemberResponse',
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

/// Descriptor for `GetBusinessMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessMemberResponseDescriptor =
    $convert.base64Decode(
        'ChlHZXRCdXNpbmVzc01lbWJlclJlc3BvbnNlEkQKD2J1c2luZXNzX21lbWJlchgBIAEoCzIbLm'
        'J1c2luZXNzLnYxLkJ1c2luZXNzTWVtYmVyUg5idXNpbmVzc01lbWJlcg==');

@$core.Deprecated('Use streamBusinessMembersRequestDescriptor instead')
const StreamBusinessMembersRequest$json = {
  '1': 'StreamBusinessMembersRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `StreamBusinessMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamBusinessMembersRequestDescriptor =
    $convert.base64Decode(
        'ChxTdHJlYW1CdXNpbmVzc01lbWJlcnNSZXF1ZXN0EisKC2J1c2luZXNzX2lkGAEgASgJQgq6SA'
        'fIAQFyAhADUgpidXNpbmVzc0lk');

@$core.Deprecated('Use streamBusinessMembersResponseDescriptor instead')
const StreamBusinessMembersResponse$json = {
  '1': 'StreamBusinessMembersResponse',
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

/// Descriptor for `StreamBusinessMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamBusinessMembersResponseDescriptor =
    $convert.base64Decode(
        'Ch1TdHJlYW1CdXNpbmVzc01lbWJlcnNSZXNwb25zZRJGChBidXNpbmVzc19tZW1iZXJzGAEgAy'
        'gLMhsuYnVzaW5lc3MudjEuQnVzaW5lc3NNZW1iZXJSD2J1c2luZXNzTWVtYmVycw==');

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
      '1': 'CreateUserToBusiness',
      '2': '.business.v1.CreateUserToBusinessRequest',
      '3': '.business.v1.CreateUserToBusinessResponse'
    },
    {
      '1': 'AssociateUserToBusiness',
      '2': '.business.v1.AssociateUserToBusinessRequest',
      '3': '.business.v1.AssociateUserToBusinessResponse'
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
    {
      '1': 'GetBusinessMember',
      '2': '.business.v1.GetBusinessMemberRequest',
      '3': '.business.v1.GetBusinessMemberResponse'
    },
    {
      '1': 'UpdateBusinessMember',
      '2': '.business.v1.UpdateBusinessMemberRequest',
      '3': '.business.v1.UpdateBusinessMemberResponse'
    },
    {
      '1': 'StreamBusinessMembers',
      '2': '.business.v1.StreamBusinessMembersRequest',
      '3': '.business.v1.StreamBusinessMembersResponse',
      '6': true
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
  '.business.v1.CreateUserToBusinessRequest': CreateUserToBusinessRequest$json,
  '.identity.v1.BusinessPermission': $0.BusinessPermission$json,
  '.business.v1.CreateUserToBusinessResponse':
      CreateUserToBusinessResponse$json,
  '.business.v1.BusinessMember': BusinessMember$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.business.v1.AssociateUserToBusinessRequest':
      AssociateUserToBusinessRequest$json,
  '.business.v1.AssociateUserToBusinessResponse':
      AssociateUserToBusinessResponse$json,
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
  '.business.v1.GetBusinessMemberRequest': GetBusinessMemberRequest$json,
  '.business.v1.GetBusinessMemberResponse': GetBusinessMemberResponse$json,
  '.business.v1.UpdateBusinessMemberRequest': UpdateBusinessMemberRequest$json,
  '.business.v1.UpdateBusinessMemberResponse':
      UpdateBusinessMemberResponse$json,
  '.business.v1.StreamBusinessMembersRequest':
      StreamBusinessMembersRequest$json,
  '.business.v1.StreamBusinessMembersResponse':
      StreamBusinessMembersResponse$json,
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
    'NSZXNwb25zZRJrChRDcmVhdGVVc2VyVG9CdXNpbmVzcxIoLmJ1c2luZXNzLnYxLkNyZWF0ZVVz'
    'ZXJUb0J1c2luZXNzUmVxdWVzdBopLmJ1c2luZXNzLnYxLkNyZWF0ZVVzZXJUb0J1c2luZXNzUm'
    'VzcG9uc2USdAoXQXNzb2NpYXRlVXNlclRvQnVzaW5lc3MSKy5idXNpbmVzcy52MS5Bc3NvY2lh'
    'dGVVc2VyVG9CdXNpbmVzc1JlcXVlc3QaLC5idXNpbmVzcy52MS5Bc3NvY2lhdGVVc2VyVG9CdX'
    'NpbmVzc1Jlc3BvbnNlEnEKFlJlbW92ZVVzZXJGcm9tQnVzaW5lc3MSKi5idXNpbmVzcy52MS5S'
    'ZW1vdmVVc2VyRnJvbUJ1c2luZXNzUmVxdWVzdBorLmJ1c2luZXNzLnYxLlJlbW92ZVVzZXJGcm'
    '9tQnVzaW5lc3NSZXNwb25zZRJxChZDaGFuZ2VCdXNpbmVzc0N1cnJlbmN5EiouYnVzaW5lc3Mu'
    'djEuQ2hhbmdlQnVzaW5lc3NDdXJyZW5jeVJlcXVlc3QaKy5idXNpbmVzcy52MS5DaGFuZ2VCdX'
    'NpbmVzc0N1cnJlbmN5UmVzcG9uc2USZQoSR2V0QnVzaW5lc3NNZW1iZXJzEiYuYnVzaW5lc3Mu'
    'djEuR2V0QnVzaW5lc3NNZW1iZXJzUmVxdWVzdBonLmJ1c2luZXNzLnYxLkdldEJ1c2luZXNzTW'
    'VtYmVyc1Jlc3BvbnNlEmIKEUdldEJ1c2luZXNzTWVtYmVyEiUuYnVzaW5lc3MudjEuR2V0QnVz'
    'aW5lc3NNZW1iZXJSZXF1ZXN0GiYuYnVzaW5lc3MudjEuR2V0QnVzaW5lc3NNZW1iZXJSZXNwb2'
    '5zZRJrChRVcGRhdGVCdXNpbmVzc01lbWJlchIoLmJ1c2luZXNzLnYxLlVwZGF0ZUJ1c2luZXNz'
    'TWVtYmVyUmVxdWVzdBopLmJ1c2luZXNzLnYxLlVwZGF0ZUJ1c2luZXNzTWVtYmVyUmVzcG9uc2'
    'UScAoVU3RyZWFtQnVzaW5lc3NNZW1iZXJzEikuYnVzaW5lc3MudjEuU3RyZWFtQnVzaW5lc3NN'
    'ZW1iZXJzUmVxdWVzdBoqLmJ1c2luZXNzLnYxLlN0cmVhbUJ1c2luZXNzTWVtYmVyc1Jlc3Bvbn'
    'NlMAE=');
