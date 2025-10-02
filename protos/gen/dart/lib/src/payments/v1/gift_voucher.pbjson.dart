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

import '../../audits/v1/voucher_transaction.pbjson.dart' as $1;
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
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {'1': 'voucher_code', '3': 2, '4': 1, '5': 9, '10': 'voucherCode'},
    {'1': 'initial_value', '3': 3, '4': 1, '5': 1, '10': 'initialValue'},
    {'1': 'remaining_value', '3': 4, '4': 1, '5': 1, '10': 'remainingValue'},
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'issued_to_customer_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'issuedToCustomerId',
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
    {'1': '_issued_to_customer_id'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `GiftVoucher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giftVoucherDescriptor = $convert.base64Decode(
    'CgtHaWZ0Vm91Y2hlchInCgtkb2N1bWVudF9pZBgBIAEoCUIGukgDyAEBUgpkb2N1bWVudElkEi'
    'EKDHZvdWNoZXJfY29kZRgCIAEoCVILdm91Y2hlckNvZGUSIwoNaW5pdGlhbF92YWx1ZRgDIAEo'
    'AVIMaW5pdGlhbFZhbHVlEicKD3JlbWFpbmluZ192YWx1ZRgEIAEoAVIOcmVtYWluaW5nVmFsdW'
    'USGgoIY3VycmVuY3kYBSABKAlSCGN1cnJlbmN5EjYKFWlzc3VlZF90b19jdXN0b21lcl9pZBgG'
    'IAEoCUgAUhJpc3N1ZWRUb0N1c3RvbWVySWSIAQESKQoRaXNzdWVkX2J5X3VzZXJfaWQYByABKA'
    'lSDmlzc3VlZEJ5VXNlcklkEiEKDHdhcmVob3VzZV9pZBgIIAEoCVILd2FyZWhvdXNlSWQSMgoG'
    'c3RhdHVzGAkgASgOMhoucGF5bWVudHMudjEuVm91Y2hlclN0YXR1c1IGc3RhdHVzEjcKCWlzc3'
    'VlZF9hdBgKIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCGlzc3VlZEF0EjsKC3Zh'
    'bGlkX3VudGlsGAsgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKdmFsaWRVbnRpbB'
    'IZCgVub3RlcxgMIAEoCUgBUgVub3Rlc4gBAUIYChZfaXNzdWVkX3RvX2N1c3RvbWVyX2lkQggK'
    'Bl9ub3Rlcw==');

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

@$core.Deprecated('Use getVoucherRequestDescriptor instead')
const GetVoucherRequest$json = {
  '1': 'GetVoucherRequest',
  '2': [
    {'1': 'voucher_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'voucherId'},
    {'1': 'voucher_code', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'voucherCode'},
  ],
  '8': [
    {'1': 'identifier'},
  ],
};

/// Descriptor for `GetVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherRequestDescriptor = $convert.base64Decode(
    'ChFHZXRWb3VjaGVyUmVxdWVzdBIfCgp2b3VjaGVyX2lkGAEgASgJSABSCXZvdWNoZXJJZBIjCg'
    'x2b3VjaGVyX2NvZGUYAiABKAlIAFILdm91Y2hlckNvZGVCDAoKaWRlbnRpZmllcg==');

@$core.Deprecated('Use getVoucherResponseDescriptor instead')
const GetVoucherResponse$json = {
  '1': 'GetVoucherResponse',
  '2': [
    {
      '1': 'voucher',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.GiftVoucher',
      '10': 'voucher'
    },
    {
      '1': 'transactions',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.audits.v1.VoucherTransaction',
      '10': 'transactions'
    },
  ],
};

/// Descriptor for `GetVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherResponseDescriptor = $convert.base64Decode(
    'ChJHZXRWb3VjaGVyUmVzcG9uc2USMgoHdm91Y2hlchgBIAEoCzIYLnBheW1lbnRzLnYxLkdpZn'
    'RWb3VjaGVyUgd2b3VjaGVyEkEKDHRyYW5zYWN0aW9ucxgCIAMoCzIdLmF1ZGl0cy52MS5Wb3Vj'
    'aGVyVHJhbnNhY3Rpb25SDHRyYW5zYWN0aW9ucw==');

@$core.Deprecated('Use listVouchersRequestDescriptor instead')
const ListVouchersRequest$json = {
  '1': 'ListVouchersRequest',
  '2': [
    {'1': 'warehouse_id', '3': 1, '4': 1, '5': 9, '10': 'warehouseId'},
    {
      '1': 'customer_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'customerId',
      '17': true
    },
    {
      '1': 'issued_after',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'issuedAfter',
      '17': true
    },
    {'1': 'page_size', '3': 4, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_number', '3': 5, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
  '8': [
    {'1': '_customer_id'},
    {'1': '_issued_after'},
  ],
};

/// Descriptor for `ListVouchersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVouchersRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0Vm91Y2hlcnNSZXF1ZXN0EiEKDHdhcmVob3VzZV9pZBgBIAEoCVILd2FyZWhvdXNlSW'
    'QSJAoLY3VzdG9tZXJfaWQYAiABKAlIAFIKY3VzdG9tZXJJZIgBARJCCgxpc3N1ZWRfYWZ0ZXIY'
    'AyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSC2lzc3VlZEFmdGVyiAEBEhsKCX'
    'BhZ2Vfc2l6ZRgEIAEoBVIIcGFnZVNpemUSHwoLcGFnZV9udW1iZXIYBSABKAVSCnBhZ2VOdW1i'
    'ZXJCDgoMX2N1c3RvbWVyX2lkQg8KDV9pc3N1ZWRfYWZ0ZXI=');

@$core.Deprecated('Use listVouchersResponseDescriptor instead')
const ListVouchersResponse$json = {
  '1': 'ListVouchersResponse',
  '2': [
    {
      '1': 'vouchers',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.GiftVoucher',
      '10': 'vouchers'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'total_value', '3': 3, '4': 1, '5': 1, '10': 'totalValue'},
  ],
};

/// Descriptor for `ListVouchersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVouchersResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0Vm91Y2hlcnNSZXNwb25zZRI0Cgh2b3VjaGVycxgBIAMoCzIYLnBheW1lbnRzLnYxLk'
    'dpZnRWb3VjaGVyUgh2b3VjaGVycxIfCgt0b3RhbF9jb3VudBgCIAEoBVIKdG90YWxDb3VudBIf'
    'Cgt0b3RhbF92YWx1ZRgDIAEoAVIKdG90YWxWYWx1ZQ==');

const $core.Map<$core.String, $core.dynamic> GiftVoucherServiceBase$json = {
  '1': 'GiftVoucherService',
  '2': [
    {
      '1': 'ValidateVoucher',
      '2': '.payments.v1.ValidateVoucherRequest',
      '3': '.payments.v1.ValidateVoucherResponse'
    },
    {
      '1': 'GetVoucher',
      '2': '.payments.v1.GetVoucherRequest',
      '3': '.payments.v1.GetVoucherResponse'
    },
    {
      '1': 'ListVouchers',
      '2': '.payments.v1.ListVouchersRequest',
      '3': '.payments.v1.ListVouchersResponse'
    },
  ],
};

@$core.Deprecated('Use giftVoucherServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    GiftVoucherServiceBase$messageJson = {
  '.payments.v1.ValidateVoucherRequest': ValidateVoucherRequest$json,
  '.payments.v1.ValidateVoucherResponse': ValidateVoucherResponse$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.payments.v1.GetVoucherRequest': GetVoucherRequest$json,
  '.payments.v1.GetVoucherResponse': GetVoucherResponse$json,
  '.payments.v1.GiftVoucher': GiftVoucher$json,
  '.audits.v1.VoucherTransaction': $1.VoucherTransaction$json,
  '.payments.v1.ListVouchersRequest': ListVouchersRequest$json,
  '.payments.v1.ListVouchersResponse': ListVouchersResponse$json,
};

/// Descriptor for `GiftVoucherService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List giftVoucherServiceDescriptor = $convert.base64Decode(
    'ChJHaWZ0Vm91Y2hlclNlcnZpY2USXAoPVmFsaWRhdGVWb3VjaGVyEiMucGF5bWVudHMudjEuVm'
    'FsaWRhdGVWb3VjaGVyUmVxdWVzdBokLnBheW1lbnRzLnYxLlZhbGlkYXRlVm91Y2hlclJlc3Bv'
    'bnNlEk0KCkdldFZvdWNoZXISHi5wYXltZW50cy52MS5HZXRWb3VjaGVyUmVxdWVzdBofLnBheW'
    '1lbnRzLnYxLkdldFZvdWNoZXJSZXNwb25zZRJTCgxMaXN0Vm91Y2hlcnMSIC5wYXltZW50cy52'
    'MS5MaXN0Vm91Y2hlcnNSZXF1ZXN0GiEucGF5bWVudHMudjEuTGlzdFZvdWNoZXJzUmVzcG9uc2'
    'U=');
