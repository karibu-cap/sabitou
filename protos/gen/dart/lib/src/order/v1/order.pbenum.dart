// This is a generated file - do not edit.
//
// Generated from order/v1/order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class OrderStatus extends $pb.ProtobufEnum {
  static const OrderStatus ORDER_STATUS_UNSPECIFIED =
      OrderStatus._(0, _omitEnumNames ? '' : 'ORDER_STATUS_UNSPECIFIED');
  static const OrderStatus ORDER_STATUS_PENDING =
      OrderStatus._(1, _omitEnumNames ? '' : 'ORDER_STATUS_PENDING');
  static const OrderStatus ORDER_STATUS_PROCESSING =
      OrderStatus._(2, _omitEnumNames ? '' : 'ORDER_STATUS_PROCESSING');
  static const OrderStatus ORDER_STATUS_COMPLETED =
      OrderStatus._(3, _omitEnumNames ? '' : 'ORDER_STATUS_COMPLETED');
  static const OrderStatus ORDER_STATUS_CANCELLED =
      OrderStatus._(4, _omitEnumNames ? '' : 'ORDER_STATUS_CANCELLED');

  static const $core.List<OrderStatus> values = <OrderStatus>[
    ORDER_STATUS_UNSPECIFIED,
    ORDER_STATUS_PENDING,
    ORDER_STATUS_PROCESSING,
    ORDER_STATUS_COMPLETED,
    ORDER_STATUS_CANCELLED,
  ];

  static final $core.List<OrderStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static OrderStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OrderStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
