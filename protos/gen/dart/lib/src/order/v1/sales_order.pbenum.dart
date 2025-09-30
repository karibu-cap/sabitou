// This is a generated file - do not edit.
//
// Generated from order/v1/sales_order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class SalesOrderStatus extends $pb.ProtobufEnum {
  static const SalesOrderStatus SO_STATUS_UNSPECIFIED =
      SalesOrderStatus._(0, _omitEnumNames ? '' : 'SO_STATUS_UNSPECIFIED');
  static const SalesOrderStatus SO_STATUS_DRAFT =
      SalesOrderStatus._(1, _omitEnumNames ? '' : 'SO_STATUS_DRAFT');
  static const SalesOrderStatus SO_STATUS_CONFIRMED =
      SalesOrderStatus._(2, _omitEnumNames ? '' : 'SO_STATUS_CONFIRMED');
  static const SalesOrderStatus SO_STATUS_PROCESSING =
      SalesOrderStatus._(3, _omitEnumNames ? '' : 'SO_STATUS_PROCESSING');
  static const SalesOrderStatus SO_STATUS_SHIPPED =
      SalesOrderStatus._(4, _omitEnumNames ? '' : 'SO_STATUS_SHIPPED');
  static const SalesOrderStatus SO_STATUS_DELIVERED =
      SalesOrderStatus._(5, _omitEnumNames ? '' : 'SO_STATUS_DELIVERED');
  static const SalesOrderStatus SO_STATUS_CANCELLED =
      SalesOrderStatus._(6, _omitEnumNames ? '' : 'SO_STATUS_CANCELLED');

  static const $core.List<SalesOrderStatus> values = <SalesOrderStatus>[
    SO_STATUS_UNSPECIFIED,
    SO_STATUS_DRAFT,
    SO_STATUS_CONFIRMED,
    SO_STATUS_PROCESSING,
    SO_STATUS_SHIPPED,
    SO_STATUS_DELIVERED,
    SO_STATUS_CANCELLED,
  ];

  static final $core.List<SalesOrderStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static SalesOrderStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SalesOrderStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
