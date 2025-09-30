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

@$core.Deprecated('Use cashReceiptDescriptor instead')
const CashReceipt$json = {
  '1': 'CashReceipt',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {'1': 'cashier_user_id', '3': 2, '4': 1, '5': 9, '10': 'cashierUserId'},
    {'1': 'customer_id', '3': 3, '4': 1, '5': 9, '10': 'customerId'},
    {'1': 'store_id', '3': 4, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'items',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.financial.v1.InvoiceLineItem',
      '10': 'items'
    },
    {'1': 'subtotal', '3': 6, '4': 1, '5': 3, '10': 'subtotal'},
    {'1': 'tax_amount', '3': 7, '4': 1, '5': 3, '10': 'taxAmount'},
    {'1': 'total_amount', '3': 8, '4': 1, '5': 3, '10': 'totalAmount'},
    {'1': 'amount_paid', '3': 9, '4': 1, '5': 3, '10': 'amountPaid'},
    {'1': 'change_given', '3': 10, '4': 1, '5': 3, '10': 'changeGiven'},
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
  ],
};

/// Descriptor for `CashReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cashReceiptDescriptor = $convert.base64Decode(
    'CgtDYXNoUmVjZWlwdBInCgtkb2N1bWVudF9pZBgBIAEoCUIGukgDyAEBUgpkb2N1bWVudElkEi'
    'YKD2Nhc2hpZXJfdXNlcl9pZBgCIAEoCVINY2FzaGllclVzZXJJZBIfCgtjdXN0b21lcl9pZBgD'
    'IAEoCVIKY3VzdG9tZXJJZBIZCghzdG9yZV9pZBgEIAEoCVIHc3RvcmVJZBIzCgVpdGVtcxgFIA'
    'MoCzIdLmZpbmFuY2lhbC52MS5JbnZvaWNlTGluZUl0ZW1SBWl0ZW1zEhoKCHN1YnRvdGFsGAYg'
    'ASgDUghzdWJ0b3RhbBIdCgp0YXhfYW1vdW50GAcgASgDUgl0YXhBbW91bnQSIQoMdG90YWxfYW'
    '1vdW50GAggASgDUgt0b3RhbEFtb3VudBIfCgthbW91bnRfcGFpZBgJIAEoA1IKYW1vdW50UGFp'
    'ZBIhCgxjaGFuZ2VfZ2l2ZW4YCiABKANSC2NoYW5nZUdpdmVuEhoKCGN1cnJlbmN5GAsgASgJUg'
    'hjdXJyZW5jeRIfCgtwYXltZW50X2lkcxgMIAMoCVIKcGF5bWVudElkcxJFChB0cmFuc2FjdGlv'
    'bl90aW1lGA0gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIPdHJhbnNhY3Rpb25UaW'
    '1lEhQKBW5vdGVzGA4gASgJUgVub3Rlcw==');
