// This is a generated file - do not edit.
//
// Generated from order/v1/sales_order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../financial/v1/financial_utils.pbjson.dart' as $6;
import '../../financial/v1/invoice.pbjson.dart' as $3;
import '../../google/protobuf/timestamp.pbjson.dart' as $1;
import '../../inventory/v1/category.pbjson.dart' as $5;
import '../../logistic/v1/delivery_notes.pbjson.dart' as $2;
import '../../payments/v1/payments.pbjson.dart' as $4;
import 'order_utils.pbjson.dart' as $0;

@$core.Deprecated('Use salesOrderStatusDescriptor instead')
const SalesOrderStatus$json = {
  '1': 'SalesOrderStatus',
  '2': [
    {'1': 'SO_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'SO_STATUS_DRAFT', '2': 1},
    {'1': 'SO_STATUS_CONFIRMED', '2': 2},
    {'1': 'SO_STATUS_PROCESSING', '2': 3},
    {'1': 'SO_STATUS_SHIPPED', '2': 4},
    {'1': 'SO_STATUS_DELIVERED', '2': 5},
    {'1': 'SO_STATUS_CANCELLED', '2': 6},
  ],
};

/// Descriptor for `SalesOrderStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List salesOrderStatusDescriptor = $convert.base64Decode(
    'ChBTYWxlc09yZGVyU3RhdHVzEhkKFVNPX1NUQVRVU19VTlNQRUNJRklFRBAAEhMKD1NPX1NUQV'
    'RVU19EUkFGVBABEhcKE1NPX1NUQVRVU19DT05GSVJNRUQQAhIYChRTT19TVEFUVVNfUFJPQ0VT'
    'U0lORxADEhUKEVNPX1NUQVRVU19TSElQUEVEEAQSFwoTU09fU1RBVFVTX0RFTElWRVJFRBAFEh'
    'cKE1NPX1NUQVRVU19DQU5DRUxMRUQQBg==');

@$core.Deprecated('Use salesOrderDescriptor instead')
const SalesOrder$json = {
  '1': 'SalesOrder',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {'1': 'customer_id', '3': 2, '4': 1, '5': 9, '10': 'customerId'},
    {'1': 'seller_id', '3': 3, '4': 1, '5': 9, '10': 'sellerId'},
    {
      '1': 'source_warehouse_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'sourceWarehouseId'
    },
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.order.v1.SalesOrderStatus',
      '10': 'status'
    },
    {
      '1': 'items',
      '3': 6,
      '4': 3,
      '5': 11,
      '6': '.order.v1.OrderLineItem',
      '10': 'items'
    },
    {
      '1': 'order_prices',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.order.v1.OrderPrices',
      '10': 'orderPrices'
    },
    {
      '1': 'currency',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'currency',
      '17': true
    },
    {
      '1': 'created_by_user_id',
      '3': 9,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
    {
      '1': 'created_at',
      '3': 10,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'delivery_date',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'deliveryDate'
    },
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '9': 1, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `SalesOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salesOrderDescriptor = $convert.base64Decode(
    'CgpTYWxlc09yZGVyEicKC2RvY3VtZW50X2lkGAEgASgJQga6SAPIAQFSCmRvY3VtZW50SWQSHw'
    'oLY3VzdG9tZXJfaWQYAiABKAlSCmN1c3RvbWVySWQSGwoJc2VsbGVyX2lkGAMgASgJUghzZWxs'
    'ZXJJZBIuChNzb3VyY2Vfd2FyZWhvdXNlX2lkGAQgASgJUhFzb3VyY2VXYXJlaG91c2VJZBIyCg'
    'ZzdGF0dXMYBSABKA4yGi5vcmRlci52MS5TYWxlc09yZGVyU3RhdHVzUgZzdGF0dXMSLQoFaXRl'
    'bXMYBiADKAsyFy5vcmRlci52MS5PcmRlckxpbmVJdGVtUgVpdGVtcxI4CgxvcmRlcl9wcmljZX'
    'MYByABKAsyFS5vcmRlci52MS5PcmRlclByaWNlc1ILb3JkZXJQcmljZXMSHwoIY3VycmVuY3kY'
    'CCABKAlIAFIIY3VycmVuY3mIAQESKwoSY3JlYXRlZF9ieV91c2VyX2lkGAkgASgJUg9jcmVhdG'
    'VkQnlVc2VySWQSOQoKY3JlYXRlZF9hdBgKIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3Rh'
    'bXBSCWNyZWF0ZWRBdBI/Cg1kZWxpdmVyeV9kYXRlGAsgASgLMhouZ29vZ2xlLnByb3RvYnVmLl'
    'RpbWVzdGFtcFIMZGVsaXZlcnlEYXRlEhkKBW5vdGVzGAwgASgJSAFSBW5vdGVziAEBQgsKCV9j'
    'dXJyZW5jeUIICgZfbm90ZXM=');

@$core.Deprecated('Use createSalesOrderRequestDescriptor instead')
const CreateSalesOrderRequest$json = {
  '1': 'CreateSalesOrderRequest',
  '2': [
    {'1': 'customer_id', '3': 1, '4': 1, '5': 9, '10': 'customerId'},
    {'1': 'seller_id', '3': 2, '4': 1, '5': 9, '10': 'sellerId'},
    {
      '1': 'source_warehouse_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'sourceWarehouseId'
    },
    {
      '1': 'items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.order.v1.OrderLineItem',
      '10': 'items'
    },
    {
      '1': 'delivery_date',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'deliveryDate'
    },
    {
      '1': 'created_by_user_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
    {'1': 'notes', '3': 7, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `CreateSalesOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSalesOrderRequestDescriptor = $convert.base64Decode(
    'ChdDcmVhdGVTYWxlc09yZGVyUmVxdWVzdBIfCgtjdXN0b21lcl9pZBgBIAEoCVIKY3VzdG9tZX'
    'JJZBIbCglzZWxsZXJfaWQYAiABKAlSCHNlbGxlcklkEi4KE3NvdXJjZV93YXJlaG91c2VfaWQY'
    'AyABKAlSEXNvdXJjZVdhcmVob3VzZUlkEi0KBWl0ZW1zGAQgAygLMhcub3JkZXIudjEuT3JkZX'
    'JMaW5lSXRlbVIFaXRlbXMSPwoNZGVsaXZlcnlfZGF0ZRgFIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBSDGRlbGl2ZXJ5RGF0ZRIrChJjcmVhdGVkX2J5X3VzZXJfaWQYBiABKAlSD2'
    'NyZWF0ZWRCeVVzZXJJZBIUCgVub3RlcxgHIAEoCVIFbm90ZXM=');

@$core.Deprecated('Use createSalesOrderResponseDescriptor instead')
const CreateSalesOrderResponse$json = {
  '1': 'CreateSalesOrderResponse',
  '2': [
    {'1': 'so_id', '3': 1, '4': 1, '5': 9, '10': 'soId'},
    {
      '1': 'sales_order',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.order.v1.SalesOrder',
      '10': 'salesOrder'
    },
    {
      '1': 'all_items_available',
      '3': 3,
      '4': 1,
      '5': 8,
      '10': 'allItemsAvailable'
    },
    {
      '1': 'unavailable_product_ids',
      '3': 4,
      '4': 3,
      '5': 9,
      '10': 'unavailableProductIds'
    },
    {'1': 'message', '3': 5, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateSalesOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createSalesOrderResponseDescriptor = $convert.base64Decode(
    'ChhDcmVhdGVTYWxlc09yZGVyUmVzcG9uc2USEwoFc29faWQYASABKAlSBHNvSWQSNQoLc2FsZX'
    'Nfb3JkZXIYAiABKAsyFC5vcmRlci52MS5TYWxlc09yZGVyUgpzYWxlc09yZGVyEi4KE2FsbF9p'
    'dGVtc19hdmFpbGFibGUYAyABKAhSEWFsbEl0ZW1zQXZhaWxhYmxlEjYKF3VuYXZhaWxhYmxlX3'
    'Byb2R1Y3RfaWRzGAQgAygJUhV1bmF2YWlsYWJsZVByb2R1Y3RJZHMSGAoHbWVzc2FnZRgFIAEo'
    'CVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getSalesOrderRequestDescriptor instead')
const GetSalesOrderRequest$json = {
  '1': 'GetSalesOrderRequest',
  '2': [
    {'1': 'so_id', '3': 1, '4': 1, '5': 9, '10': 'soId'},
  ],
};

/// Descriptor for `GetSalesOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSalesOrderRequestDescriptor =
    $convert.base64Decode(
        'ChRHZXRTYWxlc09yZGVyUmVxdWVzdBITCgVzb19pZBgBIAEoCVIEc29JZA==');

@$core.Deprecated('Use getSalesOrderResponseDescriptor instead')
const GetSalesOrderResponse$json = {
  '1': 'GetSalesOrderResponse',
  '2': [
    {
      '1': 'sales_order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.SalesOrder',
      '10': 'salesOrder'
    },
    {
      '1': 'delivery_notes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.DeliveryNote',
      '10': 'deliveryNotes'
    },
    {
      '1': 'invoices',
      '3': 3,
      '4': 3,
      '5': 11,
      '6': '.financial.v1.Invoice',
      '10': 'invoices'
    },
    {
      '1': 'payments',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.payments.v1.Payment',
      '10': 'payments'
    },
  ],
};

/// Descriptor for `GetSalesOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSalesOrderResponseDescriptor = $convert.base64Decode(
    'ChVHZXRTYWxlc09yZGVyUmVzcG9uc2USNQoLc2FsZXNfb3JkZXIYASABKAsyFC5vcmRlci52MS'
    '5TYWxlc09yZGVyUgpzYWxlc09yZGVyEkAKDmRlbGl2ZXJ5X25vdGVzGAIgAygLMhkubG9naXN0'
    'aWMudjEuRGVsaXZlcnlOb3RlUg1kZWxpdmVyeU5vdGVzEjEKCGludm9pY2VzGAMgAygLMhUuZm'
    'luYW5jaWFsLnYxLkludm9pY2VSCGludm9pY2VzEjAKCHBheW1lbnRzGAQgAygLMhQucGF5bWVu'
    'dHMudjEuUGF5bWVudFIIcGF5bWVudHM=');

@$core.Deprecated('Use listSalesOrdersRequestDescriptor instead')
const ListSalesOrdersRequest$json = {
  '1': 'ListSalesOrdersRequest',
  '2': [
    {'1': 'customer_id', '3': 1, '4': 1, '5': 9, '10': 'customerId'},
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.order.v1.SalesOrderStatus',
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

/// Descriptor for `ListSalesOrdersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSalesOrdersRequestDescriptor = $convert.base64Decode(
    'ChZMaXN0U2FsZXNPcmRlcnNSZXF1ZXN0Eh8KC2N1c3RvbWVyX2lkGAEgASgJUgpjdXN0b21lck'
    'lkEjIKBnN0YXR1cxgCIAEoDjIaLm9yZGVyLnYxLlNhbGVzT3JkZXJTdGF0dXNSBnN0YXR1cxI5'
    'CgpzdGFydF9kYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3RhcnREYX'
    'RlEjUKCGVuZF9kYXRlGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIHZW5kRGF0'
    'ZRIbCglwYWdlX3NpemUYBSABKAVSCHBhZ2VTaXplEh8KC3BhZ2VfbnVtYmVyGAYgASgFUgpwYW'
    'dlTnVtYmVy');

@$core.Deprecated('Use listSalesOrdersResponseDescriptor instead')
const ListSalesOrdersResponse$json = {
  '1': 'ListSalesOrdersResponse',
  '2': [
    {
      '1': 'sales_orders',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.order.v1.SalesOrder',
      '10': 'salesOrders'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'total_value', '3': 3, '4': 1, '5': 3, '10': 'totalValue'},
  ],
};

/// Descriptor for `ListSalesOrdersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listSalesOrdersResponseDescriptor = $convert.base64Decode(
    'ChdMaXN0U2FsZXNPcmRlcnNSZXNwb25zZRI3CgxzYWxlc19vcmRlcnMYASADKAsyFC5vcmRlci'
    '52MS5TYWxlc09yZGVyUgtzYWxlc09yZGVycxIfCgt0b3RhbF9jb3VudBgCIAEoBVIKdG90YWxD'
    'b3VudBIfCgt0b3RhbF92YWx1ZRgDIAEoA1IKdG90YWxWYWx1ZQ==');

@$core.Deprecated('Use updateSalesOrderStatusRequestDescriptor instead')
const UpdateSalesOrderStatusRequest$json = {
  '1': 'UpdateSalesOrderStatusRequest',
  '2': [
    {'1': 'so_id', '3': 1, '4': 1, '5': 9, '10': 'soId'},
    {
      '1': 'new_status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.order.v1.SalesOrderStatus',
      '10': 'newStatus'
    },
    {
      '1': 'updated_by_user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'updatedByUserId'
    },
    {'1': 'notes', '3': 4, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `UpdateSalesOrderStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSalesOrderStatusRequestDescriptor = $convert.base64Decode(
    'Ch1VcGRhdGVTYWxlc09yZGVyU3RhdHVzUmVxdWVzdBITCgVzb19pZBgBIAEoCVIEc29JZBI5Cg'
    'puZXdfc3RhdHVzGAIgASgOMhoub3JkZXIudjEuU2FsZXNPcmRlclN0YXR1c1IJbmV3U3RhdHVz'
    'EisKEnVwZGF0ZWRfYnlfdXNlcl9pZBgDIAEoCVIPdXBkYXRlZEJ5VXNlcklkEhQKBW5vdGVzGA'
    'QgASgJUgVub3Rlcw==');

@$core.Deprecated('Use updateSalesOrderStatusResponseDescriptor instead')
const UpdateSalesOrderStatusResponse$json = {
  '1': 'UpdateSalesOrderStatusResponse',
  '2': [
    {
      '1': 'sales_order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.SalesOrder',
      '10': 'salesOrder'
    },
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdateSalesOrderStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateSalesOrderStatusResponseDescriptor =
    $convert.base64Decode(
        'Ch5VcGRhdGVTYWxlc09yZGVyU3RhdHVzUmVzcG9uc2USNQoLc2FsZXNfb3JkZXIYASABKAsyFC'
        '5vcmRlci52MS5TYWxlc09yZGVyUgpzYWxlc09yZGVyEhgKB21lc3NhZ2UYAiABKAlSB21lc3Nh'
        'Z2U=');

@$core.Deprecated('Use cancelSalesOrderRequestDescriptor instead')
const CancelSalesOrderRequest$json = {
  '1': 'CancelSalesOrderRequest',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {'1': 'reason', '3': 2, '4': 1, '5': 9, '10': 'reason'},
    {
      '1': 'cancelled_by_user_id',
      '3': 3,
      '4': 1,
      '5': 9,
      '10': 'cancelledByUserId'
    },
  ],
};

/// Descriptor for `CancelSalesOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelSalesOrderRequestDescriptor = $convert.base64Decode(
    'ChdDYW5jZWxTYWxlc09yZGVyUmVxdWVzdBIfCgtkb2N1bWVudF9pZBgBIAEoCVIKZG9jdW1lbn'
    'RJZBIWCgZyZWFzb24YAiABKAlSBnJlYXNvbhIvChRjYW5jZWxsZWRfYnlfdXNlcl9pZBgDIAEo'
    'CVIRY2FuY2VsbGVkQnlVc2VySWQ=');

@$core.Deprecated('Use cancelSalesOrderResponseDescriptor instead')
const CancelSalesOrderResponse$json = {
  '1': 'CancelSalesOrderResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CancelSalesOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelSalesOrderResponseDescriptor =
    $convert.base64Decode(
        'ChhDYW5jZWxTYWxlc09yZGVyUmVzcG9uc2USGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIYCg'
        'dtZXNzYWdlGAIgASgJUgdtZXNzYWdl');

@$core.Deprecated('Use createDeliveryNoteRequestDescriptor instead')
const CreateDeliveryNoteRequest$json = {
  '1': 'CreateDeliveryNoteRequest',
  '2': [
    {'1': 'sales_order_id', '3': 1, '4': 1, '5': 9, '10': 'salesOrderId'},
    {'1': 'carrier', '3': 2, '4': 1, '5': 9, '10': 'carrier'},
    {'1': 'tracking_number', '3': 3, '4': 1, '5': 9, '10': 'trackingNumber'},
    {
      '1': 'created_by_user_id',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
    {
      '1': 'items',
      '3': 5,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.DeliveryLineItem',
      '10': 'items'
    },
    {'1': 'notes', '3': 6, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `CreateDeliveryNoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDeliveryNoteRequestDescriptor = $convert.base64Decode(
    'ChlDcmVhdGVEZWxpdmVyeU5vdGVSZXF1ZXN0EiQKDnNhbGVzX29yZGVyX2lkGAEgASgJUgxzYW'
    'xlc09yZGVySWQSGAoHY2FycmllchgCIAEoCVIHY2FycmllchInCg90cmFja2luZ19udW1iZXIY'
    'AyABKAlSDnRyYWNraW5nTnVtYmVyEisKEmNyZWF0ZWRfYnlfdXNlcl9pZBgEIAEoCVIPY3JlYX'
    'RlZEJ5VXNlcklkEjMKBWl0ZW1zGAUgAygLMh0ubG9naXN0aWMudjEuRGVsaXZlcnlMaW5lSXRl'
    'bVIFaXRlbXMSFAoFbm90ZXMYBiABKAlSBW5vdGVz');

@$core.Deprecated('Use createDeliveryNoteResponseDescriptor instead')
const CreateDeliveryNoteResponse$json = {
  '1': 'CreateDeliveryNoteResponse',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {
      '1': 'delivery_note',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.logistic.v1.DeliveryNote',
      '10': 'deliveryNote'
    },
    {
      '1': 'inventory_transaction_ids',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'inventoryTransactionIds'
    },
    {'1': 'message', '3': 4, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateDeliveryNoteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createDeliveryNoteResponseDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVEZWxpdmVyeU5vdGVSZXNwb25zZRIfCgtkb2N1bWVudF9pZBgBIAEoCVIKZG9jdW'
    '1lbnRJZBI+Cg1kZWxpdmVyeV9ub3RlGAIgASgLMhkubG9naXN0aWMudjEuRGVsaXZlcnlOb3Rl'
    'UgxkZWxpdmVyeU5vdGUSOgoZaW52ZW50b3J5X3RyYW5zYWN0aW9uX2lkcxgDIAMoCVIXaW52ZW'
    '50b3J5VHJhbnNhY3Rpb25JZHMSGAoHbWVzc2FnZRgEIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use createInvoiceFromSalesOrderRequestDescriptor instead')
const CreateInvoiceFromSalesOrderRequest$json = {
  '1': 'CreateInvoiceFromSalesOrderRequest',
  '2': [
    {'1': 'sales_order_id', '3': 1, '4': 1, '5': 9, '10': 'salesOrderId'},
    {'1': 'delivery_note_id', '3': 2, '4': 1, '5': 9, '10': 'deliveryNoteId'},
    {
      '1': 'due_date',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'dueDate'
    },
    {'1': 'payment_terms', '3': 4, '4': 1, '5': 9, '10': 'paymentTerms'},
    {
      '1': 'created_by_user_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
  ],
};

/// Descriptor for `CreateInvoiceFromSalesOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInvoiceFromSalesOrderRequestDescriptor =
    $convert.base64Decode(
        'CiJDcmVhdGVJbnZvaWNlRnJvbVNhbGVzT3JkZXJSZXF1ZXN0EiQKDnNhbGVzX29yZGVyX2lkGA'
        'EgASgJUgxzYWxlc09yZGVySWQSKAoQZGVsaXZlcnlfbm90ZV9pZBgCIAEoCVIOZGVsaXZlcnlO'
        'b3RlSWQSNQoIZHVlX2RhdGUYAyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdkdW'
        'VEYXRlEiMKDXBheW1lbnRfdGVybXMYBCABKAlSDHBheW1lbnRUZXJtcxIrChJjcmVhdGVkX2J5'
        'X3VzZXJfaWQYBSABKAlSD2NyZWF0ZWRCeVVzZXJJZA==');

@$core.Deprecated('Use createInvoiceFromSalesOrderResponseDescriptor instead')
const CreateInvoiceFromSalesOrderResponse$json = {
  '1': 'CreateInvoiceFromSalesOrderResponse',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '10': 'documentId'},
    {
      '1': 'invoice',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.financial.v1.Invoice',
      '10': 'invoice'
    },
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateInvoiceFromSalesOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createInvoiceFromSalesOrderResponseDescriptor =
    $convert.base64Decode(
        'CiNDcmVhdGVJbnZvaWNlRnJvbVNhbGVzT3JkZXJSZXNwb25zZRIfCgtkb2N1bWVudF9pZBgBIA'
        'EoCVIKZG9jdW1lbnRJZBIvCgdpbnZvaWNlGAIgASgLMhUuZmluYW5jaWFsLnYxLkludm9pY2VS'
        'B2ludm9pY2USGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZQ==');

const $core.Map<$core.String, $core.dynamic> SalesOrderServiceBase$json = {
  '1': 'SalesOrderService',
  '2': [
    {
      '1': 'CreateSalesOrder',
      '2': '.order.v1.CreateSalesOrderRequest',
      '3': '.order.v1.CreateSalesOrderResponse'
    },
    {
      '1': 'GetSalesOrder',
      '2': '.order.v1.GetSalesOrderRequest',
      '3': '.order.v1.GetSalesOrderResponse'
    },
    {
      '1': 'ListSalesOrders',
      '2': '.order.v1.ListSalesOrdersRequest',
      '3': '.order.v1.ListSalesOrdersResponse'
    },
    {
      '1': 'UpdateSalesOrderStatus',
      '2': '.order.v1.UpdateSalesOrderStatusRequest',
      '3': '.order.v1.UpdateSalesOrderStatusResponse'
    },
    {
      '1': 'CancelSalesOrder',
      '2': '.order.v1.CancelSalesOrderRequest',
      '3': '.order.v1.CancelSalesOrderResponse'
    },
    {
      '1': 'CreateDeliveryNote',
      '2': '.order.v1.CreateDeliveryNoteRequest',
      '3': '.order.v1.CreateDeliveryNoteResponse'
    },
    {
      '1': 'CreateInvoiceFromSalesOrder',
      '2': '.order.v1.CreateInvoiceFromSalesOrderRequest',
      '3': '.order.v1.CreateInvoiceFromSalesOrderResponse'
    },
  ],
};

@$core.Deprecated('Use salesOrderServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    SalesOrderServiceBase$messageJson = {
  '.order.v1.CreateSalesOrderRequest': CreateSalesOrderRequest$json,
  '.order.v1.OrderLineItem': $0.OrderLineItem$json,
  '.inventory.v1.Internationalized': $5.Internationalized$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.order.v1.CreateSalesOrderResponse': CreateSalesOrderResponse$json,
  '.order.v1.SalesOrder': SalesOrder$json,
  '.order.v1.OrderPrices': $0.OrderPrices$json,
  '.order.v1.GetSalesOrderRequest': GetSalesOrderRequest$json,
  '.order.v1.GetSalesOrderResponse': GetSalesOrderResponse$json,
  '.logistic.v1.DeliveryNote': $2.DeliveryNote$json,
  '.logistic.v1.DeliveryLineItem': $2.DeliveryLineItem$json,
  '.financial.v1.Invoice': $3.Invoice$json,
  '.financial.v1.InvoiceLineItem': $6.InvoiceLineItem$json,
  '.payments.v1.Payment': $4.Payment$json,
  '.order.v1.ListSalesOrdersRequest': ListSalesOrdersRequest$json,
  '.order.v1.ListSalesOrdersResponse': ListSalesOrdersResponse$json,
  '.order.v1.UpdateSalesOrderStatusRequest': UpdateSalesOrderStatusRequest$json,
  '.order.v1.UpdateSalesOrderStatusResponse':
      UpdateSalesOrderStatusResponse$json,
  '.order.v1.CancelSalesOrderRequest': CancelSalesOrderRequest$json,
  '.order.v1.CancelSalesOrderResponse': CancelSalesOrderResponse$json,
  '.order.v1.CreateDeliveryNoteRequest': CreateDeliveryNoteRequest$json,
  '.order.v1.CreateDeliveryNoteResponse': CreateDeliveryNoteResponse$json,
  '.order.v1.CreateInvoiceFromSalesOrderRequest':
      CreateInvoiceFromSalesOrderRequest$json,
  '.order.v1.CreateInvoiceFromSalesOrderResponse':
      CreateInvoiceFromSalesOrderResponse$json,
};

/// Descriptor for `SalesOrderService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List salesOrderServiceDescriptor = $convert.base64Decode(
    'ChFTYWxlc09yZGVyU2VydmljZRJZChBDcmVhdGVTYWxlc09yZGVyEiEub3JkZXIudjEuQ3JlYX'
    'RlU2FsZXNPcmRlclJlcXVlc3QaIi5vcmRlci52MS5DcmVhdGVTYWxlc09yZGVyUmVzcG9uc2US'
    'UAoNR2V0U2FsZXNPcmRlchIeLm9yZGVyLnYxLkdldFNhbGVzT3JkZXJSZXF1ZXN0Gh8ub3JkZX'
    'IudjEuR2V0U2FsZXNPcmRlclJlc3BvbnNlElYKD0xpc3RTYWxlc09yZGVycxIgLm9yZGVyLnYx'
    'Lkxpc3RTYWxlc09yZGVyc1JlcXVlc3QaIS5vcmRlci52MS5MaXN0U2FsZXNPcmRlcnNSZXNwb2'
    '5zZRJrChZVcGRhdGVTYWxlc09yZGVyU3RhdHVzEicub3JkZXIudjEuVXBkYXRlU2FsZXNPcmRl'
    'clN0YXR1c1JlcXVlc3QaKC5vcmRlci52MS5VcGRhdGVTYWxlc09yZGVyU3RhdHVzUmVzcG9uc2'
    'USWQoQQ2FuY2VsU2FsZXNPcmRlchIhLm9yZGVyLnYxLkNhbmNlbFNhbGVzT3JkZXJSZXF1ZXN0'
    'GiIub3JkZXIudjEuQ2FuY2VsU2FsZXNPcmRlclJlc3BvbnNlEl8KEkNyZWF0ZURlbGl2ZXJ5Tm'
    '90ZRIjLm9yZGVyLnYxLkNyZWF0ZURlbGl2ZXJ5Tm90ZVJlcXVlc3QaJC5vcmRlci52MS5DcmVh'
    'dGVEZWxpdmVyeU5vdGVSZXNwb25zZRJ6ChtDcmVhdGVJbnZvaWNlRnJvbVNhbGVzT3JkZXISLC'
    '5vcmRlci52MS5DcmVhdGVJbnZvaWNlRnJvbVNhbGVzT3JkZXJSZXF1ZXN0Gi0ub3JkZXIudjEu'
    'Q3JlYXRlSW52b2ljZUZyb21TYWxlc09yZGVyUmVzcG9uc2U=');
