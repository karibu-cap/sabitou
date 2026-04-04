// This is a generated file - do not edit.
//
// Generated from identity/v1/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class AccountStatusType extends $pb.ProtobufEnum {
  static const AccountStatusType ACCOUNT_STATUS_TYPE_UNSPECIFIED =
      AccountStatusType._(
          0, _omitEnumNames ? '' : 'ACCOUNT_STATUS_TYPE_UNSPECIFIED');
  static const AccountStatusType ACCOUNT_STATUS_TYPE_ACTIVE =
      AccountStatusType._(
          1, _omitEnumNames ? '' : 'ACCOUNT_STATUS_TYPE_ACTIVE');
  static const AccountStatusType ACCOUNT_STATUS_TYPE_DELETED =
      AccountStatusType._(
          2, _omitEnumNames ? '' : 'ACCOUNT_STATUS_TYPE_DELETED');
  static const AccountStatusType ACCOUNT_STATUS_TYPE_PENDING =
      AccountStatusType._(
          3, _omitEnumNames ? '' : 'ACCOUNT_STATUS_TYPE_PENDING');

  static const $core.List<AccountStatusType> values = <AccountStatusType>[
    ACCOUNT_STATUS_TYPE_UNSPECIFIED,
    ACCOUNT_STATUS_TYPE_ACTIVE,
    ACCOUNT_STATUS_TYPE_DELETED,
    ACCOUNT_STATUS_TYPE_PENDING,
  ];

  static final $core.List<AccountStatusType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static AccountStatusType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AccountStatusType._(super.value, super.name);
}

class AuthActionType extends $pb.ProtobufEnum {
  static const AuthActionType AUTH_ACTION_TYPE_UNSPECIFIED =
      AuthActionType._(0, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_UNSPECIFIED');
  static const AuthActionType AUTH_ACTION_TYPE_VERIFY_EMAIL = AuthActionType._(
      1, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_VERIFY_EMAIL');
  static const AuthActionType AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER =
      AuthActionType._(
          2, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER');
  static const AuthActionType AUTH_ACTION_TYPE_INITIALIZE_PASSWORD =
      AuthActionType._(
          3, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_INITIALIZE_PASSWORD');
  static const AuthActionType AUTH_ACTION_TYPE_RESET_PASSWORD =
      AuthActionType._(
          4, _omitEnumNames ? '' : 'AUTH_ACTION_TYPE_RESET_PASSWORD');

  static const $core.List<AuthActionType> values = <AuthActionType>[
    AUTH_ACTION_TYPE_UNSPECIFIED,
    AUTH_ACTION_TYPE_VERIFY_EMAIL,
    AUTH_ACTION_TYPE_VERIFY_PHONE_NUMBER,
    AUTH_ACTION_TYPE_INITIALIZE_PASSWORD,
    AUTH_ACTION_TYPE_RESET_PASSWORD,
  ];

  static final $core.List<AuthActionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static AuthActionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const AuthActionType._(super.value, super.name);
}

class ProviderType extends $pb.ProtobufEnum {
  /// Generally used for testing.
  static const ProviderType PROVIDER_TYPE_UNSPECIFIED =
      ProviderType._(0, _omitEnumNames ? '' : 'PROVIDER_TYPE_UNSPECIFIED');

  /// The user connected their email address to their account.
  static const ProviderType PROVIDER_TYPE_FIREBASE_EMAIL =
      ProviderType._(1, _omitEnumNames ? '' : 'PROVIDER_TYPE_FIREBASE_EMAIL');

  /// The user connected their google account to their account.
  static const ProviderType PROVIDER_TYPE_GOOGLE =
      ProviderType._(2, _omitEnumNames ? '' : 'PROVIDER_TYPE_GOOGLE');

  /// Generally used when business creates a user.
  static const ProviderType PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH =
      ProviderType._(
          3, _omitEnumNames ? '' : 'PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH');

  static const $core.List<ProviderType> values = <ProviderType>[
    PROVIDER_TYPE_UNSPECIFIED,
    PROVIDER_TYPE_FIREBASE_EMAIL,
    PROVIDER_TYPE_GOOGLE,
    PROVIDER_TYPE_INTERNAL_BUSINESS_AUTH,
  ];

  static final $core.List<ProviderType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ProviderType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ProviderType._(super.value, super.name);
}

class InvitationStatus extends $pb.ProtobufEnum {
  static const InvitationStatus INVITATION_STATUS_UNSPECIFIED =
      InvitationStatus._(
          0, _omitEnumNames ? '' : 'INVITATION_STATUS_UNSPECIFIED');
  static const InvitationStatus INVITATION_STATUS_PENDING =
      InvitationStatus._(1, _omitEnumNames ? '' : 'INVITATION_STATUS_PENDING');
  static const InvitationStatus INVITATION_STATUS_ACCEPTED =
      InvitationStatus._(2, _omitEnumNames ? '' : 'INVITATION_STATUS_ACCEPTED');
  static const InvitationStatus INVITATION_STATUS_REJECTED =
      InvitationStatus._(3, _omitEnumNames ? '' : 'INVITATION_STATUS_REJECTED');
  static const InvitationStatus INVITATION_STATUS_EXPIRED =
      InvitationStatus._(4, _omitEnumNames ? '' : 'INVITATION_STATUS_EXPIRED');
  static const InvitationStatus INVITATION_STATUS_CANCELLED =
      InvitationStatus._(
          5, _omitEnumNames ? '' : 'INVITATION_STATUS_CANCELLED');

  static const $core.List<InvitationStatus> values = <InvitationStatus>[
    INVITATION_STATUS_UNSPECIFIED,
    INVITATION_STATUS_PENDING,
    INVITATION_STATUS_ACCEPTED,
    INVITATION_STATUS_REJECTED,
    INVITATION_STATUS_EXPIRED,
    INVITATION_STATUS_CANCELLED,
  ];

  static final $core.List<InvitationStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static InvitationStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const InvitationStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
