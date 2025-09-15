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
import '../../identity/v1/permission.pbjson.dart' as $1;

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
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
    {'1': '_external_links_ids'},
    {'1': '_updated_at'},
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
    'ZWRBdIgBAUIJCgdfcmVmX2lkQg4KDF9kZXNjcmlwdGlvbkIPCg1fbG9nb19saW5rX2lkQhUKE1'
    '9leHRlcm5hbF9saW5rc19pZHNCDQoLX3VwZGF0ZWRfYXQ=');

@$core.Deprecated('Use storeMemberDescriptor instead')
const StoreMember$json = {
  '1': 'StoreMember',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'permissions',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.StorePermission',
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

/// Descriptor for `StoreMember`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeMemberDescriptor = $convert.base64Decode(
    'CgtTdG9yZU1lbWJlchIXCgd1c2VyX2lkGAEgASgJUgZ1c2VySWQSGQoIc3RvcmVfaWQYAiABKA'
    'lSB3N0b3JlSWQSPgoLcGVybWlzc2lvbnMYAyADKAsyHC5pZGVudGl0eS52MS5TdG9yZVBlcm1p'
    'c3Npb25SC3Blcm1pc3Npb25zEj0KDG1lbWJlcl9zaW5jZRgEIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSC21lbWJlclNpbmNl');

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

@$core.Deprecated('Use createUserToStoreRequestDescriptor instead')
const CreateUserToStoreRequest$json = {
  '1': 'CreateUserToStoreRequest',
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
      '6': '.identity.v1.StorePermission',
      '10': 'permissions'
    },
  ],
};

/// Descriptor for `CreateUserToStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserToStoreRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVVc2VyVG9TdG9yZVJlcXVlc3QSHQoKZmlyc3RfbmFtZRgBIAEoCVIJZmlyc3ROYW'
    '1lEhsKCWxhc3RfbmFtZRgCIAEoCVIIbGFzdE5hbWUSGwoJdXNlcl9uYW1lGAMgASgJUgh1c2Vy'
    'TmFtZRIhCgxwaG9uZV9udW1iZXIYBCABKAlSC3Bob25lTnVtYmVyEhQKBWVtYWlsGAUgASgJUg'
    'VlbWFpbBIaCghwYXNzd29yZBgGIAEoCVIIcGFzc3dvcmQSHwoLYnVzaW5lc3NfaWQYByABKAlS'
    'CmJ1c2luZXNzSWQSPgoLcGVybWlzc2lvbnMYCCADKAsyHC5pZGVudGl0eS52MS5TdG9yZVBlcm'
    '1pc3Npb25SC3Blcm1pc3Npb25z');

@$core.Deprecated('Use createUserToStoreResponseDescriptor instead')
const CreateUserToStoreResponse$json = {
  '1': 'CreateUserToStoreResponse',
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

/// Descriptor for `CreateUserToStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createUserToStoreResponseDescriptor =
    $convert.base64Decode(
        'ChlDcmVhdGVVc2VyVG9TdG9yZVJlc3BvbnNlEjgKDHN0b3JlX21lbWJlchgBIAEoCzIVLnN0b3'
        'JlLnYxLlN0b3JlTWVtYmVyUgtzdG9yZU1lbWJlcg==');

@$core.Deprecated('Use associateUserToStoreRequestDescriptor instead')
const AssociateUserToStoreRequest$json = {
  '1': 'AssociateUserToStoreRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '10': 'userId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'permissions',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.StorePermission',
      '10': 'permissions'
    },
  ],
};

/// Descriptor for `AssociateUserToStoreRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List associateUserToStoreRequestDescriptor =
    $convert.base64Decode(
        'ChtBc3NvY2lhdGVVc2VyVG9TdG9yZVJlcXVlc3QSFwoHdXNlcl9pZBgBIAEoCVIGdXNlcklkEh'
        'kKCHN0b3JlX2lkGAIgASgJUgdzdG9yZUlkEj4KC3Blcm1pc3Npb25zGAMgAygLMhwuaWRlbnRp'
        'dHkudjEuU3RvcmVQZXJtaXNzaW9uUgtwZXJtaXNzaW9ucw==');

@$core.Deprecated('Use associateUserToStoreResponseDescriptor instead')
const AssociateUserToStoreResponse$json = {
  '1': 'AssociateUserToStoreResponse',
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

/// Descriptor for `AssociateUserToStoreResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List associateUserToStoreResponseDescriptor =
    $convert.base64Decode(
        'ChxBc3NvY2lhdGVVc2VyVG9TdG9yZVJlc3BvbnNlEjgKDHN0b3JlX21lbWJlchgBIAEoCzIVLn'
        'N0b3JlLnYxLlN0b3JlTWVtYmVyUgtzdG9yZU1lbWJlcg==');

@$core.Deprecated('Use updateStoreMemberRequestDescriptor instead')
const UpdateStoreMemberRequest$json = {
  '1': 'UpdateStoreMemberRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'add_permissions',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.StorePermission',
      '10': 'addPermissions'
    },
    {
      '1': 'remove_permissions',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.StorePermission',
      '10': 'removePermissions'
    },
  ],
};

/// Descriptor for `UpdateStoreMemberRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStoreMemberRequestDescriptor = $convert.base64Decode(
    'ChhVcGRhdGVTdG9yZU1lbWJlclJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyAEBcgIQA1'
    'IGdXNlcklkEiUKCHN0b3JlX2lkGAIgASgJQgq6SAfIAQFyAhADUgdzdG9yZUlkEkUKD2FkZF9w'
    'ZXJtaXNzaW9ucxgFIAMoCzIcLmlkZW50aXR5LnYxLlN0b3JlUGVybWlzc2lvblIOYWRkUGVybW'
    'lzc2lvbnMSSwoScmVtb3ZlX3Blcm1pc3Npb25zGAYgAygLMhwuaWRlbnRpdHkudjEuU3RvcmVQ'
    'ZXJtaXNzaW9uUhFyZW1vdmVQZXJtaXNzaW9ucw==');

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
      '1': 'CreateUserToStore',
      '2': '.store.v1.CreateUserToStoreRequest',
      '3': '.store.v1.CreateUserToStoreResponse'
    },
    {
      '1': 'AssociateUserToStore',
      '2': '.store.v1.AssociateUserToStoreRequest',
      '3': '.store.v1.AssociateUserToStoreResponse'
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
  '.store.v1.CreateUserToStoreRequest': CreateUserToStoreRequest$json,
  '.identity.v1.StorePermission': $1.StorePermission$json,
  '.store.v1.CreateUserToStoreResponse': CreateUserToStoreResponse$json,
  '.store.v1.StoreMember': StoreMember$json,
  '.store.v1.AssociateUserToStoreRequest': AssociateUserToStoreRequest$json,
  '.store.v1.AssociateUserToStoreResponse': AssociateUserToStoreResponse$json,
  '.store.v1.UpdateStoreMemberRequest': UpdateStoreMemberRequest$json,
  '.store.v1.UpdateStoreMemberResponse': UpdateStoreMemberResponse$json,
  '.store.v1.StreamStoreMembersRequest': StreamStoreMembersRequest$json,
  '.store.v1.StreamStoreMembersResponse': StreamStoreMembersResponse$json,
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
    'RCdXNpbmVzc1N0b3Jlc1Jlc3BvbnNlIgASXAoRQ3JlYXRlVXNlclRvU3RvcmUSIi5zdG9yZS52'
    'MS5DcmVhdGVVc2VyVG9TdG9yZVJlcXVlc3QaIy5zdG9yZS52MS5DcmVhdGVVc2VyVG9TdG9yZV'
    'Jlc3BvbnNlEmUKFEFzc29jaWF0ZVVzZXJUb1N0b3JlEiUuc3RvcmUudjEuQXNzb2NpYXRlVXNl'
    'clRvU3RvcmVSZXF1ZXN0GiYuc3RvcmUudjEuQXNzb2NpYXRlVXNlclRvU3RvcmVSZXNwb25zZR'
    'JcChFVcGRhdGVTdG9yZU1lbWJlchIiLnN0b3JlLnYxLlVwZGF0ZVN0b3JlTWVtYmVyUmVxdWVz'
    'dBojLnN0b3JlLnYxLlVwZGF0ZVN0b3JlTWVtYmVyUmVzcG9uc2USYQoSU3RyZWFtU3RvcmVNZW'
    '1iZXJzEiMuc3RvcmUudjEuU3RyZWFtU3RvcmVNZW1iZXJzUmVxdWVzdBokLnN0b3JlLnYxLlN0'
    'cmVhbVN0b3JlTWVtYmVyc1Jlc3BvbnNlMAE=');
