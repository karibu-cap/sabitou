// This is a generated file - do not edit.
//
// Generated from logistic/v1/receiving_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use receivingNoteStatusDescriptor instead')
const ReceivingNoteStatus$json = {
  '1': 'ReceivingNoteStatus',
  '2': [
    {'1': 'RN_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'RN_STATUS_PENDING', '2': 1},
    {'1': 'RN_STATUS_COMPLETED', '2': 2},
    {'1': 'RN_STATUS_REJECTED', '2': 3},
  ],
};

/// Descriptor for `ReceivingNoteStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List receivingNoteStatusDescriptor = $convert.base64Decode(
    'ChNSZWNlaXZpbmdOb3RlU3RhdHVzEhkKFVJOX1NUQVRVU19VTlNQRUNJRklFRBAAEhUKEVJOX1'
    'NUQVRVU19QRU5ESU5HEAESFwoTUk5fU1RBVFVTX0NPTVBMRVRFRBACEhYKElJOX1NUQVRVU19S'
    'RUpFQ1RFRBAD');

@$core.Deprecated('Use receivingNoteDescriptor instead')
const ReceivingNote$json = {
  '1': 'ReceivingNote',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {
      '1': 'related_purchase_order_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'relatedPurchaseOrderId'
    },
    {'1': 'supplier_id', '3': 3, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'buyer_id', '3': 4, '4': 1, '5': 9, '10': 'buyerId'},
    {
      '1': 'items',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.ReceivingLineItem',
      '10': 'items'
    },
    {
      '1': 'received_by_user_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'receivedByUserId'
    },
    {
      '1': 'received_at',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'receivedAt'
    },
    {'1': 'notes', '3': 8, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `ReceivingNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receivingNoteDescriptor = $convert.base64Decode(
    'Cg1SZWNlaXZpbmdOb3RlEicKC2RvY3VtZW50X2lkGAEgASgJQga6SAPIAQFSCmRvY3VtZW50SW'
    'QSOQoZcmVsYXRlZF9wdXJjaGFzZV9vcmRlcl9pZBgCIAEoCVIWcmVsYXRlZFB1cmNoYXNlT3Jk'
    'ZXJJZBIfCgtzdXBwbGllcl9pZBgDIAEoCVIKc3VwcGxpZXJJZBIZCghidXllcl9pZBgEIAEoCV'
    'IHYnV5ZXJJZBI0CgVpdGVtcxgFIAMoCzIeLmxvZ2lzdGljLnYxLlJlY2VpdmluZ0xpbmVJdGVt'
    'UgVpdGVtcxItChNyZWNlaXZlZF9ieV91c2VyX2lkGAYgASgJUhByZWNlaXZlZEJ5VXNlcklkEj'
    'sKC3JlY2VpdmVkX2F0GAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKcmVjZWl2'
    'ZWRBdBIUCgVub3RlcxgIIAEoCVIFbm90ZXM=');

@$core.Deprecated('Use receivingLineItemDescriptor instead')
const ReceivingLineItem$json = {
  '1': 'ReceivingLineItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {
      '1': 'quantity_expected',
      '3': 2,
      '4': 1,
      '5': 1,
      '10': 'quantityExpected'
    },
    {
      '1': 'quantity_received',
      '3': 3,
      '4': 1,
      '5': 1,
      '10': 'quantityReceived'
    },
    {
      '1': 'quantity_rejected',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'quantityRejected'
    },
    {'1': 'rejection_reason', '3': 5, '4': 1, '5': 9, '10': 'rejectionReason'},
    {
      '1': 'batch_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'batchId',
      '17': true
    },
    {
      '1': 'expiration_date',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expirationDate'
    },
    {'1': 'purchase_price', '3': 8, '4': 1, '5': 5, '10': 'purchasePrice'},
  ],
  '8': [
    {'1': '_batch_id'},
  ],
};

/// Descriptor for `ReceivingLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receivingLineItemDescriptor = $convert.base64Decode(
    'ChFSZWNlaXZpbmdMaW5lSXRlbRIdCgpwcm9kdWN0X2lkGAEgASgJUglwcm9kdWN0SWQSKwoRcX'
    'VhbnRpdHlfZXhwZWN0ZWQYAiABKAFSEHF1YW50aXR5RXhwZWN0ZWQSKwoRcXVhbnRpdHlfcmVj'
    'ZWl2ZWQYAyABKAFSEHF1YW50aXR5UmVjZWl2ZWQSKwoRcXVhbnRpdHlfcmVqZWN0ZWQYBCABKA'
    'FSEHF1YW50aXR5UmVqZWN0ZWQSKQoQcmVqZWN0aW9uX3JlYXNvbhgFIAEoCVIPcmVqZWN0aW9u'
    'UmVhc29uEh4KCGJhdGNoX2lkGAYgASgJSABSB2JhdGNoSWSIAQESQwoPZXhwaXJhdGlvbl9kYX'
    'RlGAcgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIOZXhwaXJhdGlvbkRhdGUSJQoO'
    'cHVyY2hhc2VfcHJpY2UYCCABKAVSDXB1cmNoYXNlUHJpY2VCCwoJX2JhdGNoX2lk');
