//
//  Generated code. Do not modify.
//  source: store/v1/store.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Stores are used to store products.
/// Note: A store is not always a shop.
class Store extends $pb.GeneratedMessage {
  factory Store({
    $core.String? uid,
    $core.String? address,
    $core.String? name,
    $core.String? description,
    $core.String? logoMediaUid,
    $core.String? businessId,
    $core.String? createdAt,
    $core.String? updatedAt,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    if (address != null) {
      $result.address = address;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (logoMediaUid != null) {
      $result.logoMediaUid = logoMediaUid;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    if (createdAt != null) {
      $result.createdAt = createdAt;
    }
    if (updatedAt != null) {
      $result.updatedAt = updatedAt;
    }
    return $result;
  }
  Store._() : super();
  factory Store.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Store.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Store', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'address')
    ..aOS(3, _omitFieldNames ? '' : 'name')
    ..aOS(5, _omitFieldNames ? '' : 'description')
    ..aOS(6, _omitFieldNames ? '' : 'logoMediaUid')
    ..aOS(7, _omitFieldNames ? '' : 'businessId')
    ..aOS(8, _omitFieldNames ? '' : 'createdAt')
    ..aOS(9, _omitFieldNames ? '' : 'updatedAt')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Store clone() => Store()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Store copyWith(void Function(Store) updates) => super.copyWith((message) => updates(message as Store)) as Store;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Store create() => Store._();
  Store createEmptyInstance() => create();
  static $pb.PbList<Store> createRepeated() => $pb.PbList<Store>();
  @$core.pragma('dart2js:noInline')
  static Store getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Store>(create);
  static Store? _defaultInstance;

  /// The unique identifier of the store.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  /// The address of the store.
  @$pb.TagNumber(2)
  $core.String get address => $_getSZ(1);
  @$pb.TagNumber(2)
  set address($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasAddress() => $_has(1);
  @$pb.TagNumber(2)
  void clearAddress() => clearField(2);

  /// The name of the store.
  @$pb.TagNumber(3)
  $core.String get name => $_getSZ(2);
  @$pb.TagNumber(3)
  set name($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasName() => $_has(2);
  @$pb.TagNumber(3)
  void clearName() => clearField(3);

  /// The description of the store.
  @$pb.TagNumber(5)
  $core.String get description => $_getSZ(3);
  @$pb.TagNumber(5)
  set description($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(5)
  $core.bool hasDescription() => $_has(3);
  @$pb.TagNumber(5)
  void clearDescription() => clearField(5);

  /// The uid of the media of the logo of the store.
  @$pb.TagNumber(6)
  $core.String get logoMediaUid => $_getSZ(4);
  @$pb.TagNumber(6)
  set logoMediaUid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasLogoMediaUid() => $_has(4);
  @$pb.TagNumber(6)
  void clearLogoMediaUid() => clearField(6);

  /// The uid of the business of the store.
  @$pb.TagNumber(7)
  $core.String get businessId => $_getSZ(5);
  @$pb.TagNumber(7)
  set businessId($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(7)
  $core.bool hasBusinessId() => $_has(5);
  @$pb.TagNumber(7)
  void clearBusinessId() => clearField(7);

  /// The date and time the store was created.
  @$pb.TagNumber(8)
  $core.String get createdAt => $_getSZ(6);
  @$pb.TagNumber(8)
  set createdAt($core.String v) { $_setString(6, v); }
  @$pb.TagNumber(8)
  $core.bool hasCreatedAt() => $_has(6);
  @$pb.TagNumber(8)
  void clearCreatedAt() => clearField(8);

  /// The date and time the store was last updated.
  @$pb.TagNumber(9)
  $core.String get updatedAt => $_getSZ(7);
  @$pb.TagNumber(9)
  set updatedAt($core.String v) { $_setString(7, v); }
  @$pb.TagNumber(9)
  $core.bool hasUpdatedAt() => $_has(7);
  @$pb.TagNumber(9)
  void clearUpdatedAt() => clearField(9);
}

class CreateStoreRequest extends $pb.GeneratedMessage {
  factory CreateStoreRequest({
    Store? store,
    $core.List<$core.int>? logoRawImage,
  }) {
    final $result = create();
    if (store != null) {
      $result.store = store;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    return $result;
  }
  CreateStoreRequest._() : super();
  factory CreateStoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateStoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateStoreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateStoreRequest clone() => CreateStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateStoreRequest copyWith(void Function(CreateStoreRequest) updates) => super.copyWith((message) => updates(message as CreateStoreRequest)) as CreateStoreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStoreRequest create() => CreateStoreRequest._();
  CreateStoreRequest createEmptyInstance() => create();
  static $pb.PbList<CreateStoreRequest> createRepeated() => $pb.PbList<CreateStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateStoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateStoreRequest>(create);
  static CreateStoreRequest? _defaultInstance;

  /// The store information to create.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);

  /// The raw image of the logo of the store.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);
}

class CreateStoreResponse extends $pb.GeneratedMessage {
  factory CreateStoreResponse({
    $core.String? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  CreateStoreResponse._() : super();
  factory CreateStoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreateStoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreateStoreResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreateStoreResponse clone() => CreateStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreateStoreResponse copyWith(void Function(CreateStoreResponse) updates) => super.copyWith((message) => updates(message as CreateStoreResponse)) as CreateStoreResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStoreResponse create() => CreateStoreResponse._();
  CreateStoreResponse createEmptyInstance() => create();
  static $pb.PbList<CreateStoreResponse> createRepeated() => $pb.PbList<CreateStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateStoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreateStoreResponse>(create);
  static CreateStoreResponse? _defaultInstance;

  /// The unique identifier of the created store.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class GetStoreRequest extends $pb.GeneratedMessage {
  factory GetStoreRequest({
    $core.String? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  GetStoreRequest._() : super();
  factory GetStoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStoreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStoreRequest clone() => GetStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStoreRequest copyWith(void Function(GetStoreRequest) updates) => super.copyWith((message) => updates(message as GetStoreRequest)) as GetStoreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreRequest create() => GetStoreRequest._();
  GetStoreRequest createEmptyInstance() => create();
  static $pb.PbList<GetStoreRequest> createRepeated() => $pb.PbList<GetStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStoreRequest>(create);
  static GetStoreRequest? _defaultInstance;

  /// The unique identifier of the store to retrieve.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class GetStoreResponse extends $pb.GeneratedMessage {
  factory GetStoreResponse({
    Store? store,
  }) {
    final $result = create();
    if (store != null) {
      $result.store = store;
    }
    return $result;
  }
  GetStoreResponse._() : super();
  factory GetStoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetStoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetStoreResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetStoreResponse clone() => GetStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetStoreResponse copyWith(void Function(GetStoreResponse) updates) => super.copyWith((message) => updates(message as GetStoreResponse)) as GetStoreResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStoreResponse create() => GetStoreResponse._();
  GetStoreResponse createEmptyInstance() => create();
  static $pb.PbList<GetStoreResponse> createRepeated() => $pb.PbList<GetStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static GetStoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetStoreResponse>(create);
  static GetStoreResponse? _defaultInstance;

  /// The retrieved store data.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);
}

class UpdateStoreRequest extends $pb.GeneratedMessage {
  factory UpdateStoreRequest({
    Store? store,
    $core.List<$core.int>? logoRawImage,
  }) {
    final $result = create();
    if (store != null) {
      $result.store = store;
    }
    if (logoRawImage != null) {
      $result.logoRawImage = logoRawImage;
    }
    return $result;
  }
  UpdateStoreRequest._() : super();
  factory UpdateStoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateStoreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..a<$core.List<$core.int>>(2, _omitFieldNames ? '' : 'logoRawImage', $pb.PbFieldType.OY)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateStoreRequest clone() => UpdateStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateStoreRequest copyWith(void Function(UpdateStoreRequest) updates) => super.copyWith((message) => updates(message as UpdateStoreRequest)) as UpdateStoreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreRequest create() => UpdateStoreRequest._();
  UpdateStoreRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreRequest> createRepeated() => $pb.PbList<UpdateStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateStoreRequest>(create);
  static UpdateStoreRequest? _defaultInstance;

  /// The store information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);

  /// The raw image of the logo of the store.
  @$pb.TagNumber(2)
  $core.List<$core.int> get logoRawImage => $_getN(1);
  @$pb.TagNumber(2)
  set logoRawImage($core.List<$core.int> v) { $_setBytes(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasLogoRawImage() => $_has(1);
  @$pb.TagNumber(2)
  void clearLogoRawImage() => clearField(2);
}

class UpdateStoreResponse extends $pb.GeneratedMessage {
  factory UpdateStoreResponse({
    Store? store,
  }) {
    final $result = create();
    if (store != null) {
      $result.store = store;
    }
    return $result;
  }
  UpdateStoreResponse._() : super();
  factory UpdateStoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdateStoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdateStoreResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOM<Store>(1, _omitFieldNames ? '' : 'store', subBuilder: Store.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdateStoreResponse clone() => UpdateStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdateStoreResponse copyWith(void Function(UpdateStoreResponse) updates) => super.copyWith((message) => updates(message as UpdateStoreResponse)) as UpdateStoreResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStoreResponse create() => UpdateStoreResponse._();
  UpdateStoreResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStoreResponse> createRepeated() => $pb.PbList<UpdateStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdateStoreResponse>(create);
  static UpdateStoreResponse? _defaultInstance;

  /// The updated store data.
  @$pb.TagNumber(1)
  Store get store => $_getN(0);
  @$pb.TagNumber(1)
  set store(Store v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasStore() => $_has(0);
  @$pb.TagNumber(1)
  void clearStore() => clearField(1);
  @$pb.TagNumber(1)
  Store ensureStore() => $_ensure(0);
}

class DeleteStoreRequest extends $pb.GeneratedMessage {
  factory DeleteStoreRequest({
    $core.String? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  DeleteStoreRequest._() : super();
  factory DeleteStoreRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteStoreRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteStoreRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteStoreRequest clone() => DeleteStoreRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteStoreRequest copyWith(void Function(DeleteStoreRequest) updates) => super.copyWith((message) => updates(message as DeleteStoreRequest)) as DeleteStoreRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreRequest create() => DeleteStoreRequest._();
  DeleteStoreRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreRequest> createRepeated() => $pb.PbList<DeleteStoreRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteStoreRequest>(create);
  static DeleteStoreRequest? _defaultInstance;

  /// The unique identifier of the store to delete.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class DeleteStoreResponse extends $pb.GeneratedMessage {
  factory DeleteStoreResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeleteStoreResponse._() : super();
  factory DeleteStoreResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeleteStoreResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeleteStoreResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'store.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeleteStoreResponse clone() => DeleteStoreResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeleteStoreResponse copyWith(void Function(DeleteStoreResponse) updates) => super.copyWith((message) => updates(message as DeleteStoreResponse)) as DeleteStoreResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStoreResponse create() => DeleteStoreResponse._();
  DeleteStoreResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteStoreResponse> createRepeated() => $pb.PbList<DeleteStoreResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteStoreResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeleteStoreResponse>(create);
  static DeleteStoreResponse? _defaultInstance;

  /// Whether the store was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class StoreServiceApi {
  $pb.RpcClient _client;
  StoreServiceApi(this._client);

  $async.Future<CreateStoreResponse> createStore($pb.ClientContext? ctx, CreateStoreRequest request) =>
    _client.invoke<CreateStoreResponse>(ctx, 'StoreService', 'CreateStore', request, CreateStoreResponse())
  ;
  $async.Future<GetStoreResponse> getStore($pb.ClientContext? ctx, GetStoreRequest request) =>
    _client.invoke<GetStoreResponse>(ctx, 'StoreService', 'GetStore', request, GetStoreResponse())
  ;
  $async.Future<UpdateStoreResponse> updateStore($pb.ClientContext? ctx, UpdateStoreRequest request) =>
    _client.invoke<UpdateStoreResponse>(ctx, 'StoreService', 'UpdateStore', request, UpdateStoreResponse())
  ;
  $async.Future<DeleteStoreResponse> deleteStore($pb.ClientContext? ctx, DeleteStoreRequest request) =>
    _client.invoke<DeleteStoreResponse>(ctx, 'StoreService', 'DeleteStore', request, DeleteStoreResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
