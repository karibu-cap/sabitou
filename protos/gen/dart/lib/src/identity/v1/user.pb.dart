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

import '../../google/protobuf/timestamp.pb.dart' as $1;
import '../../link/v1/link.pb.dart' as $0;
import 'permission.pb.dart' as $2;
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
    $core.String? activeBusinessId,
    $core.String? activeStoreId,
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
    if (activeBusinessId != null) result.activeBusinessId = activeBusinessId;
    if (activeStoreId != null) result.activeStoreId = activeStoreId;
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
    ..aOS(11, _omitFieldNames ? '' : 'activeBusinessId')
    ..aOS(12, _omitFieldNames ? '' : 'activeStoreId')
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

  /// / The active buisness id.
  @$pb.TagNumber(11)
  $core.String get activeBusinessId => $_getSZ(10);
  @$pb.TagNumber(11)
  set activeBusinessId($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasActiveBusinessId() => $_has(10);
  @$pb.TagNumber(11)
  void clearActiveBusinessId() => $_clearField(11);

  /// / The active store id.
  @$pb.TagNumber(12)
  $core.String get activeStoreId => $_getSZ(11);
  @$pb.TagNumber(12)
  set activeStoreId($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasActiveStoreId() => $_has(11);
  @$pb.TagNumber(12)
  void clearActiveStoreId() => $_clearField(12);
}

class Invitation extends $pb.GeneratedMessage {
  factory Invitation({
    $core.String? refId,
    $core.String? userId,
    $core.String? storeId,
    $core.String? invitedBy,
    InvitationStatus? status,
    $1.Timestamp? expiresAt,
    $1.Timestamp? createdAt,
    $1.Timestamp? respondedAt,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (invitedBy != null) result.invitedBy = invitedBy;
    if (status != null) result.status = status;
    if (expiresAt != null) result.expiresAt = expiresAt;
    if (createdAt != null) result.createdAt = createdAt;
    if (respondedAt != null) result.respondedAt = respondedAt;
    return result;
  }

  Invitation._();

  factory Invitation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Invitation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Invitation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..aOS(4, _omitFieldNames ? '' : 'invitedBy')
    ..e<InvitationStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: InvitationStatus.INVITATION_STATUS_UNSPECIFIED,
        valueOf: InvitationStatus.valueOf,
        enumValues: InvitationStatus.values)
    ..aOM<$1.Timestamp>(6, _omitFieldNames ? '' : 'expiresAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(7, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(8, _omitFieldNames ? '' : 'respondedAt',
        subBuilder: $1.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Invitation clone() => Invitation()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Invitation copyWith(void Function(Invitation) updates) =>
      super.copyWith((message) => updates(message as Invitation)) as Invitation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Invitation create() => Invitation._();
  @$core.override
  Invitation createEmptyInstance() => create();
  static $pb.PbList<Invitation> createRepeated() => $pb.PbList<Invitation>();
  @$core.pragma('dart2js:noInline')
  static Invitation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Invitation>(create);
  static Invitation? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get userId => $_getSZ(1);
  @$pb.TagNumber(2)
  set userId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get invitedBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set invitedBy($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasInvitedBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearInvitedBy() => $_clearField(4);

  @$pb.TagNumber(5)
  InvitationStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(InvitationStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $1.Timestamp get expiresAt => $_getN(5);
  @$pb.TagNumber(6)
  set expiresAt($1.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasExpiresAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearExpiresAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $1.Timestamp ensureExpiresAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $1.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(7)
  set createdAt($1.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearCreatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $1.Timestamp ensureCreatedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $1.Timestamp get respondedAt => $_getN(7);
  @$pb.TagNumber(8)
  set respondedAt($1.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasRespondedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearRespondedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $1.Timestamp ensureRespondedAt() => $_ensure(7);
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

class UpdateRequest extends $pb.GeneratedMessage {
  factory UpdateRequest({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  UpdateRequest._();

  factory UpdateRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRequest clone() => UpdateRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateRequest copyWith(void Function(UpdateRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateRequest))
          as UpdateRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateRequest create() => UpdateRequest._();
  @$core.override
  UpdateRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateRequest> createRepeated() =>
      $pb.PbList<UpdateRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateRequest>(create);
  static UpdateRequest? _defaultInstance;

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

class UpdateResponse extends $pb.GeneratedMessage {
  factory UpdateResponse({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  UpdateResponse._();

  factory UpdateResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateResponse clone() => UpdateResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateResponse copyWith(void Function(UpdateResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateResponse))
          as UpdateResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateResponse create() => UpdateResponse._();
  @$core.override
  UpdateResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateResponse> createRepeated() =>
      $pb.PbList<UpdateResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateResponse>(create);
  static UpdateResponse? _defaultInstance;

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

class CreateUserDirectRequest extends $pb.GeneratedMessage {
  factory CreateUserDirectRequest({
    $core.String? userName,
    $core.String? email,
    $core.String? password,
    $core.String? storeId,
    $core.String? firstName,
    $core.String? lastName,
    $core.String? phoneNumber,
    $2.StorePermissions? permissions,
    $core.bool? forcePasswordChangeOnFirstLogin,
  }) {
    final result = create();
    if (userName != null) result.userName = userName;
    if (email != null) result.email = email;
    if (password != null) result.password = password;
    if (storeId != null) result.storeId = storeId;
    if (firstName != null) result.firstName = firstName;
    if (lastName != null) result.lastName = lastName;
    if (phoneNumber != null) result.phoneNumber = phoneNumber;
    if (permissions != null) result.permissions = permissions;
    if (forcePasswordChangeOnFirstLogin != null)
      result.forcePasswordChangeOnFirstLogin = forcePasswordChangeOnFirstLogin;
    return result;
  }

  CreateUserDirectRequest._();

  factory CreateUserDirectRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateUserDirectRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateUserDirectRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userName')
    ..aOS(2, _omitFieldNames ? '' : 'email')
    ..aOS(3, _omitFieldNames ? '' : 'password')
    ..aOS(4, _omitFieldNames ? '' : 'storeId')
    ..aOS(5, _omitFieldNames ? '' : 'firstName')
    ..aOS(6, _omitFieldNames ? '' : 'lastName')
    ..aOS(7, _omitFieldNames ? '' : 'phoneNumber')
    ..aOM<$2.StorePermissions>(8, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.StorePermissions.create)
    ..aOB(9, _omitFieldNames ? '' : 'forcePasswordChangeOnFirstLogin')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserDirectRequest clone() =>
      CreateUserDirectRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserDirectRequest copyWith(
          void Function(CreateUserDirectRequest) updates) =>
      super.copyWith((message) => updates(message as CreateUserDirectRequest))
          as CreateUserDirectRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserDirectRequest create() => CreateUserDirectRequest._();
  @$core.override
  CreateUserDirectRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserDirectRequest> createRepeated() =>
      $pb.PbList<CreateUserDirectRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserDirectRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateUserDirectRequest>(create);
  static CreateUserDirectRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get userName => $_getSZ(0);
  @$pb.TagNumber(1)
  set userName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserName() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserName() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get email => $_getSZ(1);
  @$pb.TagNumber(2)
  set email($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasEmail() => $_has(1);
  @$pb.TagNumber(2)
  void clearEmail() => $_clearField(2);

  /// admin sets it, user should change on first login
  @$pb.TagNumber(3)
  $core.String get password => $_getSZ(2);
  @$pb.TagNumber(3)
  set password($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPassword() => $_has(2);
  @$pb.TagNumber(3)
  void clearPassword() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get storeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set storeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStoreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get firstName => $_getSZ(4);
  @$pb.TagNumber(5)
  set firstName($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFirstName() => $_has(4);
  @$pb.TagNumber(5)
  void clearFirstName() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get lastName => $_getSZ(5);
  @$pb.TagNumber(6)
  set lastName($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasLastName() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastName() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get phoneNumber => $_getSZ(6);
  @$pb.TagNumber(7)
  set phoneNumber($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPhoneNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearPhoneNumber() => $_clearField(7);

  @$pb.TagNumber(8)
  $2.StorePermissions get permissions => $_getN(7);
  @$pb.TagNumber(8)
  set permissions($2.StorePermissions value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasPermissions() => $_has(7);
  @$pb.TagNumber(8)
  void clearPermissions() => $_clearField(8);
  @$pb.TagNumber(8)
  $2.StorePermissions ensurePermissions() => $_ensure(7);

  /// adds INITIALIZE_PASSWORD action
  @$pb.TagNumber(9)
  $core.bool get forcePasswordChangeOnFirstLogin => $_getBF(8);
  @$pb.TagNumber(9)
  set forcePasswordChangeOnFirstLogin($core.bool value) => $_setBool(8, value);
  @$pb.TagNumber(9)
  $core.bool hasForcePasswordChangeOnFirstLogin() => $_has(8);
  @$pb.TagNumber(9)
  void clearForcePasswordChangeOnFirstLogin() => $_clearField(9);
}

class CreateUserDirectResponse extends $pb.GeneratedMessage {
  factory CreateUserDirectResponse({
    User? user,
  }) {
    final result = create();
    if (user != null) result.user = user;
    return result;
  }

  CreateUserDirectResponse._();

  factory CreateUserDirectResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateUserDirectResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateUserDirectResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserDirectResponse clone() =>
      CreateUserDirectResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserDirectResponse copyWith(
          void Function(CreateUserDirectResponse) updates) =>
      super.copyWith((message) => updates(message as CreateUserDirectResponse))
          as CreateUserDirectResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserDirectResponse create() => CreateUserDirectResponse._();
  @$core.override
  CreateUserDirectResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserDirectResponse> createRepeated() =>
      $pb.PbList<CreateUserDirectResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserDirectResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateUserDirectResponse>(create);
  static CreateUserDirectResponse? _defaultInstance;

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

class InviteUserRequest extends $pb.GeneratedMessage {
  factory InviteUserRequest({
    $core.String? email,
    $core.String? storeId,
    $core.String? firstName,
    $core.String? lastName,
    $2.StorePermissions? permissions,
  }) {
    final result = create();
    if (email != null) result.email = email;
    if (storeId != null) result.storeId = storeId;
    if (firstName != null) result.firstName = firstName;
    if (lastName != null) result.lastName = lastName;
    if (permissions != null) result.permissions = permissions;
    return result;
  }

  InviteUserRequest._();

  factory InviteUserRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteUserRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteUserRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'email')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOS(3, _omitFieldNames ? '' : 'firstName')
    ..aOS(4, _omitFieldNames ? '' : 'lastName')
    ..aOM<$2.StorePermissions>(5, _omitFieldNames ? '' : 'permissions',
        subBuilder: $2.StorePermissions.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteUserRequest clone() => InviteUserRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteUserRequest copyWith(void Function(InviteUserRequest) updates) =>
      super.copyWith((message) => updates(message as InviteUserRequest))
          as InviteUserRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteUserRequest create() => InviteUserRequest._();
  @$core.override
  InviteUserRequest createEmptyInstance() => create();
  static $pb.PbList<InviteUserRequest> createRepeated() =>
      $pb.PbList<InviteUserRequest>();
  @$core.pragma('dart2js:noInline')
  static InviteUserRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteUserRequest>(create);
  static InviteUserRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get email => $_getSZ(0);
  @$pb.TagNumber(1)
  set email($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasEmail() => $_has(0);
  @$pb.TagNumber(1)
  void clearEmail() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get firstName => $_getSZ(2);
  @$pb.TagNumber(3)
  set firstName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFirstName() => $_has(2);
  @$pb.TagNumber(3)
  void clearFirstName() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get lastName => $_getSZ(3);
  @$pb.TagNumber(4)
  set lastName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasLastName() => $_has(3);
  @$pb.TagNumber(4)
  void clearLastName() => $_clearField(4);

  @$pb.TagNumber(5)
  $2.StorePermissions get permissions => $_getN(4);
  @$pb.TagNumber(5)
  set permissions($2.StorePermissions value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPermissions() => $_has(4);
  @$pb.TagNumber(5)
  void clearPermissions() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.StorePermissions ensurePermissions() => $_ensure(4);
}

class InviteUserResponse extends $pb.GeneratedMessage {
  factory InviteUserResponse({
    User? user,
    Invitation? invitation,
  }) {
    final result = create();
    if (user != null) result.user = user;
    if (invitation != null) result.invitation = invitation;
    return result;
  }

  InviteUserResponse._();

  factory InviteUserResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InviteUserResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InviteUserResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<User>(1, _omitFieldNames ? '' : 'user', subBuilder: User.create)
    ..aOM<Invitation>(2, _omitFieldNames ? '' : 'invitation',
        subBuilder: Invitation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteUserResponse clone() => InviteUserResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InviteUserResponse copyWith(void Function(InviteUserResponse) updates) =>
      super.copyWith((message) => updates(message as InviteUserResponse))
          as InviteUserResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InviteUserResponse create() => InviteUserResponse._();
  @$core.override
  InviteUserResponse createEmptyInstance() => create();
  static $pb.PbList<InviteUserResponse> createRepeated() =>
      $pb.PbList<InviteUserResponse>();
  @$core.pragma('dart2js:noInline')
  static InviteUserResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InviteUserResponse>(create);
  static InviteUserResponse? _defaultInstance;

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

  @$pb.TagNumber(2)
  Invitation get invitation => $_getN(1);
  @$pb.TagNumber(2)
  set invitation(Invitation value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInvitation() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvitation() => $_clearField(2);
  @$pb.TagNumber(2)
  Invitation ensureInvitation() => $_ensure(1);
}

class AcceptInvitationRequest extends $pb.GeneratedMessage {
  factory AcceptInvitationRequest({
    $core.String? token,
    $core.String? newPassword,
  }) {
    final result = create();
    if (token != null) result.token = token;
    if (newPassword != null) result.newPassword = newPassword;
    return result;
  }

  AcceptInvitationRequest._();

  factory AcceptInvitationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AcceptInvitationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AcceptInvitationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'token')
    ..aOS(2, _omitFieldNames ? '' : 'newPassword')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptInvitationRequest clone() =>
      AcceptInvitationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptInvitationRequest copyWith(
          void Function(AcceptInvitationRequest) updates) =>
      super.copyWith((message) => updates(message as AcceptInvitationRequest))
          as AcceptInvitationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptInvitationRequest create() => AcceptInvitationRequest._();
  @$core.override
  AcceptInvitationRequest createEmptyInstance() => create();
  static $pb.PbList<AcceptInvitationRequest> createRepeated() =>
      $pb.PbList<AcceptInvitationRequest>();
  @$core.pragma('dart2js:noInline')
  static AcceptInvitationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AcceptInvitationRequest>(create);
  static AcceptInvitationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get token => $_getSZ(0);
  @$pb.TagNumber(1)
  set token($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasToken() => $_has(0);
  @$pb.TagNumber(1)
  void clearToken() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get newPassword => $_getSZ(1);
  @$pb.TagNumber(2)
  set newPassword($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasNewPassword() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewPassword() => $_clearField(2);
}

class AcceptInvitationResponse extends $pb.GeneratedMessage {
  factory AcceptInvitationResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  AcceptInvitationResponse._();

  factory AcceptInvitationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AcceptInvitationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AcceptInvitationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptInvitationResponse clone() =>
      AcceptInvitationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AcceptInvitationResponse copyWith(
          void Function(AcceptInvitationResponse) updates) =>
      super.copyWith((message) => updates(message as AcceptInvitationResponse))
          as AcceptInvitationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AcceptInvitationResponse create() => AcceptInvitationResponse._();
  @$core.override
  AcceptInvitationResponse createEmptyInstance() => create();
  static $pb.PbList<AcceptInvitationResponse> createRepeated() =>
      $pb.PbList<AcceptInvitationResponse>();
  @$core.pragma('dart2js:noInline')
  static AcceptInvitationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AcceptInvitationResponse>(create);
  static AcceptInvitationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class CancelInvitationRequest extends $pb.GeneratedMessage {
  factory CancelInvitationRequest({
    $core.String? invitationId,
  }) {
    final result = create();
    if (invitationId != null) result.invitationId = invitationId;
    return result;
  }

  CancelInvitationRequest._();

  factory CancelInvitationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelInvitationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelInvitationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'invitationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelInvitationRequest clone() =>
      CancelInvitationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelInvitationRequest copyWith(
          void Function(CancelInvitationRequest) updates) =>
      super.copyWith((message) => updates(message as CancelInvitationRequest))
          as CancelInvitationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelInvitationRequest create() => CancelInvitationRequest._();
  @$core.override
  CancelInvitationRequest createEmptyInstance() => create();
  static $pb.PbList<CancelInvitationRequest> createRepeated() =>
      $pb.PbList<CancelInvitationRequest>();
  @$core.pragma('dart2js:noInline')
  static CancelInvitationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelInvitationRequest>(create);
  static CancelInvitationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get invitationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set invitationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInvitationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvitationId() => $_clearField(1);
}

class CancelInvitationResponse extends $pb.GeneratedMessage {
  factory CancelInvitationResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  CancelInvitationResponse._();

  factory CancelInvitationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelInvitationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelInvitationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelInvitationResponse clone() =>
      CancelInvitationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelInvitationResponse copyWith(
          void Function(CancelInvitationResponse) updates) =>
      super.copyWith((message) => updates(message as CancelInvitationResponse))
          as CancelInvitationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelInvitationResponse create() => CancelInvitationResponse._();
  @$core.override
  CancelInvitationResponse createEmptyInstance() => create();
  static $pb.PbList<CancelInvitationResponse> createRepeated() =>
      $pb.PbList<CancelInvitationResponse>();
  @$core.pragma('dart2js:noInline')
  static CancelInvitationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelInvitationResponse>(create);
  static CancelInvitationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ResendInvitationRequest extends $pb.GeneratedMessage {
  factory ResendInvitationRequest({
    $core.String? invitationId,
  }) {
    final result = create();
    if (invitationId != null) result.invitationId = invitationId;
    return result;
  }

  ResendInvitationRequest._();

  factory ResendInvitationRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResendInvitationRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResendInvitationRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'invitationId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResendInvitationRequest clone() =>
      ResendInvitationRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResendInvitationRequest copyWith(
          void Function(ResendInvitationRequest) updates) =>
      super.copyWith((message) => updates(message as ResendInvitationRequest))
          as ResendInvitationRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResendInvitationRequest create() => ResendInvitationRequest._();
  @$core.override
  ResendInvitationRequest createEmptyInstance() => create();
  static $pb.PbList<ResendInvitationRequest> createRepeated() =>
      $pb.PbList<ResendInvitationRequest>();
  @$core.pragma('dart2js:noInline')
  static ResendInvitationRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResendInvitationRequest>(create);
  static ResendInvitationRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get invitationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set invitationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInvitationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvitationId() => $_clearField(1);
}

class ResendInvitationResponse extends $pb.GeneratedMessage {
  factory ResendInvitationResponse({
    Invitation? invitation,
  }) {
    final result = create();
    if (invitation != null) result.invitation = invitation;
    return result;
  }

  ResendInvitationResponse._();

  factory ResendInvitationResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ResendInvitationResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ResendInvitationResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<Invitation>(1, _omitFieldNames ? '' : 'invitation',
        subBuilder: Invitation.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResendInvitationResponse clone() =>
      ResendInvitationResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ResendInvitationResponse copyWith(
          void Function(ResendInvitationResponse) updates) =>
      super.copyWith((message) => updates(message as ResendInvitationResponse))
          as ResendInvitationResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ResendInvitationResponse create() => ResendInvitationResponse._();
  @$core.override
  ResendInvitationResponse createEmptyInstance() => create();
  static $pb.PbList<ResendInvitationResponse> createRepeated() =>
      $pb.PbList<ResendInvitationResponse>();
  @$core.pragma('dart2js:noInline')
  static ResendInvitationResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ResendInvitationResponse>(create);
  static ResendInvitationResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Invitation get invitation => $_getN(0);
  @$pb.TagNumber(1)
  set invitation(Invitation value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInvitation() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvitation() => $_clearField(1);
  @$pb.TagNumber(1)
  Invitation ensureInvitation() => $_ensure(0);
}

class UserServiceApi {
  final $pb.RpcClient _client;

  UserServiceApi(this._client);

  /// Update the user information for the user.
  $async.Future<UpdateResponse> update(
          $pb.ClientContext? ctx, UpdateRequest request) =>
      _client.invoke<UpdateResponse>(
          ctx, 'UserService', 'Update', request, UpdateResponse());

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

  /// [Admin] Create a user directly with a password (internal/cashier flow).
  $async.Future<CreateUserDirectResponse> createUserDirect(
          $pb.ClientContext? ctx, CreateUserDirectRequest request) =>
      _client.invoke<CreateUserDirectResponse>(ctx, 'UserService',
          'CreateUserDirect', request, CreateUserDirectResponse());

  /// [Admin] Invite an external user via email link (invite flow).
  $async.Future<InviteUserResponse> inviteUser(
          $pb.ClientContext? ctx, InviteUserRequest request) =>
      _client.invoke<InviteUserResponse>(
          ctx, 'UserService', 'InviteUser', request, InviteUserResponse());

  /// [Admin] Cancel a pending invitation.
  $async.Future<CancelInvitationResponse> cancelInvitation(
          $pb.ClientContext? ctx, CancelInvitationRequest request) =>
      _client.invoke<CancelInvitationResponse>(ctx, 'UserService',
          'CancelInvitation', request, CancelInvitationResponse());

  /// [Admin] Resend an expired or pending invitation.
  $async.Future<ResendInvitationResponse> resendInvitation(
          $pb.ClientContext? ctx, ResendInvitationRequest request) =>
      _client.invoke<ResendInvitationResponse>(ctx, 'UserService',
          'ResendInvitation', request, ResendInvitationResponse());

  /// [Invited user] Accept invitation and set password.
  $async.Future<AcceptInvitationResponse> acceptInvitation(
          $pb.ClientContext? ctx, AcceptInvitationRequest request) =>
      _client.invoke<AcceptInvitationResponse>(ctx, 'UserService',
          'AcceptInvitation', request, AcceptInvitationResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
