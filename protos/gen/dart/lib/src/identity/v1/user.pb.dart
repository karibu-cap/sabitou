// This is a generated file - do not edit.
//
// Generated from identity/v1/user.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../link/v1/link.pb.dart' as $0;
import 'user.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'user.pbenum.dart';

class ConnectedAccount extends $pb.GeneratedMessage {
  factory ConnectedAccount({
    ProviderType? provider,
    $core.String? rawData,
  }) {
    final result = create();
    if (provider != null) result.provider = provider;
    if (rawData != null) result.rawData = rawData;
    return result;
  }

  ConnectedAccount._();

  factory ConnectedAccount.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ConnectedAccount.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ConnectedAccount',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..e<ProviderType>(1, _omitFieldNames ? '' : 'provider', $pb.PbFieldType.OE,
        defaultOrMaker: ProviderType.PROVIDER_TYPE_UNSPECIFIED,
        valueOf: ProviderType.valueOf,
        enumValues: ProviderType.values)
    ..aOS(3, _omitFieldNames ? '' : 'rawData')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectedAccount clone() => ConnectedAccount()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ConnectedAccount copyWith(void Function(ConnectedAccount) updates) =>
      super.copyWith((message) => updates(message as ConnectedAccount))
          as ConnectedAccount;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ConnectedAccount create() => ConnectedAccount._();
  @$core.override
  ConnectedAccount createEmptyInstance() => create();
  static $pb.PbList<ConnectedAccount> createRepeated() =>
      $pb.PbList<ConnectedAccount>();
  @$core.pragma('dart2js:noInline')
  static ConnectedAccount getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ConnectedAccount>(create);
  static ConnectedAccount? _defaultInstance;

  /// The provider of the connected account.
  /// For example, "google.com" or "email".
  @$pb.TagNumber(1)
  ProviderType get provider => $_getN(0);
  @$pb.TagNumber(1)
  set provider(ProviderType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProvider() => $_has(0);
  @$pb.TagNumber(1)
  void clearProvider() => $_clearField(1);

  /// The raw information returned by the provider.
  @$pb.TagNumber(3)
  $core.String get rawData => $_getSZ(1);
  @$pb.TagNumber(3)
  set rawData($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasRawData() => $_has(1);
  @$pb.TagNumber(3)
  void clearRawData() => $_clearField(3);
}

/// The user record.
/// The id of the user is the same as the uid of the Firebase user.
class User extends $pb.GeneratedMessage {
  factory User({
    $core.String? refId,
    $core.String? userName,
    $core.Iterable<ConnectedAccount>? connectedAccounts,
    $core.String? email,
    $core.String? phoneNumber,
    $core.String? firstName,
    $core.String? lastName,
    $0.ResourceLink? profileLink,
    AccountStatusType? accountStatus,
    $core.Iterable<AuthActionType>? requiredActions,
    AccountType? accountType,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (userName != null) result.userName = userName;
    if (connectedAccounts != null)
      result.connectedAccounts.addAll(connectedAccounts);
    if (email != null) result.email = email;
    if (phoneNumber != null) result.phoneNumber = phoneNumber;
    if (firstName != null) result.firstName = firstName;
    if (lastName != null) result.lastName = lastName;
    if (profileLink != null) result.profileLink = profileLink;
    if (accountStatus != null) result.accountStatus = accountStatus;
    if (requiredActions != null) result.requiredActions.addAll(requiredActions);
    if (accountType != null) result.accountType = accountType;
    return result;
  }

  User._();

  factory User.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory User.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'User',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'userName')
    ..pc<ConnectedAccount>(
        3, _omitFieldNames ? '' : 'connectedAccounts', $pb.PbFieldType.PM,
        subBuilder: ConnectedAccount.create)
    ..aOS(4, _omitFieldNames ? '' : 'email')
    ..aOS(5, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(6, _omitFieldNames ? '' : 'firstName')
    ..aOS(7, _omitFieldNames ? '' : 'lastName')
    ..aOM<$0.ResourceLink>(8, _omitFieldNames ? '' : 'profileLink',
        subBuilder: $0.ResourceLink.create)
    ..e<AccountStatusType>(
        9, _omitFieldNames ? '' : 'accountStatus', $pb.PbFieldType.OE,
        defaultOrMaker: AccountStatusType.ACCOUNT_STATUS_TYPE_UNSPECIFIED,
        valueOf: AccountStatusType.valueOf,
        enumValues: AccountStatusType.values)
    ..pc<AuthActionType>(
        10, _omitFieldNames ? '' : 'requiredActions', $pb.PbFieldType.KE,
        valueOf: AuthActionType.valueOf,
        enumValues: AuthActionType.values,
        defaultEnumValue: AuthActionType.AUTH_ACTION_TYPE_UNSPECIFIED)
    ..e<AccountType>(
        11, _omitFieldNames ? '' : 'accountType', $pb.PbFieldType.OE,
        defaultOrMaker: AccountType.ADMIN,
        valueOf: AccountType.valueOf,
        enumValues: AccountType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  User clone() => User()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  User copyWith(void Function(User) updates) =>
      super.copyWith((message) => updates(message as User)) as User;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static User create() => User._();
  @$core.override
  User createEmptyInstance() => create();
  static $pb.PbList<User> createRepeated() => $pb.PbList<User>();
  @$core.pragma('dart2js:noInline')
  static User getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<User>(create);
  static User? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// [public] The user name of the user.
  @$pb.TagNumber(2)
  $core.String get userName => $_getSZ(1);
  @$pb.TagNumber(2)
  set userName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserName() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserName() => $_clearField(2);

  /// The connected accounts used by the user for authentication.
  @$pb.TagNumber(3)
  $pb.PbList<ConnectedAccount> get connectedAccounts => $_getList(2);

  /// The email address of the user.
  @$pb.TagNumber(4)
  $core.String get email => $_getSZ(3);
  @$pb.TagNumber(4)
  set email($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEmail() => $_has(3);
  @$pb.TagNumber(4)
  void clearEmail() => $_clearField(4);

  /// The phone number of the user.
  @$pb.TagNumber(5)
  $core.String get phoneNumber => $_getSZ(4);
  @$pb.TagNumber(5)
  set phoneNumber($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPhoneNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPhoneNumber() => $_clearField(5);

  /// [public] The first name of the user.
  @$pb.TagNumber(6)
  $core.String get firstName => $_getSZ(5);
  @$pb.TagNumber(6)
  set firstName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasFirstName() => $_has(5);
  @$pb.TagNumber(6)
  void clearFirstName() => $_clearField(6);

  /// [public] The last name of the user.
  @$pb.TagNumber(7)
  $core.String get lastName => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastName($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastName() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastName() => $_clearField(7);

  /// [public] The profile link of the user.
  @$pb.TagNumber(8)
  $0.ResourceLink get profileLink => $_getN(7);
  @$pb.TagNumber(8)
  set profileLink($0.ResourceLink value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasProfileLink() => $_has(7);
  @$pb.TagNumber(8)
  void clearProfileLink() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.ResourceLink ensureProfileLink() => $_ensure(7);

  /// The status of the user's account.
  @$pb.TagNumber(9)
  AccountStatusType get accountStatus => $_getN(8);
  @$pb.TagNumber(9)
  set accountStatus(AccountStatusType value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasAccountStatus() => $_has(8);
  @$pb.TagNumber(9)
  void clearAccountStatus() => $_clearField(9);

  /// The actions that the user must complete to authenticate.
  @$pb.TagNumber(10)
  $pb.PbList<AuthActionType> get requiredActions => $_getList(9);

  /// The type of the user's account.
  @$pb.TagNumber(11)
  AccountType get accountType => $_getN(10);
  @$pb.TagNumber(11)
  set accountType(AccountType value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasAccountType() => $_has(10);
  @$pb.TagNumber(11)
  void clearAccountType() => $_clearField(11);
}

class GetCurrentUserRequest extends $pb.GeneratedMessage {
  factory GetCurrentUserRequest() => create();

  GetCurrentUserRequest._();

  factory GetCurrentUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentUserRequest clone() =>
      GetCurrentUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentUserRequest copyWith(
          void Function(GetCurrentUserRequest) updates) =>
      super.copyWith((message) => updates(message as GetCurrentUserRequest))
          as GetCurrentUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentUserRequest create() => GetCurrentUserRequest._();
  @$core.override
  GetCurrentUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetCurrentUserRequest> createRepeated() =>
      $pb.PbList<GetCurrentUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentUserRequest>(create);
  static GetCurrentUserRequest? _defaultInstance;
}

class GetCurrentUserResponse extends $pb.GeneratedMessage {
  factory GetCurrentUserResponse({
    User? me,
  }) {
    final result = create();
    if (me != null) result.me = me;
    return result;
  }

  GetCurrentUserResponse._();

  factory GetCurrentUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCurrentUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCurrentUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'me', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentUserResponse clone() =>
      GetCurrentUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCurrentUserResponse copyWith(
          void Function(GetCurrentUserResponse) updates) =>
      super.copyWith((message) => updates(message as GetCurrentUserResponse))
          as GetCurrentUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCurrentUserResponse create() => GetCurrentUserResponse._();
  @$core.override
  GetCurrentUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetCurrentUserResponse> createRepeated() =>
      $pb.PbList<GetCurrentUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCurrentUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCurrentUserResponse>(create);
  static GetCurrentUserResponse? _defaultInstance;

  /// The user information for the currently authenticated user.
  @$pb.TagNumber(1)
  User get me => $_getN(0);
  @$pb.TagNumber(1)
  set me(User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMe() => $_has(0);
  @$pb.TagNumber(1)
  void clearMe() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureMe() => $_ensure(0);
}

class GetMeRequest extends $pb.GeneratedMessage {
  factory GetMeRequest() => create();

  GetMeRequest._();

  factory GetMeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMeRequest clone() => GetMeRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMeRequest copyWith(void Function(GetMeRequest) updates) =>
      super.copyWith((message) => updates(message as GetMeRequest))
          as GetMeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeRequest create() => GetMeRequest._();
  @$core.override
  GetMeRequest createEmptyInstance() => create();
  static $pb.PbList<GetMeRequest> createRepeated() =>
      $pb.PbList<GetMeRequest>();
  @$core.pragma('dart2js:noInline')
  static GetMeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMeRequest>(create);
  static GetMeRequest? _defaultInstance;
}

class GetMeResponse extends $pb.GeneratedMessage {
  factory GetMeResponse({
    User? me,
  }) {
    final result = create();
    if (me != null) result.me = me;
    return result;
  }

  GetMeResponse._();

  factory GetMeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetMeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetMeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'me', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMeResponse clone() => GetMeResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetMeResponse copyWith(void Function(GetMeResponse) updates) =>
      super.copyWith((message) => updates(message as GetMeResponse))
          as GetMeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetMeResponse create() => GetMeResponse._();
  @$core.override
  GetMeResponse createEmptyInstance() => create();
  static $pb.PbList<GetMeResponse> createRepeated() =>
      $pb.PbList<GetMeResponse>();
  @$core.pragma('dart2js:noInline')
  static GetMeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetMeResponse>(create);
  static GetMeResponse? _defaultInstance;

  /// The user information for the currently authenticated user.
  @$pb.TagNumber(1)
  User get me => $_getN(0);
  @$pb.TagNumber(1)
  set me(User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasMe() => $_has(0);
  @$pb.TagNumber(1)
  void clearMe() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureMe() => $_ensure(0);
}

class GetUserRequest extends $pb.GeneratedMessage {
  factory GetUserRequest({
    $core.String? userId,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    return result;
  }

  GetUserRequest._();

  factory GetUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest clone() => GetUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserRequest copyWith(void Function(GetUserRequest) updates) =>
      super.copyWith((message) => updates(message as GetUserRequest))
          as GetUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserRequest create() => GetUserRequest._();
  @$core.override
  GetUserRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserRequest> createRepeated() =>
      $pb.PbList<GetUserRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserRequest>(create);
  static GetUserRequest? _defaultInstance;

  /// The id of the user to retrieve.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);
}

class GetUserResponse extends $pb.GeneratedMessage {
  factory GetUserResponse({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  GetUserResponse._();

  factory GetUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserResponse clone() => GetUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetUserResponse copyWith(void Function(GetUserResponse) updates) =>
      super.copyWith((message) => updates(message as GetUserResponse))
          as GetUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserResponse create() => GetUserResponse._();
  @$core.override
  GetUserResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserResponse> createRepeated() =>
      $pb.PbList<GetUserResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetUserResponse>(create);
  static GetUserResponse? _defaultInstance;

  /// The retrieved user data.
  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class UpdateMeRequest extends $pb.GeneratedMessage {
  factory UpdateMeRequest({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  UpdateMeRequest._();

  factory UpdateMeRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateMeRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateMeRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMeRequest clone() => UpdateMeRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMeRequest copyWith(void Function(UpdateMeRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateMeRequest))
          as UpdateMeRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMeRequest create() => UpdateMeRequest._();
  @$core.override
  UpdateMeRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateMeRequest> createRepeated() =>
      $pb.PbList<UpdateMeRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateMeRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateMeRequest>(create);
  static UpdateMeRequest? _defaultInstance;

  /// The user information to update.
  /// Note:Only the fields that are set will be updated.
  /// WARNING:
  ///  - The id field is required and cannot be changed.
  ///  - The password field will be ignored. Use the ChangePassword RPC instead.
  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class UpdateMeResponse extends $pb.GeneratedMessage {
  factory UpdateMeResponse({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  UpdateMeResponse._();

  factory UpdateMeResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateMeResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateMeResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMeResponse clone() => UpdateMeResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMeResponse copyWith(void Function(UpdateMeResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateMeResponse))
          as UpdateMeResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMeResponse create() => UpdateMeResponse._();
  @$core.override
  UpdateMeResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateMeResponse> createRepeated() =>
      $pb.PbList<UpdateMeResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateMeResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateMeResponse>(create);
  static UpdateMeResponse? _defaultInstance;

  /// The updated user data.
  @$pb.TagNumber(1)
  User get user => $_getN(0);
  @$pb.TagNumber(1)
  set user(User value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasUser() => $_has(0);
  @$pb.TagNumber(1)
  void clearUser() => $_clearField(1);
  @$pb.TagNumber(1)
  User ensureUser() => $_ensure(0);
}

class RequestDeleteUserRequest extends $pb.GeneratedMessage {
  factory RequestDeleteUserRequest({
    $core.String? userId,
    $core.String? password,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (password != null) result.password = password;
    return result;
  }

  RequestDeleteUserRequest._();

  factory RequestDeleteUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestDeleteUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestDeleteUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'password')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteUserRequest clone() =>
      RequestDeleteUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteUserRequest copyWith(
          void Function(RequestDeleteUserRequest) updates) =>
      super.copyWith((message) => updates(message as RequestDeleteUserRequest))
          as RequestDeleteUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeleteUserRequest create() => RequestDeleteUserRequest._();
  @$core.override
  RequestDeleteUserRequest createEmptyInstance() => create();
  static $pb.PbList<RequestDeleteUserRequest> createRepeated() =>
      $pb.PbList<RequestDeleteUserRequest>();
  @$core.pragma('dart2js:noInline')
  static RequestDeleteUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestDeleteUserRequest>(create);
  static RequestDeleteUserRequest? _defaultInstance;

  /// The id of the user to delete.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The password of the user to delete.
  @$pb.TagNumber(2)
  $core.String get password => $_getSZ(1);
  @$pb.TagNumber(2)
  set password($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearPassword() => $_clearField(2);
}

class RequestDeleteUserResponse extends $pb.GeneratedMessage {
  factory RequestDeleteUserResponse({
    $core.String? requestToken,
  }) {
    final result = create();
    if (requestToken != null) result.requestToken = requestToken;
    return result;
  }

  RequestDeleteUserResponse._();

  factory RequestDeleteUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RequestDeleteUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RequestDeleteUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestToken')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteUserResponse clone() =>
      RequestDeleteUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RequestDeleteUserResponse copyWith(
          void Function(RequestDeleteUserResponse) updates) =>
      super.copyWith((message) => updates(message as RequestDeleteUserResponse))
          as RequestDeleteUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RequestDeleteUserResponse create() => RequestDeleteUserResponse._();
  @$core.override
  RequestDeleteUserResponse createEmptyInstance() => create();
  static $pb.PbList<RequestDeleteUserResponse> createRepeated() =>
      $pb.PbList<RequestDeleteUserResponse>();
  @$core.pragma('dart2js:noInline')
  static RequestDeleteUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RequestDeleteUserResponse>(create);
  static RequestDeleteUserResponse? _defaultInstance;

  /// The token to use to process the deletion of the user
  /// after verification (email or phone number).
  @$pb.TagNumber(1)
  $core.String get requestToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestToken() => $_clearField(1);
}

class DeleteUserRequest extends $pb.GeneratedMessage {
  factory DeleteUserRequest({
    $core.String? requestToken,
    $core.String? verificationCode,
  }) {
    final result = create();
    if (requestToken != null) result.requestToken = requestToken;
    if (verificationCode != null) result.verificationCode = verificationCode;
    return result;
  }

  DeleteUserRequest._();

  factory DeleteUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'requestToken')
    ..aOS(2, _omitFieldNames ? '' : 'verificationCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteUserRequest clone() => DeleteUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteUserRequest copyWith(void Function(DeleteUserRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteUserRequest))
          as DeleteUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUserRequest create() => DeleteUserRequest._();
  @$core.override
  DeleteUserRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteUserRequest> createRepeated() =>
      $pb.PbList<DeleteUserRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteUserRequest>(create);
  static DeleteUserRequest? _defaultInstance;

  /// The token to use to process the deletion of the user.
  @$pb.TagNumber(1)
  $core.String get requestToken => $_getSZ(0);
  @$pb.TagNumber(1)
  set requestToken($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRequestToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearRequestToken() => $_clearField(1);

  /// The verification code sent to the user's email or phone number.
  @$pb.TagNumber(2)
  $core.String get verificationCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set verificationCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVerificationCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearVerificationCode() => $_clearField(2);
}

class DeleteUserResponse extends $pb.GeneratedMessage {
  factory DeleteUserResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteUserResponse._();

  factory DeleteUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteUserResponse clone() => DeleteUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteUserResponse copyWith(void Function(DeleteUserResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteUserResponse))
          as DeleteUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteUserResponse create() => DeleteUserResponse._();
  @$core.override
  DeleteUserResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteUserResponse> createRepeated() =>
      $pb.PbList<DeleteUserResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteUserResponse>(create);
  static DeleteUserResponse? _defaultInstance;

  /// Whether the user was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ChangePasswordRequest extends $pb.GeneratedMessage {
  factory ChangePasswordRequest({
    $core.String? oldPassword,
    $core.String? newPassword,
  }) {
    final result = create();
    if (oldPassword != null) result.oldPassword = oldPassword;
    if (newPassword != null) result.newPassword = newPassword;
    return result;
  }

  ChangePasswordRequest._();

  factory ChangePasswordRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangePasswordRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangePasswordRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'oldPassword')
    ..aOS(2, _omitFieldNames ? '' : 'newPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangePasswordRequest clone() =>
      ChangePasswordRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangePasswordRequest copyWith(
          void Function(ChangePasswordRequest) updates) =>
      super.copyWith((message) => updates(message as ChangePasswordRequest))
          as ChangePasswordRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordRequest create() => ChangePasswordRequest._();
  @$core.override
  ChangePasswordRequest createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordRequest> createRepeated() =>
      $pb.PbList<ChangePasswordRequest>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangePasswordRequest>(create);
  static ChangePasswordRequest? _defaultInstance;

  /// The previous password of the user.
  /// TODO: Add more validation like capital letters, numbers, etc.
  @$pb.TagNumber(1)
  $core.String get oldPassword => $_getSZ(0);
  @$pb.TagNumber(1)
  set oldPassword($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOldPassword() => $_has(0);
  @$pb.TagNumber(1)
  void clearOldPassword() => $_clearField(1);

  /// The new password of the user.
  /// TODO: Add more validation like capital letters, numbers, etc.
  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => $_clearField(2);
}

class ChangePasswordResponse extends $pb.GeneratedMessage {
  factory ChangePasswordResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  ChangePasswordResponse._();

  factory ChangePasswordResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ChangePasswordResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ChangePasswordResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangePasswordResponse clone() =>
      ChangePasswordResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ChangePasswordResponse copyWith(
          void Function(ChangePasswordResponse) updates) =>
      super.copyWith((message) => updates(message as ChangePasswordResponse))
          as ChangePasswordResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ChangePasswordResponse create() => ChangePasswordResponse._();
  @$core.override
  ChangePasswordResponse createEmptyInstance() => create();
  static $pb.PbList<ChangePasswordResponse> createRepeated() =>
      $pb.PbList<ChangePasswordResponse>();
  @$core.pragma('dart2js:noInline')
  static ChangePasswordResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ChangePasswordResponse>(create);
  static ChangePasswordResponse? _defaultInstance;

  /// Whether the password was successfully changed.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UserServiceApi {
  final $pb.RpcClient _client;

  UserServiceApi(this._client);

  /// Get the user information for the currently authenticated user.
  /// @deprecated use GetCurrentUser instead.
  $async.Future<GetMeResponse> getMe(
          $pb.ClientContext? ctx, GetMeRequest request) =>
      _client.invoke<GetMeResponse>(
          ctx, 'UserService', 'GetMe', request, GetMeResponse());

  /// Get the user information for the currently authenticated user.
  $async.Future<GetCurrentUserResponse> getCurrentUser(
          $pb.ClientContext? ctx, GetCurrentUserRequest request) =>
      _client.invoke<GetCurrentUserResponse>(ctx, 'UserService',
          'GetCurrentUser', request, GetCurrentUserResponse());

  /// Get the public information for the given user id.
  $async.Future<GetUserResponse> getUser(
          $pb.ClientContext? ctx, GetUserRequest request) =>
      _client.invoke<GetUserResponse>(
          ctx, 'UserService', 'GetUser', request, GetUserResponse());

  /// Update the user information for the currently authenticated user.
  $async.Future<UpdateMeResponse> updateMe(
          $pb.ClientContext? ctx, UpdateMeRequest request) =>
      _client.invoke<UpdateMeResponse>(
          ctx, 'UserService', 'UpdateMe', request, UpdateMeResponse());

  /// Request the deletion of the user account.
  /// This will send a verification code to the user's email address
  /// or phone number.
  $async.Future<RequestDeleteUserResponse> requestDeleteUser(
          $pb.ClientContext? ctx, RequestDeleteUserRequest request) =>
      _client.invoke<RequestDeleteUserResponse>(ctx, 'UserService',
          'RequestDeleteUser', request, RequestDeleteUserResponse());

  /// Processes the deletion of the user account requested by the user.
  $async.Future<DeleteUserResponse> deleteUser(
          $pb.ClientContext? ctx, DeleteUserRequest request) =>
      _client.invoke<DeleteUserResponse>(
          ctx, 'UserService', 'DeleteUser', request, DeleteUserResponse());

  /// Change the password for the currently authenticated user.
  $async.Future<ChangePasswordResponse> changePassword(
          $pb.ClientContext? ctx, ChangePasswordRequest request) =>
      _client.invoke<ChangePasswordResponse>(ctx, 'UserService',
          'ChangePassword', request, ChangePasswordResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
