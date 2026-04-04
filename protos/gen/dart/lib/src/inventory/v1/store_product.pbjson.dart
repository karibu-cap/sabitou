// This is a generated file - do not edit.
//
// Generated from inventory/v1/store_product.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use globalProductStatusDescriptor instead')
const GlobalProductStatus$json = {
  '1': 'GlobalProductStatus',
  '2': [
    {'1': 'GLOBAL_PRODUCT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'GLOBAL_PRODUCT_STATUS_ACTIVE', '2': 1},
    {'1': 'GLOBAL_PRODUCT_STATUS_INACTIVE', '2': 2},
    {'1': 'GLOBAL_PRODUCT_STATUS_DELETE', '2': 3},
  ],
};

/// Descriptor for `GlobalProductStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List globalProductStatusDescriptor = $convert.base64Decode(
    'ChNHbG9iYWxQcm9kdWN0U3RhdHVzEiUKIUdMT0JBTF9QUk9EVUNUX1NUQVRVU19VTlNQRUNJRk'
    'lFRBAAEiAKHEdMT0JBTF9QUk9EVUNUX1NUQVRVU19BQ1RJVkUQARIiCh5HTE9CQUxfUFJPRFVD'
    'VF9TVEFUVVNfSU5BQ1RJVkUQAhIgChxHTE9CQUxfUFJPRFVDVF9TVEFUVVNfREVMRVRFEAM=');

@$core.Deprecated('Use productStatusDescriptor instead')
const ProductStatus$json = {
  '1': 'ProductStatus',
  '2': [
    {'1': 'PRODUCT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PRODUCT_STATUS_ACTIVE', '2': 1},
    {'1': 'PRODUCT_STATUS_INACTIVE', '2': 2},
    {'1': 'PRODUCT_STATUS_DELETE', '2': 3},
  ],
};

/// Descriptor for `ProductStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List productStatusDescriptor = $convert.base64Decode(
    'Cg1Qcm9kdWN0U3RhdHVzEh4KGlBST0RVQ1RfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGQoVUFJPRF'
    'VDVF9TVEFUVVNfQUNUSVZFEAESGwoXUFJPRFVDVF9TVEFUVVNfSU5BQ1RJVkUQAhIZChVQUk9E'
    'VUNUX1NUQVRVU19ERUxFVEUQAw==');

@$core.Deprecated('Use expirationTypeDescriptor instead')
const ExpirationType$json = {
  '1': 'ExpirationType',
  '2': [
    {'1': 'EXPIRATION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'EXPIRATION_TYPE_NONE', '2': 1},
    {'1': 'EXPIRATION_TYPE_PRODUCT_LEVEL', '2': 2},
    {'1': 'EXPIRATION_TYPE_LOT_LEVEL', '2': 3},
  ],
};

/// Descriptor for `ExpirationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List expirationTypeDescriptor = $convert.base64Decode(
    'Cg5FeHBpcmF0aW9uVHlwZRIfChtFWFBJUkFUSU9OX1RZUEVfVU5TUEVDSUZJRUQQABIYChRFWF'
    'BJUkFUSU9OX1RZUEVfTk9ORRABEiEKHUVYUElSQVRJT05fVFlQRV9QUk9EVUNUX0xFVkVMEAIS'
    'HQoZRVhQSVJBVElPTl9UWVBFX0xPVF9MRVZFTBAD');

@$core.Deprecated('Use globalProductDescriptor instead')
const GlobalProduct$json = {
  '1': 'GlobalProduct',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {
      '1': 'name',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Internationalized',
      '10': 'name'
    },
    {
      '1': 'description',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Internationalized',
      '9': 1,
      '10': 'description',
      '17': true
    },
    {
      '1': 'bar_code_value',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'barCodeValue',
      '17': true
    },
    {
      '1': 'categories',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.Category',
      '10': 'categories'
    },
    {'1': 'images_links_ids', '3': 6, '4': 3, '5': 9, '10': 'imagesLinksIds'},
    {
      '1': 'status',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.GlobalProductStatus',
      '10': 'status'
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_description'},
    {'1': '_bar_code_value'},
  ],
};

/// Descriptor for `GlobalProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List globalProductDescriptor = $convert.base64Decode(
    'Cg1HbG9iYWxQcm9kdWN0EhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBARIzCgRuYW1lGAIgAS'
    'gLMh8uaW52ZW50b3J5LnYxLkludGVybmF0aW9uYWxpemVkUgRuYW1lEkYKC2Rlc2NyaXB0aW9u'
    'GAMgASgLMh8uaW52ZW50b3J5LnYxLkludGVybmF0aW9uYWxpemVkSAFSC2Rlc2NyaXB0aW9uiA'
    'EBEikKDmJhcl9jb2RlX3ZhbHVlGAQgASgJSAJSDGJhckNvZGVWYWx1ZYgBARI2CgpjYXRlZ29y'
    'aWVzGAUgAygLMhYuaW52ZW50b3J5LnYxLkNhdGVnb3J5UgpjYXRlZ29yaWVzEigKEGltYWdlc1'
    '9saW5rc19pZHMYBiADKAlSDmltYWdlc0xpbmtzSWRzEjkKBnN0YXR1cxgHIAEoDjIhLmludmVu'
    'dG9yeS52MS5HbG9iYWxQcm9kdWN0U3RhdHVzUgZzdGF0dXNCCQoHX3JlZl9pZEIOCgxfZGVzY3'
    'JpcHRpb25CEQoPX2Jhcl9jb2RlX3ZhbHVl');

@$core.Deprecated('Use storeProductDescriptor instead')
const StoreProduct$json = {
  '1': 'StoreProduct',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'global_product_id', '3': 3, '4': 1, '5': 9, '10': 'globalProductId'},
    {
      '1': 'sale_price',
      '3': 4,
      '4': 1,
      '5': 5,
      '9': 1,
      '10': 'salePrice',
      '17': true
    },
    {'1': 'images_links_ids', '3': 5, '4': 3, '5': 9, '10': 'imagesLinksIds'},
    {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.ProductStatus',
      '10': 'status'
    },
    {'1': 'sku', '3': 7, '4': 1, '5': 9, '9': 2, '10': 'sku', '17': true},
    {
      '1': 'expiration_type',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.ExpirationType',
      '10': 'expirationType'
    },
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
      '9': 3,
      '10': 'updatedAt',
      '17': true
    },
    {
      '1': 'reorder_point',
      '3': 11,
      '4': 1,
      '5': 5,
      '9': 4,
      '10': 'reorderPoint',
      '17': true
    },
    {
      '1': 'opening_stock',
      '3': 12,
      '4': 1,
      '5': 5,
      '9': 5,
      '10': 'openingStock',
      '17': true
    },
    {
      '1': 'opening_stock_per_unit',
      '3': 13,
      '4': 1,
      '5': 1,
      '9': 6,
      '10': 'openingStockPerUnit',
      '17': true
    },
    {
      '1': 'default_purchase_price',
      '3': 14,
      '4': 1,
      '5': 1,
      '9': 7,
      '10': 'defaultPurchasePrice',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_sale_price'},
    {'1': '_sku'},
    {'1': '_updated_at'},
    {'1': '_reorder_point'},
    {'1': '_opening_stock'},
    {'1': '_opening_stock_per_unit'},
    {'1': '_default_purchase_price'},
  ],
};

/// Descriptor for `StoreProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeProductDescriptor = $convert.base64Decode(
    'CgxTdG9yZVByb2R1Y3QSGgoGcmVmX2lkGAEgASgJSABSBXJlZklkiAEBEhkKCHN0b3JlX2lkGA'
    'IgASgJUgdzdG9yZUlkEioKEWdsb2JhbF9wcm9kdWN0X2lkGAMgASgJUg9nbG9iYWxQcm9kdWN0'
    'SWQSIgoKc2FsZV9wcmljZRgEIAEoBUgBUglzYWxlUHJpY2WIAQESKAoQaW1hZ2VzX2xpbmtzX2'
    'lkcxgFIAMoCVIOaW1hZ2VzTGlua3NJZHMSMwoGc3RhdHVzGAYgASgOMhsuaW52ZW50b3J5LnYx'
    'LlByb2R1Y3RTdGF0dXNSBnN0YXR1cxIVCgNza3UYByABKAlIAlIDc2t1iAEBEkUKD2V4cGlyYX'
    'Rpb25fdHlwZRgIIAEoDjIcLmludmVudG9yeS52MS5FeHBpcmF0aW9uVHlwZVIOZXhwaXJhdGlv'
    'blR5cGUSOQoKY3JlYXRlZF9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCW'
    'NyZWF0ZWRBdBI+Cgp1cGRhdGVkX2F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFt'
    'cEgDUgl1cGRhdGVkQXSIAQESKAoNcmVvcmRlcl9wb2ludBgLIAEoBUgEUgxyZW9yZGVyUG9pbn'
    'SIAQESKAoNb3BlbmluZ19zdG9jaxgMIAEoBUgFUgxvcGVuaW5nU3RvY2uIAQESOAoWb3Blbmlu'
    'Z19zdG9ja19wZXJfdW5pdBgNIAEoAUgGUhNvcGVuaW5nU3RvY2tQZXJVbml0iAEBEjkKFmRlZm'
    'F1bHRfcHVyY2hhc2VfcHJpY2UYDiABKAFIB1IUZGVmYXVsdFB1cmNoYXNlUHJpY2WIAQFCCQoH'
    'X3JlZl9pZEINCgtfc2FsZV9wcmljZUIGCgRfc2t1Qg0KC191cGRhdGVkX2F0QhAKDl9yZW9yZG'
    'VyX3BvaW50QhAKDl9vcGVuaW5nX3N0b2NrQhkKF19vcGVuaW5nX3N0b2NrX3Blcl91bml0QhkK'
    'F19kZWZhdWx0X3B1cmNoYXNlX3ByaWNl');

@$core.Deprecated('Use customProductDescriptor instead')
const CustomProduct$json = {
  '1': 'CustomProduct',
  '2': [
    {
      '1': 'store_product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'storeProduct'
    },
    {
      '1': 'global_product',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'globalProduct'
    },
  ],
};

/// Descriptor for `CustomProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List customProductDescriptor = $convert.base64Decode(
    'Cg1DdXN0b21Qcm9kdWN0Ej8KDXN0b3JlX3Byb2R1Y3QYASABKAsyGi5pbnZlbnRvcnkudjEuU3'
    'RvcmVQcm9kdWN0UgxzdG9yZVByb2R1Y3QSQgoOZ2xvYmFsX3Byb2R1Y3QYAiABKAsyGy5pbnZl'
    'bnRvcnkudjEuR2xvYmFsUHJvZHVjdFINZ2xvYmFsUHJvZHVjdA==');

@$core.Deprecated('Use deleteGlobalProductRequestDescriptor instead')
const DeleteGlobalProductRequest$json = {
  '1': 'DeleteGlobalProductRequest',
  '2': [
    {'1': 'global_product_id', '3': 1, '4': 1, '5': 9, '10': 'globalProductId'},
  ],
};

/// Descriptor for `DeleteGlobalProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGlobalProductRequestDescriptor =
    $convert.base64Decode(
        'ChpEZWxldGVHbG9iYWxQcm9kdWN0UmVxdWVzdBIqChFnbG9iYWxfcHJvZHVjdF9pZBgBIAEoCV'
        'IPZ2xvYmFsUHJvZHVjdElk');

@$core.Deprecated('Use deleteGlobalProductResponseDescriptor instead')
const DeleteGlobalProductResponse$json = {
  '1': 'DeleteGlobalProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteGlobalProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteGlobalProductResponseDescriptor =
    $convert.base64Decode(
        'ChtEZWxldGVHbG9iYWxQcm9kdWN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

@$core.Deprecated('Use deleteStoreProductRequestDescriptor instead')
const DeleteStoreProductRequest$json = {
  '1': 'DeleteStoreProductRequest',
  '2': [
    {
      '1': 'store_product_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'storeProductId'
    },
  ],
};

/// Descriptor for `DeleteStoreProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteStoreProductRequestDescriptor =
    $convert.base64Decode(
        'ChlEZWxldGVTdG9yZVByb2R1Y3RSZXF1ZXN0EjQKEHN0b3JlX3Byb2R1Y3RfaWQYASABKAlCCr'
        'pIB8gBAXICEANSDnN0b3JlUHJvZHVjdElk');

@$core.Deprecated('Use deleteStoreProductResponseDescriptor instead')
const DeleteStoreProductResponse$json = {
  '1': 'DeleteStoreProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteStoreProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteStoreProductResponseDescriptor =
    $convert.base64Decode(
        'ChpEZWxldGVTdG9yZVByb2R1Y3RSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

const $core.Map<$core.String, $core.dynamic> StoreProductServiceBase$json = {
  '1': 'StoreProductService',
  '2': [
    {
      '1': 'DeleteGlobalProduct',
      '2': '.inventory.v1.DeleteGlobalProductRequest',
      '3': '.inventory.v1.DeleteGlobalProductResponse'
    },
    {
      '1': 'DeleteStoreProduct',
      '2': '.inventory.v1.DeleteStoreProductRequest',
      '3': '.inventory.v1.DeleteStoreProductResponse'
    },
  ],
};

@$core.Deprecated('Use storeProductServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    StoreProductServiceBase$messageJson = {
  '.inventory.v1.DeleteGlobalProductRequest': DeleteGlobalProductRequest$json,
  '.inventory.v1.DeleteGlobalProductResponse': DeleteGlobalProductResponse$json,
  '.inventory.v1.DeleteStoreProductRequest': DeleteStoreProductRequest$json,
  '.inventory.v1.DeleteStoreProductResponse': DeleteStoreProductResponse$json,
};

/// Descriptor for `StoreProductService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List storeProductServiceDescriptor = $convert.base64Decode(
    'ChNTdG9yZVByb2R1Y3RTZXJ2aWNlEmoKE0RlbGV0ZUdsb2JhbFByb2R1Y3QSKC5pbnZlbnRvcn'
    'kudjEuRGVsZXRlR2xvYmFsUHJvZHVjdFJlcXVlc3QaKS5pbnZlbnRvcnkudjEuRGVsZXRlR2xv'
    'YmFsUHJvZHVjdFJlc3BvbnNlEmcKEkRlbGV0ZVN0b3JlUHJvZHVjdBInLmludmVudG9yeS52MS'
    '5EZWxldGVTdG9yZVByb2R1Y3RSZXF1ZXN0GiguaW52ZW50b3J5LnYxLkRlbGV0ZVN0b3JlUHJv'
    'ZHVjdFJlc3BvbnNl');
