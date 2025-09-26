// This is a generated file - do not edit.
//
// Generated from sync/v1/sync.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/timestamp.pbjson.dart' as $3;
import '../../inventory/v1/category.pbjson.dart' as $1;
import '../../inventory/v1/product.pbjson.dart' as $0;
import '../../order/v1/order.pbjson.dart' as $2;

@$core.Deprecated('Use syncOperationTypeDescriptor instead')
const SyncOperationType$json = {
  '1': 'SyncOperationType',
  '2': [
    {'1': 'SYNC_OPERATION_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'SYNC_OPERATION_TYPE_CREATE', '2': 1},
    {'1': 'SYNC_OPERATION_TYPE_UPDATE', '2': 2},
    {'1': 'SYNC_OPERATION_TYPE_DELETE', '2': 3},
  ],
};

/// Descriptor for `SyncOperationType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List syncOperationTypeDescriptor = $convert.base64Decode(
    'ChFTeW5jT3BlcmF0aW9uVHlwZRIjCh9TWU5DX09QRVJBVElPTl9UWVBFX1VOU1BFQ0lGSUVEEA'
    'ASHgoaU1lOQ19PUEVSQVRJT05fVFlQRV9DUkVBVEUQARIeChpTWU5DX09QRVJBVElPTl9UWVBF'
    'X1VQREFURRACEh4KGlNZTkNfT1BFUkFUSU9OX1RZUEVfREVMRVRFEAM=');

@$core.Deprecated('Use syncEntityTypeDescriptor instead')
const SyncEntityType$json = {
  '1': 'SyncEntityType',
  '2': [
    {'1': 'SYNC_ENTITY_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'SYNC_ENTITY_TYPE_ORDER', '2': 1},
  ],
};

/// Descriptor for `SyncEntityType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List syncEntityTypeDescriptor = $convert.base64Decode(
    'Cg5TeW5jRW50aXR5VHlwZRIgChxTWU5DX0VOVElUWV9UWVBFX1VOU1BFQ0lGSUVEEAASGgoWU1'
    'lOQ19FTlRJVFlfVFlQRV9PUkRFUhAB');

@$core.Deprecated('Use syncOperationStatusDescriptor instead')
const SyncOperationStatus$json = {
  '1': 'SyncOperationStatus',
  '2': [
    {'1': 'SYNC_OPERATION_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'SYNC_OPERATION_STATUS_PENDING', '2': 1},
    {'1': 'SYNC_OPERATION_STATUS_IN_PROGRESS', '2': 2},
    {'1': 'SYNC_OPERATION_STATUS_SUCCESS', '2': 3},
    {'1': 'SYNC_OPERATION_STATUS_FAILED', '2': 4},
    {'1': 'SYNC_OPERATION_STATUS_RETRYING', '2': 5},
    {'1': 'SYNC_OPERATION_STATUS_ABANDONED', '2': 6},
  ],
};

/// Descriptor for `SyncOperationStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List syncOperationStatusDescriptor = $convert.base64Decode(
    'ChNTeW5jT3BlcmF0aW9uU3RhdHVzEiUKIVNZTkNfT1BFUkFUSU9OX1NUQVRVU19VTlNQRUNJRk'
    'lFRBAAEiEKHVNZTkNfT1BFUkFUSU9OX1NUQVRVU19QRU5ESU5HEAESJQohU1lOQ19PUEVSQVRJ'
    'T05fU1RBVFVTX0lOX1BST0dSRVNTEAISIQodU1lOQ19PUEVSQVRJT05fU1RBVFVTX1NVQ0NFU1'
    'MQAxIgChxTWU5DX09QRVJBVElPTl9TVEFUVVNfRkFJTEVEEAQSIgoeU1lOQ19PUEVSQVRJT05f'
    'U1RBVFVTX1JFVFJZSU5HEAUSIwofU1lOQ19PUEVSQVRJT05fU1RBVFVTX0FCQU5ET05FRBAG');

@$core.Deprecated('Use syncOperationDescriptor instead')
const SyncOperation$json = {
  '1': 'SyncOperation',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {
      '1': 'operation_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.sync.v1.SyncOperationType',
      '8': {},
      '10': 'operationType'
    },
    {
      '1': 'entity_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.sync.v1.SyncEntityType',
      '8': {},
      '10': 'entityType'
    },
    {'1': 'entity_id', '3': 4, '4': 1, '5': 9, '8': {}, '10': 'entityId'},
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
      '1': 'business_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'businessId',
      '17': true
    },
    {
      '1': 'user_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'userId',
      '17': true
    },
    {
      '1': 'store_product_data',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '9': 0,
      '10': 'storeProductData'
    },
    {
      '1': 'global_product_data',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '9': 0,
      '10': 'globalProductData'
    },
    {
      '1': 'category_data',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Category',
      '9': 0,
      '10': 'categoryData'
    },
    {
      '1': 'order_data',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.order.v1.Order',
      '9': 0,
      '10': 'orderData'
    },
    {'1': 'json_data', '3': 40, '4': 1, '5': 9, '9': 0, '10': 'jsonData'},
    {
      '1': 'created_at',
      '3': 41,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 42,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
    {
      '1': 'status',
      '3': 43,
      '4': 1,
      '5': 14,
      '6': '.sync.v1.SyncOperationStatus',
      '10': 'status'
    },
    {'1': 'retry_count', '3': 44, '4': 1, '5': 5, '10': 'retryCount'},
    {'1': 'max_retries', '3': 45, '4': 1, '5': 5, '10': 'maxRetries'},
    {
      '1': 'next_retry_at',
      '3': 46,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 4,
      '10': 'nextRetryAt',
      '17': true
    },
    {
      '1': 'error_message',
      '3': 47,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'errorMessage',
      '17': true
    },
    {
      '1': 'metadata',
      '3': 48,
      '4': 3,
      '5': 11,
      '6': '.sync.v1.SyncOperation.MetadataEntry',
      '10': 'metadata'
    },
  ],
  '3': [SyncOperation_MetadataEntry$json],
  '8': [
    {'1': 'operation_data'},
    {'1': '_store_id'},
    {'1': '_business_id'},
    {'1': '_user_id'},
    {'1': '_next_retry_at'},
    {'1': '_error_message'},
  ],
};

@$core.Deprecated('Use syncOperationDescriptor instead')
const SyncOperation_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SyncOperation`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncOperationDescriptor = $convert.base64Decode(
    'Cg1TeW5jT3BlcmF0aW9uEh4KBnJlZl9pZBgBIAEoCUIHukgEcgIQAVIFcmVmSWQSSwoOb3Blcm'
    'F0aW9uX3R5cGUYAiABKA4yGi5zeW5jLnYxLlN5bmNPcGVyYXRpb25UeXBlQgi6SAWCAQIQAVIN'
    'b3BlcmF0aW9uVHlwZRJCCgtlbnRpdHlfdHlwZRgDIAEoDjIXLnN5bmMudjEuU3luY0VudGl0eV'
    'R5cGVCCLpIBYIBAhABUgplbnRpdHlUeXBlEiQKCWVudGl0eV9pZBgEIAEoCUIHukgEcgIQAVII'
    'ZW50aXR5SWQSHgoIc3RvcmVfaWQYBSABKAlIAVIHc3RvcmVJZIgBARIkCgtidXNpbmVzc19pZB'
    'gGIAEoCUgCUgpidXNpbmVzc0lkiAEBEhwKB3VzZXJfaWQYByABKAlIA1IGdXNlcklkiAEBEkoK'
    'EnN0b3JlX3Byb2R1Y3RfZGF0YRgKIAEoCzIaLmludmVudG9yeS52MS5TdG9yZVByb2R1Y3RIAF'
    'IQc3RvcmVQcm9kdWN0RGF0YRJNChNnbG9iYWxfcHJvZHVjdF9kYXRhGAsgASgLMhsuaW52ZW50'
    'b3J5LnYxLkdsb2JhbFByb2R1Y3RIAFIRZ2xvYmFsUHJvZHVjdERhdGESPQoNY2F0ZWdvcnlfZG'
    'F0YRgMIAEoCzIWLmludmVudG9yeS52MS5DYXRlZ29yeUgAUgxjYXRlZ29yeURhdGESMAoKb3Jk'
    'ZXJfZGF0YRgNIAEoCzIPLm9yZGVyLnYxLk9yZGVySABSCW9yZGVyRGF0YRIdCglqc29uX2RhdG'
    'EYKCABKAlIAFIIanNvbkRhdGESOQoKY3JlYXRlZF9hdBgpIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBI5Cgp1cGRhdGVkX2F0GCogASgLMhouZ29vZ2xlLnByb3'
    'RvYnVmLlRpbWVzdGFtcFIJdXBkYXRlZEF0EjQKBnN0YXR1cxgrIAEoDjIcLnN5bmMudjEuU3lu'
    'Y09wZXJhdGlvblN0YXR1c1IGc3RhdHVzEh8KC3JldHJ5X2NvdW50GCwgASgFUgpyZXRyeUNvdW'
    '50Eh8KC21heF9yZXRyaWVzGC0gASgFUgptYXhSZXRyaWVzEkMKDW5leHRfcmV0cnlfYXQYLiAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSARSC25leHRSZXRyeUF0iAEBEigKDWVycm'
    '9yX21lc3NhZ2UYLyABKAlIBVIMZXJyb3JNZXNzYWdliAEBEkAKCG1ldGFkYXRhGDAgAygLMiQu'
    'c3luYy52MS5TeW5jT3BlcmF0aW9uLk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhGjsKDU1ldGFkYX'
    'RhRW50cnkSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUIQCg5v'
    'cGVyYXRpb25fZGF0YUILCglfc3RvcmVfaWRCDgoMX2J1c2luZXNzX2lkQgoKCF91c2VyX2lkQh'
    'AKDl9uZXh0X3JldHJ5X2F0QhAKDl9lcnJvcl9tZXNzYWdl');

@$core.Deprecated('Use syncOperationBatchDescriptor instead')
const SyncOperationBatch$json = {
  '1': 'SyncOperationBatch',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'batchId'},
    {
      '1': 'operations',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.sync.v1.SyncOperation',
      '10': 'operations'
    },
    {
      '1': 'store_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'storeId',
      '17': true
    },
    {
      '1': 'business_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'businessId',
      '17': true
    },
    {
      '1': 'user_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'userId',
      '17': true
    },
    {
      '1': 'created_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {'1': 'total_operations', '3': 7, '4': 1, '5': 5, '10': 'totalOperations'},
    {
      '1': 'successful_operations',
      '3': 8,
      '4': 1,
      '5': 5,
      '10': 'successfulOperations'
    },
    {
      '1': 'failed_operations',
      '3': 9,
      '4': 1,
      '5': 5,
      '10': 'failedOperations'
    },
    {
      '1': 'metadata',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.sync.v1.SyncOperationBatch.MetadataEntry',
      '10': 'metadata'
    },
  ],
  '3': [SyncOperationBatch_MetadataEntry$json],
  '8': [
    {'1': '_store_id'},
    {'1': '_business_id'},
    {'1': '_user_id'},
  ],
};

@$core.Deprecated('Use syncOperationBatchDescriptor instead')
const SyncOperationBatch_MetadataEntry$json = {
  '1': 'MetadataEntry',
  '2': [
    {'1': 'key', '3': 1, '4': 1, '5': 9, '10': 'key'},
    {'1': 'value', '3': 2, '4': 1, '5': 9, '10': 'value'},
  ],
  '7': {'7': true},
};

/// Descriptor for `SyncOperationBatch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncOperationBatchDescriptor = $convert.base64Decode(
    'ChJTeW5jT3BlcmF0aW9uQmF0Y2gSIgoIYmF0Y2hfaWQYASABKAlCB7pIBHICEAFSB2JhdGNoSW'
    'QSNgoKb3BlcmF0aW9ucxgCIAMoCzIWLnN5bmMudjEuU3luY09wZXJhdGlvblIKb3BlcmF0aW9u'
    'cxIeCghzdG9yZV9pZBgDIAEoCUgAUgdzdG9yZUlkiAEBEiQKC2J1c2luZXNzX2lkGAQgASgJSA'
    'FSCmJ1c2luZXNzSWSIAQESHAoHdXNlcl9pZBgFIAEoCUgCUgZ1c2VySWSIAQESOQoKY3JlYXRl'
    'ZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCWNyZWF0ZWRBdBIpChB0b3'
    'RhbF9vcGVyYXRpb25zGAcgASgFUg90b3RhbE9wZXJhdGlvbnMSMwoVc3VjY2Vzc2Z1bF9vcGVy'
    'YXRpb25zGAggASgFUhRzdWNjZXNzZnVsT3BlcmF0aW9ucxIrChFmYWlsZWRfb3BlcmF0aW9ucx'
    'gJIAEoBVIQZmFpbGVkT3BlcmF0aW9ucxJFCghtZXRhZGF0YRgKIAMoCzIpLnN5bmMudjEuU3lu'
    'Y09wZXJhdGlvbkJhdGNoLk1ldGFkYXRhRW50cnlSCG1ldGFkYXRhGjsKDU1ldGFkYXRhRW50cn'
    'kSEAoDa2V5GAEgASgJUgNrZXkSFAoFdmFsdWUYAiABKAlSBXZhbHVlOgI4AUILCglfc3RvcmVf'
    'aWRCDgoMX2J1c2luZXNzX2lkQgoKCF91c2VyX2lk');

@$core.Deprecated('Use submitSyncOperationsRequestDescriptor instead')
const SubmitSyncOperationsRequest$json = {
  '1': 'SubmitSyncOperationsRequest',
  '2': [
    {
      '1': 'store_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'storeId',
      '17': true
    },
    {
      '1': 'business_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'businessId',
      '17': true
    },
    {
      '1': 'user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'userId',
      '17': true
    },
    {
      '1': 'operations',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.sync.v1.SyncOperation',
      '8': {},
      '10': 'operations'
    },
    {
      '1': 'device_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'deviceId',
      '17': true
    },
    {
      '1': 'app_version',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'appVersion',
      '17': true
    },
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_business_id'},
    {'1': '_user_id'},
    {'1': '_device_id'},
    {'1': '_app_version'},
  ],
};

/// Descriptor for `SubmitSyncOperationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitSyncOperationsRequestDescriptor = $convert.base64Decode(
    'ChtTdWJtaXRTeW5jT3BlcmF0aW9uc1JlcXVlc3QSHgoIc3RvcmVfaWQYASABKAlIAFIHc3Rvcm'
    'VJZIgBARIkCgtidXNpbmVzc19pZBgCIAEoCUgBUgpidXNpbmVzc0lkiAEBEhwKB3VzZXJfaWQY'
    'AyABKAlIAlIGdXNlcklkiAEBEkAKCm9wZXJhdGlvbnMYBCADKAsyFi5zeW5jLnYxLlN5bmNPcG'
    'VyYXRpb25CCLpIBZIBAggBUgpvcGVyYXRpb25zEiAKCWRldmljZV9pZBgFIAEoCUgDUghkZXZp'
    'Y2VJZIgBARIkCgthcHBfdmVyc2lvbhgGIAEoCUgEUgphcHBWZXJzaW9uiAEBQgsKCV9zdG9yZV'
    '9pZEIOCgxfYnVzaW5lc3NfaWRCCgoIX3VzZXJfaWRCDAoKX2RldmljZV9pZEIOCgxfYXBwX3Zl'
    'cnNpb24=');

@$core.Deprecated('Use submitSyncOperationsResponseDescriptor instead')
const SubmitSyncOperationsResponse$json = {
  '1': 'SubmitSyncOperationsResponse',
  '2': [
    {'1': 'batch_id', '3': 1, '4': 1, '5': 9, '10': 'batchId'},
    {
      '1': 'operation_results',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.sync.v1.SyncOperationResult',
      '10': 'operationResults'
    },
    {
      '1': 'batch_status',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.sync.v1.SyncOperationStatus',
      '10': 'batchStatus'
    },
    {
      '1': 'processed_at',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'processedAt'
    },
  ],
};

/// Descriptor for `SubmitSyncOperationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List submitSyncOperationsResponseDescriptor = $convert.base64Decode(
    'ChxTdWJtaXRTeW5jT3BlcmF0aW9uc1Jlc3BvbnNlEhkKCGJhdGNoX2lkGAEgASgJUgdiYXRjaE'
    'lkEkkKEW9wZXJhdGlvbl9yZXN1bHRzGAIgAygLMhwuc3luYy52MS5TeW5jT3BlcmF0aW9uUmVz'
    'dWx0UhBvcGVyYXRpb25SZXN1bHRzEj8KDGJhdGNoX3N0YXR1cxgDIAEoDjIcLnN5bmMudjEuU3'
    'luY09wZXJhdGlvblN0YXR1c1ILYmF0Y2hTdGF0dXMSPQoMcHJvY2Vzc2VkX2F0GAQgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFILcHJvY2Vzc2VkQXQ=');

@$core.Deprecated('Use syncOperationResultDescriptor instead')
const SyncOperationResult$json = {
  '1': 'SyncOperationResult',
  '2': [
    {'1': 'operation_id', '3': 1, '4': 1, '5': 9, '10': 'operationId'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.sync.v1.SyncOperationStatus',
      '10': 'status'
    },
    {
      '1': 'error_message',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'errorMessage',
      '17': true
    },
    {
      '1': 'server_entity_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'serverEntityId',
      '17': true
    },
    {
      '1': 'processed_at',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'processedAt'
    },
  ],
  '8': [
    {'1': '_error_message'},
    {'1': '_server_entity_id'},
  ],
};

/// Descriptor for `SyncOperationResult`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncOperationResultDescriptor = $convert.base64Decode(
    'ChNTeW5jT3BlcmF0aW9uUmVzdWx0EiEKDG9wZXJhdGlvbl9pZBgBIAEoCVILb3BlcmF0aW9uSW'
    'QSNAoGc3RhdHVzGAIgASgOMhwuc3luYy52MS5TeW5jT3BlcmF0aW9uU3RhdHVzUgZzdGF0dXMS'
    'KAoNZXJyb3JfbWVzc2FnZRgDIAEoCUgAUgxlcnJvck1lc3NhZ2WIAQESLQoQc2VydmVyX2VudG'
    'l0eV9pZBgEIAEoCUgBUg5zZXJ2ZXJFbnRpdHlJZIgBARI9Cgxwcm9jZXNzZWRfYXQYBSABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgtwcm9jZXNzZWRBdEIQCg5fZXJyb3JfbWVzc2'
    'FnZUITChFfc2VydmVyX2VudGl0eV9pZA==');

@$core.Deprecated('Use getSyncOperationsStatusRequestDescriptor instead')
const GetSyncOperationsStatusRequest$json = {
  '1': 'GetSyncOperationsStatusRequest',
  '2': [
    {
      '1': 'store_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'storeId',
      '17': true
    },
    {
      '1': 'business_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'businessId',
      '17': true
    },
    {
      '1': 'user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'userId',
      '17': true
    },
    {
      '1': 'batch_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'batchId',
      '17': true
    },
    {'1': 'operation_ids', '3': 5, '4': 3, '5': 9, '10': 'operationIds'},
    {
      '1': 'status_filter',
      '3': 6,
      '4': 3,
      '5': 14,
      '6': '.sync.v1.SyncOperationStatus',
      '10': 'statusFilter'
    },
    {
      '1': 'entity_type_filter',
      '3': 7,
      '4': 3,
      '5': 14,
      '6': '.sync.v1.SyncEntityType',
      '10': 'entityTypeFilter'
    },
    {'1': 'limit', '3': 8, '4': 1, '5': 5, '9': 4, '10': 'limit', '17': true},
    {'1': 'offset', '3': 9, '4': 1, '5': 5, '9': 5, '10': 'offset', '17': true},
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_business_id'},
    {'1': '_user_id'},
    {'1': '_batch_id'},
    {'1': '_limit'},
    {'1': '_offset'},
  ],
};

/// Descriptor for `GetSyncOperationsStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSyncOperationsStatusRequestDescriptor = $convert.base64Decode(
    'Ch5HZXRTeW5jT3BlcmF0aW9uc1N0YXR1c1JlcXVlc3QSHgoIc3RvcmVfaWQYASABKAlIAFIHc3'
    'RvcmVJZIgBARIkCgtidXNpbmVzc19pZBgCIAEoCUgBUgpidXNpbmVzc0lkiAEBEhwKB3VzZXJf'
    'aWQYAyABKAlIAlIGdXNlcklkiAEBEh4KCGJhdGNoX2lkGAQgASgJSANSB2JhdGNoSWSIAQESIw'
    'oNb3BlcmF0aW9uX2lkcxgFIAMoCVIMb3BlcmF0aW9uSWRzEkEKDXN0YXR1c19maWx0ZXIYBiAD'
    'KA4yHC5zeW5jLnYxLlN5bmNPcGVyYXRpb25TdGF0dXNSDHN0YXR1c0ZpbHRlchJFChJlbnRpdH'
    'lfdHlwZV9maWx0ZXIYByADKA4yFy5zeW5jLnYxLlN5bmNFbnRpdHlUeXBlUhBlbnRpdHlUeXBl'
    'RmlsdGVyEhkKBWxpbWl0GAggASgFSARSBWxpbWl0iAEBEhsKBm9mZnNldBgJIAEoBUgFUgZvZm'
    'ZzZXSIAQFCCwoJX3N0b3JlX2lkQg4KDF9idXNpbmVzc19pZEIKCghfdXNlcl9pZEILCglfYmF0'
    'Y2hfaWRCCAoGX2xpbWl0QgkKB19vZmZzZXQ=');

@$core.Deprecated('Use getSyncOperationsStatusResponseDescriptor instead')
const GetSyncOperationsStatusResponse$json = {
  '1': 'GetSyncOperationsStatusResponse',
  '2': [
    {
      '1': 'operations',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.sync.v1.SyncOperation',
      '10': 'operations'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {
      '1': 'summary',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.sync.v1.SyncOperationsSummary',
      '10': 'summary'
    },
  ],
};

/// Descriptor for `GetSyncOperationsStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSyncOperationsStatusResponseDescriptor =
    $convert.base64Decode(
        'Ch9HZXRTeW5jT3BlcmF0aW9uc1N0YXR1c1Jlc3BvbnNlEjYKCm9wZXJhdGlvbnMYASADKAsyFi'
        '5zeW5jLnYxLlN5bmNPcGVyYXRpb25SCm9wZXJhdGlvbnMSHwoLdG90YWxfY291bnQYAiABKAVS'
        'CnRvdGFsQ291bnQSOAoHc3VtbWFyeRgDIAEoCzIeLnN5bmMudjEuU3luY09wZXJhdGlvbnNTdW'
        '1tYXJ5UgdzdW1tYXJ5');

@$core.Deprecated('Use syncOperationsSummaryDescriptor instead')
const SyncOperationsSummary$json = {
  '1': 'SyncOperationsSummary',
  '2': [
    {'1': 'total_operations', '3': 1, '4': 1, '5': 5, '10': 'totalOperations'},
    {
      '1': 'pending_operations',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'pendingOperations'
    },
    {
      '1': 'in_progress_operations',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'inProgressOperations'
    },
    {
      '1': 'successful_operations',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'successfulOperations'
    },
    {
      '1': 'failed_operations',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'failedOperations'
    },
    {
      '1': 'retrying_operations',
      '3': 6,
      '4': 1,
      '5': 5,
      '10': 'retryingOperations'
    },
    {
      '1': 'abandoned_operations',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'abandonedOperations'
    },
  ],
};

/// Descriptor for `SyncOperationsSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List syncOperationsSummaryDescriptor = $convert.base64Decode(
    'ChVTeW5jT3BlcmF0aW9uc1N1bW1hcnkSKQoQdG90YWxfb3BlcmF0aW9ucxgBIAEoBVIPdG90YW'
    'xPcGVyYXRpb25zEi0KEnBlbmRpbmdfb3BlcmF0aW9ucxgCIAEoBVIRcGVuZGluZ09wZXJhdGlv'
    'bnMSNAoWaW5fcHJvZ3Jlc3Nfb3BlcmF0aW9ucxgDIAEoBVIUaW5Qcm9ncmVzc09wZXJhdGlvbn'
    'MSMwoVc3VjY2Vzc2Z1bF9vcGVyYXRpb25zGAQgASgFUhRzdWNjZXNzZnVsT3BlcmF0aW9ucxIr'
    'ChFmYWlsZWRfb3BlcmF0aW9ucxgFIAEoBVIQZmFpbGVkT3BlcmF0aW9ucxIvChNyZXRyeWluZ1'
    '9vcGVyYXRpb25zGAYgASgFUhJyZXRyeWluZ09wZXJhdGlvbnMSMQoUYWJhbmRvbmVkX29wZXJh'
    'dGlvbnMYByABKAVSE2FiYW5kb25lZE9wZXJhdGlvbnM=');

@$core.Deprecated('Use streamSyncOperationsRequestDescriptor instead')
const StreamSyncOperationsRequest$json = {
  '1': 'StreamSyncOperationsRequest',
  '2': [
    {
      '1': 'store_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'storeId',
      '17': true
    },
    {
      '1': 'business_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'businessId',
      '17': true
    },
    {
      '1': 'user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'userId',
      '17': true
    },
    {
      '1': 'entity_type_filter',
      '3': 4,
      '4': 3,
      '5': 14,
      '6': '.sync.v1.SyncEntityType',
      '10': 'entityTypeFilter'
    },
    {
      '1': 'operation_type_filter',
      '3': 5,
      '4': 3,
      '5': 14,
      '6': '.sync.v1.SyncOperationType',
      '10': 'operationTypeFilter'
    },
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_business_id'},
    {'1': '_user_id'},
  ],
};

/// Descriptor for `StreamSyncOperationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamSyncOperationsRequestDescriptor = $convert.base64Decode(
    'ChtTdHJlYW1TeW5jT3BlcmF0aW9uc1JlcXVlc3QSHgoIc3RvcmVfaWQYASABKAlIAFIHc3Rvcm'
    'VJZIgBARIkCgtidXNpbmVzc19pZBgCIAEoCUgBUgpidXNpbmVzc0lkiAEBEhwKB3VzZXJfaWQY'
    'AyABKAlIAlIGdXNlcklkiAEBEkUKEmVudGl0eV90eXBlX2ZpbHRlchgEIAMoDjIXLnN5bmMudj'
    'EuU3luY0VudGl0eVR5cGVSEGVudGl0eVR5cGVGaWx0ZXISTgoVb3BlcmF0aW9uX3R5cGVfZmls'
    'dGVyGAUgAygOMhouc3luYy52MS5TeW5jT3BlcmF0aW9uVHlwZVITb3BlcmF0aW9uVHlwZUZpbH'
    'RlckILCglfc3RvcmVfaWRCDgoMX2J1c2luZXNzX2lkQgoKCF91c2VyX2lk');

@$core.Deprecated('Use streamSyncOperationsResponseDescriptor instead')
const StreamSyncOperationsResponse$json = {
  '1': 'StreamSyncOperationsResponse',
  '2': [
    {
      '1': 'operation',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.sync.v1.SyncOperation',
      '10': 'operation'
    },
    {'1': 'update_type', '3': 2, '4': 1, '5': 9, '10': 'updateType'},
    {
      '1': 'update_timestamp',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updateTimestamp'
    },
  ],
};

/// Descriptor for `StreamSyncOperationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List streamSyncOperationsResponseDescriptor = $convert.base64Decode(
    'ChxTdHJlYW1TeW5jT3BlcmF0aW9uc1Jlc3BvbnNlEjQKCW9wZXJhdGlvbhgBIAEoCzIWLnN5bm'
    'MudjEuU3luY09wZXJhdGlvblIJb3BlcmF0aW9uEh8KC3VwZGF0ZV90eXBlGAIgASgJUgp1cGRh'
    'dGVUeXBlEkUKEHVwZGF0ZV90aW1lc3RhbXAYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZX'
    'N0YW1wUg91cGRhdGVUaW1lc3RhbXA=');

@$core.Deprecated('Use retrySyncOperationsRequestDescriptor instead')
const RetrySyncOperationsRequest$json = {
  '1': 'RetrySyncOperationsRequest',
  '2': [
    {
      '1': 'store_id',
      '3': 1,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'storeId',
      '17': true
    },
    {
      '1': 'business_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'businessId',
      '17': true
    },
    {
      '1': 'user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'userId',
      '17': true
    },
    {'1': 'operation_ids', '3': 4, '4': 3, '5': 9, '10': 'operationIds'},
    {
      '1': 'batch_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'batchId',
      '17': true
    },
    {
      '1': 'retry_all_failed',
      '3': 6,
      '4': 1,
      '5': 8,
      '9': 4,
      '10': 'retryAllFailed',
      '17': true
    },
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_business_id'},
    {'1': '_user_id'},
    {'1': '_batch_id'},
    {'1': '_retry_all_failed'},
  ],
};

/// Descriptor for `RetrySyncOperationsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retrySyncOperationsRequestDescriptor = $convert.base64Decode(
    'ChpSZXRyeVN5bmNPcGVyYXRpb25zUmVxdWVzdBIeCghzdG9yZV9pZBgBIAEoCUgAUgdzdG9yZU'
    'lkiAEBEiQKC2J1c2luZXNzX2lkGAIgASgJSAFSCmJ1c2luZXNzSWSIAQESHAoHdXNlcl9pZBgD'
    'IAEoCUgCUgZ1c2VySWSIAQESIwoNb3BlcmF0aW9uX2lkcxgEIAMoCVIMb3BlcmF0aW9uSWRzEh'
    '4KCGJhdGNoX2lkGAUgASgJSANSB2JhdGNoSWSIAQESLQoQcmV0cnlfYWxsX2ZhaWxlZBgGIAEo'
    'CEgEUg5yZXRyeUFsbEZhaWxlZIgBAUILCglfc3RvcmVfaWRCDgoMX2J1c2luZXNzX2lkQgoKCF'
    '91c2VyX2lkQgsKCV9iYXRjaF9pZEITChFfcmV0cnlfYWxsX2ZhaWxlZA==');

@$core.Deprecated('Use retrySyncOperationsResponseDescriptor instead')
const RetrySyncOperationsResponse$json = {
  '1': 'RetrySyncOperationsResponse',
  '2': [
    {
      '1': 'operations_queued',
      '3': 1,
      '4': 1,
      '5': 5,
      '10': 'operationsQueued'
    },
    {
      '1': 'queued_operation_ids',
      '3': 2,
      '4': 3,
      '5': 9,
      '10': 'queuedOperationIds'
    },
    {
      '1': 'failed_to_queue_ids',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'failedToQueueIds'
    },
  ],
};

/// Descriptor for `RetrySyncOperationsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List retrySyncOperationsResponseDescriptor = $convert.base64Decode(
    'ChtSZXRyeVN5bmNPcGVyYXRpb25zUmVzcG9uc2USKwoRb3BlcmF0aW9uc19xdWV1ZWQYASABKA'
    'VSEG9wZXJhdGlvbnNRdWV1ZWQSMAoUcXVldWVkX29wZXJhdGlvbl9pZHMYAiADKAlSEnF1ZXVl'
    'ZE9wZXJhdGlvbklkcxItChNmYWlsZWRfdG9fcXVldWVfaWRzGAMgAygJUhBmYWlsZWRUb1F1ZX'
    'VlSWRz');

const $core.Map<$core.String, $core.dynamic> SyncServiceBase$json = {
  '1': 'SyncService',
  '2': [
    {
      '1': 'SubmitSyncOperations',
      '2': '.sync.v1.SubmitSyncOperationsRequest',
      '3': '.sync.v1.SubmitSyncOperationsResponse'
    },
    {
      '1': 'GetSyncOperationsStatus',
      '2': '.sync.v1.GetSyncOperationsStatusRequest',
      '3': '.sync.v1.GetSyncOperationsStatusResponse'
    },
    {
      '1': 'StreamSyncOperations',
      '2': '.sync.v1.StreamSyncOperationsRequest',
      '3': '.sync.v1.StreamSyncOperationsResponse',
      '6': true
    },
    {
      '1': 'RetrySyncOperations',
      '2': '.sync.v1.RetrySyncOperationsRequest',
      '3': '.sync.v1.RetrySyncOperationsResponse'
    },
  ],
};

@$core.Deprecated('Use syncServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    SyncServiceBase$messageJson = {
  '.sync.v1.SubmitSyncOperationsRequest': SubmitSyncOperationsRequest$json,
  '.sync.v1.SyncOperation': SyncOperation$json,
  '.inventory.v1.StoreProduct': $0.StoreProduct$json,
  '.google.protobuf.Timestamp': $3.Timestamp$json,
  '.inventory.v1.GlobalProduct': $0.GlobalProduct$json,
  '.inventory.v1.Internationalized': $1.Internationalized$json,
  '.inventory.v1.Category': $1.Category$json,
  '.order.v1.Order': $2.Order$json,
  '.order.v1.OrderItem': $2.OrderItem$json,
  '.order.v1.StatusHistory': $2.StatusHistory$json,
  '.sync.v1.SyncOperation.MetadataEntry': SyncOperation_MetadataEntry$json,
  '.sync.v1.SubmitSyncOperationsResponse': SubmitSyncOperationsResponse$json,
  '.sync.v1.SyncOperationResult': SyncOperationResult$json,
  '.sync.v1.GetSyncOperationsStatusRequest':
      GetSyncOperationsStatusRequest$json,
  '.sync.v1.GetSyncOperationsStatusResponse':
      GetSyncOperationsStatusResponse$json,
  '.sync.v1.SyncOperationsSummary': SyncOperationsSummary$json,
  '.sync.v1.StreamSyncOperationsRequest': StreamSyncOperationsRequest$json,
  '.sync.v1.StreamSyncOperationsResponse': StreamSyncOperationsResponse$json,
  '.sync.v1.RetrySyncOperationsRequest': RetrySyncOperationsRequest$json,
  '.sync.v1.RetrySyncOperationsResponse': RetrySyncOperationsResponse$json,
};

/// Descriptor for `SyncService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List syncServiceDescriptor = $convert.base64Decode(
    'CgtTeW5jU2VydmljZRJjChRTdWJtaXRTeW5jT3BlcmF0aW9ucxIkLnN5bmMudjEuU3VibWl0U3'
    'luY09wZXJhdGlvbnNSZXF1ZXN0GiUuc3luYy52MS5TdWJtaXRTeW5jT3BlcmF0aW9uc1Jlc3Bv'
    'bnNlEmwKF0dldFN5bmNPcGVyYXRpb25zU3RhdHVzEicuc3luYy52MS5HZXRTeW5jT3BlcmF0aW'
    '9uc1N0YXR1c1JlcXVlc3QaKC5zeW5jLnYxLkdldFN5bmNPcGVyYXRpb25zU3RhdHVzUmVzcG9u'
    'c2USZQoUU3RyZWFtU3luY09wZXJhdGlvbnMSJC5zeW5jLnYxLlN0cmVhbVN5bmNPcGVyYXRpb2'
    '5zUmVxdWVzdBolLnN5bmMudjEuU3RyZWFtU3luY09wZXJhdGlvbnNSZXNwb25zZTABEmAKE1Jl'
    'dHJ5U3luY09wZXJhdGlvbnMSIy5zeW5jLnYxLlJldHJ5U3luY09wZXJhdGlvbnNSZXF1ZXN0Gi'
    'Quc3luYy52MS5SZXRyeVN5bmNPcGVyYXRpb25zUmVzcG9uc2U=');
