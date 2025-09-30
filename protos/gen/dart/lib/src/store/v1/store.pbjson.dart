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
import '../../identity/v1/permission.pbjson.dart' as $2;
import '../../identity/v1/user.pbjson.dart' as $1;
import '../../link/v1/link.pbjson.dart' as $3;

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
  ],
};

/// Descriptor for `StoreMemberStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List storeMemberStatusDescriptor = $convert.base64Decode(
    'ChFTdG9yZU1lbWJlclN0YXR1cxIjCh9TVE9SRV9NRU1CRVJfU1RBVFVTX1VOU1BFQ0lGSUVEEA'
    'ASHgoaU1RPUkVfTUVNQkVSX1NUQVRVU19BQ1RJVkUQARIfChtTVE9SRV9NRU1CRVJfU1RBVFVT'
    'X1BFTkRJTkcQAhIgChxTVE9SRV9NRU1CRVJfU1RBVFVTX0lOQUNUSVZFEAMSHgoaU1RPUkVfTU'
    'VNQkVSX1NUQVRVU19CQU5ORUQQBA==');

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
    {
      '1': 'contact_info',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'contactInfo',
      '17': true
    },
    {
      '1': 'address',
      '3': 12,
      '4': 1,
      '5': 9,
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
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
    {'1': '_external_links_ids'},
    {'1': '_updated_at'},
    {'1': '_contact_info'},
    {'1': '_address'},
    {'1': '_email'},
    {'1': '_costing_method'},
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
    'ZWRBdIgBARImCgxjb250YWN0X2luZm8YCyABKAlIBVILY29udGFjdEluZm+IAQESHQoHYWRkcm'
    'VzcxgMIAEoCUgGUgdhZGRyZXNziAEBEhkKBWVtYWlsGA0gASgJSAdSBWVtYWlsiAEBEkgKDmNv'
    'c3RpbmdfbWV0aG9kGA4gASgOMhwuc3RvcmUudjEuU3RvcmVDb3N0aW5nTWV0aG9kSAhSDWNvc3'
    'RpbmdNZXRob2SIAQFCCQoHX3JlZl9pZEIOCgxfZGVzY3JpcHRpb25CDwoNX2xvZ29fbGlua19p'
    'ZEIVChNfZXh0ZXJuYWxfbGlua3NfaWRzQg0KC191cGRhdGVkX2F0Qg8KDV9jb250YWN0X2luZm'
    '9CCgoIX2FkZHJlc3NCCAoGX2VtYWlsQhEKD19jb3N0aW5nX21ldGhvZA==');

@$core.Deprecated('Use storeMemberDescriptor instead')
const StoreMember$json = {
  '1': 'StoreMember',
  '2': [
    {
      '1': 'user',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.User',
      '10': 'user'
    },
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
  ],
};

/// Descriptor for `StoreMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeMemberDescriptor = $convert.base64Decode(
    'CgtTdG9yZU1lbWJlchIlCgR1c2VyGAEgASgLMhEuaWRlbnRpdHkudjEuVXNlclIEdXNlchIZCg'
    'hzdG9yZV9pZBgCIAEoCVIHc3RvcmVJZBI/CgtwZXJtaXNzaW9ucxgDIAEoCzIdLmlkZW50aXR5'
    'LnYxLlN0b3JlUGVybWlzc2lvbnNSC3Blcm1pc3Npb25zEj0KDG1lbWJlcl9zaW5jZRgEIAEoCz'
    'IaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC21lbWJlclNpbmNlEjMKBnN0YXR1cxgFIAEo'
    'DjIbLnN0b3JlLnYxLlN0b3JlTWVtYmVyU3RhdHVzUgZzdGF0dXM=');

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

@$core.Deprecated('Use getBusinessStoresRequestDescriptor instead')
const GetBusinessStoresRequest$json = {
  '1': 'GetBusinessStoresRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `GetBusinessStoresRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessStoresRequestDescriptor =
    $convert.base64Decode(
        'ChhHZXRCdXNpbmVzc1N0b3Jlc1JlcXVlc3QSKwoLYnVzaW5lc3NfaWQYASABKAlCCrpIB8gBAX'
        'ICEANSCmJ1c2luZXNzSWQ=');

@$core.Deprecated('Use getBusinessStoresResponseDescriptor instead')
const GetBusinessStoresResponse$json = {
  '1': 'GetBusinessStoresResponse',
  '2': [
    {
      '1': 'stores',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.store.v1.Store',
      '10': 'stores'
    },
  ],
};

/// Descriptor for `GetBusinessStoresResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessStoresResponseDescriptor =
    $convert.base64Decode(
        'ChlHZXRCdXNpbmVzc1N0b3Jlc1Jlc3BvbnNlEicKBnN0b3JlcxgBIAMoCzIPLnN0b3JlLnYxLl'
        'N0b3JlUgZzdG9yZXM=');

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

@$core.Deprecated('Use addUserToStoreRequestDescriptor instead')
const AddUserToStoreRequest$json = {
  '1': 'AddUserToStoreRequest',
  '2': [
    {'1': 'email', '3': 1, '4': 1, '5': 9, '10': 'email'},
    {
      '1': 'permissions',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermissions',
      '10': 'permissions'
    },
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '10': 'storeId'},
  ],
};

/// Descriptor for `AddUserToStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToStoreRequestDescriptor = $convert.base64Decode(
    'ChVBZGRVc2VyVG9TdG9yZVJlcXVlc3QSFAoFZW1haWwYASABKAlSBWVtYWlsEj8KC3Blcm1pc3'
    'Npb25zGAIgASgLMh0uaWRlbnRpdHkudjEuU3RvcmVQZXJtaXNzaW9uc1ILcGVybWlzc2lvbnMS'
    'GQoIc3RvcmVfaWQYAyABKAlSB3N0b3JlSWQ=');

@$core.Deprecated('Use addUserToStoreResponseDescriptor instead')
const AddUserToStoreResponse$json = {
  '1': 'AddUserToStoreResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'store_member',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.store.v1.StoreMember',
      '10': 'storeMember'
    },
  ],
};

/// Descriptor for `AddUserToStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserToStoreResponseDescriptor = $convert.base64Decode(
    'ChZBZGRVc2VyVG9TdG9yZVJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSOAoMc3'
    'RvcmVfbWVtYmVyGAIgASgLMhUuc3RvcmUudjEuU3RvcmVNZW1iZXJSC3N0b3JlTWVtYmVy');

@$core.Deprecated('Use updateStoreMemberRequestDescriptor instead')
const UpdateStoreMemberRequest$json = {
  '1': 'UpdateStoreMemberRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'permissions',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermissions',
      '10': 'permissions'
    },
  ],
};

/// Descriptor for `UpdateStoreMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStoreMemberRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVTdG9yZU1lbWJlclJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyAEBcgIQA1'
    'IGdXNlcklkEiUKCHN0b3JlX2lkGAIgASgJQgq6SAfIAQFyAhADUgdzdG9yZUlkEj8KC3Blcm1p'
    'c3Npb25zGAUgASgLMh0uaWRlbnRpdHkudjEuU3RvcmVQZXJtaXNzaW9uc1ILcGVybWlzc2lvbn'
    'M=');

@$core.Deprecated('Use updateStoreMemberResponseDescriptor instead')
const UpdateStoreMemberResponse$json = {
  '1': 'UpdateStoreMemberResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'store_member',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.store.v1.StoreMember',
      '10': 'storeMember'
    },
  ],
};

/// Descriptor for `UpdateStoreMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStoreMemberResponseDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVTdG9yZU1lbWJlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSOA'
    'oMc3RvcmVfbWVtYmVyGAIgASgLMhUuc3RvcmUudjEuU3RvcmVNZW1iZXJSC3N0b3JlTWVtYmVy');

@$core.Deprecated('Use streamStoreMembersRequestDescriptor instead')
const StreamStoreMembersRequest$json = {
  '1': 'StreamStoreMembersRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `StreamStoreMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamStoreMembersRequestDescriptor =
    $convert.base64Decode(
        'ChlTdHJlYW1TdG9yZU1lbWJlcnNSZXF1ZXN0EiUKCHN0b3JlX2lkGAEgASgJQgq6SAfIAQFyAh'
        'ADUgdzdG9yZUlk');

@$core.Deprecated('Use streamStoreMembersResponseDescriptor instead')
const StreamStoreMembersResponse$json = {
  '1': 'StreamStoreMembersResponse',
  '2': [
    {
      '1': 'store_members',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.store.v1.StoreMember',
      '10': 'storeMembers'
    },
  ],
};

/// Descriptor for `StreamStoreMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamStoreMembersResponseDescriptor =
    $convert.base64Decode(
        'ChpTdHJlYW1TdG9yZU1lbWJlcnNSZXNwb25zZRI6Cg1zdG9yZV9tZW1iZXJzGAEgAygLMhUuc3'
        'RvcmUudjEuU3RvcmVNZW1iZXJSDHN0b3JlTWVtYmVycw==');

@$core.Deprecated('Use setStoreMemberStatusRequestDescriptor instead')
const SetStoreMemberStatusRequest$json = {
  '1': 'SetStoreMemberStatusRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.store.v1.StoreMemberStatus',
      '10': 'status'
    },
  ],
};

/// Descriptor for `SetStoreMemberStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setStoreMemberStatusRequestDescriptor =
    $convert.base64Decode(
        'ChtTZXRTdG9yZU1lbWJlclN0YXR1c1JlcXVlc3QSJQoIc3RvcmVfaWQYASABKAlCCrpIB8gBAX'
        'ICEANSB3N0b3JlSWQSIwoHdXNlcl9pZBgCIAEoCUIKukgHyAEBcgIQA1IGdXNlcklkEjMKBnN0'
        'YXR1cxgDIAEoDjIbLnN0b3JlLnYxLlN0b3JlTWVtYmVyU3RhdHVzUgZzdGF0dXM=');

@$core.Deprecated('Use setStoreMemberStatusResponseDescriptor instead')
const SetStoreMemberStatusResponse$json = {
  '1': 'SetStoreMemberStatusResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SetStoreMemberStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List setStoreMemberStatusResponseDescriptor =
    $convert.base64Decode(
        'ChxTZXRTdG9yZU1lbWJlclN0YXR1c1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3'
        'M=');

@$core.Deprecated('Use getStoreMembersRequestDescriptor instead')
const GetStoreMembersRequest$json = {
  '1': 'GetStoreMembersRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `GetStoreMembersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreMembersRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRTdG9yZU1lbWJlcnNSZXF1ZXN0EiUKCHN0b3JlX2lkGAEgASgJQgq6SAfIAQFyAhADUg'
        'dzdG9yZUlk');

@$core.Deprecated('Use getStoreMembersResponseDescriptor instead')
const GetStoreMembersResponse$json = {
  '1': 'GetStoreMembersResponse',
  '2': [
    {
      '1': 'store_members',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.store.v1.StoreMember',
      '10': 'storeMembers'
    },
  ],
};

/// Descriptor for `GetStoreMembersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreMembersResponseDescriptor =
    $convert.base64Decode(
        'ChdHZXRTdG9yZU1lbWJlcnNSZXNwb25zZRI6Cg1zdG9yZV9tZW1iZXJzGAEgAygLMhUuc3Rvcm'
        'UudjEuU3RvcmVNZW1iZXJSDHN0b3JlTWVtYmVycw==');

@$core.Deprecated('Use getStoreMemberRequestDescriptor instead')
const GetStoreMemberRequest$json = {
  '1': 'GetStoreMemberRequest',
  '2': [
    {'1': 'user_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `GetStoreMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreMemberRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTdG9yZU1lbWJlclJlcXVlc3QSIwoHdXNlcl9pZBgCIAEoCUIKukgHyAEBcgIQA1IGdX'
    'NlcklkEiUKCHN0b3JlX2lkGAEgASgJQgq6SAfIAQFyAhADUgdzdG9yZUlk');

@$core.Deprecated('Use getStoreMemberResponseDescriptor instead')
const GetStoreMemberResponse$json = {
  '1': 'GetStoreMemberResponse',
  '2': [
    {
      '1': 'store_member',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.StoreMember',
      '10': 'storeMember'
    },
  ],
};

/// Descriptor for `GetStoreMemberResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreMemberResponseDescriptor =
    $convert.base64Decode(
        'ChZHZXRTdG9yZU1lbWJlclJlc3BvbnNlEjgKDHN0b3JlX21lbWJlchgBIAEoCzIVLnN0b3JlLn'
        'YxLlN0b3JlTWVtYmVyUgtzdG9yZU1lbWJlcg==');

@$core.Deprecated('Use removeUserFromStoreRequestDescriptor instead')
const RemoveUserFromStoreRequest$json = {
  '1': 'RemoveUserFromStoreRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `RemoveUserFromStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromStoreRequestDescriptor =
    $convert.base64Decode(
        'ChpSZW1vdmVVc2VyRnJvbVN0b3JlUmVxdWVzdBIjCgd1c2VyX2lkGAEgASgJQgq6SAfIAQFyAh'
        'ADUgZ1c2VySWQSJQoIc3RvcmVfaWQYAiABKAlCCrpIB8gBAXICEANSB3N0b3JlSWQ=');

@$core.Deprecated('Use removeUserFromStoreResponseDescriptor instead')
const RemoveUserFromStoreResponse$json = {
  '1': 'RemoveUserFromStoreResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveUserFromStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserFromStoreResponseDescriptor =
    $convert.base64Decode(
        'ChtSZW1vdmVVc2VyRnJvbVN0b3JlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

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
    {
      '1': 'GetBusinessStores',
      '2': '.store.v1.GetBusinessStoresRequest',
      '3': '.store.v1.GetBusinessStoresResponse',
      '4': {}
    },
    {
      '1': 'AddUserToStore',
      '2': '.store.v1.AddUserToStoreRequest',
      '3': '.store.v1.AddUserToStoreResponse'
    },
    {
      '1': 'UpdateStoreMember',
      '2': '.store.v1.UpdateStoreMemberRequest',
      '3': '.store.v1.UpdateStoreMemberResponse'
    },
    {
      '1': 'StreamStoreMembers',
      '2': '.store.v1.StreamStoreMembersRequest',
      '3': '.store.v1.StreamStoreMembersResponse',
      '6': true
    },
    {
      '1': 'GetStoreMembers',
      '2': '.store.v1.GetStoreMembersRequest',
      '3': '.store.v1.GetStoreMembersResponse'
    },
    {
      '1': 'GetStoreMember',
      '2': '.store.v1.GetStoreMemberRequest',
      '3': '.store.v1.GetStoreMemberResponse'
    },
    {
      '1': 'SetStoreMemberStatus',
      '2': '.store.v1.SetStoreMemberStatusRequest',
      '3': '.store.v1.SetStoreMemberStatusResponse'
    },
    {
      '1': 'RemoveUserFromStore',
      '2': '.store.v1.RemoveUserFromStoreRequest',
      '3': '.store.v1.RemoveUserFromStoreResponse'
    },
  ],
};

@$core.Deprecated('Use storeServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    StoreServiceBase$messageJson = {
  '.store.v1.CreateStoreRequest': CreateStoreRequest$json,
  '.store.v1.Store': Store$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.store.v1.CreateStoreResponse': CreateStoreResponse$json,
  '.store.v1.GetStoreRequest': GetStoreRequest$json,
  '.store.v1.GetStoreResponse': GetStoreResponse$json,
  '.store.v1.UpdateStoreRequest': UpdateStoreRequest$json,
  '.store.v1.UpdateStoreResponse': UpdateStoreResponse$json,
  '.store.v1.DeleteStoreRequest': DeleteStoreRequest$json,
  '.store.v1.DeleteStoreResponse': DeleteStoreResponse$json,
  '.store.v1.GetBusinessStoresRequest': GetBusinessStoresRequest$json,
  '.store.v1.GetBusinessStoresResponse': GetBusinessStoresResponse$json,
  '.store.v1.AddUserToStoreRequest': AddUserToStoreRequest$json,
  '.identity.v1.StorePermissions': $2.StorePermissions$json,
  '.identity.v1.StoreProductPermission': $2.StoreProductPermission$json,
  '.identity.v1.StoreMemberPermission': $2.StoreMemberPermission$json,
  '.identity.v1.StoreReportPermission': $2.StoreReportPermission$json,
  '.identity.v1.StoreOrderPermission': $2.StoreOrderPermission$json,
  '.identity.v1.StoreInvoicePermission': $2.StoreInvoicePermission$json,
  '.identity.v1.StoreSupplierPermission': $2.StoreSupplierPermission$json,
  '.identity.v1.StoreTransactionPermission': $2.StoreTransactionPermission$json,
  '.store.v1.AddUserToStoreResponse': AddUserToStoreResponse$json,
  '.store.v1.StoreMember': StoreMember$json,
  '.identity.v1.User': $1.User$json,
  '.identity.v1.ConnectedAccount': $1.ConnectedAccount$json,
  '.link.v1.ResourceLink': $3.ResourceLink$json,
  '.store.v1.UpdateStoreMemberRequest': UpdateStoreMemberRequest$json,
  '.store.v1.UpdateStoreMemberResponse': UpdateStoreMemberResponse$json,
  '.store.v1.StreamStoreMembersRequest': StreamStoreMembersRequest$json,
  '.store.v1.StreamStoreMembersResponse': StreamStoreMembersResponse$json,
  '.store.v1.GetStoreMembersRequest': GetStoreMembersRequest$json,
  '.store.v1.GetStoreMembersResponse': GetStoreMembersResponse$json,
  '.store.v1.GetStoreMemberRequest': GetStoreMemberRequest$json,
  '.store.v1.GetStoreMemberResponse': GetStoreMemberResponse$json,
  '.store.v1.SetStoreMemberStatusRequest': SetStoreMemberStatusRequest$json,
  '.store.v1.SetStoreMemberStatusResponse': SetStoreMemberStatusResponse$json,
  '.store.v1.RemoveUserFromStoreRequest': RemoveUserFromStoreRequest$json,
  '.store.v1.RemoveUserFromStoreResponse': RemoveUserFromStoreResponse$json,
};

/// Descriptor for `StoreService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List storeServiceDescriptor = $convert.base64Decode(
    'CgxTdG9yZVNlcnZpY2USTAoLQ3JlYXRlU3RvcmUSHC5zdG9yZS52MS5DcmVhdGVTdG9yZVJlcX'
    'Vlc3QaHS5zdG9yZS52MS5DcmVhdGVTdG9yZVJlc3BvbnNlIgASQwoIR2V0U3RvcmUSGS5zdG9y'
    'ZS52MS5HZXRTdG9yZVJlcXVlc3QaGi5zdG9yZS52MS5HZXRTdG9yZVJlc3BvbnNlIgASTAoLVX'
    'BkYXRlU3RvcmUSHC5zdG9yZS52MS5VcGRhdGVTdG9yZVJlcXVlc3QaHS5zdG9yZS52MS5VcGRh'
    'dGVTdG9yZVJlc3BvbnNlIgASTAoLRGVsZXRlU3RvcmUSHC5zdG9yZS52MS5EZWxldGVTdG9yZV'
    'JlcXVlc3QaHS5zdG9yZS52MS5EZWxldGVTdG9yZVJlc3BvbnNlIgASXgoRR2V0QnVzaW5lc3NT'
    'dG9yZXMSIi5zdG9yZS52MS5HZXRCdXNpbmVzc1N0b3Jlc1JlcXVlc3QaIy5zdG9yZS52MS5HZX'
    'RCdXNpbmVzc1N0b3Jlc1Jlc3BvbnNlIgASUwoOQWRkVXNlclRvU3RvcmUSHy5zdG9yZS52MS5B'
    'ZGRVc2VyVG9TdG9yZVJlcXVlc3QaIC5zdG9yZS52MS5BZGRVc2VyVG9TdG9yZVJlc3BvbnNlEl'
    'wKEVVwZGF0ZVN0b3JlTWVtYmVyEiIuc3RvcmUudjEuVXBkYXRlU3RvcmVNZW1iZXJSZXF1ZXN0'
    'GiMuc3RvcmUudjEuVXBkYXRlU3RvcmVNZW1iZXJSZXNwb25zZRJhChJTdHJlYW1TdG9yZU1lbW'
    'JlcnMSIy5zdG9yZS52MS5TdHJlYW1TdG9yZU1lbWJlcnNSZXF1ZXN0GiQuc3RvcmUudjEuU3Ry'
    'ZWFtU3RvcmVNZW1iZXJzUmVzcG9uc2UwARJWCg9HZXRTdG9yZU1lbWJlcnMSIC5zdG9yZS52MS'
    '5HZXRTdG9yZU1lbWJlcnNSZXF1ZXN0GiEuc3RvcmUudjEuR2V0U3RvcmVNZW1iZXJzUmVzcG9u'
    'c2USUwoOR2V0U3RvcmVNZW1iZXISHy5zdG9yZS52MS5HZXRTdG9yZU1lbWJlclJlcXVlc3QaIC'
    '5zdG9yZS52MS5HZXRTdG9yZU1lbWJlclJlc3BvbnNlEmUKFFNldFN0b3JlTWVtYmVyU3RhdHVz'
    'EiUuc3RvcmUudjEuU2V0U3RvcmVNZW1iZXJTdGF0dXNSZXF1ZXN0GiYuc3RvcmUudjEuU2V0U3'
    'RvcmVNZW1iZXJTdGF0dXNSZXNwb25zZRJiChNSZW1vdmVVc2VyRnJvbVN0b3JlEiQuc3RvcmUu'
    'djEuUmVtb3ZlVXNlckZyb21TdG9yZVJlcXVlc3QaJS5zdG9yZS52MS5SZW1vdmVVc2VyRnJvbV'
    'N0b3JlUmVzcG9uc2U=');
