// This is a generated file - do not edit.
//
// Generated from logistic/v1/bill.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BillStatus extends $pb.ProtobufEnum {
  static const BillStatus BILL_STATUS_UNSPECIFIED =
      BillStatus._(0, _omitEnumNames ? '' : 'BILL_STATUS_UNSPECIFIED');
  static const BillStatus BILL_STATUS_DRAFT =
      BillStatus._(1, _omitEnumNames ? '' : 'BILL_STATUS_DRAFT');
  static const BillStatus BILL_STATUS_OPEN =
      BillStatus._(2, _omitEnumNames ? '' : 'BILL_STATUS_OPEN');
  static const BillStatus BILL_STATUS_PAID =
      BillStatus._(3, _omitEnumNames ? '' : 'BILL_STATUS_PAID');
  static const BillStatus BILL_STATUS_VOID =
      BillStatus._(4, _omitEnumNames ? '' : 'BILL_STATUS_VOID');
  static const BillStatus BILL_STATUS_OVERDUE =
      BillStatus._(5, _omitEnumNames ? '' : 'BILL_STATUS_OVERDUE');
  static const BillStatus BILL_STATUS_PARTIALLY_PAID =
      BillStatus._(6, _omitEnumNames ? '' : 'BILL_STATUS_PARTIALLY_PAID');

  static const $core.List<BillStatus> values = <BillStatus>[
    BILL_STATUS_UNSPECIFIED,
    BILL_STATUS_DRAFT,
    BILL_STATUS_OPEN,
    BILL_STATUS_PAID,
    BILL_STATUS_VOID,
    BILL_STATUS_OVERDUE,
    BILL_STATUS_PARTIALLY_PAID,
  ];

  static final $core.List<BillStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static BillStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BillStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
