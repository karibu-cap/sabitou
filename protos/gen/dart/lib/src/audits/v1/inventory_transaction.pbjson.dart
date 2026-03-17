// This is a generated file - do not edit.
//
// Generated from audits/v1/inventory_transaction.proto.

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
    {'1': 'TXN_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'TXN_TYPE_PURCHASE', '2': 1},
    {'1': 'TXN_TYPE_SALE', '2': 2},
    {'1': 'TXN_TYPE_RETURN_IN', '2': 3},
    {'1': 'TXN_TYPE_RETURN_OUT', '2': 4},
    {'1': 'TXN_TYPE_TRANSFER_OUT', '2': 5},
    {'1': 'TXN_TYPE_TRANSFER_IN', '2': 6},
    {'1': 'TXN_TYPE_ADJUSTMENT', '2': 7},
    {'1': 'TXN_TYPE_DAMAGE', '2': 8},
    {'1': 'TXN_TYPE_THEFT', '2': 9},
    {'1': 'TXN_TYPE_INITIAL', '2': 10},
    {'1': 'TXN_TYPE_EXPIRATION', '2': 11},
  ],
};

/// Descriptor for `TransactionType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List transactionTypeDescriptor = $convert.base64Decode(
    'Cg9UcmFuc2FjdGlvblR5cGUSGAoUVFhOX1RZUEVfVU5TUEVDSUZJRUQQABIVChFUWE5fVFlQRV'
    '9QVVJDSEFTRRABEhEKDVRYTl9UWVBFX1NBTEUQAhIWChJUWE5fVFlQRV9SRVRVUk5fSU4QAxIX'
    'ChNUWE5fVFlQRV9SRVRVUk5fT1VUEAQSGQoVVFhOX1RZUEVfVFJBTlNGRVJfT1VUEAUSGAoUVF'
    'hOX1RZUEVfVFJBTlNGRVJfSU4QBhIXChNUWE5fVFlQRV9BREpVU1RNRU5UEAcSEwoPVFhOX1RZ'
    'UEVfREFNQUdFEAgSEgoOVFhOX1RZUEVfVEhFRlQQCRIUChBUWE5fVFlQRV9JTklUSUFMEAoSFw'
    'oTVFhOX1RZUEVfRVhQSVJBVElPThAL');

@$core.Deprecated('Use inventoryTransactionDescriptor instead')
const InventoryTransaction$json = {
  '1': 'InventoryTransaction',
  '2': [
    {
      '1': 'ref_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '8': {},
      '9': 0,
      '10': 'refId',
      '17': true
    },
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'product_id', '3': 3, '4': 1, '5': 9, '10': 'productId'},
    {
      '1': 'transaction_type',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.audits.v1.TransactionType',
      '10': 'transactionType'
    },
    {'1': 'quantity_change', '3': 5, '4': 1, '5': 5, '10': 'quantityChange'},
    {'1': 'quantity_before', '3': 6, '4': 1, '5': 5, '10': 'quantityBefore'},
    {'1': 'quantity_after', '3': 7, '4': 1, '5': 5, '10': 'quantityAfter'},
    {
      '1': 'related_document_type',
      '3': 8,
      '4': 1,
      '5': 9,
      '10': 'relatedDocumentType'
    },
    {
      '1': 'related_document_id',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'relatedDocumentId'
    },
    {
      '1': 'performed_by_user_id',
      '3': 10,
      '4': 1,
      '5': 9,
      '10': 'performedByUserId'
    },
    {
      '1': 'transaction_time',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'transactionTime'
    },
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '10': 'notes'},
    {'1': 'batch_id', '3': 13, '4': 1, '5': 9, '10': 'batchId'},
    {'1': 'unit_price', '3': 14, '4': 1, '5': 1, '10': 'unitPrice'},
    {'1': 'total_amount', '3': 15, '4': 1, '5': 1, '10': 'totalAmount'},
    {'1': 'currency', '3': 16, '4': 1, '5': 9, '10': 'currency'},
  ],
  '8': [
    {'1': '_ref_id'},
  ],
};

/// Descriptor for `InventoryTransaction`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryTransactionDescriptor = $convert.base64Decode(
    'ChRJbnZlbnRvcnlUcmFuc2FjdGlvbhIiCgZyZWZfaWQYASABKAlCBrpIA8gBAUgAUgVyZWZJZI'
    'gBARIZCghzdG9yZV9pZBgCIAEoCVIHc3RvcmVJZBIdCgpwcm9kdWN0X2lkGAMgASgJUglwcm9k'
    'dWN0SWQSRQoQdHJhbnNhY3Rpb25fdHlwZRgEIAEoDjIaLmF1ZGl0cy52MS5UcmFuc2FjdGlvbl'
    'R5cGVSD3RyYW5zYWN0aW9uVHlwZRInCg9xdWFudGl0eV9jaGFuZ2UYBSABKAVSDnF1YW50aXR5'
    'Q2hhbmdlEicKD3F1YW50aXR5X2JlZm9yZRgGIAEoBVIOcXVhbnRpdHlCZWZvcmUSJQoOcXVhbn'
    'RpdHlfYWZ0ZXIYByABKAVSDXF1YW50aXR5QWZ0ZXISMgoVcmVsYXRlZF9kb2N1bWVudF90eXBl'
    'GAggASgJUhNyZWxhdGVkRG9jdW1lbnRUeXBlEi4KE3JlbGF0ZWRfZG9jdW1lbnRfaWQYCSABKA'
    'lSEXJlbGF0ZWREb2N1bWVudElkEi8KFHBlcmZvcm1lZF9ieV91c2VyX2lkGAogASgJUhFwZXJm'
    'b3JtZWRCeVVzZXJJZBJFChB0cmFuc2FjdGlvbl90aW1lGAsgASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcFIPdHJhbnNhY3Rpb25UaW1lEhQKBW5vdGVzGAwgASgJUgVub3RlcxIZCghi'
    'YXRjaF9pZBgNIAEoCVIHYmF0Y2hJZBIdCgp1bml0X3ByaWNlGA4gASgBUgl1bml0UHJpY2USIQ'
    'oMdG90YWxfYW1vdW50GA8gASgBUgt0b3RhbEFtb3VudBIaCghjdXJyZW5jeRgQIAEoCVIIY3Vy'
    'cmVuY3lCCQoHX3JlZl9pZA==');
