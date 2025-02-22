//
//  Generated code. Do not modify.
//  source: identity/v1/user.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountStatusType extends $pb.ProtobufEnum {
  static const AccountStatusType ACCOUNT_STATUS_TYPE_UNSPECIFIED = AccountStatusType._(0, _omitEnumNames ? '' : 'ACCOUNT_STATUS_TYPE_UNSPECIFIED');
  static const AccountStatusType ACCOUNT_STATUS_TYPE_ACTIVE = AccountStatusType._(1, _omitEnumNames ? '' : 'ACCOUNT_STATUS_TYPE_ACTIVE');
  static const AccountStatusType ACCOUNT_STATUS_TYPE_DELETED = AccountStatusType._(2, _omitEnumNames ? '' : 'ACCOUNT_STATUS_TYPE_DELETED');

  static const $core.List<AccountStatusType> values = <AccountStatusType> [
    ACCOUNT_STATUS_TYPE_UNSPECIFIED,
    ACCOUNT_STATUS_TYPE_ACTIVE,
    ACCOUNT_STATUS_TYPE_DELETED,
  ];

  static final $core.Map<$core.int, AccountStatusType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AccountStatusType? valueOf($core.int value) => _byValue[value];

  const AccountStatusType._($core.int v, $core.String n) : super(v, n);
}

class AuthActionType extends $pb.ProtobufEnum {
  static const AuthActionType AUTH_ACTION_TYPE_UNSPECIFIED = AuthActionType._(0, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_UNSPECIFIED');
  static const AuthActionType AUTH_ACTION_TYPE_VERIFY_EMAIL = AuthActionType._(1, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_VERIFY_EMAIL');
  static const AuthActionType AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER = AuthActionType._(2, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER');
  static const AuthActionType AUTH_ACTION_TYPE_INITIALIZE_PASSWORD = AuthActionType._(3, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_INITIALIZE_PASSWORD');
  static const AuthActionType AUTH_ACTION_TYPE_RESET_PASSWORD = AuthActionType._(4, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_RESET_PASSWORD');

  static const $core.List<AuthActionType> values = <AuthActionType> [
    AUTH_ACTION_TYPE_UNSPECIFIED,
    AUTH_ACTION_TYPE_VERIFY_EMAIL,
    AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER,
    AUTH_ACTION_TYPE_INITIALIZE_PASSWORD,
    AUTH_ACTION_TYPE_RESET_PASSWORD,
  ];

  static final $core.Map<$core.int, AuthActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthActionType? valueOf($core.int value) => _byValue[value];

  const AuthActionType._($core.int v, $core.String n) : super(v, n);
}

class ProviderType extends $pb.ProtobufEnum {
  static const ProviderType PROVIDER_TYPE_UNSPECIFIED = ProviderType._(0, _omitEnumNames ? '' : 'PROVIDER_TYPE_UNSPECIFIED');
  static const ProviderType PROVIDER_TYPE_FIREBASE_EMAIL = ProviderType._(1, _omitEnumNames ? '' : 'PROVIDER_TYPE_FIREBASE_EMAIL');
  static const ProviderType PROVIDER_TYPE_GOOGLE = ProviderType._(2, _omitEnumNames ? '' : 'PROVIDER_TYPE_GOOGLE');
  static const ProviderType PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH = ProviderType._(3, _omitEnumNames ? '' : 'PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH');

  static const $core.List<ProviderType> values = <ProviderType> [
    PROVIDER_TYPE_UNSPECIFIED,
    PROVIDER_TYPE_FIREBASE_EMAIL,
    PROVIDER_TYPE_GOOGLE,
    PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH,
  ];

  static final $core.Map<$core.int, ProviderType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ProviderType? valueOf($core.int value) => _byValue[value];

  const ProviderType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
