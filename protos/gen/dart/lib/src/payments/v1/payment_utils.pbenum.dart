// This is a generated file - do not edit.
//
// Generated from payments/v1/payment_utils.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PaymentMethod extends $pb.ProtobufEnum {
  static const PaymentMethod PAYMENT_METHOD_UNSPECIFIED =
      PaymentMethod._(0, _omitEnumNames ? '' : 'PAYMENT_METHOD_UNSPECIFIED');
  static const PaymentMethod PAYMENT_METHOD_CASH =
      PaymentMethod._(1, _omitEnumNames ? '' : 'PAYMENT_METHOD_CASH');
  static const PaymentMethod PAYMENT_METHOD_CHECK =
      PaymentMethod._(2, _omitEnumNames ? '' : 'PAYMENT_METHOD_CHECK');
  static const PaymentMethod PAYMENT_METHOD_BANK_TRANSFER =
      PaymentMethod._(3, _omitEnumNames ? '' : 'PAYMENT_METHOD_BANK_TRANSFER');
  static const PaymentMethod PAYMENT_METHOD_CREDIT_CARD =
      PaymentMethod._(4, _omitEnumNames ? '' : 'PAYMENT_METHOD_CREDIT_CARD');
  static const PaymentMethod PAYMENT_METHOD_MOBILE_MONEY =
      PaymentMethod._(5, _omitEnumNames ? '' : 'PAYMENT_METHOD_MOBILE_MONEY');
  static const PaymentMethod PAYMENT_METHOD_STORE_CREDIT =
      PaymentMethod._(6, _omitEnumNames ? '' : 'PAYMENT_METHOD_STORE_CREDIT');

  static const $core.List<PaymentMethod> values = <PaymentMethod>[
    PAYMENT_METHOD_UNSPECIFIED,
    PAYMENT_METHOD_CASH,
    PAYMENT_METHOD_CHECK,
    PAYMENT_METHOD_BANK_TRANSFER,
    PAYMENT_METHOD_CREDIT_CARD,
    PAYMENT_METHOD_MOBILE_MONEY,
    PAYMENT_METHOD_STORE_CREDIT,
  ];

  static final $core.List<PaymentMethod?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static PaymentMethod? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const PaymentMethod._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
