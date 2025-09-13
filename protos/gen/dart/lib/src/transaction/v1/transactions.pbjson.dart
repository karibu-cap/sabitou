// This is a generated file - do not edit.
//
// Generated from transaction/v1/transactions.proto.

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

@$core.Deprecated('Use transactionTypeDescriptor instead')
const TransactionType$json = {
  '1': 'TransactionType',
  '2': [
    {'1': 'TRANSACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'TRANSACTION_TYPE_SALE', '2': 1},
    {'1': 'TRANSACTION_TYPE_PURCHASE', '2': 2},
    {'1': 'TRANSACTION_TYPE_REFUND', '2': 3},
    {'1': 'TRANSACTION_TYPE_ADJUSTMENT', '2': 4},
  ],
};

/// Descriptor for `TransactionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionTypeDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvblR5cGUSIAocVFJBTlNBQ1RJT05fVFlQRV9VTlNQRUNJRklFRBAAEhkKFV'
    'RSQU5TQUNUSU9OX1RZUEVfU0FMRRABEh0KGVRSQU5TQUNUSU9OX1RZUEVfUFVSQ0hBU0UQAhIb'
    'ChdUUkFOU0FDVElPTl9UWVBFX1JFRlVORBADEh8KG1RSQU5TQUNUSU9OX1RZUEVfQURKVVNUTU'
    'VOVBAE');

@$core.Deprecated('Use transactionStatusDescriptor instead')
const TransactionStatus$json = {
  '1': 'TransactionStatus',
  '2': [
    {'1': 'TRANSACTION_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'TRANSACTION_STATUS_PENDING', '2': 1},
    {'1': 'TRANSACTION_STATUS_COMPLETED', '2': 2},
    {'1': 'TRANSACTION_STATUS_FAILED', '2': 3},
    {'1': 'TRANSACTION_STATUS_CANCELLED', '2': 4},
  ],
};

/// Descriptor for `TransactionStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionStatusDescriptor = $convert.base64Decode(
    'ChFUcmFuc2FjdGlvblN0YXR1cxIiCh5UUkFOU0FDVElPTl9TVEFUVVNfVU5TUEVDSUZJRUQQAB'
    'IeChpUUkFOU0FDVElPTl9TVEFUVVNfUEVORElORxABEiAKHFRSQU5TQUNUSU9OX1NUQVRVU19D'
    'T01QTEVURUQQAhIdChlUUkFOU0FDVElPTl9TVEFUVVNfRkFJTEVEEAMSIAocVFJBTlNBQ1RJT0'
    '5fU1RBVFVTX0NBTkNFTExFRBAE');

@$core.Deprecated('Use transactionDescriptor instead')
const Transaction$json = {
  '1': 'Transaction',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {
      '1': 'type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.transaction.v1.TransactionType',
      '10': 'type'
    },
    {
      '1': 'status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.transaction.v1.TransactionStatus',
      '10': 'status'
    },
    {'1': 'store_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'order_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'orderId',
      '17': true
    },
    {
      '1': 'from_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'fromId',
      '17': true
    },
    {'1': 'amount', '3': 7, '4': 1, '5': 3, '10': 'amount'},
    {
      '1': 'currency_code',
      '3': 8,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'currencyCode'
    },
    {
      '1': 'created_at',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 3,
      '10': 'updatedAt',
      '17': true
    },
    {
      '1': 'description',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'description',
      '17': true
    },
    {
      '1': 'store_product_id',
      '3': 12,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'storeProductId',
      '17': true
    },
    {
      '1': 'quantity',
      '3': 13,
      '4': 1,
      '5': 5,
      '9': 6,
      '10': 'quantity',
      '17': true
    },
    {
      '1': 'initiated_by',
      '3': 14,
      '4': 1,
      '5': 9,
      '9': 7,
      '10': 'initiatedBy',
      '17': true
    },
    {
      '1': 'external_links_ids',
      '3': 15,
      '4': 3,
      '5': 9,
      '10': 'externalLinksIds'
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_order_id'},
    {'1': '_from_id'},
    {'1': '_updated_at'},
    {'1': '_description'},
    {'1': '_store_product_id'},
    {'1': '_quantity'},
    {'1': '_initiated_by'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESMwoEdHlwZRgCIAEoDj'
    'IfLnRyYW5zYWN0aW9uLnYxLlRyYW5zYWN0aW9uVHlwZVIEdHlwZRI5CgZzdGF0dXMYAyABKA4y'
    'IS50cmFuc2FjdGlvbi52MS5UcmFuc2FjdGlvblN0YXR1c1IGc3RhdHVzEiUKCHN0b3JlX2lkGA'
    'QgASgJQgq6SAfIAQFyAhADUgdzdG9yZUlkEh4KCG9yZGVyX2lkGAUgASgJSAFSB29yZGVySWSI'
    'AQESHAoHZnJvbV9pZBgGIAEoCUgCUgZmcm9tSWSIAQESFgoGYW1vdW50GAcgASgDUgZhbW91bn'
    'QSKwoNY3VycmVuY3lfY29kZRgIIAEoCUIGukgDyAEBUgxjdXJyZW5jeUNvZGUSOQoKY3JlYXRl'
    'ZF9hdBgJIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI+Cgp1cG'
    'RhdGVkX2F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgDUgl1cGRhdGVkQXSI'
    'AQESJQoLZGVzY3JpcHRpb24YCyABKAlIBFILZGVzY3JpcHRpb26IAQESLQoQc3RvcmVfcHJvZH'
    'VjdF9pZBgMIAEoCUgFUg5zdG9yZVByb2R1Y3RJZIgBARIfCghxdWFudGl0eRgNIAEoBUgGUghx'
    'dWFudGl0eYgBARImCgxpbml0aWF0ZWRfYnkYDiABKAlIB1ILaW5pdGlhdGVkQnmIAQESLAoSZX'
    'h0ZXJuYWxfbGlua3NfaWRzGA8gAygJUhBleHRlcm5hbExpbmtzSWRzQgkKB19yZWZfaWRCCwoJ'
    'X29yZGVyX2lkQgoKCF9mcm9tX2lkQg0KC191cGRhdGVkX2F0Qg4KDF9kZXNjcmlwdGlvbkITCh'
    'Ffc3RvcmVfcHJvZHVjdF9pZEILCglfcXVhbnRpdHlCDwoNX2luaXRpYXRlZF9ieQ==');

@$core.Deprecated('Use addTransactionRequestDescriptor instead')
const AddTransactionRequest$json = {
  '1': 'AddTransactionRequest',
  '2': [
    {
      '1': 'transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.transaction.v1.Transaction',
      '10': 'transaction'
    },
  ],
};

/// Descriptor for `AddTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTransactionRequestDescriptor = $convert.base64Decode(
    'ChVBZGRUcmFuc2FjdGlvblJlcXVlc3QSPQoLdHJhbnNhY3Rpb24YASABKAsyGy50cmFuc2FjdG'
    'lvbi52MS5UcmFuc2FjdGlvblILdHJhbnNhY3Rpb24=');

@$core.Deprecated('Use addTransactionResponseDescriptor instead')
const AddTransactionResponse$json = {
  '1': 'AddTransactionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `AddTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List addTransactionResponseDescriptor =
    $convert.base64Decode(
        'ChZBZGRUcmFuc2FjdGlvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use getTransactionRequestDescriptor instead')
const GetTransactionRequest$json = {
  '1': 'GetTransactionRequest',
  '2': [
    {'1': 'transaction_id', '3': 1, '4': 1, '5': 9, '10': 'transactionId'},
  ],
};

/// Descriptor for `GetTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionRequestDescriptor = $convert.base64Decode(
    'ChVHZXRUcmFuc2FjdGlvblJlcXVlc3QSJQoOdHJhbnNhY3Rpb25faWQYASABKAlSDXRyYW5zYW'
    'N0aW9uSWQ=');

@$core.Deprecated('Use getTransactionResponseDescriptor instead')
const GetTransactionResponse$json = {
  '1': 'GetTransactionResponse',
  '2': [
    {
      '1': 'transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.transaction.v1.Transaction',
      '10': 'transaction'
    },
  ],
};

/// Descriptor for `GetTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getTransactionResponseDescriptor =
    $convert.base64Decode(
        'ChZHZXRUcmFuc2FjdGlvblJlc3BvbnNlEj0KC3RyYW5zYWN0aW9uGAEgASgLMhsudHJhbnNhY3'
        'Rpb24udjEuVHJhbnNhY3Rpb25SC3RyYW5zYWN0aW9u');

@$core.Deprecated('Use updateTransactionRequestDescriptor instead')
const UpdateTransactionRequest$json = {
  '1': 'UpdateTransactionRequest',
  '2': [
    {
      '1': 'transaction',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.transaction.v1.Transaction',
      '10': 'transaction'
    },
  ],
};

/// Descriptor for `UpdateTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTransactionRequestDescriptor =
    $convert.base64Decode(
        'ChhVcGRhdGVUcmFuc2FjdGlvblJlcXVlc3QSPQoLdHJhbnNhY3Rpb24YASABKAsyGy50cmFuc2'
        'FjdGlvbi52MS5UcmFuc2FjdGlvblILdHJhbnNhY3Rpb24=');

@$core.Deprecated('Use updateTransactionResponseDescriptor instead')
const UpdateTransactionResponse$json = {
  '1': 'UpdateTransactionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateTransactionResponseDescriptor =
    $convert.base64Decode(
        'ChlVcGRhdGVUcmFuc2FjdGlvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use deleteTransactionRequestDescriptor instead')
const DeleteTransactionRequest$json = {
  '1': 'DeleteTransactionRequest',
  '2': [
    {'1': 'transaction_id', '3': 1, '4': 1, '5': 9, '10': 'transactionId'},
  ],
};

/// Descriptor for `DeleteTransactionRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTransactionRequestDescriptor =
    $convert.base64Decode(
        'ChhEZWxldGVUcmFuc2FjdGlvblJlcXVlc3QSJQoOdHJhbnNhY3Rpb25faWQYASABKAlSDXRyYW'
        '5zYWN0aW9uSWQ=');

@$core.Deprecated('Use deleteTransactionResponseDescriptor instead')
const DeleteTransactionResponse$json = {
  '1': 'DeleteTransactionResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteTransactionResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteTransactionResponseDescriptor =
    $convert.base64Decode(
        'ChlEZWxldGVUcmFuc2FjdGlvblJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use findTransactionsRequestDescriptor instead')
const FindTransactionsRequest$json = {
  '1': 'FindTransactionsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'order_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'orderId',
      '17': true
    },
    {
      '1': 'start_date',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'startDate',
      '17': true
    },
    {
      '1': 'end_date',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 2,
      '10': 'endDate',
      '17': true
    },
    {
      '1': 'type',
      '3': 6,
      '4': 3,
      '5': 14,
      '6': '.transaction.v1.TransactionType',
      '10': 'type'
    },
    {
      '1': 'status',
      '3': 7,
      '4': 3,
      '5': 14,
      '6': '.transaction.v1.TransactionStatus',
      '10': 'status'
    },
  ],
  '8': [
    {'1': '_order_id'},
    {'1': '_start_date'},
    {'1': '_end_date'},
  ],
};

/// Descriptor for `FindTransactionsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findTransactionsRequestDescriptor = $convert.base64Decode(
    'ChdGaW5kVHJhbnNhY3Rpb25zUmVxdWVzdBIlCghzdG9yZV9pZBgBIAEoCUIKukgHyAEBcgIQA1'
    'IHc3RvcmVJZBIeCghvcmRlcl9pZBgDIAEoCUgAUgdvcmRlcklkiAEBEj4KCnN0YXJ0X2RhdGUY'
    'BCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSCXN0YXJ0RGF0ZYgBARI6Cghlbm'
    'RfZGF0ZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAlIHZW5kRGF0ZYgBARIz'
    'CgR0eXBlGAYgAygOMh8udHJhbnNhY3Rpb24udjEuVHJhbnNhY3Rpb25UeXBlUgR0eXBlEjkKBn'
    'N0YXR1cxgHIAMoDjIhLnRyYW5zYWN0aW9uLnYxLlRyYW5zYWN0aW9uU3RhdHVzUgZzdGF0dXNC'
    'CwoJX29yZGVyX2lkQg0KC19zdGFydF9kYXRlQgsKCV9lbmRfZGF0ZQ==');

@$core.Deprecated('Use findTransactionsResponseDescriptor instead')
const FindTransactionsResponse$json = {
  '1': 'FindTransactionsResponse',
  '2': [
    {
      '1': 'transactions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.transaction.v1.Transaction',
      '10': 'transactions'
    },
  ],
};

/// Descriptor for `FindTransactionsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findTransactionsResponseDescriptor =
    $convert.base64Decode(
        'ChhGaW5kVHJhbnNhY3Rpb25zUmVzcG9uc2USPwoMdHJhbnNhY3Rpb25zGAEgAygLMhsudHJhbn'
        'NhY3Rpb24udjEuVHJhbnNhY3Rpb25SDHRyYW5zYWN0aW9ucw==');

const $core.Map<$core.String, $core.dynamic> TransactionServiceBase$json = {
  '1': 'TransactionService',
  '2': [
    {
      '1': 'AddTransaction',
      '2': '.transaction.v1.AddTransactionRequest',
      '3': '.transaction.v1.AddTransactionResponse'
    },
    {
      '1': 'GetTransaction',
      '2': '.transaction.v1.GetTransactionRequest',
      '3': '.transaction.v1.GetTransactionResponse'
    },
    {
      '1': 'UpdateTransaction',
      '2': '.transaction.v1.UpdateTransactionRequest',
      '3': '.transaction.v1.UpdateTransactionResponse'
    },
    {
      '1': 'DeleteTransaction',
      '2': '.transaction.v1.DeleteTransactionRequest',
      '3': '.transaction.v1.DeleteTransactionResponse'
    },
    {
      '1': 'FindTransactions',
      '2': '.transaction.v1.FindTransactionsRequest',
      '3': '.transaction.v1.FindTransactionsResponse'
    },
  ],
};

@$core.Deprecated('Use transactionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    TransactionServiceBase$messageJson = {
  '.transaction.v1.AddTransactionRequest': AddTransactionRequest$json,
  '.transaction.v1.Transaction': Transaction$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.transaction.v1.AddTransactionResponse': AddTransactionResponse$json,
  '.transaction.v1.GetTransactionRequest': GetTransactionRequest$json,
  '.transaction.v1.GetTransactionResponse': GetTransactionResponse$json,
  '.transaction.v1.UpdateTransactionRequest': UpdateTransactionRequest$json,
  '.transaction.v1.UpdateTransactionResponse': UpdateTransactionResponse$json,
  '.transaction.v1.DeleteTransactionRequest': DeleteTransactionRequest$json,
  '.transaction.v1.DeleteTransactionResponse': DeleteTransactionResponse$json,
  '.transaction.v1.FindTransactionsRequest': FindTransactionsRequest$json,
  '.transaction.v1.FindTransactionsResponse': FindTransactionsResponse$json,
};

/// Descriptor for `TransactionService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List transactionServiceDescriptor = $convert.base64Decode(
    'ChJUcmFuc2FjdGlvblNlcnZpY2USXwoOQWRkVHJhbnNhY3Rpb24SJS50cmFuc2FjdGlvbi52MS'
    '5BZGRUcmFuc2FjdGlvblJlcXVlc3QaJi50cmFuc2FjdGlvbi52MS5BZGRUcmFuc2FjdGlvblJl'
    'c3BvbnNlEl8KDkdldFRyYW5zYWN0aW9uEiUudHJhbnNhY3Rpb24udjEuR2V0VHJhbnNhY3Rpb2'
    '5SZXF1ZXN0GiYudHJhbnNhY3Rpb24udjEuR2V0VHJhbnNhY3Rpb25SZXNwb25zZRJoChFVcGRh'
    'dGVUcmFuc2FjdGlvbhIoLnRyYW5zYWN0aW9uLnYxLlVwZGF0ZVRyYW5zYWN0aW9uUmVxdWVzdB'
    'opLnRyYW5zYWN0aW9uLnYxLlVwZGF0ZVRyYW5zYWN0aW9uUmVzcG9uc2USaAoRRGVsZXRlVHJh'
    'bnNhY3Rpb24SKC50cmFuc2FjdGlvbi52MS5EZWxldGVUcmFuc2FjdGlvblJlcXVlc3QaKS50cm'
    'Fuc2FjdGlvbi52MS5EZWxldGVUcmFuc2FjdGlvblJlc3BvbnNlEmUKEEZpbmRUcmFuc2FjdGlv'
    'bnMSJy50cmFuc2FjdGlvbi52MS5GaW5kVHJhbnNhY3Rpb25zUmVxdWVzdBooLnRyYW5zYWN0aW'
    '9uLnYxLkZpbmRUcmFuc2FjdGlvbnNSZXNwb25zZQ==');
