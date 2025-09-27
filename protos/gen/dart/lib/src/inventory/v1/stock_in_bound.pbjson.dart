// This is a generated file - do not edit.
//
// Generated from inventory/v1/stock_in_bound.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

import '../../google/protobuf/timestamp.pbjson.dart' as $0;

@$core.Deprecated('Use inboundTypeDescriptor instead')
const InboundType$json = {
  '1': 'InboundType',
  '2': [
    {'1': 'INBOUND_TYPE_UNSPECIFIED', '2': 0},
    {'1': 'INBOUND_TYPE_STOCK_IN', '2': 1},
    {'1': 'INBOUND_TYPE_CUSTOMER_RETURN', '2': 2},
    {'1': 'INBOUND_TYPE_ADJUSTMENT', '2': 3},
  ],
};

/// Descriptor for `InboundType`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List inboundTypeDescriptor = $convert.base64Decode(
    'CgtJbmJvdW5kVHlwZRIcChhJTkJPVU5EX1RZUEVfVU5TUEVDSUZJRUQQABIZChVJTkJPVU5EX1'
    'RZUEVfU1RPQ0tfSU4QARIgChxJTkJPVU5EX1RZUEVfQ1VTVE9NRVJfUkVUVVJOEAISGwoXSU5C'
    'T1VORF9UWVBFX0FESlVTVE1FTlQQAw==');

@$core.Deprecated('Use stockInboundDescriptor instead')
const StockInbound$json = {
  '1': 'StockInbound',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '10': 'refId'},
    {'1': 'global_product_id', '3': 2, '4': 1, '5': 9, '10': 'globalProductId'},
    {
      '1': 'inbound_type',
      '3': 3,
      '4': 1,
      '5': 14,
      '6': '.inventory.v1.InboundType',
      '10': 'inboundType'
    },
    {'1': 'quantity', '3': 4, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'quantity_before', '3': 5, '4': 1, '5': 5, '10': 'quantityBefore'},
    {'1': 'quantity_after', '3': 6, '4': 1, '5': 5, '10': 'quantityAfter'},
    {'1': 'unit_cost', '3': 7, '4': 1, '5': 5, '10': 'unitCost'},
    {
      '1': 'supplier_id',
      '3': 8,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'supplierId',
      '17': true
    },
    {
      '1': 'reference_number',
      '3': 9,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'referenceNumber',
      '17': true
    },
    {
      '1': 'batch_number',
      '3': 10,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'batchNumber',
      '17': true
    },
    {
      '1': 'reason',
      '3': 11,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'reason',
      '17': true
    },
    {
      '1': 'batch_expiry_date',
      '3': 12,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 4,
      '10': 'batchExpiryDate',
      '17': true
    },
    {
      '1': 'created_at',
      '3': 13,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {'1': 'performed_by', '3': 14, '4': 1, '5': 9, '10': 'performedBy'},
  ],
  '8': [
    {'1': '_supplier_id'},
    {'1': '_reference_number'},
    {'1': '_batch_number'},
    {'1': '_reason'},
    {'1': '_batch_expiry_date'},
  ],
};

/// Descriptor for `StockInbound`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List stockInboundDescriptor = $convert.base64Decode(
    'CgxTdG9ja0luYm91bmQSFQoGcmVmX2lkGAEgASgJUgVyZWZJZBIqChFnbG9iYWxfcHJvZHVjdF'
    '9pZBgCIAEoCVIPZ2xvYmFsUHJvZHVjdElkEjwKDGluYm91bmRfdHlwZRgDIAEoDjIZLmludmVu'
    'dG9yeS52MS5JbmJvdW5kVHlwZVILaW5ib3VuZFR5cGUSGgoIcXVhbnRpdHkYBCABKAVSCHF1YW'
    '50aXR5EicKD3F1YW50aXR5X2JlZm9yZRgFIAEoBVIOcXVhbnRpdHlCZWZvcmUSJQoOcXVhbnRp'
    'dHlfYWZ0ZXIYBiABKAVSDXF1YW50aXR5QWZ0ZXISGwoJdW5pdF9jb3N0GAcgASgFUgh1bml0Q2'
    '9zdBIkCgtzdXBwbGllcl9pZBgIIAEoCUgAUgpzdXBwbGllcklkiAEBEi4KEHJlZmVyZW5jZV9u'
    'dW1iZXIYCSABKAlIAVIPcmVmZXJlbmNlTnVtYmVyiAEBEiYKDGJhdGNoX251bWJlchgKIAEoCU'
    'gCUgtiYXRjaE51bWJlcogBARIbCgZyZWFzb24YCyABKAlIA1IGcmVhc29uiAEBEksKEWJhdGNo'
    'X2V4cGlyeV9kYXRlGAwgASgLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcEgEUg9iYXRjaE'
    'V4cGlyeURhdGWIAQESOQoKY3JlYXRlZF9hdBgNIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1l'
    'c3RhbXBSCWNyZWF0ZWRBdBIhCgxwZXJmb3JtZWRfYnkYDiABKAlSC3BlcmZvcm1lZEJ5Qg4KDF'
    '9zdXBwbGllcl9pZEITChFfcmVmZXJlbmNlX251bWJlckIPCg1fYmF0Y2hfbnVtYmVyQgkKB19y'
    'ZWFzb25CFAoSX2JhdGNoX2V4cGlyeV9kYXRl');

@$core.Deprecated('Use createStockInboundRequestDescriptor instead')
const CreateStockInboundRequest$json = {
  '1': 'CreateStockInboundRequest',
  '2': [
    {
      '1': 'stock_inbound',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.inventory.v1.StockInbound',
      '10': 'stockInbound'
    },
  ],
};

/// Descriptor for `CreateStockInboundRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStockInboundRequestDescriptor =
    $convert.base64Decode(
        'ChlDcmVhdGVTdG9ja0luYm91bmRSZXF1ZXN0Ej8KDXN0b2NrX2luYm91bmQYASABKAsyGi5pbn'
        'ZlbnRvcnkudjEuU3RvY2tJbmJvdW5kUgxzdG9ja0luYm91bmQ=');

@$core.Deprecated('Use createStockInboundResponseDescriptor instead')
const CreateStockInboundResponse$json = {
  '1': 'CreateStockInboundResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `CreateStockInboundResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createStockInboundResponseDescriptor =
    $convert.base64Decode(
        'ChpDcmVhdGVTdG9ja0luYm91bmRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

@$core.Deprecated('Use updateStockInboundRequestDescriptor instead')
const UpdateStockInboundRequest$json = {
  '1': 'UpdateStockInboundRequest',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '10': 'refId'},
    {
      '1': 'quantity',
      '3': 2,
      '4': 1,
      '5': 5,
      '9': 0,
      '10': 'quantity',
      '17': true
    },
    {'1': 'reason', '3': 3, '4': 1, '5': 9, '9': 1, '10': 'reason', '17': true},
    {
      '1': 'performed_by',
      '3': 4,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'performedBy',
      '17': true
    },
  ],
  '8': [
    {'1': '_quantity'},
    {'1': '_reason'},
    {'1': '_performed_by'},
  ],
};

/// Descriptor for `UpdateStockInboundRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStockInboundRequestDescriptor = $convert.base64Decode(
    'ChlVcGRhdGVTdG9ja0luYm91bmRSZXF1ZXN0EhUKBnJlZl9pZBgBIAEoCVIFcmVmSWQSHwoIcX'
    'VhbnRpdHkYAiABKAVIAFIIcXVhbnRpdHmIAQESGwoGcmVhc29uGAMgASgJSAFSBnJlYXNvbogB'
    'ARImCgxwZXJmb3JtZWRfYnkYBCABKAlIAlILcGVyZm9ybWVkQnmIAQFCCwoJX3F1YW50aXR5Qg'
    'kKB19yZWFzb25CDwoNX3BlcmZvcm1lZF9ieQ==');

@$core.Deprecated('Use updateStockInboundResponseDescriptor instead')
const UpdateStockInboundResponse$json = {
  '1': 'UpdateStockInboundResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `UpdateStockInboundResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List updateStockInboundResponseDescriptor =
    $convert.base64Decode(
        'ChpVcGRhdGVTdG9ja0luYm91bmRSZXNwb25zZRIYCgdzdWNjZXNzGAEgASgIUgdzdWNjZXNz');

const $core.Map<$core.String, $core.dynamic> StockInboundServiceBase$json = {
  '1': 'StockInboundService',
  '2': [
    {
      '1': 'CreateStockInbound',
      '2': '.inventory.v1.CreateStockInboundRequest',
      '3': '.inventory.v1.CreateStockInboundResponse'
    },
    {
      '1': 'UpdateStockInbound',
      '2': '.inventory.v1.UpdateStockInboundRequest',
      '3': '.inventory.v1.UpdateStockInboundResponse'
    },
  ],
};

@$core.Deprecated('Use stockInboundServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    StockInboundServiceBase$messageJson = {
  '.inventory.v1.CreateStockInboundRequest': CreateStockInboundRequest$json,
  '.inventory.v1.StockInbound': StockInbound$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.inventory.v1.CreateStockInboundResponse': CreateStockInboundResponse$json,
  '.inventory.v1.UpdateStockInboundRequest': UpdateStockInboundRequest$json,
  '.inventory.v1.UpdateStockInboundResponse': UpdateStockInboundResponse$json,
};

/// Descriptor for `StockInboundService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List stockInboundServiceDescriptor = $convert.base64Decode(
    'ChNTdG9ja0luYm91bmRTZXJ2aWNlEmcKEkNyZWF0ZVN0b2NrSW5ib3VuZBInLmludmVudG9yeS'
    '52MS5DcmVhdGVTdG9ja0luYm91bmRSZXF1ZXN0GiguaW52ZW50b3J5LnYxLkNyZWF0ZVN0b2Nr'
    'SW5ib3VuZFJlc3BvbnNlEmcKElVwZGF0ZVN0b2NrSW5ib3VuZBInLmludmVudG9yeS52MS5VcG'
    'RhdGVTdG9ja0luYm91bmRSZXF1ZXN0GiguaW52ZW50b3J5LnYxLlVwZGF0ZVN0b2NrSW5ib3Vu'
    'ZFJlc3BvbnNl');
