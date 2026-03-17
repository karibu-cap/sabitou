// This is a generated file - do not edit.
//
// Generated from audits/v1/voucher_transaction.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use voucherTransactionDescriptor instead')
const VoucherTransaction$json = {
  '1': 'VoucherTransaction',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
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
    {'1': 'amount_used', '3': 5, '4': 1, '5': 1, '10': 'amountUsed'},
    {'1': 'remaining_after', '3': 6, '4': 1, '5': 1, '10': 'remainingAfter'},
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
    'ChJWb3VjaGVyVHJhbnNhY3Rpb24SHQoGcmVmX2lkGAEgASgJQga6SAPIAQFSBXJlZklkEh0KCn'
    'ZvdWNoZXJfaWQYAiABKAlSCXZvdWNoZXJJZBIsChJyZWxhdGVkX2ludm9pY2VfaWQYAyABKAlS'
    'EHJlbGF0ZWRJbnZvaWNlSWQSLAoScmVsYXRlZF9yZWNlaXB0X2lkGAQgASgJUhByZWxhdGVkUm'
    'VjZWlwdElkEh8KC2Ftb3VudF91c2VkGAUgASgBUgphbW91bnRVc2VkEicKD3JlbWFpbmluZ19h'
    'ZnRlchgGIAEoAVIOcmVtYWluaW5nQWZ0ZXISMwoHdXNlZF9hdBgHIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSBnVzZWRBdBIlCg91c2VkX2J5X3VzZXJfaWQYCCABKAlSDHVzZWRC'
    'eVVzZXJJZA==');
