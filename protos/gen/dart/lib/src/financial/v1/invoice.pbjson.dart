// This is a generated file - do not edit.
//
// Generated from financial/v1/invoice.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use invoiceTypeDescriptor instead')
const InvoiceType$json = {
  '1': 'InvoiceType',
  '2': [
    {'1': 'INVOICE_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'INVOICE_TYPE_SALES', '2': 1},
    {'1': 'INVOICE_TYPE_PURCHASE', '2': 2},
  ],
};

/// Descriptor for `InvoiceType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List invoiceTypeDescriptor = $convert.base64Decode(
    'CgtJbnZvaWNlVHlwZRIcChhJTlZPSUNFX1RZUEVfVU5TUEVDSUZJRUQQABIWChJJTlZPSUNFX1'
    'RZUEVfU0FMRVMQARIZChVJTlZPSUNFX1RZUEVfUFVSQ0hBU0UQAg==');

@$core.Deprecated('Use invoiceStatusDescriptor instead')
const InvoiceStatus$json = {
  '1': 'InvoiceStatus',
  '2': [
    {'1': 'INVOICE_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'INVOICE_STATUS_DRAFT', '2': 1},
    {'1': 'INVOICE_STATUS_ISSUED', '2': 2},
    {'1': 'INVOICE_STATUS_UNPAID', '2': 3},
    {'1': 'INVOICE_STATUS_PARTIALLY_PAID', '2': 4},
    {'1': 'INVOICE_STATUS_PAID', '2': 5},
    {'1': 'INVOICE_STATUS_OVERDUE', '2': 6},
    {'1': 'INVOICE_STATUS_CANCELLED', '2': 7},
    {'1': 'INVOICE_STATUS_CREDITED', '2': 8},
  ],
};

/// Descriptor for `InvoiceStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List invoiceStatusDescriptor = $convert.base64Decode(
    'Cg1JbnZvaWNlU3RhdHVzEh4KGklOVk9JQ0VfU1RBVFVTX1VOU1BFQ0lGSUVEEAASGAoUSU5WT0'
    'lDRV9TVEFUVVNfRFJBRlQQARIZChVJTlZPSUNFX1NUQVRVU19JU1NVRUQQAhIZChVJTlZPSUNF'
    'X1NUQVRVU19VTlBBSUQQAxIhCh1JTlZPSUNFX1NUQVRVU19QQVJUSUFMTFlfUEFJRBAEEhcKE0'
    'lOVk9JQ0VfU1RBVFVTX1BBSUQQBRIaChZJTlZPSUNFX1NUQVRVU19PVkVSRFVFEAYSHAoYSU5W'
    'T0lDRV9TVEFUVVNfQ0FOQ0VMTEVEEAcSGwoXSU5WT0lDRV9TVEFUVVNfQ1JFRElURUQQCA==');

@$core.Deprecated('Use invoiceDescriptor instead')
const Invoice$json = {
  '1': 'Invoice',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {
      '1': 'invoice_type',
      '3': 2,
      '4': 1,
      '5': 14,
      '6': '.financial.v1.InvoiceType',
      '10': 'invoiceType'
    },
    {'1': 'issuer_id', '3': 3, '4': 1, '5': 9, '10': 'issuerId'},
    {'1': 'recipient_id', '3': 4, '4': 1, '5': 9, '10': 'recipientId'},
    {
      '1': 'related_sales_order_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'relatedSalesOrderId',
      '17': true
    },
    {
      '1': 'related_purchase_order_id',
      '3': 6,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'relatedPurchaseOrderId',
      '17': true
    },
    {
      '1': 'related_delivery_note_id',
      '3': 7,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'relatedDeliveryNoteId',
      '17': true
    },
    {
      '1': 'status',
      '3': 8,
      '4': 1,
      '5': 14,
      '6': '.financial.v1.InvoiceStatus',
      '10': 'status'
    },
    {
      '1': 'items',
      '3': 9,
      '4': 3,
      '5': 11,
      '6': '.financial.v1.InvoiceLineItem',
      '10': 'items'
    },
    {'1': 'subtotal', '3': 10, '4': 1, '5': 1, '10': 'subtotal'},
    {'1': 'tax_amount', '3': 11, '4': 1, '5': 1, '10': 'taxAmount'},
    {'1': 'total_amount', '3': 12, '4': 1, '5': 1, '10': 'totalAmount'},
    {'1': 'currency', '3': 13, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'issue_date',
      '3': 14,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'issueDate'
    },
    {
      '1': 'due_date',
      '3': 15,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'dueDate'
    },
    {
      '1': 'created_by_user_id',
      '3': 16,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
    {
      '1': 'created_at',
      '3': 17,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {'1': 'payment_ids', '3': 18, '4': 3, '5': 9, '10': 'paymentIds'},
    {'1': 'notes', '3': 19, '4': 1, '5': 9, '10': 'notes'},
    {'1': 'payment_terms', '3': 20, '4': 1, '5': 9, '10': 'paymentTerms'},
  ],
  '8': [
    {'1': '_related_sales_order_id'},
    {'1': '_related_purchase_order_id'},
    {'1': '_related_delivery_note_id'},
  ],
};

/// Descriptor for `Invoice`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List invoiceDescriptor = $convert.base64Decode(
    'CgdJbnZvaWNlEh0KBnJlZl9pZBgBIAEoCUIGukgDyAEBUgVyZWZJZBI8CgxpbnZvaWNlX3R5cG'
    'UYAiABKA4yGS5maW5hbmNpYWwudjEuSW52b2ljZVR5cGVSC2ludm9pY2VUeXBlEhsKCWlzc3Vl'
    'cl9pZBgDIAEoCVIIaXNzdWVySWQSIQoMcmVjaXBpZW50X2lkGAQgASgJUgtyZWNpcGllbnRJZB'
    'I4ChZyZWxhdGVkX3NhbGVzX29yZGVyX2lkGAUgASgJSABSE3JlbGF0ZWRTYWxlc09yZGVySWSI'
    'AQESPgoZcmVsYXRlZF9wdXJjaGFzZV9vcmRlcl9pZBgGIAEoCUgBUhZyZWxhdGVkUHVyY2hhc2'
    'VPcmRlcklkiAEBEjwKGHJlbGF0ZWRfZGVsaXZlcnlfbm90ZV9pZBgHIAEoCUgCUhVyZWxhdGVk'
    'RGVsaXZlcnlOb3RlSWSIAQESMwoGc3RhdHVzGAggASgOMhsuZmluYW5jaWFsLnYxLkludm9pY2'
    'VTdGF0dXNSBnN0YXR1cxIzCgVpdGVtcxgJIAMoCzIdLmZpbmFuY2lhbC52MS5JbnZvaWNlTGlu'
    'ZUl0ZW1SBWl0ZW1zEhoKCHN1YnRvdGFsGAogASgBUghzdWJ0b3RhbBIdCgp0YXhfYW1vdW50GA'
    'sgASgBUgl0YXhBbW91bnQSIQoMdG90YWxfYW1vdW50GAwgASgBUgt0b3RhbEFtb3VudBIaCghj'
    'dXJyZW5jeRgNIAEoCVIIY3VycmVuY3kSOQoKaXNzdWVfZGF0ZRgOIAEoCzIaLmdvb2dsZS5wcm'
    '90b2J1Zi5UaW1lc3RhbXBSCWlzc3VlRGF0ZRI1CghkdWVfZGF0ZRgPIAEoCzIaLmdvb2dsZS5w'
    'cm90b2J1Zi5UaW1lc3RhbXBSB2R1ZURhdGUSKwoSY3JlYXRlZF9ieV91c2VyX2lkGBAgASgJUg'
    '9jcmVhdGVkQnlVc2VySWQSOQoKY3JlYXRlZF9hdBgRIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5U'
    'aW1lc3RhbXBSCWNyZWF0ZWRBdBIfCgtwYXltZW50X2lkcxgSIAMoCVIKcGF5bWVudElkcxIUCg'
    'Vub3RlcxgTIAEoCVIFbm90ZXMSIwoNcGF5bWVudF90ZXJtcxgUIAEoCVIMcGF5bWVudFRlcm1z'
    'QhkKF19yZWxhdGVkX3NhbGVzX29yZGVyX2lkQhwKGl9yZWxhdGVkX3B1cmNoYXNlX29yZGVyX2'
    'lkQhsKGV9yZWxhdGVkX2RlbGl2ZXJ5X25vdGVfaWQ=');
