//
//  Generated code. Do not modify.
//  source: order/v1/receipt.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use orderReceiptItemDescriptor instead')
const OrderReceiptItem$json = {
  '1': 'OrderReceiptItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'product_name', '3': 2, '4': 1, '5': 9, '10': 'productName'},
    {'1': 'product_price_in_cents', '3': 3, '4': 1, '5': 9, '10': 'productPriceInCents'},
    {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'receipt_item_total_price_in_cents', '3': 5, '4': 1, '5': 5, '10': 'receiptItemTotalPriceInCents'},
  ],
};

/// Descriptor for `OrderReceiptItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderReceiptItemDescriptor = $convert.base64Decode(
    'ChBPcmRlclJlY2VpcHRJdGVtEh0KCnByb2R1Y3RfaWQYASABKAlSCXByb2R1Y3RJZBIhCgxwcm'
    '9kdWN0X25hbWUYAiABKAlSC3Byb2R1Y3ROYW1lEjMKFnByb2R1Y3RfcHJpY2VfaW5fY2VudHMY'
    'AyABKAlSE3Byb2R1Y3RQcmljZUluQ2VudHMSGgoIcXVhbnRpdHkYBCABKAVSCHF1YW50aXR5Ek'
    'cKIXJlY2VpcHRfaXRlbV90b3RhbF9wcmljZV9pbl9jZW50cxgFIAEoBVIccmVjZWlwdEl0ZW1U'
    'b3RhbFByaWNlSW5DZW50cw==');

@$core.Deprecated('Use orderReceiptDescriptor instead')
const OrderReceipt$json = {
  '1': 'OrderReceipt',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
    {'1': 'order_status', '3': 2, '4': 1, '5': 9, '10': 'orderStatus'},
    {'1': 'order_total_price_in_cents', '3': 3, '4': 1, '5': 9, '10': 'orderTotalPriceInCents'},
    {'1': 'order_created_at', '3': 4, '4': 1, '5': 9, '10': 'orderCreatedAt'},
    {'1': 'order_updated_at', '3': 5, '4': 1, '5': 9, '10': 'orderUpdatedAt'},
    {'1': 'order_resource_name', '3': 6, '4': 1, '5': 9, '10': 'orderResourceName'},
    {'1': 'order_resource_address', '3': 7, '4': 1, '5': 9, '10': 'orderResourceAddress'},
    {'1': 'order_resource_phone_number', '3': 8, '4': 1, '5': 9, '10': 'orderResourcePhoneNumber'},
    {'1': 'order_resource_email', '3': 9, '4': 1, '5': 9, '10': 'orderResourceEmail'},
    {'1': 'order_resource_logo_media_id', '3': 10, '4': 1, '5': 9, '10': 'orderResourceLogoMediaId'},
    {'1': 'order_items', '3': 11, '4': 3, '5': 11, '6': '.order.v1.OrderReceiptItem', '10': 'orderItems'},
  ],
};

/// Descriptor for `OrderReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderReceiptDescriptor = $convert.base64Decode(
    'CgxPcmRlclJlY2VpcHQSGQoIb3JkZXJfaWQYASABKAlSB29yZGVySWQSIQoMb3JkZXJfc3RhdH'
    'VzGAIgASgJUgtvcmRlclN0YXR1cxI6ChpvcmRlcl90b3RhbF9wcmljZV9pbl9jZW50cxgDIAEo'
    'CVIWb3JkZXJUb3RhbFByaWNlSW5DZW50cxIoChBvcmRlcl9jcmVhdGVkX2F0GAQgASgJUg5vcm'
    'RlckNyZWF0ZWRBdBIoChBvcmRlcl91cGRhdGVkX2F0GAUgASgJUg5vcmRlclVwZGF0ZWRBdBIu'
    'ChNvcmRlcl9yZXNvdXJjZV9uYW1lGAYgASgJUhFvcmRlclJlc291cmNlTmFtZRI0ChZvcmRlcl'
    '9yZXNvdXJjZV9hZGRyZXNzGAcgASgJUhRvcmRlclJlc291cmNlQWRkcmVzcxI9ChtvcmRlcl9y'
    'ZXNvdXJjZV9waG9uZV9udW1iZXIYCCABKAlSGG9yZGVyUmVzb3VyY2VQaG9uZU51bWJlchIwCh'
    'RvcmRlcl9yZXNvdXJjZV9lbWFpbBgJIAEoCVISb3JkZXJSZXNvdXJjZUVtYWlsEj4KHG9yZGVy'
    'X3Jlc291cmNlX2xvZ29fbWVkaWFfaWQYCiABKAlSGG9yZGVyUmVzb3VyY2VMb2dvTWVkaWFJZB'
    'I7CgtvcmRlcl9pdGVtcxgLIAMoCzIaLm9yZGVyLnYxLk9yZGVyUmVjZWlwdEl0ZW1SCm9yZGVy'
    'SXRlbXM=');

@$core.Deprecated('Use generateBillingRequestDescriptor instead')
const GenerateBillingRequest$json = {
  '1': 'GenerateBillingRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
  ],
};

/// Descriptor for `GenerateBillingRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateBillingRequestDescriptor = $convert.base64Decode(
    'ChZHZW5lcmF0ZUJpbGxpbmdSZXF1ZXN0EhkKCG9yZGVyX2lkGAEgASgJUgdvcmRlcklk');

@$core.Deprecated('Use generateBillingResponseDescriptor instead')
const GenerateBillingResponse$json = {
  '1': 'GenerateBillingResponse',
  '2': [
    {'1': 'order_receipt', '3': 1, '4': 1, '5': 11, '6': '.order.v1.OrderReceipt', '10': 'orderReceipt'},
  ],
};

/// Descriptor for `GenerateBillingResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateBillingResponseDescriptor = $convert.base64Decode(
    'ChdHZW5lcmF0ZUJpbGxpbmdSZXNwb25zZRI7Cg1vcmRlcl9yZWNlaXB0GAEgASgLMhYub3JkZX'
    'IudjEuT3JkZXJSZWNlaXB0UgxvcmRlclJlY2VpcHQ=');

const $core.Map<$core.String, $core.dynamic> BillingServiceBase$json = {
  '1': 'BillingService',
  '2': [
    {'1': 'GenerateBilling', '2': '.order.v1.GenerateBillingRequest', '3': '.order.v1.GenerateBillingResponse'},
  ],
};

@$core.Deprecated('Use billingServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> BillingServiceBase$messageJson = {
  '.order.v1.GenerateBillingRequest': GenerateBillingRequest$json,
  '.order.v1.GenerateBillingResponse': GenerateBillingResponse$json,
  '.order.v1.OrderReceipt': OrderReceipt$json,
  '.order.v1.OrderReceiptItem': OrderReceiptItem$json,
};

/// Descriptor for `BillingService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List billingServiceDescriptor = $convert.base64Decode(
    'Cg5CaWxsaW5nU2VydmljZRJWCg9HZW5lcmF0ZUJpbGxpbmcSIC5vcmRlci52MS5HZW5lcmF0ZU'
    'JpbGxpbmdSZXF1ZXN0GiEub3JkZXIudjEuR2VuZXJhdGVCaWxsaW5nUmVzcG9uc2U=');

