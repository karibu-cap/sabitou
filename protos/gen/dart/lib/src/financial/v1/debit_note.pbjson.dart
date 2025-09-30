// This is a generated file - do not edit.
//
// Generated from financial/v1/debit_note.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use debitNoteTypeDescriptor instead')
const DebitNoteType$json = {
  '1': 'DebitNoteType',
  '2': [
    {'1': 'DEBIT_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'DEBIT_TYPE_RETURN', '2': 1},
    {'1': 'DEBIT_TYPE_PRICE_DISPUTE', '2': 2},
    {'1': 'DEBIT_TYPE_QUALITY_ISSUE', '2': 3},
    {'1': 'DEBIT_TYPE_SHORTAGE', '2': 4},
  ],
};

/// Descriptor for `DebitNoteType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List debitNoteTypeDescriptor = $convert.base64Decode(
    'Cg1EZWJpdE5vdGVUeXBlEhoKFkRFQklUX1RZUEVfVU5TUEVDSUZJRUQQABIVChFERUJJVF9UWV'
    'BFX1JFVFVSThABEhwKGERFQklUX1RZUEVfUFJJQ0VfRElTUFVURRACEhwKGERFQklUX1RZUEVf'
    'UVVBTElUWV9JU1NVRRADEhcKE0RFQklUX1RZUEVfU0hPUlRBR0UQBA==');

@$core.Deprecated('Use debitNoteStatusDescriptor instead')
const DebitNoteStatus$json = {
  '1': 'DebitNoteStatus',
  '2': [
    {'1': 'DEBIT_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'DEBIT_STATUS_DRAFT', '2': 1},
    {'1': 'DEBIT_STATUS_ISSUED', '2': 2},
    {'1': 'DEBIT_STATUS_ACCEPTED', '2': 3},
    {'1': 'DEBIT_STATUS_DISPUTED', '2': 4},
  ],
};

/// Descriptor for `DebitNoteStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List debitNoteStatusDescriptor = $convert.base64Decode(
    'Cg9EZWJpdE5vdGVTdGF0dXMSHAoYREVCSVRfU1RBVFVTX1VOU1BFQ0lGSUVEEAASFgoSREVCSV'
    'RfU1RBVFVTX0RSQUZUEAESFwoTREVCSVRfU1RBVFVTX0lTU1VFRBACEhkKFURFQklUX1NUQVRV'
    'U19BQ0NFUFRFRBADEhkKFURFQklUX1NUQVRVU19ESVNQVVRFRBAE');

@$core.Deprecated('Use debitNoteDescriptor instead')
const DebitNote$json = {
  '1': 'DebitNote',
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
      '1': 'debit_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.financial.v1.DebitNoteType',
      '10': 'debitType'
    },
    {'1': 'issuer_id', '3': 4, '4': 1, '5': 9, '10': 'issuerId'},
    {'1': 'recipient_id', '3': 5, '4': 1, '5': 9, '10': 'recipientId'},
    {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.financial.v1.DebitNoteStatus',
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
    {'1': 'total_amount', '3': 8, '4': 1, '5': 3, '10': 'totalAmount'},
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

/// Descriptor for `DebitNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List debitNoteDescriptor = $convert.base64Decode(
    'CglEZWJpdE5vdGUSJwoLZG9jdW1lbnRfaWQYASABKAlCBrpIA8gBAVIKZG9jdW1lbnRJZBIsCh'
    'JyZWxhdGVkX2ludm9pY2VfaWQYAiABKAlSEHJlbGF0ZWRJbnZvaWNlSWQSOgoKZGViaXRfdHlw'
    'ZRgDIAEoDjIbLmZpbmFuY2lhbC52MS5EZWJpdE5vdGVUeXBlUglkZWJpdFR5cGUSGwoJaXNzdW'
    'VyX2lkGAQgASgJUghpc3N1ZXJJZBIhCgxyZWNpcGllbnRfaWQYBSABKAlSC3JlY2lwaWVudElk'
    'EjUKBnN0YXR1cxgGIAEoDjIdLmZpbmFuY2lhbC52MS5EZWJpdE5vdGVTdGF0dXNSBnN0YXR1cx'
    'IzCgVpdGVtcxgHIAMoCzIdLmZpbmFuY2lhbC52MS5JbnZvaWNlTGluZUl0ZW1SBWl0ZW1zEiEK'
    'DHRvdGFsX2Ftb3VudBgIIAEoA1ILdG90YWxBbW91bnQSGgoIY3VycmVuY3kYCSABKAlSCGN1cn'
    'JlbmN5EjAKFGhhc19pbnZlbnRvcnlfaW1wYWN0GAogASgIUhJoYXNJbnZlbnRvcnlJbXBhY3QS'
    'MwoWcmVsYXRlZF9yZXR1cm5fbm90ZV9pZBgLIAEoCVITcmVsYXRlZFJldHVybk5vdGVJZBI5Cg'
    'ppc3N1ZV9kYXRlGAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJaXNzdWVEYXRl'
    'EisKEmNyZWF0ZWRfYnlfdXNlcl9pZBgNIAEoCVIPY3JlYXRlZEJ5VXNlcklkEhYKBnJlYXNvbh'
    'gOIAEoCVIGcmVhc29uEhQKBW5vdGVzGA8gASgJUgVub3Rlcw==');
