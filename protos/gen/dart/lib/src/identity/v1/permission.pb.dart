// This is a generated file - do not edit.
//
// Generated from identity/v1/permission.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'permission.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'permission.pbenum.dart';

class BusinessPermission extends $pb.GeneratedMessage {
  factory BusinessPermission({
    BusinessResourceType? resourceType,
    ResourceActionType? actionType,
  }) {
    final result = create();
    if (resourceType != null) result.resourceType = resourceType;
    if (actionType != null) result.actionType = actionType;
    return result;
  }

  BusinessPermission._();

  factory BusinessPermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BusinessPermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BusinessPermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..e<BusinessResourceType>(
        1, _omitFieldNames ? '' : 'resourceType', $pb.PbFieldType.OE,
        defaultOrMaker: BusinessResourceType.BUSINESS_RESOURCE_TYPE_UNSPECIFIED,
        valueOf: BusinessResourceType.valueOf,
        enumValues: BusinessResourceType.values)
    ..e<ResourceActionType>(
        2, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED,
        valueOf: ResourceActionType.valueOf,
        enumValues: ResourceActionType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessPermission clone() => BusinessPermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BusinessPermission copyWith(void Function(BusinessPermission) updates) =>
      super.copyWith((message) => updates(message as BusinessPermission))
          as BusinessPermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BusinessPermission create() => BusinessPermission._();
  @$core.override
  BusinessPermission createEmptyInstance() => create();
  static $pb.PbList<BusinessPermission> createRepeated() =>
      $pb.PbList<BusinessPermission>();
  @$core.pragma('dart2js:noInline')
  static BusinessPermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BusinessPermission>(create);
  static BusinessPermission? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessResourceType get resourceType => $_getN(0);
  @$pb.TagNumber(1)
  set resourceType(BusinessResourceType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResourceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceType() => $_clearField(1);

  @$pb.TagNumber(2)
  ResourceActionType get actionType => $_getN(1);
  @$pb.TagNumber(2)
  set actionType(ResourceActionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasActionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionType() => $_clearField(2);
}

class StorePermission extends $pb.GeneratedMessage {
  factory StorePermission({
    StoreResourceType? resourceType,
    ResourceActionType? actionType,
  }) {
    final result = create();
    if (resourceType != null) result.resourceType = resourceType;
    if (actionType != null) result.actionType = actionType;
    return result;
  }

  StorePermission._();

  factory StorePermission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StorePermission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StorePermission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..e<StoreResourceType>(
        1, _omitFieldNames ? '' : 'resourceType', $pb.PbFieldType.OE,
        defaultOrMaker: StoreResourceType.STORE_RESOURCE_TYPE_UNSPECIFIED,
        valueOf: StoreResourceType.valueOf,
        enumValues: StoreResourceType.values)
    ..e<ResourceActionType>(
        2, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED,
        valueOf: ResourceActionType.valueOf,
        enumValues: ResourceActionType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePermission clone() => StorePermission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StorePermission copyWith(void Function(StorePermission) updates) =>
      super.copyWith((message) => updates(message as StorePermission))
          as StorePermission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StorePermission create() => StorePermission._();
  @$core.override
  StorePermission createEmptyInstance() => create();
  static $pb.PbList<StorePermission> createRepeated() =>
      $pb.PbList<StorePermission>();
  @$core.pragma('dart2js:noInline')
  static StorePermission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StorePermission>(create);
  static StorePermission? _defaultInstance;

  @$pb.TagNumber(1)
  StoreResourceType get resourceType => $_getN(0);
  @$pb.TagNumber(1)
  set resourceType(StoreResourceType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResourceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceType() => $_clearField(1);

  @$pb.TagNumber(2)
  ResourceActionType get actionType => $_getN(1);
  @$pb.TagNumber(2)
  set actionType(ResourceActionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasActionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionType() => $_clearField(2);
}

class CreateBusinessPermissionRequest extends $pb.GeneratedMessage {
  factory CreateBusinessPermissionRequest({
    BusinessPermission? businessPermission,
    ResourceActionType? actionType,
    $core.String? businessId,
  }) {
    final result = create();
    if (businessPermission != null)
      result.businessPermission = businessPermission;
    if (actionType != null) result.actionType = actionType;
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  CreateBusinessPermissionRequest._();

  factory CreateBusinessPermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBusinessPermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBusinessPermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessPermission>(1, _omitFieldNames ? '' : 'businessPermission',
        subBuilder: BusinessPermission.create)
    ..e<ResourceActionType>(
        2, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED,
        valueOf: ResourceActionType.valueOf,
        enumValues: ResourceActionType.values)
    ..aOS(3, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessPermissionRequest clone() =>
      CreateBusinessPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessPermissionRequest copyWith(
          void Function(CreateBusinessPermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateBusinessPermissionRequest))
          as CreateBusinessPermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessPermissionRequest create() =>
      CreateBusinessPermissionRequest._();
  @$core.override
  CreateBusinessPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessPermissionRequest> createRepeated() =>
      $pb.PbList<CreateBusinessPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBusinessPermissionRequest>(
          create);
  static CreateBusinessPermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessPermission get businessPermission => $_getN(0);
  @$pb.TagNumber(1)
  set businessPermission(BusinessPermission value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessPermission() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessPermission ensureBusinessPermission() => $_ensure(0);

  @$pb.TagNumber(2)
  ResourceActionType get actionType => $_getN(1);
  @$pb.TagNumber(2)
  set actionType(ResourceActionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasActionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get businessId => $_getSZ(2);
  @$pb.TagNumber(3)
  set businessId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBusinessId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBusinessId() => $_clearField(3);
}

class CreateBusinessPermissionResponse extends $pb.GeneratedMessage {
  factory CreateBusinessPermissionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  CreateBusinessPermissionResponse._();

  factory CreateBusinessPermissionResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateBusinessPermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateBusinessPermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessPermissionResponse clone() =>
      CreateBusinessPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateBusinessPermissionResponse copyWith(
          void Function(CreateBusinessPermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateBusinessPermissionResponse))
          as CreateBusinessPermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateBusinessPermissionResponse create() =>
      CreateBusinessPermissionResponse._();
  @$core.override
  CreateBusinessPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateBusinessPermissionResponse> createRepeated() =>
      $pb.PbList<CreateBusinessPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateBusinessPermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateBusinessPermissionResponse>(
          create);
  static CreateBusinessPermissionResponse? _defaultInstance;

  /// Whether the permission group was successfully created.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class CreateStorePermissionRequest extends $pb.GeneratedMessage {
  factory CreateStorePermissionRequest({
    StorePermission? storePermission,
    ResourceActionType? actionType,
    $core.String? storeId,
  }) {
    final result = create();
    if (storePermission != null) result.storePermission = storePermission;
    if (actionType != null) result.actionType = actionType;
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  CreateStorePermissionRequest._();

  factory CreateStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<StorePermission>(1, _omitFieldNames ? '' : 'storePermission',
        subBuilder: StorePermission.create)
    ..e<ResourceActionType>(
        2, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED,
        valueOf: ResourceActionType.valueOf,
        enumValues: ResourceActionType.values)
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStorePermissionRequest clone() =>
      CreateStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStorePermissionRequest copyWith(
          void Function(CreateStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateStorePermissionRequest))
          as CreateStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStorePermissionRequest create() =>
      CreateStorePermissionRequest._();
  @$core.override
  CreateStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CreateStorePermissionRequest> createRepeated() =>
      $pb.PbList<CreateStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStorePermissionRequest>(create);
  static CreateStorePermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  StorePermission get storePermission => $_getN(0);
  @$pb.TagNumber(1)
  set storePermission(StorePermission value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStorePermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearStorePermission() => $_clearField(1);
  @$pb.TagNumber(1)
  StorePermission ensureStorePermission() => $_ensure(0);

  @$pb.TagNumber(2)
  ResourceActionType get actionType => $_getN(1);
  @$pb.TagNumber(2)
  set actionType(ResourceActionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasActionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);
}

class CreateStorePermissionResponse extends $pb.GeneratedMessage {
  factory CreateStorePermissionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  CreateStorePermissionResponse._();

  factory CreateStorePermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStorePermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStorePermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStorePermissionResponse clone() =>
      CreateStorePermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStorePermissionResponse copyWith(
          void Function(CreateStorePermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateStorePermissionResponse))
          as CreateStorePermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStorePermissionResponse create() =>
      CreateStorePermissionResponse._();
  @$core.override
  CreateStorePermissionResponse createEmptyInstance() => create();
  static $pb.PbList<CreateStorePermissionResponse> createRepeated() =>
      $pb.PbList<CreateStorePermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateStorePermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStorePermissionResponse>(create);
  static CreateStorePermissionResponse? _defaultInstance;

  /// Whether the permission group was successfully created.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UpdateBusinessPermissionRequest extends $pb.GeneratedMessage {
  factory UpdateBusinessPermissionRequest({
    BusinessPermission? businessPermission,
    ResourceActionType? actionType,
    $core.String? businessPermissionId,
  }) {
    final result = create();
    if (businessPermission != null)
      result.businessPermission = businessPermission;
    if (actionType != null) result.actionType = actionType;
    if (businessPermissionId != null)
      result.businessPermissionId = businessPermissionId;
    return result;
  }

  UpdateBusinessPermissionRequest._();

  factory UpdateBusinessPermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessPermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessPermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<BusinessPermission>(1, _omitFieldNames ? '' : 'businessPermission',
        subBuilder: BusinessPermission.create)
    ..e<ResourceActionType>(
        2, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED,
        valueOf: ResourceActionType.valueOf,
        enumValues: ResourceActionType.values)
    ..aOS(3, _omitFieldNames ? '' : 'businessPermissionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessPermissionRequest clone() =>
      UpdateBusinessPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessPermissionRequest copyWith(
          void Function(UpdateBusinessPermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateBusinessPermissionRequest))
          as UpdateBusinessPermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPermissionRequest create() =>
      UpdateBusinessPermissionRequest._();
  @$core.override
  UpdateBusinessPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessPermissionRequest> createRepeated() =>
      $pb.PbList<UpdateBusinessPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessPermissionRequest>(
          create);
  static UpdateBusinessPermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  BusinessPermission get businessPermission => $_getN(0);
  @$pb.TagNumber(1)
  set businessPermission(BusinessPermission value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessPermission() => $_clearField(1);
  @$pb.TagNumber(1)
  BusinessPermission ensureBusinessPermission() => $_ensure(0);

  @$pb.TagNumber(2)
  ResourceActionType get actionType => $_getN(1);
  @$pb.TagNumber(2)
  set actionType(ResourceActionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasActionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionType() => $_clearField(2);

  /// The unique identifier of the business permission.
  @$pb.TagNumber(3)
  $core.String get businessPermissionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set businessPermissionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBusinessPermissionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBusinessPermissionId() => $_clearField(3);
}

class UpdateBusinessPermissionResponse extends $pb.GeneratedMessage {
  factory UpdateBusinessPermissionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateBusinessPermissionResponse._();

  factory UpdateBusinessPermissionResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateBusinessPermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateBusinessPermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessPermissionResponse clone() =>
      UpdateBusinessPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateBusinessPermissionResponse copyWith(
          void Function(UpdateBusinessPermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateBusinessPermissionResponse))
          as UpdateBusinessPermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPermissionResponse create() =>
      UpdateBusinessPermissionResponse._();
  @$core.override
  UpdateBusinessPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateBusinessPermissionResponse> createRepeated() =>
      $pb.PbList<UpdateBusinessPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateBusinessPermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateBusinessPermissionResponse>(
          create);
  static UpdateBusinessPermissionResponse? _defaultInstance;

  /// Whether the permission group was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class UpdateStorePermissionRequest extends $pb.GeneratedMessage {
  factory UpdateStorePermissionRequest({
    StorePermission? storePermission,
    ResourceActionType? actionType,
    $core.String? storePermissionId,
  }) {
    final result = create();
    if (storePermission != null) result.storePermission = storePermission;
    if (actionType != null) result.actionType = actionType;
    if (storePermissionId != null) result.storePermissionId = storePermissionId;
    return result;
  }

  UpdateStorePermissionRequest._();

  factory UpdateStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<StorePermission>(1, _omitFieldNames ? '' : 'storePermission',
        subBuilder: StorePermission.create)
    ..e<ResourceActionType>(
        2, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED,
        valueOf: ResourceActionType.valueOf,
        enumValues: ResourceActionType.values)
    ..aOS(3, _omitFieldNames ? '' : 'storePermissionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStorePermissionRequest clone() =>
      UpdateStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStorePermissionRequest copyWith(
          void Function(UpdateStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateStorePermissionRequest))
          as UpdateStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStorePermissionRequest create() =>
      UpdateStorePermissionRequest._();
  @$core.override
  UpdateStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStorePermissionRequest> createRepeated() =>
      $pb.PbList<UpdateStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStorePermissionRequest>(create);
  static UpdateStorePermissionRequest? _defaultInstance;

  @$pb.TagNumber(1)
  StorePermission get storePermission => $_getN(0);
  @$pb.TagNumber(1)
  set storePermission(StorePermission value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStorePermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearStorePermission() => $_clearField(1);
  @$pb.TagNumber(1)
  StorePermission ensureStorePermission() => $_ensure(0);

  @$pb.TagNumber(2)
  ResourceActionType get actionType => $_getN(1);
  @$pb.TagNumber(2)
  set actionType(ResourceActionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasActionType() => $_has(1);
  @$pb.TagNumber(2)
  void clearActionType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get storePermissionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storePermissionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStorePermissionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStorePermissionId() => $_clearField(3);
}

class UpdateStorePermissionResponse extends $pb.GeneratedMessage {
  factory UpdateStorePermissionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateStorePermissionResponse._();

  factory UpdateStorePermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStorePermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStorePermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStorePermissionResponse clone() =>
      UpdateStorePermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStorePermissionResponse copyWith(
          void Function(UpdateStorePermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateStorePermissionResponse))
          as UpdateStorePermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStorePermissionResponse create() =>
      UpdateStorePermissionResponse._();
  @$core.override
  UpdateStorePermissionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStorePermissionResponse> createRepeated() =>
      $pb.PbList<UpdateStorePermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStorePermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStorePermissionResponse>(create);
  static UpdateStorePermissionResponse? _defaultInstance;

  /// Whether the permission group was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class DeleteBusinessPermissionRequest extends $pb.GeneratedMessage {
  factory DeleteBusinessPermissionRequest({
    $core.String? businessPermissionId,
  }) {
    final result = create();
    if (businessPermissionId != null)
      result.businessPermissionId = businessPermissionId;
    return result;
  }

  DeleteBusinessPermissionRequest._();

  factory DeleteBusinessPermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBusinessPermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBusinessPermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessPermissionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessPermissionRequest clone() =>
      DeleteBusinessPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessPermissionRequest copyWith(
          void Function(DeleteBusinessPermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteBusinessPermissionRequest))
          as DeleteBusinessPermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessPermissionRequest create() =>
      DeleteBusinessPermissionRequest._();
  @$core.override
  DeleteBusinessPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessPermissionRequest> createRepeated() =>
      $pb.PbList<DeleteBusinessPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessPermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBusinessPermissionRequest>(
          create);
  static DeleteBusinessPermissionRequest? _defaultInstance;

  /// The unique identifier of the permission group to delete.
  @$pb.TagNumber(1)
  $core.String get businessPermissionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessPermissionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessPermissionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessPermissionId() => $_clearField(1);
}

class DeleteBusinessPermissionResponse extends $pb.GeneratedMessage {
  factory DeleteBusinessPermissionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteBusinessPermissionResponse._();

  factory DeleteBusinessPermissionResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteBusinessPermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteBusinessPermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessPermissionResponse clone() =>
      DeleteBusinessPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteBusinessPermissionResponse copyWith(
          void Function(DeleteBusinessPermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteBusinessPermissionResponse))
          as DeleteBusinessPermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteBusinessPermissionResponse create() =>
      DeleteBusinessPermissionResponse._();
  @$core.override
  DeleteBusinessPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteBusinessPermissionResponse> createRepeated() =>
      $pb.PbList<DeleteBusinessPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteBusinessPermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteBusinessPermissionResponse>(
          create);
  static DeleteBusinessPermissionResponse? _defaultInstance;

  /// Whether the permission group was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class DeleteStorePermissionRequest extends $pb.GeneratedMessage {
  factory DeleteStorePermissionRequest({
    $core.String? storePermissionId,
  }) {
    final result = create();
    if (storePermissionId != null) result.storePermissionId = storePermissionId;
    return result;
  }

  DeleteStorePermissionRequest._();

  factory DeleteStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storePermissionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStorePermissionRequest clone() =>
      DeleteStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStorePermissionRequest copyWith(
          void Function(DeleteStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteStorePermissionRequest))
          as DeleteStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStorePermissionRequest create() =>
      DeleteStorePermissionRequest._();
  @$core.override
  DeleteStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteStorePermissionRequest> createRepeated() =>
      $pb.PbList<DeleteStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStorePermissionRequest>(create);
  static DeleteStorePermissionRequest? _defaultInstance;

  /// The unique identifier of the permission group to delete.
  @$pb.TagNumber(1)
  $core.String get storePermissionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storePermissionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStorePermissionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStorePermissionId() => $_clearField(1);
}

class DeleteStorePermissionResponse extends $pb.GeneratedMessage {
  factory DeleteStorePermissionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteStorePermissionResponse._();

  factory DeleteStorePermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteStorePermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteStorePermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStorePermissionResponse clone() =>
      DeleteStorePermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteStorePermissionResponse copyWith(
          void Function(DeleteStorePermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeleteStorePermissionResponse))
          as DeleteStorePermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteStorePermissionResponse create() =>
      DeleteStorePermissionResponse._();
  @$core.override
  DeleteStorePermissionResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteStorePermissionResponse> createRepeated() =>
      $pb.PbList<DeleteStorePermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteStorePermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteStorePermissionResponse>(create);
  static DeleteStorePermissionResponse? _defaultInstance;

  /// Whether the permission group was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetStorePermissionsRequest extends $pb.GeneratedMessage {
  factory GetStorePermissionsRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetStorePermissionsRequest._();

  factory GetStorePermissionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetStorePermissionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetStorePermissionsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStorePermissionsRequest clone() =>
      GetStorePermissionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetStorePermissionsRequest copyWith(
          void Function(GetStorePermissionsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetStorePermissionsRequest))
          as GetStorePermissionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetStorePermissionsRequest create() => GetStorePermissionsRequest._();
  @$core.override
  GetStorePermissionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetStorePermissionsRequest> createRepeated() =>
      $pb.PbList<GetStorePermissionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetStorePermissionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetStorePermissionsRequest>(create);
  static GetStorePermissionsRequest? _defaultInstance;

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

class CheckBusinessPermissionRequest extends $pb.GeneratedMessage {
  factory CheckBusinessPermissionRequest({
    $core.String? userId,
    $core.String? businessId,
    BusinessPermission? permission,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    if (permission != null) result.permission = permission;
    return result;
  }

  CheckBusinessPermissionRequest._();

  factory CheckBusinessPermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckBusinessPermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckBusinessPermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'businessId')
    ..aOM<BusinessPermission>(4, _omitFieldNames ? '' : 'permission',
        subBuilder: BusinessPermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckBusinessPermissionRequest clone() =>
      CheckBusinessPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckBusinessPermissionRequest copyWith(
          void Function(CheckBusinessPermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CheckBusinessPermissionRequest))
          as CheckBusinessPermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckBusinessPermissionRequest create() =>
      CheckBusinessPermissionRequest._();
  @$core.override
  CheckBusinessPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CheckBusinessPermissionRequest> createRepeated() =>
      $pb.PbList<CheckBusinessPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckBusinessPermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckBusinessPermissionRequest>(create);
  static CheckBusinessPermissionRequest? _defaultInstance;

  /// The unique identifier of the member.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the business on which we want to check the permission.
  @$pb.TagNumber(3)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(3)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(3)
  void clearBusinessId() => $_clearField(3);

  /// The permission to check.
  @$pb.TagNumber(4)
  BusinessPermission get permission => $_getN(2);
  @$pb.TagNumber(4)
  set permission(BusinessPermission value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPermission() => $_has(2);
  @$pb.TagNumber(4)
  void clearPermission() => $_clearField(4);
  @$pb.TagNumber(4)
  BusinessPermission ensurePermission() => $_ensure(2);
}

class CheckBusinessPermissionResponse extends $pb.GeneratedMessage {
  factory CheckBusinessPermissionResponse({
    $core.bool? hasPermission,
  }) {
    final result = create();
    if (hasPermission != null) result.hasPermission = hasPermission;
    return result;
  }

  CheckBusinessPermissionResponse._();

  factory CheckBusinessPermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckBusinessPermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckBusinessPermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasPermission')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckBusinessPermissionResponse clone() =>
      CheckBusinessPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckBusinessPermissionResponse copyWith(
          void Function(CheckBusinessPermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CheckBusinessPermissionResponse))
          as CheckBusinessPermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckBusinessPermissionResponse create() =>
      CheckBusinessPermissionResponse._();
  @$core.override
  CheckBusinessPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<CheckBusinessPermissionResponse> createRepeated() =>
      $pb.PbList<CheckBusinessPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckBusinessPermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckBusinessPermissionResponse>(
          create);
  static CheckBusinessPermissionResponse? _defaultInstance;

  /// Whether the member has the permission.
  @$pb.TagNumber(1)
  $core.bool get hasPermission => $_getBF(0);
  @$pb.TagNumber(1)
  set hasPermission($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasPermission() => $_clearField(1);
}

class CheckStorePermissionRequest extends $pb.GeneratedMessage {
  factory CheckStorePermissionRequest({
    $core.String? userId,
    $core.String? storeId,
    StorePermission? permission,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (storeId != null) result.storeId = storeId;
    if (permission != null) result.permission = permission;
    return result;
  }

  CheckStorePermissionRequest._();

  factory CheckStorePermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckStorePermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckStorePermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..aOM<StorePermission>(4, _omitFieldNames ? '' : 'permission',
        subBuilder: StorePermission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionRequest clone() =>
      CheckStorePermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionRequest copyWith(
          void Function(CheckStorePermissionRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CheckStorePermissionRequest))
          as CheckStorePermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionRequest create() =>
      CheckStorePermissionRequest._();
  @$core.override
  CheckStorePermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CheckStorePermissionRequest> createRepeated() =>
      $pb.PbList<CheckStorePermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckStorePermissionRequest>(create);
  static CheckStorePermissionRequest? _defaultInstance;

  /// The unique identifier of the member.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The unique identifier of the store on which we want to check the permission.
  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);

  /// The permission to check.
  @$pb.TagNumber(4)
  StorePermission get permission => $_getN(2);
  @$pb.TagNumber(4)
  set permission(StorePermission value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPermission() => $_has(2);
  @$pb.TagNumber(4)
  void clearPermission() => $_clearField(4);
  @$pb.TagNumber(4)
  StorePermission ensurePermission() => $_ensure(2);
}

class CheckStorePermissionResponse extends $pb.GeneratedMessage {
  factory CheckStorePermissionResponse({
    $core.bool? hasPermission,
  }) {
    final result = create();
    if (hasPermission != null) result.hasPermission = hasPermission;
    return result;
  }

  CheckStorePermissionResponse._();

  factory CheckStorePermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckStorePermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckStorePermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasPermission')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionResponse clone() =>
      CheckStorePermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckStorePermissionResponse copyWith(
          void Function(CheckStorePermissionResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CheckStorePermissionResponse))
          as CheckStorePermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionResponse create() =>
      CheckStorePermissionResponse._();
  @$core.override
  CheckStorePermissionResponse createEmptyInstance() => create();
  static $pb.PbList<CheckStorePermissionResponse> createRepeated() =>
      $pb.PbList<CheckStorePermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckStorePermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckStorePermissionResponse>(create);
  static CheckStorePermissionResponse? _defaultInstance;

  /// Whether the member has the permission.
  @$pb.TagNumber(1)
  $core.bool get hasPermission => $_getBF(0);
  @$pb.TagNumber(1)
  set hasPermission($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasHasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasPermission() => $_clearField(1);
}

class PermissionServiceApi {
  final $pb.RpcClient _client;

  PermissionServiceApi(this._client);

  /// Creates a new business permission.
  $async.Future<CreateBusinessPermissionResponse> createBusinessPermission(
          $pb.ClientContext? ctx, CreateBusinessPermissionRequest request) =>
      _client.invoke<CreateBusinessPermissionResponse>(
          ctx,
          'PermissionService',
          'CreateBusinessPermission',
          request,
          CreateBusinessPermissionResponse());

  /// Updates a business permission.
  $async.Future<UpdateBusinessPermissionResponse> updateBusinessPermission(
          $pb.ClientContext? ctx, UpdateBusinessPermissionRequest request) =>
      _client.invoke<UpdateBusinessPermissionResponse>(
          ctx,
          'PermissionService',
          'UpdateBusinessPermission',
          request,
          UpdateBusinessPermissionResponse());

  /// Deletes a business permission.
  $async.Future<DeleteBusinessPermissionResponse> deleteBusinessPermission(
          $pb.ClientContext? ctx, DeleteBusinessPermissionRequest request) =>
      _client.invoke<DeleteBusinessPermissionResponse>(
          ctx,
          'PermissionService',
          'DeleteBusinessPermission',
          request,
          DeleteBusinessPermissionResponse());

  /// Creates a new store permission.
  $async.Future<CreateStorePermissionResponse> createStorePermission(
          $pb.ClientContext? ctx, CreateStorePermissionRequest request) =>
      _client.invoke<CreateStorePermissionResponse>(ctx, 'PermissionService',
          'CreateStorePermission', request, CreateStorePermissionResponse());

  /// Updates a store permission.
  $async.Future<UpdateStorePermissionResponse> updateStorePermission(
          $pb.ClientContext? ctx, UpdateStorePermissionRequest request) =>
      _client.invoke<UpdateStorePermissionResponse>(ctx, 'PermissionService',
          'UpdateStorePermission', request, UpdateStorePermissionResponse());

  /// Deletes a store permission.
  $async.Future<DeleteStorePermissionResponse> deleteStorePermission(
          $pb.ClientContext? ctx, DeleteStorePermissionRequest request) =>
      _client.invoke<DeleteStorePermissionResponse>(ctx, 'PermissionService',
          'DeleteStorePermission', request, DeleteStorePermissionResponse());

  /// Checks if a member has a business permission.
  $async.Future<CheckBusinessPermissionResponse> checkBusinessPermission(
          $pb.ClientContext? ctx, CheckBusinessPermissionRequest request) =>
      _client.invoke<CheckBusinessPermissionResponse>(
          ctx,
          'PermissionService',
          'CheckBusinessPermission',
          request,
          CheckBusinessPermissionResponse());

  /// Checks if a member has a store permission.
  $async.Future<CheckStorePermissionResponse> checkStorePermission(
          $pb.ClientContext? ctx, CheckStorePermissionRequest request) =>
      _client.invoke<CheckStorePermissionResponse>(ctx, 'PermissionService',
          'CheckStorePermission', request, CheckStorePermissionResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
