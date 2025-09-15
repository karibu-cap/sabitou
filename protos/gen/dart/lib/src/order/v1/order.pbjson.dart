// This is a generated file - do not edit.
//
// Generated from order/v1/order.proto.

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

@$core.Deprecated('Use orderStatusDescriptor instead')
const OrderStatus$json = {
  '1': 'OrderStatus',
  '2': [
    {'1': 'ORDER_STATUS_UNSPECIFIED', '2': 0},
    {'1': 'ORDER_STATUS_PENDING', '2': 1},
    {'1': 'ORDER_STATUS_PROCESSING', '2': 2},
    {'1': 'ORDER_STATUS_COMPLETED', '2': 3},
    {'1': 'ORDER_STATUS_CANCELLED', '2': 4},
  ],
};

/// Descriptor for `OrderStatus`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List orderStatusDescriptor = $convert.base64Decode(
    'CgtPcmRlclN0YXR1cxIcChhPUkRFUl9TVEFUVVNfVU5TUEVDSUZJRUQQABIYChRPUkRFUl9TVE'
    'FUVVNfUEVORElORxABEhsKF09SREVSX1NUQVRVU19QUk9DRVNTSU5HEAISGgoWT1JERVJfU1RB'
    'VFVTX0NPTVBMRVRFRBADEhoKFk9SREVSX1NUQVRVU19DQU5DRUxMRUQQBA==');

@$core.Deprecated('Use statusHistoryDescriptor instead')
const StatusHistory$json = {
  '1': 'StatusHistory',
  '2': [
    {
      '1': 'status',
      '3': 1,
      '4': 1,
      '5': 14,
      '6': '.order.v1.OrderStatus',
      '10': 'status'
    },
    {'1': 'updated_by', '3': 2, '4': 1, '5': 9, '10': 'updatedBy'},
    {
      '1': 'updated_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'updatedAt'
    },
  ],
};

/// Descriptor for `StatusHistory`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List statusHistoryDescriptor = $convert.base64Decode(
    'Cg1TdGF0dXNIaXN0b3J5Ei0KBnN0YXR1cxgBIAEoDjIVLm9yZGVyLnYxLk9yZGVyU3RhdHVzUg'
    'ZzdGF0dXMSHQoKdXBkYXRlZF9ieRgCIAEoCVIJdXBkYXRlZEJ5EjkKCnVwZGF0ZWRfYXQYAyAB'
    'KAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgl1cGRhdGVkQXQ=');

@$core.Deprecated('Use orderItemDescriptor instead')
const OrderItem$json = {
  '1': 'OrderItem',
  '2': [
    {'1': 'store_product_id', '3': 1, '4': 1, '5': 9, '10': 'storeProductId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'unit_price', '3': 3, '4': 1, '5': 5, '10': 'unitPrice'},
    {'1': 'item_name', '3': 4, '4': 1, '5': 9, '10': 'itemName'},
  ],
};

/// Descriptor for `OrderItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderItemDescriptor = $convert.base64Decode(
    'CglPcmRlckl0ZW0SKAoQc3RvcmVfcHJvZHVjdF9pZBgBIAEoCVIOc3RvcmVQcm9kdWN0SWQSGg'
    'oIcXVhbnRpdHkYAiABKAVSCHF1YW50aXR5Eh0KCnVuaXRfcHJpY2UYAyABKAVSCXVuaXRQcmlj'
    'ZRIbCglpdGVtX25hbWUYBCABKAlSCGl0ZW1OYW1l');

@$core.Deprecated('Use orderDescriptor instead')
const Order$json = {
  '1': 'Order',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {
      '1': 'from_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'fromId',
      '17': true
    },
    {'1': 'is_client_order', '3': 3, '4': 1, '5': 9, '10': 'isClientOrder'},
    {
      '1': 'order_items',
      '3': 4,
      '4': 3,
      '5': 11,
      '6': '.order.v1.OrderItem',
      '10': 'orderItems'
    },
    {'1': 'total_price', '3': 5, '4': 1, '5': 5, '10': 'totalPrice'},
    {
      '1': 'status',
      '3': 6,
      '4': 1,
      '5': 14,
      '6': '.order.v1.OrderStatus',
      '10': 'status'
    },
    {
      '1': 'status_history',
      '3': 7,
      '4': 3,
      '5': 11,
      '6': '.order.v1.StatusHistory',
      '10': 'statusHistory'
    },
    {
      '1': 'created_at',
      '3': 8,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 9,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 2,
      '10': 'updatedAt',
      '17': true
    },
    {'1': 'store_id', '3': 10, '4': 1, '5': 9, '8': {}, '10': 'storeId'},
    {
      '1': 'initiated_by',
      '3': 11,
      '4': 1,
      '5': 9,
      '8': {},
      '10': 'initiatedBy'
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_from_id'},
    {'1': '_updated_at'},
  ],
};

/// Descriptor for `Order`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderDescriptor = $convert.base64Decode(
    'CgVPcmRlchIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESHAoHZnJvbV9pZBgCIAEoCUgBUg'
    'Zmcm9tSWSIAQESJgoPaXNfY2xpZW50X29yZGVyGAMgASgJUg1pc0NsaWVudE9yZGVyEjQKC29y'
    'ZGVyX2l0ZW1zGAQgAygLMhMub3JkZXIudjEuT3JkZXJJdGVtUgpvcmRlckl0ZW1zEh8KC3RvdG'
    'FsX3ByaWNlGAUgASgFUgp0b3RhbFByaWNlEi0KBnN0YXR1cxgGIAEoDjIVLm9yZGVyLnYxLk9y'
    'ZGVyU3RhdHVzUgZzdGF0dXMSPgoOc3RhdHVzX2hpc3RvcnkYByADKAsyFy5vcmRlci52MS5TdG'
    'F0dXNIaXN0b3J5Ug1zdGF0dXNIaXN0b3J5EjkKCmNyZWF0ZWRfYXQYCCABKAsyGi5nb29nbGUu'
    'cHJvdG9idWYuVGltZXN0YW1wUgljcmVhdGVkQXQSPgoKdXBkYXRlZF9hdBgJIAEoCzIaLmdvb2'
    'dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAlIJdXBkYXRlZEF0iAEBEiYKCHN0b3JlX2lkGAogASgJ'
    'Qgu6SAjIAQFyA7ABAVIHc3RvcmVJZBItCgxpbml0aWF0ZWRfYnkYCyABKAlCCrpIB8gBAXICEA'
    'NSC2luaXRpYXRlZEJ5QgkKB19yZWZfaWRCCgoIX2Zyb21faWRCDQoLX3VwZGF0ZWRfYXQ=');

@$core.Deprecated('Use createOrderRequestDescriptor instead')
const CreateOrderRequest$json = {
  '1': 'CreateOrderRequest',
  '2': [
    {
      '1': 'order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.Order',
      '10': 'order'
    },
    {
      '1': 'supplier_name',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 0,
      '10': 'supplierName',
      '17': true
    },
    {'1': 'store_id', '3': 3, '4': 1, '5': 9, '10': 'storeId'},
  ],
  '8': [
    {'1': '_supplier_name'},
  ],
};

/// Descriptor for `CreateOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVPcmRlclJlcXVlc3QSJQoFb3JkZXIYASABKAsyDy5vcmRlci52MS5PcmRlclIFb3'
    'JkZXISKAoNc3VwcGxpZXJfbmFtZRgCIAEoCUgAUgxzdXBwbGllck5hbWWIAQESGQoIc3RvcmVf'
    'aWQYAyABKAlSB3N0b3JlSWRCEAoOX3N1cHBsaWVyX25hbWU=');

@$core.Deprecated('Use createOrderResponseDescriptor instead')
const CreateOrderResponse$json = {
  '1': 'CreateOrderResponse',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'orderId'},
  ],
};

/// Descriptor for `CreateOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderResponseDescriptor = $convert.base64Decode(
    'ChNDcmVhdGVPcmRlclJlc3BvbnNlEiUKCG9yZGVyX2lkGAEgASgJQgq6SAfIAQFyAhADUgdvcm'
    'Rlcklk');

@$core.Deprecated('Use getOrderRequestDescriptor instead')
const GetOrderRequest$json = {
  '1': 'GetOrderRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'orderId'},
  ],
};

/// Descriptor for `GetOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderRequestDescriptor = $convert.base64Decode(
    'Cg9HZXRPcmRlclJlcXVlc3QSJQoIb3JkZXJfaWQYASABKAlCCrpIB8gBAXICEANSB29yZGVySW'
    'Q=');

@$core.Deprecated('Use getOrderResponseDescriptor instead')
const GetOrderResponse$json = {
  '1': 'GetOrderResponse',
  '2': [
    {
      '1': 'order',
      '3': 1,
      '4': 1,
      '5': 11,
      '6': '.order.v1.Order',
      '10': 'order'
    },
    {
      '1': 'created_at',
      '3': 2,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '10': 'createdAt'
    },
    {
      '1': 'updated_at',
      '3': 3,
      '4': 1,
      '5': 11,
      '6': '.google.protobuf.Timestamp',
      '9': 0,
      '10': 'updatedAt',
      '17': true
    },
  ],
  '8': [
    {'1': '_updated_at'},
  ],
};

/// Descriptor for `GetOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderResponseDescriptor = $convert.base64Decode(
    'ChBHZXRPcmRlclJlc3BvbnNlEiUKBW9yZGVyGAEgASgLMg8ub3JkZXIudjEuT3JkZXJSBW9yZG'
    'VyEjkKCmNyZWF0ZWRfYXQYAiABKAsyGi5nb29nbGUucHJvdG9idWYuVGltZXN0YW1wUgljcmVh'
    'dGVkQXQSPgoKdXBkYXRlZF9hdBgDIAEoCzIaLmdvb2dsZS5wcm90b2J1Zi5UaW1lc3RhbXBIAF'
    'IJdXBkYXRlZEF0iAEBQg0KC191cGRhdGVkX2F0');

@$core.Deprecated('Use deleteOrderRequestDescriptor instead')
const DeleteOrderRequest$json = {
  '1': 'DeleteOrderRequest',
  '2': [
    {'1': 'order_id', '3': 1, '4': 1, '5': 9, '8': {}, '10': 'orderId'},
  ],
};

/// Descriptor for `DeleteOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOrderRequestDescriptor = $convert.base64Decode(
    'ChJEZWxldGVPcmRlclJlcXVlc3QSJQoIb3JkZXJfaWQYASABKAlCCrpIB8gBAXICEANSB29yZG'
    'VySWQ=');

@$core.Deprecated('Use deleteOrderResponseDescriptor instead')
const DeleteOrderResponse$json = {
  '1': 'DeleteOrderResponse',
  '2': [
    {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
  ],
};

/// Descriptor for `DeleteOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List deleteOrderResponseDescriptor =
    $convert.base64Decode(
        'ChNEZWxldGVPcmRlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

@$core.Deprecated('Use findOrdersRequestDescriptor instead')
const FindOrdersRequest$json = {
  '1': 'FindOrdersRequest',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {
      '1': 'from_id',
      '3': 2,
      '4': 1,
      '5': 9,
      '9': 1,
      '10': 'fromId',
      '17': true
    },
    {
      '1': 'is_client_order',
      '3': 3,
      '4': 1,
      '5': 9,
      '9': 2,
      '10': 'isClientOrder',
      '17': true
    },
    {
      '1': 'status',
      '3': 4,
      '4': 3,
      '5': 14,
      '6': '.order.v1.OrderStatus',
      '10': 'status'
    },
    {
      '1': 'store_id',
      '3': 5,
      '4': 1,
      '5': 9,
      '9': 3,
      '10': 'storeId',
      '17': true
    },
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_from_id'},
    {'1': '_is_client_order'},
    {'1': '_store_id'},
  ],
};

/// Descriptor for `FindOrdersRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findOrdersRequestDescriptor = $convert.base64Decode(
    'ChFGaW5kT3JkZXJzUmVxdWVzdBIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESHAoHZnJvbV'
    '9pZBgCIAEoCUgBUgZmcm9tSWSIAQESKwoPaXNfY2xpZW50X29yZGVyGAMgASgJSAJSDWlzQ2xp'
    'ZW50T3JkZXKIAQESLQoGc3RhdHVzGAQgAygOMhUub3JkZXIudjEuT3JkZXJTdGF0dXNSBnN0YX'
    'R1cxIeCghzdG9yZV9pZBgFIAEoCUgDUgdzdG9yZUlkiAEBQgkKB19yZWZfaWRCCgoIX2Zyb21f'
    'aWRCEgoQX2lzX2NsaWVudF9vcmRlckILCglfc3RvcmVfaWQ=');

@$core.Deprecated('Use findOrdersResponseDescriptor instead')
const FindOrdersResponse$json = {
  '1': 'FindOrdersResponse',
  '2': [
    {
      '1': 'orders',
      '3': 1,
      '4': 3,
      '5': 11,
      '6': '.order.v1.Order',
      '10': 'orders'
    },
  ],
};

/// Descriptor for `FindOrdersResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List findOrdersResponseDescriptor = $convert.base64Decode(
    'ChJGaW5kT3JkZXJzUmVzcG9uc2USJwoGb3JkZXJzGAEgAygLMg8ub3JkZXIudjEuT3JkZXJSBm'
    '9yZGVycw==');

const $core.Map<$core.String, $core.dynamic> OrderServiceBase$json = {
  '1': 'OrderService',
  '2': [
    {
      '1': 'CreateOrder',
      '2': '.order.v1.CreateOrderRequest',
      '3': '.order.v1.CreateOrderResponse',
      '4': {}
    },
    {
      '1': 'GetOrder',
      '2': '.order.v1.GetOrderRequest',
      '3': '.order.v1.GetOrderResponse',
      '4': {}
    },
    {
      '1': 'DeleteOrder',
      '2': '.order.v1.DeleteOrderRequest',
      '3': '.order.v1.DeleteOrderResponse',
      '4': {}
    },
    {
      '1': 'FindOrders',
      '2': '.order.v1.FindOrdersRequest',
      '3': '.order.v1.FindOrdersResponse',
      '4': {}
    },
  ],
};

@$core.Deprecated('Use orderServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>>
    OrderServiceBase$messageJson = {
  '.order.v1.CreateOrderRequest': CreateOrderRequest$json,
  '.order.v1.Order': Order$json,
  '.order.v1.OrderItem': OrderItem$json,
  '.order.v1.StatusHistory': StatusHistory$json,
  '.google.protobuf.Timestamp': $0.Timestamp$json,
  '.order.v1.CreateOrderResponse': CreateOrderResponse$json,
  '.order.v1.GetOrderRequest': GetOrderRequest$json,
  '.order.v1.GetOrderResponse': GetOrderResponse$json,
  '.order.v1.DeleteOrderRequest': DeleteOrderRequest$json,
  '.order.v1.DeleteOrderResponse': DeleteOrderResponse$json,
  '.order.v1.FindOrdersRequest': FindOrdersRequest$json,
  '.order.v1.FindOrdersResponse': FindOrdersResponse$json,
};

/// Descriptor for `OrderService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List orderServiceDescriptor = $convert.base64Decode(
    'CgxPcmRlclNlcnZpY2USTAoLQ3JlYXRlT3JkZXISHC5vcmRlci52MS5DcmVhdGVPcmRlclJlcX'
    'Vlc3QaHS5vcmRlci52MS5DcmVhdGVPcmRlclJlc3BvbnNlIgASQwoIR2V0T3JkZXISGS5vcmRl'
    'ci52MS5HZXRPcmRlclJlcXVlc3QaGi5vcmRlci52MS5HZXRPcmRlclJlc3BvbnNlIgASTAoLRG'
    'VsZXRlT3JkZXISHC5vcmRlci52MS5EZWxldGVPcmRlclJlcXVlc3QaHS5vcmRlci52MS5EZWxl'
    'dGVPcmRlclJlc3BvbnNlIgASSQoKRmluZE9yZGVycxIbLm9yZGVyLnYxLkZpbmRPcmRlcnNSZX'
    'F1ZXN0Ghwub3JkZXIudjEuRmluZE9yZGVyc1Jlc3BvbnNlIgA=');
