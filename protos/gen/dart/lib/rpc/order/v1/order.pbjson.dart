//
//  Generated code. Do not modify.
//  source: order/v1/order.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:convert' as $convert;
import 'dart:core' as $core;
import 'dart:typed_data' as $typed_data;

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

@$core.Deprecated('Use orderItemDescriptor instead')
const OrderItem$json = {
  '1': 'OrderItem',
  '2': [
    {'1': 'business_product_id', '3': 1, '4': 1, '5': 9, '10': 'businessProductId'},
    {'1': 'quantity', '3': 2, '4': 1, '5': 5, '10': 'quantity'},
    {'1': 'unit_price_in_cents', '3': 3, '4': 1, '5': 5, '10': 'unitPriceInCents'},
  ],
};

/// Descriptor for `OrderItem`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderItemDescriptor = $convert.base64Decode(
    'CglPcmRlckl0ZW0SLgoTYnVzaW5lc3NfcHJvZHVjdF9pZBgBIAEoCVIRYnVzaW5lc3NQcm9kdW'
    'N0SWQSGgoIcXVhbnRpdHkYAiABKAVSCHF1YW50aXR5Ei0KE3VuaXRfcHJpY2VfaW5fY2VudHMY'
    'AyABKAVSEHVuaXRQcmljZUluQ2VudHM=');

@$core.Deprecated('Use orderDescriptor instead')
const Order$json = {
  '1': 'Order',
  '2': [
    {'1': 'ref_id', '3': 1, '4': 1, '5': 9, '9': 0, '10': 'refId', '17': true},
    {'1': 'from_id', '3': 2, '4': 1, '5': 9, '9': 1, '10': 'fromId', '17': true},
    {'1': 'is_client_order', '3': 3, '4': 1, '5': 9, '10': 'isClientOrder'},
    {'1': 'order_items', '3': 4, '4': 3, '5': 11, '6': '.order.v1.OrderItem', '10': 'orderItems'},
    {'1': 'total_price_in_cents', '3': 5, '4': 1, '5': 5, '10': 'totalPriceInCents'},
    {'1': 'status', '3': 6, '4': 1, '5': 14, '6': '.order.v1.OrderStatus', '10': 'status'},
  ],
  '8': [
    {'1': '_ref_id'},
    {'1': '_from_id'},
  ],
};

/// Descriptor for `Order`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List orderDescriptor = $convert.base64Decode(
    'CgVPcmRlchIaCgZyZWZfaWQYASABKAlIAFIFcmVmSWSIAQESHAoHZnJvbV9pZBgCIAEoCUgBUg'
    'Zmcm9tSWSIAQESJgoPaXNfY2xpZW50X29yZGVyGAMgASgJUg1pc0NsaWVudE9yZGVyEjQKC29y'
    'ZGVyX2l0ZW1zGAQgAygLMhMub3JkZXIudjEuT3JkZXJJdGVtUgpvcmRlckl0ZW1zEi8KFHRvdG'
    'FsX3ByaWNlX2luX2NlbnRzGAUgASgFUhF0b3RhbFByaWNlSW5DZW50cxItCgZzdGF0dXMYBiAB'
    'KA4yFS5vcmRlci52MS5PcmRlclN0YXR1c1IGc3RhdHVzQgkKB19yZWZfaWRCCgoIX2Zyb21faW'
    'Q=');

@$core.Deprecated('Use createOrderRequestDescriptor instead')
const CreateOrderRequest$json = {
  '1': 'CreateOrderRequest',
  '2': [
    {'1': 'order', '3': 1, '4': 1, '5': 11, '6': '.order.v1.Order', '10': 'order'},
    {'1': 'supplier_name', '3': 2, '4': 1, '5': 9, '9': 0, '10': 'supplierName', '17': true},
    {'1': 'business_id', '3': 3, '4': 1, '5': 9, '10': 'businessId'},
  ],
  '8': [
    {'1': '_supplier_name'},
  ],
};

/// Descriptor for `CreateOrderRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List createOrderRequestDescriptor = $convert.base64Decode(
    'ChJDcmVhdGVPcmRlclJlcXVlc3QSJQoFb3JkZXIYASABKAsyDy5vcmRlci52MS5PcmRlclIFb3'
    'JkZXISKAoNc3VwcGxpZXJfbmFtZRgCIAEoCUgAUgxzdXBwbGllck5hbWWIAQESHwoLYnVzaW5l'
    'c3NfaWQYAyABKAlSCmJ1c2luZXNzSWRCEAoOX3N1cHBsaWVyX25hbWU=');

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
    {'1': 'order', '3': 1, '4': 1, '5': 11, '6': '.order.v1.Order', '10': 'order'},
    {'1': 'created_at', '3': 2, '4': 1, '5': 9, '10': 'createdAt'},
    {'1': 'updated_at', '3': 3, '4': 1, '5': 9, '9': 0, '10': 'updatedAt', '17': true},
  ],
  '8': [
    {'1': '_updated_at'},
  ],
};

/// Descriptor for `GetOrderResponse`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List getOrderResponseDescriptor = $convert.base64Decode(
    'ChBHZXRPcmRlclJlc3BvbnNlEiUKBW9yZGVyGAEgASgLMg8ub3JkZXIudjEuT3JkZXJSBW9yZG'
    'VyEh0KCmNyZWF0ZWRfYXQYAiABKAlSCWNyZWF0ZWRBdBIiCgp1cGRhdGVkX2F0GAMgASgJSABS'
    'CXVwZGF0ZWRBdIgBAUINCgtfdXBkYXRlZF9hdA==');

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
final $typed_data.Uint8List deleteOrderResponseDescriptor = $convert.base64Decode(
    'ChNEZWxldGVPcmRlclJlc3BvbnNlEhgKB3N1Y2Nlc3MYASABKAhSB3N1Y2Nlc3M=');

const $core.Map<$core.String, $core.dynamic> OrderServiceBase$json = {
  '1': 'OrderService',
  '2': [
    {'1': 'CreateOrder', '2': '.order.v1.CreateOrderRequest', '3': '.order.v1.CreateOrderResponse', '4': {}},
    {'1': 'GetOrder', '2': '.order.v1.GetOrderRequest', '3': '.order.v1.GetOrderResponse', '4': {}},
    {'1': 'DeleteOrder', '2': '.order.v1.DeleteOrderRequest', '3': '.order.v1.DeleteOrderResponse', '4': {}},
  ],
};

@$core.Deprecated('Use orderServiceDescriptor instead')
const $core.Map<$core.String, $core.Map<$core.String, $core.dynamic>> OrderServiceBase$messageJson = {
  '.order.v1.CreateOrderRequest': CreateOrderRequest$json,
  '.order.v1.Order': Order$json,
  '.order.v1.OrderItem': OrderItem$json,
  '.order.v1.CreateOrderResponse': CreateOrderResponse$json,
  '.order.v1.GetOrderRequest': GetOrderRequest$json,
  '.order.v1.GetOrderResponse': GetOrderResponse$json,
  '.order.v1.DeleteOrderRequest': DeleteOrderRequest$json,
  '.order.v1.DeleteOrderResponse': DeleteOrderResponse$json,
};

/// Descriptor for `OrderService`. Decode as a `google.protobuf.ServiceDescriptorProto`.
final $typed_data.Uint8List orderServiceDescriptor = $convert.base64Decode(
    'CgxPcmRlclNlcnZpY2USTAoLQ3JlYXRlT3JkZXISHC5vcmRlci52MS5DcmVhdGVPcmRlclJlcX'
    'Vlc3QaHS5vcmRlci52MS5DcmVhdGVPcmRlclJlc3BvbnNlIgASQwoIR2V0T3JkZXISGS5vcmRl'
    'ci52MS5HZXRPcmRlclJlcXVlc3QaGi5vcmRlci52MS5HZXRPcmRlclJlc3BvbnNlIgASTAoLRG'
    'VsZXRlT3JkZXISHC5vcmRlci52MS5EZWxldGVPcmRlclJlcXVlc3QaHS5vcmRlci52MS5EZWxl'
    'dGVPcmRlclJlc3BvbnNlIgA=');

