// This is a generated file - do not edit.
//
// Generated from financial/v1/credit_note.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use creditNoteTypeDescriptor instead')
const CreditNoteType$json = {
  '1': 'CreditNoteType',
  '2': [
    {'1': 'CREDIT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'CREDIT_TYPE_RETURN', '2': 1},
    {'1': 'CREDIT_TYPE_PRICE_ERROR', '2': 2},
    {'1': 'CREDIT_TYPE_DISCOUNT', '2': 3},
    {'1': 'CREDIT_TYPE_CANCELLATION', '2': 4},
    {'1': 'CREDIT_TYPE_DAMAGED_GOODS', '2': 5},
  ],
};

/// Descriptor for `CreditNoteType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List creditNoteTypeDescriptor = $convert.base64Decode(
    'Cg5DcmVkaXROb3RlVHlwZRIbChdDUkVESVRfVFlQRV9VTlNQRUNJRklFRBAAEhYKEkNSRURJVF'
    '9UWVBFX1JFVFVSThABEhsKF0NSRURJVF9UWVBFX1BSSUNFX0VSUk9SEAISGAoUQ1JFRElUX1RZ'
    'UEVfRElTQ09VTlQQAxIcChhDUkVESVRfVFlQRV9DQU5DRUxMQVRJT04QBBIdChlDUkVESVRfVF'
    'lQRV9EQU1BR0VEX0dPT0RTEAU=');

@$core.Deprecated('Use creditNoteStatusDescriptor instead')
const CreditNoteStatus$json = {
  '1': 'CreditNoteStatus',
  '2': [
    {'1': 'CN_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'CN_STATUS_DRAFT', '2': 1},
    {'1': 'CN_STATUS_ISSUED', '2': 2},
    {'1': 'CN_STATUS_APPLIED', '2': 3},
  ],
};

/// Descriptor for `CreditNoteStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List creditNoteStatusDescriptor = $convert.base64Decode(
    'ChBDcmVkaXROb3RlU3RhdHVzEhkKFUNOX1NUQVRVU19VTlNQRUNJRklFRBAAEhMKD0NOX1NUQV'
    'RVU19EUkFGVBABEhQKEENOX1NUQVRVU19JU1NVRUQQAhIVChFDTl9TVEFUVVNfQVBQTElFRBAD');

@$core.Deprecated('Use creditNoteDescriptor instead')
const CreditNote$json = {
  '1': 'CreditNote',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {
      '1': 'related_invoice_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'relatedInvoiceId'
    },
    {
      '1': 'credit_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.financial.v1.CreditNoteType',
      '10': 'creditType'
    },
    {'1': 'issuer_id', '3': 4, '4': 1, '5': 9, '10': 'issuerId'},
    {'1': 'recipient_id', '3': 5, '4': 1, '5': 9, '10': 'recipientId'},
    {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.financial.v1.CreditNoteStatus',
      '10': 'status'
    },
    {
      '1': 'items',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.financial.v1.InvoiceLineItem',
      '10': 'items'
    },
    {'1': 'total_amount', '3': 8, '4': 1, '5': 1, '10': 'totalAmount'},
    {'1': 'currency', '3': 9, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'has_inventory_impact',
      '3': 10,
      '4': 1,
      '5': 8,
      '10': 'hasInventoryImpact'
    },
    {
      '1': 'related_return_note_id',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'relatedReturnNoteId'
    },
    {
      '1': 'issue_date',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'issueDate'
    },
    {
      '1': 'created_by_user_id',
      '3': 13,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
    {'1': 'reason', '3': 14, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'notes', '3': 15, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `CreditNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List creditNoteDescriptor = $convert.base64Decode(
    'CgpDcmVkaXROb3RlEicKC2RvY3VtZW50X2lkGAEgASgJQga6SAPIAQFSCmRvY3VtZW50SWQSLA'
    'oScmVsYXRlZF9pbnZvaWNlX2lkGAIgASgJUhByZWxhdGVkSW52b2ljZUlkEj0KC2NyZWRpdF90'
    'eXBlGAMgASgOMhwuZmluYW5jaWFsLnYxLkNyZWRpdE5vdGVUeXBlUgpjcmVkaXRUeXBlEhsKCW'
    'lzc3Vlcl9pZBgEIAEoCVIIaXNzdWVySWQSIQoMcmVjaXBpZW50X2lkGAUgASgJUgtyZWNpcGll'
    'bnRJZBI2CgZzdGF0dXMYBiABKA4yHi5maW5hbmNpYWwudjEuQ3JlZGl0Tm90ZVN0YXR1c1IGc3'
    'RhdHVzEjMKBWl0ZW1zGAcgAygLMh0uZmluYW5jaWFsLnYxLkludm9pY2VMaW5lSXRlbVIFaXRl'
    'bXMSIQoMdG90YWxfYW1vdW50GAggASgBUgt0b3RhbEFtb3VudBIaCghjdXJyZW5jeRgJIAEoCV'
    'IIY3VycmVuY3kSMAoUaGFzX2ludmVudG9yeV9pbXBhY3QYCiABKAhSEmhhc0ludmVudG9yeUlt'
    'cGFjdBIzChZyZWxhdGVkX3JldHVybl9ub3RlX2lkGAsgASgJUhNyZWxhdGVkUmV0dXJuTm90ZU'
    'lkEjkKCmlzc3VlX2RhdGUYDCABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUglpc3N1'
    'ZURhdGUSKwoSY3JlYXRlZF9ieV91c2VyX2lkGA0gASgJUg9jcmVhdGVkQnlVc2VySWQSFgoGcm'
    'Vhc29uGA4gASgJUgZyZWFzb24SFAoFbm90ZXMYDyABKAlSBW5vdGVz');
