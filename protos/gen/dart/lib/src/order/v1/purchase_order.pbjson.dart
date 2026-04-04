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

@$core.Deprecated('Use purchaseOrderStatusDescriptor instead')
const PurchaseOrderStatus$json = {
  '1': 'PurchaseOrderStatus',
  '2': [
    {'1': 'PO_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'PO_STATUS_DRAFT', '2': 1},
    {'1': 'PO_STATUS_PENDING', '2': 2},
    {'1': 'PO_STATUS_ISSUED', '2': 3},
    {'1': 'PO_STATUS_CLOSED', '2': 4},
    {'1': 'PO_STATUS_CANCELLED', '2': 5},
  ],
};

/// Descriptor for `PurchaseOrderStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List purchaseOrderStatusDescriptor = $convert.base64Decode(
    'ChNQdXJjaGFzZU9yZGVyU3RhdHVzEhkKFVBPX1NUQVRVU19VTlNQRUNJRklFRBAAEhMKD1BPX1'
    'NUQVRVU19EUkFGVBABEhUKEVBPX1NUQVRVU19QRU5ESU5HEAISFAoQUE9fU1RBVFVTX0lTU1VF'
    'RBADEhQKEFBPX1NUQVRVU19DTE9TRUQQBBIXChNQT19TVEFUVVNfQ0FOQ0VMTEVEEAU=');

@$core.Deprecated('Use purchaseOrderDescriptor instead')
const PurchaseOrder$json = {
  '1': 'PurchaseOrder',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {'1': 'supplier_id', '3': 2, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '10': 'storeId'},
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
      '6': '.order.v1.PurchaseOrderLineItems',
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
    {
      '1': 'destination_address',
      '3': 13,
      '4': 1,
      '5': 9,
      '10': 'destinationAddress'
    },
    {
      '1': 'store_name',
      '3': 14,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'storeName',
      '17': true
    },
    {
      '1': 'supplier_name',
      '3': 15,
      '4': 1,
      '5': 9,
      '9': 4,
      '10': 'supplierName',
      '17': true
    },
    {
      '1': 'order_date',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'orderDate'
    },
    {
      '1': 'payment_id',
      '3': 17,
      '4': 1,
      '5': 9,
      '9': 5,
      '10': 'paymentId',
      '17': true
    },
    {'1': 'sub_total', '3': 18, '4': 1, '5': 1, '10': 'subTotal'},
    {'1': 'tax_total', '3': 19, '4': 1, '5': 1, '10': 'taxTotal'},
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_expected_delivery_date'},
    {'1': '_notes'},
    {'1': '_store_name'},
    {'1': '_supplier_name'},
    {'1': '_payment_id'},
  ],
};

/// Descriptor for `PurchaseOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchaseOrderDescriptor = $convert.base64Decode(
    'Cg1QdXJjaGFzZU9yZGVyEh0KBnJlZl9pZBgBIAEoCUIGukgDyAEBUgVyZWZJZBIfCgtzdXBwbG'
    'llcl9pZBgCIAEoCVIKc3VwcGxpZXJJZBIZCghzdG9yZV9pZBgDIAEoCVIHc3RvcmVJZBI1CgZz'
    'dGF0dXMYBSABKA4yHS5vcmRlci52MS5QdXJjaGFzZU9yZGVyU3RhdHVzUgZzdGF0dXMSNgoFaX'
    'RlbXMYBiADKAsyIC5vcmRlci52MS5QdXJjaGFzZU9yZGVyTGluZUl0ZW1zUgVpdGVtcxIhCgx0'
    'b3RhbF9hbW91bnQYByABKAFSC3RvdGFsQW1vdW50Eh8KCGN1cnJlbmN5GAggASgJSABSCGN1cn'
    'JlbmN5iAEBEisKEmNyZWF0ZWRfYnlfdXNlcl9pZBgJIAEoCVIPY3JlYXRlZEJ5VXNlcklkEjkK'
    'CmNyZWF0ZWRfYXQYCiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQX'
    'QSVQoWZXhwZWN0ZWRfZGVsaXZlcnlfZGF0ZRgLIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBIAVIUZXhwZWN0ZWREZWxpdmVyeURhdGWIAQESGQoFbm90ZXMYDCABKAlIAlIFbm90ZX'
    'OIAQESLwoTZGVzdGluYXRpb25fYWRkcmVzcxgNIAEoCVISZGVzdGluYXRpb25BZGRyZXNzEiIK'
    'CnN0b3JlX25hbWUYDiABKAlIA1IJc3RvcmVOYW1liAEBEigKDXN1cHBsaWVyX25hbWUYDyABKA'
    'lIBFIMc3VwcGxpZXJOYW1liAEBEjkKCm9yZGVyX2RhdGUYECABKAsyGi5nb29nbGUucHJvdG9i'
    'dWYuVGltZXN0YW1wUglvcmRlckRhdGUSIgoKcGF5bWVudF9pZBgRIAEoCUgFUglwYXltZW50SW'
    'SIAQESGwoJc3ViX3RvdGFsGBIgASgBUghzdWJUb3RhbBIbCgl0YXhfdG90YWwYEyABKAFSCHRh'
    'eFRvdGFsQgsKCV9jdXJyZW5jeUIZChdfZXhwZWN0ZWRfZGVsaXZlcnlfZGF0ZUIICgZfbm90ZX'
    'NCDQoLX3N0b3JlX25hbWVCEAoOX3N1cHBsaWVyX25hbWVCDQoLX3BheW1lbnRfaWQ=');

@$core.Deprecated('Use purchaseOrderLineItemsDescriptor instead')
const PurchaseOrderLineItems$json = {
  '1': 'PurchaseOrderLineItems',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'store_id', '3': 9, '4': 1, '5': 9, '10': 'storeId'},
    {'1': 'quantity_ordered', '3': 2, '4': 1, '5': 5, '10': 'quantityOrdered'},
    {
      '1': 'product_name',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.Internationalized',
      '10': 'productName'
    },
    {'1': 'unit_price', '3': 4, '4': 1, '5': 1, '10': 'unitPrice'},
    {'1': 'total', '3': 5, '4': 1, '5': 1, '10': 'total'},
    {
      '1': 'batch_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'batchId',
      '17': true
    },
    {
      '1': 'quantity_received',
      '3': 7,
      '4': 1,
      '5': 5,
      '10': 'quantityReceived'
    },
    {'1': 'tax_amount', '3': 8, '4': 1, '5': 1, '10': 'taxAmount'},
    {'1': 'line_index', '3': 10, '4': 1, '5': 5, '10': 'lineIndex'},
  ],
  '8': [
    {'1': '_batch_id'},
  ],
};

/// Descriptor for `PurchaseOrderLineItems`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List purchaseOrderLineItemsDescriptor = $convert.base64Decode(
    'ChZQdXJjaGFzZU9yZGVyTGluZUl0ZW1zEh0KCnByb2R1Y3RfaWQYASABKAlSCXByb2R1Y3RJZB'
    'IZCghzdG9yZV9pZBgJIAEoCVIHc3RvcmVJZBIpChBxdWFudGl0eV9vcmRlcmVkGAIgASgFUg9x'
    'dWFudGl0eU9yZGVyZWQSQgoMcHJvZHVjdF9uYW1lGAMgASgLMh8uaW52ZW50b3J5LnYxLkludG'
    'VybmF0aW9uYWxpemVkUgtwcm9kdWN0TmFtZRIdCgp1bml0X3ByaWNlGAQgASgBUgl1bml0UHJp'
    'Y2USFAoFdG90YWwYBSABKAFSBXRvdGFsEh4KCGJhdGNoX2lkGAYgASgJSABSB2JhdGNoSWSIAQ'
    'ESKwoRcXVhbnRpdHlfcmVjZWl2ZWQYByABKAVSEHF1YW50aXR5UmVjZWl2ZWQSHQoKdGF4X2Ft'
    'b3VudBgIIAEoAVIJdGF4QW1vdW50Eh0KCmxpbmVfaW5kZXgYCiABKAVSCWxpbmVJbmRleEILCg'
    'lfYmF0Y2hfaWQ=');
