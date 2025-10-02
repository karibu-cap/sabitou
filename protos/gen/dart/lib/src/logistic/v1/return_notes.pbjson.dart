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

import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import '../../inventory/v1/category.pbjson.dart' as $1;

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
    {
      '1': 'product_name',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Internationalized',
      '10': 'productName'
    },
    {'1': 'quantity', '3': 3, '4': 1, '5': 1, '10': 'quantity'},
    {
      '1': 'condition',
      '3': 4,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.ReturnCondition',
      '10': 'condition'
    },
    {'1': 'condition_notes', '3': 5, '4': 1, '5': 9, '10': 'conditionNotes'},
    {'1': 'batch_id', '3': 6, '4': 1, '5': 9, '10': 'batchId'},
  ],
};

/// Descriptor for `ReturnLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List returnLineItemDescriptor = $convert.base64Decode(
    'Cg5SZXR1cm5MaW5lSXRlbRIdCgpwcm9kdWN0X2lkGAEgASgJUglwcm9kdWN0SWQSQgoMcHJvZH'
    'VjdF9uYW1lGAIgASgLMh8uaW52ZW50b3J5LnYxLkludGVybmF0aW9uYWxpemVkUgtwcm9kdWN0'
    'TmFtZRIaCghxdWFudGl0eRgDIAEoAVIIcXVhbnRpdHkSOgoJY29uZGl0aW9uGAQgASgOMhwubG'
    '9naXN0aWMudjEuUmV0dXJuQ29uZGl0aW9uUgljb25kaXRpb24SJwoPY29uZGl0aW9uX25vdGVz'
    'GAUgASgJUg5jb25kaXRpb25Ob3RlcxIZCghiYXRjaF9pZBgGIAEoCVIHYmF0Y2hJZA==');

@$core.Deprecated('Use createReturnRequestDescriptor instead')
const CreateReturnRequest$json = {
  '1': 'CreateReturnRequest',
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

/// Descriptor for `CreateReturnRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReturnRequestDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVSZXR1cm5SZXF1ZXN0EiYKD2Zyb21fY29tcGFueV9pZBgBIAEoCVINZnJvbUNvbX'
    'BhbnlJZBImCg90b193YXJlaG91c2VfaWQYAiABKAlSDXRvV2FyZWhvdXNlSWQSNwoYcmVsYXRl'
    'ZF9kZWxpdmVyeV9ub3RlX2lkGAMgASgJUhVyZWxhdGVkRGVsaXZlcnlOb3RlSWQSLAoScmVsYX'
    'RlZF9pbnZvaWNlX2lkGAQgASgJUhByZWxhdGVkSW52b2ljZUlkEjEKBWl0ZW1zGAUgAygLMhsu'
    'bG9naXN0aWMudjEuUmV0dXJuTGluZUl0ZW1SBWl0ZW1zEhYKBnJlYXNvbhgGIAEoCVIGcmVhc2'
    '9uEi0KE3JlY2VpdmVkX2J5X3VzZXJfaWQYByABKAlSEHJlY2VpdmVkQnlVc2VySWQ=');

@$core.Deprecated('Use createReturnResponseDescriptor instead')
const CreateReturnResponse$json = {
  '1': 'CreateReturnResponse',
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

/// Descriptor for `CreateReturnResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReturnResponseDescriptor = $convert.base64Decode(
    'ChRDcmVhdGVSZXR1cm5SZXNwb25zZRIbCglyZXR1cm5faWQYASABKAlSCHJldHVybklkEjgKC3'
    'JldHVybl9ub3RlGAIgASgLMhcubG9naXN0aWMudjEuUmV0dXJuTm90ZVIKcmV0dXJuTm90ZRI6'
    'ChlpbnZlbnRvcnlfdHJhbnNhY3Rpb25faWRzGAMgAygJUhdpbnZlbnRvcnlUcmFuc2FjdGlvbk'
    'lkcxIwChRyZXF1aXJlc19jcmVkaXRfbm90ZRgEIAEoCFIScmVxdWlyZXNDcmVkaXROb3RlEhgK'
    'B21lc3NhZ2UYBSABKAlSB21lc3NhZ2U=');

const $core.Map<$core.String, $core.dynamic> ReturnServiceBase$json = {
  '1': 'ReturnService',
  '2': [
    {
      '1': 'CreateReturn',
      '2': '.logistic.v1.CreateReturnRequest',
      '3': '.logistic.v1.CreateReturnResponse'
    },
  ],
};

@$core.Deprecated('Use returnServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ReturnServiceBase$messageJson = {
  '.logistic.v1.CreateReturnRequest': CreateReturnRequest$json,
  '.logistic.v1.ReturnLineItem': ReturnLineItem$json,
  '.inventory.v1.Internationalized': $1.Internationalized$json,
  '.logistic.v1.CreateReturnResponse': CreateReturnResponse$json,
  '.logistic.v1.ReturnNote': ReturnNote$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
};

/// Descriptor for `ReturnService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List returnServiceDescriptor = $convert.base64Decode(
    'Cg1SZXR1cm5TZXJ2aWNlElMKDENyZWF0ZVJldHVybhIgLmxvZ2lzdGljLnYxLkNyZWF0ZVJldH'
    'VyblJlcXVlc3QaIS5sb2dpc3RpYy52MS5DcmVhdGVSZXR1cm5SZXNwb25zZQ==');
