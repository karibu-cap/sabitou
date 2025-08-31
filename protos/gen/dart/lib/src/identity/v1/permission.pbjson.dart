// This is a generated file - do not edit.
//
// Generated from identity/v1/permission.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use resourceActionTypeDescriptor instead')
const ResourceActionType$json = {
  '1': 'ResourceActionType',
  '2': [
    {'1': 'RESOURCE_ACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'RESOURCE_ACTION_TYPE_READ', '2': 1},
    {'1': 'RESOURCE_ACTION_TYPE_ADD', '2': 2},
    {'1': 'RESOURCE_ACTION_TYPE_UPDATE', '2': 3},
    {'1': 'RESOURCE_ACTION_TYPE_REMOVE', '2': 4},
  ],
};

/// Descriptor for `ResourceActionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List resourceActionTypeDescriptor = $convert.base64Decode(
    'ChJSZXNvdXJjZUFjdGlvblR5cGUSJAogUkVTT1VSQ0VfQUNUSU9OX1RZUEVfVU5TUEVDSUZJRU'
    'QQABIdChlSRVNPVVJDRV9BQ1RJT05fVFlQRV9SRUFEEAESHAoYUkVTT1VSQ0VfQUNUSU9OX1RZ'
    'UEVfQUREEAISHwobUkVTT1VSQ0VfQUNUSU9OX1RZUEVfVVBEQVRFEAMSHwobUkVTT1VSQ0VfQU'
    'NUSU9OX1RZUEVfUkVNT1ZFEAQ=');

@$core.Deprecated('Use resourceTypeDescriptor instead')
const ResourceType$json = {
  '1': 'ResourceType',
  '2': [
    {'1': 'RESOURCE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'RESOURCE_TYPE_BUSINESS', '2': 1},
    {'1': 'RESOURCE_TYPE_BUSINESS_MEMBER', '2': 2},
    {'1': 'RESOURCE_TYPE_BUSINESS_SUPPLIER', '2': 4},
    {'1': 'RESOURCE_TYPE_STORE', '2': 5},
    {'1': 'RESOURCE_TYPE_INVOICE', '2': 6},
    {'1': 'RESOURCE_TYPE_STORE_ORDER', '2': 7},
    {'1': 'RESOURCE_TYPE_SUPPLIER_ORDER', '2': 8},
    {'1': 'RESOURCE_TYPE_PRODUCT', '2': 9},
  ],
};

/// Descriptor for `ResourceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List resourceTypeDescriptor = $convert.base64Decode(
    'CgxSZXNvdXJjZVR5cGUSHQoZUkVTT1VSQ0VfVFlQRV9VTlNQRUNJRklFRBAAEhoKFlJFU09VUk'
    'NFX1RZUEVfQlVTSU5FU1MQARIhCh1SRVNPVVJDRV9UWVBFX0JVU0lORVNTX01FTUJFUhACEiMK'
    'H1JFU09VUkNFX1RZUEVfQlVTSU5FU1NfU1VQUExJRVIQBBIXChNSRVNPVVJDRV9UWVBFX1NUT1'
    'JFEAUSGQoVUkVTT1VSQ0VfVFlQRV9JTlZPSUNFEAYSHQoZUkVTT1VSQ0VfVFlQRV9TVE9SRV9P'
    'UkRFUhAHEiAKHFJFU09VUkNFX1RZUEVfU1VQUExJRVJfT1JERVIQCBIZChVSRVNPVVJDRV9UWV'
    'BFX1BST0RVQ1QQCQ==');

@$core.Deprecated('Use permissionDescriptor instead')
const Permission$json = {
  '1': 'Permission',
  '2': [
    {
      '1': 'resource_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceType',
      '10': 'resourceType'
    },
    {
      '1': 'resource_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'resourceId',
      '17': true
    },
    {
      '1': 'action_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceActionType',
      '10': 'actionType'
    },
  ],
  '8': [
    {'1': '_resource_id'},
  ],
};

/// Descriptor for `Permission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDescriptor = $convert.base64Decode(
    'CgpQZXJtaXNzaW9uEj4KDXJlc291cmNlX3R5cGUYASABKA4yGS5pZGVudGl0eS52MS5SZXNvdX'
    'JjZVR5cGVSDHJlc291cmNlVHlwZRIkCgtyZXNvdXJjZV9pZBgCIAEoCUgAUgpyZXNvdXJjZUlk'
    'iAEBEkAKC2FjdGlvbl90eXBlGAMgASgOMh8uaWRlbnRpdHkudjEuUmVzb3VyY2VBY3Rpb25UeX'
    'BlUgphY3Rpb25UeXBlQg4KDF9yZXNvdXJjZV9pZA==');

@$core.Deprecated('Use permissionsGroupDescriptor instead')
const PermissionsGroup$json = {
  '1': 'PermissionsGroup',
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
      '1': 'permissions',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.Permission',
      '10': 'permissions'
    },
    {
      '1': 'business_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'businessId',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_business_id'},
  ],
};

/// Descriptor for `PermissionsGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionsGroupDescriptor = $convert.base64Decode(
    'ChBQZXJtaXNzaW9uc0dyb3VwEhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBARISCgRuYW1lGA'
    'IgASgJUgRuYW1lEiUKC2Rlc2NyaXB0aW9uGAMgASgJSAFSC2Rlc2NyaXB0aW9uiAEBEjkKC3Bl'
    'cm1pc3Npb25zGAQgAygLMhcuaWRlbnRpdHkudjEuUGVybWlzc2lvblILcGVybWlzc2lvbnMSJA'
    'oLYnVzaW5lc3NfaWQYBiABKAlIAlIKYnVzaW5lc3NJZIgBAUIJCgdfcmVmX2lkQg4KDF9kZXNj'
    'cmlwdGlvbkIOCgxfYnVzaW5lc3NfaWQ=');

@$core.Deprecated('Use createPermissionsGroupRequestDescriptor instead')
const CreatePermissionsGroupRequest$json = {
  '1': 'CreatePermissionsGroupRequest',
  '2': [
    {
      '1': 'permissions_group',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.PermissionsGroup',
      '10': 'permissionsGroup'
    },
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `CreatePermissionsGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPermissionsGroupRequestDescriptor =
    $convert.base64Decode(
        'Ch1DcmVhdGVQZXJtaXNzaW9uc0dyb3VwUmVxdWVzdBJKChFwZXJtaXNzaW9uc19ncm91cBgBIA'
        'EoCzIdLmlkZW50aXR5LnYxLlBlcm1pc3Npb25zR3JvdXBSEHBlcm1pc3Npb25zR3JvdXASKwoL'
        'YnVzaW5lc3NfaWQYAiABKAlCCrpIB8gBAXICEANSCmJ1c2luZXNzSWQ=');

@$core.Deprecated('Use createPermissionsGroupResponseDescriptor instead')
const CreatePermissionsGroupResponse$json = {
  '1': 'CreatePermissionsGroupResponse',
  '2': [
    {
      '1': 'permission_group_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'permissionGroupId'
    },
  ],
};

/// Descriptor for `CreatePermissionsGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPermissionsGroupResponseDescriptor =
    $convert.base64Decode(
        'Ch5DcmVhdGVQZXJtaXNzaW9uc0dyb3VwUmVzcG9uc2USOgoTcGVybWlzc2lvbl9ncm91cF9pZB'
        'gBIAEoCUIKukgHyAEBcgIQA1IRcGVybWlzc2lvbkdyb3VwSWQ=');

@$core.Deprecated('Use getPermissionsGroupRequestDescriptor instead')
const GetPermissionsGroupRequest$json = {
  '1': 'GetPermissionsGroupRequest',
  '2': [
    {
      '1': 'permission_group_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'permissionGroupId'
    },
  ],
};

/// Descriptor for `GetPermissionsGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPermissionsGroupRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRQZXJtaXNzaW9uc0dyb3VwUmVxdWVzdBI6ChNwZXJtaXNzaW9uX2dyb3VwX2lkGAEgAS'
        'gJQgq6SAfIAQFyAhADUhFwZXJtaXNzaW9uR3JvdXBJZA==');

@$core.Deprecated('Use getPermissionsGroupResponseDescriptor instead')
const GetPermissionsGroupResponse$json = {
  '1': 'GetPermissionsGroupResponse',
  '2': [
    {
      '1': 'permissions_group',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.PermissionsGroup',
      '10': 'permissionsGroup'
    },
  ],
};

/// Descriptor for `GetPermissionsGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPermissionsGroupResponseDescriptor =
    $convert.base64Decode(
        'ChtHZXRQZXJtaXNzaW9uc0dyb3VwUmVzcG9uc2USSgoRcGVybWlzc2lvbnNfZ3JvdXAYASABKA'
        'syHS5pZGVudGl0eS52MS5QZXJtaXNzaW9uc0dyb3VwUhBwZXJtaXNzaW9uc0dyb3Vw');

@$core.Deprecated('Use updatePermissionsGroupRequestDescriptor instead')
const UpdatePermissionsGroupRequest$json = {
  '1': 'UpdatePermissionsGroupRequest',
  '2': [
    {
      '1': 'permissions_group_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'permissionsGroupId'
    },
    {'1': 'business_id', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'name', '17': true},
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
      '1': 'add_permissions',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.Permission',
      '10': 'addPermissions'
    },
    {
      '1': 'remove_permissions',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.Permission',
      '10': 'removePermissions'
    },
  ],
  '8': [
    {'1': '_name'},
    {'1': '_description'},
  ],
};

/// Descriptor for `UpdatePermissionsGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePermissionsGroupRequestDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVQZXJtaXNzaW9uc0dyb3VwUmVxdWVzdBI8ChRwZXJtaXNzaW9uc19ncm91cF9pZB'
    'gBIAEoCUIKukgHyAEBcgIQA1IScGVybWlzc2lvbnNHcm91cElkEisKC2J1c2luZXNzX2lkGAYg'
    'ASgJQgq6SAfIAQFyAhADUgpidXNpbmVzc0lkEhcKBG5hbWUYAiABKAlIAFIEbmFtZYgBARIlCg'
    'tkZXNjcmlwdGlvbhgDIAEoCUgBUgtkZXNjcmlwdGlvbogBARJACg9hZGRfcGVybWlzc2lvbnMY'
    'BCADKAsyFy5pZGVudGl0eS52MS5QZXJtaXNzaW9uUg5hZGRQZXJtaXNzaW9ucxJGChJyZW1vdm'
    'VfcGVybWlzc2lvbnMYBSADKAsyFy5pZGVudGl0eS52MS5QZXJtaXNzaW9uUhFyZW1vdmVQZXJt'
    'aXNzaW9uc0IHCgVfbmFtZUIOCgxfZGVzY3JpcHRpb24=');

@$core.Deprecated('Use updatePermissionsGroupResponseDescriptor instead')
const UpdatePermissionsGroupResponse$json = {
  '1': 'UpdatePermissionsGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdatePermissionsGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePermissionsGroupResponseDescriptor =
    $convert.base64Decode(
        'Ch5VcGRhdGVQZXJtaXNzaW9uc0dyb3VwUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2'
        'Vzcw==');

@$core.Deprecated('Use deletePermissionsGroupRequestDescriptor instead')
const DeletePermissionsGroupRequest$json = {
  '1': 'DeletePermissionsGroupRequest',
  '2': [
    {
      '1': 'permission_group_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'permissionGroupId'
    },
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `DeletePermissionsGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePermissionsGroupRequestDescriptor =
    $convert.base64Decode(
        'Ch1EZWxldGVQZXJtaXNzaW9uc0dyb3VwUmVxdWVzdBI6ChNwZXJtaXNzaW9uX2dyb3VwX2lkGA'
        'EgASgJQgq6SAfIAQFyAhADUhFwZXJtaXNzaW9uR3JvdXBJZBIrCgtidXNpbmVzc19pZBgCIAEo'
        'CUIKukgHyAEBcgIQA1IKYnVzaW5lc3NJZA==');

@$core.Deprecated('Use deletePermissionsGroupResponseDescriptor instead')
const DeletePermissionsGroupResponse$json = {
  '1': 'DeletePermissionsGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeletePermissionsGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePermissionsGroupResponseDescriptor =
    $convert.base64Decode(
        'Ch5EZWxldGVQZXJtaXNzaW9uc0dyb3VwUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2'
        'Vzcw==');

@$core.Deprecated('Use updateMemberPermissionsRequestDescriptor instead')
const UpdateMemberPermissionsRequest$json = {
  '1': 'UpdateMemberPermissionsRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {
      '1': 'remove_permissions',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.Permission',
      '10': 'removePermissions'
    },
    {
      '1': 'add_permissions',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.Permission',
      '10': 'addPermissions'
    },
    {
      '1': 'remove_permissions_groups_ids',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'removePermissionsGroupsIds'
    },
    {
      '1': 'add_permissions_groups_ids',
      '3': 6,
      '4': 3,
      '5': 9,
      '10': 'addPermissionsGroupsIds'
    },
  ],
};

/// Descriptor for `UpdateMemberPermissionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMemberPermissionsRequestDescriptor = $convert.base64Decode(
    'Ch5VcGRhdGVNZW1iZXJQZXJtaXNzaW9uc1JlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyA'
    'EBcgIQA1IGdXNlcklkEisKC2J1c2luZXNzX2lkGAIgASgJQgq6SAfIAQFyAhADUgpidXNpbmVz'
    'c0lkEkYKEnJlbW92ZV9wZXJtaXNzaW9ucxgDIAMoCzIXLmlkZW50aXR5LnYxLlBlcm1pc3Npb2'
    '5SEXJlbW92ZVBlcm1pc3Npb25zEkAKD2FkZF9wZXJtaXNzaW9ucxgEIAMoCzIXLmlkZW50aXR5'
    'LnYxLlBlcm1pc3Npb25SDmFkZFBlcm1pc3Npb25zEkEKHXJlbW92ZV9wZXJtaXNzaW9uc19ncm'
    '91cHNfaWRzGAUgAygJUhpyZW1vdmVQZXJtaXNzaW9uc0dyb3Vwc0lkcxI7ChphZGRfcGVybWlz'
    'c2lvbnNfZ3JvdXBzX2lkcxgGIAMoCVIXYWRkUGVybWlzc2lvbnNHcm91cHNJZHM=');

@$core.Deprecated('Use updateMemberPermissionsResponseDescriptor instead')
const UpdateMemberPermissionsResponse$json = {
  '1': 'UpdateMemberPermissionsResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateMemberPermissionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateMemberPermissionsResponseDescriptor =
    $convert.base64Decode(
        'Ch9VcGRhdGVNZW1iZXJQZXJtaXNzaW9uc1Jlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2'
        'Nlc3M=');

@$core.Deprecated('Use getBusinessPermissionsGroupsRequestDescriptor instead')
const GetBusinessPermissionsGroupsRequest$json = {
  '1': 'GetBusinessPermissionsGroupsRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `GetBusinessPermissionsGroupsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessPermissionsGroupsRequestDescriptor =
    $convert.base64Decode(
        'CiNHZXRCdXNpbmVzc1Blcm1pc3Npb25zR3JvdXBzUmVxdWVzdBIrCgtidXNpbmVzc19pZBgBIA'
        'EoCUIKukgHyAEBcgIQA1IKYnVzaW5lc3NJZA==');

@$core.Deprecated('Use getBusinessPermissionsGroupsResponseDescriptor instead')
const GetBusinessPermissionsGroupsResponse$json = {
  '1': 'GetBusinessPermissionsGroupsResponse',
  '2': [
    {
      '1': 'permissions_groups',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.identity.v1.PermissionsGroup',
      '10': 'permissionsGroups'
    },
  ],
};

/// Descriptor for `GetBusinessPermissionsGroupsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessPermissionsGroupsResponseDescriptor =
    $convert.base64Decode(
        'CiRHZXRCdXNpbmVzc1Blcm1pc3Npb25zR3JvdXBzUmVzcG9uc2USTAoScGVybWlzc2lvbnNfZ3'
        'JvdXBzGAEgAygLMh0uaWRlbnRpdHkudjEuUGVybWlzc2lvbnNHcm91cFIRcGVybWlzc2lvbnNH'
        'cm91cHM=');

@$core.Deprecated('Use checkPermissionRequestDescriptor instead')
const CheckPermissionRequest$json = {
  '1': 'CheckPermissionRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'business_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {
      '1': 'permission',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.Permission',
      '10': 'permission'
    },
  ],
};

/// Descriptor for `CheckPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionRequestDescriptor = $convert.base64Decode(
    'ChZDaGVja1Blcm1pc3Npb25SZXF1ZXN0EiMKB3VzZXJfaWQYASABKAlCCrpIB8gBAXICEANSBn'
    'VzZXJJZBIrCgtidXNpbmVzc19pZBgDIAEoCUIKukgHyAEBcgIQA1IKYnVzaW5lc3NJZBI3Cgpw'
    'ZXJtaXNzaW9uGAQgASgLMhcuaWRlbnRpdHkudjEuUGVybWlzc2lvblIKcGVybWlzc2lvbg==');

@$core.Deprecated('Use checkPermissionResponseDescriptor instead')
const CheckPermissionResponse$json = {
  '1': 'CheckPermissionResponse',
  '2': [
    {'1': 'has_permission', '3': 1, '4': 1, '5': 8, '10': 'hasPermission'},
  ],
};

/// Descriptor for `CheckPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionResponseDescriptor =
    $convert.base64Decode(
        'ChdDaGVja1Blcm1pc3Npb25SZXNwb25zZRIlCg5oYXNfcGVybWlzc2lvbhgBIAEoCFINaGFzUG'
        'VybWlzc2lvbg==');

const $core.Map<$core.String, $core.dynamic> PermissionServiceBase$json = {
  '1': 'PermissionService',
  '2': [
    {
      '1': 'CreatePermissionsGroup',
      '2': '.identity.v1.CreatePermissionsGroupRequest',
      '3': '.identity.v1.CreatePermissionsGroupResponse',
      '4': {}
    },
    {
      '1': 'GetPermissionsGroup',
      '2': '.identity.v1.GetPermissionsGroupRequest',
      '3': '.identity.v1.GetPermissionsGroupResponse',
      '4': {}
    },
    {
      '1': 'UpdatePermissionsGroup',
      '2': '.identity.v1.UpdatePermissionsGroupRequest',
      '3': '.identity.v1.UpdatePermissionsGroupResponse',
      '4': {}
    },
    {
      '1': 'DeletePermissionsGroup',
      '2': '.identity.v1.DeletePermissionsGroupRequest',
      '3': '.identity.v1.DeletePermissionsGroupResponse',
      '4': {}
    },
    {
      '1': 'UpdateMemberPermissions',
      '2': '.identity.v1.UpdateMemberPermissionsRequest',
      '3': '.identity.v1.UpdateMemberPermissionsResponse',
      '4': {}
    },
    {
      '1': 'GetBusinessPermissionsGroups',
      '2': '.identity.v1.GetBusinessPermissionsGroupsRequest',
      '3': '.identity.v1.GetBusinessPermissionsGroupsResponse',
      '4': {}
    },
    {
      '1': 'CheckPermission',
      '2': '.identity.v1.CheckPermissionRequest',
      '3': '.identity.v1.CheckPermissionResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use permissionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PermissionServiceBase$messageJson = {
  '.identity.v1.CreatePermissionsGroupRequest':
      CreatePermissionsGroupRequest$json,
  '.identity.v1.PermissionsGroup': PermissionsGroup$json,
  '.identity.v1.Permission': Permission$json,
  '.identity.v1.CreatePermissionsGroupResponse':
      CreatePermissionsGroupResponse$json,
  '.identity.v1.GetPermissionsGroupRequest': GetPermissionsGroupRequest$json,
  '.identity.v1.GetPermissionsGroupResponse': GetPermissionsGroupResponse$json,
  '.identity.v1.UpdatePermissionsGroupRequest':
      UpdatePermissionsGroupRequest$json,
  '.identity.v1.UpdatePermissionsGroupResponse':
      UpdatePermissionsGroupResponse$json,
  '.identity.v1.DeletePermissionsGroupRequest':
      DeletePermissionsGroupRequest$json,
  '.identity.v1.DeletePermissionsGroupResponse':
      DeletePermissionsGroupResponse$json,
  '.identity.v1.UpdateMemberPermissionsRequest':
      UpdateMemberPermissionsRequest$json,
  '.identity.v1.UpdateMemberPermissionsResponse':
      UpdateMemberPermissionsResponse$json,
  '.identity.v1.GetBusinessPermissionsGroupsRequest':
      GetBusinessPermissionsGroupsRequest$json,
  '.identity.v1.GetBusinessPermissionsGroupsResponse':
      GetBusinessPermissionsGroupsResponse$json,
  '.identity.v1.CheckPermissionRequest': CheckPermissionRequest$json,
  '.identity.v1.CheckPermissionResponse': CheckPermissionResponse$json,
};

/// Descriptor for `PermissionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List permissionServiceDescriptor = $convert.base64Decode(
    'ChFQZXJtaXNzaW9uU2VydmljZRJzChZDcmVhdGVQZXJtaXNzaW9uc0dyb3VwEiouaWRlbnRpdH'
    'kudjEuQ3JlYXRlUGVybWlzc2lvbnNHcm91cFJlcXVlc3QaKy5pZGVudGl0eS52MS5DcmVhdGVQ'
    'ZXJtaXNzaW9uc0dyb3VwUmVzcG9uc2UiABJqChNHZXRQZXJtaXNzaW9uc0dyb3VwEicuaWRlbn'
    'RpdHkudjEuR2V0UGVybWlzc2lvbnNHcm91cFJlcXVlc3QaKC5pZGVudGl0eS52MS5HZXRQZXJt'
    'aXNzaW9uc0dyb3VwUmVzcG9uc2UiABJzChZVcGRhdGVQZXJtaXNzaW9uc0dyb3VwEiouaWRlbn'
    'RpdHkudjEuVXBkYXRlUGVybWlzc2lvbnNHcm91cFJlcXVlc3QaKy5pZGVudGl0eS52MS5VcGRh'
    'dGVQZXJtaXNzaW9uc0dyb3VwUmVzcG9uc2UiABJzChZEZWxldGVQZXJtaXNzaW9uc0dyb3VwEi'
    'ouaWRlbnRpdHkudjEuRGVsZXRlUGVybWlzc2lvbnNHcm91cFJlcXVlc3QaKy5pZGVudGl0eS52'
    'MS5EZWxldGVQZXJtaXNzaW9uc0dyb3VwUmVzcG9uc2UiABJ2ChdVcGRhdGVNZW1iZXJQZXJtaX'
    'NzaW9ucxIrLmlkZW50aXR5LnYxLlVwZGF0ZU1lbWJlclBlcm1pc3Npb25zUmVxdWVzdBosLmlk'
    'ZW50aXR5LnYxLlVwZGF0ZU1lbWJlclBlcm1pc3Npb25zUmVzcG9uc2UiABKFAQocR2V0QnVzaW'
    '5lc3NQZXJtaXNzaW9uc0dyb3VwcxIwLmlkZW50aXR5LnYxLkdldEJ1c2luZXNzUGVybWlzc2lv'
    'bnNHcm91cHNSZXF1ZXN0GjEuaWRlbnRpdHkudjEuR2V0QnVzaW5lc3NQZXJtaXNzaW9uc0dyb3'
    'Vwc1Jlc3BvbnNlIgASXgoPQ2hlY2tQZXJtaXNzaW9uEiMuaWRlbnRpdHkudjEuQ2hlY2tQZXJt'
    'aXNzaW9uUmVxdWVzdBokLmlkZW50aXR5LnYxLkNoZWNrUGVybWlzc2lvblJlc3BvbnNlIgA=');
