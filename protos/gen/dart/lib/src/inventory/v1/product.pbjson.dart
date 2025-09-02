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

@$core.Deprecated('Use businessProductDescriptor instead')
const BusinessProduct$json = {
  '1': 'BusinessProduct',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '10': 'businessId'},
    {'1': 'global_product_id', '3': 3, '4': 1, '5': 9, '10': 'globalProductId'},
    {'1': 'price_in_cents', '3': 4, '4': 1, '5': 5, '10': 'priceInCents'},
    {'1': 'images_link_ids', '3': 5, '4': 3, '5': 9, '10': 'imagesLinkIds'},
    {'1': 'stock_quantity', '3': 6, '4': 1, '5': 5, '10': 'stockQuantity'},
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
      '9': 1,
      '10': 'expirationDate',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_expiration_date'},
  ],
};

/// Descriptor for `BusinessProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List businessProductDescriptor = $convert.base64Decode(
    'Cg9CdXNpbmVzc1Byb2R1Y3QSGgoGcmVmX2lkGAEgASgJSABSBXJlZklkiAEBEh8KC2J1c2luZX'
    'NzX2lkGAIgASgJUgpidXNpbmVzc0lkEioKEWdsb2JhbF9wcm9kdWN0X2lkGAMgASgJUg9nbG9i'
    'YWxQcm9kdWN0SWQSJAoOcHJpY2VfaW5fY2VudHMYBCABKAVSDHByaWNlSW5DZW50cxImCg9pbW'
    'FnZXNfbGlua19pZHMYBSADKAlSDWltYWdlc0xpbmtJZHMSJQoOc3RvY2tfcXVhbnRpdHkYBiAB'
    'KAVSDXN0b2NrUXVhbnRpdHkSLgoTbWluX3N0b2NrX3RocmVzaG9sZBgHIAEoBVIRbWluU3RvY2'
    'tUaHJlc2hvbGQSSAoPZXhwaXJhdGlvbl9kYXRlGAggASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
    'bWVzdGFtcEgBUg5leHBpcmF0aW9uRGF0ZYgBAUIJCgdfcmVmX2lkQhIKEF9leHBpcmF0aW9uX2'
    'RhdGU=');

@$core.Deprecated('Use findBusinessProductsRequestDescriptor instead')
const FindBusinessProductsRequest$json = {
  '1': 'FindBusinessProductsRequest',
  '2': [
    {'1': 'business_id', '3': 1, '4': 1, '5': 9, '10': 'businessId'},
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
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_global_product_id'},
    {'1': '_expiration_date'},
  ],
};

/// Descriptor for `FindBusinessProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findBusinessProductsRequestDescriptor = $convert.base64Decode(
    'ChtGaW5kQnVzaW5lc3NQcm9kdWN0c1JlcXVlc3QSHwoLYnVzaW5lc3NfaWQYASABKAlSCmJ1c2'
    'luZXNzSWQSGgoGcmVmX2lkGAIgASgJSABSBXJlZklkiAEBEi8KEWdsb2JhbF9wcm9kdWN0X2lk'
    'GAMgASgJSAFSD2dsb2JhbFByb2R1Y3RJZIgBARJICg9leHBpcmF0aW9uX2RhdGUYBCABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAJSDmV4cGlyYXRpb25EYXRliAEBQgkKB19yZWZf'
    'aWRCFAoSX2dsb2JhbF9wcm9kdWN0X2lkQhIKEF9leHBpcmF0aW9uX2RhdGU=');

@$core.Deprecated('Use findBusinessProductsResponseDescriptor instead')
const FindBusinessProductsResponse$json = {
  '1': 'FindBusinessProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.BusinessProduct',
      '10': 'products'
    },
  ],
};

/// Descriptor for `FindBusinessProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findBusinessProductsResponseDescriptor =
    $convert.base64Decode(
        'ChxGaW5kQnVzaW5lc3NQcm9kdWN0c1Jlc3BvbnNlEjkKCHByb2R1Y3RzGAEgAygLMh0uaW52ZW'
        '50b3J5LnYxLkJ1c2luZXNzUHJvZHVjdFIIcHJvZHVjdHM=');

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
  ],
  '8': [
    {'1': '_ref_id'},
  ],
};

/// Descriptor for `FindGlobalProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findGlobalProductsRequestDescriptor = $convert.base64Decode(
    'ChlGaW5kR2xvYmFsUHJvZHVjdHNSZXF1ZXN0EhoKBnJlZl9pZBgBIAEoCUgAUgVyZWZJZIgBAR'
    'I9CgpjYXRlZ29yaWVzGAIgAygLMh0uaW52ZW50b3J5LnYxLlByb2R1Y3RDYXRlZ29yeVIKY2F0'
    'ZWdvcmllc0IJCgdfcmVmX2lk');

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

@$core.Deprecated('Use addProductRequestDescriptor instead')
const AddProductRequest$json = {
  '1': 'AddProductRequest',
  '2': [
    {
      '1': 'global_product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'globalProduct'
    },
    {'1': 'business_id', '3': 2, '4': 1, '5': 9, '10': 'businessId'},
    {'1': 'price_in_cents', '3': 3, '4': 1, '5': 5, '10': 'priceInCents'},
    {
      '1': 'images_raw_images',
      '3': 4,
      '4': 3,
      '5': 12,
      '10': 'imagesRawImages'
    },
    {'1': 'stock_quantity', '3': 5, '4': 1, '5': 5, '10': 'stockQuantity'},
    {
      '1': 'min_stock_threshold',
      '3': 6,
      '4': 1,
      '5': 5,
      '10': 'minStockThreshold'
    },
    {
      '1': 'expiration_date',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 0,
      '10': 'expirationDate',
      '17': true
    },
  ],
  '8': [
    {'1': '_expiration_date'},
  ],
};

/// Descriptor for `AddProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addProductRequestDescriptor = $convert.base64Decode(
    'ChFBZGRQcm9kdWN0UmVxdWVzdBJCCg5nbG9iYWxfcHJvZHVjdBgBIAEoCzIbLmludmVudG9yeS'
    '52MS5HbG9iYWxQcm9kdWN0Ug1nbG9iYWxQcm9kdWN0Eh8KC2J1c2luZXNzX2lkGAIgASgJUgpi'
    'dXNpbmVzc0lkEiQKDnByaWNlX2luX2NlbnRzGAMgASgFUgxwcmljZUluQ2VudHMSKgoRaW1hZ2'
    'VzX3Jhd19pbWFnZXMYBCADKAxSD2ltYWdlc1Jhd0ltYWdlcxIlCg5zdG9ja19xdWFudGl0eRgF'
    'IAEoBVINc3RvY2tRdWFudGl0eRIuChNtaW5fc3RvY2tfdGhyZXNob2xkGAYgASgFUhFtaW5TdG'
    '9ja1RocmVzaG9sZBJICg9leHBpcmF0aW9uX2RhdGUYByABKAsyGi5nb29nbGUucHJvdG9idWYu'
    'VGltZXN0YW1wSABSDmV4cGlyYXRpb25EYXRliAEBQhIKEF9leHBpcmF0aW9uX2RhdGU=');

@$core.Deprecated('Use addProductResponseDescriptor instead')
const AddProductResponse$json = {
  '1': 'AddProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AddProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addProductResponseDescriptor =
    $convert.base64Decode(
        'ChJBZGRQcm9kdWN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use getProductRequestDescriptor instead')
const GetProductRequest$json = {
  '1': 'GetProductRequest',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'productId'},
  ],
};

/// Descriptor for `GetProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQcm9kdWN0UmVxdWVzdBIpCgpwcm9kdWN0X2lkGAEgASgJQgq6SAfIAQFyAhADUglwcm'
    '9kdWN0SWQ=');

@$core.Deprecated('Use getProductResponseDescriptor instead')
const GetProductResponse$json = {
  '1': 'GetProductResponse',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.BusinessProduct',
      '10': 'product'
    },
  ],
};

/// Descriptor for `GetProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQcm9kdWN0UmVzcG9uc2USNwoHcHJvZHVjdBgBIAEoCzIdLmludmVudG9yeS52MS5CdX'
    'NpbmVzc1Byb2R1Y3RSB3Byb2R1Y3Q=');

@$core.Deprecated('Use updateProductRequestDescriptor instead')
const UpdateProductRequest$json = {
  '1': 'UpdateProductRequest',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.BusinessProduct',
      '10': 'product'
    },
    {
      '1': 'images_raw_images',
      '3': 4,
      '4': 3,
      '5': 12,
      '10': 'imagesRawImages'
    },
  ],
};

/// Descriptor for `UpdateProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProductRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVQcm9kdWN0UmVxdWVzdBI3Cgdwcm9kdWN0GAEgASgLMh0uaW52ZW50b3J5LnYxLk'
    'J1c2luZXNzUHJvZHVjdFIHcHJvZHVjdBIqChFpbWFnZXNfcmF3X2ltYWdlcxgEIAMoDFIPaW1h'
    'Z2VzUmF3SW1hZ2Vz');

@$core.Deprecated('Use updateProductResponseDescriptor instead')
const UpdateProductResponse$json = {
  '1': 'UpdateProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateProductResponseDescriptor =
    $convert.base64Decode(
        'ChVVcGRhdGVQcm9kdWN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use deleteProductRequestDescriptor instead')
const DeleteProductRequest$json = {
  '1': 'DeleteProductRequest',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'productId'},
  ],
};

/// Descriptor for `DeleteProductRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProductRequestDescriptor = $convert.base64Decode(
    'ChREZWxldGVQcm9kdWN0UmVxdWVzdBIpCgpwcm9kdWN0X2lkGAEgASgJQgq6SAfIAQFyAhADUg'
    'lwcm9kdWN0SWQ=');

@$core.Deprecated('Use deleteProductResponseDescriptor instead')
const DeleteProductResponse$json = {
  '1': 'DeleteProductResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteProductResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteProductResponseDescriptor =
    $convert.base64Decode(
        'ChVEZWxldGVQcm9kdWN0UmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

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
      '2': '.inventory.v1.AddProductRequest',
      '3': '.inventory.v1.AddProductResponse'
    },
    {
      '1': 'GetProduct',
      '2': '.inventory.v1.GetProductRequest',
      '3': '.inventory.v1.GetProductResponse'
    },
    {
      '1': 'UpdateProduct',
      '2': '.inventory.v1.UpdateProductRequest',
      '3': '.inventory.v1.UpdateProductResponse'
    },
    {
      '1': 'DeleteProduct',
      '2': '.inventory.v1.DeleteProductRequest',
      '3': '.inventory.v1.DeleteProductResponse'
    },
    {
      '1': 'FindBusinessProducts',
      '2': '.inventory.v1.FindBusinessProductsRequest',
      '3': '.inventory.v1.FindBusinessProductsResponse'
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
  '.inventory.v1.AddProductRequest': AddProductRequest$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.inventory.v1.AddProductResponse': AddProductResponse$json,
  '.inventory.v1.GetProductRequest': GetProductRequest$json,
  '.inventory.v1.GetProductResponse': GetProductResponse$json,
  '.inventory.v1.BusinessProduct': BusinessProduct$json,
  '.inventory.v1.UpdateProductRequest': UpdateProductRequest$json,
  '.inventory.v1.UpdateProductResponse': UpdateProductResponse$json,
  '.inventory.v1.DeleteProductRequest': DeleteProductRequest$json,
  '.inventory.v1.DeleteProductResponse': DeleteProductResponse$json,
  '.inventory.v1.FindBusinessProductsRequest': FindBusinessProductsRequest$json,
  '.inventory.v1.FindBusinessProductsResponse':
      FindBusinessProductsResponse$json,
};

/// Descriptor for `ProductService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List productServiceDescriptor = $convert.base64Decode(
    'Cg5Qcm9kdWN0U2VydmljZRJnChJGaW5kR2xvYmFsUHJvZHVjdHMSJy5pbnZlbnRvcnkudjEuRm'
    'luZEdsb2JhbFByb2R1Y3RzUmVxdWVzdBooLmludmVudG9yeS52MS5GaW5kR2xvYmFsUHJvZHVj'
    'dHNSZXNwb25zZRJVCgxGaW5kQ2F0ZWdvcnkSIS5pbnZlbnRvcnkudjEuRmluZENhdGVnb3J5Um'
    'VxdWVzdBoiLmludmVudG9yeS52MS5GaW5kQ2F0ZWdvcnlSZXNwb25zZRJPCgpBZGRQcm9kdWN0'
    'Eh8uaW52ZW50b3J5LnYxLkFkZFByb2R1Y3RSZXF1ZXN0GiAuaW52ZW50b3J5LnYxLkFkZFByb2'
    'R1Y3RSZXNwb25zZRJPCgpHZXRQcm9kdWN0Eh8uaW52ZW50b3J5LnYxLkdldFByb2R1Y3RSZXF1'
    'ZXN0GiAuaW52ZW50b3J5LnYxLkdldFByb2R1Y3RSZXNwb25zZRJYCg1VcGRhdGVQcm9kdWN0Ei'
    'IuaW52ZW50b3J5LnYxLlVwZGF0ZVByb2R1Y3RSZXF1ZXN0GiMuaW52ZW50b3J5LnYxLlVwZGF0'
    'ZVByb2R1Y3RSZXNwb25zZRJYCg1EZWxldGVQcm9kdWN0EiIuaW52ZW50b3J5LnYxLkRlbGV0ZV'
    'Byb2R1Y3RSZXF1ZXN0GiMuaW52ZW50b3J5LnYxLkRlbGV0ZVByb2R1Y3RSZXNwb25zZRJtChRG'
    'aW5kQnVzaW5lc3NQcm9kdWN0cxIpLmludmVudG9yeS52MS5GaW5kQnVzaW5lc3NQcm9kdWN0c1'
    'JlcXVlc3QaKi5pbnZlbnRvcnkudjEuRmluZEJ1c2luZXNzUHJvZHVjdHNSZXNwb25zZQ==');
