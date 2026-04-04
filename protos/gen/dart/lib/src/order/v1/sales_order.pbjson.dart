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
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'refId'},
    {'1': 'customer', '3': 2, '4': 1, '5': 9, '10': 'customer'},
    {'1': 'seller_id', '3': 3, '4': 1, '5': 9, '10': 'sellerId'},
    {
      '1': 'source_warehouse_address',
      '3': 4,
      '4': 1,
      '5': 9,
      '10': 'sourceWarehouseAddress'
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
      '1': 'delivery_date',
      '3': 11,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 1,
      '10': 'deliveryDate',
      '17': true
    },
    {'1': 'notes', '3': 12, '4': 1, '5': 9, '9': 2, '10': 'notes', '17': true},
  ],
  '8': [
    {'1': '_currency'},
    {'1': '_delivery_date'},
    {'1': '_notes'},
  ],
};

/// Descriptor for `SalesOrder`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List salesOrderDescriptor = $convert.base64Decode(
    'CgpTYWxlc09yZGVyEh0KBnJlZl9pZBgBIAEoCUIGukgDyAEBUgVyZWZJZBIaCghjdXN0b21lch'
    'gCIAEoCVIIY3VzdG9tZXISGwoJc2VsbGVyX2lkGAMgASgJUghzZWxsZXJJZBI4Chhzb3VyY2Vf'
    'd2FyZWhvdXNlX2FkZHJlc3MYBCABKAlSFnNvdXJjZVdhcmVob3VzZUFkZHJlc3MSMgoGc3RhdH'
    'VzGAUgASgOMhoub3JkZXIudjEuU2FsZXNPcmRlclN0YXR1c1IGc3RhdHVzEi0KBWl0ZW1zGAYg'
    'AygLMhcub3JkZXIudjEuT3JkZXJMaW5lSXRlbVIFaXRlbXMSIQoMdG90YWxfYW1vdW50GAcgAS'
    'gBUgt0b3RhbEFtb3VudBIfCghjdXJyZW5jeRgIIAEoCUgAUghjdXJyZW5jeYgBARIrChJjcmVh'
    'dGVkX2J5X3VzZXJfaWQYCSABKAlSD2NyZWF0ZWRCeVVzZXJJZBI5CgpjcmVhdGVkX2F0GAogAS'
    'gLMhouZ29vZ2xlLnByb3RvYnVmLlRpbWVzdGFtcFIJY3JlYXRlZEF0EkQKDWRlbGl2ZXJ5X2Rh'
    'dGUYCyABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wSAFSDGRlbGl2ZXJ5RGF0ZYgBAR'
    'IZCgVub3RlcxgMIAEoCUgCUgVub3Rlc4gBAUILCglfY3VycmVuY3lCEAoOX2RlbGl2ZXJ5X2Rh'
    'dGVCCAoGX25vdGVz');
