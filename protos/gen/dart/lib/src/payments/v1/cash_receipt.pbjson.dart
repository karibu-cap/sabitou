// This is a generated file - do not edit.
//
// Generated from payments/v1/cash_receipt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use cashReceiptStatusDescriptor instead')
const CashReceiptStatus$json = {
  '1': 'CashReceiptStatus',
  '2': [
    {'1': 'CASH_RECEIPT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'CASH_RECEIPT_STATUS_DRAFT', '2': 1},
    {'1': 'CASH_RECEIPT_STATUS_COMPLETED', '2': 2},
    {'1': 'CASH_RECEIPT_STATUS_VOIDED', '2': 3},
    {'1': 'CASH_RECEIPT_STATUS_REFUNDED', '2': 4},
  ],
};

/// Descriptor for `CashReceiptStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List cashReceiptStatusDescriptor = $convert.base64Decode(
    'ChFDYXNoUmVjZWlwdFN0YXR1cxIjCh9DQVNIX1JFQ0VJUFRfU1RBVFVTX1VOU1BFQ0lGSUVEEA'
    'ASHQoZQ0FTSF9SRUNFSVBUX1NUQVRVU19EUkFGVBABEiEKHUNBU0hfUkVDRUlQVF9TVEFUVVNf'
    'Q09NUExFVEVEEAISHgoaQ0FTSF9SRUNFSVBUX1NUQVRVU19WT0lERUQQAxIgChxDQVNIX1JFQ0'
    'VJUFRfU1RBVFVTX1JFRlVOREVEEAQ=');

@$core.Deprecated('Use cashReceiptDescriptor instead')
const CashReceipt$json = {
  '1': 'CashReceipt',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {'1': 'cashier_user_id', '3': 2, '4': 1, '5': 9, '10': 'cashierUserId'},
    {'1': 'customer', '3': 3, '4': 1, '5': 9, '10': 'customer'},
    {'1': 'store_id', '3': 4, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'items',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.financial.v1.InvoiceLineItem',
      '10': 'items'
    },
    {'1': 'subtotal', '3': 6, '4': 1, '5': 1, '10': 'subtotal'},
    {'1': 'tax_amount', '3': 7, '4': 1, '5': 1, '10': 'taxAmount'},
    {'1': 'total_amount', '3': 8, '4': 1, '5': 1, '10': 'totalAmount'},
    {'1': 'amount_paid', '3': 9, '4': 1, '5': 1, '10': 'amountPaid'},
    {'1': 'change_given', '3': 10, '4': 1, '5': 1, '10': 'changeGiven'},
    {'1': 'currency', '3': 11, '4': 1, '5': 9, '10': 'currency'},
    {'1': 'payment_ids', '3': 12, '4': 3, '5': 9, '10': 'paymentIds'},
    {
      '1': 'transaction_time',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'transactionTime'
    },
    {'1': 'notes', '3': 14, '4': 1, '5': 9, '10': 'notes'},
    {
      '1': 'voucher_issued_code',
      '3': 15,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'voucherIssuedCode',
      '17': true
    },
    {'1': 'owed_to_customer', '3': 16, '4': 1, '5': 1, '10': 'owedToCustomer'},
    {
      '1': 'status',
      '3': 17,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.CashReceiptStatus',
      '10': 'status'
    },
  ],
  '8': [
    {'1': '_voucher_issued_code'},
  ],
};

/// Descriptor for `CashReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cashReceiptDescriptor = $convert.base64Decode(
    'CgtDYXNoUmVjZWlwdBIdCgZyZWZfaWQYASABKAlCBrpIA8gBAVIFcmVmSWQSJgoPY2FzaGllcl'
    '91c2VyX2lkGAIgASgJUg1jYXNoaWVyVXNlcklkEhoKCGN1c3RvbWVyGAMgASgJUghjdXN0b21l'
    'chIZCghzdG9yZV9pZBgEIAEoCVIHc3RvcmVJZBIzCgVpdGVtcxgFIAMoCzIdLmZpbmFuY2lhbC'
    '52MS5JbnZvaWNlTGluZUl0ZW1SBWl0ZW1zEhoKCHN1YnRvdGFsGAYgASgBUghzdWJ0b3RhbBId'
    'Cgp0YXhfYW1vdW50GAcgASgBUgl0YXhBbW91bnQSIQoMdG90YWxfYW1vdW50GAggASgBUgt0b3'
    'RhbEFtb3VudBIfCgthbW91bnRfcGFpZBgJIAEoAVIKYW1vdW50UGFpZBIhCgxjaGFuZ2VfZ2l2'
    'ZW4YCiABKAFSC2NoYW5nZUdpdmVuEhoKCGN1cnJlbmN5GAsgASgJUghjdXJyZW5jeRIfCgtwYX'
    'ltZW50X2lkcxgMIAMoCVIKcGF5bWVudElkcxJFChB0cmFuc2FjdGlvbl90aW1lGA0gASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIPdHJhbnNhY3Rpb25UaW1lEhQKBW5vdGVzGA4gAS'
    'gJUgVub3RlcxIzChN2b3VjaGVyX2lzc3VlZF9jb2RlGA8gASgJSABSEXZvdWNoZXJJc3N1ZWRD'
    'b2RliAEBEigKEG93ZWRfdG9fY3VzdG9tZXIYECABKAFSDm93ZWRUb0N1c3RvbWVyEjYKBnN0YX'
    'R1cxgRIAEoDjIeLnBheW1lbnRzLnYxLkNhc2hSZWNlaXB0U3RhdHVzUgZzdGF0dXNCFgoUX3Zv'
    'dWNoZXJfaXNzdWVkX2NvZGU=');
