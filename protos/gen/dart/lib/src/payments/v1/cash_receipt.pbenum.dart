// This is a generated file - do not edit.
//
// Generated from payments/v1/cash_receipt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CashReceiptStatus extends $pb.ProtobufEnum {
  static const CashReceiptStatus CASH_RECEIPT_STATUS_UNSPECIFIED =
      CashReceiptStatus._(
          0, _omitEnumNames ? '' : 'CASH_RECEIPT_STATUS_UNSPECIFIED');
  static const CashReceiptStatus CASH_RECEIPT_STATUS_DRAFT =
      CashReceiptStatus._(1, _omitEnumNames ? '' : 'CASH_RECEIPT_STATUS_DRAFT');
  static const CashReceiptStatus CASH_RECEIPT_STATUS_COMPLETED =
      CashReceiptStatus._(
          2, _omitEnumNames ? '' : 'CASH_RECEIPT_STATUS_COMPLETED');
  static const CashReceiptStatus CASH_RECEIPT_STATUS_VOIDED =
      CashReceiptStatus._(
          3, _omitEnumNames ? '' : 'CASH_RECEIPT_STATUS_VOIDED');
  static const CashReceiptStatus CASH_RECEIPT_STATUS_REFUNDED =
      CashReceiptStatus._(
          4, _omitEnumNames ? '' : 'CASH_RECEIPT_STATUS_REFUNDED');

  static const $core.List<CashReceiptStatus> values = <CashReceiptStatus>[
    CASH_RECEIPT_STATUS_UNSPECIFIED,
    CASH_RECEIPT_STATUS_DRAFT,
    CASH_RECEIPT_STATUS_COMPLETED,
    CASH_RECEIPT_STATUS_VOIDED,
    CASH_RECEIPT_STATUS_REFUNDED,
  ];

  static final $core.List<CashReceiptStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static CashReceiptStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CashReceiptStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
