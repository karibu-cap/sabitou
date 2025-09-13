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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use productCategoryDescriptor instead')
const ProductCategory$json = {
  '1': 'ProductCategory',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'name', '3': 2, '4': 1, '5': 9, '10': 'name'},
  ],
  '8': [
    {'1': '_ref_id'},
  ],
};

/// Descriptor for `ProductCategory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productCategoryDescriptor = $convert.base64Decode(
    'Cg9Qcm9kdWN0Q2F0ZWdvcnkSGgoGcmVmX2lkGAEgASgJSABSBXJlZklkiAEBEhIKBG5hbWUYAi'
    'ABKAlSBG5hbWVCCQoHX3JlZl9pZA==');

@$core.Deprecated('Use globalProductDescriptor instead')
const GlobalProduct$json = {
  '1': 'GlobalProduct',
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
      '6': '.inventory.v1.ProductCategory',
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
    'Cg1HbG9iYWxQcm9kdWN0EhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBARISCgRuYW1lGAIgAS'
    'gJUgRuYW1lEiUKC2Rlc2NyaXB0aW9uGAMgASgJSAFSC2Rlc2NyaXB0aW9uiAEBEikKDmJhcl9j'
    'b2RlX3ZhbHVlGAQgASgJSAJSDGJhckNvZGVWYWx1ZYgBARI9CgpjYXRlZ29yaWVzGAUgAygLMh'
    '0uaW52ZW50b3J5LnYxLlByb2R1Y3RDYXRlZ29yeVIKY2F0ZWdvcmllcxIoChBpbWFnZXNfbGlu'
    'a3NfaWRzGAYgAygJUg5pbWFnZXNMaW5rc0lkc0IJCgdfcmVmX2lkQg4KDF9kZXNjcmlwdGlvbk'
    'IRCg9fYmFyX2NvZGVfdmFsdWU=');

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
    {'1': 'images_link_ids', '3': 5, '4': 3, '5': 9, '10': 'imagesLinkIds'},
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
    'SWQSGQoFcHJpY2UYBCABKAVIAVIFcHJpY2WIAQESJgoPaW1hZ2VzX2xpbmtfaWRzGAUgAygJUg'
    '1pbWFnZXNMaW5rSWRzEioKDnN0b2NrX3F1YW50aXR5GAYgASgFSAJSDXN0b2NrUXVhbnRpdHmI'
    'AQESLgoTbWluX3N0b2NrX3RocmVzaG9sZBgHIAEoBVIRbWluU3RvY2tUaHJlc2hvbGQSSAoPZX'
    'hwaXJhdGlvbl9kYXRlGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgDUg5leHBp'
    'cmF0aW9uRGF0ZYgBARJCCgxpbmJvdW5kX2RhdGUYCSABKAsyGi5nb29nbGUucHJvdG9idWYuVG'
    'ltZXN0YW1wSARSC2luYm91bmREYXRliAEBEjkKCmNyZWF0ZWRfYXQYCiABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSPgoKdXBkYXRlZF9hdBgLIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIBVIJdXBkYXRlZEF0iAEBEiQKC3N1cHBsaWVyX2lkGAwg'
    'ASgJSAZSCnN1cHBsaWVySWSIAQFCCQoHX3JlZl9pZEIICgZfcHJpY2VCEQoPX3N0b2NrX3F1YW'
    '50aXR5QhIKEF9leHBpcmF0aW9uX2RhdGVCDwoNX2luYm91bmRfZGF0ZUINCgtfdXBkYXRlZF9h'
    'dEIOCgxfc3VwcGxpZXJfaWQ=');

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
      '6': '.inventory.v1.ProductCategory',
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
    'I9CgpjYXRlZ29yaWVzGAIgAygLMh0uaW52ZW50b3J5LnYxLlByb2R1Y3RDYXRlZ29yeVIKY2F0'
    'ZWdvcmllcxIXCgRuYW1lGAMgASgJSAFSBG5hbWWIAQESKQoOYmFyX2NvZGVfdmFsdWUYBCABKA'
    'lIAlIMYmFyQ29kZVZhbHVliAEBQgkKB19yZWZfaWRCBwoFX25hbWVCEQoPX2Jhcl9jb2RlX3Zh'
    'bHVl');

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

@$core.Deprecated('Use findCategoryRequestDescriptor instead')
const FindCategoryRequest$json = {
  '1': 'FindCategoryRequest',
  '2': [
    {'1': 'query', '3': 1, '4': 1, '5': 9, '10': 'query'},
  ],
};

/// Descriptor for `FindCategoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findCategoryRequestDescriptor =
    $convert.base64Decode(
        'ChNGaW5kQ2F0ZWdvcnlSZXF1ZXN0EhQKBXF1ZXJ5GAEgASgJUgVxdWVyeQ==');

@$core.Deprecated('Use findCategoryResponseDescriptor instead')
const FindCategoryResponse$json = {
  '1': 'FindCategoryResponse',
  '2': [
    {
      '1': 'categories',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.ProductCategory',
      '10': 'categories'
    },
  ],
};

/// Descriptor for `FindCategoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findCategoryResponseDescriptor = $convert.base64Decode(
    'ChRGaW5kQ2F0ZWdvcnlSZXNwb25zZRI9CgpjYXRlZ29yaWVzGAEgAygLMh0uaW52ZW50b3J5Ln'
    'YxLlByb2R1Y3RDYXRlZ29yeVIKY2F0ZWdvcmllcw==');

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

const $core.Map<$core.String, $core.dynamic> ProductServiceBase$json = {
  '1': 'ProductService',
  '2': [
    {
      '1': 'FindGlobalProducts',
      '2': '.inventory.v1.FindGlobalProductsRequest',
      '3': '.inventory.v1.FindGlobalProductsResponse'
    },
    {
      '1': 'FindCategory',
      '2': '.inventory.v1.FindCategoryRequest',
      '3': '.inventory.v1.FindCategoryResponse'
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
  ],
};

@$core.Deprecated('Use productServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ProductServiceBase$messageJson = {
  '.inventory.v1.FindGlobalProductsRequest': FindGlobalProductsRequest$json,
  '.inventory.v1.ProductCategory': ProductCategory$json,
  '.inventory.v1.FindGlobalProductsResponse': FindGlobalProductsResponse$json,
  '.inventory.v1.GlobalProduct': GlobalProduct$json,
  '.inventory.v1.FindCategoryRequest': FindCategoryRequest$json,
  '.inventory.v1.FindCategoryResponse': FindCategoryResponse$json,
  '.inventory.v1.AddStoreProductRequest': AddStoreProductRequest$json,
  '.inventory.v1.StoreProduct': StoreProduct$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
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
};

/// Descriptor for `ProductService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List productServiceDescriptor = $convert.base64Decode(
    'Cg5Qcm9kdWN0U2VydmljZRJnChJGaW5kR2xvYmFsUHJvZHVjdHMSJy5pbnZlbnRvcnkudjEuRm'
    'luZEdsb2JhbFByb2R1Y3RzUmVxdWVzdBooLmludmVudG9yeS52MS5GaW5kR2xvYmFsUHJvZHVj'
    'dHNSZXNwb25zZRJVCgxGaW5kQ2F0ZWdvcnkSIS5pbnZlbnRvcnkudjEuRmluZENhdGVnb3J5Um'
    'VxdWVzdBoiLmludmVudG9yeS52MS5GaW5kQ2F0ZWdvcnlSZXNwb25zZRJZCgpBZGRQcm9kdWN0'
    'EiQuaW52ZW50b3J5LnYxLkFkZFN0b3JlUHJvZHVjdFJlcXVlc3QaJS5pbnZlbnRvcnkudjEuQW'
    'RkU3RvcmVQcm9kdWN0UmVzcG9uc2USWQoKR2V0UHJvZHVjdBIkLmludmVudG9yeS52MS5HZXRT'
    'dG9yZVByb2R1Y3RSZXF1ZXN0GiUuaW52ZW50b3J5LnYxLkdldFN0b3JlUHJvZHVjdFJlc3Bvbn'
    'NlEmIKDVVwZGF0ZVByb2R1Y3QSJy5pbnZlbnRvcnkudjEuVXBkYXRlU3RvcmVQcm9kdWN0UmVx'
    'dWVzdBooLmludmVudG9yeS52MS5VcGRhdGVTdG9yZVByb2R1Y3RSZXNwb25zZRJiCg1EZWxldG'
    'VQcm9kdWN0EicuaW52ZW50b3J5LnYxLkRlbGV0ZVN0b3JlUHJvZHVjdFJlcXVlc3QaKC5pbnZl'
    'bnRvcnkudjEuRGVsZXRlU3RvcmVQcm9kdWN0UmVzcG9uc2USZAoRRmluZFN0b3JlUHJvZHVjdH'
    'MSJi5pbnZlbnRvcnkudjEuRmluZFN0b3JlUHJvZHVjdHNSZXF1ZXN0GicuaW52ZW50b3J5LnYx'
    'LkZpbmRTdG9yZVByb2R1Y3RzUmVzcG9uc2USbAoTU3RyZWFtU3RvcmVQcm9kdWN0cxIoLmludm'
    'VudG9yeS52MS5TdHJlYW1TdG9yZVByb2R1Y3RzUmVxdWVzdBopLmludmVudG9yeS52MS5TdHJl'
    'YW1TdG9yZVByb2R1Y3RzUmVzcG9uc2UwAQ==');
