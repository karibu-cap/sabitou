// This is a generated file - do not edit.
//
// Generated from order/v1/voucher.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class VoucherStatus extends $pb.ProtobufEnum {
  static const VoucherStatus VOUCHER_STATUS_UNSPECIFIED =
      VoucherStatus._(0, _omitEnumNames ? '' : 'VOUCHER_STATUS_UNSPECIFIED');
  static const VoucherStatus VOUCHER_STATUS_ISSUED =
      VoucherStatus._(1, _omitEnumNames ? '' : 'VOUCHER_STATUS_ISSUED');
  static const VoucherStatus VOUCHER_STATUS_REDEEMED =
      VoucherStatus._(2, _omitEnumNames ? '' : 'VOUCHER_STATUS_REDEEMED');
  static const VoucherStatus VOUCHER_STATUS_EXPIRED =
      VoucherStatus._(3, _omitEnumNames ? '' : 'VOUCHER_STATUS_EXPIRED');

  static const $core.List<VoucherStatus> values = <VoucherStatus>[
    VOUCHER_STATUS_UNSPECIFIED,
    VOUCHER_STATUS_ISSUED,
    VOUCHER_STATUS_REDEEMED,
    VOUCHER_STATUS_EXPIRED,
  ];

  static final $core.List<VoucherStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static VoucherStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const VoucherStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
