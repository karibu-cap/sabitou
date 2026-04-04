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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use paymentStatusDescriptor instead')
const PaymentStatus$json = {
  '1': 'PaymentStatus',
  '2': [
    {'1': 'PAYMENT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PAYMENT_STATUS_PENDING', '2': 1},
    {'1': 'PAYMENT_STATUS_COMPLETED', '2': 2},
    {'1': 'PAYMENT_STATUS_FAILED', '2': 3},
    {'1': 'PAYMENT_STATUS_INITIALIZE', '2': 4},
  ],
};

/// Descriptor for `PaymentStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List paymentStatusDescriptor = $convert.base64Decode(
    'Cg1QYXltZW50U3RhdHVzEh4KGlBBWU1FTlRfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGgoWUEFZTU'
    'VOVF9TVEFUVVNfUEVORElORxABEhwKGFBBWU1FTlRfU1RBVFVTX0NPTVBMRVRFRBACEhkKFVBB'
    'WU1FTlRfU1RBVFVTX0ZBSUxFRBADEh0KGVBBWU1FTlRfU1RBVFVTX0lOSVRJQUxJWkUQBA==');

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
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {'1': 'payer_id', '3': 2, '4': 1, '5': 9, '10': 'payerId'},
    {'1': 'receiver_ref', '3': 3, '4': 1, '5': 9, '10': 'receiverRef'},
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
    {
      '1': 'related_docs',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.PaymentRelatedDoc',
      '10': 'relatedDocs'
    },
  ],
  '8': [
    {'1': '_reference_number'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `Payment`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentDescriptor = $convert.base64Decode(
    'CgdQYXltZW50Eh0KBnJlZl9pZBgBIAEoCUIGukgDyAEBUgVyZWZJZBIZCghwYXllcl9pZBgCIA'
    'EoCVIHcGF5ZXJJZBIhCgxyZWNlaXZlcl9yZWYYAyABKAlSC3JlY2VpdmVyUmVmEhYKBmFtb3Vu'
    'dBgEIAEoAVIGYW1vdW50EhoKCGN1cnJlbmN5GAUgASgJUghjdXJyZW5jeRIhCgx3YXJlaG91c2'
    'VfaWQYBiABKAlSC3dhcmVob3VzZUlkEkEKDnBheW1lbnRfbWV0aG9kGAcgASgOMhoucGF5bWVu'
    'dHMudjEuUGF5bWVudE1ldGhvZFINcGF5bWVudE1ldGhvZBIyCgZzdGF0dXMYCCABKA4yGi5wYX'
    'ltZW50cy52MS5QYXltZW50U3RhdHVzUgZzdGF0dXMSPQoMcGF5bWVudF9kYXRlGAkgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILcGF5bWVudERhdGUSLgoQcmVmZXJlbmNlX251bW'
    'JlchgKIAEoCUgAUg9yZWZlcmVuY2VOdW1iZXKIAQESKwoSY3JlYXRlZF9ieV91c2VyX2lkGAsg'
    'ASgJUg9jcmVhdGVkQnlVc2VySWQSGQoFbm90ZXMYDCABKAlIAVIFbm90ZXOIAQESQQoMcmVsYX'
    'RlZF9kb2NzGA0gAygLMh4ucGF5bWVudHMudjEuUGF5bWVudFJlbGF0ZWREb2NSC3JlbGF0ZWRE'
    'b2NzQhMKEV9yZWZlcmVuY2VfbnVtYmVyQggKBl9ub3Rlcw==');

@$core.Deprecated('Use paymentRelatedDocDescriptor instead')
const PaymentRelatedDoc$json = {
  '1': 'PaymentRelatedDoc',
  '2': [
    {'1': 'doc_id', '3': 1, '4': 1, '5': 9, '10': 'docId'},
    {'1': 'amount', '3': 2, '4': 1, '5': 1, '10': 'amount'},
  ],
};

/// Descriptor for `PaymentRelatedDoc`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List paymentRelatedDocDescriptor = $convert.base64Decode(
    'ChFQYXltZW50UmVsYXRlZERvYxIVCgZkb2NfaWQYASABKAlSBWRvY0lkEhYKBmFtb3VudBgCIA'
    'EoAVIGYW1vdW50');

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

const $core.Map<$core.String, $core.dynamic> PaymentsServiceBase$json = {
  '1': 'PaymentsService',
  '2': [
    {
      '1': 'CreatePayment',
      '2': '.payments.v1.CreatePaymentRequest',
      '3': '.payments.v1.CreatePaymentResponse'
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
  '.payments.v1.PaymentRelatedDoc': PaymentRelatedDoc$json,
};

/// Descriptor for `PaymentsService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List paymentsServiceDescriptor = $convert.base64Decode(
    'Cg9QYXltZW50c1NlcnZpY2USVgoNQ3JlYXRlUGF5bWVudBIhLnBheW1lbnRzLnYxLkNyZWF0ZV'
    'BheW1lbnRSZXF1ZXN0GiIucGF5bWVudHMudjEuQ3JlYXRlUGF5bWVudFJlc3BvbnNl');
