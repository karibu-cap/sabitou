// This is a generated file - do not edit.
//
// Generated from payments/v1/payments.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../financial/v1/financial_utils.pbjson.dart' as $2;
import '../../financial/v1/invoice.pbjson.dart' as $1;
import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import '../../inventory/v1/category.pbjson.dart' as $3;

@$core.Deprecated('Use paymentStatusDescriptor instead')
const PaymentStatus$json = {
  '1': 'PaymentStatus',
  '2': [
    {'1': 'PAYMENT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PAYMENT_STATUS_PENDING', '2': 1},
    {'1': 'PAYMENT_STATUS_COMPLETED', '2': 2},
    {'1': 'PAYMENT_STATUS_FAILED', '2': 3},
  ],
};

/// Descriptor for `PaymentStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paymentStatusDescriptor = $convert.base64Decode(
    'Cg1QYXltZW50U3RhdHVzEh4KGlBBWU1FTlRfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGgoWUEFZTU'
    'VOVF9TVEFUVVNfUEVORElORxABEhwKGFBBWU1FTlRfU1RBVFVTX0NPTVBMRVRFRBACEhkKFVBB'
    'WU1FTlRfU1RBVFVTX0ZBSUxFRBAD');

@$core.Deprecated('Use paymentMethodDescriptor instead')
const PaymentMethod$json = {
  '1': 'PaymentMethod',
  '2': [
    {'1': 'PAYMENT_METHOD_UNSPECIFIED', '2': 0},
    {'1': 'PAYMENT_METHOD_CASH', '2': 1},
    {'1': 'PAYMENT_METHOD_CREDIT_CARD', '2': 2},
    {'1': 'PAYMENT_METHOD_MOBILE_MONEY', '2': 3},
    {'1': 'PAYMENT_METHOD_VOUCHER', '2': 4},
    {'1': 'PAYMENT_METHOD_ORANGE_MONEY', '2': 5},
    {'1': 'PAYMENT_METHOD_MTN_MONEY', '2': 6},
  ],
};

/// Descriptor for `PaymentMethod`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paymentMethodDescriptor = $convert.base64Decode(
    'Cg1QYXltZW50TWV0aG9kEh4KGlBBWU1FTlRfTUVUSE9EX1VOU1BFQ0lGSUVEEAASFwoTUEFZTU'
    'VOVF9NRVRIT0RfQ0FTSBABEh4KGlBBWU1FTlRfTUVUSE9EX0NSRURJVF9DQVJEEAISHwobUEFZ'
    'TUVOVF9NRVRIT0RfTU9CSUxFX01PTkVZEAMSGgoWUEFZTUVOVF9NRVRIT0RfVk9VQ0hFUhAEEh'
    '8KG1BBWU1FTlRfTUVUSE9EX09SQU5HRV9NT05FWRAFEhwKGFBBWU1FTlRfTUVUSE9EX01UTl9N'
    'T05FWRAG');

@$core.Deprecated('Use paymentDescriptor instead')
const Payment$json = {
  '1': 'Payment',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {'1': 'payer_id', '3': 2, '4': 1, '5': 9, '10': 'payerId'},
    {'1': 'receiver', '3': 3, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'amount', '3': 4, '4': 1, '5': 1, '10': 'amount'},
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'warehouse_id', '3': 6, '4': 1, '5': 9, '10': 'warehouseId'},
    {
      '1': 'payment_method',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.PaymentMethod',
      '10': 'paymentMethod'
    },
    {
      '1': 'status',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.PaymentStatus',
      '10': 'status'
    },
    {
      '1': 'payment_date',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'paymentDate'
    },
    {
      '1': 'reference_number',
      '3': 10,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'referenceNumber',
      '17': true
    },
    {
      '1': 'created_by_user_id',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_reference_number'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode(
    'CgdQYXltZW50EicKC2RvY3VtZW50X2lkGAEgASgJQga6SAPIAQFSCmRvY3VtZW50SWQSGQoIcG'
    'F5ZXJfaWQYAiABKAlSB3BheWVySWQSGgoIcmVjZWl2ZXIYAyABKAlSCHJlY2VpdmVyEhYKBmFt'
    'b3VudBgEIAEoAVIGYW1vdW50EhoKCGN1cnJlbmN5GAUgASgJUghjdXJyZW5jeRIhCgx3YXJlaG'
    '91c2VfaWQYBiABKAlSC3dhcmVob3VzZUlkEkEKDnBheW1lbnRfbWV0aG9kGAcgASgOMhoucGF5'
    'bWVudHMudjEuUGF5bWVudE1ldGhvZFINcGF5bWVudE1ldGhvZBIyCgZzdGF0dXMYCCABKA4yGi'
    '5wYXltZW50cy52MS5QYXltZW50U3RhdHVzUgZzdGF0dXMSPQoMcGF5bWVudF9kYXRlGAkgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILcGF5bWVudERhdGUSLgoQcmVmZXJlbmNlX2'
    '51bWJlchgKIAEoCUgAUg9yZWZlcmVuY2VOdW1iZXKIAQESKwoSY3JlYXRlZF9ieV91c2VyX2lk'
    'GAsgASgJUg9jcmVhdGVkQnlVc2VySWQSGQoFbm90ZXMYDCABKAlIAVIFbm90ZXOIAQFCEwoRX3'
    'JlZmVyZW5jZV9udW1iZXJCCAoGX25vdGVz');

@$core.Deprecated('Use createPaymentRequestDescriptor instead')
const CreatePaymentRequest$json = {
  '1': 'CreatePaymentRequest',
  '2': [
    {'1': 'payer_id', '3': 1, '4': 1, '5': 9, '10': 'payerId'},
    {'1': 'receiver', '3': 2, '4': 1, '5': 9, '10': 'receiver'},
    {'1': 'amount', '3': 3, '4': 1, '5': 1, '10': 'amount'},
    {'1': 'currency', '3': 4, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'payment_method',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.PaymentMethod',
      '10': 'paymentMethod'
    },
    {
      '1': 'reference_number',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'referenceNumber',
      '17': true
    },
    {'1': 'notes', '3': 7, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_reference_number'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `CreatePaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVQYXltZW50UmVxdWVzdBIZCghwYXllcl9pZBgBIAEoCVIHcGF5ZXJJZBIaCghyZW'
    'NlaXZlchgCIAEoCVIIcmVjZWl2ZXISFgoGYW1vdW50GAMgASgBUgZhbW91bnQSGgoIY3VycmVu'
    'Y3kYBCABKAlSCGN1cnJlbmN5EkEKDnBheW1lbnRfbWV0aG9kGAUgASgOMhoucGF5bWVudHMudj'
    'EuUGF5bWVudE1ldGhvZFINcGF5bWVudE1ldGhvZBIuChByZWZlcmVuY2VfbnVtYmVyGAYgASgJ'
    'SABSD3JlZmVyZW5jZU51bWJlcogBARIZCgVub3RlcxgHIAEoCUgBUgVub3Rlc4gBAUITChFfcm'
    'VmZXJlbmNlX251bWJlckIICgZfbm90ZXM=');

@$core.Deprecated('Use createPaymentResponseDescriptor instead')
const CreatePaymentResponse$json = {
  '1': 'CreatePaymentResponse',
  '2': [
    {
      '1': 'payment',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.Payment',
      '10': 'payment'
    },
  ],
};

/// Descriptor for `CreatePaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPaymentResponseDescriptor = $convert.base64Decode(
    'ChVDcmVhdGVQYXltZW50UmVzcG9uc2USLgoHcGF5bWVudBgBIAEoCzIULnBheW1lbnRzLnYxLl'
    'BheW1lbnRSB3BheW1lbnQ=');

@$core.Deprecated('Use getPaymentRequestDescriptor instead')
const GetPaymentRequest$json = {
  '1': 'GetPaymentRequest',
  '2': [
    {'1': 'payment_id', '3': 1, '4': 1, '5': 9, '10': 'paymentId'},
  ],
};

/// Descriptor for `GetPaymentRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentRequestDescriptor = $convert.base64Decode(
    'ChFHZXRQYXltZW50UmVxdWVzdBIdCgpwYXltZW50X2lkGAEgASgJUglwYXltZW50SWQ=');

@$core.Deprecated('Use getPaymentResponseDescriptor instead')
const GetPaymentResponse$json = {
  '1': 'GetPaymentResponse',
  '2': [
    {
      '1': 'payment',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.Payment',
      '10': 'payment'
    },
    {
      '1': 'related_invoice',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.financial.v1.Invoice',
      '10': 'relatedInvoice'
    },
  ],
};

/// Descriptor for `GetPaymentResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPaymentResponseDescriptor = $convert.base64Decode(
    'ChJHZXRQYXltZW50UmVzcG9uc2USLgoHcGF5bWVudBgBIAEoCzIULnBheW1lbnRzLnYxLlBheW'
    '1lbnRSB3BheW1lbnQSPgoPcmVsYXRlZF9pbnZvaWNlGAIgASgLMhUuZmluYW5jaWFsLnYxLklu'
    'dm9pY2VSDnJlbGF0ZWRJbnZvaWNl');

@$core.Deprecated('Use listPaymentsRequestDescriptor instead')
const ListPaymentsRequest$json = {
  '1': 'ListPaymentsRequest',
  '2': [
    {'1': 'warehouse_id', '3': 1, '4': 1, '5': 9, '10': 'warehouseId'},
    {
      '1': 'start_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
    {'1': 'page_size', '3': 4, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_number', '3': 5, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
};

/// Descriptor for `ListPaymentsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPaymentsRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0UGF5bWVudHNSZXF1ZXN0EiEKDHdhcmVob3VzZV9pZBgBIAEoCVILd2FyZWhvdXNlSW'
    'QSOQoKc3RhcnRfZGF0ZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0YXJ0'
    'RGF0ZRI1CghlbmRfZGF0ZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2VuZE'
    'RhdGUSGwoJcGFnZV9zaXplGAQgASgFUghwYWdlU2l6ZRIfCgtwYWdlX251bWJlchgFIAEoBVIK'
    'cGFnZU51bWJlcg==');

@$core.Deprecated('Use listPaymentsResponseDescriptor instead')
const ListPaymentsResponse$json = {
  '1': 'ListPaymentsResponse',
  '2': [
    {
      '1': 'payments',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.Payment',
      '10': 'payments'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'total_amount', '3': 3, '4': 1, '5': 1, '10': 'totalAmount'},
  ],
};

/// Descriptor for `ListPaymentsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPaymentsResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0UGF5bWVudHNSZXNwb25zZRIwCghwYXltZW50cxgBIAMoCzIULnBheW1lbnRzLnYxLl'
    'BheW1lbnRSCHBheW1lbnRzEh8KC3RvdGFsX2NvdW50GAIgASgFUgp0b3RhbENvdW50EiEKDHRv'
    'dGFsX2Ftb3VudBgDIAEoAVILdG90YWxBbW91bnQ=');

const $core.Map<$core.String, $core.dynamic> PaymentsServiceBase$json = {
  '1': 'PaymentsService',
  '2': [
    {
      '1': 'CreatePayment',
      '2': '.payments.v1.CreatePaymentRequest',
      '3': '.payments.v1.CreatePaymentResponse'
    },
    {
      '1': 'GetPayment',
      '2': '.payments.v1.GetPaymentRequest',
      '3': '.payments.v1.GetPaymentResponse'
    },
    {
      '1': 'ListPayments',
      '2': '.payments.v1.ListPaymentsRequest',
      '3': '.payments.v1.ListPaymentsResponse'
    },
  ],
};

@$core.Deprecated('Use paymentsServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PaymentsServiceBase$messageJson = {
  '.payments.v1.CreatePaymentRequest': CreatePaymentRequest$json,
  '.payments.v1.CreatePaymentResponse': CreatePaymentResponse$json,
  '.payments.v1.Payment': Payment$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.payments.v1.GetPaymentRequest': GetPaymentRequest$json,
  '.payments.v1.GetPaymentResponse': GetPaymentResponse$json,
  '.financial.v1.Invoice': $1.Invoice$json,
  '.financial.v1.InvoiceLineItem': $2.InvoiceLineItem$json,
  '.inventory.v1.Internationalized': $3.Internationalized$json,
  '.payments.v1.ListPaymentsRequest': ListPaymentsRequest$json,
  '.payments.v1.ListPaymentsResponse': ListPaymentsResponse$json,
};

/// Descriptor for `PaymentsService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List paymentsServiceDescriptor = $convert.base64Decode(
    'Cg9QYXltZW50c1NlcnZpY2USVgoNQ3JlYXRlUGF5bWVudBIhLnBheW1lbnRzLnYxLkNyZWF0ZV'
    'BheW1lbnRSZXF1ZXN0GiIucGF5bWVudHMudjEuQ3JlYXRlUGF5bWVudFJlc3BvbnNlEk0KCkdl'
    'dFBheW1lbnQSHi5wYXltZW50cy52MS5HZXRQYXltZW50UmVxdWVzdBofLnBheW1lbnRzLnYxLk'
    'dldFBheW1lbnRSZXNwb25zZRJTCgxMaXN0UGF5bWVudHMSIC5wYXltZW50cy52MS5MaXN0UGF5'
    'bWVudHNSZXF1ZXN0GiEucGF5bWVudHMudjEuTGlzdFBheW1lbnRzUmVzcG9uc2U=');
