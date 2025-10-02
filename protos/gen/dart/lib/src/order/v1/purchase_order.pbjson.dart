// This is a generated file - do not edit.
//
// Generated from order/v1/purchase_order.proto.

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
import '../../logistic/v1/receiving_notes.pbjson.dart' as $2;
import '../../payments/v1/payments.pbjson.dart' as $4;
import 'order_utils.pbjson.dart' as $0;

@$core.Deprecated('Use purchaseOrderStatusDescriptor instead')
const PurchaseOrderStatus$json = {
  '1': 'PurchaseOrderStatus',
  '2': [
    {'1': 'PO_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PO_STATUS_DRAFT', '2': 1},
    {'1': 'PO_STATUS_PENDING', '2': 2},
    {'1': 'PO_STATUS_PARTIALLY_RECEIVED', '2': 3},
    {'1': 'PO_STATUS_RECEIVED', '2': 4},
    {'1': 'PO_STATUS_CANCELLED', '2': 5},
  ],
};

/// Descriptor for `PurchaseOrderStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List purchaseOrderStatusDescriptor = $convert.base64Decode(
    'ChNQdXJjaGFzZU9yZGVyU3RhdHVzEhkKFVBPX1NUQVRVU19VTlNQRUNJRklFRBAAEhMKD1BPX1'
    'NUQVRVU19EUkFGVBABEhUKEVBPX1NUQVRVU19QRU5ESU5HEAISIAocUE9fU1RBVFVTX1BBUlRJ'
    'QUxMWV9SRUNFSVZFRBADEhYKElBPX1NUQVRVU19SRUNFSVZFRBAEEhcKE1BPX1NUQVRVU19DQU'
    '5DRUxMRUQQBQ==');

@$core.Deprecated('Use purchaseOrderDescriptor instead')
const PurchaseOrder$json = {
  '1': 'PurchaseOrder',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {'1': 'supplier_id', '3': 2, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'buyer_id', '3': 3, '4': 1, '5': 9, '10': 'buyerId'},
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.order.v1.PurchaseOrderStatus',
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
    {'1': 'total_amount', '3': 7, '4': 1, '5': 1, '10': 'totalAmount'},
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
      '1': 'expected_delivery_date',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'expectedDeliveryDate',
      '17': true
    },
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_expected_delivery_date'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `PurchaseOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchaseOrderDescriptor = $convert.base64Decode(
    'Cg1QdXJjaGFzZU9yZGVyEicKC2RvY3VtZW50X2lkGAEgASgJQga6SAPIAQFSCmRvY3VtZW50SW'
    'QSHwoLc3VwcGxpZXJfaWQYAiABKAlSCnN1cHBsaWVySWQSGQoIYnV5ZXJfaWQYAyABKAlSB2J1'
    'eWVySWQSNQoGc3RhdHVzGAUgASgOMh0ub3JkZXIudjEuUHVyY2hhc2VPcmRlclN0YXR1c1IGc3'
    'RhdHVzEi0KBWl0ZW1zGAYgAygLMhcub3JkZXIudjEuT3JkZXJMaW5lSXRlbVIFaXRlbXMSIQoM'
    'dG90YWxfYW1vdW50GAcgASgBUgt0b3RhbEFtb3VudBIfCghjdXJyZW5jeRgIIAEoCUgAUghjdX'
    'JyZW5jeYgBARIrChJjcmVhdGVkX2J5X3VzZXJfaWQYCSABKAlSD2NyZWF0ZWRCeVVzZXJJZBI5'
    'CgpjcmVhdGVkX2F0GAogASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZE'
    'F0ElUKFmV4cGVjdGVkX2RlbGl2ZXJ5X2RhdGUYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGlt'
    'ZXN0YW1wSAFSFGV4cGVjdGVkRGVsaXZlcnlEYXRliAEBEhkKBW5vdGVzGAwgASgJSAJSBW5vdG'
    'VziAEBQgsKCV9jdXJyZW5jeUIZChdfZXhwZWN0ZWRfZGVsaXZlcnlfZGF0ZUIICgZfbm90ZXM=');

@$core.Deprecated('Use cancelPurchaseOrderResponseDescriptor instead')
const CancelPurchaseOrderResponse$json = {
  '1': 'CancelPurchaseOrderResponse',
  '2': [
    {
      '1': 'purchase_order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.PurchaseOrder',
      '10': 'purchaseOrder'
    },
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CancelPurchaseOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelPurchaseOrderResponseDescriptor =
    $convert.base64Decode(
        'ChtDYW5jZWxQdXJjaGFzZU9yZGVyUmVzcG9uc2USPgoOcHVyY2hhc2Vfb3JkZXIYASABKAsyFy'
        '5vcmRlci52MS5QdXJjaGFzZU9yZGVyUg1wdXJjaGFzZU9yZGVyEhgKB21lc3NhZ2UYAiABKAlS'
        'B21lc3NhZ2U=');

@$core.Deprecated('Use createPurchaseOrderRequestDescriptor instead')
const CreatePurchaseOrderRequest$json = {
  '1': 'CreatePurchaseOrderRequest',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'buyer_id', '3': 2, '4': 1, '5': 9, '10': 'buyerId'},
    {
      '1': 'destination_address',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'destinationAddress',
      '17': true
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
      '1': 'expected_delivery_date',
      '3': 5,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'expectedDeliveryDate'
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
  '8': [
    {'1': '_destination_address'},
  ],
};

/// Descriptor for `CreatePurchaseOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPurchaseOrderRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVQdXJjaGFzZU9yZGVyUmVxdWVzdBIfCgtzdXBwbGllcl9pZBgBIAEoCVIKc3VwcG'
    'xpZXJJZBIZCghidXllcl9pZBgCIAEoCVIHYnV5ZXJJZBI0ChNkZXN0aW5hdGlvbl9hZGRyZXNz'
    'GAMgASgJSABSEmRlc3RpbmF0aW9uQWRkcmVzc4gBARItCgVpdGVtcxgEIAMoCzIXLm9yZGVyLn'
    'YxLk9yZGVyTGluZUl0ZW1SBWl0ZW1zElAKFmV4cGVjdGVkX2RlbGl2ZXJ5X2RhdGUYBSABKAsy'
    'Gi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUhRleHBlY3RlZERlbGl2ZXJ5RGF0ZRIrChJjcm'
    'VhdGVkX2J5X3VzZXJfaWQYBiABKAlSD2NyZWF0ZWRCeVVzZXJJZBIUCgVub3RlcxgHIAEoCVIF'
    'bm90ZXNCFgoUX2Rlc3RpbmF0aW9uX2FkZHJlc3M=');

@$core.Deprecated('Use createPurchaseOrderResponseDescriptor instead')
const CreatePurchaseOrderResponse$json = {
  '1': 'CreatePurchaseOrderResponse',
  '2': [
    {'1': 'purchase_order_id', '3': 1, '4': 1, '5': 9, '10': 'purchaseOrderId'},
    {
      '1': 'purchase_order',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.order.v1.PurchaseOrder',
      '10': 'purchaseOrder'
    },
    {'1': 'message', '3': 3, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreatePurchaseOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPurchaseOrderResponseDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVQdXJjaGFzZU9yZGVyUmVzcG9uc2USKgoRcHVyY2hhc2Vfb3JkZXJfaWQYASABKA'
    'lSD3B1cmNoYXNlT3JkZXJJZBI+Cg5wdXJjaGFzZV9vcmRlchgCIAEoCzIXLm9yZGVyLnYxLlB1'
    'cmNoYXNlT3JkZXJSDXB1cmNoYXNlT3JkZXISGAoHbWVzc2FnZRgDIAEoCVIHbWVzc2FnZQ==');

@$core.Deprecated('Use getPurchaseOrderRequestDescriptor instead')
const GetPurchaseOrderRequest$json = {
  '1': 'GetPurchaseOrderRequest',
  '2': [
    {'1': 'purchase_order_id', '3': 1, '4': 1, '5': 9, '10': 'purchaseOrderId'},
  ],
};

/// Descriptor for `GetPurchaseOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPurchaseOrderRequestDescriptor =
    $convert.base64Decode(
        'ChdHZXRQdXJjaGFzZU9yZGVyUmVxdWVzdBIqChFwdXJjaGFzZV9vcmRlcl9pZBgBIAEoCVIPcH'
        'VyY2hhc2VPcmRlcklk');

@$core.Deprecated('Use getPurchaseOrderResponseDescriptor instead')
const GetPurchaseOrderResponse$json = {
  '1': 'GetPurchaseOrderResponse',
  '2': [
    {
      '1': 'purchase_order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.PurchaseOrder',
      '10': 'purchaseOrder'
    },
    {
      '1': 'receiving_notes',
      '3': 2,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.ReceivingNote',
      '10': 'receivingNotes'
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

/// Descriptor for `GetPurchaseOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPurchaseOrderResponseDescriptor = $convert.base64Decode(
    'ChhHZXRQdXJjaGFzZU9yZGVyUmVzcG9uc2USPgoOcHVyY2hhc2Vfb3JkZXIYASABKAsyFy5vcm'
    'Rlci52MS5QdXJjaGFzZU9yZGVyUg1wdXJjaGFzZU9yZGVyEkMKD3JlY2VpdmluZ19ub3RlcxgC'
    'IAMoCzIaLmxvZ2lzdGljLnYxLlJlY2VpdmluZ05vdGVSDnJlY2VpdmluZ05vdGVzEjEKCGludm'
    '9pY2VzGAMgAygLMhUuZmluYW5jaWFsLnYxLkludm9pY2VSCGludm9pY2VzEjAKCHBheW1lbnRz'
    'GAQgAygLMhQucGF5bWVudHMudjEuUGF5bWVudFIIcGF5bWVudHM=');

@$core.Deprecated('Use listPurchaseOrdersRequestDescriptor instead')
const ListPurchaseOrdersRequest$json = {
  '1': 'ListPurchaseOrdersRequest',
  '2': [
    {'1': 'supplier_id', '3': 1, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'buyer_id', '3': 2, '4': 1, '5': 9, '10': 'buyerId'},
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

/// Descriptor for `ListPurchaseOrdersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPurchaseOrdersRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0UHVyY2hhc2VPcmRlcnNSZXF1ZXN0Eh8KC3N1cHBsaWVyX2lkGAEgASgJUgpzdXBwbG'
    'llcklkEhkKCGJ1eWVyX2lkGAIgASgJUgdidXllcklkEjkKCnN0YXJ0X2RhdGUYAyABKAsyGi5n'
    'b29nbGUucHJvdG9idWYuVGltZXN0YW1wUglzdGFydERhdGUSNQoIZW5kX2RhdGUYBCABKAsyGi'
    '5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgdlbmREYXRlEhsKCXBhZ2Vfc2l6ZRgFIAEoBVII'
    'cGFnZVNpemUSHwoLcGFnZV9udW1iZXIYBiABKAVSCnBhZ2VOdW1iZXI=');

@$core.Deprecated('Use listPurchaseOrdersResponseDescriptor instead')
const ListPurchaseOrdersResponse$json = {
  '1': 'ListPurchaseOrdersResponse',
  '2': [
    {
      '1': 'purchase_orders',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.order.v1.PurchaseOrder',
      '10': 'purchaseOrders'
    },
    {'1': 'total_count', '3': 2, '4': 1, '5': 5, '10': 'totalCount'},
    {'1': 'total_value', '3': 3, '4': 1, '5': 1, '10': 'totalValue'},
  ],
};

/// Descriptor for `ListPurchaseOrdersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPurchaseOrdersResponseDescriptor =
    $convert.base64Decode(
        'ChpMaXN0UHVyY2hhc2VPcmRlcnNSZXNwb25zZRJACg9wdXJjaGFzZV9vcmRlcnMYASADKAsyFy'
        '5vcmRlci52MS5QdXJjaGFzZU9yZGVyUg5wdXJjaGFzZU9yZGVycxIfCgt0b3RhbF9jb3VudBgC'
        'IAEoBVIKdG90YWxDb3VudBIfCgt0b3RhbF92YWx1ZRgDIAEoAVIKdG90YWxWYWx1ZQ==');

@$core.Deprecated('Use updatePurchaseOrderStatusRequestDescriptor instead')
const UpdatePurchaseOrderStatusRequest$json = {
  '1': 'UpdatePurchaseOrderStatusRequest',
  '2': [
    {'1': 'purchase_order_id', '3': 1, '4': 1, '5': 9, '10': 'purchaseOrderId'},
    {
      '1': 'new_status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.order.v1.PurchaseOrderStatus',
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

/// Descriptor for `UpdatePurchaseOrderStatusRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePurchaseOrderStatusRequestDescriptor =
    $convert.base64Decode(
        'CiBVcGRhdGVQdXJjaGFzZU9yZGVyU3RhdHVzUmVxdWVzdBIqChFwdXJjaGFzZV9vcmRlcl9pZB'
        'gBIAEoCVIPcHVyY2hhc2VPcmRlcklkEjwKCm5ld19zdGF0dXMYAiABKA4yHS5vcmRlci52MS5Q'
        'dXJjaGFzZU9yZGVyU3RhdHVzUgluZXdTdGF0dXMSKwoSdXBkYXRlZF9ieV91c2VyX2lkGAMgAS'
        'gJUg91cGRhdGVkQnlVc2VySWQSFAoFbm90ZXMYBCABKAlSBW5vdGVz');

@$core.Deprecated('Use updatePurchaseOrderStatusResponseDescriptor instead')
const UpdatePurchaseOrderStatusResponse$json = {
  '1': 'UpdatePurchaseOrderStatusResponse',
  '2': [
    {
      '1': 'purchase_order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.PurchaseOrder',
      '10': 'purchaseOrder'
    },
    {'1': 'message', '3': 2, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `UpdatePurchaseOrderStatusResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updatePurchaseOrderStatusResponseDescriptor =
    $convert.base64Decode(
        'CiFVcGRhdGVQdXJjaGFzZU9yZGVyU3RhdHVzUmVzcG9uc2USPgoOcHVyY2hhc2Vfb3JkZXIYAS'
        'ABKAsyFy5vcmRlci52MS5QdXJjaGFzZU9yZGVyUg1wdXJjaGFzZU9yZGVyEhgKB21lc3NhZ2UY'
        'AiABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use cancelPurchaseOrderRequestDescriptor instead')
const CancelPurchaseOrderRequest$json = {
  '1': 'CancelPurchaseOrderRequest',
  '2': [
    {'1': 'purchase_order_id', '3': 1, '4': 1, '5': 9, '10': 'purchaseOrderId'},
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

/// Descriptor for `CancelPurchaseOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List cancelPurchaseOrderRequestDescriptor =
    $convert.base64Decode(
        'ChpDYW5jZWxQdXJjaGFzZU9yZGVyUmVxdWVzdBIqChFwdXJjaGFzZV9vcmRlcl9pZBgBIAEoCV'
        'IPcHVyY2hhc2VPcmRlcklkEhYKBnJlYXNvbhgCIAEoCVIGcmVhc29uEi8KFGNhbmNlbGxlZF9i'
        'eV91c2VyX2lkGAMgASgJUhFjYW5jZWxsZWRCeVVzZXJJZA==');

@$core.Deprecated('Use createReceivingNoteRequestDescriptor instead')
const CreateReceivingNoteRequest$json = {
  '1': 'CreateReceivingNoteRequest',
  '2': [
    {'1': 'purchase_order_id', '3': 1, '4': 1, '5': 9, '10': 'purchaseOrderId'},
    {'1': 'supplier_id', '3': 2, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'buyer_id', '3': 3, '4': 1, '5': 9, '10': 'buyerId'},
    {
      '1': 'items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.ReceivingLineItem',
      '10': 'items'
    },
    {
      '1': 'received_by_user_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '10': 'receivedByUserId'
    },
    {'1': 'notes', '3': 6, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `CreateReceivingNoteRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReceivingNoteRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVSZWNlaXZpbmdOb3RlUmVxdWVzdBIqChFwdXJjaGFzZV9vcmRlcl9pZBgBIAEoCV'
    'IPcHVyY2hhc2VPcmRlcklkEh8KC3N1cHBsaWVyX2lkGAIgASgJUgpzdXBwbGllcklkEhkKCGJ1'
    'eWVyX2lkGAMgASgJUgdidXllcklkEjQKBWl0ZW1zGAQgAygLMh4ubG9naXN0aWMudjEuUmVjZW'
    'l2aW5nTGluZUl0ZW1SBWl0ZW1zEi0KE3JlY2VpdmVkX2J5X3VzZXJfaWQYBSABKAlSEHJlY2Vp'
    'dmVkQnlVc2VySWQSFAoFbm90ZXMYBiABKAlSBW5vdGVz');

@$core.Deprecated('Use createReceivingNoteResponseDescriptor instead')
const CreateReceivingNoteResponse$json = {
  '1': 'CreateReceivingNoteResponse',
  '2': [
    {'1': 'rn_id', '3': 1, '4': 1, '5': 9, '10': 'rnId'},
    {
      '1': 'receiving_note',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.logistic.v1.ReceivingNote',
      '10': 'receivingNote'
    },
    {
      '1': 'inventory_transaction_ids',
      '3': 3,
      '4': 3,
      '5': 9,
      '10': 'inventoryTransactionIds'
    },
    {
      '1': 'has_discrepancies',
      '3': 4,
      '4': 1,
      '5': 8,
      '10': 'hasDiscrepancies'
    },
    {
      '1': 'discrepancy_product_ids',
      '3': 5,
      '4': 3,
      '5': 9,
      '10': 'discrepancyProductIds'
    },
    {'1': 'message', '3': 6, '4': 1, '5': 9, '10': 'message'},
  ],
};

/// Descriptor for `CreateReceivingNoteResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createReceivingNoteResponseDescriptor = $convert.base64Decode(
    'ChtDcmVhdGVSZWNlaXZpbmdOb3RlUmVzcG9uc2USEwoFcm5faWQYASABKAlSBHJuSWQSQQoOcm'
    'VjZWl2aW5nX25vdGUYAiABKAsyGi5sb2dpc3RpYy52MS5SZWNlaXZpbmdOb3RlUg1yZWNlaXZp'
    'bmdOb3RlEjoKGWludmVudG9yeV90cmFuc2FjdGlvbl9pZHMYAyADKAlSF2ludmVudG9yeVRyYW'
    '5zYWN0aW9uSWRzEisKEWhhc19kaXNjcmVwYW5jaWVzGAQgASgIUhBoYXNEaXNjcmVwYW5jaWVz'
    'EjYKF2Rpc2NyZXBhbmN5X3Byb2R1Y3RfaWRzGAUgAygJUhVkaXNjcmVwYW5jeVByb2R1Y3RJZH'
    'MSGAoHbWVzc2FnZRgGIAEoCVIHbWVzc2FnZQ==');

const $core.Map<$core.String, $core.dynamic> PurchaseOrderServiceBase$json = {
  '1': 'PurchaseOrderService',
  '2': [
    {
      '1': 'CreatePurchaseOrder',
      '2': '.order.v1.CreatePurchaseOrderRequest',
      '3': '.order.v1.CreatePurchaseOrderResponse'
    },
    {
      '1': 'GetPurchaseOrder',
      '2': '.order.v1.GetPurchaseOrderRequest',
      '3': '.order.v1.GetPurchaseOrderResponse'
    },
    {
      '1': 'ListPurchaseOrders',
      '2': '.order.v1.ListPurchaseOrdersRequest',
      '3': '.order.v1.ListPurchaseOrdersResponse'
    },
    {
      '1': 'UpdatePurchaseOrderStatus',
      '2': '.order.v1.UpdatePurchaseOrderStatusRequest',
      '3': '.order.v1.UpdatePurchaseOrderStatusResponse'
    },
    {
      '1': 'CancelPurchaseOrder',
      '2': '.order.v1.CancelPurchaseOrderRequest',
      '3': '.order.v1.CancelPurchaseOrderResponse'
    },
    {
      '1': 'CreateReceivingNote',
      '2': '.order.v1.CreateReceivingNoteRequest',
      '3': '.order.v1.CreateReceivingNoteResponse'
    },
  ],
};

@$core.Deprecated('Use purchaseOrderServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PurchaseOrderServiceBase$messageJson = {
  '.order.v1.CreatePurchaseOrderRequest': CreatePurchaseOrderRequest$json,
  '.order.v1.OrderLineItem': $0.OrderLineItem$json,
  '.inventory.v1.Internationalized': $5.Internationalized$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.order.v1.CreatePurchaseOrderResponse': CreatePurchaseOrderResponse$json,
  '.order.v1.PurchaseOrder': PurchaseOrder$json,
  '.order.v1.GetPurchaseOrderRequest': GetPurchaseOrderRequest$json,
  '.order.v1.GetPurchaseOrderResponse': GetPurchaseOrderResponse$json,
  '.logistic.v1.ReceivingNote': $2.ReceivingNote$json,
  '.logistic.v1.ReceivingLineItem': $2.ReceivingLineItem$json,
  '.financial.v1.Invoice': $3.Invoice$json,
  '.financial.v1.InvoiceLineItem': $6.InvoiceLineItem$json,
  '.payments.v1.Payment': $4.Payment$json,
  '.order.v1.ListPurchaseOrdersRequest': ListPurchaseOrdersRequest$json,
  '.order.v1.ListPurchaseOrdersResponse': ListPurchaseOrdersResponse$json,
  '.order.v1.UpdatePurchaseOrderStatusRequest':
      UpdatePurchaseOrderStatusRequest$json,
  '.order.v1.UpdatePurchaseOrderStatusResponse':
      UpdatePurchaseOrderStatusResponse$json,
  '.order.v1.CancelPurchaseOrderRequest': CancelPurchaseOrderRequest$json,
  '.order.v1.CancelPurchaseOrderResponse': CancelPurchaseOrderResponse$json,
  '.order.v1.CreateReceivingNoteRequest': CreateReceivingNoteRequest$json,
  '.order.v1.CreateReceivingNoteResponse': CreateReceivingNoteResponse$json,
};

/// Descriptor for `PurchaseOrderService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List purchaseOrderServiceDescriptor = $convert.base64Decode(
    'ChRQdXJjaGFzZU9yZGVyU2VydmljZRJiChNDcmVhdGVQdXJjaGFzZU9yZGVyEiQub3JkZXIudj'
    'EuQ3JlYXRlUHVyY2hhc2VPcmRlclJlcXVlc3QaJS5vcmRlci52MS5DcmVhdGVQdXJjaGFzZU9y'
    'ZGVyUmVzcG9uc2USWQoQR2V0UHVyY2hhc2VPcmRlchIhLm9yZGVyLnYxLkdldFB1cmNoYXNlT3'
    'JkZXJSZXF1ZXN0GiIub3JkZXIudjEuR2V0UHVyY2hhc2VPcmRlclJlc3BvbnNlEl8KEkxpc3RQ'
    'dXJjaGFzZU9yZGVycxIjLm9yZGVyLnYxLkxpc3RQdXJjaGFzZU9yZGVyc1JlcXVlc3QaJC5vcm'
    'Rlci52MS5MaXN0UHVyY2hhc2VPcmRlcnNSZXNwb25zZRJ0ChlVcGRhdGVQdXJjaGFzZU9yZGVy'
    'U3RhdHVzEioub3JkZXIudjEuVXBkYXRlUHVyY2hhc2VPcmRlclN0YXR1c1JlcXVlc3QaKy5vcm'
    'Rlci52MS5VcGRhdGVQdXJjaGFzZU9yZGVyU3RhdHVzUmVzcG9uc2USYgoTQ2FuY2VsUHVyY2hh'
    'c2VPcmRlchIkLm9yZGVyLnYxLkNhbmNlbFB1cmNoYXNlT3JkZXJSZXF1ZXN0GiUub3JkZXIudj'
    'EuQ2FuY2VsUHVyY2hhc2VPcmRlclJlc3BvbnNlEmIKE0NyZWF0ZVJlY2VpdmluZ05vdGUSJC5v'
    'cmRlci52MS5DcmVhdGVSZWNlaXZpbmdOb3RlUmVxdWVzdBolLm9yZGVyLnYxLkNyZWF0ZVJlY2'
    'VpdmluZ05vdGVSZXNwb25zZQ==');
