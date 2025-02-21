//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use permissionActionTypeDescriptor instead')
const PermissionActionType$json = {
  '1': 'PermissionActionType',
  '2': [
    {'1': 'PERMISSION_ACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'PERMISSION_ACTION_TYPE_READ', '2': 1},
    {'1': 'PERMISSION_ACTION_TYPE_ADD', '2': 2},
    {'1': 'PERMISSION_ACTION_TYPE_UPDATE', '2': 3},
    {'1': 'PERMISSION_ACTION_TYPE_REMOVE', '2': 4},
  ],
};

/// Descriptor for `PermissionActionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List permissionActionTypeDescriptor = $convert.base64Decode(
    'ChRQZXJtaXNzaW9uQWN0aW9uVHlwZRImCiJQRVJNSVNTSU9OX0FDVElPTl9UWVBFX1VOU1BFQ0'
    'lGSUVEEAASHwobUEVSTUlTU0lPTl9BQ1RJT05fVFlQRV9SRUFEEAESHgoaUEVSTUlTU0lPTl9B'
    'Q1RJT05fVFlQRV9BREQQAhIhCh1QRVJNSVNTSU9OX0FDVElPTl9UWVBFX1VQREFURRADEiEKHV'
    'BFUk1JU1NJT05fQUNUSU9OX1RZUEVfUkVNT1ZFEAQ=');

@$core.Deprecated('Use permissionResourceTypeDescriptor instead')
const PermissionResourceType$json = {
  '1': 'PermissionResourceType',
  '2': [
    {'1': 'PERMISSION_RESOURCE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'PERMISSION_RESOURCE_TYPE_BUSINESS', '2': 1},
    {'1': 'PERMISSION_RESOURCE_TYPE_STORE', '2': 2},
  ],
};

/// Descriptor for `PermissionResourceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List permissionResourceTypeDescriptor = $convert.base64Decode(
    'ChZQZXJtaXNzaW9uUmVzb3VyY2VUeXBlEigKJFBFUk1JU1NJT05fUkVTT1VSQ0VfVFlQRV9VTl'
    'NQRUNJRklFRBAAEiUKIVBFUk1JU1NJT05fUkVTT1VSQ0VfVFlQRV9CVVNJTkVTUxABEiIKHlBF'
    'Uk1JU1NJT05fUkVTT1VSQ0VfVFlQRV9TVE9SRRAC');

@$core.Deprecated('Use permissionEntityTypeDescriptor instead')
const PermissionEntityType$json = {
  '1': 'PermissionEntityType',
  '2': [
    {'1': 'PERMISSION_ENTITY_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'PERMISSION_ENTITY_TYPE_BUSINESS', '2': 1},
    {'1': 'PERMISSION_ENTITY_TYPE_STORE', '2': 2},
    {'1': 'PERMISSION_ENTITY_TYPE_USER', '2': 3},
    {'1': 'PERMISSION_ENTITY_TYPE_ARTICLE', '2': 4},
    {'1': 'PERMISSION_ENTITY_TYPE_INVOICE', '2': 5},
    {'1': 'PERMISSION_ENTITY_TYPE_PAYMENT', '2': 6},
    {'1': 'PERMISSION_ENTITY_TYPE_ORDER', '2': 7},
    {'1': 'PERMISSION_ENTITY_TYPE_PERMISSION_GROUP', '2': 8},
  ],
};

/// Descriptor for `PermissionEntityType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List permissionEntityTypeDescriptor = $convert.base64Decode(
    'ChRQZXJtaXNzaW9uRW50aXR5VHlwZRImCiJQRVJNSVNTSU9OX0VOVElUWV9UWVBFX1VOU1BFQ0'
    'lGSUVEEAASIwofUEVSTUlTU0lPTl9FTlRJVFlfVFlQRV9CVVNJTkVTUxABEiAKHFBFUk1JU1NJ'
    'T05fRU5USVRZX1RZUEVfU1RPUkUQAhIfChtQRVJNSVNTSU9OX0VOVElUWV9UWVBFX1VTRVIQAx'
    'IiCh5QRVJNSVNTSU9OX0VOVElUWV9UWVBFX0FSVElDTEUQBBIiCh5QRVJNSVNTSU9OX0VOVElU'
    'WV9UWVBFX0lOVk9JQ0UQBRIiCh5QRVJNSVNTSU9OX0VOVElUWV9UWVBFX1BBWU1FTlQQBhIgCh'
    'xQRVJNSVNTSU9OX0VOVElUWV9UWVBFX09SREVSEAcSKwonUEVSTUlTU0lPTl9FTlRJVFlfVFlQ'
    'RV9QRVJNSVNTSU9OX0dST1VQEAg=');

@$core.Deprecated('Use permissionDescriptor instead')
const Permission$json = {
  '1': 'Permission',
  '2': [
    {'1': 'action', '3': 1, '4': 1, '5': 14, '6': '.identity.v1.PermissionActionType', '10': 'action'},
    {'1': 'entity', '3': 2, '4': 1, '5': 14, '6': '.identity.v1.PermissionEntityType', '10': 'entity'},
    {'1': 'resource_type', '3': 3, '4': 1, '5': 14, '6': '.identity.v1.PermissionResourceType', '10': 'resourceType'},
  ],
};

/// Descriptor for `Permission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionDescriptor = $convert.base64Decode(
    'CgpQZXJtaXNzaW9uEjkKBmFjdGlvbhgBIAEoDjIhLmlkZW50aXR5LnYxLlBlcm1pc3Npb25BY3'
    'Rpb25UeXBlUgZhY3Rpb24SOQoGZW50aXR5GAIgASgOMiEuaWRlbnRpdHkudjEuUGVybWlzc2lv'
    'bkVudGl0eVR5cGVSBmVudGl0eRJICg1yZXNvdXJjZV90eXBlGAMgASgOMiMuaWRlbnRpdHkudj'
    'EuUGVybWlzc2lvblJlc291cmNlVHlwZVIMcmVzb3VyY2VUeXBl');

@$core.Deprecated('Use userPermissionDescriptor instead')
const UserPermission$json = {
  '1': 'UserPermission',
  '2': [
    {'1': 'user_uid', '3': 1, '4': 1, '5': 9, '10': 'userUid'},
    {'1': 'permissions', '3': 2, '4': 3, '5': 11, '6': '.identity.v1.Permission', '10': 'permissions'},
    {'1': 'permission_group_uid', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'permissionGroupUid', '17': true},
    {'1': 'resource_uid', '3': 4, '4': 1, '5': 9, '10': 'resourceUid'},
  ],
  '8': [
    {'1': '_permission_group_uid'},
  ],
};

/// Descriptor for `UserPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List userPermissionDescriptor = $convert.base64Decode(
    'Cg5Vc2VyUGVybWlzc2lvbhIZCgh1c2VyX3VpZBgBIAEoCVIHdXNlclVpZBI5CgtwZXJtaXNzaW'
    '9ucxgCIAMoCzIXLmlkZW50aXR5LnYxLlBlcm1pc3Npb25SC3Blcm1pc3Npb25zEjUKFHBlcm1p'
    'c3Npb25fZ3JvdXBfdWlkGAMgASgJSABSEnBlcm1pc3Npb25Hcm91cFVpZIgBARIhCgxyZXNvdX'
    'JjZV91aWQYBCABKAlSC3Jlc291cmNlVWlkQhcKFV9wZXJtaXNzaW9uX2dyb3VwX3VpZA==');

@$core.Deprecated('Use permissionGroupDescriptor instead')
const PermissionGroup$json = {
  '1': 'PermissionGroup',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
    {'1': 'description', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'description', '17': true},
    {'1': 'permissions', '3': 4, '4': 3, '5': 11, '6': '.identity.v1.Permission', '10': 'permissions'},
    {'1': 'business_uid', '3': 5, '4': 1, '5': 9, '9': 1, '10': 'businessUid', '17': true},
  ],
  '8': [
    {'1': '_description'},
    {'1': '_business_uid'},
  ],
};

/// Descriptor for `PermissionGroup`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List permissionGroupDescriptor = $convert.base64Decode(
    'Cg9QZXJtaXNzaW9uR3JvdXASEAoDdWlkGAEgASgJUgN1aWQSEgoEbmFtZRgCIAEoCVIEbmFtZR'
    'IlCgtkZXNjcmlwdGlvbhgDIAEoCUgAUgtkZXNjcmlwdGlvbogBARI5CgtwZXJtaXNzaW9ucxgE'
    'IAMoCzIXLmlkZW50aXR5LnYxLlBlcm1pc3Npb25SC3Blcm1pc3Npb25zEiYKDGJ1c2luZXNzX3'
    'VpZBgFIAEoCUgBUgtidXNpbmVzc1VpZIgBAUIOCgxfZGVzY3JpcHRpb25CDwoNX2J1c2luZXNz'
    'X3VpZA==');

@$core.Deprecated('Use createPermissionGroupRequestDescriptor instead')
const CreatePermissionGroupRequest$json = {
  '1': 'CreatePermissionGroupRequest',
  '2': [
    {'1': 'permission_group', '3': 1, '4': 1, '5': 11, '6': '.identity.v1.PermissionGroup', '10': 'permissionGroup'},
  ],
};

/// Descriptor for `CreatePermissionGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPermissionGroupRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0EkcKEHBlcm1pc3Npb25fZ3JvdXAYASABKA'
    'syHC5pZGVudGl0eS52MS5QZXJtaXNzaW9uR3JvdXBSD3Blcm1pc3Npb25Hcm91cA==');

@$core.Deprecated('Use createPermissionGroupResponseDescriptor instead')
const CreatePermissionGroupResponse$json = {
  '1': 'CreatePermissionGroupResponse',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `CreatePermissionGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPermissionGroupResponseDescriptor = $convert.base64Decode(
    'Ch1DcmVhdGVQZXJtaXNzaW9uR3JvdXBSZXNwb25zZRIQCgN1aWQYASABKAlSA3VpZA==');

@$core.Deprecated('Use getPermissionGroupRequestDescriptor instead')
const GetPermissionGroupRequest$json = {
  '1': 'GetPermissionGroupRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
  ],
};

/// Descriptor for `GetPermissionGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPermissionGroupRequestDescriptor = $convert.base64Decode(
    'ChlHZXRQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0EhAKA3VpZBgBIAEoCVIDdWlk');

@$core.Deprecated('Use getPermissionGroupResponseDescriptor instead')
const GetPermissionGroupResponse$json = {
  '1': 'GetPermissionGroupResponse',
  '2': [
    {'1': 'permission_group', '3': 1, '4': 1, '5': 11, '6': '.identity.v1.PermissionGroup', '10': 'permissionGroup'},
  ],
};

/// Descriptor for `GetPermissionGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPermissionGroupResponseDescriptor = $convert.base64Decode(
    'ChpHZXRQZXJtaXNzaW9uR3JvdXBSZXNwb25zZRJHChBwZXJtaXNzaW9uX2dyb3VwGAEgASgLMh'
    'wuaWRlbnRpdHkudjEuUGVybWlzc2lvbkdyb3VwUg9wZXJtaXNzaW9uR3JvdXA=');

@$core.Deprecated('Use updatePermissionGroupRequestDescriptor instead')
const UpdatePermissionGroupRequest$json = {
  '1': 'UpdatePermissionGroupRequest',
  '2': [
    {'1': 'permission_group', '3': 1, '4': 1, '5': 11, '6': '.identity.v1.PermissionGroup', '10': 'permissionGroup'},
  ],
};

/// Descriptor for `UpdatePermissionGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePermissionGroupRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0EkcKEHBlcm1pc3Npb25fZ3JvdXAYASABKA'
    'syHC5pZGVudGl0eS52MS5QZXJtaXNzaW9uR3JvdXBSD3Blcm1pc3Npb25Hcm91cA==');

@$core.Deprecated('Use updatePermissionGroupResponseDescriptor instead')
const UpdatePermissionGroupResponse$json = {
  '1': 'UpdatePermissionGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdatePermissionGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePermissionGroupResponseDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVQZXJtaXNzaW9uR3JvdXBSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
    'Nz');

@$core.Deprecated('Use deletePermissionGroupRequestDescriptor instead')
const DeletePermissionGroupRequest$json = {
  '1': 'DeletePermissionGroupRequest',
  '2': [
    {'1': 'uid', '3': 1, '4': 1, '5': 9, '10': 'uid'},
    {'1': 'business_uid', '3': 2, '4': 1, '5': 9, '10': 'businessUid'},
  ],
};

/// Descriptor for `DeletePermissionGroupRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePermissionGroupRequestDescriptor = $convert.base64Decode(
    'ChxEZWxldGVQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0EhAKA3VpZBgBIAEoCVIDdWlkEiEKDGJ1c2'
    'luZXNzX3VpZBgCIAEoCVILYnVzaW5lc3NVaWQ=');

@$core.Deprecated('Use deletePermissionGroupResponseDescriptor instead')
const DeletePermissionGroupResponse$json = {
  '1': 'DeletePermissionGroupResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeletePermissionGroupResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deletePermissionGroupResponseDescriptor = $convert.base64Decode(
    'Ch1EZWxldGVQZXJtaXNzaW9uR3JvdXBSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
    'Nz');

@$core.Deprecated('Use getUserPermissionsRequestDescriptor instead')
const GetUserPermissionsRequest$json = {
  '1': 'GetUserPermissionsRequest',
  '2': [
    {'1': 'user_uid', '3': 1, '4': 1, '5': 9, '10': 'userUid'},
  ],
};

/// Descriptor for `GetUserPermissionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPermissionsRequestDescriptor = $convert.base64Decode(
    'ChlHZXRVc2VyUGVybWlzc2lvbnNSZXF1ZXN0EhkKCHVzZXJfdWlkGAEgASgJUgd1c2VyVWlk');

@$core.Deprecated('Use getUserPermissionsResponseDescriptor instead')
const GetUserPermissionsResponse$json = {
  '1': 'GetUserPermissionsResponse',
  '2': [
    {'1': 'user_permissions', '3': 1, '4': 3, '5': 11, '6': '.identity.v1.UserPermission', '10': 'userPermissions'},
  ],
};

/// Descriptor for `GetUserPermissionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getUserPermissionsResponseDescriptor = $convert.base64Decode(
    'ChpHZXRVc2VyUGVybWlzc2lvbnNSZXNwb25zZRJGChB1c2VyX3Blcm1pc3Npb25zGAEgAygLMh'
    'suaWRlbnRpdHkudjEuVXNlclBlcm1pc3Npb25SD3VzZXJQZXJtaXNzaW9ucw==');

@$core.Deprecated('Use removeUserPermissionRequestDescriptor instead')
const RemoveUserPermissionRequest$json = {
  '1': 'RemoveUserPermissionRequest',
  '2': [
    {'1': 'user_uid', '3': 1, '4': 1, '5': 9, '10': 'userUid'},
    {'1': 'permission_group_uid', '3': 2, '4': 1, '5': 9, '10': 'permissionGroupUid'},
    {'1': 'resource_uid', '3': 3, '4': 1, '5': 9, '10': 'resourceUid'},
  ],
};

/// Descriptor for `RemoveUserPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserPermissionRequestDescriptor = $convert.base64Decode(
    'ChtSZW1vdmVVc2VyUGVybWlzc2lvblJlcXVlc3QSGQoIdXNlcl91aWQYASABKAlSB3VzZXJVaW'
    'QSMAoUcGVybWlzc2lvbl9ncm91cF91aWQYAiABKAlSEnBlcm1pc3Npb25Hcm91cFVpZBIhCgxy'
    'ZXNvdXJjZV91aWQYAyABKAlSC3Jlc291cmNlVWlk');

@$core.Deprecated('Use removeUserPermissionResponseDescriptor instead')
const RemoveUserPermissionResponse$json = {
  '1': 'RemoveUserPermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `RemoveUserPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List removeUserPermissionResponseDescriptor = $convert.base64Decode(
    'ChxSZW1vdmVVc2VyUGVybWlzc2lvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3'
    'M=');

@$core.Deprecated('Use addUserPermissionRequestDescriptor instead')
const AddUserPermissionRequest$json = {
  '1': 'AddUserPermissionRequest',
  '2': [
    {'1': 'user_uid', '3': 1, '4': 1, '5': 9, '10': 'userUid'},
    {'1': 'permission_group_uid', '3': 2, '4': 1, '5': 9, '10': 'permissionGroupUid'},
    {'1': 'resource_uid', '3': 3, '4': 1, '5': 9, '10': 'resourceUid'},
  ],
};

/// Descriptor for `AddUserPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserPermissionRequestDescriptor = $convert.base64Decode(
    'ChhBZGRVc2VyUGVybWlzc2lvblJlcXVlc3QSGQoIdXNlcl91aWQYASABKAlSB3VzZXJVaWQSMA'
    'oUcGVybWlzc2lvbl9ncm91cF91aWQYAiABKAlSEnBlcm1pc3Npb25Hcm91cFVpZBIhCgxyZXNv'
    'dXJjZV91aWQYAyABKAlSC3Jlc291cmNlVWlk');

@$core.Deprecated('Use addUserPermissionResponseDescriptor instead')
const AddUserPermissionResponse$json = {
  '1': 'AddUserPermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AddUserPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addUserPermissionResponseDescriptor = $convert.base64Decode(
    'ChlBZGRVc2VyUGVybWlzc2lvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use getBusinessPermissionGroupsRequestDescriptor instead')
const GetBusinessPermissionGroupsRequest$json = {
  '1': 'GetBusinessPermissionGroupsRequest',
  '2': [
    {'1': 'business_uid', '3': 1, '4': 1, '5': 9, '10': 'businessUid'},
  ],
};

/// Descriptor for `GetBusinessPermissionGroupsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessPermissionGroupsRequestDescriptor = $convert.base64Decode(
    'CiJHZXRCdXNpbmVzc1Blcm1pc3Npb25Hcm91cHNSZXF1ZXN0EiEKDGJ1c2luZXNzX3VpZBgBIA'
    'EoCVILYnVzaW5lc3NVaWQ=');

@$core.Deprecated('Use getBusinessPermissionGroupsResponseDescriptor instead')
const GetBusinessPermissionGroupsResponse$json = {
  '1': 'GetBusinessPermissionGroupsResponse',
  '2': [
    {'1': 'permission_groups', '3': 1, '4': 3, '5': 11, '6': '.identity.v1.PermissionGroup', '10': 'permissionGroups'},
  ],
};

/// Descriptor for `GetBusinessPermissionGroupsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessPermissionGroupsResponseDescriptor = $convert.base64Decode(
    'CiNHZXRCdXNpbmVzc1Blcm1pc3Npb25Hcm91cHNSZXNwb25zZRJJChFwZXJtaXNzaW9uX2dyb3'
    'VwcxgBIAMoCzIcLmlkZW50aXR5LnYxLlBlcm1pc3Npb25Hcm91cFIQcGVybWlzc2lvbkdyb3Vw'
    'cw==');

@$core.Deprecated('Use checkPermissionRequestDescriptor instead')
const CheckPermissionRequest$json = {
  '1': 'CheckPermissionRequest',
  '2': [
    {'1': 'user_uid', '3': 1, '4': 1, '5': 9, '10': 'userUid'},
    {'1': 'resource_uid', '3': 3, '4': 1, '5': 9, '10': 'resourceUid'},
    {'1': 'permission', '3': 4, '4': 1, '5': 11, '6': '.identity.v1.Permission', '10': 'permission'},
  ],
};

/// Descriptor for `CheckPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionRequestDescriptor = $convert.base64Decode(
    'ChZDaGVja1Blcm1pc3Npb25SZXF1ZXN0EhkKCHVzZXJfdWlkGAEgASgJUgd1c2VyVWlkEiEKDH'
    'Jlc291cmNlX3VpZBgDIAEoCVILcmVzb3VyY2VVaWQSNwoKcGVybWlzc2lvbhgEIAEoCzIXLmlk'
    'ZW50aXR5LnYxLlBlcm1pc3Npb25SCnBlcm1pc3Npb24=');

@$core.Deprecated('Use checkPermissionResponseDescriptor instead')
const CheckPermissionResponse$json = {
  '1': 'CheckPermissionResponse',
  '2': [
    {'1': 'has_permission', '3': 1, '4': 1, '5': 8, '10': 'hasPermission'},
  ],
};

/// Descriptor for `CheckPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkPermissionResponseDescriptor = $convert.base64Decode(
    'ChdDaGVja1Blcm1pc3Npb25SZXNwb25zZRIlCg5oYXNfcGVybWlzc2lvbhgBIAEoCFINaGFzUG'
    'VybWlzc2lvbg==');

const $core.Map<$core.String, $core.dynamic> PermissionServiceBase$json = {
  '1': 'PermissionService',
  '2': [
    {'1': 'CreatePermissionGroup', '2': '.identity.v1.CreatePermissionGroupRequest', '3': '.identity.v1.CreatePermissionGroupResponse', '4': {}},
    {'1': 'GetPermissionGroup', '2': '.identity.v1.GetPermissionGroupRequest', '3': '.identity.v1.GetPermissionGroupResponse', '4': {}},
    {'1': 'UpdatePermissionGroup', '2': '.identity.v1.UpdatePermissionGroupRequest', '3': '.identity.v1.UpdatePermissionGroupResponse', '4': {}},
    {'1': 'DeletePermissionGroup', '2': '.identity.v1.DeletePermissionGroupRequest', '3': '.identity.v1.DeletePermissionGroupResponse', '4': {}},
    {'1': 'GetUserPermissions', '2': '.identity.v1.GetUserPermissionsRequest', '3': '.identity.v1.GetUserPermissionsResponse', '4': {}},
    {'1': 'RemoveUserPermission', '2': '.identity.v1.RemoveUserPermissionRequest', '3': '.identity.v1.RemoveUserPermissionResponse', '4': {}},
    {'1': 'AddUserPermission', '2': '.identity.v1.AddUserPermissionRequest', '3': '.identity.v1.AddUserPermissionResponse', '4': {}},
    {'1': 'GetBusinessPermissionGroups', '2': '.identity.v1.GetBusinessPermissionGroupsRequest', '3': '.identity.v1.GetBusinessPermissionGroupsResponse', '4': {}},
    {'1': 'CheckPermission', '2': '.identity.v1.CheckPermissionRequest', '3': '.identity.v1.CheckPermissionResponse', '4': {}},
  ],
};

@$core.Deprecated('Use permissionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> PermissionServiceBase$messageJson = {
  '.identity.v1.CreatePermissionGroupRequest': CreatePermissionGroupRequest$json,
  '.identity.v1.PermissionGroup': PermissionGroup$json,
  '.identity.v1.Permission': Permission$json,
  '.identity.v1.CreatePermissionGroupResponse': CreatePermissionGroupResponse$json,
  '.identity.v1.GetPermissionGroupRequest': GetPermissionGroupRequest$json,
  '.identity.v1.GetPermissionGroupResponse': GetPermissionGroupResponse$json,
  '.identity.v1.UpdatePermissionGroupRequest': UpdatePermissionGroupRequest$json,
  '.identity.v1.UpdatePermissionGroupResponse': UpdatePermissionGroupResponse$json,
  '.identity.v1.DeletePermissionGroupRequest': DeletePermissionGroupRequest$json,
  '.identity.v1.DeletePermissionGroupResponse': DeletePermissionGroupResponse$json,
  '.identity.v1.GetUserPermissionsRequest': GetUserPermissionsRequest$json,
  '.identity.v1.GetUserPermissionsResponse': GetUserPermissionsResponse$json,
  '.identity.v1.UserPermission': UserPermission$json,
  '.identity.v1.RemoveUserPermissionRequest': RemoveUserPermissionRequest$json,
  '.identity.v1.RemoveUserPermissionResponse': RemoveUserPermissionResponse$json,
  '.identity.v1.AddUserPermissionRequest': AddUserPermissionRequest$json,
  '.identity.v1.AddUserPermissionResponse': AddUserPermissionResponse$json,
  '.identity.v1.GetBusinessPermissionGroupsRequest': GetBusinessPermissionGroupsRequest$json,
  '.identity.v1.GetBusinessPermissionGroupsResponse': GetBusinessPermissionGroupsResponse$json,
  '.identity.v1.CheckPermissionRequest': CheckPermissionRequest$json,
  '.identity.v1.CheckPermissionResponse': CheckPermissionResponse$json,
};

/// Descriptor for `PermissionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List permissionServiceDescriptor = $convert.base64Decode(
    'ChFQZXJtaXNzaW9uU2VydmljZRJwChVDcmVhdGVQZXJtaXNzaW9uR3JvdXASKS5pZGVudGl0eS'
    '52MS5DcmVhdGVQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0GiouaWRlbnRpdHkudjEuQ3JlYXRlUGVy'
    'bWlzc2lvbkdyb3VwUmVzcG9uc2UiABJnChJHZXRQZXJtaXNzaW9uR3JvdXASJi5pZGVudGl0eS'
    '52MS5HZXRQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0GicuaWRlbnRpdHkudjEuR2V0UGVybWlzc2lv'
    'bkdyb3VwUmVzcG9uc2UiABJwChVVcGRhdGVQZXJtaXNzaW9uR3JvdXASKS5pZGVudGl0eS52MS'
    '5VcGRhdGVQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0GiouaWRlbnRpdHkudjEuVXBkYXRlUGVybWlz'
    'c2lvbkdyb3VwUmVzcG9uc2UiABJwChVEZWxldGVQZXJtaXNzaW9uR3JvdXASKS5pZGVudGl0eS'
    '52MS5EZWxldGVQZXJtaXNzaW9uR3JvdXBSZXF1ZXN0GiouaWRlbnRpdHkudjEuRGVsZXRlUGVy'
    'bWlzc2lvbkdyb3VwUmVzcG9uc2UiABJnChJHZXRVc2VyUGVybWlzc2lvbnMSJi5pZGVudGl0eS'
    '52MS5HZXRVc2VyUGVybWlzc2lvbnNSZXF1ZXN0GicuaWRlbnRpdHkudjEuR2V0VXNlclBlcm1p'
    'c3Npb25zUmVzcG9uc2UiABJtChRSZW1vdmVVc2VyUGVybWlzc2lvbhIoLmlkZW50aXR5LnYxLl'
    'JlbW92ZVVzZXJQZXJtaXNzaW9uUmVxdWVzdBopLmlkZW50aXR5LnYxLlJlbW92ZVVzZXJQZXJt'
    'aXNzaW9uUmVzcG9uc2UiABJkChFBZGRVc2VyUGVybWlzc2lvbhIlLmlkZW50aXR5LnYxLkFkZF'
    'VzZXJQZXJtaXNzaW9uUmVxdWVzdBomLmlkZW50aXR5LnYxLkFkZFVzZXJQZXJtaXNzaW9uUmVz'
    'cG9uc2UiABKCAQobR2V0QnVzaW5lc3NQZXJtaXNzaW9uR3JvdXBzEi8uaWRlbnRpdHkudjEuR2'
    'V0QnVzaW5lc3NQZXJtaXNzaW9uR3JvdXBzUmVxdWVzdBowLmlkZW50aXR5LnYxLkdldEJ1c2lu'
    'ZXNzUGVybWlzc2lvbkdyb3Vwc1Jlc3BvbnNlIgASXgoPQ2hlY2tQZXJtaXNzaW9uEiMuaWRlbn'
    'RpdHkudjEuQ2hlY2tQZXJtaXNzaW9uUmVxdWVzdBokLmlkZW50aXR5LnYxLkNoZWNrUGVybWlz'
    'c2lvblJlc3BvbnNlIgA=');

