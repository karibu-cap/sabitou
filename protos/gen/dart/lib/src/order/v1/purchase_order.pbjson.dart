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

import '../../financial/v1/financial_utils.pbjson.dart' as $7;
import '../../financial/v1/invoice.pbjson.dart' as $3;
import '../../google/protobuf/timestamp.pbjson.dart' as $1;
import '../../inventory/v1/category.pbjson.dart' as $6;
import '../../inventory/v1/store_product.pbjson.dart' as $5;
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
    {'1': 'buyer_id_id', '3': 3, '4': 1, '5': 9, '10': 'buyerIdId'},
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
    'QSHwoLc3VwcGxpZXJfaWQYAiABKAlSCnN1cHBsaWVySWQSHgoLYnV5ZXJfaWRfaWQYAyABKAlS'
    'CWJ1eWVySWRJZBI1CgZzdGF0dXMYBSABKA4yHS5vcmRlci52MS5QdXJjaGFzZU9yZGVyU3RhdH'
    'VzUgZzdGF0dXMSLQoFaXRlbXMYBiADKAsyFy5vcmRlci52MS5PcmRlckxpbmVJdGVtUgVpdGVt'
    'cxIhCgx0b3RhbF9hbW91bnQYByABKAFSC3RvdGFsQW1vdW50Eh8KCGN1cnJlbmN5GAggASgJSA'
    'BSCGN1cnJlbmN5iAEBEisKEmNyZWF0ZWRfYnlfdXNlcl9pZBgJIAEoCVIPY3JlYXRlZEJ5VXNl'
    'cklkEjkKCmNyZWF0ZWRfYXQYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcm'
    'VhdGVkQXQSVQoWZXhwZWN0ZWRfZGVsaXZlcnlfZGF0ZRgLIAEoCzIaLmdvb2dsZS5wcm90b2J1'
    'Zi5UaW1lc3RhbXBIAVIUZXhwZWN0ZWREZWxpdmVyeURhdGWIAQESGQoFbm90ZXMYDCABKAlIAl'
    'IFbm90ZXOIAQFCCwoJX2N1cnJlbmN5QhkKF19leHBlY3RlZF9kZWxpdmVyeV9kYXRlQggKBl9u'
    'b3Rlcw==');

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
    {'1': 'destination_id', '3': 3, '4': 1, '5': 9, '10': 'destinationId'},
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
};

/// Descriptor for `CreatePurchaseOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createPurchaseOrderRequestDescriptor = $convert.base64Decode(
    'ChpDcmVhdGVQdXJjaGFzZU9yZGVyUmVxdWVzdBIfCgtzdXBwbGllcl9pZBgBIAEoCVIKc3VwcG'
    'xpZXJJZBIZCghidXllcl9pZBgCIAEoCVIHYnV5ZXJJZBIlCg5kZXN0aW5hdGlvbl9pZBgDIAEo'
    'CVINZGVzdGluYXRpb25JZBItCgVpdGVtcxgEIAMoCzIXLm9yZGVyLnYxLk9yZGVyTGluZUl0ZW'
    '1SBWl0ZW1zElAKFmV4cGVjdGVkX2RlbGl2ZXJ5X2RhdGUYBSABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUhRleHBlY3RlZERlbGl2ZXJ5RGF0ZRIrChJjcmVhdGVkX2J5X3VzZXJfaW'
    'QYBiABKAlSD2NyZWF0ZWRCeVVzZXJJZBIUCgVub3RlcxgHIAEoCVIFbm90ZXM=');

@$core.Deprecated('Use createPurchaseOrderResponseDescriptor instead')
const CreatePurchaseOrderResponse$json = {
  '1': 'CreatePurchaseOrderResponse',
  '2': [
    {'1': 'po_id', '3': 1, '4': 1, '5': 9, '10': 'poId'},
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
final $typed_data.Uint8List createPurchaseOrderResponseDescriptor =
    $convert.base64Decode(
        'ChtDcmVhdGVQdXJjaGFzZU9yZGVyUmVzcG9uc2USEwoFcG9faWQYASABKAlSBHBvSWQSPgoOcH'
        'VyY2hhc2Vfb3JkZXIYAiABKAsyFy5vcmRlci52MS5QdXJjaGFzZU9yZGVyUg1wdXJjaGFzZU9y'
        'ZGVyEhgKB21lc3NhZ2UYAyABKAlSB21lc3NhZ2U=');

@$core.Deprecated('Use getPurchaseOrderRequestDescriptor instead')
const GetPurchaseOrderRequest$json = {
  '1': 'GetPurchaseOrderRequest',
  '2': [
    {'1': 'po_id', '3': 1, '4': 1, '5': 9, '10': 'poId'},
  ],
};

/// Descriptor for `GetPurchaseOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getPurchaseOrderRequestDescriptor =
    $convert.base64Decode(
        'ChdHZXRQdXJjaGFzZU9yZGVyUmVxdWVzdBITCgVwb19pZBgBIAEoCVIEcG9JZA==');

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
    {
      '1': 'status',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.order.v1.PurchaseOrderStatus',
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

/// Descriptor for `ListPurchaseOrdersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List listPurchaseOrdersRequestDescriptor = $convert.base64Decode(
    'ChlMaXN0UHVyY2hhc2VPcmRlcnNSZXF1ZXN0Eh8KC3N1cHBsaWVyX2lkGAEgASgJUgpzdXBwbG'
    'llcklkEjUKBnN0YXR1cxgCIAEoDjIdLm9yZGVyLnYxLlB1cmNoYXNlT3JkZXJTdGF0dXNSBnN0'
    'YXR1cxI5CgpzdGFydF9kYXRlGAMgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJc3'
    'RhcnREYXRlEjUKCGVuZF9kYXRlGAQgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIH'
    'ZW5kRGF0ZRIbCglwYWdlX3NpemUYBSABKAVSCHBhZ2VTaXplEh8KC3BhZ2VfbnVtYmVyGAYgAS'
    'gFUgpwYWdlTnVtYmVy');

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
    {'1': 'po_id', '3': 1, '4': 1, '5': 9, '10': 'poId'},
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
        'CiBVcGRhdGVQdXJjaGFzZU9yZGVyU3RhdHVzUmVxdWVzdBITCgVwb19pZBgBIAEoCVIEcG9JZB'
        'I8CgpuZXdfc3RhdHVzGAIgASgOMh0ub3JkZXIudjEuUHVyY2hhc2VPcmRlclN0YXR1c1IJbmV3'
        'U3RhdHVzEisKEnVwZGF0ZWRfYnlfdXNlcl9pZBgDIAEoCVIPdXBkYXRlZEJ5VXNlcklkEhQKBW'
        '5vdGVzGAQgASgJUgVub3Rlcw==');

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
    {'1': 'po_id', '3': 1, '4': 1, '5': 9, '10': 'poId'},
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
        'ChpDYW5jZWxQdXJjaGFzZU9yZGVyUmVxdWVzdBITCgVwb19pZBgBIAEoCVIEcG9JZBIWCgZyZW'
        'Fzb24YAiABKAlSBnJlYXNvbhIvChRjYW5jZWxsZWRfYnlfdXNlcl9pZBgDIAEoCVIRY2FuY2Vs'
        'bGVkQnlVc2VySWQ=');

@$core.Deprecated('Use createReceivingNoteRequestDescriptor instead')
const CreateReceivingNoteRequest$json = {
  '1': 'CreateReceivingNoteRequest',
  '2': [
    {'1': 'purchase_order_id', '3': 1, '4': 1, '5': 9, '10': 'purchaseOrderId'},
    {'1': 'supplier_id', '3': 2, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '10': 'storeId'},
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
    'IPcHVyY2hhc2VPcmRlcklkEh8KC3N1cHBsaWVyX2lkGAIgASgJUgpzdXBwbGllcklkEhkKCHN0'
    'b3JlX2lkGAMgASgJUgdzdG9yZUlkEjQKBWl0ZW1zGAQgAygLMh4ubG9naXN0aWMudjEuUmVjZW'
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

@$core.Deprecated('Use getSuggestedPurchaseOrdersRequestDescriptor instead')
const GetSuggestedPurchaseOrdersRequest$json = {
  '1': 'GetSuggestedPurchaseOrdersRequest',
  '2': [
    {'1': 'store_id', '3': 1, '4': 1, '5': 9, '10': 'storeId'},
  ],
};

/// Descriptor for `GetSuggestedPurchaseOrdersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSuggestedPurchaseOrdersRequestDescriptor =
    $convert.base64Decode(
        'CiFHZXRTdWdnZXN0ZWRQdXJjaGFzZU9yZGVyc1JlcXVlc3QSGQoIc3RvcmVfaWQYASABKAlSB3'
        'N0b3JlSWQ=');

@$core.Deprecated('Use getSuggestedPurchaseOrdersResponseDescriptor instead')
const GetSuggestedPurchaseOrdersResponse$json = {
  '1': 'GetSuggestedPurchaseOrdersResponse',
  '2': [
    {
      '1': 'suggestions',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.order.v1.SuggestedPurchase',
      '10': 'suggestions'
    },
    {'1': 'total_items', '3': 2, '4': 1, '5': 5, '10': 'totalItems'},
  ],
};

/// Descriptor for `GetSuggestedPurchaseOrdersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getSuggestedPurchaseOrdersResponseDescriptor =
    $convert.base64Decode(
        'CiJHZXRTdWdnZXN0ZWRQdXJjaGFzZU9yZGVyc1Jlc3BvbnNlEj0KC3N1Z2dlc3Rpb25zGAEgAy'
        'gLMhsub3JkZXIudjEuU3VnZ2VzdGVkUHVyY2hhc2VSC3N1Z2dlc3Rpb25zEh8KC3RvdGFsX2l0'
        'ZW1zGAIgASgFUgp0b3RhbEl0ZW1z');

@$core.Deprecated('Use suggestedPurchaseDescriptor instead')
const SuggestedPurchase$json = {
  '1': 'SuggestedPurchase',
  '2': [
    {
      '1': 'product',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StoreProduct',
      '10': 'product'
    },
    {
      '1': 'preferred_supplier_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'preferredSupplierId'
    },
    {'1': 'current_stock', '3': 3, '4': 1, '5': 5, '10': 'currentStock'},
    {'1': 'reorder_level', '3': 4, '4': 1, '5': 5, '10': 'reorderLevel'},
    {
      '1': 'suggested_quantity',
      '3': 5,
      '4': 1,
      '5': 5,
      '10': 'suggestedQuantity'
    },
    {'1': 'estimated_cost', '3': 6, '4': 1, '5': 5, '10': 'estimatedCost'},
  ],
};

/// Descriptor for `SuggestedPurchase`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List suggestedPurchaseDescriptor = $convert.base64Decode(
    'ChFTdWdnZXN0ZWRQdXJjaGFzZRI0Cgdwcm9kdWN0GAEgASgLMhouaW52ZW50b3J5LnYxLlN0b3'
    'JlUHJvZHVjdFIHcHJvZHVjdBIyChVwcmVmZXJyZWRfc3VwcGxpZXJfaWQYAiABKAlSE3ByZWZl'
    'cnJlZFN1cHBsaWVySWQSIwoNY3VycmVudF9zdG9jaxgDIAEoBVIMY3VycmVudFN0b2NrEiMKDX'
    'Jlb3JkZXJfbGV2ZWwYBCABKAVSDHJlb3JkZXJMZXZlbBItChJzdWdnZXN0ZWRfcXVhbnRpdHkY'
    'BSABKAVSEXN1Z2dlc3RlZFF1YW50aXR5EiUKDmVzdGltYXRlZF9jb3N0GAYgASgFUg1lc3RpbW'
    'F0ZWRDb3N0');

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
    {
      '1': 'GetSuggestedPurchaseOrders',
      '2': '.order.v1.GetSuggestedPurchaseOrdersRequest',
      '3': '.order.v1.GetSuggestedPurchaseOrdersResponse'
    },
  ],
};

@$core.Deprecated('Use purchaseOrderServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    PurchaseOrderServiceBase$messageJson = {
  '.order.v1.CreatePurchaseOrderRequest': CreatePurchaseOrderRequest$json,
  '.order.v1.OrderLineItem': $0.OrderLineItem$json,
  '.inventory.v1.Internationalized': $6.Internationalized$json,
  '.google.protobuf.Timestamp': $1.Timestamp$json,
  '.order.v1.CreatePurchaseOrderResponse': CreatePurchaseOrderResponse$json,
  '.order.v1.PurchaseOrder': PurchaseOrder$json,
  '.order.v1.GetPurchaseOrderRequest': GetPurchaseOrderRequest$json,
  '.order.v1.GetPurchaseOrderResponse': GetPurchaseOrderResponse$json,
  '.logistic.v1.ReceivingNote': $2.ReceivingNote$json,
  '.logistic.v1.ReceivingLineItem': $2.ReceivingLineItem$json,
  '.financial.v1.Invoice': $3.Invoice$json,
  '.financial.v1.InvoiceLineItem': $7.InvoiceLineItem$json,
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
  '.order.v1.GetSuggestedPurchaseOrdersRequest':
      GetSuggestedPurchaseOrdersRequest$json,
  '.order.v1.GetSuggestedPurchaseOrdersResponse':
      GetSuggestedPurchaseOrdersResponse$json,
  '.order.v1.SuggestedPurchase': SuggestedPurchase$json,
  '.inventory.v1.StoreProduct': $5.StoreProduct$json,
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
    'VpdmluZ05vdGVSZXNwb25zZRJ3ChpHZXRTdWdnZXN0ZWRQdXJjaGFzZU9yZGVycxIrLm9yZGVy'
    'LnYxLkdldFN1Z2dlc3RlZFB1cmNoYXNlT3JkZXJzUmVxdWVzdBosLm9yZGVyLnYxLkdldFN1Z2'
    'dlc3RlZFB1cmNoYXNlT3JkZXJzUmVzcG9uc2U=');
