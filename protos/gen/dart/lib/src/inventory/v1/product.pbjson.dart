// This is a generated file - do not edit.
//
// Generated from inventory/v1/product.proto.

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
    '9saW5rc19pZHMYBiADKAlSDmltYWdlc0xpbmtzSWRzQgkKB19yZWZfaWRCDgoMX2Rlc2NyaXB0'
    'aW9uQhEKD19iYXJfY29kZV92YWx1ZQ==');

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

@$core.Deprecated('Use supplyEntryDescriptor instead')
const SupplyEntry$json = {
  '1': 'SupplyEntry',
  '2': [
    {'1': 'quantity', '3': 1, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'price', '3': 2, '4': 1, '5': 5, '10': 'price'},
    {'1': 'supplier_id', '3': 3, '4': 1, '5': 9, '10': 'supplierId'},
  ],
};

/// Descriptor for `SupplyEntry`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplyEntryDescriptor = $convert.base64Decode(
    'CgtTdXBwbHlFbnRyeRIaCghxdWFudGl0eRgBIAEoBVIIcXVhbnRpdHkSFAoFcHJpY2UYAiABKA'
    'VSBXByaWNlEh8KC3N1cHBsaWVyX2lkGAMgASgJUgpzdXBwbGllcklk');

@$core.Deprecated('Use storeProductDescriptor instead')
const StoreProduct$json = {
  '1': 'StoreProduct',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'global_product_id', '3': 3, '4': 1, '5': 9, '10': 'globalProductId'},
    {'1': 'price', '3': 4, '4': 1, '5': 5, '9': 1, '10': 'price', '17': true},
    {'1': 'images_links_ids', '3': 5, '4': 3, '5': 9, '10': 'imagesLinksIds'},
    {
      '1': 'stock_quantity',
      '3': 6,
      '4': 1,
      '5': 5,
      '9': 2,
      '10': 'stockQuantity',
      '17': true
    },
    {
      '1': 'min_stock_threshold',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'minStockThreshold'
    },
    {
      '1': 'expiration_date',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 3,
      '10': 'expirationDate',
      '17': true
    },
    {
      '1': 'inbound_date',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 4,
      '10': 'inboundDate',
      '17': true
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
      '9': 5,
      '10': 'updatedAt',
      '17': true
    },
    {
      '1': 'supplier_id',
      '3': 12,
      '4': 1,
      '5': 9,
      '9': 6,
      '10': 'supplierId',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_price'},
    {'1': '_stock_quantity'},
    {'1': '_expiration_date'},
    {'1': '_inbound_date'},
    {'1': '_updated_at'},
    {'1': '_supplier_id'},
  ],
};

/// Descriptor for `StoreProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List storeProductDescriptor = $convert.base64Decode(
    'CgxTdG9yZVByb2R1Y3QSGgoGcmVmX2lkGAEgASgJSABSBXJlZklkiAEBEhkKCHN0b3JlX2lkGA'
    'IgASgJUgdzdG9yZUlkEioKEWdsb2JhbF9wcm9kdWN0X2lkGAMgASgJUg9nbG9iYWxQcm9kdWN0'
    'SWQSGQoFcHJpY2UYBCABKAVIAVIFcHJpY2WIAQESKAoQaW1hZ2VzX2xpbmtzX2lkcxgFIAMoCV'
    'IOaW1hZ2VzTGlua3NJZHMSKgoOc3RvY2tfcXVhbnRpdHkYBiABKAVIAlINc3RvY2tRdWFudGl0'
    'eYgBARIuChNtaW5fc3RvY2tfdGhyZXNob2xkGAcgASgFUhFtaW5TdG9ja1RocmVzaG9sZBJICg'
    '9leHBpcmF0aW9uX2RhdGUYCCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSANSDmV4'
    'cGlyYXRpb25EYXRliAEBEkIKDGluYm91bmRfZGF0ZRgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi'
    '5UaW1lc3RhbXBIBFILaW5ib3VuZERhdGWIAQESOQoKY3JlYXRlZF9hdBgKIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI+Cgp1cGRhdGVkX2F0GAsgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgFUgl1cGRhdGVkQXSIAQESJAoLc3VwcGxpZXJfaWQY'
    'DCABKAlIBlIKc3VwcGxpZXJJZIgBAUIJCgdfcmVmX2lkQggKBl9wcmljZUIRCg9fc3RvY2tfcX'
    'VhbnRpdHlCEgoQX2V4cGlyYXRpb25fZGF0ZUIPCg1faW5ib3VuZF9kYXRlQg0KC191cGRhdGVk'
    'X2F0Qg4KDF9zdXBwbGllcl9pZA==');

@$core.Deprecated('Use findStoreProductsRequestDescriptor instead')
const FindStoreProductsRequest$json = {
  '1': 'FindStoreProductsRequest',
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
      '1': 'expiration_date',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 2,
      '10': 'expirationDate',
      '17': true
    },
    {
      '1': 'supplier_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'supplierId',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_global_product_id'},
    {'1': '_expiration_date'},
    {'1': '_supplier_id'},
  ],
};

/// Descriptor for `FindStoreProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findStoreProductsRequestDescriptor = $convert.base64Decode(
    'ChhGaW5kU3RvcmVQcm9kdWN0c1JlcXVlc3QSGQoIc3RvcmVfaWQYASABKAlSB3N0b3JlSWQSGg'
    'oGcmVmX2lkGAIgASgJSABSBXJlZklkiAEBEi8KEWdsb2JhbF9wcm9kdWN0X2lkGAMgASgJSAFS'
    'D2dsb2JhbFByb2R1Y3RJZIgBARJICg9leHBpcmF0aW9uX2RhdGUYBCABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wSAJSDmV4cGlyYXRpb25EYXRliAEBEiQKC3N1cHBsaWVyX2lkGAUg'
    'ASgJSANSCnN1cHBsaWVySWSIAQFCCQoHX3JlZl9pZEIUChJfZ2xvYmFsX3Byb2R1Y3RfaWRCEg'
    'oQX2V4cGlyYXRpb25fZGF0ZUIOCgxfc3VwcGxpZXJfaWQ=');

@$core.Deprecated('Use findStoreProductsResponseDescriptor instead')
const FindStoreProductsResponse$json = {
  '1': 'FindStoreProductsResponse',
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

/// Descriptor for `FindStoreProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findStoreProductsResponseDescriptor =
    $convert.base64Decode(
        'ChlGaW5kU3RvcmVQcm9kdWN0c1Jlc3BvbnNlEjYKCHByb2R1Y3RzGAEgAygLMhouaW52ZW50b3'
        'J5LnYxLlN0b3JlUHJvZHVjdFIIcHJvZHVjdHM=');

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
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_name'},
    {'1': '_bar_code_value'},
  ],
};

/// Descriptor for `FindGlobalProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findGlobalProductsRequestDescriptor = $convert.base64Decode(
    'ChlGaW5kR2xvYmFsUHJvZHVjdHNSZXF1ZXN0EhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBAR'
    'I2CgpjYXRlZ29yaWVzGAIgAygLMhYuaW52ZW50b3J5LnYxLkNhdGVnb3J5UgpjYXRlZ29yaWVz'
    'EhcKBG5hbWUYAyABKAlIAVIEbmFtZYgBARIpCg5iYXJfY29kZV92YWx1ZRgEIAEoCUgCUgxiYX'
    'JDb2RlVmFsdWWIAQFCCQoHX3JlZl9pZEIHCgVfbmFtZUIRCg9fYmFyX2NvZGVfdmFsdWU=');

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

@$core.Deprecated('Use findProductCategoryRequestDescriptor instead')
const FindProductCategoryRequest$json = {
  '1': 'FindProductCategoryRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `FindProductCategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findProductCategoryRequestDescriptor =
    $convert.base64Decode(
        'ChpGaW5kUHJvZHVjdENhdGVnb3J5UmVxdWVzdBIUCgVxdWVyeRgBIAEoCVIFcXVlcnk=');

@$core.Deprecated('Use findProductCategoryResponseDescriptor instead')
const FindProductCategoryResponse$json = {
  '1': 'FindProductCategoryResponse',
  '2': [
    {
      '1': 'categories',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.Category',
      '10': 'categories'
    },
  ],
};

/// Descriptor for `FindProductCategoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findProductCategoryResponseDescriptor =
    $convert.base64Decode(
        'ChtGaW5kUHJvZHVjdENhdGVnb3J5UmVzcG9uc2USNgoKY2F0ZWdvcmllcxgBIAMoCzIWLmludm'
        'VudG9yeS52MS5DYXRlZ29yeVIKY2F0ZWdvcmllcw==');

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

const $core.Map<$core.String, $core.dynamic> ProductServiceBase$json = {
  '1': 'ProductService',
  '2': [
    {
      '1': 'FindGlobalProducts',
      '2': '.inventory.v1.FindGlobalProductsRequest',
      '3': '.inventory.v1.FindGlobalProductsResponse'
    },
    {
      '1': 'FindProductCategory',
      '2': '.inventory.v1.FindProductCategoryRequest',
      '3': '.inventory.v1.FindProductCategoryResponse'
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
      '1': 'GetProduct',
      '2': '.inventory.v1.GetStoreProductRequest',
      '3': '.inventory.v1.GetStoreProductResponse'
    },
    {
      '1': 'UpdateProduct',
      '2': '.inventory.v1.UpdateStoreProductRequest',
      '3': '.inventory.v1.UpdateStoreProductResponse'
    },
    {
      '1': 'DeleteProduct',
      '2': '.inventory.v1.DeleteStoreProductRequest',
      '3': '.inventory.v1.DeleteStoreProductResponse'
    },
    {
      '1': 'FindStoreProducts',
      '2': '.inventory.v1.FindStoreProductsRequest',
      '3': '.inventory.v1.FindStoreProductsResponse'
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
  ],
};

@$core.Deprecated('Use productServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ProductServiceBase$messageJson = {
  '.inventory.v1.FindGlobalProductsRequest': FindGlobalProductsRequest$json,
  '.inventory.v1.Category': $0.Category$json,
  '.inventory.v1.Internationalized': $0.Internationalized$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.inventory.v1.FindGlobalProductsResponse': FindGlobalProductsResponse$json,
  '.inventory.v1.GlobalProduct': GlobalProduct$json,
  '.inventory.v1.FindProductCategoryRequest': FindProductCategoryRequest$json,
  '.inventory.v1.FindProductCategoryResponse': FindProductCategoryResponse$json,
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
  '.inventory.v1.FindStoreProductsRequest': FindStoreProductsRequest$json,
  '.inventory.v1.FindStoreProductsResponse': FindStoreProductsResponse$json,
  '.inventory.v1.StreamStoreProductsRequest': StreamStoreProductsRequest$json,
  '.inventory.v1.StreamStoreProductsResponse': StreamStoreProductsResponse$json,
  '.inventory.v1.StreamGlobalProductsRequest': StreamGlobalProductsRequest$json,
  '.inventory.v1.StreamGlobalProductsResponse':
      StreamGlobalProductsResponse$json,
};

/// Descriptor for `ProductService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List productServiceDescriptor = $convert.base64Decode(
    'Cg5Qcm9kdWN0U2VydmljZRJnChJGaW5kR2xvYmFsUHJvZHVjdHMSJy5pbnZlbnRvcnkudjEuRm'
    'luZEdsb2JhbFByb2R1Y3RzUmVxdWVzdBooLmludmVudG9yeS52MS5GaW5kR2xvYmFsUHJvZHVj'
    'dHNSZXNwb25zZRJqChNGaW5kUHJvZHVjdENhdGVnb3J5EiguaW52ZW50b3J5LnYxLkZpbmRQcm'
    '9kdWN0Q2F0ZWdvcnlSZXF1ZXN0GikuaW52ZW50b3J5LnYxLkZpbmRQcm9kdWN0Q2F0ZWdvcnlS'
    'ZXNwb25zZRJqChNDcmVhdGVHbG9iYWxQcm9kdWN0EiguaW52ZW50b3J5LnYxLkNyZWF0ZUdsb2'
    'JhbFByb2R1Y3RSZXF1ZXN0GikuaW52ZW50b3J5LnYxLkNyZWF0ZUdsb2JhbFByb2R1Y3RSZXNw'
    'b25zZRJqChNVcGRhdGVHbG9iYWxQcm9kdWN0EiguaW52ZW50b3J5LnYxLlVwZGF0ZUdsb2JhbF'
    'Byb2R1Y3RSZXF1ZXN0GikuaW52ZW50b3J5LnYxLlVwZGF0ZUdsb2JhbFByb2R1Y3RSZXNwb25z'
    'ZRJqChNEZWxldGVHbG9iYWxQcm9kdWN0EiguaW52ZW50b3J5LnYxLkRlbGV0ZUdsb2JhbFByb2'
    'R1Y3RSZXF1ZXN0GikuaW52ZW50b3J5LnYxLkRlbGV0ZUdsb2JhbFByb2R1Y3RSZXNwb25zZRJZ'
    'CgpBZGRQcm9kdWN0EiQuaW52ZW50b3J5LnYxLkFkZFN0b3JlUHJvZHVjdFJlcXVlc3QaJS5pbn'
    'ZlbnRvcnkudjEuQWRkU3RvcmVQcm9kdWN0UmVzcG9uc2USWQoKR2V0UHJvZHVjdBIkLmludmVu'
    'dG9yeS52MS5HZXRTdG9yZVByb2R1Y3RSZXF1ZXN0GiUuaW52ZW50b3J5LnYxLkdldFN0b3JlUH'
    'JvZHVjdFJlc3BvbnNlEmIKDVVwZGF0ZVByb2R1Y3QSJy5pbnZlbnRvcnkudjEuVXBkYXRlU3Rv'
    'cmVQcm9kdWN0UmVxdWVzdBooLmludmVudG9yeS52MS5VcGRhdGVTdG9yZVByb2R1Y3RSZXNwb2'
    '5zZRJiCg1EZWxldGVQcm9kdWN0EicuaW52ZW50b3J5LnYxLkRlbGV0ZVN0b3JlUHJvZHVjdFJl'
    'cXVlc3QaKC5pbnZlbnRvcnkudjEuRGVsZXRlU3RvcmVQcm9kdWN0UmVzcG9uc2USZAoRRmluZF'
    'N0b3JlUHJvZHVjdHMSJi5pbnZlbnRvcnkudjEuRmluZFN0b3JlUHJvZHVjdHNSZXF1ZXN0Gicu'
    'aW52ZW50b3J5LnYxLkZpbmRTdG9yZVByb2R1Y3RzUmVzcG9uc2USbAoTU3RyZWFtU3RvcmVQcm'
    '9kdWN0cxIoLmludmVudG9yeS52MS5TdHJlYW1TdG9yZVByb2R1Y3RzUmVxdWVzdBopLmludmVu'
    'dG9yeS52MS5TdHJlYW1TdG9yZVByb2R1Y3RzUmVzcG9uc2UwARJvChRTdHJlYW1HbG9iYWxQcm'
    '9kdWN0cxIpLmludmVudG9yeS52MS5TdHJlYW1HbG9iYWxQcm9kdWN0c1JlcXVlc3QaKi5pbnZl'
    'bnRvcnkudjEuU3RyZWFtR2xvYmFsUHJvZHVjdHNSZXNwb25zZTAB');
