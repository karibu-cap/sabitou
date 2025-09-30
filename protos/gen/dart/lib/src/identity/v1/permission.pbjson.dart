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

@$core.Deprecated('Use storeProductPermissionDescriptor instead')
const StoreProductPermission$json = {
  '1': 'StoreProductPermission',
  '2': [
    {
      '1': 'read_product_in_inventory',
      '3': 1,
      '4': 1,
      '5': 8,
      '10': 'readProductInInventory'
    },
    {
      '1': 'create_product_in_inventory',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'createProductInInventory'
    },
    {
      '1': 'update_product_in_inventory',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'updateProductInInventory'
    },
    {
      '1': 'delete_product_in_inventory',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'deleteProductInInventory'
    },
  ],
};

/// Descriptor for `StoreProductPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeProductPermissionDescriptor = $convert.base64Decode(
    'ChZTdG9yZVByb2R1Y3RQZXJtaXNzaW9uEjkKGXJlYWRfcHJvZHVjdF9pbl9pbnZlbnRvcnkYAS'
    'ABKAhSFnJlYWRQcm9kdWN0SW5JbnZlbnRvcnkSPQobY3JlYXRlX3Byb2R1Y3RfaW5faW52ZW50'
    'b3J5GAIgASgIUhhjcmVhdGVQcm9kdWN0SW5JbnZlbnRvcnkSPQobdXBkYXRlX3Byb2R1Y3RfaW'
    '5faW52ZW50b3J5GAMgASgIUhh1cGRhdGVQcm9kdWN0SW5JbnZlbnRvcnkSPQobZGVsZXRlX3By'
    'b2R1Y3RfaW5faW52ZW50b3J5GAQgASgIUhhkZWxldGVQcm9kdWN0SW5JbnZlbnRvcnk=');

@$core.Deprecated('Use storeMemberPermissionDescriptor instead')
const StoreMemberPermission$json = {
  '1': 'StoreMemberPermission',
  '2': [
    {'1': 'read_information', '3': 1, '4': 1, '5': 8, '10': 'readInformation'},
    {'1': 'invite_member', '3': 2, '4': 1, '5': 8, '10': 'inviteMember'},
    {'1': 'update_member', '3': 3, '4': 1, '5': 8, '10': 'updateMember'},
    {'1': 'delete_member', '3': 4, '4': 1, '5': 8, '10': 'deleteMember'},
  ],
};

/// Descriptor for `StoreMemberPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeMemberPermissionDescriptor = $convert.base64Decode(
    'ChVTdG9yZU1lbWJlclBlcm1pc3Npb24SKQoQcmVhZF9pbmZvcm1hdGlvbhgBIAEoCFIPcmVhZE'
    'luZm9ybWF0aW9uEiMKDWludml0ZV9tZW1iZXIYAiABKAhSDGludml0ZU1lbWJlchIjCg11cGRh'
    'dGVfbWVtYmVyGAMgASgIUgx1cGRhdGVNZW1iZXISIwoNZGVsZXRlX21lbWJlchgEIAEoCFIMZG'
    'VsZXRlTWVtYmVy');

@$core.Deprecated('Use storeReportPermissionDescriptor instead')
const StoreReportPermission$json = {
  '1': 'StoreReportPermission',
  '2': [
    {'1': 'read_report', '3': 1, '4': 1, '5': 8, '10': 'readReport'},
  ],
};

/// Descriptor for `StoreReportPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeReportPermissionDescriptor = $convert.base64Decode(
    'ChVTdG9yZVJlcG9ydFBlcm1pc3Npb24SHwoLcmVhZF9yZXBvcnQYASABKAhSCnJlYWRSZXBvcn'
    'Q=');

@$core.Deprecated('Use storeOrderPermissionDescriptor instead')
const StoreOrderPermission$json = {
  '1': 'StoreOrderPermission',
  '2': [
    {'1': 'read_order', '3': 1, '4': 1, '5': 8, '10': 'readOrder'},
    {'1': 'create_order', '3': 2, '4': 1, '5': 8, '10': 'createOrder'},
  ],
};

/// Descriptor for `StoreOrderPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeOrderPermissionDescriptor = $convert.base64Decode(
    'ChRTdG9yZU9yZGVyUGVybWlzc2lvbhIdCgpyZWFkX29yZGVyGAEgASgIUglyZWFkT3JkZXISIQ'
    'oMY3JlYXRlX29yZGVyGAIgASgIUgtjcmVhdGVPcmRlcg==');

@$core.Deprecated('Use storeInvoicePermissionDescriptor instead')
const StoreInvoicePermission$json = {
  '1': 'StoreInvoicePermission',
  '2': [
    {'1': 'read_invoice', '3': 1, '4': 1, '5': 8, '10': 'readInvoice'},
    {'1': 'create_invoice', '3': 2, '4': 1, '5': 8, '10': 'createInvoice'},
  ],
};

/// Descriptor for `StoreInvoicePermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeInvoicePermissionDescriptor =
    $convert.base64Decode(
        'ChZTdG9yZUludm9pY2VQZXJtaXNzaW9uEiEKDHJlYWRfaW52b2ljZRgBIAEoCFILcmVhZEludm'
        '9pY2USJQoOY3JlYXRlX2ludm9pY2UYAiABKAhSDWNyZWF0ZUludm9pY2U=');

@$core.Deprecated('Use storeSupplierPermissionDescriptor instead')
const StoreSupplierPermission$json = {
  '1': 'StoreSupplierPermission',
  '2': [
    {'1': 'read_supplier', '3': 1, '4': 1, '5': 8, '10': 'readSupplier'},
    {'1': 'create_supplier', '3': 2, '4': 1, '5': 8, '10': 'createSupplier'},
    {'1': 'update_supplier', '3': 3, '4': 1, '5': 8, '10': 'updateSupplier'},
    {'1': 'delete_supplier', '3': 4, '4': 1, '5': 8, '10': 'deleteSupplier'},
  ],
};

/// Descriptor for `StoreSupplierPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeSupplierPermissionDescriptor = $convert.base64Decode(
    'ChdTdG9yZVN1cHBsaWVyUGVybWlzc2lvbhIjCg1yZWFkX3N1cHBsaWVyGAEgASgIUgxyZWFkU3'
    'VwcGxpZXISJwoPY3JlYXRlX3N1cHBsaWVyGAIgASgIUg5jcmVhdGVTdXBwbGllchInCg91cGRh'
    'dGVfc3VwcGxpZXIYAyABKAhSDnVwZGF0ZVN1cHBsaWVyEicKD2RlbGV0ZV9zdXBwbGllchgEIA'
    'EoCFIOZGVsZXRlU3VwcGxpZXI=');

@$core.Deprecated('Use storeTransactionPermissionDescriptor instead')
const StoreTransactionPermission$json = {
  '1': 'StoreTransactionPermission',
  '2': [
    {'1': 'read_transaction', '3': 1, '4': 1, '5': 8, '10': 'readTransaction'},
    {
      '1': 'create_transaction',
      '3': 2,
      '4': 1,
      '5': 8,
      '10': 'createTransaction'
    },
    {
      '1': 'update_transaction',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'updateTransaction'
    },
  ],
};

/// Descriptor for `StoreTransactionPermission`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeTransactionPermissionDescriptor = $convert.base64Decode(
    'ChpTdG9yZVRyYW5zYWN0aW9uUGVybWlzc2lvbhIpChByZWFkX3RyYW5zYWN0aW9uGAEgASgIUg'
    '9yZWFkVHJhbnNhY3Rpb24SLQoSY3JlYXRlX3RyYW5zYWN0aW9uGAIgASgIUhFjcmVhdGVUcmFu'
    'c2FjdGlvbhItChJ1cGRhdGVfdHJhbnNhY3Rpb24YAyABKAhSEXVwZGF0ZVRyYW5zYWN0aW9u');

@$core.Deprecated('Use storePermissionsDescriptor instead')
const StorePermissions$json = {
  '1': 'StorePermissions',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StoreProductPermission',
      '10': 'product'
    },
    {
      '1': 'member',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StoreMemberPermission',
      '10': 'member'
    },
    {
      '1': 'report',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StoreReportPermission',
      '10': 'report'
    },
    {
      '1': 'order',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StoreOrderPermission',
      '10': 'order'
    },
    {
      '1': 'invoice',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StoreInvoicePermission',
      '10': 'invoice'
    },
    {
      '1': 'supplier',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StoreSupplierPermission',
      '10': 'supplier'
    },
    {
      '1': 'transaction',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StoreTransactionPermission',
      '10': 'transaction'
    },
  ],
};

/// Descriptor for `StorePermissions`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storePermissionsDescriptor = $convert.base64Decode(
    'ChBTdG9yZVBlcm1pc3Npb25zEj0KB3Byb2R1Y3QYASABKAsyIy5pZGVudGl0eS52MS5TdG9yZV'
    'Byb2R1Y3RQZXJtaXNzaW9uUgdwcm9kdWN0EjoKBm1lbWJlchgCIAEoCzIiLmlkZW50aXR5LnYx'
    'LlN0b3JlTWVtYmVyUGVybWlzc2lvblIGbWVtYmVyEjoKBnJlcG9ydBgDIAEoCzIiLmlkZW50aX'
    'R5LnYxLlN0b3JlUmVwb3J0UGVybWlzc2lvblIGcmVwb3J0EjcKBW9yZGVyGAQgASgLMiEuaWRl'
    'bnRpdHkudjEuU3RvcmVPcmRlclBlcm1pc3Npb25SBW9yZGVyEj0KB2ludm9pY2UYBSABKAsyIy'
    '5pZGVudGl0eS52MS5TdG9yZUludm9pY2VQZXJtaXNzaW9uUgdpbnZvaWNlEkAKCHN1cHBsaWVy'
    'GAYgASgLMiQuaWRlbnRpdHkudjEuU3RvcmVTdXBwbGllclBlcm1pc3Npb25SCHN1cHBsaWVyEk'
    'kKC3RyYW5zYWN0aW9uGAcgASgLMicuaWRlbnRpdHkudjEuU3RvcmVUcmFuc2FjdGlvblBlcm1p'
    'c3Npb25SC3RyYW5zYWN0aW9u');

@$core.Deprecated('Use createStorePermissionRequestDescriptor instead')
const CreateStorePermissionRequest$json = {
  '1': 'CreateStorePermissionRequest',
  '2': [
    {
      '1': 'permissions',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermissions',
      '10': 'permissions'
    },
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `CreateStorePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStorePermissionRequestDescriptor =
    $convert.base64Decode(
        'ChxDcmVhdGVTdG9yZVBlcm1pc3Npb25SZXF1ZXN0Ej8KC3Blcm1pc3Npb25zGAEgASgLMh0uaW'
        'RlbnRpdHkudjEuU3RvcmVQZXJtaXNzaW9uc1ILcGVybWlzc2lvbnMSJQoIc3RvcmVfaWQYAiAB'
        'KAlCCrpIB8gBAXICEANSB3N0b3JlSWQ=');

@$core.Deprecated('Use updateStorePermissionRequestDescriptor instead')
const UpdateStorePermissionRequest$json = {
  '1': 'UpdateStorePermissionRequest',
  '2': [
    {
      '1': 'permissions',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.identity.v1.StorePermissions',
      '10': 'permissions'
    },
    {
      '1': 'store_permission_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'storePermissionId'
    },
  ],
};

/// Descriptor for `UpdateStorePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStorePermissionRequestDescriptor =
    $convert.base64Decode(
        'ChxVcGRhdGVTdG9yZVBlcm1pc3Npb25SZXF1ZXN0Ej8KC3Blcm1pc3Npb25zGAEgASgLMh0uaW'
        'RlbnRpdHkudjEuU3RvcmVQZXJtaXNzaW9uc1ILcGVybWlzc2lvbnMSOgoTc3RvcmVfcGVybWlz'
        'c2lvbl9pZBgCIAEoCUIKukgHyAEBcgIQA1IRc3RvcmVQZXJtaXNzaW9uSWQ=');

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

@$core.Deprecated('Use checkStorePermissionRequestDescriptor instead')
const CheckStorePermissionRequest$json = {
  '1': 'CheckStorePermissionRequest',
  '2': [
    {'1': 'user_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'userId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {'1': 'permission_field', '3': 3, '4': 1, '5': 9, '10': 'permissionField'},
  ],
};

/// Descriptor for `CheckStorePermissionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkStorePermissionRequestDescriptor =
    $convert.base64Decode(
        'ChtDaGVja1N0b3JlUGVybWlzc2lvblJlcXVlc3QSIwoHdXNlcl9pZBgBIAEoCUIKukgHyAEBcg'
        'IQA1IGdXNlcklkEiUKCHN0b3JlX2lkGAIgASgJQgq6SAfIAQFyAhADUgdzdG9yZUlkEikKEHBl'
        'cm1pc3Npb25fZmllbGQYAyABKAlSD3Blcm1pc3Npb25GaWVsZA==');

@$core.Deprecated('Use successResponseDescriptor instead')
const SuccessResponse$json = {
  '1': 'SuccessResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `SuccessResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List successResponseDescriptor = $convert.base64Decode(
    'Cg9TdWNjZXNzUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

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
      '1': 'CreateStorePermission',
      '2': '.identity.v1.CreateStorePermissionRequest',
      '3': '.identity.v1.SuccessResponse',
      '4': {}
    },
    {
      '1': 'UpdateStorePermission',
      '2': '.identity.v1.UpdateStorePermissionRequest',
      '3': '.identity.v1.SuccessResponse',
      '4': {}
    },
    {
      '1': 'DeleteStorePermission',
      '2': '.identity.v1.DeleteStorePermissionRequest',
      '3': '.identity.v1.SuccessResponse',
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
  '.identity.v1.CreateStorePermissionRequest':
      CreateStorePermissionRequest$json,
  '.identity.v1.StorePermissions': StorePermissions$json,
  '.identity.v1.StoreProductPermission': StoreProductPermission$json,
  '.identity.v1.StoreMemberPermission': StoreMemberPermission$json,
  '.identity.v1.StoreReportPermission': StoreReportPermission$json,
  '.identity.v1.StoreOrderPermission': StoreOrderPermission$json,
  '.identity.v1.StoreInvoicePermission': StoreInvoicePermission$json,
  '.identity.v1.StoreSupplierPermission': StoreSupplierPermission$json,
  '.identity.v1.StoreTransactionPermission': StoreTransactionPermission$json,
  '.identity.v1.SuccessResponse': SuccessResponse$json,
  '.identity.v1.UpdateStorePermissionRequest':
      UpdateStorePermissionRequest$json,
  '.identity.v1.DeleteStorePermissionRequest':
      DeleteStorePermissionRequest$json,
  '.identity.v1.CheckStorePermissionRequest': CheckStorePermissionRequest$json,
  '.identity.v1.CheckStorePermissionResponse':
      CheckStorePermissionResponse$json,
};

/// Descriptor for `PermissionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List permissionServiceDescriptor = $convert.base64Decode(
    'ChFQZXJtaXNzaW9uU2VydmljZRJiChVDcmVhdGVTdG9yZVBlcm1pc3Npb24SKS5pZGVudGl0eS'
    '52MS5DcmVhdGVTdG9yZVBlcm1pc3Npb25SZXF1ZXN0GhwuaWRlbnRpdHkudjEuU3VjY2Vzc1Jl'
    'c3BvbnNlIgASYgoVVXBkYXRlU3RvcmVQZXJtaXNzaW9uEikuaWRlbnRpdHkudjEuVXBkYXRlU3'
    'RvcmVQZXJtaXNzaW9uUmVxdWVzdBocLmlkZW50aXR5LnYxLlN1Y2Nlc3NSZXNwb25zZSIAEmIK'
    'FURlbGV0ZVN0b3JlUGVybWlzc2lvbhIpLmlkZW50aXR5LnYxLkRlbGV0ZVN0b3JlUGVybWlzc2'
    'lvblJlcXVlc3QaHC5pZGVudGl0eS52MS5TdWNjZXNzUmVzcG9uc2UiABJtChRDaGVja1N0b3Jl'
    'UGVybWlzc2lvbhIoLmlkZW50aXR5LnYxLkNoZWNrU3RvcmVQZXJtaXNzaW9uUmVxdWVzdBopLm'
    'lkZW50aXR5LnYxLkNoZWNrU3RvcmVQZXJtaXNzaW9uUmVzcG9uc2UiAA==');
