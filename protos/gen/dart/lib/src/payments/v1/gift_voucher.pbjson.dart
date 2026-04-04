// This is a generated file - do not edit.
//
// Generated from payments/v1/gift_voucher.proto.

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
    {'1': 'VOUCHER_STATUS_ACTIVE', '2': 1},
    {'1': 'VOUCHER_STATUS_PARTIALLY_USED', '2': 2},
    {'1': 'VOUCHER_STATUS_FULLY_USED', '2': 3},
    {'1': 'VOUCHER_STATUS_EXPIRED', '2': 4},
    {'1': 'VOUCHER_STATUS_CANCELLED', '2': 5},
  ],
};

/// Descriptor for `VoucherStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List voucherStatusDescriptor = $convert.base64Decode(
    'Cg1Wb3VjaGVyU3RhdHVzEh4KGlZPVUNIRVJfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGQoVVk9VQ0'
    'hFUl9TVEFUVVNfQUNUSVZFEAESIQodVk9VQ0hFUl9TVEFUVVNfUEFSVElBTExZX1VTRUQQAhId'
    'ChlWT1VDSEVSX1NUQVRVU19GVUxMWV9VU0VEEAMSGgoWVk9VQ0hFUl9TVEFUVVNfRVhQSVJFRB'
    'AEEhwKGFZPVUNIRVJfU1RBVFVTX0NBTkNFTExFRBAF');

@$core.Deprecated('Use giftVoucherDescriptor instead')
const GiftVoucher$json = {
  '1': 'GiftVoucher',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {'1': 'voucher_code', '3': 2, '4': 1, '5': 9, '10': 'voucherCode'},
    {'1': 'initial_value', '3': 3, '4': 1, '5': 1, '10': 'initialValue'},
    {'1': 'remaining_value', '3': 4, '4': 1, '5': 1, '10': 'remainingValue'},
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'issued_to_customer',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'issuedToCustomer',
      '17': true
    },
    {'1': 'issued_by_user_id', '3': 7, '4': 1, '5': 9, '10': 'issuedByUserId'},
    {'1': 'warehouse_id', '3': 8, '4': 1, '5': 9, '10': 'warehouseId'},
    {
      '1': 'status',
      '3': 9,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.VoucherStatus',
      '10': 'status'
    },
    {
      '1': 'issued_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'issuedAt'
    },
    {
      '1': 'valid_until',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'validUntil'
    },
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_issued_to_customer'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `GiftVoucher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giftVoucherDescriptor = $convert.base64Decode(
    'CgtHaWZ0Vm91Y2hlchIdCgZyZWZfaWQYASABKAlCBrpIA8gBAVIFcmVmSWQSIQoMdm91Y2hlcl'
    '9jb2RlGAIgASgJUgt2b3VjaGVyQ29kZRIjCg1pbml0aWFsX3ZhbHVlGAMgASgBUgxpbml0aWFs'
    'VmFsdWUSJwoPcmVtYWluaW5nX3ZhbHVlGAQgASgBUg5yZW1haW5pbmdWYWx1ZRIaCghjdXJyZW'
    '5jeRgFIAEoCVIIY3VycmVuY3kSMQoSaXNzdWVkX3RvX2N1c3RvbWVyGAYgASgJSABSEGlzc3Vl'
    'ZFRvQ3VzdG9tZXKIAQESKQoRaXNzdWVkX2J5X3VzZXJfaWQYByABKAlSDmlzc3VlZEJ5VXNlck'
    'lkEiEKDHdhcmVob3VzZV9pZBgIIAEoCVILd2FyZWhvdXNlSWQSMgoGc3RhdHVzGAkgASgOMhou'
    'cGF5bWVudHMudjEuVm91Y2hlclN0YXR1c1IGc3RhdHVzEjcKCWlzc3VlZF9hdBgKIAEoCzIaLm'
    'dvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCGlzc3VlZEF0EjsKC3ZhbGlkX3VudGlsGAsgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKdmFsaWRVbnRpbBIZCgVub3RlcxgMIAEoCU'
    'gBUgVub3Rlc4gBAUIVChNfaXNzdWVkX3RvX2N1c3RvbWVyQggKBl9ub3Rlcw==');

@$core.Deprecated('Use validateVoucherRequestDescriptor instead')
const ValidateVoucherRequest$json = {
  '1': 'ValidateVoucherRequest',
  '2': [
    {'1': 'voucher_code', '3': 1, '4': 1, '5': 9, '10': 'voucherCode'},
  ],
};

/// Descriptor for `ValidateVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateVoucherRequestDescriptor =
    $convert.base64Decode(
        'ChZWYWxpZGF0ZVZvdWNoZXJSZXF1ZXN0EiEKDHZvdWNoZXJfY29kZRgBIAEoCVILdm91Y2hlck'
        'NvZGU=');

@$core.Deprecated('Use validateVoucherResponseDescriptor instead')
const ValidateVoucherResponse$json = {
  '1': 'ValidateVoucherResponse',
  '2': [
    {'1': 'is_valid', '3': 1, '4': 1, '5': 8, '10': 'isValid'},
    {'1': 'voucher_id', '3': 2, '4': 1, '5': 9, '10': 'voucherId'},
    {'1': 'remaining_value', '3': 3, '4': 1, '5': 1, '10': 'remainingValue'},
    {
      '1': 'valid_until',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'validUntil'
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.VoucherStatus',
      '10': 'status'
    },
    {'1': 'message', '3': 6, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ValidateVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List validateVoucherResponseDescriptor = $convert.base64Decode(
    'ChdWYWxpZGF0ZVZvdWNoZXJSZXNwb25zZRIZCghpc192YWxpZBgBIAEoCFIHaXNWYWxpZBIdCg'
    'p2b3VjaGVyX2lkGAIgASgJUgl2b3VjaGVySWQSJwoPcmVtYWluaW5nX3ZhbHVlGAMgASgBUg5y'
    'ZW1haW5pbmdWYWx1ZRI7Cgt2YWxpZF91bnRpbBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW'
    '1lc3RhbXBSCnZhbGlkVW50aWwSMgoGc3RhdHVzGAUgASgOMhoucGF5bWVudHMudjEuVm91Y2hl'
    'clN0YXR1c1IGc3RhdHVzEhgKB21lc3NhZ2UYBiABKAlSB21lc3NhZ2U=');

const $core.Map<$core.String, $core.dynamic> GiftVoucherServiceBase$json = {
  '1': 'GiftVoucherService',
  '2': [
    {
      '1': 'ValidateVoucher',
      '2': '.payments.v1.ValidateVoucherRequest',
      '3': '.payments.v1.ValidateVoucherResponse'
    },
  ],
};

@$core.Deprecated('Use giftVoucherServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    GiftVoucherServiceBase$messageJson = {
  '.payments.v1.ValidateVoucherRequest': ValidateVoucherRequest$json,
  '.payments.v1.ValidateVoucherResponse': ValidateVoucherResponse$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
};

/// Descriptor for `GiftVoucherService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List giftVoucherServiceDescriptor = $convert.base64Decode(
    'ChJHaWZ0Vm91Y2hlclNlcnZpY2USXAoPVmFsaWRhdGVWb3VjaGVyEiMucGF5bWVudHMudjEuVm'
    'FsaWRhdGVWb3VjaGVyUmVxdWVzdBokLnBheW1lbnRzLnYxLlZhbGlkYXRlVm91Y2hlclJlc3Bv'
    'bnNl');
