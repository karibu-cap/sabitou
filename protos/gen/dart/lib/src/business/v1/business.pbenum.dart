// This is a generated file - do not edit.
//
// Generated from business/v1/business.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BusinessStatusType extends $pb.ProtobufEnum {
  static const BusinessStatusType BUSINESS_STATUS_TYPE_UNSPECIFIED =
      BusinessStatusType._(
          0, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_UNSPECIFIED');
  static const BusinessStatusType BUSINESS_STATUS_TYPE_ACTIVE =
      BusinessStatusType._(
          1, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_ACTIVE');
  static const BusinessStatusType BUSINESS_STATUS_TYPE_INACTIVE =
      BusinessStatusType._(
          2, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_INACTIVE');

  static const $core.List<BusinessStatusType> values = <BusinessStatusType>[
    BUSINESS_STATUS_TYPE_UNSPECIFIED,
    BUSINESS_STATUS_TYPE_ACTIVE,
    BUSINESS_STATUS_TYPE_INACTIVE,
  ];

  static final $core.List<BusinessStatusType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static BusinessStatusType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BusinessStatusType._(super.value, super.name);
}

class CurrencyChangePolicyType extends $pb.ProtobufEnum {
  static const CurrencyChangePolicyType
      CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED = CurrencyChangePolicyType._(
          0, _omitEnumNames ? '' : 'CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED');
  static const CurrencyChangePolicyType
      CURRENCY_CHANGE_POLICY_TYPE_KEEP_PREVIOUS_CURRENCY_VALUE =
      CurrencyChangePolicyType._(
          1,
          _omitEnumNames
              ? ''
              : 'CURRENCY_CHANGE_POLICY_TYPE_KEEP_PREVIOUS_CURRENCY_VALUE');
  static const CurrencyChangePolicyType
      CURRENCY_CHANGE_POLICY_TYPE_CONVERT_BASED_ON_CURRENT_EXCHANGE_RATE =
      CurrencyChangePolicyType._(
          2,
          _omitEnumNames
              ? ''
              : 'CURRENCY_CHANGE_POLICY_TYPE_CONVERT_BASED_ON_CURRENT_EXCHANGE_RATE');

  static const $core.List<CurrencyChangePolicyType> values =
      <CurrencyChangePolicyType>[
    CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED,
    CURRENCY_CHANGE_POLICY_TYPE_KEEP_PREVIOUS_CURRENCY_VALUE,
    CURRENCY_CHANGE_POLICY_TYPE_CONVERT_BASED_ON_CURRENT_EXCHANGE_RATE,
  ];

  static final $core.List<CurrencyChangePolicyType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static CurrencyChangePolicyType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CurrencyChangePolicyType._(super.value, super.name);
}

class BusinessMemberStatus extends $pb.ProtobufEnum {
  static const BusinessMemberStatus BUSINESS_MEMBER_STATUS_UNSPECIFIED =
      BusinessMemberStatus._(
          0, _omitEnumNames ? '' : 'BUSINESS_MEMBER_STATUS_UNSPECIFIED');

  /// / The user is active.
  static const BusinessMemberStatus BUSINESS_MEMBER_STATUS_ACTIVE =
      BusinessMemberStatus._(
          1, _omitEnumNames ? '' : 'BUSINESS_MEMBER_STATUS_ACTIVE');

  /// / The user is pending.
  static const BusinessMemberStatus BUSINESS_MEMBER_STATUS_PENDING =
      BusinessMemberStatus._(
          2, _omitEnumNames ? '' : 'BUSINESS_MEMBER_STATUS_PENDING');

  /// / The user is inactive.
  static const BusinessMemberStatus BUSINESS_MEMBER_STATUS_INACTIVE =
      BusinessMemberStatus._(
          3, _omitEnumNames ? '' : 'BUSINESS_MEMBER_STATUS_INACTIVE');

  /// / The user is banned.
  static const BusinessMemberStatus BUSINESS_MEMBER_STATUS_BANNED =
      BusinessMemberStatus._(
          4, _omitEnumNames ? '' : 'BUSINESS_MEMBER_STATUS_BANNED');

  static const $core.List<BusinessMemberStatus> values = <BusinessMemberStatus>[
    BUSINESS_MEMBER_STATUS_UNSPECIFIED,
    BUSINESS_MEMBER_STATUS_ACTIVE,
    BUSINESS_MEMBER_STATUS_PENDING,
    BUSINESS_MEMBER_STATUS_INACTIVE,
    BUSINESS_MEMBER_STATUS_BANNED,
  ];

  static final $core.List<BusinessMemberStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static BusinessMemberStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BusinessMemberStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
