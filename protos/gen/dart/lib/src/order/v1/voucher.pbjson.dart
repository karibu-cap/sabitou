// This is a generated file - do not edit.
//
// Generated from order/v1/voucher.proto.

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

@$core.Deprecated('Use voucherStatusDescriptor instead')
const VoucherStatus$json = {
  '1': 'VoucherStatus',
  '2': [
    {'1': 'VOUCHER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'VOUCHER_STATUS_ISSUED', '2': 1},
    {'1': 'VOUCHER_STATUS_REDEEMED', '2': 2},
    {'1': 'VOUCHER_STATUS_EXPIRED', '2': 3},
  ],
};

/// Descriptor for `VoucherStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List voucherStatusDescriptor = $convert.base64Decode(
    'Cg1Wb3VjaGVyU3RhdHVzEh4KGlZPVUNIRVJfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGQoVVk9VQ0'
    'hFUl9TVEFUVVNfSVNTVUVEEAESGwoXVk9VQ0hFUl9TVEFUVVNfUkVERUVNRUQQAhIaChZWT1VD'
    'SEVSX1NUQVRVU19FWFBJUkVEEAM=');

@$core.Deprecated('Use voucherDescriptor instead')
const Voucher$json = {
  '1': 'Voucher',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {'1': 'order_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'orderId'},
    {'1': 'invoice_id', '3': 3, '4': 1, '5': 9, '8': {}, '10': 'invoiceId'},
    {'1': 'store_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {'1': 'amount', '3': 5, '4': 1, '5': 1, '10': 'amount'},
    {
      '1': 'created_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'expiry_date',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expiryDate'
    },
    {
      '1': 'status',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.order.v1.VoucherStatus',
      '10': 'status'
    },
    {
      '1': 'redeemed_by_reference_id',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'redeemedByReferenceId',
      '17': true
    },
    {
      '1': 'redeemed_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'redeemedAt',
      '17': true
    },
    {
      '1': 'additional_info',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'additionalInfo',
      '17': true
    },
  ],
  '8': [
    {'1': '_redeemed_by_reference_id'},
    {'1': '_redeemed_at'},
    {'1': '_additional_info'},
  ],
};

/// Descriptor for `Voucher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voucherDescriptor = $convert.base64Decode(
    'CgdWb3VjaGVyEiIKBnJlZl9pZBgBIAEoCUILukgIyAEBcgOwAQFSBXJlZklkEiYKCG9yZGVyX2'
    'lkGAIgASgJQgu6SAjIAQFyA7ABAVIHb3JkZXJJZBIqCgppbnZvaWNlX2lkGAMgASgJQgu6SAjI'
    'AQFyA7ABAVIJaW52b2ljZUlkEiYKCHN0b3JlX2lkGAQgASgJQgu6SAjIAQFyA7ABAVIHc3Rvcm'
    'VJZBIWCgZhbW91bnQYBSABKAFSBmFtb3VudBI5CgpjcmVhdGVkX2F0GAYgASgLMhouZ29vZ2xl'
    'LnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EjsKC2V4cGlyeV9kYXRlGAcgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKZXhwaXJ5RGF0ZRIvCgZzdGF0dXMYCCABKA4yFy5v'
    'cmRlci52MS5Wb3VjaGVyU3RhdHVzUgZzdGF0dXMSPAoYcmVkZWVtZWRfYnlfcmVmZXJlbmNlX2'
    'lkGAkgASgJSABSFXJlZGVlbWVkQnlSZWZlcmVuY2VJZIgBARJACgtyZWRlZW1lZF9hdBgKIAEo'
    'CzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAVIKcmVkZWVtZWRBdIgBARIsCg9hZGRpdG'
    'lvbmFsX2luZm8YCyABKAlIAlIOYWRkaXRpb25hbEluZm+IAQFCGwoZX3JlZGVlbWVkX2J5X3Jl'
    'ZmVyZW5jZV9pZEIOCgxfcmVkZWVtZWRfYXRCEgoQX2FkZGl0aW9uYWxfaW5mbw==');

@$core.Deprecated('Use createVoucherRequestDescriptor instead')
const CreateVoucherRequest$json = {
  '1': 'CreateVoucherRequest',
  '2': [
    {
      '1': 'voucher',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.Voucher',
      '10': 'voucher'
    },
  ],
};

/// Descriptor for `CreateVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createVoucherRequestDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVWb3VjaGVyUmVxdWVzdBIrCgd2b3VjaGVyGAEgASgLMhEub3JkZXIudjEuVm91Y2'
    'hlclIHdm91Y2hlcg==');

@$core.Deprecated('Use createVoucherResponseDescriptor instead')
const CreateVoucherResponse$json = {
  '1': 'CreateVoucherResponse',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '10': 'refId'},
  ],
};

/// Descriptor for `CreateVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createVoucherResponseDescriptor =
    $convert.base64Decode(
        'ChVDcmVhdGVWb3VjaGVyUmVzcG9uc2USFQoGcmVmX2lkGAEgASgJUgVyZWZJZA==');

@$core.Deprecated('Use getVoucherRequestDescriptor instead')
const GetVoucherRequest$json = {
  '1': 'GetVoucherRequest',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '10': 'refId'},
  ],
};

/// Descriptor for `GetVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherRequestDescriptor = $convert
    .base64Decode('ChFHZXRWb3VjaGVyUmVxdWVzdBIVCgZyZWZfaWQYASABKAlSBXJlZklk');

@$core.Deprecated('Use getVoucherResponseDescriptor instead')
const GetVoucherResponse$json = {
  '1': 'GetVoucherResponse',
  '2': [
    {
      '1': 'voucher',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.Voucher',
      '10': 'voucher'
    },
  ],
};

/// Descriptor for `GetVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherResponseDescriptor = $convert.base64Decode(
    'ChJHZXRWb3VjaGVyUmVzcG9uc2USKwoHdm91Y2hlchgBIAEoCzIRLm9yZGVyLnYxLlZvdWNoZX'
    'JSB3ZvdWNoZXI=');

@$core.Deprecated('Use redeemVoucherRequestDescriptor instead')
const RedeemVoucherRequest$json = {
  '1': 'RedeemVoucherRequest',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '10': 'refId'},
  ],
};

/// Descriptor for `RedeemVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List redeemVoucherRequestDescriptor =
    $convert.base64Decode(
        'ChRSZWRlZW1Wb3VjaGVyUmVxdWVzdBIVCgZyZWZfaWQYASABKAlSBXJlZklk');

@$core.Deprecated('Use redeemVoucherResponseDescriptor instead')
const RedeemVoucherResponse$json = {
  '1': 'RedeemVoucherResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'error', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'error', '17': true},
  ],
  '8': [
    {'1': '_error'},
  ],
};

/// Descriptor for `RedeemVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List redeemVoucherResponseDescriptor = $convert.base64Decode(
    'ChVSZWRlZW1Wb3VjaGVyUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIZCgVlcn'
    'JvchgCIAEoCUgAUgVlcnJvcogBAUIICgZfZXJyb3I=');

const $core.Map<$core.String, $core.dynamic> VoucherServiceBase$json = {
  '1': 'VoucherService',
  '2': [
    {
      '1': 'CreateVoucher',
      '2': '.order.v1.CreateVoucherRequest',
      '3': '.order.v1.CreateVoucherResponse'
    },
    {
      '1': 'GetVoucher',
      '2': '.order.v1.GetVoucherRequest',
      '3': '.order.v1.GetVoucherResponse'
    },
    {
      '1': 'RedeemVoucher',
      '2': '.order.v1.RedeemVoucherRequest',
      '3': '.order.v1.RedeemVoucherResponse'
    },
  ],
};

@$core.Deprecated('Use voucherServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    VoucherServiceBase$messageJson = {
  '.order.v1.CreateVoucherRequest': CreateVoucherRequest$json,
  '.order.v1.Voucher': Voucher$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.order.v1.CreateVoucherResponse': CreateVoucherResponse$json,
  '.order.v1.GetVoucherRequest': GetVoucherRequest$json,
  '.order.v1.GetVoucherResponse': GetVoucherResponse$json,
  '.order.v1.RedeemVoucherRequest': RedeemVoucherRequest$json,
  '.order.v1.RedeemVoucherResponse': RedeemVoucherResponse$json,
};

/// Descriptor for `VoucherService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List voucherServiceDescriptor = $convert.base64Decode(
    'Cg5Wb3VjaGVyU2VydmljZRJQCg1DcmVhdGVWb3VjaGVyEh4ub3JkZXIudjEuQ3JlYXRlVm91Y2'
    'hlclJlcXVlc3QaHy5vcmRlci52MS5DcmVhdGVWb3VjaGVyUmVzcG9uc2USRwoKR2V0Vm91Y2hl'
    'chIbLm9yZGVyLnYxLkdldFZvdWNoZXJSZXF1ZXN0Ghwub3JkZXIudjEuR2V0Vm91Y2hlclJlc3'
    'BvbnNlElAKDVJlZGVlbVZvdWNoZXISHi5vcmRlci52MS5SZWRlZW1Wb3VjaGVyUmVxdWVzdBof'
    'Lm9yZGVyLnYxLlJlZGVlbVZvdWNoZXJSZXNwb25zZQ==');
