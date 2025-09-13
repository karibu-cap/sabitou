// This is a generated file - do not edit.
//
// Generated from order/v1/receipt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use orderReceiptItemDescriptor instead')
const OrderReceiptItem$json = {
  '1': 'OrderReceiptItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'product_name', '3': 2, '4': 1, '5': 9, '10': 'productName'},
    {'1': 'product_price', '3': 3, '4': 1, '5': 9, '10': 'productPrice'},
    {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    {
      '1': 'receipt_item_total_price',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'receiptItemTotalPrice'
    },
  ],
};

/// Descriptor for `OrderReceiptItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderReceiptItemDescriptor = $convert.base64Decode(
    'ChBPcmRlclJlY2VpcHRJdGVtEh0KCnByb2R1Y3RfaWQYASABKAlSCXByb2R1Y3RJZBIhCgxwcm'
    '9kdWN0X25hbWUYAiABKAlSC3Byb2R1Y3ROYW1lEiMKDXByb2R1Y3RfcHJpY2UYAyABKAlSDHBy'
    'b2R1Y3RQcmljZRIaCghxdWFudGl0eRgEIAEoBVIIcXVhbnRpdHkSNwoYcmVjZWlwdF9pdGVtX3'
    'RvdGFsX3ByaWNlGAUgASgFUhVyZWNlaXB0SXRlbVRvdGFsUHJpY2U=');

@$core.Deprecated('Use orderReceiptDescriptor instead')
const OrderReceipt$json = {
  '1': 'OrderReceipt',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
    {'1': 'order_status', '3': 2, '4': 1, '5': 9, '10': 'orderStatus'},
    {'1': 'order_total_price', '3': 3, '4': 1, '5': 9, '10': 'orderTotalPrice'},
    {'1': 'order_created_at', '3': 4, '4': 1, '5': 9, '10': 'orderCreatedAt'},
    {'1': 'order_updated_at', '3': 5, '4': 1, '5': 9, '10': 'orderUpdatedAt'},
    {
      '1': 'order_resource_name',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'orderResourceName'
    },
    {
      '1': 'order_resource_address',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'orderResourceAddress'
    },
    {
      '1': 'order_resource_phone_number',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'orderResourcePhoneNumber'
    },
    {
      '1': 'order_resource_email',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'orderResourceEmail'
    },
    {
      '1': 'order_resource_logo_media_id',
      '3': 10,
      '4': 1,
      '5': 9,
      '10': 'orderResourceLogoMediaId'
    },
    {
      '1': 'order_items',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.order.v1.OrderReceiptItem',
      '10': 'orderItems'
    },
  ],
};

/// Descriptor for `OrderReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderReceiptDescriptor = $convert.base64Decode(
    'CgxPcmRlclJlY2VpcHQSGQoIb3JkZXJfaWQYASABKAlSB29yZGVySWQSIQoMb3JkZXJfc3RhdH'
    'VzGAIgASgJUgtvcmRlclN0YXR1cxIqChFvcmRlcl90b3RhbF9wcmljZRgDIAEoCVIPb3JkZXJU'
    'b3RhbFByaWNlEigKEG9yZGVyX2NyZWF0ZWRfYXQYBCABKAlSDm9yZGVyQ3JlYXRlZEF0EigKEG'
    '9yZGVyX3VwZGF0ZWRfYXQYBSABKAlSDm9yZGVyVXBkYXRlZEF0Ei4KE29yZGVyX3Jlc291cmNl'
    'X25hbWUYBiABKAlSEW9yZGVyUmVzb3VyY2VOYW1lEjQKFm9yZGVyX3Jlc291cmNlX2FkZHJlc3'
    'MYByABKAlSFG9yZGVyUmVzb3VyY2VBZGRyZXNzEj0KG29yZGVyX3Jlc291cmNlX3Bob25lX251'
    'bWJlchgIIAEoCVIYb3JkZXJSZXNvdXJjZVBob25lTnVtYmVyEjAKFG9yZGVyX3Jlc291cmNlX2'
    'VtYWlsGAkgASgJUhJvcmRlclJlc291cmNlRW1haWwSPgocb3JkZXJfcmVzb3VyY2VfbG9nb19t'
    'ZWRpYV9pZBgKIAEoCVIYb3JkZXJSZXNvdXJjZUxvZ29NZWRpYUlkEjsKC29yZGVyX2l0ZW1zGA'
    'sgAygLMhoub3JkZXIudjEuT3JkZXJSZWNlaXB0SXRlbVIKb3JkZXJJdGVtcw==');

@$core.Deprecated('Use generateBillingRequestDescriptor instead')
const GenerateBillingRequest$json = {
  '1': 'GenerateBillingRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
  ],
};

/// Descriptor for `GenerateBillingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateBillingRequestDescriptor =
    $convert.base64Decode(
        'ChZHZW5lcmF0ZUJpbGxpbmdSZXF1ZXN0EhkKCG9yZGVyX2lkGAEgASgJUgdvcmRlcklk');

@$core.Deprecated('Use generateBillingResponseDescriptor instead')
const GenerateBillingResponse$json = {
  '1': 'GenerateBillingResponse',
  '2': [
    {
      '1': 'order_receipt',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.OrderReceipt',
      '10': 'orderReceipt'
    },
  ],
};

/// Descriptor for `GenerateBillingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateBillingResponseDescriptor =
    $convert.base64Decode(
        'ChdHZW5lcmF0ZUJpbGxpbmdSZXNwb25zZRI7Cg1vcmRlcl9yZWNlaXB0GAEgASgLMhYub3JkZX'
        'IudjEuT3JkZXJSZWNlaXB0UgxvcmRlclJlY2VpcHQ=');

const $core.Map<$core.String, $core.dynamic> BillingServiceBase$json = {
  '1': 'BillingService',
  '2': [
    {
      '1': 'GenerateBilling',
      '2': '.order.v1.GenerateBillingRequest',
      '3': '.order.v1.GenerateBillingResponse'
    },
  ],
};

@$core.Deprecated('Use billingServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    BillingServiceBase$messageJson = {
  '.order.v1.GenerateBillingRequest': GenerateBillingRequest$json,
  '.order.v1.GenerateBillingResponse': GenerateBillingResponse$json,
  '.order.v1.OrderReceipt': OrderReceipt$json,
  '.order.v1.OrderReceiptItem': OrderReceiptItem$json,
};

/// Descriptor for `BillingService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List billingServiceDescriptor = $convert.base64Decode(
    'Cg5CaWxsaW5nU2VydmljZRJWCg9HZW5lcmF0ZUJpbGxpbmcSIC5vcmRlci52MS5HZW5lcmF0ZU'
    'JpbGxpbmdSZXF1ZXN0GiEub3JkZXIudjEuR2VuZXJhdGVCaWxsaW5nUmVzcG9uc2U=');
