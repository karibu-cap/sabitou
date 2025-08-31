// This is a generated file - do not edit.
//
// Generated from business/v1/supplier.proto.

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
    {'1': 'business_id', '3': 6, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_logo_link_id'},
  ],
};

/// Descriptor for `Supplier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierDescriptor = $convert.base64Decode(
    'CghTdXBwbGllchIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESEgoEbmFtZRgCIAEoCVIEbm'
    'FtZRIlCgtkZXNjcmlwdGlvbhgDIAEoCUgBUgtkZXNjcmlwdGlvbogBARIlCgxsb2dvX2xpbmtf'
    'aWQYBCABKAlIAlIKbG9nb0xpbmtJZIgBARIsChJleHRlcm5hbF9saW5rc19pZHMYBSADKAlSEG'
    'V4dGVybmFsTGlua3NJZHMSKwoLYnVzaW5lc3NfaWQYBiABKAlCCrpIB8gBAXICEANSCmJ1c2lu'
    'ZXNzSWRCCQoHX3JlZl9pZEIOCgxfZGVzY3JpcHRpb25CDwoNX2xvZ29fbGlua19pZA==');

@$core.Deprecated('Use createSupplierRequestDescriptor instead')
const CreateSupplierRequest$json = {
  '1': 'CreateSupplierRequest',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.business.v1.Supplier',
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
    'ChVDcmVhdGVTdXBwbGllclJlcXVlc3QSMQoIc3VwcGxpZXIYASABKAsyFS5idXNpbmVzcy52MS'
    '5TdXBwbGllclIIc3VwcGxpZXISKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0lt'
    'YWdliAEBEjwKDmV4dGVybmFsX2xpbmtzGAMgAygLMhUubGluay52MS5SZXNvdXJjZUxpbmtSDW'
    'V4dGVybmFsTGlua3NCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use createSupplierResponseDescriptor instead')
const CreateSupplierResponse$json = {
  '1': 'CreateSupplierResponse',
  '2': [
    {'1': 'suplier_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'suplierId'},
  ],
};

/// Descriptor for `CreateSupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSupplierResponseDescriptor =
    $convert.base64Decode(
        'ChZDcmVhdGVTdXBwbGllclJlc3BvbnNlEikKCnN1cGxpZXJfaWQYASABKAlCCrpIB8gBAXICEA'
        'NSCXN1cGxpZXJJZA==');

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
      '6': '.business.v1.Supplier',
      '10': 'supplier'
    },
  ],
};

/// Descriptor for `GetSupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSupplierResponseDescriptor = $convert.base64Decode(
    'ChNHZXRTdXBwbGllclJlc3BvbnNlEjEKCHN1cHBsaWVyGAEgASgLMhUuYnVzaW5lc3MudjEuU3'
    'VwcGxpZXJSCHN1cHBsaWVy');

@$core.Deprecated('Use getBusinessSuppliersRequestDescriptor instead')
const GetBusinessSuppliersRequest$json = {
  '1': 'GetBusinessSuppliersRequest',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'supplierId'},
  ],
};

/// Descriptor for `GetBusinessSuppliersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessSuppliersRequestDescriptor =
    $convert.base64Decode(
        'ChtHZXRCdXNpbmVzc1N1cHBsaWVyc1JlcXVlc3QSKwoLc3VwcGxpZXJfaWQYASABKAlCCrpIB8'
        'gBAXICEANSCnN1cHBsaWVySWQ=');

@$core.Deprecated('Use getBusinessSuppliersResponseDescriptor instead')
const GetBusinessSuppliersResponse$json = {
  '1': 'GetBusinessSuppliersResponse',
  '2': [
    {
      '1': 'suppliers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.business.v1.Supplier',
      '10': 'suppliers'
    },
  ],
};

/// Descriptor for `GetBusinessSuppliersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBusinessSuppliersResponseDescriptor =
    $convert.base64Decode(
        'ChxHZXRCdXNpbmVzc1N1cHBsaWVyc1Jlc3BvbnNlEjMKCXN1cHBsaWVycxgBIAMoCzIVLmJ1c2'
        'luZXNzLnYxLlN1cHBsaWVyUglzdXBwbGllcnM=');

@$core.Deprecated('Use updateSupplierRequestDescriptor instead')
const UpdateSupplierRequest$json = {
  '1': 'UpdateSupplierRequest',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.business.v1.Supplier',
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
    'ChVVcGRhdGVTdXBwbGllclJlcXVlc3QSMQoIc3VwcGxpZXIYASABKAsyFS5idXNpbmVzcy52MS'
    '5TdXBwbGllclIIc3VwcGxpZXISKQoObG9nb19yYXdfaW1hZ2UYAiABKAxIAFIMbG9nb1Jhd0lt'
    'YWdliAEBEjwKDmV4dGVybmFsX2xpbmtzGAMgAygLMhUubGluay52MS5SZXNvdXJjZUxpbmtSDW'
    'V4dGVybmFsTGlua3NCEQoPX2xvZ29fcmF3X2ltYWdl');

@$core.Deprecated('Use updateSupplierResponseDescriptor instead')
const UpdateSupplierResponse$json = {
  '1': 'UpdateSupplierResponse',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.business.v1.Supplier',
      '10': 'supplier'
    },
  ],
};

/// Descriptor for `UpdateSupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSupplierResponseDescriptor =
    $convert.base64Decode(
        'ChZVcGRhdGVTdXBwbGllclJlc3BvbnNlEjEKCHN1cHBsaWVyGAEgASgLMhUuYnVzaW5lc3Mudj'
        'EuU3VwcGxpZXJSCHN1cHBsaWVy');

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
      '2': '.business.v1.CreateSupplierRequest',
      '3': '.business.v1.CreateSupplierResponse'
    },
    {
      '1': 'GetSupplier',
      '2': '.business.v1.GetSupplierRequest',
      '3': '.business.v1.GetSupplierResponse'
    },
    {
      '1': 'GetBusinessSuppliers',
      '2': '.business.v1.GetBusinessSuppliersRequest',
      '3': '.business.v1.GetBusinessSuppliersResponse'
    },
    {
      '1': 'UpdateSupplier',
      '2': '.business.v1.UpdateSupplierRequest',
      '3': '.business.v1.UpdateSupplierResponse'
    },
    {
      '1': 'DeleteSupplier',
      '2': '.business.v1.DeleteSupplierRequest',
      '3': '.business.v1.DeleteSupplierResponse'
    },
  ],
};

@$core.Deprecated('Use supplierServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    SupplierServiceBase$messageJson = {
  '.business.v1.CreateSupplierRequest': CreateSupplierRequest$json,
  '.business.v1.Supplier': Supplier$json,
  '.link.v1.ResourceLink': $0.ResourceLink$json,
  '.business.v1.CreateSupplierResponse': CreateSupplierResponse$json,
  '.business.v1.GetSupplierRequest': GetSupplierRequest$json,
  '.business.v1.GetSupplierResponse': GetSupplierResponse$json,
  '.business.v1.GetBusinessSuppliersRequest': GetBusinessSuppliersRequest$json,
  '.business.v1.GetBusinessSuppliersResponse':
      GetBusinessSuppliersResponse$json,
  '.business.v1.UpdateSupplierRequest': UpdateSupplierRequest$json,
  '.business.v1.UpdateSupplierResponse': UpdateSupplierResponse$json,
  '.business.v1.DeleteSupplierRequest': DeleteSupplierRequest$json,
  '.business.v1.DeleteSupplierResponse': DeleteSupplierResponse$json,
};

/// Descriptor for `SupplierService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List supplierServiceDescriptor = $convert.base64Decode(
    'Cg9TdXBwbGllclNlcnZpY2USWQoOQ3JlYXRlU3VwcGxpZXISIi5idXNpbmVzcy52MS5DcmVhdG'
    'VTdXBwbGllclJlcXVlc3QaIy5idXNpbmVzcy52MS5DcmVhdGVTdXBwbGllclJlc3BvbnNlElAK'
    'C0dldFN1cHBsaWVyEh8uYnVzaW5lc3MudjEuR2V0U3VwcGxpZXJSZXF1ZXN0GiAuYnVzaW5lc3'
    'MudjEuR2V0U3VwcGxpZXJSZXNwb25zZRJrChRHZXRCdXNpbmVzc1N1cHBsaWVycxIoLmJ1c2lu'
    'ZXNzLnYxLkdldEJ1c2luZXNzU3VwcGxpZXJzUmVxdWVzdBopLmJ1c2luZXNzLnYxLkdldEJ1c2'
    'luZXNzU3VwcGxpZXJzUmVzcG9uc2USWQoOVXBkYXRlU3VwcGxpZXISIi5idXNpbmVzcy52MS5V'
    'cGRhdGVTdXBwbGllclJlcXVlc3QaIy5idXNpbmVzcy52MS5VcGRhdGVTdXBwbGllclJlc3Bvbn'
    'NlElkKDkRlbGV0ZVN1cHBsaWVyEiIuYnVzaW5lc3MudjEuRGVsZXRlU3VwcGxpZXJSZXF1ZXN0'
    'GiMuYnVzaW5lc3MudjEuRGVsZXRlU3VwcGxpZXJSZXNwb25zZQ==');
