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
  static const StoreMemberStatus STORE_MEMBER_STATUS_ACTIVE =
      StoreMemberStatus._(
          1, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_ACTIVE');
  static const StoreMemberStatus STORE_MEMBER_STATUS_PENDING =
      StoreMemberStatus._(
          2, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_PENDING');
  static const StoreMemberStatus STORE_MEMBER_STATUS_INACTIVE =
      StoreMemberStatus._(
          3, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_INACTIVE');
  static const StoreMemberStatus STORE_MEMBER_STATUS_BANNED =
      StoreMemberStatus._(
          4, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_BANNED');
  static const StoreMemberStatus STORE_MEMBER_STATUS_REJECTED =
      StoreMemberStatus._(
          5, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_REJECTED');
  static const StoreMemberStatus STORE_MEMBER_STATUS_EXPIRED =
      StoreMemberStatus._(
          6, _omitEnumNames ? '' : 'STORE_MEMBER_STATUS_EXPIRED');

  static const $core.List<StoreMemberStatus> values = <StoreMemberStatus>[
    STORE_MEMBER_STATUS_UNSPECIFIED,
    STORE_MEMBER_STATUS_ACTIVE,
    STORE_MEMBER_STATUS_PENDING,
    STORE_MEMBER_STATUS_INACTIVE,
    STORE_MEMBER_STATUS_BANNED,
    STORE_MEMBER_STATUS_REJECTED,
    STORE_MEMBER_STATUS_EXPIRED,
  ];

  static final $core.List<StoreMemberStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static StoreMemberStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StoreMemberStatus._(super.value, super.name);
}

class OnboardingType extends $pb.ProtobufEnum {
  static const OnboardingType ONBOARDING_TYPE_UNSPECIFIED =
      OnboardingType._(0, _omitEnumNames ? '' : 'ONBOARDING_TYPE_UNSPECIFIED');

  /// admin created with password → active immediately
  static const OnboardingType ONBOARDING_TYPE_DIRECT =
      OnboardingType._(1, _omitEnumNames ? '' : 'ONBOARDING_TYPE_DIRECT');

  /// invitation email sent → user sets own password
  static const OnboardingType ONBOARDING_TYPE_INVITE =
      OnboardingType._(2, _omitEnumNames ? '' : 'ONBOARDING_TYPE_INVITE');

  static const $core.List<OnboardingType> values = <OnboardingType>[
    ONBOARDING_TYPE_UNSPECIFIED,
    ONBOARDING_TYPE_DIRECT,
    ONBOARDING_TYPE_INVITE,
  ];

  static final $core.List<OnboardingType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static OnboardingType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const OnboardingType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
