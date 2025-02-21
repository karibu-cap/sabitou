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
    PermissionActionType? action,
    PermissionEntityType? entity,
    PermissionResourceType? resourceType,
  }) {
    final $result = create();
    if (action != null) {
      $result.action = action;
    }
    if (entity != null) {
      $result.entity = entity;
    }
    if (resourceType != null) {
      $result.resourceType = resourceType;
    }
    return $result;
  }
  Permission._() : super();
  factory Permission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Permission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'Permission', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..e<PermissionActionType>(1, _omitFieldNames ? '' : 'action', $pb.PbFieldType.OE, defaultOrMaker: PermissionActionType.PERMISSION_ACTION_TYPE_UNSPECIFIED, valueOf: PermissionActionType.valueOf, enumValues: PermissionActionType.values)
    ..e<PermissionEntityType>(2, _omitFieldNames ? '' : 'entity', $pb.PbFieldType.OE, defaultOrMaker: PermissionEntityType.PERMISSION_ENTITY_TYPE_UNSPECIFIED, valueOf: PermissionEntityType.valueOf, enumValues: PermissionEntityType.values)
    ..e<PermissionResourceType>(3, _omitFieldNames ? '' : 'resourceType', $pb.PbFieldType.OE, defaultOrMaker: PermissionResourceType.PERMISSION_RESOURCE_TYPE_UNSPECIFIED, valueOf: PermissionResourceType.valueOf, enumValues: PermissionResourceType.values)
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

  /// The action that the user can perform on the resource.
  @$pb.TagNumber(1)
  PermissionActionType get action => $_getN(0);
  @$pb.TagNumber(1)
  set action(PermissionActionType v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasAction() => $_has(0);
  @$pb.TagNumber(1)
  void clearAction() => clearField(1);

  /// The entity on which the action is performed.
  @$pb.TagNumber(2)
  PermissionEntityType get entity => $_getN(1);
  @$pb.TagNumber(2)
  set entity(PermissionEntityType v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasEntity() => $_has(1);
  @$pb.TagNumber(2)
  void clearEntity() => clearField(2);

  /// The type of resource that the user can perform the action on.
  @$pb.TagNumber(3)
  PermissionResourceType get resourceType => $_getN(2);
  @$pb.TagNumber(3)
  set resourceType(PermissionResourceType v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceType() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceType() => clearField(3);
}

class UserPermission extends $pb.GeneratedMessage {
  factory UserPermission({
    $core.String? userUid,
    $core.Iterable<Permission>? permissions,
    $core.String? permissionGroupUid,
    $core.String? resourceUid,
  }) {
    final $result = create();
    if (userUid != null) {
      $result.userUid = userUid;
    }
    if (permissions != null) {
      $result.permissions.addAll(permissions);
    }
    if (permissionGroupUid != null) {
      $result.permissionGroupUid = permissionGroupUid;
    }
    if (resourceUid != null) {
      $result.resourceUid = resourceUid;
    }
    return $result;
  }
  UserPermission._() : super();
  factory UserPermission.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UserPermission.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UserPermission', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userUid')
    ..pc<Permission>(2, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM, subBuilder: Permission.create)
    ..aOS(3, _omitFieldNames ? '' : 'permissionGroupUid')
    ..aOS(4, _omitFieldNames ? '' : 'resourceUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UserPermission clone() => UserPermission()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UserPermission copyWith(void Function(UserPermission) updates) => super.copyWith((message) => updates(message as UserPermission)) as UserPermission;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UserPermission create() => UserPermission._();
  UserPermission createEmptyInstance() => create();
  static $pb.PbList<UserPermission> createRepeated() => $pb.PbList<UserPermission>();
  @$core.pragma('dart2js:noInline')
  static UserPermission getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UserPermission>(create);
  static UserPermission? _defaultInstance;

  /// The unique identifier of the user.
  @$pb.TagNumber(1)
  $core.String get userUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserUid() => clearField(1);

  /// The permissions that the user has.
  @$pb.TagNumber(2)
  $core.List<Permission> get permissions => $_getList(1);

  /// The unique identifier of the permission group.
  @$pb.TagNumber(3)
  $core.String get permissionGroupUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set permissionGroupUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasPermissionGroupUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearPermissionGroupUid() => clearField(3);

  /// The unique identifier of the resource.
  @$pb.TagNumber(4)
  $core.String get resourceUid => $_getSZ(3);
  @$pb.TagNumber(4)
  set resourceUid($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasResourceUid() => $_has(3);
  @$pb.TagNumber(4)
  void clearResourceUid() => clearField(4);
}

class PermissionGroup extends $pb.GeneratedMessage {
  factory PermissionGroup({
    $core.String? uid,
    $core.String? name,
    $core.String? description,
    $core.Iterable<Permission>? permissions,
    $core.String? businessUid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
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
    if (businessUid != null) {
      $result.businessUid = businessUid;
    }
    return $result;
  }
  PermissionGroup._() : super();
  factory PermissionGroup.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PermissionGroup.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'PermissionGroup', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pc<Permission>(4, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM, subBuilder: Permission.create)
    ..aOS(5, _omitFieldNames ? '' : 'businessUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PermissionGroup clone() => PermissionGroup()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PermissionGroup copyWith(void Function(PermissionGroup) updates) => super.copyWith((message) => updates(message as PermissionGroup)) as PermissionGroup;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermissionGroup create() => PermissionGroup._();
  PermissionGroup createEmptyInstance() => create();
  static $pb.PbList<PermissionGroup> createRepeated() => $pb.PbList<PermissionGroup>();
  @$core.pragma('dart2js:noInline')
  static PermissionGroup getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PermissionGroup>(create);
  static PermissionGroup? _defaultInstance;

  /// The unique identifier of the permission group.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

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
  /// must be set if the permission group is for a business.
  @$pb.TagNumber(5)
  $core.String get businessUid => $_getSZ(4);
  @$pb.TagNumber(5)
  set businessUid($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasBusinessUid() => $_has(4);
  @$pb.TagNumber(5)
  void clearBusinessUid() => clearField(5);
}

class CreatePermissionGroupRequest extends $pb.GeneratedMessage {
  factory CreatePermissionGroupRequest({
    PermissionGroup? permissionGroup,
  }) {
    final $result = create();
    if (permissionGroup != null) {
      $result.permissionGroup = permissionGroup;
    }
    return $result;
  }
  CreatePermissionGroupRequest._() : super();
  factory CreatePermissionGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePermissionGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePermissionGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOM<PermissionGroup>(1, _omitFieldNames ? '' : 'permissionGroup', subBuilder: PermissionGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePermissionGroupRequest clone() => CreatePermissionGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePermissionGroupRequest copyWith(void Function(CreatePermissionGroupRequest) updates) => super.copyWith((message) => updates(message as CreatePermissionGroupRequest)) as CreatePermissionGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePermissionGroupRequest create() => CreatePermissionGroupRequest._();
  CreatePermissionGroupRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePermissionGroupRequest> createRepeated() => $pb.PbList<CreatePermissionGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePermissionGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePermissionGroupRequest>(create);
  static CreatePermissionGroupRequest? _defaultInstance;

  /// The permission group information to create.
  /// Note:Only the fields that are set will be created.
  @$pb.TagNumber(1)
  PermissionGroup get permissionGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionGroup(PermissionGroup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermissionGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionGroup() => clearField(1);
  @$pb.TagNumber(1)
  PermissionGroup ensurePermissionGroup() => $_ensure(0);
}

class CreatePermissionGroupResponse extends $pb.GeneratedMessage {
  factory CreatePermissionGroupResponse({
    $core.String? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  CreatePermissionGroupResponse._() : super();
  factory CreatePermissionGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory CreatePermissionGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'CreatePermissionGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  CreatePermissionGroupResponse clone() => CreatePermissionGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  CreatePermissionGroupResponse copyWith(void Function(CreatePermissionGroupResponse) updates) => super.copyWith((message) => updates(message as CreatePermissionGroupResponse)) as CreatePermissionGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePermissionGroupResponse create() => CreatePermissionGroupResponse._();
  CreatePermissionGroupResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePermissionGroupResponse> createRepeated() => $pb.PbList<CreatePermissionGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePermissionGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<CreatePermissionGroupResponse>(create);
  static CreatePermissionGroupResponse? _defaultInstance;

  /// The unique identifier of the created permission group.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class GetPermissionGroupRequest extends $pb.GeneratedMessage {
  factory GetPermissionGroupRequest({
    $core.String? uid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    return $result;
  }
  GetPermissionGroupRequest._() : super();
  factory GetPermissionGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPermissionGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPermissionGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPermissionGroupRequest clone() => GetPermissionGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPermissionGroupRequest copyWith(void Function(GetPermissionGroupRequest) updates) => super.copyWith((message) => updates(message as GetPermissionGroupRequest)) as GetPermissionGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPermissionGroupRequest create() => GetPermissionGroupRequest._();
  GetPermissionGroupRequest createEmptyInstance() => create();
  static $pb.PbList<GetPermissionGroupRequest> createRepeated() => $pb.PbList<GetPermissionGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPermissionGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPermissionGroupRequest>(create);
  static GetPermissionGroupRequest? _defaultInstance;

  /// The unique identifier of the permission group to retrieve.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);
}

class GetPermissionGroupResponse extends $pb.GeneratedMessage {
  factory GetPermissionGroupResponse({
    PermissionGroup? permissionGroup,
  }) {
    final $result = create();
    if (permissionGroup != null) {
      $result.permissionGroup = permissionGroup;
    }
    return $result;
  }
  GetPermissionGroupResponse._() : super();
  factory GetPermissionGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetPermissionGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetPermissionGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOM<PermissionGroup>(1, _omitFieldNames ? '' : 'permissionGroup', subBuilder: PermissionGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetPermissionGroupResponse clone() => GetPermissionGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetPermissionGroupResponse copyWith(void Function(GetPermissionGroupResponse) updates) => super.copyWith((message) => updates(message as GetPermissionGroupResponse)) as GetPermissionGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPermissionGroupResponse create() => GetPermissionGroupResponse._();
  GetPermissionGroupResponse createEmptyInstance() => create();
  static $pb.PbList<GetPermissionGroupResponse> createRepeated() => $pb.PbList<GetPermissionGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPermissionGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetPermissionGroupResponse>(create);
  static GetPermissionGroupResponse? _defaultInstance;

  /// The retrieved permission group data.
  @$pb.TagNumber(1)
  PermissionGroup get permissionGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionGroup(PermissionGroup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermissionGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionGroup() => clearField(1);
  @$pb.TagNumber(1)
  PermissionGroup ensurePermissionGroup() => $_ensure(0);
}

class UpdatePermissionGroupRequest extends $pb.GeneratedMessage {
  factory UpdatePermissionGroupRequest({
    PermissionGroup? permissionGroup,
  }) {
    final $result = create();
    if (permissionGroup != null) {
      $result.permissionGroup = permissionGroup;
    }
    return $result;
  }
  UpdatePermissionGroupRequest._() : super();
  factory UpdatePermissionGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePermissionGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePermissionGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOM<PermissionGroup>(1, _omitFieldNames ? '' : 'permissionGroup', subBuilder: PermissionGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePermissionGroupRequest clone() => UpdatePermissionGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePermissionGroupRequest copyWith(void Function(UpdatePermissionGroupRequest) updates) => super.copyWith((message) => updates(message as UpdatePermissionGroupRequest)) as UpdatePermissionGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePermissionGroupRequest create() => UpdatePermissionGroupRequest._();
  UpdatePermissionGroupRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePermissionGroupRequest> createRepeated() => $pb.PbList<UpdatePermissionGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePermissionGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePermissionGroupRequest>(create);
  static UpdatePermissionGroupRequest? _defaultInstance;

  /// The permission group information to update.
  /// Note:Only the fields that are set will be updated.
  @$pb.TagNumber(1)
  PermissionGroup get permissionGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionGroup(PermissionGroup v) { setField(1, v); }
  @$pb.TagNumber(1)
  $core.bool hasPermissionGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionGroup() => clearField(1);
  @$pb.TagNumber(1)
  PermissionGroup ensurePermissionGroup() => $_ensure(0);
}

class UpdatePermissionGroupResponse extends $pb.GeneratedMessage {
  factory UpdatePermissionGroupResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  UpdatePermissionGroupResponse._() : super();
  factory UpdatePermissionGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory UpdatePermissionGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'UpdatePermissionGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  UpdatePermissionGroupResponse clone() => UpdatePermissionGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  UpdatePermissionGroupResponse copyWith(void Function(UpdatePermissionGroupResponse) updates) => super.copyWith((message) => updates(message as UpdatePermissionGroupResponse)) as UpdatePermissionGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePermissionGroupResponse create() => UpdatePermissionGroupResponse._();
  UpdatePermissionGroupResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePermissionGroupResponse> createRepeated() => $pb.PbList<UpdatePermissionGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePermissionGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<UpdatePermissionGroupResponse>(create);
  static UpdatePermissionGroupResponse? _defaultInstance;

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

class DeletePermissionGroupRequest extends $pb.GeneratedMessage {
  factory DeletePermissionGroupRequest({
    $core.String? uid,
    $core.String? businessUid,
  }) {
    final $result = create();
    if (uid != null) {
      $result.uid = uid;
    }
    if (businessUid != null) {
      $result.businessUid = businessUid;
    }
    return $result;
  }
  DeletePermissionGroupRequest._() : super();
  factory DeletePermissionGroupRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePermissionGroupRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePermissionGroupRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'uid')
    ..aOS(2, _omitFieldNames ? '' : 'businessUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePermissionGroupRequest clone() => DeletePermissionGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePermissionGroupRequest copyWith(void Function(DeletePermissionGroupRequest) updates) => super.copyWith((message) => updates(message as DeletePermissionGroupRequest)) as DeletePermissionGroupRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePermissionGroupRequest create() => DeletePermissionGroupRequest._();
  DeletePermissionGroupRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePermissionGroupRequest> createRepeated() => $pb.PbList<DeletePermissionGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePermissionGroupRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePermissionGroupRequest>(create);
  static DeletePermissionGroupRequest? _defaultInstance;

  /// The unique identifier of the permission group to delete.
  @$pb.TagNumber(1)
  $core.String get uid => $_getSZ(0);
  @$pb.TagNumber(1)
  set uid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUid() => clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasBusinessUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessUid() => clearField(2);
}

class DeletePermissionGroupResponse extends $pb.GeneratedMessage {
  factory DeletePermissionGroupResponse({
    $core.bool? success,
  }) {
    final $result = create();
    if (success != null) {
      $result.success = success;
    }
    return $result;
  }
  DeletePermissionGroupResponse._() : super();
  factory DeletePermissionGroupResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory DeletePermissionGroupResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'DeletePermissionGroupResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  DeletePermissionGroupResponse clone() => DeletePermissionGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  DeletePermissionGroupResponse copyWith(void Function(DeletePermissionGroupResponse) updates) => super.copyWith((message) => updates(message as DeletePermissionGroupResponse)) as DeletePermissionGroupResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePermissionGroupResponse create() => DeletePermissionGroupResponse._();
  DeletePermissionGroupResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePermissionGroupResponse> createRepeated() => $pb.PbList<DeletePermissionGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePermissionGroupResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<DeletePermissionGroupResponse>(create);
  static DeletePermissionGroupResponse? _defaultInstance;

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

class GetUserPermissionsRequest extends $pb.GeneratedMessage {
  factory GetUserPermissionsRequest({
    $core.String? userUid,
  }) {
    final $result = create();
    if (userUid != null) {
      $result.userUid = userUid;
    }
    return $result;
  }
  GetUserPermissionsRequest._() : super();
  factory GetUserPermissionsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPermissionsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPermissionsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPermissionsRequest clone() => GetUserPermissionsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPermissionsRequest copyWith(void Function(GetUserPermissionsRequest) updates) => super.copyWith((message) => updates(message as GetUserPermissionsRequest)) as GetUserPermissionsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPermissionsRequest create() => GetUserPermissionsRequest._();
  GetUserPermissionsRequest createEmptyInstance() => create();
  static $pb.PbList<GetUserPermissionsRequest> createRepeated() => $pb.PbList<GetUserPermissionsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetUserPermissionsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPermissionsRequest>(create);
  static GetUserPermissionsRequest? _defaultInstance;

  /// The unique identifier of the user to retrieve.
  @$pb.TagNumber(1)
  $core.String get userUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserUid() => clearField(1);
}

class GetUserPermissionsResponse extends $pb.GeneratedMessage {
  factory GetUserPermissionsResponse({
    $core.Iterable<UserPermission>? userPermissions,
  }) {
    final $result = create();
    if (userPermissions != null) {
      $result.userPermissions.addAll(userPermissions);
    }
    return $result;
  }
  GetUserPermissionsResponse._() : super();
  factory GetUserPermissionsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetUserPermissionsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetUserPermissionsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..pc<UserPermission>(1, _omitFieldNames ? '' : 'userPermissions', $pb.PbFieldType.PM, subBuilder: UserPermission.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetUserPermissionsResponse clone() => GetUserPermissionsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetUserPermissionsResponse copyWith(void Function(GetUserPermissionsResponse) updates) => super.copyWith((message) => updates(message as GetUserPermissionsResponse)) as GetUserPermissionsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetUserPermissionsResponse create() => GetUserPermissionsResponse._();
  GetUserPermissionsResponse createEmptyInstance() => create();
  static $pb.PbList<GetUserPermissionsResponse> createRepeated() => $pb.PbList<GetUserPermissionsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetUserPermissionsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetUserPermissionsResponse>(create);
  static GetUserPermissionsResponse? _defaultInstance;

  /// The permissions that the user has.
  @$pb.TagNumber(1)
  $core.List<UserPermission> get userPermissions => $_getList(0);
}

class RemoveUserPermissionRequest extends $pb.GeneratedMessage {
  factory RemoveUserPermissionRequest({
    $core.String? userUid,
    $core.String? permissionGroupUid,
    $core.String? resourceUid,
  }) {
    final $result = create();
    if (userUid != null) {
      $result.userUid = userUid;
    }
    if (permissionGroupUid != null) {
      $result.permissionGroupUid = permissionGroupUid;
    }
    if (resourceUid != null) {
      $result.resourceUid = resourceUid;
    }
    return $result;
  }
  RemoveUserPermissionRequest._() : super();
  factory RemoveUserPermissionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory RemoveUserPermissionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'RemoveUserPermissionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userUid')
    ..aOS(2, _omitFieldNames ? '' : 'permissionGroupUid')
    ..aOS(3, _omitFieldNames ? '' : 'resourceUid')
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
  $core.String get userUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserUid() => clearField(1);

  /// The unique identifier of the permission group.
  @$pb.TagNumber(2)
  $core.String get permissionGroupUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set permissionGroupUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionGroupUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionGroupUid() => clearField(2);

  /// The unique identifier of the resource.
  @$pb.TagNumber(3)
  $core.String get resourceUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceUid() => clearField(3);
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
    $core.String? userUid,
    $core.String? permissionGroupUid,
    $core.String? resourceUid,
  }) {
    final $result = create();
    if (userUid != null) {
      $result.userUid = userUid;
    }
    if (permissionGroupUid != null) {
      $result.permissionGroupUid = permissionGroupUid;
    }
    if (resourceUid != null) {
      $result.resourceUid = resourceUid;
    }
    return $result;
  }
  AddUserPermissionRequest._() : super();
  factory AddUserPermissionRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory AddUserPermissionRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'AddUserPermissionRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userUid')
    ..aOS(2, _omitFieldNames ? '' : 'permissionGroupUid')
    ..aOS(3, _omitFieldNames ? '' : 'resourceUid')
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
  $core.String get userUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserUid() => clearField(1);

  /// The unique identifier of the permission group.
  @$pb.TagNumber(2)
  $core.String get permissionGroupUid => $_getSZ(1);
  @$pb.TagNumber(2)
  set permissionGroupUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasPermissionGroupUid() => $_has(1);
  @$pb.TagNumber(2)
  void clearPermissionGroupUid() => clearField(2);

  /// The unique identifier of the resource.
  @$pb.TagNumber(3)
  $core.String get resourceUid => $_getSZ(2);
  @$pb.TagNumber(3)
  set resourceUid($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceUid() => $_has(2);
  @$pb.TagNumber(3)
  void clearResourceUid() => clearField(3);
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

class GetBusinessPermissionGroupsRequest extends $pb.GeneratedMessage {
  factory GetBusinessPermissionGroupsRequest({
    $core.String? businessUid,
  }) {
    final $result = create();
    if (businessUid != null) {
      $result.businessUid = businessUid;
    }
    return $result;
  }
  GetBusinessPermissionGroupsRequest._() : super();
  factory GetBusinessPermissionGroupsRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessPermissionGroupsRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessPermissionGroupsRequest', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessUid')
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionGroupsRequest clone() => GetBusinessPermissionGroupsRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionGroupsRequest copyWith(void Function(GetBusinessPermissionGroupsRequest) updates) => super.copyWith((message) => updates(message as GetBusinessPermissionGroupsRequest)) as GetBusinessPermissionGroupsRequest;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionGroupsRequest create() => GetBusinessPermissionGroupsRequest._();
  GetBusinessPermissionGroupsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessPermissionGroupsRequest> createRepeated() => $pb.PbList<GetBusinessPermissionGroupsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionGroupsRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessPermissionGroupsRequest>(create);
  static GetBusinessPermissionGroupsRequest? _defaultInstance;

  /// The unique identifier of the business to retrieve.
  @$pb.TagNumber(1)
  $core.String get businessUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasBusinessUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessUid() => clearField(1);
}

class GetBusinessPermissionGroupsResponse extends $pb.GeneratedMessage {
  factory GetBusinessPermissionGroupsResponse({
    $core.Iterable<PermissionGroup>? permissionGroups,
  }) {
    final $result = create();
    if (permissionGroups != null) {
      $result.permissionGroups.addAll(permissionGroups);
    }
    return $result;
  }
  GetBusinessPermissionGroupsResponse._() : super();
  factory GetBusinessPermissionGroupsResponse.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory GetBusinessPermissionGroupsResponse.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(_omitMessageNames ? '' : 'GetBusinessPermissionGroupsResponse', package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'), createEmptyInstance: create)
    ..pc<PermissionGroup>(1, _omitFieldNames ? '' : 'permissionGroups', $pb.PbFieldType.PM, subBuilder: PermissionGroup.create)
    ..hasRequiredFields = false
  ;

  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionGroupsResponse clone() => GetBusinessPermissionGroupsResponse()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  GetBusinessPermissionGroupsResponse copyWith(void Function(GetBusinessPermissionGroupsResponse) updates) => super.copyWith((message) => updates(message as GetBusinessPermissionGroupsResponse)) as GetBusinessPermissionGroupsResponse;

  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionGroupsResponse create() => GetBusinessPermissionGroupsResponse._();
  GetBusinessPermissionGroupsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessPermissionGroupsResponse> createRepeated() => $pb.PbList<GetBusinessPermissionGroupsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionGroupsResponse getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<GetBusinessPermissionGroupsResponse>(create);
  static GetBusinessPermissionGroupsResponse? _defaultInstance;

  /// The permission groups that the business has.
  @$pb.TagNumber(1)
  $core.List<PermissionGroup> get permissionGroups => $_getList(0);
}

class CheckPermissionRequest extends $pb.GeneratedMessage {
  factory CheckPermissionRequest({
    $core.String? userUid,
    $core.String? resourceUid,
    Permission? permission,
  }) {
    final $result = create();
    if (userUid != null) {
      $result.userUid = userUid;
    }
    if (resourceUid != null) {
      $result.resourceUid = resourceUid;
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
    ..aOS(1, _omitFieldNames ? '' : 'userUid')
    ..aOS(3, _omitFieldNames ? '' : 'resourceUid')
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
  $core.String get userUid => $_getSZ(0);
  @$pb.TagNumber(1)
  set userUid($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasUserUid() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserUid() => clearField(1);

  /// The unique identifier of the resource.
  @$pb.TagNumber(3)
  $core.String get resourceUid => $_getSZ(1);
  @$pb.TagNumber(3)
  set resourceUid($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(3)
  $core.bool hasResourceUid() => $_has(1);
  @$pb.TagNumber(3)
  void clearResourceUid() => clearField(3);

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

  $async.Future<CreatePermissionGroupResponse> createPermissionGroup($pb.ClientContext? ctx, CreatePermissionGroupRequest request) =>
    _client.invoke<CreatePermissionGroupResponse>(ctx, 'PermissionService', 'CreatePermissionGroup', request, CreatePermissionGroupResponse())
  ;
  $async.Future<GetPermissionGroupResponse> getPermissionGroup($pb.ClientContext? ctx, GetPermissionGroupRequest request) =>
    _client.invoke<GetPermissionGroupResponse>(ctx, 'PermissionService', 'GetPermissionGroup', request, GetPermissionGroupResponse())
  ;
  $async.Future<UpdatePermissionGroupResponse> updatePermissionGroup($pb.ClientContext? ctx, UpdatePermissionGroupRequest request) =>
    _client.invoke<UpdatePermissionGroupResponse>(ctx, 'PermissionService', 'UpdatePermissionGroup', request, UpdatePermissionGroupResponse())
  ;
  $async.Future<DeletePermissionGroupResponse> deletePermissionGroup($pb.ClientContext? ctx, DeletePermissionGroupRequest request) =>
    _client.invoke<DeletePermissionGroupResponse>(ctx, 'PermissionService', 'DeletePermissionGroup', request, DeletePermissionGroupResponse())
  ;
  $async.Future<GetUserPermissionsResponse> getUserPermissions($pb.ClientContext? ctx, GetUserPermissionsRequest request) =>
    _client.invoke<GetUserPermissionsResponse>(ctx, 'PermissionService', 'GetUserPermissions', request, GetUserPermissionsResponse())
  ;
  $async.Future<RemoveUserPermissionResponse> removeUserPermission($pb.ClientContext? ctx, RemoveUserPermissionRequest request) =>
    _client.invoke<RemoveUserPermissionResponse>(ctx, 'PermissionService', 'RemoveUserPermission', request, RemoveUserPermissionResponse())
  ;
  $async.Future<AddUserPermissionResponse> addUserPermission($pb.ClientContext? ctx, AddUserPermissionRequest request) =>
    _client.invoke<AddUserPermissionResponse>(ctx, 'PermissionService', 'AddUserPermission', request, AddUserPermissionResponse())
  ;
  $async.Future<GetBusinessPermissionGroupsResponse> getBusinessPermissionGroups($pb.ClientContext? ctx, GetBusinessPermissionGroupsRequest request) =>
    _client.invoke<GetBusinessPermissionGroupsResponse>(ctx, 'PermissionService', 'GetBusinessPermissionGroups', request, GetBusinessPermissionGroupsResponse())
  ;
  $async.Future<CheckPermissionResponse> checkPermission($pb.ClientContext? ctx, CheckPermissionRequest request) =>
    _client.invoke<CheckPermissionResponse>(ctx, 'PermissionService', 'CheckPermission', request, CheckPermissionResponse())
  ;
}


const _omitFieldNames = $core.bool.fromEnvironment('protobuf.omit_field_names');
const _omitMessageNames = $core.bool.fromEnvironment('protobuf.omit_message_names');
