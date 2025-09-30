// This is a generated file - do not edit.
//
// Generated from audits/v1/inventory_transaction.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TransactionType extends $pb.ProtobufEnum {
  static const TransactionType TXN_TYPE_UNSPECIFIED =
      TransactionType._(0, _omitEnumNames ? '' : 'TXN_TYPE_UNSPECIFIED');
  static const TransactionType TXN_TYPE_PURCHASE =
      TransactionType._(1, _omitEnumNames ? '' : 'TXN_TYPE_PURCHASE');
  static const TransactionType TXN_TYPE_SALE =
      TransactionType._(2, _omitEnumNames ? '' : 'TXN_TYPE_SALE');
  static const TransactionType TXN_TYPE_RETURN_IN =
      TransactionType._(3, _omitEnumNames ? '' : 'TXN_TYPE_RETURN_IN');
  static const TransactionType TXN_TYPE_RETURN_OUT =
      TransactionType._(4, _omitEnumNames ? '' : 'TXN_TYPE_RETURN_OUT');
  static const TransactionType TXN_TYPE_TRANSFER_OUT =
      TransactionType._(5, _omitEnumNames ? '' : 'TXN_TYPE_TRANSFER_OUT');
  static const TransactionType TXN_TYPE_TRANSFER_IN =
      TransactionType._(6, _omitEnumNames ? '' : 'TXN_TYPE_TRANSFER_IN');
  static const TransactionType TXN_TYPE_ADJUSTMENT =
      TransactionType._(7, _omitEnumNames ? '' : 'TXN_TYPE_ADJUSTMENT');
  static const TransactionType TXN_TYPE_DAMAGE =
      TransactionType._(8, _omitEnumNames ? '' : 'TXN_TYPE_DAMAGE');
  static const TransactionType TXN_TYPE_THEFT =
      TransactionType._(9, _omitEnumNames ? '' : 'TXN_TYPE_THEFT');
  static const TransactionType TXN_TYPE_INITIAL =
      TransactionType._(10, _omitEnumNames ? '' : 'TXN_TYPE_INITIAL');
  static const TransactionType TXN_TYPE_EXPIRATION =
      TransactionType._(11, _omitEnumNames ? '' : 'TXN_TYPE_EXPIRATION');

  static const $core.List<TransactionType> values = <TransactionType>[
    TXN_TYPE_UNSPECIFIED,
    TXN_TYPE_PURCHASE,
    TXN_TYPE_SALE,
    TXN_TYPE_RETURN_IN,
    TXN_TYPE_RETURN_OUT,
    TXN_TYPE_TRANSFER_OUT,
    TXN_TYPE_TRANSFER_IN,
    TXN_TYPE_ADJUSTMENT,
    TXN_TYPE_DAMAGE,
    TXN_TYPE_THEFT,
    TXN_TYPE_INITIAL,
    TXN_TYPE_EXPIRATION,
  ];

  static final $core.List<TransactionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 11);
  static TransactionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TransactionType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
