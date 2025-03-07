//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'permission.pbenum.dart';

export 'permission.pbenum.dart';

class Permission extends $pb.GeneratedMessage {
  factory Permission({
    ResourceType? resourceType,
    $core.String? resourceId,
    ResourceActionType? actionType,
  }) {
    final $result = create();
    if (resourceType != null) {
      $result.resourceType = resourceType;
    }
    if (resourceId != null) {
      $result.resourceId = resourceId;
    }
    if (actionType != null) {
      $result.actionType = actionType;
    }
    return $result;
  }
  Permission._() : super();
  factory Permission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Permission', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..e<ResourceType>(1, _omitFieldNames ? '' : 'resourceType', $pb.PbFieldType.OE, defaultOrMaker: ResourceType.RESOURCE_TYPE_UNSPECIFIED, valueOf: ResourceType.valueOf, enumValues: ResourceType.values)
    ..aOS(2, _omitFieldNames ? '' : 'resourceId')
    ..e<ResourceActionType>(3, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE, defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED, valueOf: ResourceActionType.valueOf, enumValues: ResourceActionType.values)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Permission clone() => Permission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Permission copyWith(void Function(Permission) updates) => super.copyWith((message) => updates(message as Permission)) as Permission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission? _defaultInstance;

  @$pb.TagNumber(1)
  ResourceType get resourceType => $_getN(0);
  @$pb.TagNumber(1)
  set resourceType(ResourceType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasResourceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceType() => clearField(1);

  /// The resource_id is only specified when we want to restrict action on a specific resource.
  @$pb.TagNumber(2)
  $core.String get resourceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasResourceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceId() => clearField(2);

  /// The action that the user can perform on the resource.
  @$pb.TagNumber(3)
  ResourceActionType get actionType => $_getN(2);
  @$pb.TagNumber(3)
  set actionType(ResourceActionType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasActionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearActionType() => clearField(3);
}

class PermissionsGroup extends $pb.GeneratedMessage {
  factory PermissionsGroup({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    $core.Iterable<Permission>? permissions,
    $core.String? businessId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (name != null) {
      $result.name = name;
    }
    if (description != null) {
      $result.description = description;
    }
    if (permissions != null) {
      $result.permissions.addAll(permissions);
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  PermissionsGroup._() : super();
  factory PermissionsGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionsGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PermissionsGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pc<Permission>(4, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM, subBuilder: Permission.create)
    ..aOS(6, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionsGroup clone() => PermissionsGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionsGroup copyWith(void Function(PermissionsGroup) updates) => super.copyWith((message) => updates(message as PermissionsGroup)) as PermissionsGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermissionsGroup create() => PermissionsGroup._();
  PermissionsGroup createEmptyInstance() => create();
  static $pb.PbList<PermissionsGroup> createRepeated() => $pb.PbList<PermissionsGroup>();
  @$core.pragma('dart2js:noInline')
  static PermissionsGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionsGroup>(create);
  static PermissionsGroup? _defaultInstance;

  /// The reference id to the permission group identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The name of the permission group. Generally the role of the group.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  /// The description of the permission group.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => clearField(3);

  /// The permissions that the permission group has.
  @$pb.TagNumber(4)
  $core.List<Permission> get permissions => $_getList(3);

  /// The unique identifier of the business.
  /// must be set if the permission group is create by a business.
  @$pb.TagNumber(6)
  $core.String get businessId => $_getSZ(4);
  @$pb.TagNumber(6)
  set businessId($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(6)
  $core.bool hasBusinessId() => $_has(4);
  @$pb.TagNumber(6)
  void clearBusinessId() => clearField(6);
}

class CreatePermissionsGroupRequest extends $pb.GeneratedMessage {
  factory CreatePermissionsGroupRequest({
    PermissionsGroup? permissionsGroup,
    $core.String? businessId,
  }) {
    final $result = create();
    if (permissionsGroup != null) {
      $result.permissionsGroup = permissionsGroup;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  CreatePermissionsGroupRequest._() : super();
  factory CreatePermissionsGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePermissionsGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePermissionsGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOM<PermissionsGroup>(1, _omitFieldNames ? '' : 'permissionsGroup', subBuilder: PermissionsGroup.create)
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePermissionsGroupRequest clone() => CreatePermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePermissionsGroupRequest copyWith(void Function(CreatePermissionsGroupRequest) updates) => super.copyWith((message) => updates(message as CreatePermissionsGroupRequest)) as CreatePermissionsGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupRequest create() => CreatePermissionsGroupRequest._();
  CreatePermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePermissionsGroupRequest> createRepeated() => $pb.PbList<CreatePermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePermissionsGroupRequest>(create);
  static CreatePermissionsGroupRequest? _defaultInstance;

  /// The permission group information to create.
  /// Note:Only the fields that are set will be created.
  @$pb.TagNumber(1)
  PermissionsGroup get permissionsGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionsGroup(PermissionsGroup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermissionsGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionsGroup() => clearField(1);
  @$pb.TagNumber(1)
  PermissionsGroup ensurePermissionsGroup() => $_ensure(0);

  /// The unique identifier of the business on which the permission group is created.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => clearField(2);
}

class CreatePermissionsGroupResponse extends $pb.GeneratedMessage {
  factory CreatePermissionsGroupResponse({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  CreatePermissionsGroupResponse._() : super();
  factory CreatePermissionsGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePermissionsGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePermissionsGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePermissionsGroupResponse clone() => CreatePermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePermissionsGroupResponse copyWith(void Function(CreatePermissionsGroupResponse) updates) => super.copyWith((message) => updates(message as CreatePermissionsGroupResponse)) as CreatePermissionsGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupResponse create() => CreatePermissionsGroupResponse._();
  CreatePermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePermissionsGroupResponse> createRepeated() => $pb.PbList<CreatePermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePermissionsGroupResponse>(create);
  static CreatePermissionsGroupResponse? _defaultInstance;

  /// The unique identifier of the created permission group.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class GetPermissionsGroupRequest extends $pb.GeneratedMessage {
  factory GetPermissionsGroupRequest({
    $core.String? refId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    return $result;
  }
  GetPermissionsGroupRequest._() : super();
  factory GetPermissionsGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPermissionsGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPermissionsGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPermissionsGroupRequest clone() => GetPermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPermissionsGroupRequest copyWith(void Function(GetPermissionsGroupRequest) updates) => super.copyWith((message) => updates(message as GetPermissionsGroupRequest)) as GetPermissionsGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupRequest create() => GetPermissionsGroupRequest._();
  GetPermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<GetPermissionsGroupRequest> createRepeated() => $pb.PbList<GetPermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPermissionsGroupRequest>(create);
  static GetPermissionsGroupRequest? _defaultInstance;

  /// The unique identifier of the permission group to retrieve.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);
}

class GetPermissionsGroupResponse extends $pb.GeneratedMessage {
  factory GetPermissionsGroupResponse({
    PermissionsGroup? permissionsGroup,
  }) {
    final $result = create();
    if (permissionsGroup != null) {
      $result.permissionsGroup = permissionsGroup;
    }
    return $result;
  }
  GetPermissionsGroupResponse._() : super();
  factory GetPermissionsGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPermissionsGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPermissionsGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOM<PermissionsGroup>(1, _omitFieldNames ? '' : 'permissionsGroup', subBuilder: PermissionsGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPermissionsGroupResponse clone() => GetPermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPermissionsGroupResponse copyWith(void Function(GetPermissionsGroupResponse) updates) => super.copyWith((message) => updates(message as GetPermissionsGroupResponse)) as GetPermissionsGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupResponse create() => GetPermissionsGroupResponse._();
  GetPermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<GetPermissionsGroupResponse> createRepeated() => $pb.PbList<GetPermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPermissionsGroupResponse>(create);
  static GetPermissionsGroupResponse? _defaultInstance;

  /// The retrieved permission group data.
  @$pb.TagNumber(1)
  PermissionsGroup get permissionsGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionsGroup(PermissionsGroup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermissionsGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionsGroup() => clearField(1);
  @$pb.TagNumber(1)
  PermissionsGroup ensurePermissionsGroup() => $_ensure(0);
}

class UpdatePermissionsGroupRequest extends $pb.GeneratedMessage {
  factory UpdatePermissionsGroupRequest({
    PermissionsGroup? permissionsGroup,
  }) {
    final $result = create();
    if (permissionsGroup != null) {
      $result.permissionsGroup = permissionsGroup;
    }
    return $result;
  }
  UpdatePermissionsGroupRequest._() : super();
  factory UpdatePermissionsGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePermissionsGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePermissionsGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOM<PermissionsGroup>(1, _omitFieldNames ? '' : 'permissionsGroup', subBuilder: PermissionsGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePermissionsGroupRequest clone() => UpdatePermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePermissionsGroupRequest copyWith(void Function(UpdatePermissionsGroupRequest) updates) => super.copyWith((message) => updates(message as UpdatePermissionsGroupRequest)) as UpdatePermissionsGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupRequest create() => UpdatePermissionsGroupRequest._();
  UpdatePermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePermissionsGroupRequest> createRepeated() => $pb.PbList<UpdatePermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePermissionsGroupRequest>(create);
  static UpdatePermissionsGroupRequest? _defaultInstance;

  /// The permission group information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  PermissionsGroup get permissionsGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionsGroup(PermissionsGroup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermissionsGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionsGroup() => clearField(1);
  @$pb.TagNumber(1)
  PermissionsGroup ensurePermissionsGroup() => $_ensure(0);
}

class UpdatePermissionsGroupResponse extends $pb.GeneratedMessage {
  factory UpdatePermissionsGroupResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdatePermissionsGroupResponse._() : super();
  factory UpdatePermissionsGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePermissionsGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePermissionsGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePermissionsGroupResponse clone() => UpdatePermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePermissionsGroupResponse copyWith(void Function(UpdatePermissionsGroupResponse) updates) => super.copyWith((message) => updates(message as UpdatePermissionsGroupResponse)) as UpdatePermissionsGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupResponse create() => UpdatePermissionsGroupResponse._();
  UpdatePermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePermissionsGroupResponse> createRepeated() => $pb.PbList<UpdatePermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePermissionsGroupResponse>(create);
  static UpdatePermissionsGroupResponse? _defaultInstance;

  /// Whether the permission group was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class DeletePermissionsGroupRequest extends $pb.GeneratedMessage {
  factory DeletePermissionsGroupRequest({
    $core.String? refId,
    $core.String? businessId,
  }) {
    final $result = create();
    if (refId != null) {
      $result.refId = refId;
    }
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  DeletePermissionsGroupRequest._() : super();
  factory DeletePermissionsGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePermissionsGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePermissionsGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePermissionsGroupRequest clone() => DeletePermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePermissionsGroupRequest copyWith(void Function(DeletePermissionsGroupRequest) updates) => super.copyWith((message) => updates(message as DeletePermissionsGroupRequest)) as DeletePermissionsGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupRequest create() => DeletePermissionsGroupRequest._();
  DeletePermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePermissionsGroupRequest> createRepeated() => $pb.PbList<DeletePermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePermissionsGroupRequest>(create);
  static DeletePermissionsGroupRequest? _defaultInstance;

  /// The unique identifier of the permission group to delete.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => clearField(2);
}

class DeletePermissionsGroupResponse extends $pb.GeneratedMessage {
  factory DeletePermissionsGroupResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeletePermissionsGroupResponse._() : super();
  factory DeletePermissionsGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePermissionsGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePermissionsGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePermissionsGroupResponse clone() => DeletePermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePermissionsGroupResponse copyWith(void Function(DeletePermissionsGroupResponse) updates) => super.copyWith((message) => updates(message as DeletePermissionsGroupResponse)) as DeletePermissionsGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupResponse create() => DeletePermissionsGroupResponse._();
  DeletePermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePermissionsGroupResponse> createRepeated() => $pb.PbList<DeletePermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePermissionsGroupResponse>(create);
  static DeletePermissionsGroupResponse? _defaultInstance;

  /// Whether the permission group was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class RemoveUserPermissionRequest extends $pb.GeneratedMessage {
  factory RemoveUserPermissionRequest({
    $core.String? userId,
    $core.String? permissionsGroupId,
    $core.String? resourceId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (permissionsGroupId != null) {
      $result.permissionsGroupId = permissionsGroupId;
    }
    if (resourceId != null) {
      $result.resourceId = resourceId;
    }
    return $result;
  }
  RemoveUserPermissionRequest._() : super();
  factory RemoveUserPermissionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserPermissionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserPermissionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'permissionsGroupId')
    ..aOS(3, _omitFieldNames ? '' : 'resourceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserPermissionRequest clone() => RemoveUserPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserPermissionRequest copyWith(void Function(RemoveUserPermissionRequest) updates) => super.copyWith((message) => updates(message as RemoveUserPermissionRequest)) as RemoveUserPermissionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserPermissionRequest create() => RemoveUserPermissionRequest._();
  RemoveUserPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<RemoveUserPermissionRequest> createRepeated() => $pb.PbList<RemoveUserPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserPermissionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserPermissionRequest>(create);
  static RemoveUserPermissionRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// The unique identifier of the permission group.
  @$pb.TagNumber(2)
  $core.String get permissionsGroupId => $_getSZ(1);
  @$pb.TagNumber(2)
  set permissionsGroupId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionsGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionsGroupId() => clearField(2);

  /// The unique identifier of the resource.
  @$pb.TagNumber(3)
  $core.String get resourceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceId() => clearField(3);
}

class RemoveUserPermissionResponse extends $pb.GeneratedMessage {
  factory RemoveUserPermissionResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  RemoveUserPermissionResponse._() : super();
  factory RemoveUserPermissionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserPermissionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserPermissionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  RemoveUserPermissionResponse clone() => RemoveUserPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  RemoveUserPermissionResponse copyWith(void Function(RemoveUserPermissionResponse) updates) => super.copyWith((message) => updates(message as RemoveUserPermissionResponse)) as RemoveUserPermissionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RemoveUserPermissionResponse create() => RemoveUserPermissionResponse._();
  RemoveUserPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<RemoveUserPermissionResponse> createRepeated() => $pb.PbList<RemoveUserPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static RemoveUserPermissionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<RemoveUserPermissionResponse>(create);
  static RemoveUserPermissionResponse? _defaultInstance;

  /// Whether the user was successfully removed from the permission group.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class AddUserPermissionRequest extends $pb.GeneratedMessage {
  factory AddUserPermissionRequest({
    $core.String? userId,
    $core.String? permissionsGroupId,
    $core.String? resourceId,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (permissionsGroupId != null) {
      $result.permissionsGroupId = permissionsGroupId;
    }
    if (resourceId != null) {
      $result.resourceId = resourceId;
    }
    return $result;
  }
  AddUserPermissionRequest._() : super();
  factory AddUserPermissionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserPermissionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserPermissionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'permissionsGroupId')
    ..aOS(3, _omitFieldNames ? '' : 'resourceId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserPermissionRequest clone() => AddUserPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserPermissionRequest copyWith(void Function(AddUserPermissionRequest) updates) => super.copyWith((message) => updates(message as AddUserPermissionRequest)) as AddUserPermissionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserPermissionRequest create() => AddUserPermissionRequest._();
  AddUserPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<AddUserPermissionRequest> createRepeated() => $pb.PbList<AddUserPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static AddUserPermissionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserPermissionRequest>(create);
  static AddUserPermissionRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// The unique identifier of the permission group.
  @$pb.TagNumber(2)
  $core.String get permissionsGroupId => $_getSZ(1);
  @$pb.TagNumber(2)
  set permissionsGroupId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionsGroupId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionsGroupId() => clearField(2);

  /// The unique identifier of the resource.
  @$pb.TagNumber(3)
  $core.String get resourceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceId($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceId() => clearField(3);
}

class AddUserPermissionResponse extends $pb.GeneratedMessage {
  factory AddUserPermissionResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  AddUserPermissionResponse._() : super();
  factory AddUserPermissionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserPermissionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserPermissionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  AddUserPermissionResponse clone() => AddUserPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  AddUserPermissionResponse copyWith(void Function(AddUserPermissionResponse) updates) => super.copyWith((message) => updates(message as AddUserPermissionResponse)) as AddUserPermissionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddUserPermissionResponse create() => AddUserPermissionResponse._();
  AddUserPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<AddUserPermissionResponse> createRepeated() => $pb.PbList<AddUserPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static AddUserPermissionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<AddUserPermissionResponse>(create);
  static AddUserPermissionResponse? _defaultInstance;

  /// Whether the user was successfully added to the permission group.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);
}

class GetBusinessPermissionsGroupsRequest extends $pb.GeneratedMessage {
  factory GetBusinessPermissionsGroupsRequest({
    $core.String? businessId,
  }) {
    final $result = create();
    if (businessId != null) {
      $result.businessId = businessId;
    }
    return $result;
  }
  GetBusinessPermissionsGroupsRequest._() : super();
  factory GetBusinessPermissionsGroupsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessPermissionsGroupsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessPermissionsGroupsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionsGroupsRequest clone() => GetBusinessPermissionsGroupsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionsGroupsRequest copyWith(void Function(GetBusinessPermissionsGroupsRequest) updates) => super.copyWith((message) => updates(message as GetBusinessPermissionsGroupsRequest)) as GetBusinessPermissionsGroupsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsRequest create() => GetBusinessPermissionsGroupsRequest._();
  GetBusinessPermissionsGroupsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessPermissionsGroupsRequest> createRepeated() => $pb.PbList<GetBusinessPermissionsGroupsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessPermissionsGroupsRequest>(create);
  static GetBusinessPermissionsGroupsRequest? _defaultInstance;

  /// The unique identifier of the business to retrieve.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => clearField(1);
}

class GetBusinessPermissionsGroupsResponse extends $pb.GeneratedMessage {
  factory GetBusinessPermissionsGroupsResponse({
    $core.Iterable<PermissionsGroup>? permissionsGroups,
  }) {
    final $result = create();
    if (permissionsGroups != null) {
      $result.permissionsGroups.addAll(permissionsGroups);
    }
    return $result;
  }
  GetBusinessPermissionsGroupsResponse._() : super();
  factory GetBusinessPermissionsGroupsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessPermissionsGroupsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessPermissionsGroupsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..pc<PermissionsGroup>(1, _omitFieldNames ? '' : 'permissionsGroups', $pb.PbFieldType.PM, subBuilder: PermissionsGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionsGroupsResponse clone() => GetBusinessPermissionsGroupsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionsGroupsResponse copyWith(void Function(GetBusinessPermissionsGroupsResponse) updates) => super.copyWith((message) => updates(message as GetBusinessPermissionsGroupsResponse)) as GetBusinessPermissionsGroupsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsResponse create() => GetBusinessPermissionsGroupsResponse._();
  GetBusinessPermissionsGroupsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessPermissionsGroupsResponse> createRepeated() => $pb.PbList<GetBusinessPermissionsGroupsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessPermissionsGroupsResponse>(create);
  static GetBusinessPermissionsGroupsResponse? _defaultInstance;

  /// The permission groups that the business has.
  @$pb.TagNumber(1)
  $core.List<PermissionsGroup> get permissionsGroups => $_getList(0);
}

class CheckPermissionRequest extends $pb.GeneratedMessage {
  factory CheckPermissionRequest({
    $core.String? userId,
    $core.String? resourceId,
    Permission? permission,
  }) {
    final $result = create();
    if (userId != null) {
      $result.userId = userId;
    }
    if (resourceId != null) {
      $result.resourceId = resourceId;
    }
    if (permission != null) {
      $result.permission = permission;
    }
    return $result;
  }
  CheckPermissionRequest._() : super();
  factory CheckPermissionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckPermissionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckPermissionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'resourceId')
    ..aOM<Permission>(4, _omitFieldNames ? '' : 'permission', subBuilder: Permission.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckPermissionRequest clone() => CheckPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckPermissionRequest copyWith(void Function(CheckPermissionRequest) updates) => super.copyWith((message) => updates(message as CheckPermissionRequest)) as CheckPermissionRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest create() => CheckPermissionRequest._();
  CheckPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CheckPermissionRequest> createRepeated() => $pb.PbList<CheckPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckPermissionRequest>(create);
  static CheckPermissionRequest? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => clearField(1);

  /// The unique identifier of the resource.
  @$pb.TagNumber(3)
  $core.String get resourceId => $_getSZ(1);
  @$pb.TagNumber(3)
  set resourceId($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceId() => $_has(1);
  @$pb.TagNumber(3)
  void clearResourceId() => clearField(3);

  /// The permission to check.
  @$pb.TagNumber(4)
  Permission get permission => $_getN(2);
  @$pb.TagNumber(4)
  set permission(Permission v) { setField(4, v); }
  @$pb.TagNumber(4)
  $core.bool hasPermission() => $_has(2);
  @$pb.TagNumber(4)
  void clearPermission() => clearField(4);
  @$pb.TagNumber(4)
  Permission ensurePermission() => $_ensure(2);
}

class CheckPermissionResponse extends $pb.GeneratedMessage {
  factory CheckPermissionResponse({
    $core.bool? hasPermission,
  }) {
    final $result = create();
    if (hasPermission != null) {
      $result.hasPermission = hasPermission;
    }
    return $result;
  }
  CheckPermissionResponse._() : super();
  factory CheckPermissionResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CheckPermissionResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CheckPermissionResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasPermission')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CheckPermissionResponse clone() => CheckPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CheckPermissionResponse copyWith(void Function(CheckPermissionResponse) updates) => super.copyWith((message) => updates(message as CheckPermissionResponse)) as CheckPermissionResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse create() => CheckPermissionResponse._();
  CheckPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<CheckPermissionResponse> createRepeated() => $pb.PbList<CheckPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CheckPermissionResponse>(create);
  static CheckPermissionResponse? _defaultInstance;

  /// Whether the user has the permission.
  @$pb.TagNumber(1)
  $core.bool get hasPermission => $_getBF(0);
  @$pb.TagNumber(1)
  set hasPermission($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasHasPermission() => $_has(0);
  @$pb.TagNumber(1)
  void clearHasPermission() => clearField(1);
}

class PermissionServiceApi {
  $pb.RpcClient _client;
  PermissionServiceApi(this._client);

  $async.Future<CreatePermissionsGroupResponse> createPermissionsGroup($pb.ClientContext? ctx, CreatePermissionsGroupRequest request) =>
    _client.invoke<CreatePermissionsGroupResponse>(ctx, 'PermissionService', 'CreatePermissionsGroup', request, CreatePermissionsGroupResponse())
  ;
  $async.Future<GetPermissionsGroupResponse> getPermissionsGroup($pb.ClientContext? ctx, GetPermissionsGroupRequest request) =>
    _client.invoke<GetPermissionsGroupResponse>(ctx, 'PermissionService', 'GetPermissionsGroup', request, GetPermissionsGroupResponse())
  ;
  $async.Future<UpdatePermissionsGroupResponse> updatePermissionsGroup($pb.ClientContext? ctx, UpdatePermissionsGroupRequest request) =>
    _client.invoke<UpdatePermissionsGroupResponse>(ctx, 'PermissionService', 'UpdatePermissionsGroup', request, UpdatePermissionsGroupResponse())
  ;
  $async.Future<DeletePermissionsGroupResponse> deletePermissionsGroup($pb.ClientContext? ctx, DeletePermissionsGroupRequest request) =>
    _client.invoke<DeletePermissionsGroupResponse>(ctx, 'PermissionService', 'DeletePermissionsGroup', request, DeletePermissionsGroupResponse())
  ;
  $async.Future<RemoveUserPermissionResponse> removeUserPermission($pb.ClientContext? ctx, RemoveUserPermissionRequest request) =>
    _client.invoke<RemoveUserPermissionResponse>(ctx, 'PermissionService', 'RemoveUserPermission', request, RemoveUserPermissionResponse())
  ;
  $async.Future<AddUserPermissionResponse> addUserPermission($pb.ClientContext? ctx, AddUserPermissionRequest request) =>
    _client.invoke<AddUserPermissionResponse>(ctx, 'PermissionService', 'AddUserPermission', request, AddUserPermissionResponse())
  ;
  $async.Future<GetBusinessPermissionsGroupsResponse> getBusinessPermissionsGroups($pb.ClientContext? ctx, GetBusinessPermissionsGroupsRequest request) =>
    _client.invoke<GetBusinessPermissionsGroupsResponse>(ctx, 'PermissionService', 'GetBusinessPermissionsGroups', request, GetBusinessPermissionsGroupsResponse())
  ;
  $async.Future<CheckPermissionResponse> checkPermission($pb.ClientContext? ctx, CheckPermissionRequest request) =>
    _client.invoke<CheckPermissionResponse>(ctx, 'PermissionService', 'CheckPermission', request, CheckPermissionResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
