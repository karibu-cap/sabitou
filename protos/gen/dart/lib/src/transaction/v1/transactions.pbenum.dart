// This is a generated file - do not edit.
//
// Generated from transaction/v1/transactions.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class TransactionType extends $pb.ProtobufEnum {
  static const TransactionType TRANSACTION_TYPE_UNSPECIFIED = TransactionType._(
      0, _omitEnumNames ? '' : 'TRANSACTION_TYPE_UNSPECIFIED');

  /// Transaction link to a sale (client).
  static const TransactionType TRANSACTION_TYPE_SALE =
      TransactionType._(1, _omitEnumNames ? '' : 'TRANSACTION_TYPE_SALE');

  /// Transaction link to a purchase (supplier).
  static const TransactionType TRANSACTION_TYPE_PURCHASE =
      TransactionType._(2, _omitEnumNames ? '' : 'TRANSACTION_TYPE_PURCHASE');

  /// Transaction link to a refund (order).
  static const TransactionType TRANSACTION_TYPE_REFUND =
      TransactionType._(3, _omitEnumNames ? '' : 'TRANSACTION_TYPE_REFUND');

  /// Stock adjustment (ex. : loss, damage).
  static const TransactionType TRANSACTION_TYPE_ADJUSTMENT =
      TransactionType._(4, _omitEnumNames ? '' : 'TRANSACTION_TYPE_ADJUSTMENT');

  /// Stock transfer between stores.
  static const TransactionType TRANSACTION_TYPE_TRANSFER =
      TransactionType._(5, _omitEnumNames ? '' : 'TRANSACTION_TYPE_TRANSFER');

  /// Fees associated (ex. : transport, taxes).
  static const TransactionType TRANSACTION_TYPE_FEE =
      TransactionType._(6, _omitEnumNames ? '' : 'TRANSACTION_TYPE_FEE');

  static const $core.List<TransactionType> values = <TransactionType>[
    TRANSACTION_TYPE_UNSPECIFIED,
    TRANSACTION_TYPE_SALE,
    TRANSACTION_TYPE_PURCHASE,
    TRANSACTION_TYPE_REFUND,
    TRANSACTION_TYPE_ADJUSTMENT,
    TRANSACTION_TYPE_TRANSFER,
    TRANSACTION_TYPE_FEE,
  ];

  static final $core.List<TransactionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static TransactionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TransactionType._(super.value, super.name);
}

class TransactionStatus extends $pb.ProtobufEnum {
  static const TransactionStatus TRANSACTION_STATUS_UNSPECIFIED =
      TransactionStatus._(
          0, _omitEnumNames ? '' : 'TRANSACTION_STATUS_UNSPECIFIED');

  /// Transaction is pending (ex. : payment not confirmed).
  static const TransactionStatus TRANSACTION_STATUS_PENDING =
      TransactionStatus._(
          1, _omitEnumNames ? '' : 'TRANSACTION_STATUS_PENDING');

  /// Transaction is completed.
  static const TransactionStatus TRANSACTION_STATUS_COMPLETED =
      TransactionStatus._(
          2, _omitEnumNames ? '' : 'TRANSACTION_STATUS_COMPLETED');

  /// Transaction failed (ex. : payment refused).
  static const TransactionStatus TRANSACTION_STATUS_FAILED =
      TransactionStatus._(3, _omitEnumNames ? '' : 'TRANSACTION_STATUS_FAILED');

  /// Transaction is cancelled.
  static const TransactionStatus TRANSACTION_STATUS_CANCELLED =
      TransactionStatus._(
          4, _omitEnumNames ? '' : 'TRANSACTION_STATUS_CANCELLED');

  static const $core.List<TransactionStatus> values = <TransactionStatus>[
    TRANSACTION_STATUS_UNSPECIFIED,
    TRANSACTION_STATUS_PENDING,
    TRANSACTION_STATUS_COMPLETED,
    TRANSACTION_STATUS_FAILED,
    TRANSACTION_STATUS_CANCELLED,
  ];

  static final $core.List<TransactionStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static TransactionStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const TransactionStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
