// This is a generated file - do not edit.
//
// Generated from logistic/v1/bill.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use billStatusDescriptor instead')
const BillStatus$json = {
  '1': 'BillStatus',
  '2': [
    {'1': 'BILL_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'BILL_STATUS_DRAFT', '2': 1},
    {'1': 'BILL_STATUS_OPEN', '2': 2},
    {'1': 'BILL_STATUS_PAID', '2': 3},
    {'1': 'BILL_STATUS_VOID', '2': 4},
    {'1': 'BILL_STATUS_OVERDUE', '2': 5},
    {'1': 'BILL_STATUS_PARTIALLY_PAID', '2': 6},
  ],
};

/// Descriptor for `BillStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List billStatusDescriptor = $convert.base64Decode(
    'CgpCaWxsU3RhdHVzEhsKF0JJTExfU1RBVFVTX1VOU1BFQ0lGSUVEEAASFQoRQklMTF9TVEFUVV'
    'NfRFJBRlQQARIUChBCSUxMX1NUQVRVU19PUEVOEAISFAoQQklMTF9TVEFUVVNfUEFJRBADEhQK'
    'EEJJTExfU1RBVFVTX1ZPSUQQBBIXChNCSUxMX1NUQVRVU19PVkVSRFVFEAUSHgoaQklMTF9TVE'
    'FUVVNfUEFSVElBTExZX1BBSUQQBg==');

@$core.Deprecated('Use billDescriptor instead')
const Bill$json = {
  '1': 'Bill',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {
      '1': 'related_purchase_order_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'relatedPurchaseOrderId',
      '17': true
    },
    {'1': 'supplier_id', '3': 3, '4': 1, '5': 9, '10': 'supplierId'},
    {'1': 'store_id', '3': 4, '4': 1, '5': 9, '10': 'storeId'},
    {
      '1': 'status',
      '3': 5,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.BillStatus',
      '10': 'status'
    },
    {'1': 'payment_ids', '3': 6, '4': 3, '5': 9, '10': 'paymentIds'},
    {
      '1': 'bill_date',
      '3': 7,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'billDate'
    },
    {
      '1': 'due_date',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'dueDate'
    },
    {'1': 'sub_total', '3': 9, '4': 1, '5': 1, '10': 'subTotal'},
    {'1': 'tax_total', '3': 10, '4': 1, '5': 1, '10': 'taxTotal'},
    {'1': 'total_amount', '3': 11, '4': 1, '5': 1, '10': 'totalAmount'},
    {'1': 'balance_due', '3': 12, '4': 1, '5': 1, '10': 'balanceDue'},
    {'1': 'currency', '3': 13, '4': 1, '5': 9, '10': 'currency'},
    {
      '1': 'items',
      '3': 14,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.BillLineItem',
      '10': 'items'
    },
    {'1': 'notes', '3': 15, '4': 1, '5': 9, '10': 'notes'},
    {
      '1': 'created_at',
      '3': 16,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
  ],
  '8': [
    {'1': '_related_purchase_order_id'},
  ],
};

/// Descriptor for `Bill`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List billDescriptor = $convert.base64Decode(
    'CgRCaWxsEh0KBnJlZl9pZBgBIAEoCUIGukgDyAEBUgVyZWZJZBI+ChlyZWxhdGVkX3B1cmNoYX'
    'NlX29yZGVyX2lkGAIgASgJSABSFnJlbGF0ZWRQdXJjaGFzZU9yZGVySWSIAQESHwoLc3VwcGxp'
    'ZXJfaWQYAyABKAlSCnN1cHBsaWVySWQSGQoIc3RvcmVfaWQYBCABKAlSB3N0b3JlSWQSLwoGc3'
    'RhdHVzGAUgASgOMhcubG9naXN0aWMudjEuQmlsbFN0YXR1c1IGc3RhdHVzEh8KC3BheW1lbnRf'
    'aWRzGAYgAygJUgpwYXltZW50SWRzEjcKCWJpbGxfZGF0ZRgHIAEoCzIaLmdvb2dsZS5wcm90b2'
    'J1Zi5UaW1lc3RhbXBSCGJpbGxEYXRlEjUKCGR1ZV9kYXRlGAggASgLMhouZ29vZ2xlLnByb3Rv'
    'YnVmLlRpbWVzdGFtcFIHZHVlRGF0ZRIbCglzdWJfdG90YWwYCSABKAFSCHN1YlRvdGFsEhsKCX'
    'RheF90b3RhbBgKIAEoAVIIdGF4VG90YWwSIQoMdG90YWxfYW1vdW50GAsgASgBUgt0b3RhbEFt'
    'b3VudBIfCgtiYWxhbmNlX2R1ZRgMIAEoAVIKYmFsYW5jZUR1ZRIaCghjdXJyZW5jeRgNIAEoCV'
    'IIY3VycmVuY3kSLwoFaXRlbXMYDiADKAsyGS5sb2dpc3RpYy52MS5CaWxsTGluZUl0ZW1SBWl0'
    'ZW1zEhQKBW5vdGVzGA8gASgJUgVub3RlcxI5CgpjcmVhdGVkX2F0GBAgASgLMhouZ29vZ2xlLn'
    'Byb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0QhwKGl9yZWxhdGVkX3B1cmNoYXNlX29yZGVy'
    'X2lk');

@$core.Deprecated('Use billLineItemDescriptor instead')
const BillLineItem$json = {
  '1': 'BillLineItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'description', '3': 2, '4': 1, '5': 9, '10': 'description'},
    {'1': 'quantity', '3': 3, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'unit_price', '3': 4, '4': 1, '5': 1, '10': 'unitPrice'},
    {'1': 'tax_amount', '3': 5, '4': 1, '5': 1, '10': 'taxAmount'},
    {'1': 'total', '3': 6, '4': 1, '5': 1, '10': 'total'},
  ],
};

/// Descriptor for `BillLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List billLineItemDescriptor = $convert.base64Decode(
    'CgxCaWxsTGluZUl0ZW0SHQoKcHJvZHVjdF9pZBgBIAEoCVIJcHJvZHVjdElkEiAKC2Rlc2NyaX'
    'B0aW9uGAIgASgJUgtkZXNjcmlwdGlvbhIaCghxdWFudGl0eRgDIAEoBVIIcXVhbnRpdHkSHQoK'
    'dW5pdF9wcmljZRgEIAEoAVIJdW5pdFByaWNlEh0KCnRheF9hbW91bnQYBSABKAFSCXRheEFtb3'
    'VudBIUCgV0b3RhbBgGIAEoAVIFdG90YWw=');
