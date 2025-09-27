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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import 'order.pbjson.dart' as $1;

@$core.Deprecated('Use invoiceStatusDescriptor instead')
const InvoiceStatus$json = {
  '1': 'InvoiceStatus',
  '2': [
    {'1': 'INVOICE_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'INVOICE_STATUS_PAID', '2': 1},
    {'1': 'INVOICE_STATUS_PENDING_REFUND', '2': 2},
    {'1': 'INVOICE_STATUS_REFUNDED', '2': 3},
  ],
};

/// Descriptor for `InvoiceStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List invoiceStatusDescriptor = $convert.base64Decode(
    'Cg1JbnZvaWNlU3RhdHVzEh4KGklOVk9JQ0VfU1RBVFVTX1VOU1BFQ0lGSUVEEAASFwoTSU5WT0'
    'lDRV9TVEFUVVNfUEFJRBABEiEKHUlOVk9JQ0VfU1RBVFVTX1BFTkRJTkdfUkVGVU5EEAISGwoX'
    'SU5WT0lDRV9TVEFUVVNfUkVGVU5ERUQQAw==');

@$core.Deprecated('Use paymentMethodDescriptor instead')
const PaymentMethod$json = {
  '1': 'PaymentMethod',
  '2': [
    {'1': 'PAYMENT_METHOD_UNSPECIFIED', '2': 0},
    {'1': 'PAYMENT_METHOD_CASH', '2': 1},
    {'1': 'PAYMENT_METHOD_CARD', '2': 2},
    {'1': 'PAYMENT_METHOD_ORANGE_MONEY', '2': 3},
    {'1': 'PAYMENT_METHOD_MTN_MONEY', '2': 4},
    {'1': 'PAYMENT_METHOD_VOUCHER', '2': 5},
    {'1': 'PAYMENT_METHOD_MOBILE', '2': 6},
  ],
};

/// Descriptor for `PaymentMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paymentMethodDescriptor = $convert.base64Decode(
    'Cg1QYXltZW50TWV0aG9kEh4KGlBBWU1FTlRfTUVUSE9EX1VOU1BFQ0lGSUVEEAASFwoTUEFZTU'
    'VOVF9NRVRIT0RfQ0FTSBABEhcKE1BBWU1FTlRfTUVUSE9EX0NBUkQQAhIfChtQQVlNRU5UX01F'
    'VEhPRF9PUkFOR0VfTU9ORVkQAxIcChhQQVlNRU5UX01FVEhPRF9NVE5fTU9ORVkQBBIaChZQQV'
    'lNRU5UX01FVEhPRF9WT1VDSEVSEAUSGQoVUEFZTUVOVF9NRVRIT0RfTU9CSUxFEAY=');

@$core.Deprecated('Use paymentDescriptor instead')
const Payment$json = {
  '1': 'Payment',
  '2': [
    {'1': 'amount', '3': 1, '4': 1, '5': 1, '10': 'amount'},
    {
      '1': 'method',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.order.v1.PaymentMethod',
      '10': 'method'
    },
    {
      '1': 'reference_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'referenceId',
      '17': true
    },
    {
      '1': 'timestamp',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'timestamp'
    },
  ],
  '8': [
    {'1': '_reference_id'},
  ],
};

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode(
    'CgdQYXltZW50EhYKBmFtb3VudBgBIAEoAVIGYW1vdW50Ei8KBm1ldGhvZBgCIAEoDjIXLm9yZG'
    'VyLnYxLlBheW1lbnRNZXRob2RSBm1ldGhvZBImCgxyZWZlcmVuY2VfaWQYAyABKAlIAFILcmVm'
    'ZXJlbmNlSWSIAQESOAoJdGltZXN0YW1wGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIJdGltZXN0YW1wQg8KDV9yZWZlcmVuY2VfaWQ=');

@$core.Deprecated('Use invoiceDescriptor instead')
const Invoice$json = {
  '1': 'Invoice',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {
      '1': 'order_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'orderId',
      '17': true
    },
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.order.v1.InvoiceStatus',
      '10': 'status'
    },
    {
      '1': 'order_items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.order.v1.OrderItem',
      '10': 'orderItems'
    },
    {
      '1': 'payments',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.order.v1.Payment',
      '10': 'payments'
    },
    {'1': 'total_discount', '3': 6, '4': 1, '5': 1, '10': 'totalDiscount'},
    {'1': 'total_vat', '3': 7, '4': 1, '5': 1, '10': 'totalVat'},
    {'1': 'subtotal', '3': 8, '4': 1, '5': 1, '10': 'subtotal'},
    {'1': 'total', '3': 9, '4': 1, '5': 1, '10': 'total'},
    {
      '1': 'customer_tendered_amount',
      '3': 10,
      '4': 1,
      '5': 1,
      '10': 'customerTenderedAmount'
    },
    {'1': 'change_given', '3': 11, '4': 1, '5': 1, '10': 'changeGiven'},
    {'1': 'balance_due', '3': 12, '4': 1, '5': 1, '10': 'balanceDue'},
    {
      '1': 'voucher_id',
      '3': 13,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 1,
      '10': 'voucherId',
      '17': true
    },
    {
      '1': 'created_at',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'delivery_date',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'deliveryDate'
    },
    {'1': 'store_id', '3': 16, '4': 1, '5': 9, '10': 'storeId'},
  ],
  '8': [
    {'1': '_order_id'},
    {'1': '_voucher_id'},
  ],
};

/// Descriptor for `Invoice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceDescriptor = $convert.base64Decode(
    'CgdJbnZvaWNlEiIKBnJlZl9pZBgBIAEoCUILukgIyAEBcgOwAQFSBXJlZklkEh4KCG9yZGVyX2'
    'lkGAIgASgJSABSB29yZGVySWSIAQESLwoGc3RhdHVzGAMgASgOMhcub3JkZXIudjEuSW52b2lj'
    'ZVN0YXR1c1IGc3RhdHVzEjQKC29yZGVyX2l0ZW1zGAQgAygLMhMub3JkZXIudjEuT3JkZXJJdG'
    'VtUgpvcmRlckl0ZW1zEi0KCHBheW1lbnRzGAUgAygLMhEub3JkZXIudjEuUGF5bWVudFIIcGF5'
    'bWVudHMSJQoOdG90YWxfZGlzY291bnQYBiABKAFSDXRvdGFsRGlzY291bnQSGwoJdG90YWxfdm'
    'F0GAcgASgBUgh0b3RhbFZhdBIaCghzdWJ0b3RhbBgIIAEoAVIIc3VidG90YWwSFAoFdG90YWwY'
    'CSABKAFSBXRvdGFsEjgKGGN1c3RvbWVyX3RlbmRlcmVkX2Ftb3VudBgKIAEoAVIWY3VzdG9tZX'
    'JUZW5kZXJlZEFtb3VudBIhCgxjaGFuZ2VfZ2l2ZW4YCyABKAFSC2NoYW5nZUdpdmVuEh8KC2Jh'
    'bGFuY2VfZHVlGAwgASgBUgpiYWxhbmNlRHVlEiwKCnZvdWNoZXJfaWQYDSABKAlCCLpIBXIDsA'
    'EBSAFSCXZvdWNoZXJJZIgBARI5CgpjcmVhdGVkX2F0GA4gASgLMhouZ29vZ2xlLnByb3RvYnVm'
    'LlRpbWVzdGFtcFIJY3JlYXRlZEF0Ej8KDWRlbGl2ZXJ5X2RhdGUYDyABKAsyGi5nb29nbGUucH'
    'JvdG9idWYuVGltZXN0YW1wUgxkZWxpdmVyeURhdGUSGQoIc3RvcmVfaWQYECABKAlSB3N0b3Jl'
    'SWRCCwoJX29yZGVyX2lkQg0KC192b3VjaGVyX2lk');

@$core.Deprecated('Use createInvoiceRequestDescriptor instead')
const CreateInvoiceRequest$json = {
  '1': 'CreateInvoiceRequest',
  '2': [
    {
      '1': 'invoice',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.Invoice',
      '10': 'invoice'
    },
  ],
};

/// Descriptor for `CreateInvoiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInvoiceRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVJbnZvaWNlUmVxdWVzdBIrCgdpbnZvaWNlGAEgASgLMhEub3JkZXIudjEuSW52b2'
    'ljZVIHaW52b2ljZQ==');

@$core.Deprecated('Use createInvoiceResponseDescriptor instead')
const CreateInvoiceResponse$json = {
  '1': 'CreateInvoiceResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '10': 'error'},
  ],
};

/// Descriptor for `CreateInvoiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInvoiceResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVJbnZvaWNlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIUCgVlcn'
    'JvchgCIAEoCVIFZXJyb3I=');

@$core.Deprecated('Use updateInvoiceRequestDescriptor instead')
const UpdateInvoiceRequest$json = {
  '1': 'UpdateInvoiceRequest',
  '2': [
    {
      '1': 'invoice',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.Invoice',
      '10': 'invoice'
    },
  ],
};

/// Descriptor for `UpdateInvoiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInvoiceRequestDescriptor = $convert.base64Decode(
    'ChRVcGRhdGVJbnZvaWNlUmVxdWVzdBIrCgdpbnZvaWNlGAEgASgLMhEub3JkZXIudjEuSW52b2'
    'ljZVIHaW52b2ljZQ==');

@$core.Deprecated('Use updateInvoiceResponseDescriptor instead')
const UpdateInvoiceResponse$json = {
  '1': 'UpdateInvoiceResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateInvoiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateInvoiceResponseDescriptor =
    $convert.base64Decode(
        'ChVVcGRhdGVJbnZvaWNlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw==');

@$core.Deprecated('Use findInvoiceRequestDescriptor instead')
const FindInvoiceRequest$json = {
  '1': 'FindInvoiceRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
  ],
};

/// Descriptor for `FindInvoiceRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findInvoiceRequestDescriptor =
    $convert.base64Decode(
        'ChJGaW5kSW52b2ljZVJlcXVlc3QSGQoIc3RvcmVfaWQYASABKAlSB3N0b3JlSWQ=');

@$core.Deprecated('Use findInvoiceResponseDescriptor instead')
const FindInvoiceResponse$json = {
  '1': 'FindInvoiceResponse',
  '2': [
    {
      '1': 'invoices',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.order.v1.Invoice',
      '10': 'invoices'
    },
  ],
};

/// Descriptor for `FindInvoiceResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findInvoiceResponseDescriptor = $convert.base64Decode(
    'ChNGaW5kSW52b2ljZVJlc3BvbnNlEi0KCGludm9pY2VzGAEgAygLMhEub3JkZXIudjEuSW52b2'
    'ljZVIIaW52b2ljZXM=');

const $core.Map<$core.String, $core.dynamic> InvoiceServiceBase$json = {
  '1': 'InvoiceService',
  '2': [
    {
      '1': 'CreateInvoice',
      '2': '.order.v1.CreateInvoiceRequest',
      '3': '.order.v1.CreateInvoiceResponse'
    },
    {
      '1': 'UpdateInvoice',
      '2': '.order.v1.UpdateInvoiceRequest',
      '3': '.order.v1.UpdateInvoiceResponse'
    },
    {
      '1': 'FindInvoices',
      '2': '.order.v1.FindInvoiceRequest',
      '3': '.order.v1.FindInvoiceResponse'
    },
  ],
};

@$core.Deprecated('Use invoiceServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    InvoiceServiceBase$messageJson = {
  '.order.v1.CreateInvoiceRequest': CreateInvoiceRequest$json,
  '.order.v1.Invoice': Invoice$json,
  '.order.v1.OrderItem': $1.OrderItem$json,
  '.order.v1.Payment': Payment$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.order.v1.CreateInvoiceResponse': CreateInvoiceResponse$json,
  '.order.v1.UpdateInvoiceRequest': UpdateInvoiceRequest$json,
  '.order.v1.UpdateInvoiceResponse': UpdateInvoiceResponse$json,
  '.order.v1.FindInvoiceRequest': FindInvoiceRequest$json,
  '.order.v1.FindInvoiceResponse': FindInvoiceResponse$json,
};

/// Descriptor for `InvoiceService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List invoiceServiceDescriptor = $convert.base64Decode(
    'Cg5JbnZvaWNlU2VydmljZRJQCg1DcmVhdGVJbnZvaWNlEh4ub3JkZXIudjEuQ3JlYXRlSW52b2'
    'ljZVJlcXVlc3QaHy5vcmRlci52MS5DcmVhdGVJbnZvaWNlUmVzcG9uc2USUAoNVXBkYXRlSW52'
    'b2ljZRIeLm9yZGVyLnYxLlVwZGF0ZUludm9pY2VSZXF1ZXN0Gh8ub3JkZXIudjEuVXBkYXRlSW'
    '52b2ljZVJlc3BvbnNlEksKDEZpbmRJbnZvaWNlcxIcLm9yZGVyLnYxLkZpbmRJbnZvaWNlUmVx'
    'dWVzdBodLm9yZGVyLnYxLkZpbmRJbnZvaWNlUmVzcG9uc2U=');
