// This is a generated file - do not edit.
//
// Generated from financial/v1/invoice.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InvoiceType extends $pb.ProtobufEnum {
  static const InvoiceType INVOICE_TYPE_UNSPECIFIED =
      InvoiceType._(0, _omitEnumNames ? '' : 'INVOICE_TYPE_UNSPECIFIED');
  static const InvoiceType INVOICE_TYPE_SALES =
      InvoiceType._(1, _omitEnumNames ? '' : 'INVOICE_TYPE_SALES');
  static const InvoiceType INVOICE_TYPE_PURCHASE =
      InvoiceType._(2, _omitEnumNames ? '' : 'INVOICE_TYPE_PURCHASE');

  static const $core.List<InvoiceType> values = <InvoiceType>[
    INVOICE_TYPE_UNSPECIFIED,
    INVOICE_TYPE_SALES,
    INVOICE_TYPE_PURCHASE,
  ];

  static final $core.List<InvoiceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static InvoiceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InvoiceType._(super.value, super.name);
}

class InvoiceStatus extends $pb.ProtobufEnum {
  static const InvoiceStatus INVOICE_STATUS_UNSPECIFIED =
      InvoiceStatus._(0, _omitEnumNames ? '' : 'INVOICE_STATUS_UNSPECIFIED');
  static const InvoiceStatus INVOICE_STATUS_DRAFT =
      InvoiceStatus._(1, _omitEnumNames ? '' : 'INVOICE_STATUS_DRAFT');
  static const InvoiceStatus INVOICE_STATUS_ISSUED =
      InvoiceStatus._(2, _omitEnumNames ? '' : 'INVOICE_STATUS_ISSUED');
  static const InvoiceStatus INVOICE_STATUS_UNPAID =
      InvoiceStatus._(3, _omitEnumNames ? '' : 'INVOICE_STATUS_UNPAID');
  static const InvoiceStatus INVOICE_STATUS_PARTIALLY_PAID =
      InvoiceStatus._(4, _omitEnumNames ? '' : 'INVOICE_STATUS_PARTIALLY_PAID');
  static const InvoiceStatus INVOICE_STATUS_PAID =
      InvoiceStatus._(5, _omitEnumNames ? '' : 'INVOICE_STATUS_PAID');
  static const InvoiceStatus INVOICE_STATUS_OVERDUE =
      InvoiceStatus._(6, _omitEnumNames ? '' : 'INVOICE_STATUS_OVERDUE');
  static const InvoiceStatus INVOICE_STATUS_CANCELLED =
      InvoiceStatus._(7, _omitEnumNames ? '' : 'INVOICE_STATUS_CANCELLED');
  static const InvoiceStatus INVOICE_STATUS_CREDITED =
      InvoiceStatus._(8, _omitEnumNames ? '' : 'INVOICE_STATUS_CREDITED');

  static const $core.List<InvoiceStatus> values = <InvoiceStatus>[
    INVOICE_STATUS_UNSPECIFIED,
    INVOICE_STATUS_DRAFT,
    INVOICE_STATUS_ISSUED,
    INVOICE_STATUS_UNPAID,
    INVOICE_STATUS_PARTIALLY_PAID,
    INVOICE_STATUS_PAID,
    INVOICE_STATUS_OVERDUE,
    INVOICE_STATUS_CANCELLED,
    INVOICE_STATUS_CREDITED,
  ];

  static final $core.List<InvoiceStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 8);
  static InvoiceStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InvoiceStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
