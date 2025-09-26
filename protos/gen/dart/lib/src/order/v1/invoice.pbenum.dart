// This is a generated file - do not edit.
//
// Generated from order/v1/invoice.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class InvoiceStatus extends $pb.ProtobufEnum {
  static const InvoiceStatus INVOICE_STATUS_UNSPECIFIED =
      InvoiceStatus._(0, _omitEnumNames ? '' : 'INVOICE_STATUS_UNSPECIFIED');

  /// Invoice is paid.
  static const InvoiceStatus INVOICE_STATUS_PAID =
      InvoiceStatus._(1, _omitEnumNames ? '' : 'INVOICE_STATUS_PAID');

  /// Wait for refund.
  static const InvoiceStatus INVOICE_STATUS_PENDING_REFUND =
      InvoiceStatus._(2, _omitEnumNames ? '' : 'INVOICE_STATUS_PENDING_REFUND');

  static const $core.List<InvoiceStatus> values = <InvoiceStatus>[
    INVOICE_STATUS_UNSPECIFIED,
    INVOICE_STATUS_PAID,
    INVOICE_STATUS_PENDING_REFUND,
  ];

  static final $core.List<InvoiceStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static InvoiceStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InvoiceStatus._(super.value, super.name);
}

class PaymentMethod extends $pb.ProtobufEnum {
  static const PaymentMethod PAYMENT_METHOD_UNSPECIFIED =
      PaymentMethod._(0, _omitEnumNames ? '' : 'PAYMENT_METHOD_UNSPECIFIED');
  static const PaymentMethod PAYMENT_METHOD_CASH =
      PaymentMethod._(1, _omitEnumNames ? '' : 'PAYMENT_METHOD_CASH');
  static const PaymentMethod PAYMENT_METHOD_CARD =
      PaymentMethod._(2, _omitEnumNames ? '' : 'PAYMENT_METHOD_CARD');
  static const PaymentMethod PAYMENT_METHOD_ORANGE_MONEY =
      PaymentMethod._(3, _omitEnumNames ? '' : 'PAYMENT_METHOD_ORANGE_MONEY');
  static const PaymentMethod PAYMENT_METHOD_MTN_MONEY =
      PaymentMethod._(4, _omitEnumNames ? '' : 'PAYMENT_METHOD_MTN_MONEY');
  static const PaymentMethod PAYMENT_METHOD_VOUCHER =
      PaymentMethod._(5, _omitEnumNames ? '' : 'PAYMENT_METHOD_VOUCHER');
  static const PaymentMethod PAYMENT_METHOD_MOBILE =
      PaymentMethod._(6, _omitEnumNames ? '' : 'PAYMENT_METHOD_MOBILE');

  static const $core.List<PaymentMethod> values = <PaymentMethod>[
    PAYMENT_METHOD_UNSPECIFIED,
    PAYMENT_METHOD_CASH,
    PAYMENT_METHOD_CARD,
    PAYMENT_METHOD_ORANGE_MONEY,
    PAYMENT_METHOD_MTN_MONEY,
    PAYMENT_METHOD_VOUCHER,
    PAYMENT_METHOD_MOBILE,
  ];

  static final $core.List<PaymentMethod?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static PaymentMethod? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PaymentMethod._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
