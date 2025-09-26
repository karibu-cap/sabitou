// This is a generated file - do not edit.
//
// Generated from store/v1/store.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class StoreCostingMethod extends $pb.ProtobufEnum {
  static const StoreCostingMethod STORE_COSTING_METHOD_UNSPECIFIED =
      StoreCostingMethod._(
          0, _omitEnumNames ? '' : 'STORE_COSTING_METHOD_UNSPECIFIED');

  /// / The store uses the FIFO method.
  static const StoreCostingMethod STORE_COSTING_METHOD_FIFO =
      StoreCostingMethod._(
          1, _omitEnumNames ? '' : 'STORE_COSTING_METHOD_FIFO');

  /// / The store uses the Average method.
  static const StoreCostingMethod STORE_COSTING_METHOD_AVERAGE =
      StoreCostingMethod._(
          2, _omitEnumNames ? '' : 'STORE_COSTING_METHOD_AVERAGE');

  static const $core.List<StoreCostingMethod> values = <StoreCostingMethod>[
    STORE_COSTING_METHOD_UNSPECIFIED,
    STORE_COSTING_METHOD_FIFO,
    STORE_COSTING_METHOD_AVERAGE,
  ];

  static final $core.List<StoreCostingMethod?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static StoreCostingMethod? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StoreCostingMethod._(super.value, super.name);
}

class StoreMemberStatus extends $pb.ProtobufEnum {
  static const StoreMemberStatus STORE_MEMBER_STATUS_UNSPECIFIED =
      StoreMemberStatus._(
          0, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_UNSPECIFIED');

  /// / The user is active.
  static const StoreMemberStatus STORE_MEMBER_STATUS_ACTIVE =
      StoreMemberStatus._(
          1, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_ACTIVE');

  /// / The user is pending.
  static const StoreMemberStatus STORE_MEMBER_STATUS_PENDING =
      StoreMemberStatus._(
          2, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_PENDING');

  /// / The user is inactive.
  static const StoreMemberStatus STORE_MEMBER_STATUS_INACTIVE =
      StoreMemberStatus._(
          3, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_INACTIVE');

  /// / The user is banned.
  static const StoreMemberStatus STORE_MEMBER_STATUS_BANNED =
      StoreMemberStatus._(
          4, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_BANNED');

  static const $core.List<StoreMemberStatus> values = <StoreMemberStatus>[
    STORE_MEMBER_STATUS_UNSPECIFIED,
    STORE_MEMBER_STATUS_ACTIVE,
    STORE_MEMBER_STATUS_PENDING,
    STORE_MEMBER_STATUS_INACTIVE,
    STORE_MEMBER_STATUS_BANNED,
  ];

  static final $core.List<StoreMemberStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static StoreMemberStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StoreMemberStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
