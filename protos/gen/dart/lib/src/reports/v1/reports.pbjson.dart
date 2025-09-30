// This is a generated file - do not edit.
//
// Generated from reports/v1/reports.proto.

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
import '../../financial/v1/financial_utils.pbjson.dart' as $6;
import '../../financial/v1/invoice.pbjson.dart' as $4;
import '../../google/protobuf/timestamp.pbjson.dart' as $0;
import '../../inventory/v1/category.pbjson.dart' as $7;
import '../../inventory/v1/store_product.pbjson.dart' as $1;
import '../../store/v1/store.pbjson.dart' as $3;
import '../../store/v1/supplier.pbjson.dart' as $5;

@$core.Deprecated('Use stockMovementCategoryDescriptor instead')
const StockMovementCategory$json = {
  '1': 'StockMovementCategory',
  '2': [
    {'1': 'STOCK_MOVEMENT_CATEGORY_UNSPECIFIED', '2': 0},
    {'1': 'STOCK_MOVEMENT_CATEGORY_FAST', '2': 1},
    {'1': 'STOCK_MOVEMENT_CATEGORY_MEDIUM', '2': 2},
    {'1': 'STOCK_MOVEMENT_CATEGORY_SLOW', '2': 3},
    {'1': 'STOCK_MOVEMENT_CATEGORY_VERY_SLOW', '2': 4},
  ],
};

/// Descriptor for `StockMovementCategory`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List stockMovementCategoryDescriptor = $convert.base64Decode(
    'ChVTdG9ja01vdmVtZW50Q2F0ZWdvcnkSJwojU1RPQ0tfTU9WRU1FTlRfQ0FURUdPUllfVU5TUE'
    'VDSUZJRUQQABIgChxTVE9DS19NT1ZFTUVOVF9DQVRFR09SWV9GQVNUEAESIgoeU1RPQ0tfTU9W'
    'RU1FTlRfQ0FURUdPUllfTUVESVVNEAISIAocU1RPQ0tfTU9WRU1FTlRfQ0FURUdPUllfU0xPVx'
    'ADEiUKIVNUT0NLX01PVkVNRU5UX0NBVEVHT1JZX1ZFUllfU0xPVxAE');

@$core.Deprecated('Use reportGroupByDescriptor instead')
const ReportGroupBy$json = {
  '1': 'ReportGroupBy',
  '2': [
    {'1': 'REPORT_GROUP_BY_UNSPECIFIED', '2': 0},
    {'1': 'REPORT_GROUP_BY_DAILY', '2': 1},
    {'1': 'REPORT_GROUP_BY_WEEKLY', '2': 2},
    {'1': 'REPORT_GROUP_BY_MONTHLY', '2': 3},
    {'1': 'REPORT_GROUP_BY_QUARTERLY', '2': 4},
    {'1': 'REPORT_GROUP_BY_YEARLY', '2': 5},
  ],
};

/// Descriptor for `ReportGroupBy`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List reportGroupByDescriptor = $convert.base64Decode(
    'Cg1SZXBvcnRHcm91cEJ5Eh8KG1JFUE9SVF9HUk9VUF9CWV9VTlNQRUNJRklFRBAAEhkKFVJFUE'
    '9SVF9HUk9VUF9CWV9EQUlMWRABEhoKFlJFUE9SVF9HUk9VUF9CWV9XRUVLTFkQAhIbChdSRVBP'
    'UlRfR1JPVVBfQllfTU9OVEhMWRADEh0KGVJFUE9SVF9HUk9VUF9CWV9RVUFSVEVSTFkQBBIaCh'
    'ZSRVBPUlRfR1JPVVBfQllfWUVBUkxZEAU=');

@$core.Deprecated('Use getSalesReportRequestDescriptor instead')
const GetSalesReportRequest$json = {
  '1': 'GetSalesReportRequest',
  '2': [
    {
      '1': 'start_date',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
    {
      '1': 'supplier_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'supplierId',
      '17': true
    },
    {
      '1': 'store_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'storeId',
      '17': true
    },
    {'1': 'category', '3': 5, '4': 1, '5': 9, '10': 'category'},
    {
      '1': 'group_by',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.reports.v1.ReportGroupBy',
      '10': 'groupBy'
    },
  ],
  '8': [
    {'1': '_supplier_id'},
    {'1': '_store_id'},
  ],
};

/// Descriptor for `GetSalesReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSalesReportRequestDescriptor = $convert.base64Decode(
    'ChVHZXRTYWxlc1JlcG9ydFJlcXVlc3QSOQoKc3RhcnRfZGF0ZRgBIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCXN0YXJ0RGF0ZRI1CghlbmRfZGF0ZRgCIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSB2VuZERhdGUSJAoLc3VwcGxpZXJfaWQYAyABKAlIAFIKc3VwcG'
    'xpZXJJZIgBARIeCghzdG9yZV9pZBgEIAEoCUgBUgdzdG9yZUlkiAEBEhoKCGNhdGVnb3J5GAUg'
    'ASgJUghjYXRlZ29yeRI0Cghncm91cF9ieRgGIAEoDjIZLnJlcG9ydHMudjEuUmVwb3J0R3JvdX'
    'BCeVIHZ3JvdXBCeUIOCgxfc3VwcGxpZXJfaWRCCwoJX3N0b3JlX2lk');

@$core.Deprecated('Use getSalesReportResponseDescriptor instead')
const GetSalesReportResponse$json = {
  '1': 'GetSalesReportResponse',
  '2': [
    {
      '1': 'summaries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.SalesSummary',
      '10': 'summaries'
    },
    {
      '1': 'total_sales_amount',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'totalSalesAmount'
    },
    {
      '1': 'total_transactions',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'totalTransactions'
    },
    {'1': 'total_units_sold', '3': 4, '4': 1, '5': 5, '10': 'totalUnitsSold'},
    {
      '1': 'average_transaction_value',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'averageTransactionValue'
    },
  ],
};

/// Descriptor for `GetSalesReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSalesReportResponseDescriptor = $convert.base64Decode(
    'ChZHZXRTYWxlc1JlcG9ydFJlc3BvbnNlEjYKCXN1bW1hcmllcxgBIAMoCzIYLnJlcG9ydHMudj'
    'EuU2FsZXNTdW1tYXJ5UglzdW1tYXJpZXMSLAoSdG90YWxfc2FsZXNfYW1vdW50GAIgASgDUhB0'
    'b3RhbFNhbGVzQW1vdW50Ei0KEnRvdGFsX3RyYW5zYWN0aW9ucxgDIAEoBVIRdG90YWxUcmFuc2'
    'FjdGlvbnMSKAoQdG90YWxfdW5pdHNfc29sZBgEIAEoBVIOdG90YWxVbml0c1NvbGQSOgoZYXZl'
    'cmFnZV90cmFuc2FjdGlvbl92YWx1ZRgFIAEoA1IXYXZlcmFnZVRyYW5zYWN0aW9uVmFsdWU=');

@$core.Deprecated('Use salesSummaryDescriptor instead')
const SalesSummary$json = {
  '1': 'SalesSummary',
  '2': [
    {
      '1': 'period_start',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'periodStart'
    },
    {
      '1': 'period_end',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'periodEnd'
    },
    {'1': 'sales_amount', '3': 3, '4': 1, '5': 3, '10': 'salesAmount'},
    {
      '1': 'transaction_count',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'transactionCount'
    },
    {'1': 'units_sold', '3': 5, '4': 1, '5': 5, '10': 'unitsSold'},
  ],
};

/// Descriptor for `SalesSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salesSummaryDescriptor = $convert.base64Decode(
    'CgxTYWxlc1N1bW1hcnkSPQoMcGVyaW9kX3N0YXJ0GAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcFILcGVyaW9kU3RhcnQSOQoKcGVyaW9kX2VuZBgCIAEoCzIaLmdvb2dsZS5wcm90'
    'b2J1Zi5UaW1lc3RhbXBSCXBlcmlvZEVuZBIhCgxzYWxlc19hbW91bnQYAyABKANSC3NhbGVzQW'
    '1vdW50EisKEXRyYW5zYWN0aW9uX2NvdW50GAQgASgFUhB0cmFuc2FjdGlvbkNvdW50Eh0KCnVu'
    'aXRzX3NvbGQYBSABKAVSCXVuaXRzU29sZA==');

@$core.Deprecated('Use getPurchaseReportRequestDescriptor instead')
const GetPurchaseReportRequest$json = {
  '1': 'GetPurchaseReportRequest',
  '2': [
    {
      '1': 'start_date',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'supplier_id', '3': 4, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'category', '3': 5, '4': 1, '5': 9, '10': 'category'},
    {
      '1': 'group_by',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.reports.v1.ReportGroupBy',
      '10': 'groupBy'
    },
  ],
};

/// Descriptor for `GetPurchaseReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPurchaseReportRequestDescriptor = $convert.base64Decode(
    'ChhHZXRQdXJjaGFzZVJlcG9ydFJlcXVlc3QSOQoKc3RhcnRfZGF0ZRgBIAEoCzIaLmdvb2dsZS'
    '5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0YXJ0RGF0ZRI1CghlbmRfZGF0ZRgCIAEoCzIaLmdvb2ds'
    'ZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2VuZERhdGUSGQoIc3RvcmVfaWQYAyABKAlSB3N0b3JlSW'
    'QSHwoLc3VwcGxpZXJfaWQYBCABKAlSCnN1cHBsaWVySWQSGgoIY2F0ZWdvcnkYBSABKAlSCGNh'
    'dGVnb3J5EjQKCGdyb3VwX2J5GAYgASgOMhkucmVwb3J0cy52MS5SZXBvcnRHcm91cEJ5Ugdncm'
    '91cEJ5');

@$core.Deprecated('Use getPurchaseReportResponseDescriptor instead')
const GetPurchaseReportResponse$json = {
  '1': 'GetPurchaseReportResponse',
  '2': [
    {
      '1': 'summaries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.PurchaseSummary',
      '10': 'summaries'
    },
    {
      '1': 'total_purchase_amount',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'totalPurchaseAmount'
    },
    {
      '1': 'total_purchase_orders',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'totalPurchaseOrders'
    },
    {
      '1': 'total_units_purchased',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'totalUnitsPurchased'
    },
  ],
};

/// Descriptor for `GetPurchaseReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPurchaseReportResponseDescriptor = $convert.base64Decode(
    'ChlHZXRQdXJjaGFzZVJlcG9ydFJlc3BvbnNlEjkKCXN1bW1hcmllcxgBIAMoCzIbLnJlcG9ydH'
    'MudjEuUHVyY2hhc2VTdW1tYXJ5UglzdW1tYXJpZXMSMgoVdG90YWxfcHVyY2hhc2VfYW1vdW50'
    'GAIgASgDUhN0b3RhbFB1cmNoYXNlQW1vdW50EjIKFXRvdGFsX3B1cmNoYXNlX29yZGVycxgDIA'
    'EoBVITdG90YWxQdXJjaGFzZU9yZGVycxIyChV0b3RhbF91bml0c19wdXJjaGFzZWQYBCABKAVS'
    'E3RvdGFsVW5pdHNQdXJjaGFzZWQ=');

@$core.Deprecated('Use purchaseSummaryDescriptor instead')
const PurchaseSummary$json = {
  '1': 'PurchaseSummary',
  '2': [
    {
      '1': 'period_start',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'periodStart'
    },
    {
      '1': 'period_end',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'periodEnd'
    },
    {'1': 'purchase_amount', '3': 3, '4': 1, '5': 3, '10': 'purchaseAmount'},
    {
      '1': 'purchase_order_count',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'purchaseOrderCount'
    },
    {'1': 'units_purchased', '3': 5, '4': 1, '5': 5, '10': 'unitsPurchased'},
  ],
};

/// Descriptor for `PurchaseSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchaseSummaryDescriptor = $convert.base64Decode(
    'Cg9QdXJjaGFzZVN1bW1hcnkSPQoMcGVyaW9kX3N0YXJ0GAEgASgLMhouZ29vZ2xlLnByb3RvYn'
    'VmLlRpbWVzdGFtcFILcGVyaW9kU3RhcnQSOQoKcGVyaW9kX2VuZBgCIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSCXBlcmlvZEVuZBInCg9wdXJjaGFzZV9hbW91bnQYAyABKANSDn'
    'B1cmNoYXNlQW1vdW50EjAKFHB1cmNoYXNlX29yZGVyX2NvdW50GAQgASgFUhJwdXJjaGFzZU9y'
    'ZGVyQ291bnQSJwoPdW5pdHNfcHVyY2hhc2VkGAUgASgFUg51bml0c1B1cmNoYXNlZA==');

@$core.Deprecated('Use getInventoryMovementReportRequestDescriptor instead')
const GetInventoryMovementReportRequest$json = {
  '1': 'GetInventoryMovementReportRequest',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {
      '1': 'start_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
    {'1': 'store_id', '3': 4, '4': 1, '5': 9, '10': 'storeId'},
  ],
};

/// Descriptor for `GetInventoryMovementReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryMovementReportRequestDescriptor =
    $convert.base64Decode(
        'CiFHZXRJbnZlbnRvcnlNb3ZlbWVudFJlcG9ydFJlcXVlc3QSHQoKcHJvZHVjdF9pZBgBIAEoCV'
        'IJcHJvZHVjdElkEjkKCnN0YXJ0X2RhdGUYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0'
        'YW1wUglzdGFydERhdGUSNQoIZW5kX2RhdGUYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZX'
        'N0YW1wUgdlbmREYXRlEhkKCHN0b3JlX2lkGAQgASgJUgdzdG9yZUlk');

@$core.Deprecated('Use getInventoryMovementReportResponseDescriptor instead')
const GetInventoryMovementReportResponse$json = {
  '1': 'GetInventoryMovementReportResponse',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'product'
    },
    {'1': 'opening_balance', '3': 2, '4': 1, '5': 1, '10': 'openingBalance'},
    {'1': 'total_in', '3': 3, '4': 1, '5': 1, '10': 'totalIn'},
    {'1': 'total_out', '3': 4, '4': 1, '5': 1, '10': 'totalOut'},
    {'1': 'closing_balance', '3': 5, '4': 1, '5': 1, '10': 'closingBalance'},
    {
      '1': 'transactions',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.audits.v1.InventoryTransaction',
      '10': 'transactions'
    },
  ],
};

/// Descriptor for `GetInventoryMovementReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryMovementReportResponseDescriptor = $convert.base64Decode(
    'CiJHZXRJbnZlbnRvcnlNb3ZlbWVudFJlcG9ydFJlc3BvbnNlEjQKB3Byb2R1Y3QYASABKAsyGi'
    '5pbnZlbnRvcnkudjEuU3RvcmVQcm9kdWN0Ugdwcm9kdWN0EicKD29wZW5pbmdfYmFsYW5jZRgC'
    'IAEoAVIOb3BlbmluZ0JhbGFuY2USGQoIdG90YWxfaW4YAyABKAFSB3RvdGFsSW4SGwoJdG90YW'
    'xfb3V0GAQgASgBUgh0b3RhbE91dBInCg9jbG9zaW5nX2JhbGFuY2UYBSABKAFSDmNsb3NpbmdC'
    'YWxhbmNlEkMKDHRyYW5zYWN0aW9ucxgGIAMoCzIfLmF1ZGl0cy52MS5JbnZlbnRvcnlUcmFuc2'
    'FjdGlvblIMdHJhbnNhY3Rpb25z');

@$core.Deprecated('Use getBestSellingProductsRequestDescriptor instead')
const GetBestSellingProductsRequest$json = {
  '1': 'GetBestSellingProductsRequest',
  '2': [
    {
      '1': 'start_date',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
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
      '1': 'category',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'category',
      '17': true
    },
    {'1': 'top_n', '3': 5, '4': 1, '5': 5, '10': 'topN'},
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_category'},
  ],
};

/// Descriptor for `GetBestSellingProductsRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBestSellingProductsRequestDescriptor = $convert.base64Decode(
    'Ch1HZXRCZXN0U2VsbGluZ1Byb2R1Y3RzUmVxdWVzdBI5CgpzdGFydF9kYXRlGAEgASgLMhouZ2'
    '9vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnREYXRlEjUKCGVuZF9kYXRlGAIgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kRGF0ZRIeCghzdG9yZV9pZBgDIAEoCUgAUg'
    'dzdG9yZUlkiAEBEh8KCGNhdGVnb3J5GAQgASgJSAFSCGNhdGVnb3J5iAEBEhMKBXRvcF9uGAUg'
    'ASgFUgR0b3BOQgsKCV9zdG9yZV9pZEILCglfY2F0ZWdvcnk=');

@$core.Deprecated('Use getBestSellingProductsResponseDescriptor instead')
const GetBestSellingProductsResponse$json = {
  '1': 'GetBestSellingProductsResponse',
  '2': [
    {
      '1': 'products',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.BestSellingProduct',
      '10': 'products'
    },
  ],
};

/// Descriptor for `GetBestSellingProductsResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getBestSellingProductsResponseDescriptor =
    $convert.base64Decode(
        'Ch5HZXRCZXN0U2VsbGluZ1Byb2R1Y3RzUmVzcG9uc2USOgoIcHJvZHVjdHMYASADKAsyHi5yZX'
        'BvcnRzLnYxLkJlc3RTZWxsaW5nUHJvZHVjdFIIcHJvZHVjdHM=');

@$core.Deprecated('Use bestSellingProductDescriptor instead')
const BestSellingProduct$json = {
  '1': 'BestSellingProduct',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'product'
    },
    {'1': 'units_sold', '3': 2, '4': 1, '5': 5, '10': 'unitsSold'},
    {'1': 'total_revenue', '3': 3, '4': 1, '5': 3, '10': 'totalRevenue'},
    {
      '1': 'transaction_count',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'transactionCount'
    },
    {'1': 'productName', '3': 5, '4': 1, '5': 9, '10': 'productName'},
    {'1': 'rank', '3': 6, '4': 1, '5': 5, '10': 'rank'},
  ],
};

/// Descriptor for `BestSellingProduct`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List bestSellingProductDescriptor = $convert.base64Decode(
    'ChJCZXN0U2VsbGluZ1Byb2R1Y3QSNAoHcHJvZHVjdBgBIAEoCzIaLmludmVudG9yeS52MS5TdG'
    '9yZVByb2R1Y3RSB3Byb2R1Y3QSHQoKdW5pdHNfc29sZBgCIAEoBVIJdW5pdHNTb2xkEiMKDXRv'
    'dGFsX3JldmVudWUYAyABKANSDHRvdGFsUmV2ZW51ZRIrChF0cmFuc2FjdGlvbl9jb3VudBgEIA'
    'EoBVIQdHJhbnNhY3Rpb25Db3VudBIgCgtwcm9kdWN0TmFtZRgFIAEoCVILcHJvZHVjdE5hbWUS'
    'EgoEcmFuaxgGIAEoBVIEcmFuaw==');

@$core.Deprecated('Use getStorePurchaseHistoryRequestDescriptor instead')
const GetStorePurchaseHistoryRequest$json = {
  '1': 'GetStorePurchaseHistoryRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'start_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
  ],
};

/// Descriptor for `GetStorePurchaseHistoryRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStorePurchaseHistoryRequestDescriptor =
    $convert.base64Decode(
        'Ch5HZXRTdG9yZVB1cmNoYXNlSGlzdG9yeVJlcXVlc3QSGQoIc3RvcmVfaWQYASABKAlSB3N0b3'
        'JlSWQSOQoKc3RhcnRfZGF0ZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0'
        'YXJ0RGF0ZRI1CghlbmRfZGF0ZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2'
        'VuZERhdGU=');

@$core.Deprecated('Use getStorePurchaseHistoryResponseDescriptor instead')
const GetStorePurchaseHistoryResponse$json = {
  '1': 'GetStorePurchaseHistoryResponse',
  '2': [
    {
      '1': 'store',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Store',
      '10': 'store'
    },
    {
      '1': 'invoices',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.financial.v1.Invoice',
      '10': 'invoices'
    },
    {'1': 'total_purchases', '3': 3, '4': 1, '5': 3, '10': 'totalPurchases'},
    {'1': 'total_paid', '3': 4, '4': 1, '5': 3, '10': 'totalPaid'},
    {
      '1': 'outstanding_balance',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'outstandingBalance'
    },
    {
      '1': 'transaction_count',
      '3': 6,
      '4': 1,
      '5': 5,
      '10': 'transactionCount'
    },
    {
      '1': 'last_purchase_date',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastPurchaseDate'
    },
  ],
};

/// Descriptor for `GetStorePurchaseHistoryResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStorePurchaseHistoryResponseDescriptor = $convert.base64Decode(
    'Ch9HZXRTdG9yZVB1cmNoYXNlSGlzdG9yeVJlc3BvbnNlEiUKBXN0b3JlGAEgASgLMg8uc3Rvcm'
    'UudjEuU3RvcmVSBXN0b3JlEjEKCGludm9pY2VzGAIgAygLMhUuZmluYW5jaWFsLnYxLkludm9p'
    'Y2VSCGludm9pY2VzEicKD3RvdGFsX3B1cmNoYXNlcxgDIAEoA1IOdG90YWxQdXJjaGFzZXMSHQ'
    'oKdG90YWxfcGFpZBgEIAEoA1IJdG90YWxQYWlkEi8KE291dHN0YW5kaW5nX2JhbGFuY2UYBSAB'
    'KANSEm91dHN0YW5kaW5nQmFsYW5jZRIrChF0cmFuc2FjdGlvbl9jb3VudBgGIAEoBVIQdHJhbn'
    'NhY3Rpb25Db3VudBJIChJsYXN0X3B1cmNoYXNlX2RhdGUYByABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUhBsYXN0UHVyY2hhc2VEYXRl');

@$core.Deprecated('Use getSupplierPerformanceReportRequestDescriptor instead')
const GetSupplierPerformanceReportRequest$json = {
  '1': 'GetSupplierPerformanceReportRequest',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '10': 'supplierId'},
    {
      '1': 'start_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
  ],
};

/// Descriptor for `GetSupplierPerformanceReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSupplierPerformanceReportRequestDescriptor =
    $convert.base64Decode(
        'CiNHZXRTdXBwbGllclBlcmZvcm1hbmNlUmVwb3J0UmVxdWVzdBIfCgtzdXBwbGllcl9pZBgBIA'
        'EoCVIKc3VwcGxpZXJJZBI5CgpzdGFydF9kYXRlGAIgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRp'
        'bWVzdGFtcFIJc3RhcnREYXRlEjUKCGVuZF9kYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
        'RpbWVzdGFtcFIHZW5kRGF0ZQ==');

@$core.Deprecated('Use getSupplierPerformanceReportResponseDescriptor instead')
const GetSupplierPerformanceReportResponse$json = {
  '1': 'GetSupplierPerformanceReportResponse',
  '2': [
    {
      '1': 'supplier',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.store.v1.Supplier',
      '10': 'supplier'
    },
    {
      '1': 'total_purchase_orders',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'totalPurchaseOrders'
    },
    {
      '1': 'total_purchase_value',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'totalPurchaseValue'
    },
    {
      '1': 'on_time_deliveries',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'onTimeDeliveries'
    },
    {'1': 'late_deliveries', '3': 5, '4': 1, '5': 5, '10': 'lateDeliveries'},
    {
      '1': 'on_time_percentage',
      '3': 6,
      '4': 1,
      '5': 1,
      '10': 'onTimePercentage'
    },
    {'1': 'quality_issues', '3': 7, '4': 1, '5': 5, '10': 'qualityIssues'},
    {
      '1': 'average_delivery_time_days',
      '3': 8,
      '4': 1,
      '5': 1,
      '10': 'averageDeliveryTimeDays'
    },
  ],
};

/// Descriptor for `GetSupplierPerformanceReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSupplierPerformanceReportResponseDescriptor = $convert.base64Decode(
    'CiRHZXRTdXBwbGllclBlcmZvcm1hbmNlUmVwb3J0UmVzcG9uc2USLgoIc3VwcGxpZXIYASABKA'
    'syEi5zdG9yZS52MS5TdXBwbGllclIIc3VwcGxpZXISMgoVdG90YWxfcHVyY2hhc2Vfb3JkZXJz'
    'GAIgASgFUhN0b3RhbFB1cmNoYXNlT3JkZXJzEjAKFHRvdGFsX3B1cmNoYXNlX3ZhbHVlGAMgAS'
    'gDUhJ0b3RhbFB1cmNoYXNlVmFsdWUSLAoSb25fdGltZV9kZWxpdmVyaWVzGAQgASgFUhBvblRp'
    'bWVEZWxpdmVyaWVzEicKD2xhdGVfZGVsaXZlcmllcxgFIAEoBVIObGF0ZURlbGl2ZXJpZXMSLA'
    'oSb25fdGltZV9wZXJjZW50YWdlGAYgASgBUhBvblRpbWVQZXJjZW50YWdlEiUKDnF1YWxpdHlf'
    'aXNzdWVzGAcgASgFUg1xdWFsaXR5SXNzdWVzEjsKGmF2ZXJhZ2VfZGVsaXZlcnlfdGltZV9kYX'
    'lzGAggASgBUhdhdmVyYWdlRGVsaXZlcnlUaW1lRGF5cw==');

@$core.Deprecated('Use getProfitLossReportRequestDescriptor instead')
const GetProfitLossReportRequest$json = {
  '1': 'GetProfitLossReportRequest',
  '2': [
    {
      '1': 'start_date',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
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
  ],
  '8': [
    {'1': '_store_id'},
  ],
};

/// Descriptor for `GetProfitLossReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfitLossReportRequestDescriptor = $convert.base64Decode(
    'ChpHZXRQcm9maXRMb3NzUmVwb3J0UmVxdWVzdBI5CgpzdGFydF9kYXRlGAEgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnREYXRlEjUKCGVuZF9kYXRlGAIgASgLMhouZ29v'
    'Z2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kRGF0ZRIeCghzdG9yZV9pZBgDIAEoCUgAUgdzdG'
    '9yZUlkiAEBQgsKCV9zdG9yZV9pZA==');

@$core.Deprecated('Use getProfitLossReportResponseDescriptor instead')
const GetProfitLossReportResponse$json = {
  '1': 'GetProfitLossReportResponse',
  '2': [
    {'1': 'total_revenue', '3': 1, '4': 1, '5': 3, '10': 'totalRevenue'},
    {
      '1': 'cost_of_goods_sold',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'costOfGoodsSold'
    },
    {'1': 'gross_profit', '3': 3, '4': 1, '5': 3, '10': 'grossProfit'},
    {
      '1': 'gross_profit_margin',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'grossProfitMargin'
    },
    {'1': 'returns_value', '3': 5, '4': 1, '5': 3, '10': 'returnsValue'},
    {
      '1': 'adjustments_value',
      '3': 6,
      '4': 1,
      '5': 3,
      '10': 'adjustmentsValue'
    },
    {'1': 'net_profit', '3': 7, '4': 1, '5': 3, '10': 'netProfit'},
  ],
};

/// Descriptor for `GetProfitLossReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getProfitLossReportResponseDescriptor = $convert.base64Decode(
    'ChtHZXRQcm9maXRMb3NzUmVwb3J0UmVzcG9uc2USIwoNdG90YWxfcmV2ZW51ZRgBIAEoA1IMdG'
    '90YWxSZXZlbnVlEisKEmNvc3Rfb2ZfZ29vZHNfc29sZBgCIAEoA1IPY29zdE9mR29vZHNTb2xk'
    'EiEKDGdyb3NzX3Byb2ZpdBgDIAEoA1ILZ3Jvc3NQcm9maXQSLgoTZ3Jvc3NfcHJvZml0X21hcm'
    'dpbhgEIAEoAVIRZ3Jvc3NQcm9maXRNYXJnaW4SIwoNcmV0dXJuc192YWx1ZRgFIAEoA1IMcmV0'
    'dXJuc1ZhbHVlEisKEWFkanVzdG1lbnRzX3ZhbHVlGAYgASgDUhBhZGp1c3RtZW50c1ZhbHVlEh'
    '0KCm5ldF9wcm9maXQYByABKANSCW5ldFByb2ZpdA==');

@$core.Deprecated('Use getStockAgingReportRequestDescriptor instead')
const GetStockAgingReportRequest$json = {
  '1': 'GetStockAgingReportRequest',
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
      '1': 'category',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'category',
      '17': true
    },
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_category'},
  ],
};

/// Descriptor for `GetStockAgingReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStockAgingReportRequestDescriptor =
    $convert.base64Decode(
        'ChpHZXRTdG9ja0FnaW5nUmVwb3J0UmVxdWVzdBIeCghzdG9yZV9pZBgBIAEoCUgAUgdzdG9yZU'
        'lkiAEBEh8KCGNhdGVnb3J5GAIgASgJSAFSCGNhdGVnb3J5iAEBQgsKCV9zdG9yZV9pZEILCglf'
        'Y2F0ZWdvcnk=');

@$core.Deprecated('Use getStockAgingReportResponseDescriptor instead')
const GetStockAgingReportResponse$json = {
  '1': 'GetStockAgingReportResponse',
  '2': [
    {
      '1': 'items',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.StockAgingItem',
      '10': 'items'
    },
    {'1': 'total_stock_value', '3': 2, '4': 1, '5': 3, '10': 'totalStockValue'},
    {
      '1': 'slow_moving_stock_value',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'slowMovingStockValue'
    },
  ],
};

/// Descriptor for `GetStockAgingReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getStockAgingReportResponseDescriptor = $convert.base64Decode(
    'ChtHZXRTdG9ja0FnaW5nUmVwb3J0UmVzcG9uc2USMAoFaXRlbXMYASADKAsyGi5yZXBvcnRzLn'
    'YxLlN0b2NrQWdpbmdJdGVtUgVpdGVtcxIqChF0b3RhbF9zdG9ja192YWx1ZRgCIAEoA1IPdG90'
    'YWxTdG9ja1ZhbHVlEjUKF3Nsb3dfbW92aW5nX3N0b2NrX3ZhbHVlGAMgASgDUhRzbG93TW92aW'
    '5nU3RvY2tWYWx1ZQ==');

@$core.Deprecated('Use stockAgingItemDescriptor instead')
const StockAgingItem$json = {
  '1': 'StockAgingItem',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'product'
    },
    {'1': 'quantity', '3': 2, '4': 1, '5': 1, '10': 'quantity'},
    {'1': 'stock_value', '3': 3, '4': 1, '5': 3, '10': 'stockValue'},
    {
      '1': 'last_movement_date',
      '3': 4,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'lastMovementDate'
    },
    {
      '1': 'days_since_last_movement',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'daysSinceLastMovement'
    },
    {
      '1': 'movement_category',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.reports.v1.StockMovementCategory',
      '10': 'movementCategory'
    },
  ],
};

/// Descriptor for `StockAgingItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockAgingItemDescriptor = $convert.base64Decode(
    'Cg5TdG9ja0FnaW5nSXRlbRI0Cgdwcm9kdWN0GAEgASgLMhouaW52ZW50b3J5LnYxLlN0b3JlUH'
    'JvZHVjdFIHcHJvZHVjdBIaCghxdWFudGl0eRgCIAEoAVIIcXVhbnRpdHkSHwoLc3RvY2tfdmFs'
    'dWUYAyABKANSCnN0b2NrVmFsdWUSSAoSbGFzdF9tb3ZlbWVudF9kYXRlGAQgASgLMhouZ29vZ2'
    'xlLnByb3RvYnVmLlRpbWVzdGFtcFIQbGFzdE1vdmVtZW50RGF0ZRI3ChhkYXlzX3NpbmNlX2xh'
    'c3RfbW92ZW1lbnQYBSABKAVSFWRheXNTaW5jZUxhc3RNb3ZlbWVudBJOChFtb3ZlbWVudF9jYX'
    'RlZ29yeRgGIAEoDjIhLnJlcG9ydHMudjEuU3RvY2tNb3ZlbWVudENhdGVnb3J5UhBtb3ZlbWVu'
    'dENhdGVnb3J5');

@$core.Deprecated('Use getInventoryReportRequestDescriptor instead')
const GetInventoryReportRequest$json = {
  '1': 'GetInventoryReportRequest',
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
      '1': 'start_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
    {
      '1': 'category',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'category',
      '17': true
    },
  ],
  '8': [
    {'1': '_store_id'},
    {'1': '_category'},
  ],
};

/// Descriptor for `GetInventoryReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryReportRequestDescriptor = $convert.base64Decode(
    'ChlHZXRJbnZlbnRvcnlSZXBvcnRSZXF1ZXN0Eh4KCHN0b3JlX2lkGAEgASgJSABSB3N0b3JlSW'
    'SIAQESOQoKc3RhcnRfZGF0ZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0'
    'YXJ0RGF0ZRI1CghlbmRfZGF0ZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2'
    'VuZERhdGUSHwoIY2F0ZWdvcnkYBCABKAlIAVIIY2F0ZWdvcnmIAQFCCwoJX3N0b3JlX2lkQgsK'
    'CV9jYXRlZ29yeQ==');

@$core.Deprecated('Use inventoryMovementSummaryDescriptor instead')
const InventoryMovementSummary$json = {
  '1': 'InventoryMovementSummary',
  '2': [
    {'1': 'total_in', '3': 1, '4': 1, '5': 1, '10': 'totalIn'},
    {'1': 'total_out', '3': 2, '4': 1, '5': 1, '10': 'totalOut'},
    {'1': 'net_change', '3': 3, '4': 1, '5': 1, '10': 'netChange'},
  ],
};

/// Descriptor for `InventoryMovementSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryMovementSummaryDescriptor = $convert.base64Decode(
    'ChhJbnZlbnRvcnlNb3ZlbWVudFN1bW1hcnkSGQoIdG90YWxfaW4YASABKAFSB3RvdGFsSW4SGw'
    'oJdG90YWxfb3V0GAIgASgBUgh0b3RhbE91dBIdCgpuZXRfY2hhbmdlGAMgASgBUgluZXRDaGFu'
    'Z2U=');

@$core.Deprecated('Use getInventoryReportResponseDescriptor instead')
const GetInventoryReportResponse$json = {
  '1': 'GetInventoryReportResponse',
  '2': [
    {'1': 'total_products', '3': 1, '4': 1, '5': 5, '10': 'totalProducts'},
    {'1': 'total_value', '3': 2, '4': 1, '5': 3, '10': 'totalValue'},
    {'1': 'low_stock_count', '3': 3, '4': 1, '5': 5, '10': 'lowStockCount'},
    {
      '1': 'aging_items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.StockAgingItem',
      '10': 'agingItems'
    },
    {
      '1': 'movement_summary',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.reports.v1.InventoryMovementSummary',
      '10': 'movementSummary'
    },
    {
      '1': 'best_sellers',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.BestSellingProduct',
      '10': 'bestSellers'
    },
    {
      '1': 'stock_movement_data',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.StockMovementDataPoint',
      '10': 'stockMovementData'
    },
    {
      '1': 'previous_year_comparison',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.reports.v1.InventoryComparisonData',
      '10': 'previousYearComparison'
    },
  ],
};

/// Descriptor for `GetInventoryReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getInventoryReportResponseDescriptor = $convert.base64Decode(
    'ChpHZXRJbnZlbnRvcnlSZXBvcnRSZXNwb25zZRIlCg50b3RhbF9wcm9kdWN0cxgBIAEoBVINdG'
    '90YWxQcm9kdWN0cxIfCgt0b3RhbF92YWx1ZRgCIAEoA1IKdG90YWxWYWx1ZRImCg9sb3dfc3Rv'
    'Y2tfY291bnQYAyABKAVSDWxvd1N0b2NrQ291bnQSOwoLYWdpbmdfaXRlbXMYBCADKAsyGi5yZX'
    'BvcnRzLnYxLlN0b2NrQWdpbmdJdGVtUgphZ2luZ0l0ZW1zEk8KEG1vdmVtZW50X3N1bW1hcnkY'
    'BSABKAsyJC5yZXBvcnRzLnYxLkludmVudG9yeU1vdmVtZW50U3VtbWFyeVIPbW92ZW1lbnRTdW'
    '1tYXJ5EkEKDGJlc3Rfc2VsbGVycxgGIAMoCzIeLnJlcG9ydHMudjEuQmVzdFNlbGxpbmdQcm9k'
    'dWN0UgtiZXN0U2VsbGVycxJSChNzdG9ja19tb3ZlbWVudF9kYXRhGAcgAygLMiIucmVwb3J0cy'
    '52MS5TdG9ja01vdmVtZW50RGF0YVBvaW50UhFzdG9ja01vdmVtZW50RGF0YRJdChhwcmV2aW91'
    'c195ZWFyX2NvbXBhcmlzb24YCCABKAsyIy5yZXBvcnRzLnYxLkludmVudG9yeUNvbXBhcmlzb2'
    '5EYXRhUhZwcmV2aW91c1llYXJDb21wYXJpc29u');

@$core.Deprecated('Use stockMovementDataPointDescriptor instead')
const StockMovementDataPoint$json = {
  '1': 'StockMovementDataPoint',
  '2': [
    {
      '1': 'date',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'date'
    },
    {'1': 'stock_level', '3': 2, '4': 1, '5': 1, '10': 'stockLevel'},
    {
      '1': 'movement_quantity',
      '3': 3,
      '4': 1,
      '5': 1,
      '10': 'movementQuantity'
    },
    {'1': 'movement_type', '3': 4, '4': 1, '5': 9, '10': 'movementType'},
  ],
};

/// Descriptor for `StockMovementDataPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockMovementDataPointDescriptor = $convert.base64Decode(
    'ChZTdG9ja01vdmVtZW50RGF0YVBvaW50Ei4KBGRhdGUYASABKAsyGi5nb29nbGUucHJvdG9idW'
    'YuVGltZXN0YW1wUgRkYXRlEh8KC3N0b2NrX2xldmVsGAIgASgBUgpzdG9ja0xldmVsEisKEW1v'
    'dmVtZW50X3F1YW50aXR5GAMgASgBUhBtb3ZlbWVudFF1YW50aXR5EiMKDW1vdmVtZW50X3R5cG'
    'UYBCABKAlSDG1vdmVtZW50VHlwZQ==');

@$core.Deprecated('Use getSalesReportFullResponseDescriptor instead')
const GetSalesReportFullResponse$json = {
  '1': 'GetSalesReportFullResponse',
  '2': [
    {
      '1': 'summaries',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.SalesSummary',
      '10': 'summaries'
    },
    {
      '1': 'total_sales_amount',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'totalSalesAmount'
    },
    {
      '1': 'total_transactions',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'totalTransactions'
    },
    {'1': 'total_units_sold', '3': 4, '4': 1, '5': 5, '10': 'totalUnitsSold'},
    {
      '1': 'average_transaction_value',
      '3': 5,
      '4': 1,
      '5': 3,
      '10': 'averageTransactionValue'
    },
    {
      '1': 'best_products',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.BestSellingProduct',
      '10': 'bestProducts'
    },
    {
      '1': 'category_sales_data',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.CategorySalesData',
      '10': 'categorySalesData'
    },
    {
      '1': 'previous_year_comparison',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.reports.v1.SalesComparisonData',
      '10': 'previousYearComparison'
    },
  ],
};

/// Descriptor for `GetSalesReportFullResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSalesReportFullResponseDescriptor = $convert.base64Decode(
    'ChpHZXRTYWxlc1JlcG9ydEZ1bGxSZXNwb25zZRI2CglzdW1tYXJpZXMYASADKAsyGC5yZXBvcn'
    'RzLnYxLlNhbGVzU3VtbWFyeVIJc3VtbWFyaWVzEiwKEnRvdGFsX3NhbGVzX2Ftb3VudBgCIAEo'
    'A1IQdG90YWxTYWxlc0Ftb3VudBItChJ0b3RhbF90cmFuc2FjdGlvbnMYAyABKAVSEXRvdGFsVH'
    'JhbnNhY3Rpb25zEigKEHRvdGFsX3VuaXRzX3NvbGQYBCABKAVSDnRvdGFsVW5pdHNTb2xkEjoK'
    'GWF2ZXJhZ2VfdHJhbnNhY3Rpb25fdmFsdWUYBSABKANSF2F2ZXJhZ2VUcmFuc2FjdGlvblZhbH'
    'VlEkMKDWJlc3RfcHJvZHVjdHMYBiADKAsyHi5yZXBvcnRzLnYxLkJlc3RTZWxsaW5nUHJvZHVj'
    'dFIMYmVzdFByb2R1Y3RzEk0KE2NhdGVnb3J5X3NhbGVzX2RhdGEYByADKAsyHS5yZXBvcnRzLn'
    'YxLkNhdGVnb3J5U2FsZXNEYXRhUhFjYXRlZ29yeVNhbGVzRGF0YRJZChhwcmV2aW91c195ZWFy'
    'X2NvbXBhcmlzb24YCCABKAsyHy5yZXBvcnRzLnYxLlNhbGVzQ29tcGFyaXNvbkRhdGFSFnByZX'
    'Zpb3VzWWVhckNvbXBhcmlzb24=');

@$core.Deprecated('Use categorySalesDataDescriptor instead')
const CategorySalesData$json = {
  '1': 'CategorySalesData',
  '2': [
    {'1': 'category_name', '3': 1, '4': 1, '5': 9, '10': 'categoryName'},
    {
      '1': 'total_sales_amount',
      '3': 2,
      '4': 1,
      '5': 1,
      '10': 'totalSalesAmount'
    },
    {'1': 'total_units_sold', '3': 3, '4': 1, '5': 5, '10': 'totalUnitsSold'},
    {
      '1': 'transaction_count',
      '3': 4,
      '4': 1,
      '5': 5,
      '10': 'transactionCount'
    },
    {
      '1': 'percentage_of_total',
      '3': 5,
      '4': 1,
      '5': 1,
      '10': 'percentageOfTotal'
    },
  ],
};

/// Descriptor for `CategorySalesData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List categorySalesDataDescriptor = $convert.base64Decode(
    'ChFDYXRlZ29yeVNhbGVzRGF0YRIjCg1jYXRlZ29yeV9uYW1lGAEgASgJUgxjYXRlZ29yeU5hbW'
    'USLAoSdG90YWxfc2FsZXNfYW1vdW50GAIgASgBUhB0b3RhbFNhbGVzQW1vdW50EigKEHRvdGFs'
    'X3VuaXRzX3NvbGQYAyABKAVSDnRvdGFsVW5pdHNTb2xkEisKEXRyYW5zYWN0aW9uX2NvdW50GA'
    'QgASgFUhB0cmFuc2FjdGlvbkNvdW50Ei4KE3BlcmNlbnRhZ2Vfb2ZfdG90YWwYBSABKAFSEXBl'
    'cmNlbnRhZ2VPZlRvdGFs');

@$core.Deprecated('Use salesComparisonDataDescriptor instead')
const SalesComparisonData$json = {
  '1': 'SalesComparisonData',
  '2': [
    {
      '1': 'previous_year_total_sales',
      '3': 1,
      '4': 1,
      '5': 3,
      '10': 'previousYearTotalSales'
    },
    {
      '1': 'previous_year_total_transactions',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'previousYearTotalTransactions'
    },
    {
      '1': 'previous_year_average_transaction_value',
      '3': 3,
      '4': 1,
      '5': 1,
      '10': 'previousYearAverageTransactionValue'
    },
  ],
};

/// Descriptor for `SalesComparisonData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salesComparisonDataDescriptor = $convert.base64Decode(
    'ChNTYWxlc0NvbXBhcmlzb25EYXRhEjkKGXByZXZpb3VzX3llYXJfdG90YWxfc2FsZXMYASABKA'
    'NSFnByZXZpb3VzWWVhclRvdGFsU2FsZXMSRwogcHJldmlvdXNfeWVhcl90b3RhbF90cmFuc2Fj'
    'dGlvbnMYAiABKAVSHXByZXZpb3VzWWVhclRvdGFsVHJhbnNhY3Rpb25zElQKJ3ByZXZpb3VzX3'
    'llYXJfYXZlcmFnZV90cmFuc2FjdGlvbl92YWx1ZRgDIAEoAVIjcHJldmlvdXNZZWFyQXZlcmFn'
    'ZVRyYW5zYWN0aW9uVmFsdWU=');

@$core.Deprecated('Use getFinancialReportRequestDescriptor instead')
const GetFinancialReportRequest$json = {
  '1': 'GetFinancialReportRequest',
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
      '1': 'start_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
  ],
  '8': [
    {'1': '_store_id'},
  ],
};

/// Descriptor for `GetFinancialReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFinancialReportRequestDescriptor = $convert.base64Decode(
    'ChlHZXRGaW5hbmNpYWxSZXBvcnRSZXF1ZXN0Eh4KCHN0b3JlX2lkGAEgASgJSABSB3N0b3JlSW'
    'SIAQESOQoKc3RhcnRfZGF0ZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0'
    'YXJ0RGF0ZRI1CghlbmRfZGF0ZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2'
    'VuZERhdGVCCwoJX3N0b3JlX2lk');

@$core.Deprecated('Use getFinancialReportResponseDescriptor instead')
const GetFinancialReportResponse$json = {
  '1': 'GetFinancialReportResponse',
  '2': [
    {'1': 'total_revenue', '3': 1, '4': 1, '5': 3, '10': 'totalRevenue'},
    {
      '1': 'cost_of_goods_sold',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'costOfGoodsSold'
    },
    {'1': 'gross_profit', '3': 3, '4': 1, '5': 3, '10': 'grossProfit'},
    {
      '1': 'gross_profit_margin',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'grossProfitMargin'
    },
    {'1': 'returns_value', '3': 5, '4': 1, '5': 3, '10': 'returnsValue'},
    {
      '1': 'adjustments_value',
      '3': 6,
      '4': 1,
      '5': 3,
      '10': 'adjustmentsValue'
    },
    {'1': 'net_profit', '3': 7, '4': 1, '5': 3, '10': 'netProfit'},
    {'1': 'total_purchases', '3': 8, '4': 1, '5': 3, '10': 'totalPurchases'},
    {
      '1': 'outstanding_balance',
      '3': 9,
      '4': 1,
      '5': 3,
      '10': 'outstandingBalance'
    },
    {
      '1': 'supplier_performances',
      '3': 10,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.SupplierPerformanceSummary',
      '10': 'supplierPerformances'
    },
    {
      '1': 'revenue_vs_expenses_data',
      '3': 11,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.RevenueExpenseDataPoint',
      '10': 'revenueVsExpensesData'
    },
    {
      '1': 'previous_year_comparison',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.reports.v1.FinancialComparisonData',
      '10': 'previousYearComparison'
    },
  ],
};

/// Descriptor for `GetFinancialReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getFinancialReportResponseDescriptor = $convert.base64Decode(
    'ChpHZXRGaW5hbmNpYWxSZXBvcnRSZXNwb25zZRIjCg10b3RhbF9yZXZlbnVlGAEgASgDUgx0b3'
    'RhbFJldmVudWUSKwoSY29zdF9vZl9nb29kc19zb2xkGAIgASgDUg9jb3N0T2ZHb29kc1NvbGQS'
    'IQoMZ3Jvc3NfcHJvZml0GAMgASgDUgtncm9zc1Byb2ZpdBIuChNncm9zc19wcm9maXRfbWFyZ2'
    'luGAQgASgBUhFncm9zc1Byb2ZpdE1hcmdpbhIjCg1yZXR1cm5zX3ZhbHVlGAUgASgDUgxyZXR1'
    'cm5zVmFsdWUSKwoRYWRqdXN0bWVudHNfdmFsdWUYBiABKANSEGFkanVzdG1lbnRzVmFsdWUSHQ'
    'oKbmV0X3Byb2ZpdBgHIAEoA1IJbmV0UHJvZml0EicKD3RvdGFsX3B1cmNoYXNlcxgIIAEoA1IO'
    'dG90YWxQdXJjaGFzZXMSLwoTb3V0c3RhbmRpbmdfYmFsYW5jZRgJIAEoA1ISb3V0c3RhbmRpbm'
    'dCYWxhbmNlElsKFXN1cHBsaWVyX3BlcmZvcm1hbmNlcxgKIAMoCzImLnJlcG9ydHMudjEuU3Vw'
    'cGxpZXJQZXJmb3JtYW5jZVN1bW1hcnlSFHN1cHBsaWVyUGVyZm9ybWFuY2VzElwKGHJldmVudW'
    'VfdnNfZXhwZW5zZXNfZGF0YRgLIAMoCzIjLnJlcG9ydHMudjEuUmV2ZW51ZUV4cGVuc2VEYXRh'
    'UG9pbnRSFXJldmVudWVWc0V4cGVuc2VzRGF0YRJdChhwcmV2aW91c195ZWFyX2NvbXBhcmlzb2'
    '4YDCABKAsyIy5yZXBvcnRzLnYxLkZpbmFuY2lhbENvbXBhcmlzb25EYXRhUhZwcmV2aW91c1ll'
    'YXJDb21wYXJpc29u');

@$core.Deprecated('Use revenueExpenseDataPointDescriptor instead')
const RevenueExpenseDataPoint$json = {
  '1': 'RevenueExpenseDataPoint',
  '2': [
    {
      '1': 'period_start',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'periodStart'
    },
    {
      '1': 'period_end',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'periodEnd'
    },
    {'1': 'revenue', '3': 3, '4': 1, '5': 1, '10': 'revenue'},
    {'1': 'expenses', '3': 4, '4': 1, '5': 1, '10': 'expenses'},
    {'1': 'net_amount', '3': 5, '4': 1, '5': 1, '10': 'netAmount'},
  ],
};

/// Descriptor for `RevenueExpenseDataPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List revenueExpenseDataPointDescriptor = $convert.base64Decode(
    'ChdSZXZlbnVlRXhwZW5zZURhdGFQb2ludBI9CgxwZXJpb2Rfc3RhcnQYASABKAsyGi5nb29nbG'
    'UucHJvdG9idWYuVGltZXN0YW1wUgtwZXJpb2RTdGFydBI5CgpwZXJpb2RfZW5kGAIgASgLMhou'
    'Z29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJcGVyaW9kRW5kEhgKB3JldmVudWUYAyABKAFSB3'
    'JldmVudWUSGgoIZXhwZW5zZXMYBCABKAFSCGV4cGVuc2VzEh0KCm5ldF9hbW91bnQYBSABKAFS'
    'CW5ldEFtb3VudA==');

@$core.Deprecated('Use supplierPerformanceSummaryDescriptor instead')
const SupplierPerformanceSummary$json = {
  '1': 'SupplierPerformanceSummary',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'supplier_name', '3': 2, '4': 1, '5': 9, '10': 'supplierName'},
    {
      '1': 'total_purchase_value',
      '3': 3,
      '4': 1,
      '5': 3,
      '10': 'totalPurchaseValue'
    },
    {
      '1': 'on_time_percentage',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'onTimePercentage'
    },
    {'1': 'total_orders', '3': 5, '4': 1, '5': 5, '10': 'totalOrders'},
  ],
};

/// Descriptor for `SupplierPerformanceSummary`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List supplierPerformanceSummaryDescriptor = $convert.base64Decode(
    'ChpTdXBwbGllclBlcmZvcm1hbmNlU3VtbWFyeRIfCgtzdXBwbGllcl9pZBgBIAEoCVIKc3VwcG'
    'xpZXJJZBIjCg1zdXBwbGllcl9uYW1lGAIgASgJUgxzdXBwbGllck5hbWUSMAoUdG90YWxfcHVy'
    'Y2hhc2VfdmFsdWUYAyABKANSEnRvdGFsUHVyY2hhc2VWYWx1ZRIsChJvbl90aW1lX3BlcmNlbn'
    'RhZ2UYBCABKAFSEG9uVGltZVBlcmNlbnRhZ2USIQoMdG90YWxfb3JkZXJzGAUgASgFUgt0b3Rh'
    'bE9yZGVycw==');

@$core.Deprecated('Use financialComparisonDataDescriptor instead')
const FinancialComparisonData$json = {
  '1': 'FinancialComparisonData',
  '2': [
    {
      '1': 'previous_year_total_revenue',
      '3': 1,
      '4': 1,
      '5': 3,
      '10': 'previousYearTotalRevenue'
    },
    {
      '1': 'previous_year_net_profit',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'previousYearNetProfit'
    },
    {
      '1': 'previous_year_gross_profit_margin',
      '3': 3,
      '4': 1,
      '5': 1,
      '10': 'previousYearGrossProfitMargin'
    },
    {
      '1': 'previous_year_total_purchases',
      '3': 4,
      '4': 1,
      '5': 3,
      '10': 'previousYearTotalPurchases'
    },
  ],
};

/// Descriptor for `FinancialComparisonData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List financialComparisonDataDescriptor = $convert.base64Decode(
    'ChdGaW5hbmNpYWxDb21wYXJpc29uRGF0YRI9ChtwcmV2aW91c195ZWFyX3RvdGFsX3JldmVudW'
    'UYASABKANSGHByZXZpb3VzWWVhclRvdGFsUmV2ZW51ZRI3ChhwcmV2aW91c195ZWFyX25ldF9w'
    'cm9maXQYAiABKANSFXByZXZpb3VzWWVhck5ldFByb2ZpdBJICiFwcmV2aW91c195ZWFyX2dyb3'
    'NzX3Byb2ZpdF9tYXJnaW4YAyABKAFSHXByZXZpb3VzWWVhckdyb3NzUHJvZml0TWFyZ2luEkEK'
    'HXByZXZpb3VzX3llYXJfdG90YWxfcHVyY2hhc2VzGAQgASgDUhpwcmV2aW91c1llYXJUb3RhbF'
    'B1cmNoYXNlcw==');

@$core.Deprecated('Use inventoryComparisonDataDescriptor instead')
const InventoryComparisonData$json = {
  '1': 'InventoryComparisonData',
  '2': [
    {
      '1': 'previous_year_total_products',
      '3': 1,
      '4': 1,
      '5': 5,
      '10': 'previousYearTotalProducts'
    },
    {
      '1': 'previous_year_total_value',
      '3': 2,
      '4': 1,
      '5': 3,
      '10': 'previousYearTotalValue'
    },
    {
      '1': 'previous_year_low_stock_count',
      '3': 3,
      '4': 1,
      '5': 5,
      '10': 'previousYearLowStockCount'
    },
    {
      '1': 'previous_year_movement_total_in',
      '3': 4,
      '4': 1,
      '5': 1,
      '10': 'previousYearMovementTotalIn'
    },
    {
      '1': 'previous_year_movement_total_out',
      '3': 5,
      '4': 1,
      '5': 1,
      '10': 'previousYearMovementTotalOut'
    },
  ],
};

/// Descriptor for `InventoryComparisonData`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List inventoryComparisonDataDescriptor = $convert.base64Decode(
    'ChdJbnZlbnRvcnlDb21wYXJpc29uRGF0YRI/ChxwcmV2aW91c195ZWFyX3RvdGFsX3Byb2R1Y3'
    'RzGAEgASgFUhlwcmV2aW91c1llYXJUb3RhbFByb2R1Y3RzEjkKGXByZXZpb3VzX3llYXJfdG90'
    'YWxfdmFsdWUYAiABKANSFnByZXZpb3VzWWVhclRvdGFsVmFsdWUSQAodcHJldmlvdXNfeWVhcl'
    '9sb3dfc3RvY2tfY291bnQYAyABKAVSGXByZXZpb3VzWWVhckxvd1N0b2NrQ291bnQSRAofcHJl'
    'dmlvdXNfeWVhcl9tb3ZlbWVudF90b3RhbF9pbhgEIAEoAVIbcHJldmlvdXNZZWFyTW92ZW1lbn'
    'RUb3RhbEluEkYKIHByZXZpb3VzX3llYXJfbW92ZW1lbnRfdG90YWxfb3V0GAUgASgBUhxwcmV2'
    'aW91c1llYXJNb3ZlbWVudFRvdGFsT3V0');

@$core.Deprecated('Use getDashboardReportRequestDescriptor instead')
const GetDashboardReportRequest$json = {
  '1': 'GetDashboardReportRequest',
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
      '1': 'start_date',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'startDate'
    },
    {
      '1': 'end_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'endDate'
    },
  ],
  '8': [
    {'1': '_store_id'},
  ],
};

/// Descriptor for `GetDashboardReportRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDashboardReportRequestDescriptor = $convert.base64Decode(
    'ChlHZXREYXNoYm9hcmRSZXBvcnRSZXF1ZXN0Eh4KCHN0b3JlX2lkGAEgASgJSABSB3N0b3JlSW'
    'SIAQESOQoKc3RhcnRfZGF0ZRgCIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXN0'
    'YXJ0RGF0ZRI1CghlbmRfZGF0ZRgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSB2'
    'VuZERhdGVCCwoJX3N0b3JlX2lk');

@$core.Deprecated('Use getDashboardReportResponseDescriptor instead')
const GetDashboardReportResponse$json = {
  '1': 'GetDashboardReportResponse',
  '2': [
    {
      '1': 'total_sales_amount',
      '3': 1,
      '4': 1,
      '5': 3,
      '10': 'totalSalesAmount'
    },
    {
      '1': 'total_transactions',
      '3': 2,
      '4': 1,
      '5': 5,
      '10': 'totalTransactions'
    },
    {
      '1': 'average_transaction_value',
      '3': 3,
      '4': 1,
      '5': 1,
      '10': 'averageTransactionValue'
    },
    {'1': 'total_units_sold', '3': 4, '4': 1, '5': 5, '10': 'totalUnitsSold'},
    {'1': 'total_revenue', '3': 5, '4': 1, '5': 3, '10': 'totalRevenue'},
    {'1': 'net_profit', '3': 6, '4': 1, '5': 3, '10': 'netProfit'},
    {
      '1': 'gross_profit_margin',
      '3': 7,
      '4': 1,
      '5': 1,
      '10': 'grossProfitMargin'
    },
    {'1': 'total_purchases', '3': 8, '4': 1, '5': 3, '10': 'totalPurchases'},
    {'1': 'total_products', '3': 9, '4': 1, '5': 5, '10': 'totalProducts'},
    {
      '1': 'total_inventory_value',
      '3': 10,
      '4': 1,
      '5': 3,
      '10': 'totalInventoryValue'
    },
    {'1': 'low_stock_count', '3': 11, '4': 1, '5': 5, '10': 'lowStockCount'},
    {
      '1': 'sales_and_profit_trend',
      '3': 12,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.TrendDataPoint',
      '10': 'salesAndProfitTrend'
    },
    {
      '1': 'category_sales_breakdown',
      '3': 13,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.CategorySalesData',
      '10': 'categorySalesBreakdown'
    },
    {
      '1': 'revenue_vs_expenses',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.RevenueExpenseDataPoint',
      '10': 'revenueVsExpenses'
    },
    {
      '1': 'inventory_movement',
      '3': 15,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.StockMovementDataPoint',
      '10': 'inventoryMovement'
    },
    {
      '1': 'sales_comparison',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.reports.v1.SalesComparisonData',
      '10': 'salesComparison'
    },
    {
      '1': 'financial_comparison',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.reports.v1.FinancialComparisonData',
      '10': 'financialComparison'
    },
    {
      '1': 'inventory_comparison',
      '3': 18,
      '4': 1,
      '5': 11,
      '6': '.reports.v1.InventoryComparisonData',
      '10': 'inventoryComparison'
    },
    {
      '1': 'top_performing_products',
      '3': 19,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.BestSellingProduct',
      '10': 'topPerformingProducts'
    },
    {
      '1': 'supplier_performances',
      '3': 20,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.SupplierPerformanceSummary',
      '10': 'supplierPerformances'
    },
    {
      '1': 'stock_aging_items',
      '3': 21,
      '4': 3,
      '5': 11,
      '6': '.reports.v1.StockAgingItem',
      '10': 'stockAgingItems'
    },
  ],
};

/// Descriptor for `GetDashboardReportResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getDashboardReportResponseDescriptor = $convert.base64Decode(
    'ChpHZXREYXNoYm9hcmRSZXBvcnRSZXNwb25zZRIsChJ0b3RhbF9zYWxlc19hbW91bnQYASABKA'
    'NSEHRvdGFsU2FsZXNBbW91bnQSLQoSdG90YWxfdHJhbnNhY3Rpb25zGAIgASgFUhF0b3RhbFRy'
    'YW5zYWN0aW9ucxI6ChlhdmVyYWdlX3RyYW5zYWN0aW9uX3ZhbHVlGAMgASgBUhdhdmVyYWdlVH'
    'JhbnNhY3Rpb25WYWx1ZRIoChB0b3RhbF91bml0c19zb2xkGAQgASgFUg50b3RhbFVuaXRzU29s'
    'ZBIjCg10b3RhbF9yZXZlbnVlGAUgASgDUgx0b3RhbFJldmVudWUSHQoKbmV0X3Byb2ZpdBgGIA'
    'EoA1IJbmV0UHJvZml0Ei4KE2dyb3NzX3Byb2ZpdF9tYXJnaW4YByABKAFSEWdyb3NzUHJvZml0'
    'TWFyZ2luEicKD3RvdGFsX3B1cmNoYXNlcxgIIAEoA1IOdG90YWxQdXJjaGFzZXMSJQoOdG90YW'
    'xfcHJvZHVjdHMYCSABKAVSDXRvdGFsUHJvZHVjdHMSMgoVdG90YWxfaW52ZW50b3J5X3ZhbHVl'
    'GAogASgDUhN0b3RhbEludmVudG9yeVZhbHVlEiYKD2xvd19zdG9ja19jb3VudBgLIAEoBVINbG'
    '93U3RvY2tDb3VudBJPChZzYWxlc19hbmRfcHJvZml0X3RyZW5kGAwgAygLMhoucmVwb3J0cy52'
    'MS5UcmVuZERhdGFQb2ludFITc2FsZXNBbmRQcm9maXRUcmVuZBJXChhjYXRlZ29yeV9zYWxlc1'
    '9icmVha2Rvd24YDSADKAsyHS5yZXBvcnRzLnYxLkNhdGVnb3J5U2FsZXNEYXRhUhZjYXRlZ29y'
    'eVNhbGVzQnJlYWtkb3duElMKE3JldmVudWVfdnNfZXhwZW5zZXMYDiADKAsyIy5yZXBvcnRzLn'
    'YxLlJldmVudWVFeHBlbnNlRGF0YVBvaW50UhFyZXZlbnVlVnNFeHBlbnNlcxJRChJpbnZlbnRv'
    'cnlfbW92ZW1lbnQYDyADKAsyIi5yZXBvcnRzLnYxLlN0b2NrTW92ZW1lbnREYXRhUG9pbnRSEW'
    'ludmVudG9yeU1vdmVtZW50EkoKEHNhbGVzX2NvbXBhcmlzb24YECABKAsyHy5yZXBvcnRzLnYx'
    'LlNhbGVzQ29tcGFyaXNvbkRhdGFSD3NhbGVzQ29tcGFyaXNvbhJWChRmaW5hbmNpYWxfY29tcG'
    'FyaXNvbhgRIAEoCzIjLnJlcG9ydHMudjEuRmluYW5jaWFsQ29tcGFyaXNvbkRhdGFSE2ZpbmFu'
    'Y2lhbENvbXBhcmlzb24SVgoUaW52ZW50b3J5X2NvbXBhcmlzb24YEiABKAsyIy5yZXBvcnRzLn'
    'YxLkludmVudG9yeUNvbXBhcmlzb25EYXRhUhNpbnZlbnRvcnlDb21wYXJpc29uElYKF3RvcF9w'
    'ZXJmb3JtaW5nX3Byb2R1Y3RzGBMgAygLMh4ucmVwb3J0cy52MS5CZXN0U2VsbGluZ1Byb2R1Y3'
    'RSFXRvcFBlcmZvcm1pbmdQcm9kdWN0cxJbChVzdXBwbGllcl9wZXJmb3JtYW5jZXMYFCADKAsy'
    'Ji5yZXBvcnRzLnYxLlN1cHBsaWVyUGVyZm9ybWFuY2VTdW1tYXJ5UhRzdXBwbGllclBlcmZvcm'
    '1hbmNlcxJGChFzdG9ja19hZ2luZ19pdGVtcxgVIAMoCzIaLnJlcG9ydHMudjEuU3RvY2tBZ2lu'
    'Z0l0ZW1SD3N0b2NrQWdpbmdJdGVtcw==');

@$core.Deprecated('Use trendDataPointDescriptor instead')
const TrendDataPoint$json = {
  '1': 'TrendDataPoint',
  '2': [
    {
      '1': 'date',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'date'
    },
    {'1': 'sales_value', '3': 2, '4': 1, '5': 1, '10': 'salesValue'},
    {'1': 'profit_value', '3': 3, '4': 1, '5': 1, '10': 'profitValue'},
  ],
};

/// Descriptor for `TrendDataPoint`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List trendDataPointDescriptor = $convert.base64Decode(
    'Cg5UcmVuZERhdGFQb2ludBIuCgRkYXRlGAEgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdG'
    'FtcFIEZGF0ZRIfCgtzYWxlc192YWx1ZRgCIAEoAVIKc2FsZXNWYWx1ZRIhCgxwcm9maXRfdmFs'
    'dWUYAyABKAFSC3Byb2ZpdFZhbHVl');

const $core.Map<$core.String, $core.dynamic> ReportingServiceBase$json = {
  '1': 'ReportingService',
  '2': [
    {
      '1': 'GetSalesReport',
      '2': '.reports.v1.GetSalesReportRequest',
      '3': '.reports.v1.GetSalesReportResponse'
    },
    {
      '1': 'GetPurchaseReport',
      '2': '.reports.v1.GetPurchaseReportRequest',
      '3': '.reports.v1.GetPurchaseReportResponse'
    },
    {
      '1': 'GetInventoryMovementReport',
      '2': '.reports.v1.GetInventoryMovementReportRequest',
      '3': '.reports.v1.GetInventoryMovementReportResponse'
    },
    {
      '1': 'GetBestSellingProducts',
      '2': '.reports.v1.GetBestSellingProductsRequest',
      '3': '.reports.v1.GetBestSellingProductsResponse'
    },
    {
      '1': 'GetStorePurchaseHistory',
      '2': '.reports.v1.GetStorePurchaseHistoryRequest',
      '3': '.reports.v1.GetStorePurchaseHistoryResponse'
    },
    {
      '1': 'GetSupplierPerformanceReport',
      '2': '.reports.v1.GetSupplierPerformanceReportRequest',
      '3': '.reports.v1.GetSupplierPerformanceReportResponse'
    },
    {
      '1': 'GetProfitLossReport',
      '2': '.reports.v1.GetProfitLossReportRequest',
      '3': '.reports.v1.GetProfitLossReportResponse'
    },
    {
      '1': 'GetStockAgingReport',
      '2': '.reports.v1.GetStockAgingReportRequest',
      '3': '.reports.v1.GetStockAgingReportResponse'
    },
    {
      '1': 'GetInventoryReport',
      '2': '.reports.v1.GetInventoryReportRequest',
      '3': '.reports.v1.GetInventoryReportResponse'
    },
    {
      '1': 'GetSalesReportFull',
      '2': '.reports.v1.GetSalesReportRequest',
      '3': '.reports.v1.GetSalesReportFullResponse'
    },
    {
      '1': 'GetFinancialReport',
      '2': '.reports.v1.GetFinancialReportRequest',
      '3': '.reports.v1.GetFinancialReportResponse'
    },
  ],
};

@$core.Deprecated('Use reportingServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    ReportingServiceBase$messageJson = {
  '.reports.v1.GetSalesReportRequest': GetSalesReportRequest$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.reports.v1.GetSalesReportResponse': GetSalesReportResponse$json,
  '.reports.v1.SalesSummary': SalesSummary$json,
  '.reports.v1.GetPurchaseReportRequest': GetPurchaseReportRequest$json,
  '.reports.v1.GetPurchaseReportResponse': GetPurchaseReportResponse$json,
  '.reports.v1.PurchaseSummary': PurchaseSummary$json,
  '.reports.v1.GetInventoryMovementReportRequest':
      GetInventoryMovementReportRequest$json,
  '.reports.v1.GetInventoryMovementReportResponse':
      GetInventoryMovementReportResponse$json,
  '.inventory.v1.StoreProduct': $1.StoreProduct$json,
  '.audits.v1.InventoryTransaction': $2.InventoryTransaction$json,
  '.reports.v1.GetBestSellingProductsRequest':
      GetBestSellingProductsRequest$json,
  '.reports.v1.GetBestSellingProductsResponse':
      GetBestSellingProductsResponse$json,
  '.reports.v1.BestSellingProduct': BestSellingProduct$json,
  '.reports.v1.GetStorePurchaseHistoryRequest':
      GetStorePurchaseHistoryRequest$json,
  '.reports.v1.GetStorePurchaseHistoryResponse':
      GetStorePurchaseHistoryResponse$json,
  '.store.v1.Store': $3.Store$json,
  '.store.v1.Address': $3.Address$json,
  '.financial.v1.Invoice': $4.Invoice$json,
  '.financial.v1.InvoiceLineItem': $6.InvoiceLineItem$json,
  '.inventory.v1.Internationalized': $7.Internationalized$json,
  '.reports.v1.GetSupplierPerformanceReportRequest':
      GetSupplierPerformanceReportRequest$json,
  '.reports.v1.GetSupplierPerformanceReportResponse':
      GetSupplierPerformanceReportResponse$json,
  '.store.v1.Supplier': $5.Supplier$json,
  '.reports.v1.GetProfitLossReportRequest': GetProfitLossReportRequest$json,
  '.reports.v1.GetProfitLossReportResponse': GetProfitLossReportResponse$json,
  '.reports.v1.GetStockAgingReportRequest': GetStockAgingReportRequest$json,
  '.reports.v1.GetStockAgingReportResponse': GetStockAgingReportResponse$json,
  '.reports.v1.StockAgingItem': StockAgingItem$json,
  '.reports.v1.GetInventoryReportRequest': GetInventoryReportRequest$json,
  '.reports.v1.GetInventoryReportResponse': GetInventoryReportResponse$json,
  '.reports.v1.InventoryMovementSummary': InventoryMovementSummary$json,
  '.reports.v1.StockMovementDataPoint': StockMovementDataPoint$json,
  '.reports.v1.InventoryComparisonData': InventoryComparisonData$json,
  '.reports.v1.GetSalesReportFullResponse': GetSalesReportFullResponse$json,
  '.reports.v1.CategorySalesData': CategorySalesData$json,
  '.reports.v1.SalesComparisonData': SalesComparisonData$json,
  '.reports.v1.GetFinancialReportRequest': GetFinancialReportRequest$json,
  '.reports.v1.GetFinancialReportResponse': GetFinancialReportResponse$json,
  '.reports.v1.SupplierPerformanceSummary': SupplierPerformanceSummary$json,
  '.reports.v1.RevenueExpenseDataPoint': RevenueExpenseDataPoint$json,
  '.reports.v1.FinancialComparisonData': FinancialComparisonData$json,
};

/// Descriptor for `ReportingService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List reportingServiceDescriptor = $convert.base64Decode(
    'ChBSZXBvcnRpbmdTZXJ2aWNlElcKDkdldFNhbGVzUmVwb3J0EiEucmVwb3J0cy52MS5HZXRTYW'
    'xlc1JlcG9ydFJlcXVlc3QaIi5yZXBvcnRzLnYxLkdldFNhbGVzUmVwb3J0UmVzcG9uc2USYAoR'
    'R2V0UHVyY2hhc2VSZXBvcnQSJC5yZXBvcnRzLnYxLkdldFB1cmNoYXNlUmVwb3J0UmVxdWVzdB'
    'olLnJlcG9ydHMudjEuR2V0UHVyY2hhc2VSZXBvcnRSZXNwb25zZRJ7ChpHZXRJbnZlbnRvcnlN'
    'b3ZlbWVudFJlcG9ydBItLnJlcG9ydHMudjEuR2V0SW52ZW50b3J5TW92ZW1lbnRSZXBvcnRSZX'
    'F1ZXN0Gi4ucmVwb3J0cy52MS5HZXRJbnZlbnRvcnlNb3ZlbWVudFJlcG9ydFJlc3BvbnNlEm8K'
    'FkdldEJlc3RTZWxsaW5nUHJvZHVjdHMSKS5yZXBvcnRzLnYxLkdldEJlc3RTZWxsaW5nUHJvZH'
    'VjdHNSZXF1ZXN0GioucmVwb3J0cy52MS5HZXRCZXN0U2VsbGluZ1Byb2R1Y3RzUmVzcG9uc2US'
    'cgoXR2V0U3RvcmVQdXJjaGFzZUhpc3RvcnkSKi5yZXBvcnRzLnYxLkdldFN0b3JlUHVyY2hhc2'
    'VIaXN0b3J5UmVxdWVzdBorLnJlcG9ydHMudjEuR2V0U3RvcmVQdXJjaGFzZUhpc3RvcnlSZXNw'
    'b25zZRKBAQocR2V0U3VwcGxpZXJQZXJmb3JtYW5jZVJlcG9ydBIvLnJlcG9ydHMudjEuR2V0U3'
    'VwcGxpZXJQZXJmb3JtYW5jZVJlcG9ydFJlcXVlc3QaMC5yZXBvcnRzLnYxLkdldFN1cHBsaWVy'
    'UGVyZm9ybWFuY2VSZXBvcnRSZXNwb25zZRJmChNHZXRQcm9maXRMb3NzUmVwb3J0EiYucmVwb3'
    'J0cy52MS5HZXRQcm9maXRMb3NzUmVwb3J0UmVxdWVzdBonLnJlcG9ydHMudjEuR2V0UHJvZml0'
    'TG9zc1JlcG9ydFJlc3BvbnNlEmYKE0dldFN0b2NrQWdpbmdSZXBvcnQSJi5yZXBvcnRzLnYxLk'
    'dldFN0b2NrQWdpbmdSZXBvcnRSZXF1ZXN0GicucmVwb3J0cy52MS5HZXRTdG9ja0FnaW5nUmVw'
    'b3J0UmVzcG9uc2USYwoSR2V0SW52ZW50b3J5UmVwb3J0EiUucmVwb3J0cy52MS5HZXRJbnZlbn'
    'RvcnlSZXBvcnRSZXF1ZXN0GiYucmVwb3J0cy52MS5HZXRJbnZlbnRvcnlSZXBvcnRSZXNwb25z'
    'ZRJfChJHZXRTYWxlc1JlcG9ydEZ1bGwSIS5yZXBvcnRzLnYxLkdldFNhbGVzUmVwb3J0UmVxdW'
    'VzdBomLnJlcG9ydHMudjEuR2V0U2FsZXNSZXBvcnRGdWxsUmVzcG9uc2USYwoSR2V0RmluYW5j'
    'aWFsUmVwb3J0EiUucmVwb3J0cy52MS5HZXRGaW5hbmNpYWxSZXBvcnRSZXF1ZXN0GiYucmVwb3'
    'J0cy52MS5HZXRGaW5hbmNpYWxSZXBvcnRSZXNwb25zZQ==');

const $core.Map<$core.String, $core.dynamic>
    DashboardReportingServiceBase$json = {
  '1': 'DashboardReportingService',
  '2': [
    {
      '1': 'GetDashboardReport',
      '2': '.reports.v1.GetDashboardReportRequest',
      '3': '.reports.v1.GetDashboardReportResponse'
    },
  ],
};

@$core.Deprecated('Use dashboardReportingServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    DashboardReportingServiceBase$messageJson = {
  '.reports.v1.GetDashboardReportRequest': GetDashboardReportRequest$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.reports.v1.GetDashboardReportResponse': GetDashboardReportResponse$json,
  '.reports.v1.TrendDataPoint': TrendDataPoint$json,
  '.reports.v1.CategorySalesData': CategorySalesData$json,
  '.reports.v1.RevenueExpenseDataPoint': RevenueExpenseDataPoint$json,
  '.reports.v1.StockMovementDataPoint': StockMovementDataPoint$json,
  '.reports.v1.SalesComparisonData': SalesComparisonData$json,
  '.reports.v1.FinancialComparisonData': FinancialComparisonData$json,
  '.reports.v1.InventoryComparisonData': InventoryComparisonData$json,
  '.reports.v1.BestSellingProduct': BestSellingProduct$json,
  '.inventory.v1.StoreProduct': $1.StoreProduct$json,
  '.reports.v1.SupplierPerformanceSummary': SupplierPerformanceSummary$json,
  '.reports.v1.StockAgingItem': StockAgingItem$json,
};

/// Descriptor for `DashboardReportingService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List dashboardReportingServiceDescriptor = $convert.base64Decode(
    'ChlEYXNoYm9hcmRSZXBvcnRpbmdTZXJ2aWNlEmMKEkdldERhc2hib2FyZFJlcG9ydBIlLnJlcG'
    '9ydHMudjEuR2V0RGFzaGJvYXJkUmVwb3J0UmVxdWVzdBomLnJlcG9ydHMudjEuR2V0RGFzaGJv'
    'YXJkUmVwb3J0UmVzcG9uc2U=');
