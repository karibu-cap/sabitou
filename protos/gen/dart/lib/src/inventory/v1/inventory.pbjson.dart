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

import '../../audits/v1/inventory_transaction.pbjson.dart' as $2;
import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import 'category.pbjson.dart' as $3;
import 'store_product.pbjson.dart' as $1;

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
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
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
    'CgVCYXRjaBInCgtkb2N1bWVudF9pZBgBIAEoCUIGukgDyAEBUgpkb2N1bWVudElkEh0KCnByb2'
    'R1Y3RfaWQYAiABKAlSCXByb2R1Y3RJZBIhCgx3YXJlaG91c2VfaWQYAyABKAlSC3dhcmVob3Vz'
    'ZUlkEhoKCHF1YW50aXR5GAQgASgFUghxdWFudGl0eRJDCg9leHBpcmF0aW9uX2RhdGUYBSABKA'
    'syGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg5leHBpcmF0aW9uRGF0ZRI7CgtyZWNlaXZl'
    'ZF9hdBgGIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCnJlY2VpdmVkQXQSMgoVc3'
    'VwcGxpZXJfYmF0Y2hfbnVtYmVyGAcgASgJUhNzdXBwbGllckJhdGNoTnVtYmVyEh8KC3N1cHBs'
    'aWVyX2lkGAggASgJUgpzdXBwbGllcklkEiUKDnB1cmNoYXNlX3ByaWNlGAkgASgFUg1wdXJjaG'
    'FzZVByaWNlEjEKBnN0YXR1cxgKIAEoDjIZLmludmVudG9yeS52MS5CYXRjaFN0YXR1c1IGc3Rh'
    'dHVzEhQKBW5vdGVzGAsgASgJUgVub3Rlcw==');

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

@$core.Deprecated('Use getInventoryTransactionHistoryRequestDescriptor instead')
const GetInventoryTransactionHistoryRequest$json = {
  '1': 'GetInventoryTransactionHistoryRequest',
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
      '1': 'product_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'productId',
      '17': true
    },
    {
      '1': 'transaction_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.audits.v1.TransactionType',
      '9': 2,
      '10': 'transactionType',
      '17': true
    },
    {
      '1': 'start_date',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
    {'1': 'page_size', '3': 6, '4': 1, '5': 5, '10': 'pageSize'},
    {'1': 'page_number', '3': 7, '4': 1, '5': 5, '10': 'pageNumber'},
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_product_id'},
    {'1': '_transaction_type'},
  ],
};

/// Descriptor for `GetInventoryTransactionHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryTransactionHistoryRequestDescriptor = $convert.base64Decode(
    'CiVHZXRJbnZlbnRvcnlUcmFuc2FjdGlvbkhpc3RvcnlSZXF1ZXN0Eh4KCHN0b3JlX2lkGAEgAS'
    'gJSABSB3N0b3JlSWSIAQESIgoKcHJvZHVjdF9pZBgCIAEoCUgBUglwcm9kdWN0SWSIAQESSgoQ'
    'dHJhbnNhY3Rpb25fdHlwZRgDIAEoDjIaLmF1ZGl0cy52MS5UcmFuc2FjdGlvblR5cGVIAlIPdH'
    'JhbnNhY3Rpb25UeXBliAEBEjkKCnN0YXJ0X2RhdGUYBCABKAsyGi5nb29nbGUucHJvdG9idWYu'
    'VGltZXN0YW1wUglzdGFydERhdGUSNQoIZW5kX2RhdGUYBSABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wUgdlbmREYXRlEhsKCXBhZ2Vfc2l6ZRgGIAEoBVIIcGFnZVNpemUSHwoLcGFn'
    'ZV9udW1iZXIYByABKAVSCnBhZ2VOdW1iZXJCCwoJX3N0b3JlX2lkQg0KC19wcm9kdWN0X2lkQh'
    'MKEV90cmFuc2FjdGlvbl90eXBl');

@$core
    .Deprecated('Use getInventoryTransactionHistoryResponseDescriptor instead')
const GetInventoryTransactionHistoryResponse$json = {
  '1': 'GetInventoryTransactionHistoryResponse',
  '2': [
    {
      '1': 'transactions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.audits.v1.InventoryTransaction',
      '10': 'transactions'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'total_quantity_in', '3': 3, '4': 1, '5': 1, '10': 'totalQuantityIn'},
    {
      '1': 'total_quantity_out',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'totalQuantityOut'
    },
  ],
};

/// Descriptor for `GetInventoryTransactionHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryTransactionHistoryResponseDescriptor =
    $convert.base64Decode(
        'CiZHZXRJbnZlbnRvcnlUcmFuc2FjdGlvbkhpc3RvcnlSZXNwb25zZRJDCgx0cmFuc2FjdGlvbn'
        'MYASADKAsyHy5hdWRpdHMudjEuSW52ZW50b3J5VHJhbnNhY3Rpb25SDHRyYW5zYWN0aW9ucxIf'
        'Cgt0b3RhbF9jb3VudBgCIAEoBVIKdG90YWxDb3VudBIqChF0b3RhbF9xdWFudGl0eV9pbhgDIA'
        'EoAVIPdG90YWxRdWFudGl0eUluEiwKEnRvdGFsX3F1YW50aXR5X291dBgEIAEoAVIQdG90YWxR'
        'dWFudGl0eU91dA==');

@$core.Deprecated('Use getProductInventoryLevelsRequestDescriptor instead')
const GetProductInventoryLevelsRequest$json = {
  '1': 'GetProductInventoryLevelsRequest',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
  ],
};

/// Descriptor for `GetProductInventoryLevelsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductInventoryLevelsRequestDescriptor =
    $convert.base64Decode(
        'CiBHZXRQcm9kdWN0SW52ZW50b3J5TGV2ZWxzUmVxdWVzdBIdCgpwcm9kdWN0X2lkGAEgASgJUg'
        'lwcm9kdWN0SWQSGQoIc3RvcmVfaWQYAiABKAlSB3N0b3JlSWQ=');

@$core.Deprecated('Use getProductInventoryLevelsResponseDescriptor instead')
const GetProductInventoryLevelsResponse$json = {
  '1': 'GetProductInventoryLevelsResponse',
  '2': [
    {
      '1': 'level',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.InventoryLevel',
      '10': 'level'
    },
  ],
};

/// Descriptor for `GetProductInventoryLevelsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductInventoryLevelsResponseDescriptor =
    $convert.base64Decode(
        'CiFHZXRQcm9kdWN0SW52ZW50b3J5TGV2ZWxzUmVzcG9uc2USMgoFbGV2ZWwYASABKAsyHC5pbn'
        'ZlbnRvcnkudjEuSW52ZW50b3J5TGV2ZWxSBWxldmVs');

@$core.Deprecated('Use checkProductAvailabilityRequestDescriptor instead')
const CheckProductAvailabilityRequest$json = {
  '1': 'CheckProductAvailabilityRequest',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'store_id', '3': 2, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'quantity_needed', '3': 3, '4': 1, '5': 1, '10': 'quantityNeeded'},
  ],
};

/// Descriptor for `CheckProductAvailabilityRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkProductAvailabilityRequestDescriptor =
    $convert.base64Decode(
        'Ch9DaGVja1Byb2R1Y3RBdmFpbGFiaWxpdHlSZXF1ZXN0Eh0KCnByb2R1Y3RfaWQYASABKAlSCX'
        'Byb2R1Y3RJZBIZCghzdG9yZV9pZBgCIAEoCVIHc3RvcmVJZBInCg9xdWFudGl0eV9uZWVkZWQY'
        'AyABKAFSDnF1YW50aXR5TmVlZGVk');

@$core.Deprecated('Use checkProductAvailabilityResponseDescriptor instead')
const CheckProductAvailabilityResponse$json = {
  '1': 'CheckProductAvailabilityResponse',
  '2': [
    {'1': 'is_available', '3': 1, '4': 1, '5': 8, '10': 'isAvailable'},
    {
      '1': 'quantity_available',
      '3': 2,
      '4': 1,
      '5': 1,
      '10': 'quantityAvailable'
    },
    {'1': 'quantity_needed', '3': 3, '4': 1, '5': 1, '10': 'quantityNeeded'},
    {'1': 'shortage', '3': 4, '4': 1, '5': 1, '10': 'shortage'},
  ],
};

/// Descriptor for `CheckProductAvailabilityResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List checkProductAvailabilityResponseDescriptor =
    $convert.base64Decode(
        'CiBDaGVja1Byb2R1Y3RBdmFpbGFiaWxpdHlSZXNwb25zZRIhCgxpc19hdmFpbGFibGUYASABKA'
        'hSC2lzQXZhaWxhYmxlEi0KEnF1YW50aXR5X2F2YWlsYWJsZRgCIAEoAVIRcXVhbnRpdHlBdmFp'
        'bGFibGUSJwoPcXVhbnRpdHlfbmVlZGVkGAMgASgBUg5xdWFudGl0eU5lZWRlZBIaCghzaG9ydG'
        'FnZRgEIAEoAVIIc2hvcnRhZ2U=');

@$core.Deprecated('Use getLowStockItemsRequestDescriptor instead')
const GetLowStockItemsRequest$json = {
  '1': 'GetLowStockItemsRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'threshold',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'threshold',
      '17': true
    },
    {
      '1': 'category_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'categoryId',
      '17': true
    },
    {
      '1': 'supplier_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'supplierId',
      '17': true
    },
  ],
  '8': [
    {'1': '_threshold'},
    {'1': '_category_id'},
    {'1': '_supplier_id'},
  ],
};

/// Descriptor for `GetLowStockItemsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLowStockItemsRequestDescriptor = $convert.base64Decode(
    'ChdHZXRMb3dTdG9ja0l0ZW1zUmVxdWVzdBIhCghzdG9yZV9pZBgBIAEoCUIGukgDyAEBUgdzdG'
    '9yZUlkEiEKCXRocmVzaG9sZBgCIAEoBUgAUgl0aHJlc2hvbGSIAQESJAoLY2F0ZWdvcnlfaWQY'
    'AyABKAlIAVIKY2F0ZWdvcnlJZIgBARIkCgtzdXBwbGllcl9pZBgEIAEoCUgCUgpzdXBwbGllck'
    'lkiAEBQgwKCl90aHJlc2hvbGRCDgoMX2NhdGVnb3J5X2lkQg4KDF9zdXBwbGllcl9pZA==');

@$core.Deprecated('Use getLowStockItemsResponseDescriptor instead')
const GetLowStockItemsResponse$json = {
  '1': 'GetLowStockItemsResponse',
  '2': [
    {
      '1': 'low_stock_items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.InventoryLevel',
      '10': 'lowStockItems'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `GetLowStockItemsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getLowStockItemsResponseDescriptor = $convert.base64Decode(
    'ChhHZXRMb3dTdG9ja0l0ZW1zUmVzcG9uc2USRAoPbG93X3N0b2NrX2l0ZW1zGAEgAygLMhwuaW'
    '52ZW50b3J5LnYxLkludmVudG9yeUxldmVsUg1sb3dTdG9ja0l0ZW1zEh8KC3RvdGFsX2NvdW50'
    'GAIgASgFUgp0b3RhbENvdW50');

@$core.Deprecated('Use getResourceInventoryRequestDescriptor instead')
const GetResourceInventoryRequest$json = {
  '1': 'GetResourceInventoryRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'product_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'productId',
      '17': true
    },
    {
      '1': 'as_of_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'asOfDate',
      '17': true
    },
    {
      '1': 'supplier_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'supplierId',
      '17': true
    },
  ],
  '8': [
    {'1': '_product_id'},
    {'1': '_as_of_date'},
    {'1': '_supplier_id'},
  ],
};

/// Descriptor for `GetResourceInventoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResourceInventoryRequestDescriptor = $convert.base64Decode(
    'ChtHZXRSZXNvdXJjZUludmVudG9yeVJlcXVlc3QSIQoIc3RvcmVfaWQYASABKAlCBrpIA8gBAV'
    'IHc3RvcmVJZBIiCgpwcm9kdWN0X2lkGAIgASgJSABSCXByb2R1Y3RJZIgBARI9Cgphc19vZl9k'
    'YXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgBUghhc09mRGF0ZYgBARIkCg'
    'tzdXBwbGllcl9pZBgEIAEoCUgCUgpzdXBwbGllcklkiAEBQg0KC19wcm9kdWN0X2lkQg0KC19h'
    'c19vZl9kYXRlQg4KDF9zdXBwbGllcl9pZA==');

@$core.Deprecated('Use getResourceInventoryResponseDescriptor instead')
const GetResourceInventoryResponse$json = {
  '1': 'GetResourceInventoryResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.InventoryLevel',
      '10': 'items'
    },
    {'1': 'total_quantity', '3': 2, '4': 1, '5': 1, '10': 'totalQuantity'},
    {
      '1': 'snapshot_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'snapshotDate'
    },
  ],
};

/// Descriptor for `GetResourceInventoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getResourceInventoryResponseDescriptor = $convert.base64Decode(
    'ChxHZXRSZXNvdXJjZUludmVudG9yeVJlc3BvbnNlEjIKBWl0ZW1zGAEgAygLMhwuaW52ZW50b3'
    'J5LnYxLkludmVudG9yeUxldmVsUgVpdGVtcxIlCg50b3RhbF9xdWFudGl0eRgCIAEoAVINdG90'
    'YWxRdWFudGl0eRI/Cg1zbmFwc2hvdF9kYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbW'
    'VzdGFtcFIMc25hcHNob3REYXRl');

@$core.Deprecated('Use getProductTransactionHistoryRequestDescriptor instead')
const GetProductTransactionHistoryRequest$json = {
  '1': 'GetProductTransactionHistoryRequest',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {
      '1': 'store_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'storeId',
      '17': true
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
  '8': [
    {'1': '_store_id'},
  ],
};

/// Descriptor for `GetProductTransactionHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductTransactionHistoryRequestDescriptor = $convert.base64Decode(
    'CiNHZXRQcm9kdWN0VHJhbnNhY3Rpb25IaXN0b3J5UmVxdWVzdBIdCgpwcm9kdWN0X2lkGAEgAS'
    'gJUglwcm9kdWN0SWQSHgoIc3RvcmVfaWQYAiABKAlIAFIHc3RvcmVJZIgBARI5CgpzdGFydF9k'
    'YXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnREYXRlEjUKCGVuZF'
    '9kYXRlGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kRGF0ZRIbCglwYWdl'
    'X3NpemUYBSABKAVSCHBhZ2VTaXplEh8KC3BhZ2VfbnVtYmVyGAYgASgFUgpwYWdlTnVtYmVyQg'
    'sKCV9zdG9yZV9pZA==');

@$core.Deprecated('Use getProductTransactionHistoryResponseDescriptor instead')
const GetProductTransactionHistoryResponse$json = {
  '1': 'GetProductTransactionHistoryResponse',
  '2': [
    {
      '1': 'transactions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.audits.v1.InventoryTransaction',
      '10': 'transactions'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
  ],
};

/// Descriptor for `GetProductTransactionHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProductTransactionHistoryResponseDescriptor =
    $convert.base64Decode(
        'CiRHZXRQcm9kdWN0VHJhbnNhY3Rpb25IaXN0b3J5UmVzcG9uc2USQwoMdHJhbnNhY3Rpb25zGA'
        'EgAygLMh8uYXVkaXRzLnYxLkludmVudG9yeVRyYW5zYWN0aW9uUgx0cmFuc2FjdGlvbnMSHwoL'
        'dG90YWxfY291bnQYAiABKAVSCnRvdGFsQ291bnQ=');

@$core.Deprecated('Use listProductsBySupplierRequestDescriptor instead')
const ListProductsBySupplierRequest$json = {
  '1': 'ListProductsBySupplierRequest',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '10': 'supplierId'},
    {
      '1': 'store_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'storeId',
      '17': true
    },
  ],
  '8': [
    {'1': '_store_id'},
  ],
};

/// Descriptor for `ListProductsBySupplierRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProductsBySupplierRequestDescriptor =
    $convert.base64Decode(
        'Ch1MaXN0UHJvZHVjdHNCeVN1cHBsaWVyUmVxdWVzdBIfCgtzdXBwbGllcl9pZBgBIAEoCVIKc3'
        'VwcGxpZXJJZBIeCghzdG9yZV9pZBgCIAEoCUgAUgdzdG9yZUlkiAEBQgsKCV9zdG9yZV9pZA==');

@$core.Deprecated('Use listProductsBySupplierResponseDescriptor instead')
const ListProductsBySupplierResponse$json = {
  '1': 'ListProductsBySupplierResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.inventory.v1.ProductBySupplier',
      '10': 'products'
    },
  ],
};

/// Descriptor for `ListProductsBySupplierResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listProductsBySupplierResponseDescriptor =
    $convert.base64Decode(
        'Ch5MaXN0UHJvZHVjdHNCeVN1cHBsaWVyUmVzcG9uc2USOwoIcHJvZHVjdHMYASADKAsyHy5pbn'
        'ZlbnRvcnkudjEuUHJvZHVjdEJ5U3VwcGxpZXJSCHByb2R1Y3Rz');

@$core.Deprecated('Use productBySupplierDescriptor instead')
const ProductBySupplier$json = {
  '1': 'ProductBySupplier',
  '2': [
    {
      '1': 'store_product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'storeProduct'
    },
    {
      '1': 'global_product',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.GlobalProduct',
      '10': 'globalProduct'
    },
  ],
};

/// Descriptor for `ProductBySupplier`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List productBySupplierDescriptor = $convert.base64Decode(
    'ChFQcm9kdWN0QnlTdXBwbGllchI/Cg1zdG9yZV9wcm9kdWN0GAEgASgLMhouaW52ZW50b3J5Ln'
    'YxLlN0b3JlUHJvZHVjdFIMc3RvcmVQcm9kdWN0EkIKDmdsb2JhbF9wcm9kdWN0GAIgASgLMhsu'
    'aW52ZW50b3J5LnYxLkdsb2JhbFByb2R1Y3RSDWdsb2JhbFByb2R1Y3Q=');

@$core.Deprecated('Use adjustInventoryRequestDescriptor instead')
const AdjustInventoryRequest$json = {
  '1': 'AdjustInventoryRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {'1': 'product_id', '3': 2, '4': 1, '5': 9, '8': {}, '10': 'productId'},
    {'1': 'new_quantity', '3': 3, '4': 1, '5': 5, '10': 'newQuantity'},
    {'1': 'reason', '3': 4, '4': 1, '5': 9, '10': 'reason'},
    {'1': 'notes', '3': 5, '4': 1, '5': 9, '10': 'notes'},
    {'1': 'batch_id', '3': 6, '4': 1, '5': 9, '10': 'batchId'},
  ],
};

/// Descriptor for `AdjustInventoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adjustInventoryRequestDescriptor = $convert.base64Decode(
    'ChZBZGp1c3RJbnZlbnRvcnlSZXF1ZXN0EiEKCHN0b3JlX2lkGAEgASgJQga6SAPIAQFSB3N0b3'
    'JlSWQSJQoKcHJvZHVjdF9pZBgCIAEoCUIGukgDyAEBUglwcm9kdWN0SWQSIQoMbmV3X3F1YW50'
    'aXR5GAMgASgFUgtuZXdRdWFudGl0eRIWCgZyZWFzb24YBCABKAlSBnJlYXNvbhIUCgVub3Rlcx'
    'gFIAEoCVIFbm90ZXMSGQoIYmF0Y2hfaWQYBiABKAlSB2JhdGNoSWQ=');

@$core.Deprecated('Use adjustInventoryResponseDescriptor instead')
const AdjustInventoryResponse$json = {
  '1': 'AdjustInventoryResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {
      '1': 'updated_level',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.InventoryLevel',
      '10': 'updatedLevel'
    },
  ],
};

/// Descriptor for `AdjustInventoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List adjustInventoryResponseDescriptor = $convert.base64Decode(
    'ChdBZGp1c3RJbnZlbnRvcnlSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNzEkEKDX'
    'VwZGF0ZWRfbGV2ZWwYAiABKAsyHC5pbnZlbnRvcnkudjEuSW52ZW50b3J5TGV2ZWxSDHVwZGF0'
    'ZWRMZXZlbA==');

const $core.Map<$core.String, $core.dynamic> InventoryServiceBase$json = {
  '1': 'InventoryService',
  '2': [
    {
      '1': 'GetProductInventoryLevels',
      '2': '.inventory.v1.GetProductInventoryLevelsRequest',
      '3': '.inventory.v1.GetProductInventoryLevelsResponse'
    },
    {
      '1': 'CheckProductAvailability',
      '2': '.inventory.v1.CheckProductAvailabilityRequest',
      '3': '.inventory.v1.CheckProductAvailabilityResponse'
    },
    {
      '1': 'GetLowStockItems',
      '2': '.inventory.v1.GetLowStockItemsRequest',
      '3': '.inventory.v1.GetLowStockItemsResponse'
    },
    {
      '1': 'GetResourceInventory',
      '2': '.inventory.v1.GetResourceInventoryRequest',
      '3': '.inventory.v1.GetResourceInventoryResponse'
    },
    {
      '1': 'GetRecentInventoryTransactions',
      '2': '.inventory.v1.GetInventoryTransactionHistoryRequest',
      '3': '.inventory.v1.GetInventoryTransactionHistoryResponse'
    },
    {
      '1': 'GetProductTransactionHistory',
      '2': '.inventory.v1.GetProductTransactionHistoryRequest',
      '3': '.inventory.v1.GetProductTransactionHistoryResponse'
    },
    {
      '1': 'ListProductsBySupplier',
      '2': '.inventory.v1.ListProductsBySupplierRequest',
      '3': '.inventory.v1.ListProductsBySupplierResponse'
    },
    {
      '1': 'AdjustInventory',
      '2': '.inventory.v1.AdjustInventoryRequest',
      '3': '.inventory.v1.AdjustInventoryResponse'
    },
  ],
};

@$core.Deprecated('Use inventoryServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    InventoryServiceBase$messageJson = {
  '.inventory.v1.GetProductInventoryLevelsRequest':
      GetProductInventoryLevelsRequest$json,
  '.inventory.v1.GetProductInventoryLevelsResponse':
      GetProductInventoryLevelsResponse$json,
  '.inventory.v1.InventoryLevel': InventoryLevel$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.inventory.v1.Batch': Batch$json,
  '.inventory.v1.CheckProductAvailabilityRequest':
      CheckProductAvailabilityRequest$json,
  '.inventory.v1.CheckProductAvailabilityResponse':
      CheckProductAvailabilityResponse$json,
  '.inventory.v1.GetLowStockItemsRequest': GetLowStockItemsRequest$json,
  '.inventory.v1.GetLowStockItemsResponse': GetLowStockItemsResponse$json,
  '.inventory.v1.GetResourceInventoryRequest': GetResourceInventoryRequest$json,
  '.inventory.v1.GetResourceInventoryResponse':
      GetResourceInventoryResponse$json,
  '.inventory.v1.GetInventoryTransactionHistoryRequest':
      GetInventoryTransactionHistoryRequest$json,
  '.inventory.v1.GetInventoryTransactionHistoryResponse':
      GetInventoryTransactionHistoryResponse$json,
  '.audits.v1.InventoryTransaction': $2.InventoryTransaction$json,
  '.inventory.v1.GetProductTransactionHistoryRequest':
      GetProductTransactionHistoryRequest$json,
  '.inventory.v1.GetProductTransactionHistoryResponse':
      GetProductTransactionHistoryResponse$json,
  '.inventory.v1.ListProductsBySupplierRequest':
      ListProductsBySupplierRequest$json,
  '.inventory.v1.ListProductsBySupplierResponse':
      ListProductsBySupplierResponse$json,
  '.inventory.v1.ProductBySupplier': ProductBySupplier$json,
  '.inventory.v1.StoreProduct': $1.StoreProduct$json,
  '.inventory.v1.GlobalProduct': $1.GlobalProduct$json,
  '.inventory.v1.Internationalized': $3.Internationalized$json,
  '.inventory.v1.Category': $3.Category$json,
  '.inventory.v1.AdjustInventoryRequest': AdjustInventoryRequest$json,
  '.inventory.v1.AdjustInventoryResponse': AdjustInventoryResponse$json,
};

/// Descriptor for `InventoryService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List inventoryServiceDescriptor = $convert.base64Decode(
    'ChBJbnZlbnRvcnlTZXJ2aWNlEnwKGUdldFByb2R1Y3RJbnZlbnRvcnlMZXZlbHMSLi5pbnZlbn'
    'RvcnkudjEuR2V0UHJvZHVjdEludmVudG9yeUxldmVsc1JlcXVlc3QaLy5pbnZlbnRvcnkudjEu'
    'R2V0UHJvZHVjdEludmVudG9yeUxldmVsc1Jlc3BvbnNlEnkKGENoZWNrUHJvZHVjdEF2YWlsYW'
    'JpbGl0eRItLmludmVudG9yeS52MS5DaGVja1Byb2R1Y3RBdmFpbGFiaWxpdHlSZXF1ZXN0Gi4u'
    'aW52ZW50b3J5LnYxLkNoZWNrUHJvZHVjdEF2YWlsYWJpbGl0eVJlc3BvbnNlEmEKEEdldExvd1'
    'N0b2NrSXRlbXMSJS5pbnZlbnRvcnkudjEuR2V0TG93U3RvY2tJdGVtc1JlcXVlc3QaJi5pbnZl'
    'bnRvcnkudjEuR2V0TG93U3RvY2tJdGVtc1Jlc3BvbnNlEm0KFEdldFJlc291cmNlSW52ZW50b3'
    'J5EikuaW52ZW50b3J5LnYxLkdldFJlc291cmNlSW52ZW50b3J5UmVxdWVzdBoqLmludmVudG9y'
    'eS52MS5HZXRSZXNvdXJjZUludmVudG9yeVJlc3BvbnNlEosBCh5HZXRSZWNlbnRJbnZlbnRvcn'
    'lUcmFuc2FjdGlvbnMSMy5pbnZlbnRvcnkudjEuR2V0SW52ZW50b3J5VHJhbnNhY3Rpb25IaXN0'
    'b3J5UmVxdWVzdBo0LmludmVudG9yeS52MS5HZXRJbnZlbnRvcnlUcmFuc2FjdGlvbkhpc3Rvcn'
    'lSZXNwb25zZRKFAQocR2V0UHJvZHVjdFRyYW5zYWN0aW9uSGlzdG9yeRIxLmludmVudG9yeS52'
    'MS5HZXRQcm9kdWN0VHJhbnNhY3Rpb25IaXN0b3J5UmVxdWVzdBoyLmludmVudG9yeS52MS5HZX'
    'RQcm9kdWN0VHJhbnNhY3Rpb25IaXN0b3J5UmVzcG9uc2UScwoWTGlzdFByb2R1Y3RzQnlTdXBw'
    'bGllchIrLmludmVudG9yeS52MS5MaXN0UHJvZHVjdHNCeVN1cHBsaWVyUmVxdWVzdBosLmludm'
    'VudG9yeS52MS5MaXN0UHJvZHVjdHNCeVN1cHBsaWVyUmVzcG9uc2USXgoPQWRqdXN0SW52ZW50'
    'b3J5EiQuaW52ZW50b3J5LnYxLkFkanVzdEludmVudG9yeVJlcXVlc3QaJS5pbnZlbnRvcnkudj'
    'EuQWRqdXN0SW52ZW50b3J5UmVzcG9uc2U=');
