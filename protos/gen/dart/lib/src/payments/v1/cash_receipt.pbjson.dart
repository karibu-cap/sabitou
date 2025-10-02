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

import '../../financial/v1/financial_utils.pbjson.dart' as $0;
import '../../google/protobuf/timestamp.pbjson.dart' as $1;
import '../../inventory/v1/category.pbjson.dart' as $4;
import 'gift_voucher.pbjson.dart' as $3;
import 'payments.pbjson.dart' as $2;

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
  ],
  '8': [
    {'1': '_voucher_issued_code'},
  ],
};

/// Descriptor for `CashReceipt`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cashReceiptDescriptor = $convert.base64Decode(
    'CgtDYXNoUmVjZWlwdBInCgtkb2N1bWVudF9pZBgBIAEoCUIGukgDyAEBUgpkb2N1bWVudElkEi'
    'YKD2Nhc2hpZXJfdXNlcl9pZBgCIAEoCVINY2FzaGllclVzZXJJZBIfCgtjdXN0b21lcl9pZBgD'
    'IAEoCVIKY3VzdG9tZXJJZBIZCghzdG9yZV9pZBgEIAEoCVIHc3RvcmVJZBIzCgVpdGVtcxgFIA'
    'MoCzIdLmZpbmFuY2lhbC52MS5JbnZvaWNlTGluZUl0ZW1SBWl0ZW1zEhoKCHN1YnRvdGFsGAYg'
    'ASgBUghzdWJ0b3RhbBIdCgp0YXhfYW1vdW50GAcgASgBUgl0YXhBbW91bnQSIQoMdG90YWxfYW'
    '1vdW50GAggASgBUgt0b3RhbEFtb3VudBIfCgthbW91bnRfcGFpZBgJIAEoAVIKYW1vdW50UGFp'
    'ZBIhCgxjaGFuZ2VfZ2l2ZW4YCiABKAFSC2NoYW5nZUdpdmVuEhoKCGN1cnJlbmN5GAsgASgJUg'
    'hjdXJyZW5jeRIfCgtwYXltZW50X2lkcxgMIAMoCVIKcGF5bWVudElkcxJFChB0cmFuc2FjdGlv'
    'bl90aW1lGA0gASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIPdHJhbnNhY3Rpb25UaW'
    '1lEhQKBW5vdGVzGA4gASgJUgVub3RlcxIzChN2b3VjaGVyX2lzc3VlZF9jb2RlGA8gASgJSABS'
    'EXZvdWNoZXJJc3N1ZWRDb2RliAEBEigKEG93ZWRfdG9fY3VzdG9tZXIYECABKAFSDm93ZWRUb0'
    'N1c3RvbWVyQhYKFF92b3VjaGVyX2lzc3VlZF9jb2Rl');

@$core.Deprecated('Use createCashReceiptRequestDescriptor instead')
const CreateCashReceiptRequest$json = {
  '1': 'CreateCashReceiptRequest',
  '2': [
    {
      '1': 'receipt',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.CashReceipt',
      '10': 'receipt'
    },
    {
      '1': 'payments',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.Payment',
      '10': 'payments'
    },
    {
      '1': 'issue_voucher_on_change',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'issueVoucherOnChange'
    },
  ],
};

/// Descriptor for `CreateCashReceiptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCashReceiptRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVDYXNoUmVjZWlwdFJlcXVlc3QSMgoHcmVjZWlwdBgBIAEoCzIYLnBheW1lbnRzLn'
    'YxLkNhc2hSZWNlaXB0UgdyZWNlaXB0EjAKCHBheW1lbnRzGAIgAygLMhQucGF5bWVudHMudjEu'
    'UGF5bWVudFIIcGF5bWVudHMSNQoXaXNzdWVfdm91Y2hlcl9vbl9jaGFuZ2UYAyABKAhSFGlzc3'
    'VlVm91Y2hlck9uQ2hhbmdl');

@$core.Deprecated('Use createCashReceiptResponseDescriptor instead')
const CreateCashReceiptResponse$json = {
  '1': 'CreateCashReceiptResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'voucher',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.GiftVoucher',
      '9': 0,
      '10': 'voucher',
      '17': true
    },
  ],
  '8': [
    {'1': '_voucher'},
  ],
};

/// Descriptor for `CreateCashReceiptResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCashReceiptResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVDYXNoUmVjZWlwdFJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3MSNw'
    'oHdm91Y2hlchgCIAEoCzIYLnBheW1lbnRzLnYxLkdpZnRWb3VjaGVySABSB3ZvdWNoZXKIAQFC'
    'CgoIX3ZvdWNoZXI=');

const $core.Map<$core.String, $core.dynamic> CashReceiptServiceBase$json = {
  '1': 'CashReceiptService',
  '2': [
    {
      '1': 'CreateCashReceipt',
      '2': '.payments.v1.CreateCashReceiptRequest',
      '3': '.payments.v1.CreateCashReceiptResponse'
    },
  ],
};

@$core.Deprecated('Use cashReceiptServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    CashReceiptServiceBase$messageJson = {
  '.payments.v1.CreateCashReceiptRequest': CreateCashReceiptRequest$json,
  '.payments.v1.CashReceipt': CashReceipt$json,
  '.financial.v1.InvoiceLineItem': $0.InvoiceLineItem$json,
  '.inventory.v1.Internationalized': $4.Internationalized$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.payments.v1.Payment': $2.Payment$json,
  '.payments.v1.CreateCashReceiptResponse': CreateCashReceiptResponse$json,
  '.payments.v1.GiftVoucher': $3.GiftVoucher$json,
};

/// Descriptor for `CashReceiptService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List cashReceiptServiceDescriptor = $convert.base64Decode(
    'ChJDYXNoUmVjZWlwdFNlcnZpY2USYgoRQ3JlYXRlQ2FzaFJlY2VpcHQSJS5wYXltZW50cy52MS'
    '5DcmVhdGVDYXNoUmVjZWlwdFJlcXVlc3QaJi5wYXltZW50cy52MS5DcmVhdGVDYXNoUmVjZWlw'
    'dFJlc3BvbnNl');
