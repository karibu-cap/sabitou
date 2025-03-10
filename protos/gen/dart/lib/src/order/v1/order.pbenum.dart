//
//  Generated code. Do not modify.
//  source: order/v1/order.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OrderStatus extends $pb.ProtobufEnum {
  static const OrderStatus ORDER_STATUS_UNSPECIFIED = OrderStatus._(0, _omitEnumNames ? '' : 'ORDER_STATUS_UNSPECIFIED');
  static const OrderStatus ORDER_STATUS_PENDING = OrderStatus._(1, _omitEnumNames ? '' : 'ORDER_STATUS_PENDING');
  static const OrderStatus ORDER_STATUS_PROCESSING = OrderStatus._(2, _omitEnumNames ? '' : 'ORDER_STATUS_PROCESSING');
  static const OrderStatus ORDER_STATUS_COMPLETED = OrderStatus._(3, _omitEnumNames ? '' : 'ORDER_STATUS_COMPLETED');
  static const OrderStatus ORDER_STATUS_CANCELLED = OrderStatus._(4, _omitEnumNames ? '' : 'ORDER_STATUS_CANCELLED');

  static const $core.List<OrderStatus> values = <OrderStatus> [
    ORDER_STATUS_UNSPECIFIED,
    ORDER_STATUS_PENDING,
    ORDER_STATUS_PROCESSING,
    ORDER_STATUS_COMPLETED,
    ORDER_STATUS_CANCELLED,
  ];

  static final $core.Map<$core.int, OrderStatus> _byValue = $pb.ProtobufEnum.initByValue(values);
  static OrderStatus? valueOf($core.int value) => _byValue[value];

  const OrderStatus._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
