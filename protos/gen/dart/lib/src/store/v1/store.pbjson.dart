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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use storeCostingMethodDescriptor instead')
const StoreCostingMethod$json = {
  '1': 'StoreCostingMethod',
  '2': [
    {'1': 'STORE_COSTING_METHOD_UNSPECIFIED', '2': 0},
    {'1': 'STORE_COSTING_METHOD_FIFO', '2': 1},
    {'1': 'STORE_COSTING_METHOD_AVERAGE', '2': 2},
  ],
};

/// Descriptor for `StoreCostingMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List storeCostingMethodDescriptor = $convert.base64Decode(
    'ChJTdG9yZUNvc3RpbmdNZXRob2QSJAogU1RPUkVfQ09TVElOR19NRVRIT0RfVU5TUEVDSUZJRU'
    'QQABIdChlTVE9SRV9DT1NUSU5HX01FVEhPRF9GSUZPEAESIAocU1RPUkVfQ09TVElOR19NRVRI'
    'T0RfQVZFUkFHRRAC');

@$core.Deprecated('Use storeMemberStatusDescriptor instead')
const StoreMemberStatus$json = {
  '1': 'StoreMemberStatus',
  '2': [
    {'1': 'STORE_MEMBER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'STORE_MEMBER_STATUS_ACTIVE', '2': 1},
    {'1': 'STORE_MEMBER_STATUS_PENDING', '2': 2},
    {'1': 'STORE_MEMBER_STATUS_INACTIVE', '2': 3},
    {'1': 'STORE_MEMBER_STATUS_BANNED', '2': 4},
    {'1': 'STORE_MEMBER_STATUS_REJECTED', '2': 5},
    {'1': 'STORE_MEMBER_STATUS_EXPIRED', '2': 6},
  ],
};

/// Descriptor for `StoreMemberStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List storeMemberStatusDescriptor = $convert.base64Decode(
    'ChFTdG9yZU1lbWJlclN0YXR1cxIjCh9TVE9SRV9NRU1CRVJfU1RBVFVTX1VOU1BFQ0lGSUVEEA'
    'ASHgoaU1RPUkVfTUVNQkVSX1NUQVRVU19BQ1RJVkUQARIfChtTVE9SRV9NRU1CRVJfU1RBVFVT'
    'X1BFTkRJTkcQAhIgChxTVE9SRV9NRU1CRVJfU1RBVFVTX0lOQUNUSVZFEAMSHgoaU1RPUkVfTU'
    'VNQkVSX1NUQVRVU19CQU5ORUQQBBIgChxTVE9SRV9NRU1CRVJfU1RBVFVTX1JFSkVDVEVEEAUS'
    'HwobU1RPUkVfTUVNQkVSX1NUQVRVU19FWFBJUkVEEAY=');

@$core.Deprecated('Use onboardingTypeDescriptor instead')
const OnboardingType$json = {
  '1': 'OnboardingType',
  '2': [
    {'1': 'ONBOARDING_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'ONBOARDING_TYPE_DIRECT', '2': 1},
    {'1': 'ONBOARDING_TYPE_INVITE', '2': 2},
  ],
};

/// Descriptor for `OnboardingType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List onboardingTypeDescriptor = $convert.base64Decode(
    'Cg5PbmJvYXJkaW5nVHlwZRIfChtPTkJPQVJESU5HX1RZUEVfVU5TUEVDSUZJRUQQABIaChZPTk'
    'JPQVJESU5HX1RZUEVfRElSRUNUEAESGgoWT05CT0FSRElOR19UWVBFX0lOVklURRAC');

@$core.Deprecated('Use addressDescriptor instead')
const Address$json = {
  '1': 'Address',
  '2': [
    {'1': 'street', '3': 1, '4': 1, '5': 9, '10': 'street'},
    {'1': 'city', '3': 2, '4': 1, '5': 9, '10': 'city'},
    {'1': 'region', '3': 3, '4': 1, '5': 9, '10': 'region'},
    {'1': 'postal_code', '3': 4, '4': 1, '5': 9, '10': 'postalCode'},
    {'1': 'country', '3': 5, '4': 1, '5': 9, '10': 'country'},
  ],
};

/// Descriptor for `Address`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addressDescriptor = $convert.base64Decode(
    'CgdBZGRyZXNzEhYKBnN0cmVldBgBIAEoCVIGc3RyZWV0EhIKBGNpdHkYAiABKAlSBGNpdHkSFg'
    'oGcmVnaW9uGAMgASgJUgZyZWdpb24SHwoLcG9zdGFsX2NvZGUYBCABKAlSCnBvc3RhbENvZGUS'
    'GAoHY291bnRyeRgFIAEoCVIHY291bnRyeQ==');

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
    {
      '1': 'created_at',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 4,
      '10': 'updatedAt',
      '17': true
    },
    {'1': 'phone', '3': 11, '4': 1, '5': 9, '9': 5, '10': 'phone', '17': true},
    {
      '1': 'address',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Address',
      '9': 6,
      '10': 'address',
      '17': true
    },
    {'1': 'email', '3': 13, '4': 1, '5': 9, '9': 7, '10': 'email', '17': true},
    {
      '1': 'costing_method',
      '3': 14,
      '4': 1,
      '5': 14,
      '6': '.store.v1.StoreCostingMethod',
      '9': 8,
      '10': 'costingMethod',
      '17': true
    },
    {'1': 'tax', '3': 15, '4': 1, '5': 1, '9': 9, '10': 'tax', '17': true},
    {
      '1': 'postal_box',
      '3': 16,
      '4': 1,
      '5': 9,
      '9': 10,
      '10': 'postalBox',
      '17': true
    },
    {'1': 'nui', '3': 17, '4': 1, '5': 9, '9': 11, '10': 'nui', '17': true},
    {
      '1': 'tax_payer_number',
      '3': 18,
      '4': 1,
      '5': 9,
      '9': 12,
      '10': 'taxPayerNumber',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
    {'1': '_external_links_ids'},
    {'1': '_updated_at'},
    {'1': '_phone'},
    {'1': '_address'},
    {'1': '_email'},
    {'1': '_costing_method'},
    {'1': '_tax'},
    {'1': '_postal_box'},
    {'1': '_nui'},
    {'1': '_tax_payer_number'},
  ],
};

/// Descriptor for `Store`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeDescriptor = $convert.base64Decode(
    'CgVTdG9yZRIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESEgoEbmFtZRgDIAEoCVIEbmFtZR'
    'IlCgtkZXNjcmlwdGlvbhgFIAEoCUgBUgtkZXNjcmlwdGlvbogBARIlCgxsb2dvX2xpbmtfaWQY'
    'BiABKAlIAlIKbG9nb0xpbmtJZIgBARIxChJleHRlcm5hbF9saW5rc19pZHMYByABKAlIA1IQZX'
    'h0ZXJuYWxMaW5rc0lkc4gBARIfCgtidXNpbmVzc19pZBgIIAEoCVIKYnVzaW5lc3NJZBI5Cgpj'
    'cmVhdGVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0Ej'
    '4KCnVwZGF0ZWRfYXQYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSARSCXVwZGF0'
    'ZWRBdIgBARIZCgVwaG9uZRgLIAEoCUgFUgVwaG9uZYgBARIwCgdhZGRyZXNzGAwgASgLMhEuc3'
    'RvcmUudjEuQWRkcmVzc0gGUgdhZGRyZXNziAEBEhkKBWVtYWlsGA0gASgJSAdSBWVtYWlsiAEB'
    'EkgKDmNvc3RpbmdfbWV0aG9kGA4gASgOMhwuc3RvcmUudjEuU3RvcmVDb3N0aW5nTWV0aG9kSA'
    'hSDWNvc3RpbmdNZXRob2SIAQESFQoDdGF4GA8gASgBSAlSA3RheIgBARIiCgpwb3N0YWxfYm94'
    'GBAgASgJSApSCXBvc3RhbEJveIgBARIVCgNudWkYESABKAlIC1IDbnVpiAEBEi0KEHRheF9wYX'
    'llcl9udW1iZXIYEiABKAlIDFIOdGF4UGF5ZXJOdW1iZXKIAQFCCQoHX3JlZl9pZEIOCgxfZGVz'
    'Y3JpcHRpb25CDwoNX2xvZ29fbGlua19pZEIVChNfZXh0ZXJuYWxfbGlua3NfaWRzQg0KC191cG'
    'RhdGVkX2F0QggKBl9waG9uZUIKCghfYWRkcmVzc0IICgZfZW1haWxCEQoPX2Nvc3RpbmdfbWV0'
    'aG9kQgYKBF90YXhCDQoLX3Bvc3RhbF9ib3hCBgoEX251aUITChFfdGF4X3BheWVyX251bWJlcg'
    '==');

@$core.Deprecated('Use storeMemberDescriptor instead')
const StoreMember$json = {
  '1': 'StoreMember',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'permissions',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermissions',
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
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.store.v1.StoreMemberStatus',
      '10': 'status'
    },
    {
      '1': 'onboarding_type',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.store.v1.OnboardingType',
      '10': 'onboardingType'
    },
    {
      '1': 'invitation_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'invitationId',
      '17': true
    },
  ],
  '8': [
    {'1': '_invitation_id'},
  ],
};

/// Descriptor for `StoreMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeMemberDescriptor = $convert.base64Decode(
    'CgtTdG9yZU1lbWJlchIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGQoIc3RvcmVfaWQYAiABKA'
    'lSB3N0b3JlSWQSPwoLcGVybWlzc2lvbnMYAyABKAsyHS5pZGVudGl0eS52MS5TdG9yZVBlcm1p'
    'c3Npb25zUgtwZXJtaXNzaW9ucxI9CgxtZW1iZXJfc2luY2UYBCABKAsyGi5nb29nbGUucHJvdG'
    '9idWYuVGltZXN0YW1wUgttZW1iZXJTaW5jZRIzCgZzdGF0dXMYBSABKA4yGy5zdG9yZS52MS5T'
    'dG9yZU1lbWJlclN0YXR1c1IGc3RhdHVzEkEKD29uYm9hcmRpbmdfdHlwZRgGIAEoDjIYLnN0b3'
    'JlLnYxLk9uYm9hcmRpbmdUeXBlUg5vbmJvYXJkaW5nVHlwZRIoCg1pbnZpdGF0aW9uX2lkGAcg'
    'ASgJSABSDGludml0YXRpb25JZIgBAUIQCg5faW52aXRhdGlvbl9pZA==');

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
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.store.v1.Address': Address$json,
  '.store.v1.CreateStoreResponse': CreateStoreResponse$json,
  '.store.v1.DeleteStoreRequest': DeleteStoreRequest$json,
  '.store.v1.DeleteStoreResponse': DeleteStoreResponse$json,
};

/// Descriptor for `StoreService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List storeServiceDescriptor = $convert.base64Decode(
    'CgxTdG9yZVNlcnZpY2USTAoLQ3JlYXRlU3RvcmUSHC5zdG9yZS52MS5DcmVhdGVTdG9yZVJlcX'
    'Vlc3QaHS5zdG9yZS52MS5DcmVhdGVTdG9yZVJlc3BvbnNlIgASTAoLRGVsZXRlU3RvcmUSHC5z'
    'dG9yZS52MS5EZWxldGVTdG9yZVJlcXVlc3QaHS5zdG9yZS52MS5EZWxldGVTdG9yZVJlc3Bvbn'
    'NlIgA=');
