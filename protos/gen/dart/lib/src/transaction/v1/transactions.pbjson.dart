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

@$core.Deprecated('Use transactionTypeDescriptor instead')
const TransactionType$json = {
  '1': 'TransactionType',
  '2': [
    {'1': 'TRANSACTION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'TRANSACTION_TYPE_SALE', '2': 1},
    {'1': 'TRANSACTION_TYPE_PURCHASE', '2': 2},
    {'1': 'TRANSACTION_TYPE_REFUND', '2': 3},
    {'1': 'TRANSACTION_TYPE_ADJUSTMENT', '2': 4},
    {'1': 'TRANSACTION_TYPE_TRANSFER', '2': 5},
    {'1': 'TRANSACTION_TYPE_FEE', '2': 6},
  ],
};

/// Descriptor for `TransactionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionTypeDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvblR5cGUSIAocVFJBTlNBQ1RJT05fVFlQRV9VTlNQRUNJRklFRBAAEhkKFV'
    'RSQU5TQUNUSU9OX1RZUEVfU0FMRRABEh0KGVRSQU5TQUNUSU9OX1RZUEVfUFVSQ0hBU0UQAhIb'
    'ChdUUkFOU0FDVElPTl9UWVBFX1JFRlVORBADEh8KG1RSQU5TQUNUSU9OX1RZUEVfQURKVVNUTU'
    'VOVBAEEh0KGVRSQU5TQUNUSU9OX1RZUEVfVFJBTlNGRVIQBRIYChRUUkFOU0FDVElPTl9UWVBF'
    'X0ZFRRAG');

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
    {'1': 'business_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'businessId'},
    {
      '1': 'store_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'storeId',
      '17': true
    },
    {
      '1': 'order_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'orderId',
      '17': true
    },
    {
      '1': 'from_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'fromId',
      '17': true
    },
    {'1': 'amount_in_cents', '3': 8, '4': 1, '5': 3, '10': 'amountInCents'},
    {
      '1': 'currency_code',
      '3': 9,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'currencyCode'
    },
    {'1': 'created_at', '3': 10, '4': 1, '5': 9, '10': 'createdAt'},
    {
      '1': 'updated_at',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'updatedAt',
      '17': true
    },
    {
      '1': 'description',
      '3': 12,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'description',
      '17': true
    },
    {
      '1': 'business_product_id',
      '3': 13,
      '4': 1,
      '5': 9,
      '9': 6,
      '10': 'businessProductId',
      '17': true
    },
    {
      '1': 'quantity',
      '3': 14,
      '4': 1,
      '5': 5,
      '9': 7,
      '10': 'quantity',
      '17': true
    },
    {
      '1': 'initiated_by',
      '3': 15,
      '4': 1,
      '5': 9,
      '9': 8,
      '10': 'initiatedBy',
      '17': true
    },
    {
      '1': 'external_links_ids',
      '3': 16,
      '4': 3,
      '5': 9,
      '10': 'externalLinksIds'
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_store_id'},
    {'1': '_order_id'},
    {'1': '_from_id'},
    {'1': '_updated_at'},
    {'1': '_description'},
    {'1': '_business_product_id'},
    {'1': '_quantity'},
    {'1': '_initiated_by'},
  ],
};

/// Descriptor for `Transaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List transactionDescriptor = $convert.base64Decode(
    'CgtUcmFuc2FjdGlvbhIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESMwoEdHlwZRgCIAEoDj'
    'IfLnRyYW5zYWN0aW9uLnYxLlRyYW5zYWN0aW9uVHlwZVIEdHlwZRI5CgZzdGF0dXMYAyABKA4y'
    'IS50cmFuc2FjdGlvbi52MS5UcmFuc2FjdGlvblN0YXR1c1IGc3RhdHVzEisKC2J1c2luZXNzX2'
    'lkGAQgASgJQgq6SAfIAQFyAhADUgpidXNpbmVzc0lkEh4KCHN0b3JlX2lkGAUgASgJSAFSB3N0'
    'b3JlSWSIAQESHgoIb3JkZXJfaWQYBiABKAlIAlIHb3JkZXJJZIgBARIcCgdmcm9tX2lkGAcgAS'
    'gJSANSBmZyb21JZIgBARImCg9hbW91bnRfaW5fY2VudHMYCCABKANSDWFtb3VudEluQ2VudHMS'
    'KwoNY3VycmVuY3lfY29kZRgJIAEoCUIGukgDyAEBUgxjdXJyZW5jeUNvZGUSHQoKY3JlYXRlZF'
    '9hdBgKIAEoCVIJY3JlYXRlZEF0EiIKCnVwZGF0ZWRfYXQYCyABKAlIBFIJdXBkYXRlZEF0iAEB'
    'EiUKC2Rlc2NyaXB0aW9uGAwgASgJSAVSC2Rlc2NyaXB0aW9uiAEBEjMKE2J1c2luZXNzX3Byb2'
    'R1Y3RfaWQYDSABKAlIBlIRYnVzaW5lc3NQcm9kdWN0SWSIAQESHwoIcXVhbnRpdHkYDiABKAVI'
    'B1IIcXVhbnRpdHmIAQESJgoMaW5pdGlhdGVkX2J5GA8gASgJSAhSC2luaXRpYXRlZEJ5iAEBEi'
    'wKEmV4dGVybmFsX2xpbmtzX2lkcxgQIAMoCVIQZXh0ZXJuYWxMaW5rc0lkc0IJCgdfcmVmX2lk'
    'QgsKCV9zdG9yZV9pZEILCglfb3JkZXJfaWRCCgoIX2Zyb21faWRCDQoLX3VwZGF0ZWRfYXRCDg'
    'oMX2Rlc2NyaXB0aW9uQhYKFF9idXNpbmVzc19wcm9kdWN0X2lkQgsKCV9xdWFudGl0eUIPCg1f'
    'aW5pdGlhdGVkX2J5');

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
  ],
};

@$core.Deprecated('Use transactionServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    TransactionServiceBase$messageJson = {
  '.transaction.v1.AddTransactionRequest': AddTransactionRequest$json,
  '.transaction.v1.Transaction': Transaction$json,
  '.transaction.v1.AddTransactionResponse': AddTransactionResponse$json,
  '.transaction.v1.GetTransactionRequest': GetTransactionRequest$json,
  '.transaction.v1.GetTransactionResponse': GetTransactionResponse$json,
  '.transaction.v1.UpdateTransactionRequest': UpdateTransactionRequest$json,
  '.transaction.v1.UpdateTransactionResponse': UpdateTransactionResponse$json,
  '.transaction.v1.DeleteTransactionRequest': DeleteTransactionRequest$json,
  '.transaction.v1.DeleteTransactionResponse': DeleteTransactionResponse$json,
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
    'Fuc2FjdGlvbi52MS5EZWxldGVUcmFuc2FjdGlvblJlc3BvbnNl');
