// This is a generated file - do not edit.
//
// Generated from reports/v1/reports.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StockMovementCategory extends $pb.ProtobufEnum {
  static const StockMovementCategory STOCK_MOVEMENT_CATEGORY_UNSPECIFIED =
      StockMovementCategory._(
          0, _omitEnumNames ? '' : 'STOCK_MOVEMENT_CATEGORY_UNSPECIFIED');
  static const StockMovementCategory STOCK_MOVEMENT_CATEGORY_FAST =
      StockMovementCategory._(
          1, _omitEnumNames ? '' : 'STOCK_MOVEMENT_CATEGORY_FAST');
  static const StockMovementCategory STOCK_MOVEMENT_CATEGORY_MEDIUM =
      StockMovementCategory._(
          2, _omitEnumNames ? '' : 'STOCK_MOVEMENT_CATEGORY_MEDIUM');
  static const StockMovementCategory STOCK_MOVEMENT_CATEGORY_SLOW =
      StockMovementCategory._(
          3, _omitEnumNames ? '' : 'STOCK_MOVEMENT_CATEGORY_SLOW');
  static const StockMovementCategory STOCK_MOVEMENT_CATEGORY_VERY_SLOW =
      StockMovementCategory._(
          4, _omitEnumNames ? '' : 'STOCK_MOVEMENT_CATEGORY_VERY_SLOW');

  static const $core.List<StockMovementCategory> values =
      <StockMovementCategory>[
    STOCK_MOVEMENT_CATEGORY_UNSPECIFIED,
    STOCK_MOVEMENT_CATEGORY_FAST,
    STOCK_MOVEMENT_CATEGORY_MEDIUM,
    STOCK_MOVEMENT_CATEGORY_SLOW,
    STOCK_MOVEMENT_CATEGORY_VERY_SLOW,
  ];

  static final $core.List<StockMovementCategory?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static StockMovementCategory? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StockMovementCategory._(super.value, super.name);
}

class ReportGroupBy extends $pb.ProtobufEnum {
  static const ReportGroupBy REPORT_GROUP_BY_UNSPECIFIED =
      ReportGroupBy._(0, _omitEnumNames ? '' : 'REPORT_GROUP_BY_UNSPECIFIED');
  static const ReportGroupBy REPORT_GROUP_BY_DAILY =
      ReportGroupBy._(1, _omitEnumNames ? '' : 'REPORT_GROUP_BY_DAILY');
  static const ReportGroupBy REPORT_GROUP_BY_WEEKLY =
      ReportGroupBy._(2, _omitEnumNames ? '' : 'REPORT_GROUP_BY_WEEKLY');
  static const ReportGroupBy REPORT_GROUP_BY_MONTHLY =
      ReportGroupBy._(3, _omitEnumNames ? '' : 'REPORT_GROUP_BY_MONTHLY');
  static const ReportGroupBy REPORT_GROUP_BY_QUARTERLY =
      ReportGroupBy._(4, _omitEnumNames ? '' : 'REPORT_GROUP_BY_QUARTERLY');
  static const ReportGroupBy REPORT_GROUP_BY_YEARLY =
      ReportGroupBy._(5, _omitEnumNames ? '' : 'REPORT_GROUP_BY_YEARLY');

  static const $core.List<ReportGroupBy> values = <ReportGroupBy>[
    REPORT_GROUP_BY_UNSPECIFIED,
    REPORT_GROUP_BY_DAILY,
    REPORT_GROUP_BY_WEEKLY,
    REPORT_GROUP_BY_MONTHLY,
    REPORT_GROUP_BY_QUARTERLY,
    REPORT_GROUP_BY_YEARLY,
  ];

  static final $core.List<ReportGroupBy?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ReportGroupBy? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReportGroupBy._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
