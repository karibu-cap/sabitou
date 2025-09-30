// This is a generated file - do not edit.
//
// Generated from inventory/v1/inventory.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BatchStatus extends $pb.ProtobufEnum {
  static const BatchStatus BATCH_STATUS_UNSPECIFIED =
      BatchStatus._(0, _omitEnumNames ? '' : 'BATCH_STATUS_UNSPECIFIED');
  static const BatchStatus BATCH_STATUS_ACTIVE =
      BatchStatus._(1, _omitEnumNames ? '' : 'BATCH_STATUS_ACTIVE');
  static const BatchStatus BATCH_STATUS_QUARANTINE =
      BatchStatus._(2, _omitEnumNames ? '' : 'BATCH_STATUS_QUARANTINE');
  static const BatchStatus BATCH_STATUS_EXPIRED =
      BatchStatus._(3, _omitEnumNames ? '' : 'BATCH_STATUS_EXPIRED');
  static const BatchStatus BATCH_STATUS_CONSUMED =
      BatchStatus._(4, _omitEnumNames ? '' : 'BATCH_STATUS_CONSUMED');

  static const $core.List<BatchStatus> values = <BatchStatus>[
    BATCH_STATUS_UNSPECIFIED,
    BATCH_STATUS_ACTIVE,
    BATCH_STATUS_QUARANTINE,
    BATCH_STATUS_EXPIRED,
    BATCH_STATUS_CONSUMED,
  ];

  static final $core.List<BatchStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static BatchStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BatchStatus._(super.value, super.name);
}

class StockStatus extends $pb.ProtobufEnum {
  static const StockStatus STOCK_STATUS_UNSPECIFIED =
      StockStatus._(0, _omitEnumNames ? '' : 'STOCK_STATUS_UNSPECIFIED');
  static const StockStatus STOCK_STATUS_LOW =
      StockStatus._(1, _omitEnumNames ? '' : 'STOCK_STATUS_LOW');
  static const StockStatus STOCK_STATUS_OK =
      StockStatus._(2, _omitEnumNames ? '' : 'STOCK_STATUS_OK');
  static const StockStatus STOCK_STATUS_OUT_OF_STOCK =
      StockStatus._(3, _omitEnumNames ? '' : 'STOCK_STATUS_OUT_OF_STOCK');

  static const $core.List<StockStatus> values = <StockStatus>[
    STOCK_STATUS_UNSPECIFIED,
    STOCK_STATUS_LOW,
    STOCK_STATUS_OK,
    STOCK_STATUS_OUT_OF_STOCK,
  ];

  static final $core.List<StockStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static StockStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StockStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
