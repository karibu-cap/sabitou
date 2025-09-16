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

@$core.Deprecated('Use businessResourceTypeDescriptor instead')
const BusinessResourceType$json = {
  '1': 'BusinessResourceType',
  '2': [
    {'1': 'BUSINESS_RESOURCE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'BUSINESS_RESOURCE_TYPE_BUSINESS', '2': 1},
    {'1': 'BUSINESS_RESOURCE_TYPE_MEMBER', '2': 2},
    {'1': 'BUSINESS_RESOURCE_TYPE_SUPPLIER', '2': 3},
  ],
};

/// Descriptor for `BusinessResourceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List businessResourceTypeDescriptor = $convert.base64Decode(
    'ChRCdXNpbmVzc1Jlc291cmNlVHlwZRImCiJCVVNJTkVTU19SRVNPVVJDRV9UWVBFX1VOU1BFQ0'
    'lGSUVEEAASIwofQlVTSU5FU1NfUkVTT1VSQ0VfVFlQRV9CVVNJTkVTUxABEiEKHUJVU0lORVNT'
    'X1JFU09VUkNFX1RZUEVfTUVNQkVSEAISIwofQlVTSU5FU1NfUkVTT1VSQ0VfVFlQRV9TVVBQTE'
    'lFUhAD');

@$core.Deprecated('Use storeResourceTypeDescriptor instead')
const StoreResourceType$json = {
  '1': 'StoreResourceType',
  '2': [
    {'1': 'STORE_RESOURCE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'STORE_RESOURCE_TYPE_STORE', '2': 1},
    {'1': 'STORE_RESOURCE_TYPE_INVOICE', '2': 2},
    {'1': 'STORE_RESOURCE_TYPE_ORDER', '2': 3},
    {'1': 'STORE_RESOURCE_TYPE_SUPPLIER_ORDER', '2': 4},
    {'1': 'STORE_RESOURCE_TYPE_PRODUCT', '2': 5},
  ],
};

/// Descriptor for `StoreResourceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List storeResourceTypeDescriptor = $convert.base64Decode(
    'ChFTdG9yZVJlc291cmNlVHlwZRIjCh9TVE9SRV9SRVNPVVJDRV9UWVBFX1VOU1BFQ0lGSUVEEA'
    'ASHQoZU1RPUkVfUkVTT1VSQ0VfVFlQRV9TVE9SRRABEh8KG1NUT1JFX1JFU09VUkNFX1RZUEVf'
    'SU5WT0lDRRACEh0KGVNUT1JFX1JFU09VUkNFX1RZUEVfT1JERVIQAxImCiJTVE9SRV9SRVNPVV'
    'JDRV9UWVBFX1NVUFBMSUVSX09SREVSEAQSHwobU1RPUkVfUkVTT1VSQ0VfVFlQRV9QUk9EVUNU'
    'EAU=');

@$core.Deprecated('Use businessPermissionDescriptor instead')
const BusinessPermission$json = {
  '1': 'BusinessPermission',
  '2': [
    {
      '1': 'resource_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.BusinessResourceType',
      '10': 'resourceType'
    },
    {
      '1': 'action_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceActionType',
      '10': 'actionType'
    },
  ],
};

/// Descriptor for `BusinessPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessPermissionDescriptor = $convert.base64Decode(
    'ChJCdXNpbmVzc1Blcm1pc3Npb24SRgoNcmVzb3VyY2VfdHlwZRgBIAEoDjIhLmlkZW50aXR5Ln'
    'YxLkJ1c2luZXNzUmVzb3VyY2VUeXBlUgxyZXNvdXJjZVR5cGUSQAoLYWN0aW9uX3R5cGUYAiAB'
    'KA4yHy5pZGVudGl0eS52MS5SZXNvdXJjZUFjdGlvblR5cGVSCmFjdGlvblR5cGU=');

@$core.Deprecated('Use storePermissionDescriptor instead')
const StorePermission$json = {
  '1': 'StorePermission',
  '2': [
    {
      '1': 'resource_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.StoreResourceType',
      '10': 'resourceType'
    },
    {
      '1': 'action_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceActionType',
      '10': 'actionType'
    },
  ],
};

/// Descriptor for `StorePermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storePermissionDescriptor = $convert.base64Decode(
    'Cg9TdG9yZVBlcm1pc3Npb24SQwoNcmVzb3VyY2VfdHlwZRgBIAEoDjIeLmlkZW50aXR5LnYxLl'
    'N0b3JlUmVzb3VyY2VUeXBlUgxyZXNvdXJjZVR5cGUSQAoLYWN0aW9uX3R5cGUYAiABKA4yHy5p'
    'ZGVudGl0eS52MS5SZXNvdXJjZUFjdGlvblR5cGVSCmFjdGlvblR5cGU=');

@$core.Deprecated('Use createBusinessPermissionRequestDescriptor instead')
const CreateBusinessPermissionRequest$json = {
  '1': 'CreateBusinessPermissionRequest',
  '2': [
    {
      '1': 'business_permission',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'businessPermission'
    },
    {
      '1': 'action_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceActionType',
      '10': 'actionType'
    },
    {'1': 'business_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
};

/// Descriptor for `CreateBusinessPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessPermissionRequestDescriptor = $convert.base64Decode(
    'Ch9DcmVhdGVCdXNpbmVzc1Blcm1pc3Npb25SZXF1ZXN0ElAKE2J1c2luZXNzX3Blcm1pc3Npb2'
    '4YASABKAsyHy5pZGVudGl0eS52MS5CdXNpbmVzc1Blcm1pc3Npb25SEmJ1c2luZXNzUGVybWlz'
    'c2lvbhJACgthY3Rpb25fdHlwZRgCIAEoDjIfLmlkZW50aXR5LnYxLlJlc291cmNlQWN0aW9uVH'
    'lwZVIKYWN0aW9uVHlwZRIrCgtidXNpbmVzc19pZBgDIAEoCUIKukgHyAEBcgIQA1IKYnVzaW5l'
    'c3NJZA==');

@$core.Deprecated('Use createBusinessPermissionResponseDescriptor instead')
const CreateBusinessPermissionResponse$json = {
  '1': 'CreateBusinessPermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateBusinessPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createBusinessPermissionResponseDescriptor =
    $convert.base64Decode(
        'CiBDcmVhdGVCdXNpbmVzc1Blcm1pc3Npb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdW'
        'NjZXNz');

@$core.Deprecated('Use createStorePermissionRequestDescriptor instead')
const CreateStorePermissionRequest$json = {
  '1': 'CreateStorePermissionRequest',
  '2': [
    {
      '1': 'store_permission',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermission',
      '10': 'storePermission'
    },
    {
      '1': 'action_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceActionType',
      '10': 'actionType'
    },
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `CreateStorePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStorePermissionRequestDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVTdG9yZVBlcm1pc3Npb25SZXF1ZXN0EkcKEHN0b3JlX3Blcm1pc3Npb24YASABKA'
    'syHC5pZGVudGl0eS52MS5TdG9yZVBlcm1pc3Npb25SD3N0b3JlUGVybWlzc2lvbhJACgthY3Rp'
    'b25fdHlwZRgCIAEoDjIfLmlkZW50aXR5LnYxLlJlc291cmNlQWN0aW9uVHlwZVIKYWN0aW9uVH'
    'lwZRIlCghzdG9yZV9pZBgDIAEoCUIKukgHyAEBcgIQA1IHc3RvcmVJZA==');

@$core.Deprecated('Use createStorePermissionResponseDescriptor instead')
const CreateStorePermissionResponse$json = {
  '1': 'CreateStorePermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateStorePermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStorePermissionResponseDescriptor =
    $convert.base64Decode(
        'Ch1DcmVhdGVTdG9yZVBlcm1pc3Npb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
        'Nz');

@$core.Deprecated('Use updateBusinessPermissionRequestDescriptor instead')
const UpdateBusinessPermissionRequest$json = {
  '1': 'UpdateBusinessPermissionRequest',
  '2': [
    {
      '1': 'business_permission',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'businessPermission'
    },
    {
      '1': 'action_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceActionType',
      '10': 'actionType'
    },
    {
      '1': 'business_permission_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'businessPermissionId'
    },
  ],
};

/// Descriptor for `UpdateBusinessPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessPermissionRequestDescriptor = $convert.base64Decode(
    'Ch9VcGRhdGVCdXNpbmVzc1Blcm1pc3Npb25SZXF1ZXN0ElAKE2J1c2luZXNzX3Blcm1pc3Npb2'
    '4YASABKAsyHy5pZGVudGl0eS52MS5CdXNpbmVzc1Blcm1pc3Npb25SEmJ1c2luZXNzUGVybWlz'
    'c2lvbhJACgthY3Rpb25fdHlwZRgCIAEoDjIfLmlkZW50aXR5LnYxLlJlc291cmNlQWN0aW9uVH'
    'lwZVIKYWN0aW9uVHlwZRJAChZidXNpbmVzc19wZXJtaXNzaW9uX2lkGAMgASgJQgq6SAfIAQFy'
    'AhADUhRidXNpbmVzc1Blcm1pc3Npb25JZA==');

@$core.Deprecated('Use updateBusinessPermissionResponseDescriptor instead')
const UpdateBusinessPermissionResponse$json = {
  '1': 'UpdateBusinessPermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateBusinessPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateBusinessPermissionResponseDescriptor =
    $convert.base64Decode(
        'CiBVcGRhdGVCdXNpbmVzc1Blcm1pc3Npb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdW'
        'NjZXNz');

@$core.Deprecated('Use updateStorePermissionRequestDescriptor instead')
const UpdateStorePermissionRequest$json = {
  '1': 'UpdateStorePermissionRequest',
  '2': [
    {
      '1': 'store_permission',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermission',
      '10': 'storePermission'
    },
    {
      '1': 'action_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.identity.v1.ResourceActionType',
      '10': 'actionType'
    },
    {
      '1': 'store_permission_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'storePermissionId'
    },
  ],
};

/// Descriptor for `UpdateStorePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStorePermissionRequestDescriptor = $convert.base64Decode(
    'ChxVcGRhdGVTdG9yZVBlcm1pc3Npb25SZXF1ZXN0EkcKEHN0b3JlX3Blcm1pc3Npb24YASABKA'
    'syHC5pZGVudGl0eS52MS5TdG9yZVBlcm1pc3Npb25SD3N0b3JlUGVybWlzc2lvbhJACgthY3Rp'
    'b25fdHlwZRgCIAEoDjIfLmlkZW50aXR5LnYxLlJlc291cmNlQWN0aW9uVHlwZVIKYWN0aW9uVH'
    'lwZRI6ChNzdG9yZV9wZXJtaXNzaW9uX2lkGAMgASgJQgq6SAfIAQFyAhADUhFzdG9yZVBlcm1p'
    'c3Npb25JZA==');

@$core.Deprecated('Use updateStorePermissionResponseDescriptor instead')
const UpdateStorePermissionResponse$json = {
  '1': 'UpdateStorePermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateStorePermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStorePermissionResponseDescriptor =
    $convert.base64Decode(
        'Ch1VcGRhdGVTdG9yZVBlcm1pc3Npb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
        'Nz');

@$core.Deprecated('Use deleteBusinessPermissionRequestDescriptor instead')
const DeleteBusinessPermissionRequest$json = {
  '1': 'DeleteBusinessPermissionRequest',
  '2': [
    {
      '1': 'business_permission_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'businessPermissionId'
    },
  ],
};

/// Descriptor for `DeleteBusinessPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessPermissionRequestDescriptor =
    $convert.base64Decode(
        'Ch9EZWxldGVCdXNpbmVzc1Blcm1pc3Npb25SZXF1ZXN0EkAKFmJ1c2luZXNzX3Blcm1pc3Npb2'
        '5faWQYASABKAlCCrpIB8gBAXICEANSFGJ1c2luZXNzUGVybWlzc2lvbklk');

@$core.Deprecated('Use deleteBusinessPermissionResponseDescriptor instead')
const DeleteBusinessPermissionResponse$json = {
  '1': 'DeleteBusinessPermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteBusinessPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteBusinessPermissionResponseDescriptor =
    $convert.base64Decode(
        'CiBEZWxldGVCdXNpbmVzc1Blcm1pc3Npb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdW'
        'NjZXNz');

@$core.Deprecated('Use deleteStorePermissionRequestDescriptor instead')
const DeleteStorePermissionRequest$json = {
  '1': 'DeleteStorePermissionRequest',
  '2': [
    {
      '1': 'store_permission_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'storePermissionId'
    },
  ],
};

/// Descriptor for `DeleteStorePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteStorePermissionRequestDescriptor =
    $convert.base64Decode(
        'ChxEZWxldGVTdG9yZVBlcm1pc3Npb25SZXF1ZXN0EjoKE3N0b3JlX3Blcm1pc3Npb25faWQYAS'
        'ABKAlCCrpIB8gBAXICEANSEXN0b3JlUGVybWlzc2lvbklk');

@$core.Deprecated('Use deleteStorePermissionResponseDescriptor instead')
const DeleteStorePermissionResponse$json = {
  '1': 'DeleteStorePermissionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteStorePermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteStorePermissionResponseDescriptor =
    $convert.base64Decode(
        'Ch1EZWxldGVTdG9yZVBlcm1pc3Npb25SZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZX'
        'Nz');

@$core.Deprecated('Use getStorePermissionsRequestDescriptor instead')
const GetStorePermissionsRequest$json = {
  '1': 'GetStorePermissionsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `GetStorePermissionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStorePermissionsRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRTdG9yZVBlcm1pc3Npb25zUmVxdWVzdBIlCghzdG9yZV9pZBgBIAEoCUIKukgHyAEBcg'
        'IQA1IHc3RvcmVJZA==');

@$core.Deprecated('Use checkBusinessPermissionRequestDescriptor instead')
const CheckBusinessPermissionRequest$json = {
  '1': 'CheckBusinessPermissionRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'business_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {
      '1': 'permission',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.BusinessPermission',
      '10': 'permission'
    },
  ],
};

/// Descriptor for `CheckBusinessPermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkBusinessPermissionRequestDescriptor =
    $convert.base64Decode(
        'Ch5DaGVja0J1c2luZXNzUGVybWlzc2lvblJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyA'
        'EBcgIQA1IGdXNlcklkEisKC2J1c2luZXNzX2lkGAMgASgJQgq6SAfIAQFyAhADUgpidXNpbmVz'
        'c0lkEj8KCnBlcm1pc3Npb24YBCABKAsyHy5pZGVudGl0eS52MS5CdXNpbmVzc1Blcm1pc3Npb2'
        '5SCnBlcm1pc3Npb24=');

@$core.Deprecated('Use checkBusinessPermissionResponseDescriptor instead')
const CheckBusinessPermissionResponse$json = {
  '1': 'CheckBusinessPermissionResponse',
  '2': [
    {'1': 'has_permission', '3': 1, '4': 1, '5': 8, '10': 'hasPermission'},
  ],
};

/// Descriptor for `CheckBusinessPermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkBusinessPermissionResponseDescriptor =
    $convert.base64Decode(
        'Ch9DaGVja0J1c2luZXNzUGVybWlzc2lvblJlc3BvbnNlEiUKDmhhc19wZXJtaXNzaW9uGAEgAS'
        'gIUg1oYXNQZXJtaXNzaW9u');

@$core.Deprecated('Use checkStorePermissionRequestDescriptor instead')
const CheckStorePermissionRequest$json = {
  '1': 'CheckStorePermissionRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'permission',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermission',
      '10': 'permission'
    },
  ],
};

/// Descriptor for `CheckStorePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkStorePermissionRequestDescriptor = $convert.base64Decode(
    'ChtDaGVja1N0b3JlUGVybWlzc2lvblJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyAEBcg'
    'IQA1IGdXNlcklkEiUKCHN0b3JlX2lkGAMgASgJQgq6SAfIAQFyAhADUgdzdG9yZUlkEjwKCnBl'
    'cm1pc3Npb24YBCABKAsyHC5pZGVudGl0eS52MS5TdG9yZVBlcm1pc3Npb25SCnBlcm1pc3Npb2'
    '4=');

@$core.Deprecated('Use checkStorePermissionResponseDescriptor instead')
const CheckStorePermissionResponse$json = {
  '1': 'CheckStorePermissionResponse',
  '2': [
    {'1': 'has_permission', '3': 1, '4': 1, '5': 8, '10': 'hasPermission'},
  ],
};

/// Descriptor for `CheckStorePermissionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkStorePermissionResponseDescriptor =
    $convert.base64Decode(
        'ChxDaGVja1N0b3JlUGVybWlzc2lvblJlc3BvbnNlEiUKDmhhc19wZXJtaXNzaW9uGAEgASgIUg'
        '1oYXNQZXJtaXNzaW9u');

const $core.Map<$core.String, $core.dynamic> PermissionServiceBase$json = {
  '1': 'PermissionService',
  '2': [
    {
      '1': 'CreateBusinessPermission',
      '2': '.identity.v1.CreateBusinessPermissionRequest',
      '3': '.identity.v1.CreateBusinessPermissionResponse',
      '4': {}
    },
    {
      '1': 'UpdateBusinessPermission',
      '2': '.identity.v1.UpdateBusinessPermissionRequest',
      '3': '.identity.v1.UpdateBusinessPermissionResponse',
      '4': {}
    },
    {
      '1': 'DeleteBusinessPermission',
      '2': '.identity.v1.DeleteBusinessPermissionRequest',
      '3': '.identity.v1.DeleteBusinessPermissionResponse',
      '4': {}
    },
    {
      '1': 'CreateStorePermission',
      '2': '.identity.v1.CreateStorePermissionRequest',
      '3': '.identity.v1.CreateStorePermissionResponse',
      '4': {}
    },
    {
      '1': 'UpdateStorePermission',
      '2': '.identity.v1.UpdateStorePermissionRequest',
      '3': '.identity.v1.UpdateStorePermissionResponse',
      '4': {}
    },
    {
      '1': 'DeleteStorePermission',
      '2': '.identity.v1.DeleteStorePermissionRequest',
      '3': '.identity.v1.DeleteStorePermissionResponse',
      '4': {}
    },
    {
      '1': 'CheckBusinessPermission',
      '2': '.identity.v1.CheckBusinessPermissionRequest',
      '3': '.identity.v1.CheckBusinessPermissionResponse',
      '4': {}
    },
    {
      '1': 'CheckStorePermission',
      '2': '.identity.v1.CheckStorePermissionRequest',
      '3': '.identity.v1.CheckStorePermissionResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use permissionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PermissionServiceBase$messageJson = {
  '.identity.v1.CreateBusinessPermissionRequest':
      CreateBusinessPermissionRequest$json,
  '.identity.v1.BusinessPermission': BusinessPermission$json,
  '.identity.v1.CreateBusinessPermissionResponse':
      CreateBusinessPermissionResponse$json,
  '.identity.v1.UpdateBusinessPermissionRequest':
      UpdateBusinessPermissionRequest$json,
  '.identity.v1.UpdateBusinessPermissionResponse':
      UpdateBusinessPermissionResponse$json,
  '.identity.v1.DeleteBusinessPermissionRequest':
      DeleteBusinessPermissionRequest$json,
  '.identity.v1.DeleteBusinessPermissionResponse':
      DeleteBusinessPermissionResponse$json,
  '.identity.v1.CreateStorePermissionRequest':
      CreateStorePermissionRequest$json,
  '.identity.v1.StorePermission': StorePermission$json,
  '.identity.v1.CreateStorePermissionResponse':
      CreateStorePermissionResponse$json,
  '.identity.v1.UpdateStorePermissionRequest':
      UpdateStorePermissionRequest$json,
  '.identity.v1.UpdateStorePermissionResponse':
      UpdateStorePermissionResponse$json,
  '.identity.v1.DeleteStorePermissionRequest':
      DeleteStorePermissionRequest$json,
  '.identity.v1.DeleteStorePermissionResponse':
      DeleteStorePermissionResponse$json,
  '.identity.v1.CheckBusinessPermissionRequest':
      CheckBusinessPermissionRequest$json,
  '.identity.v1.CheckBusinessPermissionResponse':
      CheckBusinessPermissionResponse$json,
  '.identity.v1.CheckStorePermissionRequest': CheckStorePermissionRequest$json,
  '.identity.v1.CheckStorePermissionResponse':
      CheckStorePermissionResponse$json,
};

/// Descriptor for `PermissionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List permissionServiceDescriptor = $convert.base64Decode(
    'ChFQZXJtaXNzaW9uU2VydmljZRJ5ChhDcmVhdGVCdXNpbmVzc1Blcm1pc3Npb24SLC5pZGVudG'
    'l0eS52MS5DcmVhdGVCdXNpbmVzc1Blcm1pc3Npb25SZXF1ZXN0Gi0uaWRlbnRpdHkudjEuQ3Jl'
    'YXRlQnVzaW5lc3NQZXJtaXNzaW9uUmVzcG9uc2UiABJ5ChhVcGRhdGVCdXNpbmVzc1Blcm1pc3'
    'Npb24SLC5pZGVudGl0eS52MS5VcGRhdGVCdXNpbmVzc1Blcm1pc3Npb25SZXF1ZXN0Gi0uaWRl'
    'bnRpdHkudjEuVXBkYXRlQnVzaW5lc3NQZXJtaXNzaW9uUmVzcG9uc2UiABJ5ChhEZWxldGVCdX'
    'NpbmVzc1Blcm1pc3Npb24SLC5pZGVudGl0eS52MS5EZWxldGVCdXNpbmVzc1Blcm1pc3Npb25S'
    'ZXF1ZXN0Gi0uaWRlbnRpdHkudjEuRGVsZXRlQnVzaW5lc3NQZXJtaXNzaW9uUmVzcG9uc2UiAB'
    'JwChVDcmVhdGVTdG9yZVBlcm1pc3Npb24SKS5pZGVudGl0eS52MS5DcmVhdGVTdG9yZVBlcm1p'
    'c3Npb25SZXF1ZXN0GiouaWRlbnRpdHkudjEuQ3JlYXRlU3RvcmVQZXJtaXNzaW9uUmVzcG9uc2'
    'UiABJwChVVcGRhdGVTdG9yZVBlcm1pc3Npb24SKS5pZGVudGl0eS52MS5VcGRhdGVTdG9yZVBl'
    'cm1pc3Npb25SZXF1ZXN0GiouaWRlbnRpdHkudjEuVXBkYXRlU3RvcmVQZXJtaXNzaW9uUmVzcG'
    '9uc2UiABJwChVEZWxldGVTdG9yZVBlcm1pc3Npb24SKS5pZGVudGl0eS52MS5EZWxldGVTdG9y'
    'ZVBlcm1pc3Npb25SZXF1ZXN0GiouaWRlbnRpdHkudjEuRGVsZXRlU3RvcmVQZXJtaXNzaW9uUm'
    'VzcG9uc2UiABJ2ChdDaGVja0J1c2luZXNzUGVybWlzc2lvbhIrLmlkZW50aXR5LnYxLkNoZWNr'
    'QnVzaW5lc3NQZXJtaXNzaW9uUmVxdWVzdBosLmlkZW50aXR5LnYxLkNoZWNrQnVzaW5lc3NQZX'
    'JtaXNzaW9uUmVzcG9uc2UiABJtChRDaGVja1N0b3JlUGVybWlzc2lvbhIoLmlkZW50aXR5LnYx'
    'LkNoZWNrU3RvcmVQZXJtaXNzaW9uUmVxdWVzdBopLmlkZW50aXR5LnYxLkNoZWNrU3RvcmVQZX'
    'JtaXNzaW9uUmVzcG9uc2UiAA==');
