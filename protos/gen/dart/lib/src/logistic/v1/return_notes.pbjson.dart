// This is a generated file - do not edit.
//
// Generated from logistic/v1/return_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../financial/v1/credit_note.pbjson.dart' as $1;
import '../../financial/v1/debit_note.pbjson.dart' as $2;
import '../../financial/v1/financial_utils.pbjson.dart' as $4;
import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import '../../inventory/v1/category.pbjson.dart' as $5;
import '../../payments/v1/payments.pbjson.dart' as $3;

@$core.Deprecated('Use returnTypeDescriptor instead')
const ReturnType$json = {
  '1': 'ReturnType',
  '2': [
    {'1': 'RETURN_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'RETURN_TYPE_CUSTOMER_TO_SELLER', '2': 1},
    {'1': 'RETURN_TYPE_SELLER_TO_SUPPLIER', '2': 2},
  ],
};

/// Descriptor for `ReturnType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List returnTypeDescriptor = $convert.base64Decode(
    'CgpSZXR1cm5UeXBlEhsKF1JFVFVSTl9UWVBFX1VOU1BFQ0lGSUVEEAASIgoeUkVUVVJOX1RZUE'
    'VfQ1VTVE9NRVJfVE9fU0VMTEVSEAESIgoeUkVUVVJOX1RZUEVfU0VMTEVSX1RPX1NVUFBMSUVS'
    'EAI=');

@$core.Deprecated('Use returnNoteStatusDescriptor instead')
const ReturnNoteStatus$json = {
  '1': 'ReturnNoteStatus',
  '2': [
    {'1': 'RETURN_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'RETURN_STATUS_PENDING', '2': 1},
    {'1': 'RETURN_STATUS_APPROVED', '2': 2},
    {'1': 'RETURN_STATUS_IN_TRANSIT', '2': 3},
    {'1': 'RETURN_STATUS_RECEIVED', '2': 4},
    {'1': 'RETURN_STATUS_REJECTED', '2': 5},
  ],
};

/// Descriptor for `ReturnNoteStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List returnNoteStatusDescriptor = $convert.base64Decode(
    'ChBSZXR1cm5Ob3RlU3RhdHVzEh0KGVJFVFVSTl9TVEFUVVNfVU5TUEVDSUZJRUQQABIZChVSRV'
    'RVUk5fU1RBVFVTX1BFTkRJTkcQARIaChZSRVRVUk5fU1RBVFVTX0FQUFJPVkVEEAISHAoYUkVU'
    'VVJOX1NUQVRVU19JTl9UUkFOU0lUEAMSGgoWUkVUVVJOX1NUQVRVU19SRUNFSVZFRBAEEhoKFl'
    'JFVFVSTl9TVEFUVVNfUkVKRUNURUQQBQ==');

@$core.Deprecated('Use returnConditionDescriptor instead')
const ReturnCondition$json = {
  '1': 'ReturnCondition',
  '2': [
    {'1': 'RETURN_CONDITION_UNSPECIFIED', '2': 0},
    {'1': 'RETURN_CONDITION_NEW', '2': 1},
    {'1': 'RETURN_CONDITION_USED_GOOD', '2': 2},
    {'1': 'RETURN_CONDITION_DAMAGED', '2': 3},
    {'1': 'RETURN_CONDITION_DEFECTIVE', '2': 4},
  ],
};

/// Descriptor for `ReturnCondition`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List returnConditionDescriptor = $convert.base64Decode(
    'Cg9SZXR1cm5Db25kaXRpb24SIAocUkVUVVJOX0NPTkRJVElPTl9VTlNQRUNJRklFRBAAEhgKFF'
    'JFVFVSTl9DT05ESVRJT05fTkVXEAESHgoaUkVUVVJOX0NPTkRJVElPTl9VU0VEX0dPT0QQAhIc'
    'ChhSRVRVUk5fQ09ORElUSU9OX0RBTUFHRUQQAxIeChpSRVRVUk5fQ09ORElUSU9OX0RFRkVDVE'
    'lWRRAE');

@$core.Deprecated('Use returnNoteDescriptor instead')
const ReturnNote$json = {
  '1': 'ReturnNote',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {
      '1': 'return_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReturnType',
      '10': 'returnType'
    },
    {'1': 'from_id', '3': 3, '4': 1, '5': 9, '10': 'fromId'},
    {'1': 'to_id', '3': 4, '4': 1, '5': 9, '10': 'toId'},
    {
      '1': 'related_delivery_note_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'relatedDeliveryNoteId'
    },
    {
      '1': 'related_invoice_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'relatedInvoiceId'
    },
    {
      '1': 'status',
      '3': 7,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReturnNoteStatus',
      '10': 'status'
    },
    {
      '1': 'items',
      '3': 8,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.ReturnLineItem',
      '10': 'items'
    },
    {'1': 'reason', '3': 9, '4': 1, '5': 9, '10': 'reason'},
    {
      '1': 'received_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'receivedAt'
    },
    {
      '1': 'received_by_user_id',
      '3': 11,
      '4': 1,
      '5': 9,
      '10': 'receivedByUserId'
    },
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `ReturnNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List returnNoteDescriptor = $convert.base64Decode(
    'CgpSZXR1cm5Ob3RlEicKC2RvY3VtZW50X2lkGAEgASgJQga6SAPIAQFSCmRvY3VtZW50SWQSOA'
    'oLcmV0dXJuX3R5cGUYAiABKA4yFy5sb2dpc3RpYy52MS5SZXR1cm5UeXBlUgpyZXR1cm5UeXBl'
    'EhcKB2Zyb21faWQYAyABKAlSBmZyb21JZBITCgV0b19pZBgEIAEoCVIEdG9JZBI3ChhyZWxhdG'
    'VkX2RlbGl2ZXJ5X25vdGVfaWQYBSABKAlSFXJlbGF0ZWREZWxpdmVyeU5vdGVJZBIsChJyZWxh'
    'dGVkX2ludm9pY2VfaWQYBiABKAlSEHJlbGF0ZWRJbnZvaWNlSWQSNQoGc3RhdHVzGAcgASgOMh'
    '0ubG9naXN0aWMudjEuUmV0dXJuTm90ZVN0YXR1c1IGc3RhdHVzEjEKBWl0ZW1zGAggAygLMhsu'
    'bG9naXN0aWMudjEuUmV0dXJuTGluZUl0ZW1SBWl0ZW1zEhYKBnJlYXNvbhgJIAEoCVIGcmVhc2'
    '9uEjsKC3JlY2VpdmVkX2F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKcmVj'
    'ZWl2ZWRBdBItChNyZWNlaXZlZF9ieV91c2VyX2lkGAsgASgJUhByZWNlaXZlZEJ5VXNlcklkEh'
    'QKBW5vdGVzGAwgASgJUgVub3Rlcw==');

@$core.Deprecated('Use returnLineItemDescriptor instead')
const ReturnLineItem$json = {
  '1': 'ReturnLineItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 1, '10': 'quantity'},
    {
      '1': 'condition',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReturnCondition',
      '10': 'condition'
    },
    {'1': 'condition_notes', '3': 4, '4': 1, '5': 9, '10': 'conditionNotes'},
    {'1': 'batch_id', '3': 5, '4': 1, '5': 9, '10': 'batchId'},
  ],
};

/// Descriptor for `ReturnLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List returnLineItemDescriptor = $convert.base64Decode(
    'Cg5SZXR1cm5MaW5lSXRlbRIdCgpwcm9kdWN0X2lkGAEgASgJUglwcm9kdWN0SWQSGgoIcXVhbn'
    'RpdHkYAiABKAFSCHF1YW50aXR5EjoKCWNvbmRpdGlvbhgDIAEoDjIcLmxvZ2lzdGljLnYxLlJl'
    'dHVybkNvbmRpdGlvblIJY29uZGl0aW9uEicKD2NvbmRpdGlvbl9ub3RlcxgEIAEoCVIOY29uZG'
    'l0aW9uTm90ZXMSGQoIYmF0Y2hfaWQYBSABKAlSB2JhdGNoSWQ=');

@$core.Deprecated('Use createCustomerReturnRequestDescriptor instead')
const CreateCustomerReturnRequest$json = {
  '1': 'CreateCustomerReturnRequest',
  '2': [
    {'1': 'from_company_id', '3': 1, '4': 1, '5': 9, '10': 'fromCompanyId'},
    {'1': 'to_warehouse_id', '3': 2, '4': 1, '5': 9, '10': 'toWarehouseId'},
    {
      '1': 'related_delivery_note_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'relatedDeliveryNoteId'
    },
    {
      '1': 'related_invoice_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'relatedInvoiceId'
    },
    {
      '1': 'items',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.ReturnLineItem',
      '10': 'items'
    },
    {'1': 'reason', '3': 6, '4': 1, '5': 9, '10': 'reason'},
    {
      '1': 'received_by_user_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'receivedByUserId'
    },
  ],
};

/// Descriptor for `CreateCustomerReturnRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCustomerReturnRequestDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVDdXN0b21lclJldHVyblJlcXVlc3QSJgoPZnJvbV9jb21wYW55X2lkGAEgASgJUg'
    '1mcm9tQ29tcGFueUlkEiYKD3RvX3dhcmVob3VzZV9pZBgCIAEoCVINdG9XYXJlaG91c2VJZBI3'
    'ChhyZWxhdGVkX2RlbGl2ZXJ5X25vdGVfaWQYAyABKAlSFXJlbGF0ZWREZWxpdmVyeU5vdGVJZB'
    'IsChJyZWxhdGVkX2ludm9pY2VfaWQYBCABKAlSEHJlbGF0ZWRJbnZvaWNlSWQSMQoFaXRlbXMY'
    'BSADKAsyGy5sb2dpc3RpYy52MS5SZXR1cm5MaW5lSXRlbVIFaXRlbXMSFgoGcmVhc29uGAYgAS'
    'gJUgZyZWFzb24SLQoTcmVjZWl2ZWRfYnlfdXNlcl9pZBgHIAEoCVIQcmVjZWl2ZWRCeVVzZXJJ'
    'ZA==');

@$core.Deprecated('Use createCustomerReturnResponseDescriptor instead')
const CreateCustomerReturnResponse$json = {
  '1': 'CreateCustomerReturnResponse',
  '2': [
    {'1': 'return_id', '3': 1, '4': 1, '5': 9, '10': 'returnId'},
    {
      '1': 'return_note',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.logistic.v1.ReturnNote',
      '10': 'returnNote'
    },
    {
      '1': 'inventory_transaction_ids',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'inventoryTransactionIds'
    },
    {
      '1': 'requires_credit_note',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'requiresCreditNote'
    },
    {'1': 'message', '3': 5, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateCustomerReturnResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCustomerReturnResponseDescriptor = $convert.base64Decode(
    'ChxDcmVhdGVDdXN0b21lclJldHVyblJlc3BvbnNlEhsKCXJldHVybl9pZBgBIAEoCVIIcmV0dX'
    'JuSWQSOAoLcmV0dXJuX25vdGUYAiABKAsyFy5sb2dpc3RpYy52MS5SZXR1cm5Ob3RlUgpyZXR1'
    'cm5Ob3RlEjoKGWludmVudG9yeV90cmFuc2FjdGlvbl9pZHMYAyADKAlSF2ludmVudG9yeVRyYW'
    '5zYWN0aW9uSWRzEjAKFHJlcXVpcmVzX2NyZWRpdF9ub3RlGAQgASgIUhJyZXF1aXJlc0NyZWRp'
    'dE5vdGUSGAoHbWVzc2FnZRgFIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use processReturnRequestRequestDescriptor instead')
const ProcessReturnRequestRequest$json = {
  '1': 'ProcessReturnRequestRequest',
  '2': [
    {'1': 'return_id', '3': 1, '4': 1, '5': 9, '10': 'returnId'},
    {
      '1': 'new_status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReturnNoteStatus',
      '10': 'newStatus'
    },
    {
      '1': 'processed_by_user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'processedByUserId'
    },
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `ProcessReturnRequestRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List processReturnRequestRequestDescriptor = $convert.base64Decode(
    'ChtQcm9jZXNzUmV0dXJuUmVxdWVzdFJlcXVlc3QSGwoJcmV0dXJuX2lkGAEgASgJUghyZXR1cm'
    '5JZBI8CgpuZXdfc3RhdHVzGAIgASgOMh0ubG9naXN0aWMudjEuUmV0dXJuTm90ZVN0YXR1c1IJ'
    'bmV3U3RhdHVzEi8KFHByb2Nlc3NlZF9ieV91c2VyX2lkGAMgASgJUhFwcm9jZXNzZWRCeVVzZX'
    'JJZBIUCgVub3RlcxgEIAEoCVIFbm90ZXM=');

@$core.Deprecated('Use processReturnRequestResponseDescriptor instead')
const ProcessReturnRequestResponse$json = {
  '1': 'ProcessReturnRequestResponse',
  '2': [
    {
      '1': 'return_note',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.logistic.v1.ReturnNote',
      '10': 'returnNote'
    },
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `ProcessReturnRequestResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List processReturnRequestResponseDescriptor =
    $convert.base64Decode(
        'ChxQcm9jZXNzUmV0dXJuUmVxdWVzdFJlc3BvbnNlEjgKC3JldHVybl9ub3RlGAEgASgLMhcubG'
        '9naXN0aWMudjEuUmV0dXJuTm90ZVIKcmV0dXJuTm90ZRIYCgdtZXNzYWdlGAIgASgJUgdtZXNz'
        'YWdl');

@$core.Deprecated('Use createCreditNoteFromReturnRequestDescriptor instead')
const CreateCreditNoteFromReturnRequest$json = {
  '1': 'CreateCreditNoteFromReturnRequest',
  '2': [
    {'1': 'return_id', '3': 1, '4': 1, '5': 9, '10': 'returnId'},
    {
      '1': 'related_invoice_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'relatedInvoiceId'
    },
    {'1': 'issued_by_user_id', '3': 3, '4': 1, '5': 9, '10': 'issuedByUserId'},
  ],
};

/// Descriptor for `CreateCreditNoteFromReturnRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCreditNoteFromReturnRequestDescriptor =
    $convert.base64Decode(
        'CiFDcmVhdGVDcmVkaXROb3RlRnJvbVJldHVyblJlcXVlc3QSGwoJcmV0dXJuX2lkGAEgASgJUg'
        'hyZXR1cm5JZBIsChJyZWxhdGVkX2ludm9pY2VfaWQYAiABKAlSEHJlbGF0ZWRJbnZvaWNlSWQS'
        'KQoRaXNzdWVkX2J5X3VzZXJfaWQYAyABKAlSDmlzc3VlZEJ5VXNlcklk');

@$core.Deprecated('Use createCreditNoteFromReturnResponseDescriptor instead')
const CreateCreditNoteFromReturnResponse$json = {
  '1': 'CreateCreditNoteFromReturnResponse',
  '2': [
    {'1': 'cn_id', '3': 1, '4': 1, '5': 9, '10': 'cnId'},
    {
      '1': 'credit_note',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.financial.v1.CreditNote',
      '10': 'creditNote'
    },
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateCreditNoteFromReturnResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createCreditNoteFromReturnResponseDescriptor =
    $convert.base64Decode(
        'CiJDcmVhdGVDcmVkaXROb3RlRnJvbVJldHVyblJlc3BvbnNlEhMKBWNuX2lkGAEgASgJUgRjbk'
        'lkEjkKC2NyZWRpdF9ub3RlGAIgASgLMhguZmluYW5jaWFsLnYxLkNyZWRpdE5vdGVSCmNyZWRp'
        'dE5vdGUSGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use createDebitNoteFromReturnRequestDescriptor instead')
const CreateDebitNoteFromReturnRequest$json = {
  '1': 'CreateDebitNoteFromReturnRequest',
  '2': [
    {'1': 'return_id', '3': 1, '4': 1, '5': 9, '10': 'returnId'},
    {
      '1': 'related_invoice_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'relatedInvoiceId'
    },
    {'1': 'issued_by_user_id', '3': 3, '4': 1, '5': 9, '10': 'issuedByUserId'},
  ],
};

/// Descriptor for `CreateDebitNoteFromReturnRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDebitNoteFromReturnRequestDescriptor =
    $convert.base64Decode(
        'CiBDcmVhdGVEZWJpdE5vdGVGcm9tUmV0dXJuUmVxdWVzdBIbCglyZXR1cm5faWQYASABKAlSCH'
        'JldHVybklkEiwKEnJlbGF0ZWRfaW52b2ljZV9pZBgCIAEoCVIQcmVsYXRlZEludm9pY2VJZBIp'
        'ChFpc3N1ZWRfYnlfdXNlcl9pZBgDIAEoCVIOaXNzdWVkQnlVc2VySWQ=');

@$core.Deprecated('Use createDebitNoteFromReturnResponseDescriptor instead')
const CreateDebitNoteFromReturnResponse$json = {
  '1': 'CreateDebitNoteFromReturnResponse',
  '2': [
    {'1': 'dn_id', '3': 1, '4': 1, '5': 9, '10': 'dnId'},
    {
      '1': 'debit_note',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.financial.v1.DebitNote',
      '10': 'debitNote'
    },
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateDebitNoteFromReturnResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDebitNoteFromReturnResponseDescriptor =
    $convert.base64Decode(
        'CiFDcmVhdGVEZWJpdE5vdGVGcm9tUmV0dXJuUmVzcG9uc2USEwoFZG5faWQYASABKAlSBGRuSW'
        'QSNgoKZGViaXRfbm90ZRgCIAEoCzIXLmZpbmFuY2lhbC52MS5EZWJpdE5vdGVSCWRlYml0Tm90'
        'ZRIYCgdtZXNzYWdlGAMgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use getReturnRequestDescriptor instead')
const GetReturnRequest$json = {
  '1': 'GetReturnRequest',
  '2': [
    {'1': 'return_id', '3': 1, '4': 1, '5': 9, '10': 'returnId'},
  ],
};

/// Descriptor for `GetReturnRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReturnRequestDescriptor = $convert.base64Decode(
    'ChBHZXRSZXR1cm5SZXF1ZXN0EhsKCXJldHVybl9pZBgBIAEoCVIIcmV0dXJuSWQ=');

@$core.Deprecated('Use getReturnResponseDescriptor instead')
const GetReturnResponse$json = {
  '1': 'GetReturnResponse',
  '2': [
    {
      '1': 'return_note',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.logistic.v1.ReturnNote',
      '10': 'returnNote'
    },
    {
      '1': 'credit_note',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.financial.v1.CreditNote',
      '10': 'creditNote'
    },
    {
      '1': 'debit_note',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.financial.v1.DebitNote',
      '10': 'debitNote'
    },
    {
      '1': 'refund_payment',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.payments.v1.Payment',
      '10': 'refundPayment'
    },
  ],
};

/// Descriptor for `GetReturnResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getReturnResponseDescriptor = $convert.base64Decode(
    'ChFHZXRSZXR1cm5SZXNwb25zZRI4CgtyZXR1cm5fbm90ZRgBIAEoCzIXLmxvZ2lzdGljLnYxLl'
    'JldHVybk5vdGVSCnJldHVybk5vdGUSOQoLY3JlZGl0X25vdGUYAiABKAsyGC5maW5hbmNpYWwu'
    'djEuQ3JlZGl0Tm90ZVIKY3JlZGl0Tm90ZRI2CgpkZWJpdF9ub3RlGAMgASgLMhcuZmluYW5jaW'
    'FsLnYxLkRlYml0Tm90ZVIJZGViaXROb3RlEjsKDnJlZnVuZF9wYXltZW50GAQgASgLMhQucGF5'
    'bWVudHMudjEuUGF5bWVudFINcmVmdW5kUGF5bWVudA==');

@$core.Deprecated('Use listReturnsRequestDescriptor instead')
const ListReturnsRequest$json = {
  '1': 'ListReturnsRequest',
  '2': [
    {
      '1': 'return_type',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReturnType',
      '10': 'returnType'
    },
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReturnNoteStatus',
      '10': 'status'
    },
    {
      '1': 'start_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
    {'1': 'page_size', '3': 5, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_number', '3': 6, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
};

/// Descriptor for `ListReturnsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReturnsRequestDescriptor = $convert.base64Decode(
    'ChJMaXN0UmV0dXJuc1JlcXVlc3QSOAoLcmV0dXJuX3R5cGUYASABKA4yFy5sb2dpc3RpYy52MS'
    '5SZXR1cm5UeXBlUgpyZXR1cm5UeXBlEjUKBnN0YXR1cxgCIAEoDjIdLmxvZ2lzdGljLnYxLlJl'
    'dHVybk5vdGVTdGF0dXNSBnN0YXR1cxI5CgpzdGFydF9kYXRlGAMgASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJc3RhcnREYXRlEjUKCGVuZF9kYXRlGAQgASgLMhouZ29vZ2xlLnBy'
    'b3RvYnVmLlRpbWVzdGFtcFIHZW5kRGF0ZRIbCglwYWdlX3NpemUYBSABKAVSCHBhZ2VTaXplEh'
    '8KC3BhZ2VfbnVtYmVyGAYgASgFUgpwYWdlTnVtYmVy');

@$core.Deprecated('Use listReturnsResponseDescriptor instead')
const ListReturnsResponse$json = {
  '1': 'ListReturnsResponse',
  '2': [
    {
      '1': 'returns',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.ReturnNote',
      '10': 'returns'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'total_value', '3': 3, '4': 1, '5': 1, '10': 'totalValue'},
  ],
};

/// Descriptor for `ListReturnsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listReturnsResponseDescriptor = $convert.base64Decode(
    'ChNMaXN0UmV0dXJuc1Jlc3BvbnNlEjEKB3JldHVybnMYASADKAsyFy5sb2dpc3RpYy52MS5SZX'
    'R1cm5Ob3RlUgdyZXR1cm5zEh8KC3RvdGFsX2NvdW50GAIgASgFUgp0b3RhbENvdW50Eh8KC3Rv'
    'dGFsX3ZhbHVlGAMgASgBUgp0b3RhbFZhbHVl');

const $core.Map<$core.String, $core.dynamic> ReturnServiceBase$json = {
  '1': 'ReturnService',
  '2': [
    {
      '1': 'CreateCustomerReturn',
      '2': '.logistic.v1.CreateCustomerReturnRequest',
      '3': '.logistic.v1.CreateCustomerReturnResponse'
    },
    {
      '1': 'ProcessReturnRequest',
      '2': '.logistic.v1.ProcessReturnRequestRequest',
      '3': '.logistic.v1.ProcessReturnRequestResponse'
    },
    {
      '1': 'CreateCreditNoteFromReturn',
      '2': '.logistic.v1.CreateCreditNoteFromReturnRequest',
      '3': '.logistic.v1.CreateCreditNoteFromReturnResponse'
    },
    {
      '1': 'CreateDebitNoteFromReturn',
      '2': '.logistic.v1.CreateDebitNoteFromReturnRequest',
      '3': '.logistic.v1.CreateDebitNoteFromReturnResponse'
    },
    {
      '1': 'GetReturn',
      '2': '.logistic.v1.GetReturnRequest',
      '3': '.logistic.v1.GetReturnResponse'
    },
    {
      '1': 'ListReturns',
      '2': '.logistic.v1.ListReturnsRequest',
      '3': '.logistic.v1.ListReturnsResponse'
    },
  ],
};

@$core.Deprecated('Use returnServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ReturnServiceBase$messageJson = {
  '.logistic.v1.CreateCustomerReturnRequest': CreateCustomerReturnRequest$json,
  '.logistic.v1.ReturnLineItem': ReturnLineItem$json,
  '.logistic.v1.CreateCustomerReturnResponse':
      CreateCustomerReturnResponse$json,
  '.logistic.v1.ReturnNote': ReturnNote$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.logistic.v1.ProcessReturnRequestRequest': ProcessReturnRequestRequest$json,
  '.logistic.v1.ProcessReturnRequestResponse':
      ProcessReturnRequestResponse$json,
  '.logistic.v1.CreateCreditNoteFromReturnRequest':
      CreateCreditNoteFromReturnRequest$json,
  '.logistic.v1.CreateCreditNoteFromReturnResponse':
      CreateCreditNoteFromReturnResponse$json,
  '.financial.v1.CreditNote': $1.CreditNote$json,
  '.financial.v1.InvoiceLineItem': $4.InvoiceLineItem$json,
  '.inventory.v1.Internationalized': $5.Internationalized$json,
  '.logistic.v1.CreateDebitNoteFromReturnRequest':
      CreateDebitNoteFromReturnRequest$json,
  '.logistic.v1.CreateDebitNoteFromReturnResponse':
      CreateDebitNoteFromReturnResponse$json,
  '.financial.v1.DebitNote': $2.DebitNote$json,
  '.logistic.v1.GetReturnRequest': GetReturnRequest$json,
  '.logistic.v1.GetReturnResponse': GetReturnResponse$json,
  '.payments.v1.Payment': $3.Payment$json,
  '.logistic.v1.ListReturnsRequest': ListReturnsRequest$json,
  '.logistic.v1.ListReturnsResponse': ListReturnsResponse$json,
};

/// Descriptor for `ReturnService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List returnServiceDescriptor = $convert.base64Decode(
    'Cg1SZXR1cm5TZXJ2aWNlEmsKFENyZWF0ZUN1c3RvbWVyUmV0dXJuEigubG9naXN0aWMudjEuQ3'
    'JlYXRlQ3VzdG9tZXJSZXR1cm5SZXF1ZXN0GikubG9naXN0aWMudjEuQ3JlYXRlQ3VzdG9tZXJS'
    'ZXR1cm5SZXNwb25zZRJrChRQcm9jZXNzUmV0dXJuUmVxdWVzdBIoLmxvZ2lzdGljLnYxLlByb2'
    'Nlc3NSZXR1cm5SZXF1ZXN0UmVxdWVzdBopLmxvZ2lzdGljLnYxLlByb2Nlc3NSZXR1cm5SZXF1'
    'ZXN0UmVzcG9uc2USfQoaQ3JlYXRlQ3JlZGl0Tm90ZUZyb21SZXR1cm4SLi5sb2dpc3RpYy52MS'
    '5DcmVhdGVDcmVkaXROb3RlRnJvbVJldHVyblJlcXVlc3QaLy5sb2dpc3RpYy52MS5DcmVhdGVD'
    'cmVkaXROb3RlRnJvbVJldHVyblJlc3BvbnNlEnoKGUNyZWF0ZURlYml0Tm90ZUZyb21SZXR1cm'
    '4SLS5sb2dpc3RpYy52MS5DcmVhdGVEZWJpdE5vdGVGcm9tUmV0dXJuUmVxdWVzdBouLmxvZ2lz'
    'dGljLnYxLkNyZWF0ZURlYml0Tm90ZUZyb21SZXR1cm5SZXNwb25zZRJKCglHZXRSZXR1cm4SHS'
    '5sb2dpc3RpYy52MS5HZXRSZXR1cm5SZXF1ZXN0Gh4ubG9naXN0aWMudjEuR2V0UmV0dXJuUmVz'
    'cG9uc2USUAoLTGlzdFJldHVybnMSHy5sb2dpc3RpYy52MS5MaXN0UmV0dXJuc1JlcXVlc3QaIC'
    '5sb2dpc3RpYy52MS5MaXN0UmV0dXJuc1Jlc3BvbnNl');
