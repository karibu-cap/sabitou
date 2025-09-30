// This is a generated file - do not edit.
//
// Generated from payments/v1/pos_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../financial/v1/financial_utils.pbjson.dart' as $6;
import '../../financial/v1/invoice.pbjson.dart' as $1;
import '../../google/protobuf/timestamp.pbjson.dart' as $4;
import '../../inventory/v1/category.pbjson.dart' as $7;
import 'cash_receipt.pbjson.dart' as $0;
import 'gift_voucher.pbjson.dart' as $3;
import 'payments.pbjson.dart' as $2;

@$core.Deprecated('Use createCashReceiptRequestDescriptor instead')
const CreateCashReceiptRequest$json = {
  '1': 'CreateCashReceiptRequest',
  '2': [
    {'1': 'cashier_user_id', '3': 1, '4': 1, '5': 9, '10': 'cashierUserId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'customer_id', '3': 3, '4': 1, '5': 9, '10': 'customerId'},
    {
      '1': 'items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.SaleLineItem',
      '10': 'items'
    },
    {'1': 'amount_paid', '3': 5, '4': 1, '5': 3, '10': 'amountPaid'},
    {
      '1': 'payment_method',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.PaymentMethod',
      '10': 'paymentMethod'
    },
    {'1': 'notes', '3': 7, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `CreateCashReceiptRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCashReceiptRequestDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVDYXNoUmVjZWlwdFJlcXVlc3QSJgoPY2FzaGllcl91c2VyX2lkGAEgASgJUg1jYX'
    'NoaWVyVXNlcklkEhkKCHN0b3JlX2lkGAIgASgJUgdzdG9yZUlkEh8KC2N1c3RvbWVyX2lkGAMg'
    'ASgJUgpjdXN0b21lcklkEi8KBWl0ZW1zGAQgAygLMhkucGF5bWVudHMudjEuU2FsZUxpbmVJdG'
    'VtUgVpdGVtcxIfCgthbW91bnRfcGFpZBgFIAEoA1IKYW1vdW50UGFpZBJBCg5wYXltZW50X21l'
    'dGhvZBgGIAEoDjIaLnBheW1lbnRzLnYxLlBheW1lbnRNZXRob2RSDXBheW1lbnRNZXRob2QSFA'
    'oFbm90ZXMYByABKAlSBW5vdGVz');

@$core.Deprecated('Use saleLineItemDescriptor instead')
const SaleLineItem$json = {
  '1': 'SaleLineItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 1, '10': 'quantity'},
    {'1': 'unit_price', '3': 3, '4': 1, '5': 3, '10': 'unitPrice'},
  ],
};

/// Descriptor for `SaleLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List saleLineItemDescriptor = $convert.base64Decode(
    'CgxTYWxlTGluZUl0ZW0SHQoKcHJvZHVjdF9pZBgBIAEoCVIJcHJvZHVjdElkEhoKCHF1YW50aX'
    'R5GAIgASgBUghxdWFudGl0eRIdCgp1bml0X3ByaWNlGAMgASgDUgl1bml0UHJpY2U=');

@$core.Deprecated('Use createCashReceiptResponseDescriptor instead')
const CreateCashReceiptResponse$json = {
  '1': 'CreateCashReceiptResponse',
  '2': [
    {'1': 'receipt_id', '3': 1, '4': 1, '5': 9, '10': 'receiptId'},
    {
      '1': 'receipt',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.CashReceipt',
      '10': 'receipt'
    },
    {'1': 'change_given', '3': 3, '4': 1, '5': 3, '10': 'changeGiven'},
    {
      '1': 'inventory_transaction_ids',
      '3': 4,
      '4': 3,
      '5': 9,
      '10': 'inventoryTransactionIds'
    },
    {'1': 'message', '3': 5, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateCashReceiptResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCashReceiptResponseDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVDYXNoUmVjZWlwdFJlc3BvbnNlEh0KCnJlY2VpcHRfaWQYASABKAlSCXJlY2VpcH'
    'RJZBIyCgdyZWNlaXB0GAIgASgLMhgucGF5bWVudHMudjEuQ2FzaFJlY2VpcHRSB3JlY2VpcHQS'
    'IQoMY2hhbmdlX2dpdmVuGAMgASgDUgtjaGFuZ2VHaXZlbhI6ChlpbnZlbnRvcnlfdHJhbnNhY3'
    'Rpb25faWRzGAQgAygJUhdpbnZlbnRvcnlUcmFuc2FjdGlvbklkcxIYCgdtZXNzYWdlGAUgASgJ'
    'UgdtZXNzYWdl');

@$core.Deprecated('Use processSaleWithVoucherRequestDescriptor instead')
const ProcessSaleWithVoucherRequest$json = {
  '1': 'ProcessSaleWithVoucherRequest',
  '2': [
    {'1': 'cashier_user_id', '3': 1, '4': 1, '5': 9, '10': 'cashierUserId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'customer_id', '3': 3, '4': 1, '5': 9, '10': 'customerId'},
    {
      '1': 'items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.SaleLineItem',
      '10': 'items'
    },
    {'1': 'amount_paid', '3': 5, '4': 1, '5': 3, '10': 'amountPaid'},
    {
      '1': 'payment_method',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.PaymentMethod',
      '10': 'paymentMethod'
    },
    {'1': 'change_shortage', '3': 7, '4': 1, '5': 3, '10': 'changeShortage'},
    {'1': 'notes', '3': 8, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `ProcessSaleWithVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List processSaleWithVoucherRequestDescriptor = $convert.base64Decode(
    'Ch1Qcm9jZXNzU2FsZVdpdGhWb3VjaGVyUmVxdWVzdBImCg9jYXNoaWVyX3VzZXJfaWQYASABKA'
    'lSDWNhc2hpZXJVc2VySWQSGQoIc3RvcmVfaWQYAiABKAlSB3N0b3JlSWQSHwoLY3VzdG9tZXJf'
    'aWQYAyABKAlSCmN1c3RvbWVySWQSLwoFaXRlbXMYBCADKAsyGS5wYXltZW50cy52MS5TYWxlTG'
    'luZUl0ZW1SBWl0ZW1zEh8KC2Ftb3VudF9wYWlkGAUgASgDUgphbW91bnRQYWlkEkEKDnBheW1l'
    'bnRfbWV0aG9kGAYgASgOMhoucGF5bWVudHMudjEuUGF5bWVudE1ldGhvZFINcGF5bWVudE1ldG'
    'hvZBInCg9jaGFuZ2Vfc2hvcnRhZ2UYByABKANSDmNoYW5nZVNob3J0YWdlEhQKBW5vdGVzGAgg'
    'ASgJUgVub3Rlcw==');

@$core.Deprecated('Use processSaleWithVoucherResponseDescriptor instead')
const ProcessSaleWithVoucherResponse$json = {
  '1': 'ProcessSaleWithVoucherResponse',
  '2': [
    {'1': 'invoice_id', '3': 1, '4': 1, '5': 9, '10': 'invoiceId'},
    {
      '1': 'invoice',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.financial.v1.Invoice',
      '10': 'invoice'
    },
    {'1': 'payment_id', '3': 3, '4': 1, '5': 9, '10': 'paymentId'},
    {
      '1': 'payment',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.Payment',
      '10': 'payment'
    },
    {'1': 'voucher_id', '3': 5, '4': 1, '5': 9, '10': 'voucherId'},
    {
      '1': 'voucher',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.GiftVoucher',
      '10': 'voucher'
    },
    {'1': 'voucher_code', '3': 7, '4': 1, '5': 9, '10': 'voucherCode'},
    {
      '1': 'inventory_transaction_ids',
      '3': 8,
      '4': 3,
      '5': 9,
      '10': 'inventoryTransactionIds'
    },
    {'1': 'message', '3': 9, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ProcessSaleWithVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List processSaleWithVoucherResponseDescriptor = $convert.base64Decode(
    'Ch5Qcm9jZXNzU2FsZVdpdGhWb3VjaGVyUmVzcG9uc2USHQoKaW52b2ljZV9pZBgBIAEoCVIJaW'
    '52b2ljZUlkEi8KB2ludm9pY2UYAiABKAsyFS5maW5hbmNpYWwudjEuSW52b2ljZVIHaW52b2lj'
    'ZRIdCgpwYXltZW50X2lkGAMgASgJUglwYXltZW50SWQSLgoHcGF5bWVudBgEIAEoCzIULnBheW'
    '1lbnRzLnYxLlBheW1lbnRSB3BheW1lbnQSHQoKdm91Y2hlcl9pZBgFIAEoCVIJdm91Y2hlcklk'
    'EjIKB3ZvdWNoZXIYBiABKAsyGC5wYXltZW50cy52MS5HaWZ0Vm91Y2hlclIHdm91Y2hlchIhCg'
    'x2b3VjaGVyX2NvZGUYByABKAlSC3ZvdWNoZXJDb2RlEjoKGWludmVudG9yeV90cmFuc2FjdGlv'
    'bl9pZHMYCCADKAlSF2ludmVudG9yeVRyYW5zYWN0aW9uSWRzEhgKB21lc3NhZ2UYCSABKAlSB2'
    '1lc3NhZ2U=');

@$core.Deprecated('Use payWithVoucherRequestDescriptor instead')
const PayWithVoucherRequest$json = {
  '1': 'PayWithVoucherRequest',
  '2': [
    {'1': 'cashier_user_id', '3': 1, '4': 1, '5': 9, '10': 'cashierUserId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'voucher_code', '3': 3, '4': 1, '5': 9, '10': 'voucherCode'},
    {
      '1': 'items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.SaleLineItem',
      '10': 'items'
    },
    {
      '1': 'additional_cash_payment',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'additionalCashPayment'
    },
    {
      '1': 'additional_payment_method',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.payments.v1.PaymentMethod',
      '10': 'additionalPaymentMethod'
    },
  ],
};

/// Descriptor for `PayWithVoucherRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payWithVoucherRequestDescriptor = $convert.base64Decode(
    'ChVQYXlXaXRoVm91Y2hlclJlcXVlc3QSJgoPY2FzaGllcl91c2VyX2lkGAEgASgJUg1jYXNoaW'
    'VyVXNlcklkEhkKCHN0b3JlX2lkGAIgASgJUgdzdG9yZUlkEiEKDHZvdWNoZXJfY29kZRgDIAEo'
    'CVILdm91Y2hlckNvZGUSLwoFaXRlbXMYBCADKAsyGS5wYXltZW50cy52MS5TYWxlTGluZUl0ZW'
    '1SBWl0ZW1zEjYKF2FkZGl0aW9uYWxfY2FzaF9wYXltZW50GAUgASgDUhVhZGRpdGlvbmFsQ2Fz'
    'aFBheW1lbnQSVgoZYWRkaXRpb25hbF9wYXltZW50X21ldGhvZBgGIAEoDjIaLnBheW1lbnRzLn'
    'YxLlBheW1lbnRNZXRob2RSF2FkZGl0aW9uYWxQYXltZW50TWV0aG9k');

@$core.Deprecated('Use payWithVoucherResponseDescriptor instead')
const PayWithVoucherResponse$json = {
  '1': 'PayWithVoucherResponse',
  '2': [
    {'1': 'receipt_id', '3': 1, '4': 1, '5': 9, '10': 'receiptId'},
    {
      '1': 'receipt',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.CashReceipt',
      '10': 'receipt'
    },
    {
      '1': 'voucher_transaction_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'voucherTransactionId'
    },
    {
      '1': 'voucher_transaction',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.VoucherTransaction',
      '10': 'voucherTransaction'
    },
    {
      '1': 'voucher_amount_used',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'voucherAmountUsed'
    },
    {
      '1': 'voucher_remaining',
      '3': 6,
      '4': 1,
      '5': 3,
      '10': 'voucherRemaining'
    },
    {
      '1': 'voucher_fully_used',
      '3': 7,
      '4': 1,
      '5': 8,
      '10': 'voucherFullyUsed'
    },
    {'1': 'message', '3': 8, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `PayWithVoucherResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List payWithVoucherResponseDescriptor = $convert.base64Decode(
    'ChZQYXlXaXRoVm91Y2hlclJlc3BvbnNlEh0KCnJlY2VpcHRfaWQYASABKAlSCXJlY2VpcHRJZB'
    'IyCgdyZWNlaXB0GAIgASgLMhgucGF5bWVudHMudjEuQ2FzaFJlY2VpcHRSB3JlY2VpcHQSNAoW'
    'dm91Y2hlcl90cmFuc2FjdGlvbl9pZBgDIAEoCVIUdm91Y2hlclRyYW5zYWN0aW9uSWQSUAoTdm'
    '91Y2hlcl90cmFuc2FjdGlvbhgEIAEoCzIfLnBheW1lbnRzLnYxLlZvdWNoZXJUcmFuc2FjdGlv'
    'blISdm91Y2hlclRyYW5zYWN0aW9uEi4KE3ZvdWNoZXJfYW1vdW50X3VzZWQYBSABKANSEXZvdW'
    'NoZXJBbW91bnRVc2VkEisKEXZvdWNoZXJfcmVtYWluaW5nGAYgASgDUhB2b3VjaGVyUmVtYWlu'
    'aW5nEiwKEnZvdWNoZXJfZnVsbHlfdXNlZBgHIAEoCFIQdm91Y2hlckZ1bGx5VXNlZBIYCgdtZX'
    'NzYWdlGAggASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getCashierDailySummaryRequestDescriptor instead')
const GetCashierDailySummaryRequest$json = {
  '1': 'GetCashierDailySummaryRequest',
  '2': [
    {'1': 'cashier_user_id', '3': 1, '4': 1, '5': 9, '10': 'cashierUserId'},
    {
      '1': 'date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'date'
    },
  ],
};

/// Descriptor for `GetCashierDailySummaryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCashierDailySummaryRequestDescriptor =
    $convert.base64Decode(
        'Ch1HZXRDYXNoaWVyRGFpbHlTdW1tYXJ5UmVxdWVzdBImCg9jYXNoaWVyX3VzZXJfaWQYASABKA'
        'lSDWNhc2hpZXJVc2VySWQSLgoEZGF0ZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
        'bXBSBGRhdGU=');

@$core.Deprecated('Use getCashierDailySummaryResponseDescriptor instead')
const GetCashierDailySummaryResponse$json = {
  '1': 'GetCashierDailySummaryResponse',
  '2': [
    {'1': 'cashier_user_id', '3': 1, '4': 1, '5': 9, '10': 'cashierUserId'},
    {
      '1': 'date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'date'
    },
    {
      '1': 'total_transactions',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'totalTransactions'
    },
    {
      '1': 'total_sales_amount',
      '3': 4,
      '4': 1,
      '5': 3,
      '10': 'totalSalesAmount'
    },
    {
      '1': 'total_cash_collected',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'totalCashCollected'
    },
    {
      '1': 'total_card_payments',
      '3': 6,
      '4': 1,
      '5': 3,
      '10': 'totalCardPayments'
    },
    {
      '1': 'total_mobile_money',
      '3': 7,
      '4': 1,
      '5': 3,
      '10': 'totalMobileMoney'
    },
    {
      '1': 'total_vouchers_issued',
      '3': 8,
      '4': 1,
      '5': 3,
      '10': 'totalVouchersIssued'
    },
    {
      '1': 'total_vouchers_redeemed',
      '3': 9,
      '4': 1,
      '5': 3,
      '10': 'totalVouchersRedeemed'
    },
    {
      '1': 'receipts',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.CashReceipt',
      '10': 'receipts'
    },
  ],
};

/// Descriptor for `GetCashierDailySummaryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getCashierDailySummaryResponseDescriptor = $convert.base64Decode(
    'Ch5HZXRDYXNoaWVyRGFpbHlTdW1tYXJ5UmVzcG9uc2USJgoPY2FzaGllcl91c2VyX2lkGAEgAS'
    'gJUg1jYXNoaWVyVXNlcklkEi4KBGRhdGUYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
    'YW1wUgRkYXRlEi0KEnRvdGFsX3RyYW5zYWN0aW9ucxgDIAEoBVIRdG90YWxUcmFuc2FjdGlvbn'
    'MSLAoSdG90YWxfc2FsZXNfYW1vdW50GAQgASgDUhB0b3RhbFNhbGVzQW1vdW50EjAKFHRvdGFs'
    'X2Nhc2hfY29sbGVjdGVkGAUgASgDUhJ0b3RhbENhc2hDb2xsZWN0ZWQSLgoTdG90YWxfY2FyZF'
    '9wYXltZW50cxgGIAEoA1IRdG90YWxDYXJkUGF5bWVudHMSLAoSdG90YWxfbW9iaWxlX21vbmV5'
    'GAcgASgDUhB0b3RhbE1vYmlsZU1vbmV5EjIKFXRvdGFsX3ZvdWNoZXJzX2lzc3VlZBgIIAEoA1'
    'ITdG90YWxWb3VjaGVyc0lzc3VlZBI2Chd0b3RhbF92b3VjaGVyc19yZWRlZW1lZBgJIAEoA1IV'
    'dG90YWxWb3VjaGVyc1JlZGVlbWVkEjQKCHJlY2VpcHRzGAogAygLMhgucGF5bWVudHMudjEuQ2'
    'FzaFJlY2VpcHRSCHJlY2VpcHRz');

const $core.Map<$core.String, $core.dynamic> PointOfSaleServiceBase$json = {
  '1': 'PointOfSaleService',
  '2': [
    {
      '1': 'CreateCashReceipt',
      '2': '.payments.v1.CreateCashReceiptRequest',
      '3': '.payments.v1.CreateCashReceiptResponse'
    },
    {
      '1': 'ProcessSaleWithVoucher',
      '2': '.payments.v1.ProcessSaleWithVoucherRequest',
      '3': '.payments.v1.ProcessSaleWithVoucherResponse'
    },
    {
      '1': 'PayWithVoucher',
      '2': '.payments.v1.PayWithVoucherRequest',
      '3': '.payments.v1.PayWithVoucherResponse'
    },
    {
      '1': 'GetCashierDailySummary',
      '2': '.payments.v1.GetCashierDailySummaryRequest',
      '3': '.payments.v1.GetCashierDailySummaryResponse'
    },
  ],
};

@$core.Deprecated('Use pointOfSaleServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PointOfSaleServiceBase$messageJson = {
  '.payments.v1.CreateCashReceiptRequest': CreateCashReceiptRequest$json,
  '.payments.v1.SaleLineItem': SaleLineItem$json,
  '.payments.v1.CreateCashReceiptResponse': CreateCashReceiptResponse$json,
  '.payments.v1.CashReceipt': $0.CashReceipt$json,
  '.financial.v1.InvoiceLineItem': $6.InvoiceLineItem$json,
  '.inventory.v1.Internationalized': $7.Internationalized$json,
  '.google.protobuf.Timestamp': $4.Timestamp$json,
  '.payments.v1.ProcessSaleWithVoucherRequest':
      ProcessSaleWithVoucherRequest$json,
  '.payments.v1.ProcessSaleWithVoucherResponse':
      ProcessSaleWithVoucherResponse$json,
  '.financial.v1.Invoice': $1.Invoice$json,
  '.payments.v1.Payment': $2.Payment$json,
  '.payments.v1.GiftVoucher': $3.GiftVoucher$json,
  '.payments.v1.PayWithVoucherRequest': PayWithVoucherRequest$json,
  '.payments.v1.PayWithVoucherResponse': PayWithVoucherResponse$json,
  '.payments.v1.VoucherTransaction': $3.VoucherTransaction$json,
  '.payments.v1.GetCashierDailySummaryRequest':
      GetCashierDailySummaryRequest$json,
  '.payments.v1.GetCashierDailySummaryResponse':
      GetCashierDailySummaryResponse$json,
};

/// Descriptor for `PointOfSaleService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List pointOfSaleServiceDescriptor = $convert.base64Decode(
    'ChJQb2ludE9mU2FsZVNlcnZpY2USYgoRQ3JlYXRlQ2FzaFJlY2VpcHQSJS5wYXltZW50cy52MS'
    '5DcmVhdGVDYXNoUmVjZWlwdFJlcXVlc3QaJi5wYXltZW50cy52MS5DcmVhdGVDYXNoUmVjZWlw'
    'dFJlc3BvbnNlEnEKFlByb2Nlc3NTYWxlV2l0aFZvdWNoZXISKi5wYXltZW50cy52MS5Qcm9jZX'
    'NzU2FsZVdpdGhWb3VjaGVyUmVxdWVzdBorLnBheW1lbnRzLnYxLlByb2Nlc3NTYWxlV2l0aFZv'
    'dWNoZXJSZXNwb25zZRJZCg5QYXlXaXRoVm91Y2hlchIiLnBheW1lbnRzLnYxLlBheVdpdGhWb3'
    'VjaGVyUmVxdWVzdBojLnBheW1lbnRzLnYxLlBheVdpdGhWb3VjaGVyUmVzcG9uc2UScQoWR2V0'
    'Q2FzaGllckRhaWx5U3VtbWFyeRIqLnBheW1lbnRzLnYxLkdldENhc2hpZXJEYWlseVN1bW1hcn'
    'lSZXF1ZXN0GisucGF5bWVudHMudjEuR2V0Q2FzaGllckRhaWx5U3VtbWFyeVJlc3BvbnNl');
