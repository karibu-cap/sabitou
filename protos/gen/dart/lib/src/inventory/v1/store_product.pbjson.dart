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

import '../../google/protobuf/timestamp.pbjson.dart' as $1;
import 'category.pbjson.dart' as $0;

@$core.Deprecated('Use globalProductStatusDescriptor instead')
const GlobalProductStatus$json = {
  '1': 'GlobalProductStatus',
  '2': [
    {'1': 'GLOBAL_PRODUCT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'GLOBAL_PRODUCT_STATUS_ACTIVE', '2': 1},
    {'1': 'GLOBAL_PRODUCT_STATUS_INACTIVE', '2': 2},
  ],
};

/// Descriptor for `GlobalProductStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List globalProductStatusDescriptor = $convert.base64Decode(
    'ChNHbG9iYWxQcm9kdWN0U3RhdHVzEiUKIUdMT0JBTF9QUk9EVUNUX1NUQVRVU19VTlNQRUNJRk'
    'lFRBAAEiAKHEdMT0JBTF9QUk9EVUNUX1NUQVRVU19BQ1RJVkUQARIiCh5HTE9CQUxfUFJPRFVD'
    'VF9TVEFUVVNfSU5BQ1RJVkUQAg==');

@$core.Deprecated('Use productStatusDescriptor instead')
const ProductStatus$json = {
  '1': 'ProductStatus',
  '2': [
    {'1': 'PRODUCT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PRODUCT_STATUS_ACTIVE', '2': 1},
    {'1': 'PRODUCT_STATUS_INACTIVE', '2': 2},
  ],
};

/// Descriptor for `ProductStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List productStatusDescriptor = $convert.base64Decode(
    'Cg1Qcm9kdWN0U3RhdHVzEh4KGlBST0RVQ1RfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGQoVUFJPRF'
    'VDVF9TVEFUVVNfQUNUSVZFEAESGwoXUFJPRFVDVF9TVEFUVVNfSU5BQ1RJVkUQAg==');

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
      '1': 'supplier_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'supplierId',
      '17': true
    },
    {
      '1': 'status',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.ProductStatus',
      '10': 'status'
    },
    {'1': 'sku', '3': 8, '4': 1, '5': 9, '9': 3, '10': 'sku', '17': true},
    {
      '1': 'expiration_type',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.ExpirationType',
      '10': 'expirationType'
    },
    {
      '1': 'created_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 11,
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
    {'1': '_sale_price'},
    {'1': '_supplier_id'},
    {'1': '_sku'},
    {'1': '_updated_at'},
  ],
};

/// Descriptor for `StoreProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeProductDescriptor = $convert.base64Decode(
    'CgxTdG9yZVByb2R1Y3QSGgoGcmVmX2lkGAEgASgJSABSBXJlZklkiAEBEhkKCHN0b3JlX2lkGA'
    'IgASgJUgdzdG9yZUlkEioKEWdsb2JhbF9wcm9kdWN0X2lkGAMgASgJUg9nbG9iYWxQcm9kdWN0'
    'SWQSIgoKc2FsZV9wcmljZRgEIAEoBUgBUglzYWxlUHJpY2WIAQESKAoQaW1hZ2VzX2xpbmtzX2'
    'lkcxgFIAMoCVIOaW1hZ2VzTGlua3NJZHMSJAoLc3VwcGxpZXJfaWQYBiABKAlIAlIKc3VwcGxp'
    'ZXJJZIgBARIzCgZzdGF0dXMYByABKA4yGy5pbnZlbnRvcnkudjEuUHJvZHVjdFN0YXR1c1IGc3'
    'RhdHVzEhUKA3NrdRgIIAEoCUgDUgNza3WIAQESRQoPZXhwaXJhdGlvbl90eXBlGAkgASgOMhwu'
    'aW52ZW50b3J5LnYxLkV4cGlyYXRpb25UeXBlUg5leHBpcmF0aW9uVHlwZRI5CgpjcmVhdGVkX2'
    'F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0Ej4KCnVwZGF0'
    'ZWRfYXQYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSARSCXVwZGF0ZWRBdIgBAU'
    'IJCgdfcmVmX2lkQg0KC19zYWxlX3ByaWNlQg4KDF9zdXBwbGllcl9pZEIGCgRfc2t1Qg0KC191'
    'cGRhdGVkX2F0');

@$core.Deprecated('Use createGlobalProductRequestDescriptor instead')
const CreateGlobalProductRequest$json = {
  '1': 'CreateGlobalProductRequest',
  '2': [
    {
      '1': 'global_product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'globalProduct'
    },
  ],
};

/// Descriptor for `CreateGlobalProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGlobalProductRequestDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVHbG9iYWxQcm9kdWN0UmVxdWVzdBJCCg5nbG9iYWxfcHJvZHVjdBgBIAEoCzIbLm'
        'ludmVudG9yeS52MS5HbG9iYWxQcm9kdWN0Ug1nbG9iYWxQcm9kdWN0');

@$core.Deprecated('Use createGlobalProductResponseDescriptor instead')
const CreateGlobalProductResponse$json = {
  '1': 'CreateGlobalProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateGlobalProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGlobalProductResponseDescriptor =
    $convert.base64Decode(
        'ChtDcmVhdGVHbG9iYWxQcm9kdWN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

@$core.Deprecated('Use updateGlobalProductRequestDescriptor instead')
const UpdateGlobalProductRequest$json = {
  '1': 'UpdateGlobalProductRequest',
  '2': [
    {'1': 'global_product_id', '3': 1, '4': 1, '5': 9, '10': 'globalProductId'},
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

/// Descriptor for `UpdateGlobalProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGlobalProductRequestDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVHbG9iYWxQcm9kdWN0UmVxdWVzdBIqChFnbG9iYWxfcHJvZHVjdF9pZBgBIAEoCV'
        'IPZ2xvYmFsUHJvZHVjdElkEkIKDmdsb2JhbF9wcm9kdWN0GAIgASgLMhsuaW52ZW50b3J5LnYx'
        'Lkdsb2JhbFByb2R1Y3RSDWdsb2JhbFByb2R1Y3Q=');

@$core.Deprecated('Use updateGlobalProductResponseDescriptor instead')
const UpdateGlobalProductResponse$json = {
  '1': 'UpdateGlobalProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateGlobalProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateGlobalProductResponseDescriptor =
    $convert.base64Decode(
        'ChtVcGRhdGVHbG9iYWxQcm9kdWN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

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

@$core.Deprecated('Use findProductsRequestDescriptor instead')
const FindProductsRequest$json = {
  '1': 'FindProductsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'ref_id', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {
      '1': 'global_product_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'globalProductId',
      '17': true
    },
    {
      '1': 'page_size',
      '3': 4,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'pageSize',
      '17': true
    },
    {
      '1': 'page_token',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'pageToken',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_global_product_id'},
    {'1': '_page_size'},
    {'1': '_page_token'},
  ],
};

/// Descriptor for `FindProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findProductsRequestDescriptor = $convert.base64Decode(
    'ChNGaW5kUHJvZHVjdHNSZXF1ZXN0EhkKCHN0b3JlX2lkGAEgASgJUgdzdG9yZUlkEhoKBnJlZl'
    '9pZBgCIAEoCUgAUgVyZWZJZIgBARIvChFnbG9iYWxfcHJvZHVjdF9pZBgDIAEoCUgBUg9nbG9i'
    'YWxQcm9kdWN0SWSIAQESIAoJcGFnZV9zaXplGAQgASgFSAJSCHBhZ2VTaXpliAEBEiIKCnBhZ2'
    'VfdG9rZW4YBSABKAlIA1IJcGFnZVRva2VuiAEBQgkKB19yZWZfaWRCFAoSX2dsb2JhbF9wcm9k'
    'dWN0X2lkQgwKCl9wYWdlX3NpemVCDQoLX3BhZ2VfdG9rZW4=');

@$core.Deprecated('Use findProductsResponseDescriptor instead')
const FindProductsResponse$json = {
  '1': 'FindProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.StoreProductWithGlobalProduct',
      '10': 'products'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {
      '1': 'next_page_token',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'nextPageToken',
      '17': true
    },
  ],
  '8': [
    {'1': '_next_page_token'},
  ],
};

/// Descriptor for `FindProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findProductsResponseDescriptor = $convert.base64Decode(
    'ChRGaW5kUHJvZHVjdHNSZXNwb25zZRJHCghwcm9kdWN0cxgBIAMoCzIrLmludmVudG9yeS52MS'
    '5TdG9yZVByb2R1Y3RXaXRoR2xvYmFsUHJvZHVjdFIIcHJvZHVjdHMSHwoLdG90YWxfY291bnQY'
    'AiABKAVSCnRvdGFsQ291bnQSKwoPbmV4dF9wYWdlX3Rva2VuGAMgASgJSABSDW5leHRQYWdlVG'
    '9rZW6IAQFCEgoQX25leHRfcGFnZV90b2tlbg==');

@$core.Deprecated('Use storeProductWithGlobalProductDescriptor instead')
const StoreProductWithGlobalProduct$json = {
  '1': 'StoreProductWithGlobalProduct',
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

/// Descriptor for `StoreProductWithGlobalProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeProductWithGlobalProductDescriptor = $convert.base64Decode(
    'Ch1TdG9yZVByb2R1Y3RXaXRoR2xvYmFsUHJvZHVjdBI/Cg1zdG9yZV9wcm9kdWN0GAEgASgLMh'
    'ouaW52ZW50b3J5LnYxLlN0b3JlUHJvZHVjdFIMc3RvcmVQcm9kdWN0EkIKDmdsb2JhbF9wcm9k'
    'dWN0GAIgASgLMhsuaW52ZW50b3J5LnYxLkdsb2JhbFByb2R1Y3RSDWdsb2JhbFByb2R1Y3Q=');

@$core.Deprecated('Use findGlobalProductsRequestDescriptor instead')
const FindGlobalProductsRequest$json = {
  '1': 'FindGlobalProductsRequest',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {
      '1': 'categories',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.Category',
      '10': 'categories'
    },
    {'1': 'name', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'name', '17': true},
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
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.GlobalProductStatus',
      '9': 3,
      '10': 'status',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_name'},
    {'1': '_bar_code_value'},
    {'1': '_status'},
  ],
};

/// Descriptor for `FindGlobalProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findGlobalProductsRequestDescriptor = $convert.base64Decode(
    'ChlGaW5kR2xvYmFsUHJvZHVjdHNSZXF1ZXN0EhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBAR'
    'I2CgpjYXRlZ29yaWVzGAIgAygLMhYuaW52ZW50b3J5LnYxLkNhdGVnb3J5UgpjYXRlZ29yaWVz'
    'EhcKBG5hbWUYAyABKAlIAVIEbmFtZYgBARIpCg5iYXJfY29kZV92YWx1ZRgEIAEoCUgCUgxiYX'
    'JDb2RlVmFsdWWIAQESPgoGc3RhdHVzGAUgASgOMiEuaW52ZW50b3J5LnYxLkdsb2JhbFByb2R1'
    'Y3RTdGF0dXNIA1IGc3RhdHVziAEBQgkKB19yZWZfaWRCBwoFX25hbWVCEQoPX2Jhcl9jb2RlX3'
    'ZhbHVlQgkKB19zdGF0dXM=');

@$core.Deprecated('Use findGlobalProductsResponseDescriptor instead')
const FindGlobalProductsResponse$json = {
  '1': 'FindGlobalProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'products'
    },
  ],
};

/// Descriptor for `FindGlobalProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findGlobalProductsResponseDescriptor =
    $convert.base64Decode(
        'ChpGaW5kR2xvYmFsUHJvZHVjdHNSZXNwb25zZRI3Cghwcm9kdWN0cxgBIAMoCzIbLmludmVudG'
        '9yeS52MS5HbG9iYWxQcm9kdWN0Ughwcm9kdWN0cw==');

@$core.Deprecated('Use addStoreProductRequestDescriptor instead')
const AddStoreProductRequest$json = {
  '1': 'AddStoreProductRequest',
  '2': [
    {
      '1': 'global_product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'globalProduct'
    },
    {
      '1': 'store_product',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'storeProduct'
    },
  ],
};

/// Descriptor for `AddStoreProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addStoreProductRequestDescriptor = $convert.base64Decode(
    'ChZBZGRTdG9yZVByb2R1Y3RSZXF1ZXN0EkIKDmdsb2JhbF9wcm9kdWN0GAEgASgLMhsuaW52ZW'
    '50b3J5LnYxLkdsb2JhbFByb2R1Y3RSDWdsb2JhbFByb2R1Y3QSPwoNc3RvcmVfcHJvZHVjdBgC'
    'IAEoCzIaLmludmVudG9yeS52MS5TdG9yZVByb2R1Y3RSDHN0b3JlUHJvZHVjdA==');

@$core.Deprecated('Use addStoreProductResponseDescriptor instead')
const AddStoreProductResponse$json = {
  '1': 'AddStoreProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AddStoreProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addStoreProductResponseDescriptor =
    $convert.base64Decode(
        'ChdBZGRTdG9yZVByb2R1Y3RSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use getStoreProductRequestDescriptor instead')
const GetStoreProductRequest$json = {
  '1': 'GetStoreProductRequest',
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

/// Descriptor for `GetStoreProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreProductRequestDescriptor =
    $convert.base64Decode(
        'ChZHZXRTdG9yZVByb2R1Y3RSZXF1ZXN0EjQKEHN0b3JlX3Byb2R1Y3RfaWQYASABKAlCCrpIB8'
        'gBAXICEANSDnN0b3JlUHJvZHVjdElk');

@$core.Deprecated('Use getStoreProductResponseDescriptor instead')
const GetStoreProductResponse$json = {
  '1': 'GetStoreProductResponse',
  '2': [
    {
      '1': 'store_product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'storeProduct'
    },
  ],
};

/// Descriptor for `GetStoreProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStoreProductResponseDescriptor =
    $convert.base64Decode(
        'ChdHZXRTdG9yZVByb2R1Y3RSZXNwb25zZRI/Cg1zdG9yZV9wcm9kdWN0GAEgASgLMhouaW52ZW'
        '50b3J5LnYxLlN0b3JlUHJvZHVjdFIMc3RvcmVQcm9kdWN0');

@$core.Deprecated('Use updateStoreProductRequestDescriptor instead')
const UpdateStoreProductRequest$json = {
  '1': 'UpdateStoreProductRequest',
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
      '9': 0,
      '10': 'globalProduct',
      '17': true
    },
    {
      '1': 'images_raw_images',
      '3': 3,
      '4': 3,
      '5': 12,
      '10': 'imagesRawImages'
    },
  ],
  '8': [
    {'1': '_global_product'},
  ],
};

/// Descriptor for `UpdateStoreProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStoreProductRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVTdG9yZVByb2R1Y3RSZXF1ZXN0Ej8KDXN0b3JlX3Byb2R1Y3QYASABKAsyGi5pbn'
    'ZlbnRvcnkudjEuU3RvcmVQcm9kdWN0UgxzdG9yZVByb2R1Y3QSRwoOZ2xvYmFsX3Byb2R1Y3QY'
    'AiABKAsyGy5pbnZlbnRvcnkudjEuR2xvYmFsUHJvZHVjdEgAUg1nbG9iYWxQcm9kdWN0iAEBEi'
    'oKEWltYWdlc19yYXdfaW1hZ2VzGAMgAygMUg9pbWFnZXNSYXdJbWFnZXNCEQoPX2dsb2JhbF9w'
    'cm9kdWN0');

@$core.Deprecated('Use updateStoreProductResponseDescriptor instead')
const UpdateStoreProductResponse$json = {
  '1': 'UpdateStoreProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateStoreProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStoreProductResponseDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVTdG9yZVByb2R1Y3RSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

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

@$core.Deprecated('Use streamStoreProductsRequestDescriptor instead')
const StreamStoreProductsRequest$json = {
  '1': 'StreamStoreProductsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'supplier_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'supplierId',
      '17': true
    },
    {
      '1': 'global_product_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'globalProductId',
      '17': true
    },
  ],
  '8': [
    {'1': '_supplier_id'},
    {'1': '_global_product_id'},
  ],
};

/// Descriptor for `StreamStoreProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamStoreProductsRequestDescriptor = $convert.base64Decode(
    'ChpTdHJlYW1TdG9yZVByb2R1Y3RzUmVxdWVzdBIlCghzdG9yZV9pZBgBIAEoCUIKukgHyAEBcg'
    'IQA1IHc3RvcmVJZBIkCgtzdXBwbGllcl9pZBgCIAEoCUgAUgpzdXBwbGllcklkiAEBEi8KEWds'
    'b2JhbF9wcm9kdWN0X2lkGAMgASgJSAFSD2dsb2JhbFByb2R1Y3RJZIgBAUIOCgxfc3VwcGxpZX'
    'JfaWRCFAoSX2dsb2JhbF9wcm9kdWN0X2lk');

@$core.Deprecated('Use streamStoreProductsResponseDescriptor instead')
const StreamStoreProductsResponse$json = {
  '1': 'StreamStoreProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'products'
    },
  ],
};

/// Descriptor for `StreamStoreProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamStoreProductsResponseDescriptor =
    $convert.base64Decode(
        'ChtTdHJlYW1TdG9yZVByb2R1Y3RzUmVzcG9uc2USNgoIcHJvZHVjdHMYASADKAsyGi5pbnZlbn'
        'RvcnkudjEuU3RvcmVQcm9kdWN0Ughwcm9kdWN0cw==');

@$core.Deprecated('Use streamGlobalProductsRequestDescriptor instead')
const StreamGlobalProductsRequest$json = {
  '1': 'StreamGlobalProductsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
  ],
};

/// Descriptor for `StreamGlobalProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGlobalProductsRequestDescriptor =
    $convert.base64Decode(
        'ChtTdHJlYW1HbG9iYWxQcm9kdWN0c1JlcXVlc3QSGQoIc3RvcmVfaWQYASABKAlSB3N0b3JlSW'
        'Q=');

@$core.Deprecated('Use streamGlobalProductsResponseDescriptor instead')
const StreamGlobalProductsResponse$json = {
  '1': 'StreamGlobalProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'products'
    },
  ],
};

/// Descriptor for `StreamGlobalProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamGlobalProductsResponseDescriptor =
    $convert.base64Decode(
        'ChxTdHJlYW1HbG9iYWxQcm9kdWN0c1Jlc3BvbnNlEjcKCHByb2R1Y3RzGAEgAygLMhsuaW52ZW'
        '50b3J5LnYxLkdsb2JhbFByb2R1Y3RSCHByb2R1Y3Rz');

@$core.Deprecated('Use listStoreProductsRequestDescriptor instead')
const ListStoreProductsRequest$json = {
  '1': 'ListStoreProductsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'search_query',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'searchQuery',
      '17': true
    },
    {'1': 'category_ids', '3': 3, '4': 3, '5': 9, '10': 'categoryIds'},
    {
      '1': 'status',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.ProductStatus',
      '9': 1,
      '10': 'status',
      '17': true
    },
    {'1': 'page_size', '3': 5, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_token', '3': 6, '4': 1, '5': 9, '10': 'pageToken'},
  ],
  '8': [
    {'1': '_search_query'},
    {'1': '_status'},
  ],
};

/// Descriptor for `ListStoreProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStoreProductsRequestDescriptor = $convert.base64Decode(
    'ChhMaXN0U3RvcmVQcm9kdWN0c1JlcXVlc3QSIQoIc3RvcmVfaWQYASABKAlCBrpIA8gBAVIHc3'
    'RvcmVJZBImCgxzZWFyY2hfcXVlcnkYAiABKAlIAFILc2VhcmNoUXVlcnmIAQESIQoMY2F0ZWdv'
    'cnlfaWRzGAMgAygJUgtjYXRlZ29yeUlkcxI4CgZzdGF0dXMYBCABKA4yGy5pbnZlbnRvcnkudj'
    'EuUHJvZHVjdFN0YXR1c0gBUgZzdGF0dXOIAQESGwoJcGFnZV9zaXplGAUgASgFUghwYWdlU2l6'
    'ZRIdCgpwYWdlX3Rva2VuGAYgASgJUglwYWdlVG9rZW5CDwoNX3NlYXJjaF9xdWVyeUIJCgdfc3'
    'RhdHVz');

@$core.Deprecated('Use listStoreProductsResponseDescriptor instead')
const ListStoreProductsResponse$json = {
  '1': 'ListStoreProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.StoreProductWithGlobalProduct',
      '10': 'products'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'next_page_token', '3': 3, '4': 1, '5': 9, '10': 'nextPageToken'},
  ],
};

/// Descriptor for `ListStoreProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listStoreProductsResponseDescriptor = $convert.base64Decode(
    'ChlMaXN0U3RvcmVQcm9kdWN0c1Jlc3BvbnNlEjYKCHByb2R1Y3RzGAEgAygLMhouaW52ZW50b3'
    'J5LnYxLlN0b3JlUHJvZHVjdFIIcHJvZHVjdHMSHwoLdG90YWxfY291bnQYAiABKAVSCnRvdGFs'
    'Q291bnQSJgoPbmV4dF9wYWdlX3Rva2VuGAMgASgJUg1uZXh0UGFnZVRva2Vu');

const $core.Map<$core.String, $core.dynamic> StoreProductServiceBase$json = {
  '1': 'StoreProductService',
  '2': [
    {
      '1': 'FindGlobalProducts',
      '2': '.inventory.v1.FindGlobalProductsRequest',
      '3': '.inventory.v1.FindGlobalProductsResponse'
    },
    {
      '1': 'CreateGlobalProduct',
      '2': '.inventory.v1.CreateGlobalProductRequest',
      '3': '.inventory.v1.CreateGlobalProductResponse'
    },
    {
      '1': 'UpdateGlobalProduct',
      '2': '.inventory.v1.UpdateGlobalProductRequest',
      '3': '.inventory.v1.UpdateGlobalProductResponse'
    },
    {
      '1': 'DeleteGlobalProduct',
      '2': '.inventory.v1.DeleteGlobalProductRequest',
      '3': '.inventory.v1.DeleteGlobalProductResponse'
    },
    {
      '1': 'AddProduct',
      '2': '.inventory.v1.AddStoreProductRequest',
      '3': '.inventory.v1.AddStoreProductResponse'
    },
    {
      '1': 'GetStoreProduct',
      '2': '.inventory.v1.GetStoreProductRequest',
      '3': '.inventory.v1.GetStoreProductResponse'
    },
    {
      '1': 'UpdateStoreProduct',
      '2': '.inventory.v1.UpdateStoreProductRequest',
      '3': '.inventory.v1.UpdateStoreProductResponse'
    },
    {
      '1': 'DeleteStoreProduct',
      '2': '.inventory.v1.DeleteStoreProductRequest',
      '3': '.inventory.v1.DeleteStoreProductResponse'
    },
    {
      '1': 'FindProducts',
      '2': '.inventory.v1.FindProductsRequest',
      '3': '.inventory.v1.FindProductsResponse'
    },
    {
      '1': 'StreamStoreProducts',
      '2': '.inventory.v1.StreamStoreProductsRequest',
      '3': '.inventory.v1.StreamStoreProductsResponse',
      '6': true
    },
    {
      '1': 'StreamGlobalProducts',
      '2': '.inventory.v1.StreamGlobalProductsRequest',
      '3': '.inventory.v1.StreamGlobalProductsResponse',
      '6': true
    },
    {
      '1': 'ListStoreProducts',
      '2': '.inventory.v1.ListStoreProductsRequest',
      '3': '.inventory.v1.ListStoreProductsResponse'
    },
  ],
};

@$core.Deprecated('Use storeProductServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    StoreProductServiceBase$messageJson = {
  '.inventory.v1.FindGlobalProductsRequest': FindGlobalProductsRequest$json,
  '.inventory.v1.Category': $0.Category$json,
  '.inventory.v1.Internationalized': $0.Internationalized$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.inventory.v1.FindGlobalProductsResponse': FindGlobalProductsResponse$json,
  '.inventory.v1.GlobalProduct': GlobalProduct$json,
  '.inventory.v1.CreateGlobalProductRequest': CreateGlobalProductRequest$json,
  '.inventory.v1.CreateGlobalProductResponse': CreateGlobalProductResponse$json,
  '.inventory.v1.UpdateGlobalProductRequest': UpdateGlobalProductRequest$json,
  '.inventory.v1.UpdateGlobalProductResponse': UpdateGlobalProductResponse$json,
  '.inventory.v1.DeleteGlobalProductRequest': DeleteGlobalProductRequest$json,
  '.inventory.v1.DeleteGlobalProductResponse': DeleteGlobalProductResponse$json,
  '.inventory.v1.AddStoreProductRequest': AddStoreProductRequest$json,
  '.inventory.v1.StoreProduct': StoreProduct$json,
  '.inventory.v1.AddStoreProductResponse': AddStoreProductResponse$json,
  '.inventory.v1.GetStoreProductRequest': GetStoreProductRequest$json,
  '.inventory.v1.GetStoreProductResponse': GetStoreProductResponse$json,
  '.inventory.v1.UpdateStoreProductRequest': UpdateStoreProductRequest$json,
  '.inventory.v1.UpdateStoreProductResponse': UpdateStoreProductResponse$json,
  '.inventory.v1.DeleteStoreProductRequest': DeleteStoreProductRequest$json,
  '.inventory.v1.DeleteStoreProductResponse': DeleteStoreProductResponse$json,
  '.inventory.v1.FindProductsRequest': FindProductsRequest$json,
  '.inventory.v1.FindProductsResponse': FindProductsResponse$json,
  '.inventory.v1.StoreProductWithGlobalProduct':
      StoreProductWithGlobalProduct$json,
  '.inventory.v1.StreamStoreProductsRequest': StreamStoreProductsRequest$json,
  '.inventory.v1.StreamStoreProductsResponse': StreamStoreProductsResponse$json,
  '.inventory.v1.StreamGlobalProductsRequest': StreamGlobalProductsRequest$json,
  '.inventory.v1.StreamGlobalProductsResponse':
      StreamGlobalProductsResponse$json,
  '.inventory.v1.ListStoreProductsRequest': ListStoreProductsRequest$json,
  '.inventory.v1.ListStoreProductsResponse': ListStoreProductsResponse$json,
};

/// Descriptor for `StoreProductService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List storeProductServiceDescriptor = $convert.base64Decode(
    'ChNTdG9yZVByb2R1Y3RTZXJ2aWNlEmcKEkZpbmRHbG9iYWxQcm9kdWN0cxInLmludmVudG9yeS'
    '52MS5GaW5kR2xvYmFsUHJvZHVjdHNSZXF1ZXN0GiguaW52ZW50b3J5LnYxLkZpbmRHbG9iYWxQ'
    'cm9kdWN0c1Jlc3BvbnNlEmoKE0NyZWF0ZUdsb2JhbFByb2R1Y3QSKC5pbnZlbnRvcnkudjEuQ3'
    'JlYXRlR2xvYmFsUHJvZHVjdFJlcXVlc3QaKS5pbnZlbnRvcnkudjEuQ3JlYXRlR2xvYmFsUHJv'
    'ZHVjdFJlc3BvbnNlEmoKE1VwZGF0ZUdsb2JhbFByb2R1Y3QSKC5pbnZlbnRvcnkudjEuVXBkYX'
    'RlR2xvYmFsUHJvZHVjdFJlcXVlc3QaKS5pbnZlbnRvcnkudjEuVXBkYXRlR2xvYmFsUHJvZHVj'
    'dFJlc3BvbnNlEmoKE0RlbGV0ZUdsb2JhbFByb2R1Y3QSKC5pbnZlbnRvcnkudjEuRGVsZXRlR2'
    'xvYmFsUHJvZHVjdFJlcXVlc3QaKS5pbnZlbnRvcnkudjEuRGVsZXRlR2xvYmFsUHJvZHVjdFJl'
    'c3BvbnNlElkKCkFkZFByb2R1Y3QSJC5pbnZlbnRvcnkudjEuQWRkU3RvcmVQcm9kdWN0UmVxdW'
    'VzdBolLmludmVudG9yeS52MS5BZGRTdG9yZVByb2R1Y3RSZXNwb25zZRJeCg9HZXRTdG9yZVBy'
    'b2R1Y3QSJC5pbnZlbnRvcnkudjEuR2V0U3RvcmVQcm9kdWN0UmVxdWVzdBolLmludmVudG9yeS'
    '52MS5HZXRTdG9yZVByb2R1Y3RSZXNwb25zZRJnChJVcGRhdGVTdG9yZVByb2R1Y3QSJy5pbnZl'
    'bnRvcnkudjEuVXBkYXRlU3RvcmVQcm9kdWN0UmVxdWVzdBooLmludmVudG9yeS52MS5VcGRhdG'
    'VTdG9yZVByb2R1Y3RSZXNwb25zZRJnChJEZWxldGVTdG9yZVByb2R1Y3QSJy5pbnZlbnRvcnku'
    'djEuRGVsZXRlU3RvcmVQcm9kdWN0UmVxdWVzdBooLmludmVudG9yeS52MS5EZWxldGVTdG9yZV'
    'Byb2R1Y3RSZXNwb25zZRJkChFGaW5kU3RvcmVQcm9kdWN0cxImLmludmVudG9yeS52MS5GaW5k'
    'U3RvcmVQcm9kdWN0c1JlcXVlc3QaJy5pbnZlbnRvcnkudjEuRmluZFN0b3JlUHJvZHVjdHNSZX'
    'Nwb25zZRJsChNTdHJlYW1TdG9yZVByb2R1Y3RzEiguaW52ZW50b3J5LnYxLlN0cmVhbVN0b3Jl'
    'UHJvZHVjdHNSZXF1ZXN0GikuaW52ZW50b3J5LnYxLlN0cmVhbVN0b3JlUHJvZHVjdHNSZXNwb2'
    '5zZTABEm8KFFN0cmVhbUdsb2JhbFByb2R1Y3RzEikuaW52ZW50b3J5LnYxLlN0cmVhbUdsb2Jh'
    'bFByb2R1Y3RzUmVxdWVzdBoqLmludmVudG9yeS52MS5TdHJlYW1HbG9iYWxQcm9kdWN0c1Jlc3'
    'BvbnNlMAESZAoRTGlzdFN0b3JlUHJvZHVjdHMSJi5pbnZlbnRvcnkudjEuTGlzdFN0b3JlUHJv'
    'ZHVjdHNSZXF1ZXN0GicuaW52ZW50b3J5LnYxLkxpc3RTdG9yZVByb2R1Y3RzUmVzcG9uc2U=');
