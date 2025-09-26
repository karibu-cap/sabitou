// This is a generated file - do not edit.
//
// Generated from inventory/v1/stock_in_bound.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InboundType extends $pb.ProtobufEnum {
  static const InboundType INBOUND_TYPE_UNSPECIFIED =
      InboundType._(0, _omitEnumNames ? '' : 'INBOUND_TYPE_UNSPECIFIED');

  /// New stock added (purchase, restocking)
  static const InboundType INBOUND_TYPE_STOCK_IN =
      InboundType._(1, _omitEnumNames ? '' : 'INBOUND_TYPE_STOCK_IN');

  /// Customer returns
  static const InboundType INBOUND_TYPE_CUSTOMER_RETURN =
      InboundType._(2, _omitEnumNames ? '' : 'INBOUND_TYPE_CUSTOMER_RETURN');

  /// Inventory adjustments (optional for audit trail)
  /// e.g. correction of stock count
  static const InboundType INBOUND_TYPE_ADJUSTMENT =
      InboundType._(3, _omitEnumNames ? '' : 'INBOUND_TYPE_ADJUSTMENT');

  static const $core.List<InboundType> values = <InboundType>[
    INBOUND_TYPE_UNSPECIFIED,
    INBOUND_TYPE_STOCK_IN,
    INBOUND_TYPE_CUSTOMER_RETURN,
    INBOUND_TYPE_ADJUSTMENT,
  ];

  static final $core.List<InboundType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static InboundType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InboundType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
