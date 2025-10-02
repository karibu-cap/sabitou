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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use receivingNoteStatusDescriptor instead')
const ReceivingNoteStatus$json = {
  '1': 'ReceivingNoteStatus',
  '2': [
    {'1': 'RN_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'RN_STATUS_PENDING', '2': 1},
    {'1': 'RN_STATUS_INSPECTING', '2': 2},
    {'1': 'RN_STATUS_COMPLETED', '2': 3},
    {'1': 'RN_STATUS_REJECTED', '2': 4},
  ],
};

/// Descriptor for `ReceivingNoteStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List receivingNoteStatusDescriptor = $convert.base64Decode(
    'ChNSZWNlaXZpbmdOb3RlU3RhdHVzEhkKFVJOX1NUQVRVU19VTlNQRUNJRklFRBAAEhUKEVJOX1'
    'NUQVRVU19QRU5ESU5HEAESGAoUUk5fU1RBVFVTX0lOU1BFQ1RJTkcQAhIXChNSTl9TVEFUVVNf'
    'Q09NUExFVEVEEAMSFgoSUk5fU1RBVFVTX1JFSkVDVEVEEAQ=');

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
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReceivingNoteStatus',
      '10': 'status'
    },
    {
      '1': 'items',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.ReceivingLineItem',
      '10': 'items'
    },
    {
      '1': 'received_by_user_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'receivedByUserId'
    },
    {
      '1': 'received_at',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'receivedAt'
    },
    {'1': 'notes', '3': 9, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `ReceivingNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List receivingNoteDescriptor = $convert.base64Decode(
    'Cg1SZWNlaXZpbmdOb3RlEicKC2RvY3VtZW50X2lkGAEgASgJQga6SAPIAQFSCmRvY3VtZW50SW'
    'QSOQoZcmVsYXRlZF9wdXJjaGFzZV9vcmRlcl9pZBgCIAEoCVIWcmVsYXRlZFB1cmNoYXNlT3Jk'
    'ZXJJZBIfCgtzdXBwbGllcl9pZBgDIAEoCVIKc3VwcGxpZXJJZBIZCghidXllcl9pZBgEIAEoCV'
    'IHYnV5ZXJJZBI4CgZzdGF0dXMYBSABKA4yIC5sb2dpc3RpYy52MS5SZWNlaXZpbmdOb3RlU3Rh'
    'dHVzUgZzdGF0dXMSNAoFaXRlbXMYBiADKAsyHi5sb2dpc3RpYy52MS5SZWNlaXZpbmdMaW5lSX'
    'RlbVIFaXRlbXMSLQoTcmVjZWl2ZWRfYnlfdXNlcl9pZBgHIAEoCVIQcmVjZWl2ZWRCeVVzZXJJ'
    'ZBI7CgtyZWNlaXZlZF9hdBgIIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCnJlY2'
    'VpdmVkQXQSFAoFbm90ZXMYCSABKAlSBW5vdGVz');

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

@$core.Deprecated('Use createReceivingNoteRequestDescriptor instead')
const CreateReceivingNoteRequest$json = {
  '1': 'CreateReceivingNoteRequest',
  '2': [
    {
      '1': 'receiving_note',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.logistic.v1.ReceivingNote',
      '10': 'receivingNote'
    },
  ],
};

/// Descriptor for `CreateReceivingNoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReceivingNoteRequestDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVSZWNlaXZpbmdOb3RlUmVxdWVzdBJBCg5yZWNlaXZpbmdfbm90ZRgBIAEoCzIaLm'
        'xvZ2lzdGljLnYxLlJlY2VpdmluZ05vdGVSDXJlY2VpdmluZ05vdGU=');

@$core.Deprecated('Use createReceivingNoteResponseDescriptor instead')
const CreateReceivingNoteResponse$json = {
  '1': 'CreateReceivingNoteResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateReceivingNoteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReceivingNoteResponseDescriptor =
    $convert.base64Decode(
        'ChtDcmVhdGVSZWNlaXZpbmdOb3RlUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2Vzcw'
        '==');

const $core.Map<$core.String, $core.dynamic> ReceivingNoteServiceBase$json = {
  '1': 'ReceivingNoteService',
  '2': [
    {
      '1': 'CreateReceivingNote',
      '2': '.logistic.v1.CreateReceivingNoteRequest',
      '3': '.logistic.v1.CreateReceivingNoteResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use receivingNoteServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ReceivingNoteServiceBase$messageJson = {
  '.logistic.v1.CreateReceivingNoteRequest': CreateReceivingNoteRequest$json,
  '.logistic.v1.ReceivingNote': ReceivingNote$json,
  '.logistic.v1.ReceivingLineItem': ReceivingLineItem$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.logistic.v1.CreateReceivingNoteResponse': CreateReceivingNoteResponse$json,
};

/// Descriptor for `ReceivingNoteService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List receivingNoteServiceDescriptor = $convert.base64Decode(
    'ChRSZWNlaXZpbmdOb3RlU2VydmljZRJqChNDcmVhdGVSZWNlaXZpbmdOb3RlEicubG9naXN0aW'
    'MudjEuQ3JlYXRlUmVjZWl2aW5nTm90ZVJlcXVlc3QaKC5sb2dpc3RpYy52MS5DcmVhdGVSZWNl'
    'aXZpbmdOb3RlUmVzcG9uc2UiAA==');
