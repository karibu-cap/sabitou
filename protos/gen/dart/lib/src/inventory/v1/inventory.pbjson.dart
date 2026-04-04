// This is a generated file - do not edit.
//
// Generated from inventory/v1/inventory.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use batchStatusDescriptor instead')
const BatchStatus$json = {
  '1': 'BatchStatus',
  '2': [
    {'1': 'BATCH_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'BATCH_STATUS_ACTIVE', '2': 1},
    {'1': 'BATCH_STATUS_QUARANTINE', '2': 2},
    {'1': 'BATCH_STATUS_EXPIRED', '2': 3},
    {'1': 'BATCH_STATUS_CONSUMED', '2': 4},
  ],
};

/// Descriptor for `BatchStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List batchStatusDescriptor = $convert.base64Decode(
    'CgtCYXRjaFN0YXR1cxIcChhCQVRDSF9TVEFUVVNfVU5TUEVDSUZJRUQQABIXChNCQVRDSF9TVE'
    'FUVVNfQUNUSVZFEAESGwoXQkFUQ0hfU1RBVFVTX1FVQVJBTlRJTkUQAhIYChRCQVRDSF9TVEFU'
    'VVNfRVhQSVJFRBADEhkKFUJBVENIX1NUQVRVU19DT05TVU1FRBAE');

@$core.Deprecated('Use stockStatusDescriptor instead')
const StockStatus$json = {
  '1': 'StockStatus',
  '2': [
    {'1': 'STOCK_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'STOCK_STATUS_LOW', '2': 1},
    {'1': 'STOCK_STATUS_OK', '2': 2},
    {'1': 'STOCK_STATUS_OUT_OF_STOCK', '2': 3},
  ],
};

/// Descriptor for `StockStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List stockStatusDescriptor = $convert.base64Decode(
    'CgtTdG9ja1N0YXR1cxIcChhTVE9DS19TVEFUVVNfVU5TUEVDSUZJRUQQABIUChBTVE9DS19TVE'
    'FUVVNfTE9XEAESEwoPU1RPQ0tfU1RBVFVTX09LEAISHQoZU1RPQ0tfU1RBVFVTX09VVF9PRl9T'
    'VE9DSxAD');

@$core.Deprecated('Use batchDescriptor instead')
const Batch$json = {
  '1': 'Batch',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {'1': 'product_id', '3': 2, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'warehouse_id', '3': 3, '4': 1, '5': 9, '10': 'warehouseId'},
    {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    {
      '1': 'expiration_date',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expirationDate'
    },
    {
      '1': 'received_at',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'receivedAt'
    },
    {
      '1': 'supplier_batch_number',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'supplierBatchNumber'
    },
    {'1': 'supplier_id', '3': 8, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'purchase_price', '3': 9, '4': 1, '5': 5, '10': 'purchasePrice'},
    {
      '1': 'status',
      '3': 10,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.BatchStatus',
      '10': 'status'
    },
    {'1': 'notes', '3': 11, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `Batch`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List batchDescriptor = $convert.base64Decode(
    'CgVCYXRjaBIdCgZyZWZfaWQYASABKAlCBrpIA8gBAVIFcmVmSWQSHQoKcHJvZHVjdF9pZBgCIA'
    'EoCVIJcHJvZHVjdElkEiEKDHdhcmVob3VzZV9pZBgDIAEoCVILd2FyZWhvdXNlSWQSGgoIcXVh'
    'bnRpdHkYBCABKAVSCHF1YW50aXR5EkMKD2V4cGlyYXRpb25fZGF0ZRgFIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBSDmV4cGlyYXRpb25EYXRlEjsKC3JlY2VpdmVkX2F0GAYgASgL'
    'MhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIKcmVjZWl2ZWRBdBIyChVzdXBwbGllcl9iYX'
    'RjaF9udW1iZXIYByABKAlSE3N1cHBsaWVyQmF0Y2hOdW1iZXISHwoLc3VwcGxpZXJfaWQYCCAB'
    'KAlSCnN1cHBsaWVySWQSJQoOcHVyY2hhc2VfcHJpY2UYCSABKAVSDXB1cmNoYXNlUHJpY2USMQ'
    'oGc3RhdHVzGAogASgOMhkuaW52ZW50b3J5LnYxLkJhdGNoU3RhdHVzUgZzdGF0dXMSFAoFbm90'
    'ZXMYCyABKAlSBW5vdGVz');

@$core.Deprecated('Use inventoryLevelDescriptor instead')
const InventoryLevel$json = {
  '1': 'InventoryLevel',
  '2': [
    {'1': 'store_product_id', '3': 1, '4': 1, '5': 9, '10': 'storeProductId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'quantity_available',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'quantityAvailable'
    },
    {
      '1': 'quantity_committed',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'quantityCommitted'
    },
    {'1': 'quantity_on_hand', '3': 5, '4': 1, '5': 5, '10': 'quantityOnHand'},
    {'1': 'min_threshold', '3': 8, '4': 1, '5': 5, '10': 'minThreshold'},
    {
      '1': 'last_updated',
      '3': 6,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastUpdated'
    },
    {
      '1': 'last_updated_by_user_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '10': 'lastUpdatedByUserId'
    },
    {
      '1': 'batches',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.Batch',
      '10': 'batches'
    },
  ],
};

/// Descriptor for `InventoryLevel`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryLevelDescriptor = $convert.base64Decode(
    'Cg5JbnZlbnRvcnlMZXZlbBIoChBzdG9yZV9wcm9kdWN0X2lkGAEgASgJUg5zdG9yZVByb2R1Y3'
    'RJZBIZCghzdG9yZV9pZBgCIAEoCVIHc3RvcmVJZBItChJxdWFudGl0eV9hdmFpbGFibGUYAyAB'
    'KAVSEXF1YW50aXR5QXZhaWxhYmxlEi0KEnF1YW50aXR5X2NvbW1pdHRlZBgEIAEoBVIRcXVhbn'
    'RpdHlDb21taXR0ZWQSKAoQcXVhbnRpdHlfb25faGFuZBgFIAEoBVIOcXVhbnRpdHlPbkhhbmQS'
    'IwoNbWluX3RocmVzaG9sZBgIIAEoBVIMbWluVGhyZXNob2xkEj0KDGxhc3RfdXBkYXRlZBgGIA'
    'EoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSC2xhc3RVcGRhdGVkEjQKF2xhc3RfdXBk'
    'YXRlZF9ieV91c2VyX2lkGAcgASgJUhNsYXN0VXBkYXRlZEJ5VXNlcklkEi0KB2JhdGNoZXMYCS'
    'ADKAsyEy5pbnZlbnRvcnkudjEuQmF0Y2hSB2JhdGNoZXM=');

@$core.Deprecated('Use inventoryLevelWithProductDescriptor instead')
const InventoryLevelWithProduct$json = {
  '1': 'InventoryLevelWithProduct',
  '2': [
    {
      '1': 'level',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.InventoryLevel',
      '10': 'level'
    },
    {
      '1': 'product',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'product'
    },
    {
      '1': 'global_product',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'globalProduct'
    },
    {'1': 'stock_value', '3': 4, '4': 1, '5': 5, '10': 'stockValue'},
    {
      '1': 'stock_status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.StockStatus',
      '10': 'stockStatus'
    },
  ],
};

/// Descriptor for `InventoryLevelWithProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryLevelWithProductDescriptor = $convert.base64Decode(
    'ChlJbnZlbnRvcnlMZXZlbFdpdGhQcm9kdWN0EjIKBWxldmVsGAEgASgLMhwuaW52ZW50b3J5Ln'
    'YxLkludmVudG9yeUxldmVsUgVsZXZlbBI0Cgdwcm9kdWN0GAIgASgLMhouaW52ZW50b3J5LnYx'
    'LlN0b3JlUHJvZHVjdFIHcHJvZHVjdBJCCg5nbG9iYWxfcHJvZHVjdBgDIAEoCzIbLmludmVudG'
    '9yeS52MS5HbG9iYWxQcm9kdWN0Ug1nbG9iYWxQcm9kdWN0Eh8KC3N0b2NrX3ZhbHVlGAQgASgF'
    'UgpzdG9ja1ZhbHVlEjwKDHN0b2NrX3N0YXR1cxgFIAEoDjIZLmludmVudG9yeS52MS5TdG9ja1'
    'N0YXR1c1ILc3RvY2tTdGF0dXM=');
