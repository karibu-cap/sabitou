// This is a generated file - do not edit.
//
// Generated from order/v1/invoice.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use orderInvoiceItemDescriptor instead')
const OrderInvoiceItem$json = {
  '1': 'OrderInvoiceItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'product_name', '3': 2, '4': 1, '5': 9, '10': 'productName'},
    {
      '1': 'product_price_in_xaf',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'productPriceInXaf'
    },
    {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    {
      '1': 'invoice_item_total_price_in_xaf',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'invoiceItemTotalPriceInXaf'
    },
  ],
};

/// Descriptor for `OrderInvoiceItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderInvoiceItemDescriptor = $convert.base64Decode(
    'ChBPcmRlckludm9pY2VJdGVtEh0KCnByb2R1Y3RfaWQYASABKAlSCXByb2R1Y3RJZBIhCgxwcm'
    '9kdWN0X25hbWUYAiABKAlSC3Byb2R1Y3ROYW1lEi8KFHByb2R1Y3RfcHJpY2VfaW5feGFmGAMg'
    'ASgJUhFwcm9kdWN0UHJpY2VJblhhZhIaCghxdWFudGl0eRgEIAEoBVIIcXVhbnRpdHkSQwofaW'
    '52b2ljZV9pdGVtX3RvdGFsX3ByaWNlX2luX3hhZhgFIAEoBVIaaW52b2ljZUl0ZW1Ub3RhbFBy'
    'aWNlSW5YYWY=');

@$core.Deprecated('Use orderInvoiceDescriptor instead')
const OrderInvoice$json = {
  '1': 'OrderInvoice',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
    {'1': 'order_status', '3': 2, '4': 1, '5': 9, '10': 'orderStatus'},
    {
      '1': 'order_total_price_in_xaf',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'orderTotalPriceInXaf'
    },
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
      '6': '.order.v1.OrderInvoiceItem',
      '10': 'orderItems'
    },
  ],
};

/// Descriptor for `OrderInvoice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderInvoiceDescriptor = $convert.base64Decode(
    'CgxPcmRlckludm9pY2USGQoIb3JkZXJfaWQYASABKAlSB29yZGVySWQSIQoMb3JkZXJfc3RhdH'
    'VzGAIgASgJUgtvcmRlclN0YXR1cxI2ChhvcmRlcl90b3RhbF9wcmljZV9pbl94YWYYAyABKAlS'
    'FG9yZGVyVG90YWxQcmljZUluWGFmEigKEG9yZGVyX2NyZWF0ZWRfYXQYBCABKAlSDm9yZGVyQ3'
    'JlYXRlZEF0EigKEG9yZGVyX3VwZGF0ZWRfYXQYBSABKAlSDm9yZGVyVXBkYXRlZEF0Ei4KE29y'
    'ZGVyX3Jlc291cmNlX25hbWUYBiABKAlSEW9yZGVyUmVzb3VyY2VOYW1lEjQKFm9yZGVyX3Jlc2'
    '91cmNlX2FkZHJlc3MYByABKAlSFG9yZGVyUmVzb3VyY2VBZGRyZXNzEj0KG29yZGVyX3Jlc291'
    'cmNlX3Bob25lX251bWJlchgIIAEoCVIYb3JkZXJSZXNvdXJjZVBob25lTnVtYmVyEjAKFG9yZG'
    'VyX3Jlc291cmNlX2VtYWlsGAkgASgJUhJvcmRlclJlc291cmNlRW1haWwSPgocb3JkZXJfcmVz'
    'b3VyY2VfbG9nb19tZWRpYV9pZBgKIAEoCVIYb3JkZXJSZXNvdXJjZUxvZ29NZWRpYUlkEjsKC2'
    '9yZGVyX2l0ZW1zGAsgAygLMhoub3JkZXIudjEuT3JkZXJJbnZvaWNlSXRlbVIKb3JkZXJJdGVt'
    'cw==');

@$core.Deprecated('Use generateInvoiceRequestDescriptor instead')
const GenerateInvoiceRequest$json = {
  '1': 'GenerateInvoiceRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '10': 'orderId'},
  ],
};

/// Descriptor for `GenerateInvoiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateInvoiceRequestDescriptor =
    $convert.base64Decode(
        'ChZHZW5lcmF0ZUludm9pY2VSZXF1ZXN0EhkKCG9yZGVyX2lkGAEgASgJUgdvcmRlcklk');

@$core.Deprecated('Use generateInvoiceResponseDescriptor instead')
const GenerateInvoiceResponse$json = {
  '1': 'GenerateInvoiceResponse',
  '2': [
    {
      '1': 'order_invoice',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.OrderInvoice',
      '10': 'orderInvoice'
    },
  ],
};

/// Descriptor for `GenerateInvoiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List generateInvoiceResponseDescriptor =
    $convert.base64Decode(
        'ChdHZW5lcmF0ZUludm9pY2VSZXNwb25zZRI7Cg1vcmRlcl9pbnZvaWNlGAEgASgLMhYub3JkZX'
        'IudjEuT3JkZXJJbnZvaWNlUgxvcmRlckludm9pY2U=');

const $core.Map<$core.String, $core.dynamic> InvoiceServiceBase$json = {
  '1': 'InvoiceService',
  '2': [
    {
      '1': 'GenerateInvoice',
      '2': '.order.v1.GenerateInvoiceRequest',
      '3': '.order.v1.GenerateInvoiceResponse'
    },
  ],
};

@$core.Deprecated('Use invoiceServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    InvoiceServiceBase$messageJson = {
  '.order.v1.GenerateInvoiceRequest': GenerateInvoiceRequest$json,
  '.order.v1.GenerateInvoiceResponse': GenerateInvoiceResponse$json,
  '.order.v1.OrderInvoice': OrderInvoice$json,
  '.order.v1.OrderInvoiceItem': OrderInvoiceItem$json,
};

/// Descriptor for `InvoiceService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List invoiceServiceDescriptor = $convert.base64Decode(
    'Cg5JbnZvaWNlU2VydmljZRJWCg9HZW5lcmF0ZUludm9pY2USIC5vcmRlci52MS5HZW5lcmF0ZU'
    'ludm9pY2VSZXF1ZXN0GiEub3JkZXIudjEuR2VuZXJhdGVJbnZvaWNlUmVzcG9uc2U=');
