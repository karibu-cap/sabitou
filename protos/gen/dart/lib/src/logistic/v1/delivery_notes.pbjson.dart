// This is a generated file - do not edit.
//
// Generated from logistic/v1/delivery_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

@$core.Deprecated('Use deliveryNoteStatusDescriptor instead')
const DeliveryNoteStatus$json = {
  '1': 'DeliveryNoteStatus',
  '2': [
    {'1': 'DN_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'DN_STATUS_PREPARED', '2': 1},
    {'1': 'DN_STATUS_IN_TRANSIT', '2': 2},
    {'1': 'DN_STATUS_DELIVERED', '2': 3},
    {'1': 'DN_STATUS_RETURNED', '2': 4},
  ],
};

/// Descriptor for `DeliveryNoteStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List deliveryNoteStatusDescriptor = $convert.base64Decode(
    'ChJEZWxpdmVyeU5vdGVTdGF0dXMSGQoVRE5fU1RBVFVTX1VOU1BFQ0lGSUVEEAASFgoSRE5fU1'
    'RBVFVTX1BSRVBBUkVEEAESGAoURE5fU1RBVFVTX0lOX1RSQU5TSVQQAhIXChNETl9TVEFUVVNf'
    'REVMSVZFUkVEEAMSFgoSRE5fU1RBVFVTX1JFVFVSTkVEEAQ=');

@$core.Deprecated('Use deliveryNoteDescriptor instead')
const DeliveryNote$json = {
  '1': 'DeliveryNote',
  '2': [
    {'1': 'document_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'documentId'},
    {
      '1': 'related_sales_order_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '10': 'relatedSalesOrderId'
    },
    {'1': 'from_warehouse_id', '3': 3, '4': 1, '5': 9, '10': 'fromWarehouseId'},
    {'1': 'to_company_id', '3': 4, '4': 1, '5': 9, '10': 'toCompanyId'},
    {'1': 'to_address', '3': 5, '4': 1, '5': 9, '10': 'toAddress'},
    {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.logistic.v1.DeliveryNoteStatus',
      '10': 'status'
    },
    {
      '1': 'items',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.logistic.v1.DeliveryLineItem',
      '10': 'items'
    },
    {'1': 'carrier', '3': 8, '4': 1, '5': 9, '10': 'carrier'},
    {'1': 'tracking_number', '3': 9, '4': 1, '5': 9, '10': 'trackingNumber'},
    {
      '1': 'created_by_user_id',
      '3': 10,
      '4': 1,
      '5': 9,
      '10': 'createdByUserId'
    },
    {
      '1': 'created_at',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'shipped_at',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'shippedAt'
    },
    {
      '1': 'delivered_at',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'deliveredAt'
    },
    {'1': 'notes', '3': 14, '4': 1, '5': 9, '10': 'notes'},
  ],
};

/// Descriptor for `DeliveryNote`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deliveryNoteDescriptor = $convert.base64Decode(
    'CgxEZWxpdmVyeU5vdGUSJwoLZG9jdW1lbnRfaWQYASABKAlCBrpIA8gBAVIKZG9jdW1lbnRJZB'
    'IzChZyZWxhdGVkX3NhbGVzX29yZGVyX2lkGAIgASgJUhNyZWxhdGVkU2FsZXNPcmRlcklkEioK'
    'EWZyb21fd2FyZWhvdXNlX2lkGAMgASgJUg9mcm9tV2FyZWhvdXNlSWQSIgoNdG9fY29tcGFueV'
    '9pZBgEIAEoCVILdG9Db21wYW55SWQSHQoKdG9fYWRkcmVzcxgFIAEoCVIJdG9BZGRyZXNzEjcK'
    'BnN0YXR1cxgGIAEoDjIfLmxvZ2lzdGljLnYxLkRlbGl2ZXJ5Tm90ZVN0YXR1c1IGc3RhdHVzEj'
    'MKBWl0ZW1zGAcgAygLMh0ubG9naXN0aWMudjEuRGVsaXZlcnlMaW5lSXRlbVIFaXRlbXMSGAoH'
    'Y2FycmllchgIIAEoCVIHY2FycmllchInCg90cmFja2luZ19udW1iZXIYCSABKAlSDnRyYWNraW'
    '5nTnVtYmVyEisKEmNyZWF0ZWRfYnlfdXNlcl9pZBgKIAEoCVIPY3JlYXRlZEJ5VXNlcklkEjkK'
    'CmNyZWF0ZWRfYXQYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQX'
    'QSOQoKc2hpcHBlZF9hdBgMIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBSCXNoaXBw'
    'ZWRBdBI9CgxkZWxpdmVyZWRfYXQYDSABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUg'
    'tkZWxpdmVyZWRBdBIUCgVub3RlcxgOIAEoCVIFbm90ZXM=');

@$core.Deprecated('Use deliveryLineItemDescriptor instead')
const DeliveryLineItem$json = {
  '1': 'DeliveryLineItem',
  '2': [
    {'1': 'product_id', '3': 1, '4': 1, '5': 9, '10': 'productId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 1, '10': 'quantity'},
    {'1': 'serial_numbers', '3': 3, '4': 1, '5': 9, '10': 'serialNumbers'},
    {'1': 'batch_id', '3': 4, '4': 1, '5': 9, '10': 'batchId'},
  ],
};

/// Descriptor for `DeliveryLineItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deliveryLineItemDescriptor = $convert.base64Decode(
    'ChBEZWxpdmVyeUxpbmVJdGVtEh0KCnByb2R1Y3RfaWQYASABKAlSCXByb2R1Y3RJZBIaCghxdW'
    'FudGl0eRgCIAEoAVIIcXVhbnRpdHkSJQoOc2VyaWFsX251bWJlcnMYAyABKAlSDXNlcmlhbE51'
    'bWJlcnMSGQoIYmF0Y2hfaWQYBCABKAlSB2JhdGNoSWQ=');
