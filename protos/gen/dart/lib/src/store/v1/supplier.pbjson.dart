// This is a generated file - do not edit.
//
// Generated from store/v1/supplier.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../link/v1/link.pbjson.dart' as $0;

@$core.Deprecated('Use supplierStatusDescriptor instead')
const SupplierStatus$json = {
  '1': 'SupplierStatus',
  '2': [
    {'1': 'SUPPLIER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'SUPPLIER_STATUS_ACTIVE', '2': 1},
    {'1': 'SUPPLIER_STATUS_INACTIVE', '2': 2},
  ],
};

/// Descriptor for `SupplierStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List supplierStatusDescriptor = $convert.base64Decode(
    'Cg5TdXBwbGllclN0YXR1cxIfChtTVVBQTElFUl9TVEFUVVNfVU5TUEVDSUZJRUQQABIaChZTVV'
    'BQTElFUl9TVEFUVVNfQUNUSVZFEAESHAoYU1VQUExJRVJfU1RBVFVTX0lOQUNUSVZFEAI=');

@$core.Deprecated('Use linkDescriptor instead')
const Link$json = {
  '1': 'Link',
  '2': [
    {'1': 'label', '3': 1, '4': 1, '5': 9, '10': 'label'},
    {'1': 'url', '3': 2, '4': 1, '5': 9, '10': 'url'},
  ],
};

/// Descriptor for `Link`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List linkDescriptor = $convert.base64Decode(
    'CgRMaW5rEhQKBWxhYmVsGAEgASgJUgVsYWJlbBIQCgN1cmwYAiABKAlSA3VybA==');

@$core.Deprecated('Use supplierDescriptor instead')
const Supplier$json = {
  '1': 'Supplier',
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
      '1': 'logo_link_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'logoLinkId',
      '17': true
    },
    {
      '1': 'external_links_ids',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'externalLinksIds'
    },
    {
      '1': 'contact_phone',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'contactPhone',
      '17': true
    },
    {
      '1': 'contact_email',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'contactEmail',
      '17': true
    },
    {
      '1': 'contact_address',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'contactAddress',
      '17': true
    },
    {
      '1': 'status',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.store.v1.SupplierStatus',
      '10': 'status'
    },
    {'1': 'store_ids', '3': 10, '4': 3, '5': 9, '10': 'storeIds'},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
    {'1': '_contact_phone'},
    {'1': '_contact_email'},
    {'1': '_contact_address'},
  ],
};

/// Descriptor for `Supplier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierDescriptor = $convert.base64Decode(
    'CghTdXBwbGllchIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgBUgtkZXNjcmlwdGlvbogBARIlCgxsb2dvX2xpbmtf'
    'aWQYBCABKAlIAlIKbG9nb0xpbmtJZIgBARIsChJleHRlcm5hbF9saW5rc19pZHMYBSADKAlSEG'
    'V4dGVybmFsTGlua3NJZHMSKAoNY29udGFjdF9waG9uZRgGIAEoCUgDUgxjb250YWN0UGhvbmWI'
    'AQESKAoNY29udGFjdF9lbWFpbBgHIAEoCUgEUgxjb250YWN0RW1haWyIAQESLAoPY29udGFjdF'
    '9hZGRyZXNzGAggASgJSAVSDmNvbnRhY3RBZGRyZXNziAEBEjAKBnN0YXR1cxgJIAEoDjIYLnN0'
    'b3JlLnYxLlN1cHBsaWVyU3RhdHVzUgZzdGF0dXMSGwoJc3RvcmVfaWRzGAogAygJUghzdG9yZU'
    'lkc0IJCgdfcmVmX2lkQg4KDF9kZXNjcmlwdGlvbkIPCg1fbG9nb19saW5rX2lkQhAKDl9jb250'
    'YWN0X3Bob25lQhAKDl9jb250YWN0X2VtYWlsQhIKEF9jb250YWN0X2FkZHJlc3M=');

@$core.Deprecated('Use createSupplierRequestDescriptor instead')
const CreateSupplierRequest$json = {
  '1': 'CreateSupplierRequest',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Supplier',
      '10': 'supplier'
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

/// Descriptor for `CreateSupplierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSupplierRequestDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVTdXBwbGllclJlcXVlc3QSLgoIc3VwcGxpZXIYASABKAsyEi5zdG9yZS52MS5TdX'
    'BwbGllclIIc3VwcGxpZXISKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0ltYWdl'
    'iAEBEjwKDmV4dGVybmFsX2xpbmtzGAMgAygLMhUubGluay52MS5SZXNvdXJjZUxpbmtSDWV4dG'
    'VybmFsTGlua3NCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use createSupplierResponseDescriptor instead')
const CreateSupplierResponse$json = {
  '1': 'CreateSupplierResponse',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'supplierId'},
  ],
};

/// Descriptor for `CreateSupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSupplierResponseDescriptor =
    $convert.base64Decode(
        'ChZDcmVhdGVTdXBwbGllclJlc3BvbnNlEisKC3N1cHBsaWVyX2lkGAEgASgJQgq6SAfIAQFyAh'
        'ADUgpzdXBwbGllcklk');

@$core.Deprecated('Use getSupplierRequestDescriptor instead')
const GetSupplierRequest$json = {
  '1': 'GetSupplierRequest',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'supplierId'},
  ],
};

/// Descriptor for `GetSupplierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSupplierRequestDescriptor = $convert.base64Decode(
    'ChJHZXRTdXBwbGllclJlcXVlc3QSKwoLc3VwcGxpZXJfaWQYASABKAlCCrpIB8gBAXICEANSCn'
    'N1cHBsaWVySWQ=');

@$core.Deprecated('Use getSupplierResponseDescriptor instead')
const GetSupplierResponse$json = {
  '1': 'GetSupplierResponse',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Supplier',
      '10': 'supplier'
    },
  ],
};

/// Descriptor for `GetSupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSupplierResponseDescriptor = $convert.base64Decode(
    'ChNHZXRTdXBwbGllclJlc3BvbnNlEi4KCHN1cHBsaWVyGAEgASgLMhIuc3RvcmUudjEuU3VwcG'
    'xpZXJSCHN1cHBsaWVy');

@$core.Deprecated('Use getStoreSuppliersRequestDescriptor instead')
const GetStoreSuppliersRequest$json = {
  '1': 'GetStoreSuppliersRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `GetStoreSuppliersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreSuppliersRequestDescriptor =
    $convert.base64Decode(
        'ChhHZXRTdG9yZVN1cHBsaWVyc1JlcXVlc3QSJQoIc3RvcmVfaWQYASABKAlCCrpIB8gBAXICEA'
        'NSB3N0b3JlSWQ=');

@$core.Deprecated('Use getStoreSuppliersResponseDescriptor instead')
const GetStoreSuppliersResponse$json = {
  '1': 'GetStoreSuppliersResponse',
  '2': [
    {
      '1': 'suppliers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.store.v1.Supplier',
      '10': 'suppliers'
    },
  ],
};

/// Descriptor for `GetStoreSuppliersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreSuppliersResponseDescriptor =
    $convert.base64Decode(
        'ChlHZXRTdG9yZVN1cHBsaWVyc1Jlc3BvbnNlEjAKCXN1cHBsaWVycxgBIAMoCzISLnN0b3JlLn'
        'YxLlN1cHBsaWVyUglzdXBwbGllcnM=');

@$core.Deprecated('Use streamStoreSuppliersRequestDescriptor instead')
const StreamStoreSuppliersRequest$json = {
  '1': 'StreamStoreSuppliersRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
  ],
};

/// Descriptor for `StreamStoreSuppliersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamStoreSuppliersRequestDescriptor =
    $convert.base64Decode(
        'ChtTdHJlYW1TdG9yZVN1cHBsaWVyc1JlcXVlc3QSJQoIc3RvcmVfaWQYASABKAlCCrpIB8gBAX'
        'ICEANSB3N0b3JlSWQ=');

@$core.Deprecated('Use streamStoreSuppliersResponseDescriptor instead')
const StreamStoreSuppliersResponse$json = {
  '1': 'StreamStoreSuppliersResponse',
  '2': [
    {
      '1': 'suppliers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.store.v1.Supplier',
      '10': 'suppliers'
    },
  ],
};

/// Descriptor for `StreamStoreSuppliersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamStoreSuppliersResponseDescriptor =
    $convert.base64Decode(
        'ChxTdHJlYW1TdG9yZVN1cHBsaWVyc1Jlc3BvbnNlEjAKCXN1cHBsaWVycxgBIAMoCzISLnN0b3'
        'JlLnYxLlN1cHBsaWVyUglzdXBwbGllcnM=');

@$core.Deprecated('Use updateSupplierRequestDescriptor instead')
const UpdateSupplierRequest$json = {
  '1': 'UpdateSupplierRequest',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Supplier',
      '10': 'supplier'
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

/// Descriptor for `UpdateSupplierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSupplierRequestDescriptor = $convert.base64Decode(
    'ChVVcGRhdGVTdXBwbGllclJlcXVlc3QSLgoIc3VwcGxpZXIYASABKAsyEi5zdG9yZS52MS5TdX'
    'BwbGllclIIc3VwcGxpZXISKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0ltYWdl'
    'iAEBEjwKDmV4dGVybmFsX2xpbmtzGAMgAygLMhUubGluay52MS5SZXNvdXJjZUxpbmtSDWV4dG'
    'VybmFsTGlua3NCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use updateSupplierResponseDescriptor instead')
const UpdateSupplierResponse$json = {
  '1': 'UpdateSupplierResponse',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Supplier',
      '10': 'supplier'
    },
  ],
};

/// Descriptor for `UpdateSupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSupplierResponseDescriptor =
    $convert.base64Decode(
        'ChZVcGRhdGVTdXBwbGllclJlc3BvbnNlEi4KCHN1cHBsaWVyGAEgASgLMhIuc3RvcmUudjEuU3'
        'VwcGxpZXJSCHN1cHBsaWVy');

@$core.Deprecated('Use deleteSupplierRequestDescriptor instead')
const DeleteSupplierRequest$json = {
  '1': 'DeleteSupplierRequest',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'supplierId'},
  ],
};

/// Descriptor for `DeleteSupplierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSupplierRequestDescriptor = $convert.base64Decode(
    'ChVEZWxldGVTdXBwbGllclJlcXVlc3QSKwoLc3VwcGxpZXJfaWQYASABKAlCCrpIB8gBAXICEA'
    'NSCnN1cHBsaWVySWQ=');

@$core.Deprecated('Use deleteSupplierResponseDescriptor instead')
const DeleteSupplierResponse$json = {
  '1': 'DeleteSupplierResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteSupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteSupplierResponseDescriptor =
    $convert.base64Decode(
        'ChZEZWxldGVTdXBwbGllclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

const $core.Map<$core.String, $core.dynamic> SupplierServiceBase$json = {
  '1': 'SupplierService',
  '2': [
    {
      '1': 'CreateSupplier',
      '2': '.store.v1.CreateSupplierRequest',
      '3': '.store.v1.CreateSupplierResponse'
    },
    {
      '1': 'GetSupplier',
      '2': '.store.v1.GetSupplierRequest',
      '3': '.store.v1.GetSupplierResponse'
    },
    {
      '1': 'GetStoreSuppliers',
      '2': '.store.v1.GetStoreSuppliersRequest',
      '3': '.store.v1.GetStoreSuppliersResponse'
    },
    {
      '1': 'StreamStoreSuppliers',
      '2': '.store.v1.StreamStoreSuppliersRequest',
      '3': '.store.v1.StreamStoreSuppliersResponse',
      '6': true
    },
    {
      '1': 'UpdateSupplier',
      '2': '.store.v1.UpdateSupplierRequest',
      '3': '.store.v1.UpdateSupplierResponse'
    },
    {
      '1': 'DeleteSupplier',
      '2': '.store.v1.DeleteSupplierRequest',
      '3': '.store.v1.DeleteSupplierResponse'
    },
  ],
};

@$core.Deprecated('Use supplierServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    SupplierServiceBase$messageJson = {
  '.store.v1.CreateSupplierRequest': CreateSupplierRequest$json,
  '.store.v1.Supplier': Supplier$json,
  '.link.v1.ResourceLink': $0.ResourceLink$json,
  '.store.v1.CreateSupplierResponse': CreateSupplierResponse$json,
  '.store.v1.GetSupplierRequest': GetSupplierRequest$json,
  '.store.v1.GetSupplierResponse': GetSupplierResponse$json,
  '.store.v1.GetStoreSuppliersRequest': GetStoreSuppliersRequest$json,
  '.store.v1.GetStoreSuppliersResponse': GetStoreSuppliersResponse$json,
  '.store.v1.StreamStoreSuppliersRequest': StreamStoreSuppliersRequest$json,
  '.store.v1.StreamStoreSuppliersResponse': StreamStoreSuppliersResponse$json,
  '.store.v1.UpdateSupplierRequest': UpdateSupplierRequest$json,
  '.store.v1.UpdateSupplierResponse': UpdateSupplierResponse$json,
  '.store.v1.DeleteSupplierRequest': DeleteSupplierRequest$json,
  '.store.v1.DeleteSupplierResponse': DeleteSupplierResponse$json,
};

/// Descriptor for `SupplierService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List supplierServiceDescriptor = $convert.base64Decode(
    'Cg9TdXBwbGllclNlcnZpY2USUwoOQ3JlYXRlU3VwcGxpZXISHy5zdG9yZS52MS5DcmVhdGVTdX'
    'BwbGllclJlcXVlc3QaIC5zdG9yZS52MS5DcmVhdGVTdXBwbGllclJlc3BvbnNlEkoKC0dldFN1'
    'cHBsaWVyEhwuc3RvcmUudjEuR2V0U3VwcGxpZXJSZXF1ZXN0Gh0uc3RvcmUudjEuR2V0U3VwcG'
    'xpZXJSZXNwb25zZRJcChFHZXRTdG9yZVN1cHBsaWVycxIiLnN0b3JlLnYxLkdldFN0b3JlU3Vw'
    'cGxpZXJzUmVxdWVzdBojLnN0b3JlLnYxLkdldFN0b3JlU3VwcGxpZXJzUmVzcG9uc2USZwoUU3'
    'RyZWFtU3RvcmVTdXBwbGllcnMSJS5zdG9yZS52MS5TdHJlYW1TdG9yZVN1cHBsaWVyc1JlcXVl'
    'c3QaJi5zdG9yZS52MS5TdHJlYW1TdG9yZVN1cHBsaWVyc1Jlc3BvbnNlMAESUwoOVXBkYXRlU3'
    'VwcGxpZXISHy5zdG9yZS52MS5VcGRhdGVTdXBwbGllclJlcXVlc3QaIC5zdG9yZS52MS5VcGRh'
    'dGVTdXBwbGllclJlc3BvbnNlElMKDkRlbGV0ZVN1cHBsaWVyEh8uc3RvcmUudjEuRGVsZXRlU3'
    'VwcGxpZXJSZXF1ZXN0GiAuc3RvcmUudjEuRGVsZXRlU3VwcGxpZXJSZXNwb25zZQ==');
