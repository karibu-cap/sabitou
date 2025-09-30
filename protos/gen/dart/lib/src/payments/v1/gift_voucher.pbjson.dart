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
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {'1': 'voucher_code', '3': 2, '4': 1, '5': 9, '10': 'voucherCode'},
    {'1': 'initial_value', '3': 3, '4': 1, '5': 3, '10': 'initialValue'},
    {'1': 'remaining_value', '3': 4, '4': 1, '5': 3, '10': 'remainingValue'},
    {'1': 'currency', '3': 5, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'issued_to_customer_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'issuedToCustomerId'
    },
    {'1': 'issued_by_user_id', '3': 7, '4': 1, '5': 9, '10': 'issuedByUserId'},
    {
      '1': 'status',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.VoucherStatus',
      '10': 'status'
    },
    {
      '1': 'issued_at',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'issuedAt'
    },
    {
      '1': 'valid_until',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'validUntil'
    },
    {'1': 'notes', '3': 11, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `GiftVoucher`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List giftVoucherDescriptor = $convert.base64Decode(
    'CgtHaWZ0Vm91Y2hlchInCgtkb2N1bWVudF9pZBgBIAEoCUIGukgDyAEBUgpkb2N1bWVudElkEi'
    'EKDHZvdWNoZXJfY29kZRgCIAEoCVILdm91Y2hlckNvZGUSIwoNaW5pdGlhbF92YWx1ZRgDIAEo'
    'A1IMaW5pdGlhbFZhbHVlEicKD3JlbWFpbmluZ192YWx1ZRgEIAEoA1IOcmVtYWluaW5nVmFsdW'
    'USGgoIY3VycmVuY3kYBSABKAlSCGN1cnJlbmN5EjEKFWlzc3VlZF90b19jdXN0b21lcl9pZBgG'
    'IAEoCVISaXNzdWVkVG9DdXN0b21lcklkEikKEWlzc3VlZF9ieV91c2VyX2lkGAcgASgJUg5pc3'
    'N1ZWRCeVVzZXJJZBIyCgZzdGF0dXMYCCABKA4yGi5wYXltZW50cy52MS5Wb3VjaGVyU3RhdHVz'
    'UgZzdGF0dXMSNwoJaXNzdWVkX2F0GAkgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcF'
    'IIaXNzdWVkQXQSOwoLdmFsaWRfdW50aWwYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUgp2YWxpZFVudGlsEhQKBW5vdGVzGAsgASgJUgVub3Rlcw==');

@$core.Deprecated('Use voucherTransactionDescriptor instead')
const VoucherTransaction$json = {
  '1': 'VoucherTransaction',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {'1': 'voucher_id', '3': 2, '4': 1, '5': 9, '10': 'voucherId'},
    {
      '1': 'related_invoice_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'relatedInvoiceId'
    },
    {
      '1': 'related_receipt_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'relatedReceiptId'
    },
    {'1': 'amount_used', '3': 5, '4': 1, '5': 3, '10': 'amountUsed'},
    {'1': 'remaining_after', '3': 6, '4': 1, '5': 3, '10': 'remainingAfter'},
    {
      '1': 'used_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'usedAt'
    },
    {'1': 'used_by_user_id', '3': 8, '4': 1, '5': 9, '10': 'usedByUserId'},
  ],
};

/// Descriptor for `VoucherTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List voucherTransactionDescriptor = $convert.base64Decode(
    'ChJWb3VjaGVyVHJhbnNhY3Rpb24SJwoLZG9jdW1lbnRfaWQYASABKAlCBrpIA8gBAVIKZG9jdW'
    '1lbnRJZBIdCgp2b3VjaGVyX2lkGAIgASgJUgl2b3VjaGVySWQSLAoScmVsYXRlZF9pbnZvaWNl'
    'X2lkGAMgASgJUhByZWxhdGVkSW52b2ljZUlkEiwKEnJlbGF0ZWRfcmVjZWlwdF9pZBgEIAEoCV'
    'IQcmVsYXRlZFJlY2VpcHRJZBIfCgthbW91bnRfdXNlZBgFIAEoA1IKYW1vdW50VXNlZBInCg9y'
    'ZW1haW5pbmdfYWZ0ZXIYBiABKANSDnJlbWFpbmluZ0FmdGVyEjMKB3VzZWRfYXQYByABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgZ1c2VkQXQSJQoPdXNlZF9ieV91c2VyX2lkGAgg'
    'ASgJUgx1c2VkQnlVc2VySWQ=');

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
    {'1': 'remaining_value', '3': 3, '4': 1, '5': 3, '10': 'remainingValue'},
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
    'p2b3VjaGVyX2lkGAIgASgJUgl2b3VjaGVySWQSJwoPcmVtYWluaW5nX3ZhbHVlGAMgASgDUg5y'
    'ZW1haW5pbmdWYWx1ZRI7Cgt2YWxpZF91bnRpbBgEIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW'
    '1lc3RhbXBSCnZhbGlkVW50aWwSMgoGc3RhdHVzGAUgASgOMhoucGF5bWVudHMudjEuVm91Y2hl'
    'clN0YXR1c1IGc3RhdHVzEhgKB21lc3NhZ2UYBiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use createGiftVoucherRequestDescriptor instead')
const CreateGiftVoucherRequest$json = {
  '1': 'CreateGiftVoucherRequest',
  '2': [
    {'1': 'initial_value', '3': 1, '4': 1, '5': 3, '10': 'initialValue'},
    {'1': 'currency', '3': 2, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'issued_to_customer_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'issuedToCustomerId'
    },
    {'1': 'issued_by_user_id', '3': 4, '4': 1, '5': 9, '10': 'issuedByUserId'},
    {
      '1': 'valid_until',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'validUntil'
    },
    {
      '1': 'related_invoice_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'relatedInvoiceId'
    },
    {'1': 'notes', '3': 7, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `CreateGiftVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGiftVoucherRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVHaWZ0Vm91Y2hlclJlcXVlc3QSIwoNaW5pdGlhbF92YWx1ZRgBIAEoA1IMaW5pdG'
    'lhbFZhbHVlEhoKCGN1cnJlbmN5GAIgASgJUghjdXJyZW5jeRIxChVpc3N1ZWRfdG9fY3VzdG9t'
    'ZXJfaWQYAyABKAlSEmlzc3VlZFRvQ3VzdG9tZXJJZBIpChFpc3N1ZWRfYnlfdXNlcl9pZBgEIA'
    'EoCVIOaXNzdWVkQnlVc2VySWQSOwoLdmFsaWRfdW50aWwYBSABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUgp2YWxpZFVudGlsEiwKEnJlbGF0ZWRfaW52b2ljZV9pZBgGIAEoCVIQcm'
    'VsYXRlZEludm9pY2VJZBIUCgVub3RlcxgHIAEoCVIFbm90ZXM=');

@$core.Deprecated('Use createGiftVoucherResponseDescriptor instead')
const CreateGiftVoucherResponse$json = {
  '1': 'CreateGiftVoucherResponse',
  '2': [
    {'1': 'voucher_id', '3': 1, '4': 1, '5': 9, '10': 'voucherId'},
    {
      '1': 'voucher',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.GiftVoucher',
      '10': 'voucher'
    },
    {'1': 'voucher_code', '3': 3, '4': 1, '5': 9, '10': 'voucherCode'},
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateGiftVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createGiftVoucherResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVHaWZ0Vm91Y2hlclJlc3BvbnNlEh0KCnZvdWNoZXJfaWQYASABKAlSCXZvdWNoZX'
    'JJZBIyCgd2b3VjaGVyGAIgASgLMhgucGF5bWVudHMudjEuR2lmdFZvdWNoZXJSB3ZvdWNoZXIS'
    'IQoMdm91Y2hlcl9jb2RlGAMgASgJUgt2b3VjaGVyQ29kZRIYCgdtZXNzYWdlGAQgASgJUgdtZX'
    'NzYWdl');

@$core.Deprecated('Use useVoucherRequestDescriptor instead')
const UseVoucherRequest$json = {
  '1': 'UseVoucherRequest',
  '2': [
    {'1': 'voucher_code', '3': 1, '4': 1, '5': 9, '10': 'voucherCode'},
    {'1': 'amount_to_use', '3': 2, '4': 1, '5': 3, '10': 'amountToUse'},
    {
      '1': 'related_receipt_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'relatedReceiptId'
    },
    {'1': 'used_by_user_id', '3': 4, '4': 1, '5': 9, '10': 'usedByUserId'},
  ],
};

/// Descriptor for `UseVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List useVoucherRequestDescriptor = $convert.base64Decode(
    'ChFVc2VWb3VjaGVyUmVxdWVzdBIhCgx2b3VjaGVyX2NvZGUYASABKAlSC3ZvdWNoZXJDb2RlEi'
    'IKDWFtb3VudF90b191c2UYAiABKANSC2Ftb3VudFRvVXNlEiwKEnJlbGF0ZWRfcmVjZWlwdF9p'
    'ZBgDIAEoCVIQcmVsYXRlZFJlY2VpcHRJZBIlCg91c2VkX2J5X3VzZXJfaWQYBCABKAlSDHVzZW'
    'RCeVVzZXJJZA==');

@$core.Deprecated('Use useVoucherResponseDescriptor instead')
const UseVoucherResponse$json = {
  '1': 'UseVoucherResponse',
  '2': [
    {'1': 'transaction_id', '3': 1, '4': 1, '5': 9, '10': 'transactionId'},
    {
      '1': 'transaction',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.VoucherTransaction',
      '10': 'transaction'
    },
    {
      '1': 'updated_voucher',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.GiftVoucher',
      '10': 'updatedVoucher'
    },
    {'1': 'remaining_value', '3': 4, '4': 1, '5': 3, '10': 'remainingValue'},
    {'1': 'fully_used', '3': 5, '4': 1, '5': 8, '10': 'fullyUsed'},
    {'1': 'message', '3': 6, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UseVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List useVoucherResponseDescriptor = $convert.base64Decode(
    'ChJVc2VWb3VjaGVyUmVzcG9uc2USJQoOdHJhbnNhY3Rpb25faWQYASABKAlSDXRyYW5zYWN0aW'
    '9uSWQSQQoLdHJhbnNhY3Rpb24YAiABKAsyHy5wYXltZW50cy52MS5Wb3VjaGVyVHJhbnNhY3Rp'
    'b25SC3RyYW5zYWN0aW9uEkEKD3VwZGF0ZWRfdm91Y2hlchgDIAEoCzIYLnBheW1lbnRzLnYxLk'
    'dpZnRWb3VjaGVyUg51cGRhdGVkVm91Y2hlchInCg9yZW1haW5pbmdfdmFsdWUYBCABKANSDnJl'
    'bWFpbmluZ1ZhbHVlEh0KCmZ1bGx5X3VzZWQYBSABKAhSCWZ1bGx5VXNlZBIYCgdtZXNzYWdlGA'
    'YgASgJUgdtZXNzYWdl');

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
      '6': '.payments.v1.VoucherTransaction',
      '10': 'transactions'
    },
  ],
};

/// Descriptor for `GetVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherResponseDescriptor = $convert.base64Decode(
    'ChJHZXRWb3VjaGVyUmVzcG9uc2USMgoHdm91Y2hlchgBIAEoCzIYLnBheW1lbnRzLnYxLkdpZn'
    'RWb3VjaGVyUgd2b3VjaGVyEkMKDHRyYW5zYWN0aW9ucxgCIAMoCzIfLnBheW1lbnRzLnYxLlZv'
    'dWNoZXJUcmFuc2FjdGlvblIMdHJhbnNhY3Rpb25z');

@$core.Deprecated('Use listVouchersRequestDescriptor instead')
const ListVouchersRequest$json = {
  '1': 'ListVouchersRequest',
  '2': [
    {'1': 'customer_id', '3': 1, '4': 1, '5': 9, '10': 'customerId'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.VoucherStatus',
      '10': 'status'
    },
    {'1': 'expiring_soon', '3': 3, '4': 1, '5': 8, '10': 'expiringSoon'},
    {
      '1': 'issued_after',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'issuedAfter'
    },
    {'1': 'page_size', '3': 5, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_number', '3': 6, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
};

/// Descriptor for `ListVouchersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVouchersRequestDescriptor = $convert.base64Decode(
    'ChNMaXN0Vm91Y2hlcnNSZXF1ZXN0Eh8KC2N1c3RvbWVyX2lkGAEgASgJUgpjdXN0b21lcklkEj'
    'IKBnN0YXR1cxgCIAEoDjIaLnBheW1lbnRzLnYxLlZvdWNoZXJTdGF0dXNSBnN0YXR1cxIjCg1l'
    'eHBpcmluZ19zb29uGAMgASgIUgxleHBpcmluZ1Nvb24SPQoMaXNzdWVkX2FmdGVyGAQgASgLMh'
    'ouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILaXNzdWVkQWZ0ZXISGwoJcGFnZV9zaXplGAUg'
    'ASgFUghwYWdlU2l6ZRIfCgtwYWdlX251bWJlchgGIAEoBVIKcGFnZU51bWJlcg==');

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
    {'1': 'total_value', '3': 3, '4': 1, '5': 3, '10': 'totalValue'},
  ],
};

/// Descriptor for `ListVouchersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listVouchersResponseDescriptor = $convert.base64Decode(
    'ChRMaXN0Vm91Y2hlcnNSZXNwb25zZRI0Cgh2b3VjaGVycxgBIAMoCzIYLnBheW1lbnRzLnYxLk'
    'dpZnRWb3VjaGVyUgh2b3VjaGVycxIfCgt0b3RhbF9jb3VudBgCIAEoBVIKdG90YWxDb3VudBIf'
    'Cgt0b3RhbF92YWx1ZRgDIAEoA1IKdG90YWxWYWx1ZQ==');

@$core.Deprecated('Use cancelVoucherRequestDescriptor instead')
const CancelVoucherRequest$json = {
  '1': 'CancelVoucherRequest',
  '2': [
    {'1': 'voucher_id', '3': 1, '4': 1, '5': 9, '10': 'voucherId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
    {
      '1': 'cancelled_by_user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'cancelledByUserId'
    },
  ],
};

/// Descriptor for `CancelVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelVoucherRequestDescriptor = $convert.base64Decode(
    'ChRDYW5jZWxWb3VjaGVyUmVxdWVzdBIdCgp2b3VjaGVyX2lkGAEgASgJUgl2b3VjaGVySWQSFg'
    'oGcmVhc29uGAIgASgJUgZyZWFzb24SLwoUY2FuY2VsbGVkX2J5X3VzZXJfaWQYAyABKAlSEWNh'
    'bmNlbGxlZEJ5VXNlcklk');

@$core.Deprecated('Use cancelVoucherResponseDescriptor instead')
const CancelVoucherResponse$json = {
  '1': 'CancelVoucherResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CancelVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelVoucherResponseDescriptor = $convert.base64Decode(
    'ChVDYW5jZWxWb3VjaGVyUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCgdtZX'
    'NzYWdlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getVoucherHistoryRequestDescriptor instead')
const GetVoucherHistoryRequest$json = {
  '1': 'GetVoucherHistoryRequest',
  '2': [
    {'1': 'voucher_id', '3': 1, '4': 1, '5': 9, '10': 'voucherId'},
  ],
};

/// Descriptor for `GetVoucherHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherHistoryRequestDescriptor =
    $convert.base64Decode(
        'ChhHZXRWb3VjaGVySGlzdG9yeVJlcXVlc3QSHQoKdm91Y2hlcl9pZBgBIAEoCVIJdm91Y2hlck'
        'lk');

@$core.Deprecated('Use getVoucherHistoryResponseDescriptor instead')
const GetVoucherHistoryResponse$json = {
  '1': 'GetVoucherHistoryResponse',
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
      '6': '.payments.v1.VoucherTransaction',
      '10': 'transactions'
    },
    {'1': 'total_used', '3': 3, '4': 1, '5': 3, '10': 'totalUsed'},
    {'1': 'usage_count', '3': 4, '4': 1, '5': 5, '10': 'usageCount'},
  ],
};

/// Descriptor for `GetVoucherHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getVoucherHistoryResponseDescriptor = $convert.base64Decode(
    'ChlHZXRWb3VjaGVySGlzdG9yeVJlc3BvbnNlEjIKB3ZvdWNoZXIYASABKAsyGC5wYXltZW50cy'
    '52MS5HaWZ0Vm91Y2hlclIHdm91Y2hlchJDCgx0cmFuc2FjdGlvbnMYAiADKAsyHy5wYXltZW50'
    'cy52MS5Wb3VjaGVyVHJhbnNhY3Rpb25SDHRyYW5zYWN0aW9ucxIdCgp0b3RhbF91c2VkGAMgAS'
    'gDUgl0b3RhbFVzZWQSHwoLdXNhZ2VfY291bnQYBCABKAVSCnVzYWdlQ291bnQ=');

const $core.Map<$core.String, $core.dynamic> GiftVoucherServiceBase$json = {
  '1': 'GiftVoucherService',
  '2': [
    {
      '1': 'CreateGiftVoucher',
      '2': '.payments.v1.CreateGiftVoucherRequest',
      '3': '.payments.v1.CreateGiftVoucherResponse'
    },
    {
      '1': 'ValidateVoucher',
      '2': '.payments.v1.ValidateVoucherRequest',
      '3': '.payments.v1.ValidateVoucherResponse'
    },
    {
      '1': 'UseVoucher',
      '2': '.payments.v1.UseVoucherRequest',
      '3': '.payments.v1.UseVoucherResponse'
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
    {
      '1': 'CancelVoucher',
      '2': '.payments.v1.CancelVoucherRequest',
      '3': '.payments.v1.CancelVoucherResponse'
    },
    {
      '1': 'GetVoucherHistory',
      '2': '.payments.v1.GetVoucherHistoryRequest',
      '3': '.payments.v1.GetVoucherHistoryResponse'
    },
  ],
};

@$core.Deprecated('Use giftVoucherServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    GiftVoucherServiceBase$messageJson = {
  '.payments.v1.CreateGiftVoucherRequest': CreateGiftVoucherRequest$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.payments.v1.CreateGiftVoucherResponse': CreateGiftVoucherResponse$json,
  '.payments.v1.GiftVoucher': GiftVoucher$json,
  '.payments.v1.ValidateVoucherRequest': ValidateVoucherRequest$json,
  '.payments.v1.ValidateVoucherResponse': ValidateVoucherResponse$json,
  '.payments.v1.UseVoucherRequest': UseVoucherRequest$json,
  '.payments.v1.UseVoucherResponse': UseVoucherResponse$json,
  '.payments.v1.VoucherTransaction': VoucherTransaction$json,
  '.payments.v1.GetVoucherRequest': GetVoucherRequest$json,
  '.payments.v1.GetVoucherResponse': GetVoucherResponse$json,
  '.payments.v1.ListVouchersRequest': ListVouchersRequest$json,
  '.payments.v1.ListVouchersResponse': ListVouchersResponse$json,
  '.payments.v1.CancelVoucherRequest': CancelVoucherRequest$json,
  '.payments.v1.CancelVoucherResponse': CancelVoucherResponse$json,
  '.payments.v1.GetVoucherHistoryRequest': GetVoucherHistoryRequest$json,
  '.payments.v1.GetVoucherHistoryResponse': GetVoucherHistoryResponse$json,
};

/// Descriptor for `GiftVoucherService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List giftVoucherServiceDescriptor = $convert.base64Decode(
    'ChJHaWZ0Vm91Y2hlclNlcnZpY2USYgoRQ3JlYXRlR2lmdFZvdWNoZXISJS5wYXltZW50cy52MS'
    '5DcmVhdGVHaWZ0Vm91Y2hlclJlcXVlc3QaJi5wYXltZW50cy52MS5DcmVhdGVHaWZ0Vm91Y2hl'
    'clJlc3BvbnNlElwKD1ZhbGlkYXRlVm91Y2hlchIjLnBheW1lbnRzLnYxLlZhbGlkYXRlVm91Y2'
    'hlclJlcXVlc3QaJC5wYXltZW50cy52MS5WYWxpZGF0ZVZvdWNoZXJSZXNwb25zZRJNCgpVc2VW'
    'b3VjaGVyEh4ucGF5bWVudHMudjEuVXNlVm91Y2hlclJlcXVlc3QaHy5wYXltZW50cy52MS5Vc2'
    'VWb3VjaGVyUmVzcG9uc2USTQoKR2V0Vm91Y2hlchIeLnBheW1lbnRzLnYxLkdldFZvdWNoZXJS'
    'ZXF1ZXN0Gh8ucGF5bWVudHMudjEuR2V0Vm91Y2hlclJlc3BvbnNlElMKDExpc3RWb3VjaGVycx'
    'IgLnBheW1lbnRzLnYxLkxpc3RWb3VjaGVyc1JlcXVlc3QaIS5wYXltZW50cy52MS5MaXN0Vm91'
    'Y2hlcnNSZXNwb25zZRJWCg1DYW5jZWxWb3VjaGVyEiEucGF5bWVudHMudjEuQ2FuY2VsVm91Y2'
    'hlclJlcXVlc3QaIi5wYXltZW50cy52MS5DYW5jZWxWb3VjaGVyUmVzcG9uc2USYgoRR2V0Vm91'
    'Y2hlckhpc3RvcnkSJS5wYXltZW50cy52MS5HZXRWb3VjaGVySGlzdG9yeVJlcXVlc3QaJi5wYX'
    'ltZW50cy52MS5HZXRWb3VjaGVySGlzdG9yeVJlc3BvbnNl');
