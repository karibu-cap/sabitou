// This is a generated file - do not edit.
//
// Generated from store/v1/store.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import '../../identity/v1/permission.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// Stores are used to store products.
/// Note: A store is not always a shop.
class Store extends $pb.GeneratedMessage {
  factory Store({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    $core.String? logoLinkId,
    $core.String? externalLinksIds,
    $core.String? businessId,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (logoLinkId != null) result.logoLinkId = logoLinkId;
    if (externalLinksIds != null) result.externalLinksIds = externalLinksIds;
    if (businessId != null) result.businessId = businessId;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  Store._();

  factory Store.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Store.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Store',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'logoLinkId')
    ..aOS(7, _omitFieldNames ? '' : 'externalLinksIds')
    ..aOS(8, _omitFieldNames ? '' : 'businessId')
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Store clone() => Store()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Store copyWith(void Function(Store) updates) =>
      super.copyWith((message) => updates(message as Store)) as Store;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Store create() => Store._();
  @$core.override
  Store createEmptyInstance() => create();
  static $pb.PbList<Store> createRepeated() => $pb.PbList<Store>();
  @$core.pragma('dart2js:noInline')
  static Store getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Store>(create);
  static Store? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the store.
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(3)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(3)
  void clearName() => $_clearField(3);

  /// The description of the store.
  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(5)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(5)
  void clearDescription() => $_clearField(5);

  /// The id of the media of the logo of the store.
  @$pb.TagNumber(6)
  $core.String get logoLinkId => $_getSZ(3);
  @$pb.TagNumber(6)
  set logoLinkId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(6)
  $core.bool hasLogoLinkId() => $_has(3);
  @$pb.TagNumber(6)
  void clearLogoLinkId() => $_clearField(6);

  /// The list of external links of the store it can be an address link, a phone number, an email, a website etc.
  @$pb.TagNumber(7)
  $core.String get externalLinksIds => $_getSZ(4);
  @$pb.TagNumber(7)
  set externalLinksIds($core.String value) => $_setString(4, value);
  @$pb.TagNumber(7)
  $core.bool hasExternalLinksIds() => $_has(4);
  @$pb.TagNumber(7)
  void clearExternalLinksIds() => $_clearField(7);

  /// The id of the business of the store.
  @$pb.TagNumber(8)
  $core.String get businessId => $_getSZ(5);
  @$pb.TagNumber(8)
  set businessId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(8)
  $core.bool hasBusinessId() => $_has(5);
  @$pb.TagNumber(8)
  void clearBusinessId() => $_clearField(8);

  /// The date and time the store was created.
  @$pb.TagNumber(9)
  $0.Timestamp get createdAt => $_getN(6);
  @$pb.TagNumber(9)
  set createdAt($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureCreatedAt() => $_ensure(6);

  /// The date and time the store was last updated.
  @$pb.TagNumber(10)
  $0.Timestamp get updatedAt => $_getN(7);
  @$pb.TagNumber(10)
  set updatedAt($0.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(10)
  void clearUpdatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureUpdatedAt() => $_ensure(7);
}

class StoreMember extends $pb.GeneratedMessage {
  factory StoreMember({
    $core.String? userId,
    $core.String? storeId,
    $core.Iterable<$1.StorePermission>? permissions,
    $0.Timestamp? memberSince,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (permissions != null) result.permissions.addAll(permissions);
    if (memberSince != null) result.memberSince = memberSince;
    return result;
  }

  StoreMember._();

  factory StoreMember.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StoreMember.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StoreMember',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..pc<$1.StorePermission>(
        3, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM,
        subBuilder: $1.StorePermission.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'memberSince',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreMember clone() => StoreMember()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StoreMember copyWith(void Function(StoreMember) updates) =>
      super.copyWith((message) => updates(message as StoreMember))
          as StoreMember;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StoreMember create() => StoreMember._();
  @$core.override
  StoreMember createEmptyInstance() => create();
  static $pb.PbList<StoreMember> createRepeated() => $pb.PbList<StoreMember>();
  @$core.pragma('dart2js:noInline')
  static StoreMember getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StoreMember>(create);
  static StoreMember? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the store.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// The permissions that the user has.
  @$pb.TagNumber(3)
  $pb.PbList<$1.StorePermission> get permissions => $_getList(2);

  /// The date since when the user became a member.
  @$pb.TagNumber(4)
  $0.Timestamp get memberSince => $_getN(3);
  @$pb.TagNumber(4)
  set memberSince($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasMemberSince() => $_has(3);
  @$pb.TagNumber(4)
  void clearMemberSince() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureMemberSince() => $_ensure(3);
}

class CreateStoreRequest extends $pb.GeneratedMessage {
  factory CreateStoreRequest({
    Store? store,
    $core.List<$core.int>? logoRawImage,
  }) {
    final result = create();
    if (store != null) result.store = store;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    return result;
  }

  CreateStoreRequest._();

  factory CreateStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreRequest clone() => CreateStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreRequest copyWith(void Function(CreateStoreRequest) updates) =>
      super.copyWith((message) => updates(message as CreateStoreRequest))
          as CreateStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStoreRequest create() => CreateStoreRequest._();
  @$core.override
  CreateStoreRequest createEmptyInstance() => create();
  static $pb.PbList<CreateStoreRequest> createRepeated() =>
      $pb.PbList<CreateStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStoreRequest>(create);
  static CreateStoreRequest? _defaultInstance;

  /// The store information to create.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => $_clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);

  /// The raw image of the logo of the store.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);
}

class CreateStoreResponse extends $pb.GeneratedMessage {
  factory CreateStoreResponse({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  CreateStoreResponse._();

  factory CreateStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreResponse clone() => CreateStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStoreResponse copyWith(void Function(CreateStoreResponse) updates) =>
      super.copyWith((message) => updates(message as CreateStoreResponse))
          as CreateStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStoreResponse create() => CreateStoreResponse._();
  @$core.override
  CreateStoreResponse createEmptyInstance() => create();
  static $pb.PbList<CreateStoreResponse> createRepeated() =>
      $pb.PbList<CreateStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStoreResponse>(create);
  static CreateStoreResponse? _defaultInstance;

  /// The unique identifier of the created store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetStoreRequest extends $pb.GeneratedMessage {
  factory GetStoreRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetStoreRequest._();

  factory GetStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreRequest clone() => GetStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreRequest copyWith(void Function(GetStoreRequest) updates) =>
      super.copyWith((message) => updates(message as GetStoreRequest))
          as GetStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreRequest create() => GetStoreRequest._();
  @$core.override
  GetStoreRequest createEmptyInstance() => create();
  static $pb.PbList<GetStoreRequest> createRepeated() =>
      $pb.PbList<GetStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreRequest>(create);
  static GetStoreRequest? _defaultInstance;

  /// The unique identifier of the store to retrieve.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetStoreResponse extends $pb.GeneratedMessage {
  factory GetStoreResponse({
    Store? store,
  }) {
    final result = create();
    if (store != null) result.store = store;
    return result;
  }

  GetStoreResponse._();

  factory GetStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreResponse clone() => GetStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStoreResponse copyWith(void Function(GetStoreResponse) updates) =>
      super.copyWith((message) => updates(message as GetStoreResponse))
          as GetStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreResponse create() => GetStoreResponse._();
  @$core.override
  GetStoreResponse createEmptyInstance() => create();
  static $pb.PbList<GetStoreResponse> createRepeated() =>
      $pb.PbList<GetStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStoreResponse>(create);
  static GetStoreResponse? _defaultInstance;

  /// The retrieved store data.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => $_clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);
}

class UpdateStoreRequest extends $pb.GeneratedMessage {
  factory UpdateStoreRequest({
    Store? store,
    $core.List<$core.int>? logoRawImage,
  }) {
    final result = create();
    if (store != null) result.store = store;
    if (logoRawImage != null) result.logoRawImage = logoRawImage;
    return result;
  }

  UpdateStoreRequest._();

  factory UpdateStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..a<$core.List<$core.int>>(
        2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreRequest clone() => UpdateStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreRequest copyWith(void Function(UpdateStoreRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreRequest))
          as UpdateStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreRequest create() => UpdateStoreRequest._();
  @$core.override
  UpdateStoreRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreRequest> createRepeated() =>
      $pb.PbList<UpdateStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreRequest>(create);
  static UpdateStoreRequest? _defaultInstance;

  /// The store information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => $_clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);

  /// The raw image of the logo of the store.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> value) => $_setBytes(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => $_clearField(2);
}

class UpdateStoreResponse extends $pb.GeneratedMessage {
  factory UpdateStoreResponse({
    Store? store,
  }) {
    final result = create();
    if (store != null) result.store = store;
    return result;
  }

  UpdateStoreResponse._();

  factory UpdateStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreResponse clone() => UpdateStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreResponse copyWith(void Function(UpdateStoreResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreResponse))
          as UpdateStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreResponse create() => UpdateStoreResponse._();
  @$core.override
  UpdateStoreResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreResponse> createRepeated() =>
      $pb.PbList<UpdateStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreResponse>(create);
  static UpdateStoreResponse? _defaultInstance;

  /// The updated store data.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => $_clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);
}

class DeleteStoreRequest extends $pb.GeneratedMessage {
  factory DeleteStoreRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  DeleteStoreRequest._();

  factory DeleteStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreRequest clone() => DeleteStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreRequest copyWith(void Function(DeleteStoreRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteStoreRequest))
          as DeleteStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreRequest create() => DeleteStoreRequest._();
  @$core.override
  DeleteStoreRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreRequest> createRepeated() =>
      $pb.PbList<DeleteStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStoreRequest>(create);
  static DeleteStoreRequest? _defaultInstance;

  /// The unique identifier of the store to delete.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetBusinessStoresRequest extends $pb.GeneratedMessage {
  factory GetBusinessStoresRequest({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  GetBusinessStoresRequest._();

  factory GetBusinessStoresRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessStoresRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessStoresRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresRequest clone() =>
      GetBusinessStoresRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresRequest copyWith(
          void Function(GetBusinessStoresRequest) updates) =>
      super.copyWith((message) => updates(message as GetBusinessStoresRequest))
          as GetBusinessStoresRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresRequest create() => GetBusinessStoresRequest._();
  @$core.override
  GetBusinessStoresRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessStoresRequest> createRepeated() =>
      $pb.PbList<GetBusinessStoresRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessStoresRequest>(create);
  static GetBusinessStoresRequest? _defaultInstance;

  /// The reference id to the supplier identifier.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

class GetBusinessStoresResponse extends $pb.GeneratedMessage {
  factory GetBusinessStoresResponse({
    $core.Iterable<Store>? stores,
  }) {
    final result = create();
    if (stores != null) result.stores.addAll(stores);
    return result;
  }

  GetBusinessStoresResponse._();

  factory GetBusinessStoresResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessStoresResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessStoresResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..pc<Store>(1, _omitFieldNames ? '' : 'stores', $pb.PbFieldType.PM,
        subBuilder: Store.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresResponse clone() =>
      GetBusinessStoresResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessStoresResponse copyWith(
          void Function(GetBusinessStoresResponse) updates) =>
      super.copyWith((message) => updates(message as GetBusinessStoresResponse))
          as GetBusinessStoresResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresResponse create() => GetBusinessStoresResponse._();
  @$core.override
  GetBusinessStoresResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessStoresResponse> createRepeated() =>
      $pb.PbList<GetBusinessStoresResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessStoresResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetBusinessStoresResponse>(create);
  static GetBusinessStoresResponse? _defaultInstance;

  /// The list of stores of the business.
  /// Note: Only the ids and names of the stores are returned.
  @$pb.TagNumber(1)
  $pb.PbList<Store> get stores => $_getList(0);
}

class DeleteStoreResponse extends $pb.GeneratedMessage {
  factory DeleteStoreResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteStoreResponse._();

  factory DeleteStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreResponse clone() => DeleteStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStoreResponse copyWith(void Function(DeleteStoreResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteStoreResponse))
          as DeleteStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreResponse create() => DeleteStoreResponse._();
  @$core.override
  DeleteStoreResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreResponse> createRepeated() =>
      $pb.PbList<DeleteStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStoreResponse>(create);
  static DeleteStoreResponse? _defaultInstance;

  /// Whether the store was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class CreateUserToStoreRequest extends $pb.GeneratedMessage {
  factory CreateUserToStoreRequest({
    $core.String? firstName,
    $core.String? lastName,
    $core.String? userName,
    $core.String? phoneNumber,
    $core.String? email,
    $core.String? password,
    $core.String? businessId,
    $core.Iterable<$1.StorePermission>? permissions,
  }) {
    final result = create();
    if (firstName != null) result.firstName = firstName;
    if (lastName != null) result.lastName = lastName;
    if (userName != null) result.userName = userName;
    if (phoneNumber != null) result.phoneNumber = phoneNumber;
    if (email != null) result.email = email;
    if (password != null) result.password = password;
    if (businessId != null) result.businessId = businessId;
    if (permissions != null) result.permissions.addAll(permissions);
    return result;
  }

  CreateUserToStoreRequest._();

  factory CreateUserToStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateUserToStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateUserToStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'firstName')
    ..aOS(2, _omitFieldNames ? '' : 'lastName')
    ..aOS(3, _omitFieldNames ? '' : 'userName')
    ..aOS(4, _omitFieldNames ? '' : 'phoneNumber')
    ..aOS(5, _omitFieldNames ? '' : 'email')
    ..aOS(6, _omitFieldNames ? '' : 'password')
    ..aOS(7, _omitFieldNames ? '' : 'businessId')
    ..pc<$1.StorePermission>(
        8, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM,
        subBuilder: $1.StorePermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToStoreRequest clone() =>
      CreateUserToStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToStoreRequest copyWith(
          void Function(CreateUserToStoreRequest) updates) =>
      super.copyWith((message) => updates(message as CreateUserToStoreRequest))
          as CreateUserToStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserToStoreRequest create() => CreateUserToStoreRequest._();
  @$core.override
  CreateUserToStoreRequest createEmptyInstance() => create();
  static $pb.PbList<CreateUserToStoreRequest> createRepeated() =>
      $pb.PbList<CreateUserToStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateUserToStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateUserToStoreRequest>(create);
  static CreateUserToStoreRequest? _defaultInstance;

  /// The first name of the user.
  @$pb.TagNumber(1)
  $core.String get firstName => $_getSZ(0);
  @$pb.TagNumber(1)
  set firstName($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFirstName() => $_has(0);
  @$pb.TagNumber(1)
  void clearFirstName() => $_clearField(1);

  /// The last name of the user.
  @$pb.TagNumber(2)
  $core.String get lastName => $_getSZ(1);
  @$pb.TagNumber(2)
  set lastName($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasLastName() => $_has(1);
  @$pb.TagNumber(2)
  void clearLastName() => $_clearField(2);

  /// The username of the user.
  @$pb.TagNumber(3)
  $core.String get userName => $_getSZ(2);
  @$pb.TagNumber(3)
  set userName($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserName() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserName() => $_clearField(3);

  /// The phone number of the user.
  @$pb.TagNumber(4)
  $core.String get phoneNumber => $_getSZ(3);
  @$pb.TagNumber(4)
  set phoneNumber($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPhoneNumber() => $_has(3);
  @$pb.TagNumber(4)
  void clearPhoneNumber() => $_clearField(4);

  /// The email of the user.
  @$pb.TagNumber(5)
  $core.String get email => $_getSZ(4);
  @$pb.TagNumber(5)
  set email($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasEmail() => $_has(4);
  @$pb.TagNumber(5)
  void clearEmail() => $_clearField(5);

  /// The password of the user.
  @$pb.TagNumber(6)
  $core.String get password => $_getSZ(5);
  @$pb.TagNumber(6)
  set password($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPassword() => $_has(5);
  @$pb.TagNumber(6)
  void clearPassword() => $_clearField(6);

  /// The unique identifier of the business.
  @$pb.TagNumber(7)
  $core.String get businessId => $_getSZ(6);
  @$pb.TagNumber(7)
  set businessId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasBusinessId() => $_has(6);
  @$pb.TagNumber(7)
  void clearBusinessId() => $_clearField(7);

  /// The permissions that the user has.
  @$pb.TagNumber(8)
  $pb.PbList<$1.StorePermission> get permissions => $_getList(7);
}

class CreateUserToStoreResponse extends $pb.GeneratedMessage {
  factory CreateUserToStoreResponse({
    StoreMember? storeMember,
  }) {
    final result = create();
    if (storeMember != null) result.storeMember = storeMember;
    return result;
  }

  CreateUserToStoreResponse._();

  factory CreateUserToStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateUserToStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateUserToStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<StoreMember>(1, _omitFieldNames ? '' : 'storeMember',
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToStoreResponse clone() =>
      CreateUserToStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateUserToStoreResponse copyWith(
          void Function(CreateUserToStoreResponse) updates) =>
      super.copyWith((message) => updates(message as CreateUserToStoreResponse))
          as CreateUserToStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateUserToStoreResponse create() => CreateUserToStoreResponse._();
  @$core.override
  CreateUserToStoreResponse createEmptyInstance() => create();
  static $pb.PbList<CreateUserToStoreResponse> createRepeated() =>
      $pb.PbList<CreateUserToStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateUserToStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateUserToStoreResponse>(create);
  static CreateUserToStoreResponse? _defaultInstance;

  /// The store member to return
  @$pb.TagNumber(1)
  StoreMember get storeMember => $_getN(0);
  @$pb.TagNumber(1)
  set storeMember(StoreMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreMember() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreMember ensureStoreMember() => $_ensure(0);
}

class AssociateUserToStoreRequest extends $pb.GeneratedMessage {
  factory AssociateUserToStoreRequest({
    $core.String? userId,
    $core.String? storeId,
    $core.Iterable<$1.StorePermission>? permissions,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (permissions != null) result.permissions.addAll(permissions);
    return result;
  }

  AssociateUserToStoreRequest._();

  factory AssociateUserToStoreRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssociateUserToStoreRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssociateUserToStoreRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..pc<$1.StorePermission>(
        3, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM,
        subBuilder: $1.StorePermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToStoreRequest clone() =>
      AssociateUserToStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToStoreRequest copyWith(
          void Function(AssociateUserToStoreRequest) updates) =>
      super.copyWith(
              (message) => updates(message as AssociateUserToStoreRequest))
          as AssociateUserToStoreRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssociateUserToStoreRequest create() =>
      AssociateUserToStoreRequest._();
  @$core.override
  AssociateUserToStoreRequest createEmptyInstance() => create();
  static $pb.PbList<AssociateUserToStoreRequest> createRepeated() =>
      $pb.PbList<AssociateUserToStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static AssociateUserToStoreRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssociateUserToStoreRequest>(create);
  static AssociateUserToStoreRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the store.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// The permissions that the user has.
  @$pb.TagNumber(3)
  $pb.PbList<$1.StorePermission> get permissions => $_getList(2);
}

class AssociateUserToStoreResponse extends $pb.GeneratedMessage {
  factory AssociateUserToStoreResponse({
    StoreMember? storeMember,
  }) {
    final result = create();
    if (storeMember != null) result.storeMember = storeMember;
    return result;
  }

  AssociateUserToStoreResponse._();

  factory AssociateUserToStoreResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AssociateUserToStoreResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AssociateUserToStoreResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOM<StoreMember>(1, _omitFieldNames ? '' : 'storeMember',
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToStoreResponse clone() =>
      AssociateUserToStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AssociateUserToStoreResponse copyWith(
          void Function(AssociateUserToStoreResponse) updates) =>
      super.copyWith(
              (message) => updates(message as AssociateUserToStoreResponse))
          as AssociateUserToStoreResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AssociateUserToStoreResponse create() =>
      AssociateUserToStoreResponse._();
  @$core.override
  AssociateUserToStoreResponse createEmptyInstance() => create();
  static $pb.PbList<AssociateUserToStoreResponse> createRepeated() =>
      $pb.PbList<AssociateUserToStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static AssociateUserToStoreResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AssociateUserToStoreResponse>(create);
  static AssociateUserToStoreResponse? _defaultInstance;

  /// The store member to return
  @$pb.TagNumber(1)
  StoreMember get storeMember => $_getN(0);
  @$pb.TagNumber(1)
  set storeMember(StoreMember value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreMember() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreMember() => $_clearField(1);
  @$pb.TagNumber(1)
  StoreMember ensureStoreMember() => $_ensure(0);
}

class UpdateStoreMemberRequest extends $pb.GeneratedMessage {
  factory UpdateStoreMemberRequest({
    $core.String? userId,
    $core.String? storeId,
    $core.Iterable<$1.StorePermission>? addPermissions,
    $core.Iterable<$1.StorePermission>? removePermissions,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (addPermissions != null) result.addPermissions.addAll(addPermissions);
    if (removePermissions != null)
      result.removePermissions.addAll(removePermissions);
    return result;
  }

  UpdateStoreMemberRequest._();

  factory UpdateStoreMemberRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreMemberRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreMemberRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..pc<$1.StorePermission>(
        5, _omitFieldNames ? '' : 'addPermissions', $pb.PbFieldType.PM,
        subBuilder: $1.StorePermission.create)
    ..pc<$1.StorePermission>(
        6, _omitFieldNames ? '' : 'removePermissions', $pb.PbFieldType.PM,
        subBuilder: $1.StorePermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberRequest clone() =>
      UpdateStoreMemberRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberRequest copyWith(
          void Function(UpdateStoreMemberRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreMemberRequest))
          as UpdateStoreMemberRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberRequest create() => UpdateStoreMemberRequest._();
  @$core.override
  UpdateStoreMemberRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreMemberRequest> createRepeated() =>
      $pb.PbList<UpdateStoreMemberRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreMemberRequest>(create);
  static UpdateStoreMemberRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the store.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// The permissions to add (optional).
  @$pb.TagNumber(5)
  $pb.PbList<$1.StorePermission> get addPermissions => $_getList(2);

  /// The permissions to remove (optional).
  @$pb.TagNumber(6)
  $pb.PbList<$1.StorePermission> get removePermissions => $_getList(3);
}

class UpdateStoreMemberResponse extends $pb.GeneratedMessage {
  factory UpdateStoreMemberResponse({
    $core.bool? success,
    StoreMember? storeMember,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (storeMember != null) result.storeMember = storeMember;
    return result;
  }

  UpdateStoreMemberResponse._();

  factory UpdateStoreMemberResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStoreMemberResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStoreMemberResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<StoreMember>(2, _omitFieldNames ? '' : 'storeMember',
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberResponse clone() =>
      UpdateStoreMemberResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStoreMemberResponse copyWith(
          void Function(UpdateStoreMemberResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateStoreMemberResponse))
          as UpdateStoreMemberResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberResponse create() => UpdateStoreMemberResponse._();
  @$core.override
  UpdateStoreMemberResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreMemberResponse> createRepeated() =>
      $pb.PbList<UpdateStoreMemberResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreMemberResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStoreMemberResponse>(create);
  static UpdateStoreMemberResponse? _defaultInstance;

  /// Whether the member was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  /// The updated store member.
  @$pb.TagNumber(2)
  StoreMember get storeMember => $_getN(1);
  @$pb.TagNumber(2)
  set storeMember(StoreMember value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreMember() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreMember() => $_clearField(2);
  @$pb.TagNumber(2)
  StoreMember ensureStoreMember() => $_ensure(1);
}

class StreamStoreMembersRequest extends $pb.GeneratedMessage {
  factory StreamStoreMembersRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  StreamStoreMembersRequest._();

  factory StreamStoreMembersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreMembersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreMembersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersRequest clone() =>
      StreamStoreMembersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersRequest copyWith(
          void Function(StreamStoreMembersRequest) updates) =>
      super.copyWith((message) => updates(message as StreamStoreMembersRequest))
          as StreamStoreMembersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersRequest create() => StreamStoreMembersRequest._();
  @$core.override
  StreamStoreMembersRequest createEmptyInstance() => create();
  static $pb.PbList<StreamStoreMembersRequest> createRepeated() =>
      $pb.PbList<StreamStoreMembersRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreMembersRequest>(create);
  static StreamStoreMembersRequest? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class StreamStoreMembersResponse extends $pb.GeneratedMessage {
  factory StreamStoreMembersResponse({
    $core.Iterable<StoreMember>? storeMembers,
  }) {
    final result = create();
    if (storeMembers != null) result.storeMembers.addAll(storeMembers);
    return result;
  }

  StreamStoreMembersResponse._();

  factory StreamStoreMembersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamStoreMembersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamStoreMembersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'),
      createEmptyInstance: create)
    ..pc<StoreMember>(
        1, _omitFieldNames ? '' : 'storeMembers', $pb.PbFieldType.PM,
        subBuilder: StoreMember.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersResponse clone() =>
      StreamStoreMembersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamStoreMembersResponse copyWith(
          void Function(StreamStoreMembersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StreamStoreMembersResponse))
          as StreamStoreMembersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersResponse create() => StreamStoreMembersResponse._();
  @$core.override
  StreamStoreMembersResponse createEmptyInstance() => create();
  static $pb.PbList<StreamStoreMembersResponse> createRepeated() =>
      $pb.PbList<StreamStoreMembersResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamStoreMembersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamStoreMembersResponse>(create);
  static StreamStoreMembersResponse? _defaultInstance;

  /// The store members.
  @$pb.TagNumber(1)
  $pb.PbList<StoreMember> get storeMembers => $_getList(0);
}

class StoreServiceApi {
  final $pb.RpcClient _client;

  StoreServiceApi(this._client);

  /// Creates a new store.
  $async.Future<CreateStoreResponse> createStore(
          $pb.ClientContext? ctx, CreateStoreRequest request) =>
      _client.invoke<CreateStoreResponse>(
          ctx, 'StoreService', 'CreateStore', request, CreateStoreResponse());

  /// Gets a store by id.
  $async.Future<GetStoreResponse> getStore(
          $pb.ClientContext? ctx, GetStoreRequest request) =>
      _client.invoke<GetStoreResponse>(
          ctx, 'StoreService', 'GetStore', request, GetStoreResponse());

  /// Updates a store.
  /// Note:Only the fields that are set will be updated.
  $async.Future<UpdateStoreResponse> updateStore(
          $pb.ClientContext? ctx, UpdateStoreRequest request) =>
      _client.invoke<UpdateStoreResponse>(
          ctx, 'StoreService', 'UpdateStore', request, UpdateStoreResponse());

  /// Deletes a store.
  $async.Future<DeleteStoreResponse> deleteStore(
          $pb.ClientContext? ctx, DeleteStoreRequest request) =>
      _client.invoke<DeleteStoreResponse>(
          ctx, 'StoreService', 'DeleteStore', request, DeleteStoreResponse());

  /// Gets all stores base on business Id.
  $async.Future<GetBusinessStoresResponse> getBusinessStores(
          $pb.ClientContext? ctx, GetBusinessStoresRequest request) =>
      _client.invoke<GetBusinessStoresResponse>(ctx, 'StoreService',
          'GetBusinessStores', request, GetBusinessStoresResponse());

  /// Add user to store or invite user to store.
  $async.Future<CreateUserToStoreResponse> createUserToStore(
          $pb.ClientContext? ctx, CreateUserToStoreRequest request) =>
      _client.invoke<CreateUserToStoreResponse>(ctx, 'StoreService',
          'CreateUserToStore', request, CreateUserToStoreResponse());

  /// Associate user to store.
  $async.Future<AssociateUserToStoreResponse> associateUserToStore(
          $pb.ClientContext? ctx, AssociateUserToStoreRequest request) =>
      _client.invoke<AssociateUserToStoreResponse>(ctx, 'StoreService',
          'AssociateUserToStore', request, AssociateUserToStoreResponse());

  /// Update store member.
  $async.Future<UpdateStoreMemberResponse> updateStoreMember(
          $pb.ClientContext? ctx, UpdateStoreMemberRequest request) =>
      _client.invoke<UpdateStoreMemberResponse>(ctx, 'StoreService',
          'UpdateStoreMember', request, UpdateStoreMemberResponse());

  /// Stream store members.
  $async.Future<StreamStoreMembersResponse> streamStoreMembers(
          $pb.ClientContext? ctx, StreamStoreMembersRequest request) =>
      _client.invoke<StreamStoreMembersResponse>(ctx, 'StoreService',
          'StreamStoreMembers', request, StreamStoreMembersResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
