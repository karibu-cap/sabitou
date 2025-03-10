//
//  Generated code. Do not modify.
//  source: business/v1/business.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class BusinessStatusType extends $pb.ProtobufEnum {
  static const BusinessStatusType BUSINESS_STATUS_TYPE_UNSPECIFIED = BusinessStatusType._(0, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_UNSPECIFIED');
  static const BusinessStatusType BUSINESS_STATUS_TYPE_ACTIVE = BusinessStatusType._(1, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_ACTIVE');
  static const BusinessStatusType BUSINESS_STATUS_TYPE_INACTIVE = BusinessStatusType._(2, _omitEnumNames ? '' : 'BUSINESS_STATUS_TYPE_INACTIVE');

  static const $core.List<BusinessStatusType> values = <BusinessStatusType> [
    BUSINESS_STATUS_TYPE_UNSPECIFIED,
    BUSINESS_STATUS_TYPE_ACTIVE,
    BUSINESS_STATUS_TYPE_INACTIVE,
  ];

  static final $core.Map<$core.int, BusinessStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static BusinessStatusType? valueOf($core.int value) => _byValue[value];

  const BusinessStatusType._($core.int v, $core.String n) : super(v, n);
}

class CurrencyChangePolicyType extends $pb.ProtobufEnum {
  static const CurrencyChangePolicyType CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED = CurrencyChangePolicyType._(0, _omitEnumNames ? '' : 'CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED');
  static const CurrencyChangePolicyType CURRENCY_CHANGE_POLICY_TYPE_KEEP_PREVIOUS_CURRENCY_VALUE = CurrencyChangePolicyType._(1, _omitEnumNames ? '' : 'CURRENCY_CHANGE_POLICY_TYPE_KEEP_PREVIOUS_CURRENCY_VALUE');
  static const CurrencyChangePolicyType CURRENCY_CHANGE_POLICY_TYPE_CONVERT_BASED_ON_CURRENT_EXCHANGE_RATE = CurrencyChangePolicyType._(2, _omitEnumNames ? '' : 'CURRENCY_CHANGE_POLICY_TYPE_CONVERT_BASED_ON_CURRENT_EXCHANGE_RATE');

  static const $core.List<CurrencyChangePolicyType> values = <CurrencyChangePolicyType> [
    CURRENCY_CHANGE_POLICY_TYPE_UNSPECIFIED,
    CURRENCY_CHANGE_POLICY_TYPE_KEEP_PREVIOUS_CURRENCY_VALUE,
    CURRENCY_CHANGE_POLICY_TYPE_CONVERT_BASED_ON_CURRENT_EXCHANGE_RATE,
  ];

  static final $core.Map<$core.int, CurrencyChangePolicyType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static CurrencyChangePolicyType? valueOf($core.int value) => _byValue[value];

  const CurrencyChangePolicyType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
