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

class Permission extends $pb.GeneratedMessage {
  factory Permission({
    ResourceType? resourceType,
    $core.String? resourceId,
    ResourceActionType? actionType,
  }) {
    final result = create();
    if (resourceType != null) result.resourceType = resourceType;
    if (resourceId != null) result.resourceId = resourceId;
    if (actionType != null) result.actionType = actionType;
    return result;
  }

  Permission._();

  factory Permission.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Permission.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Permission',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..e<ResourceType>(
        1, _omitFieldNames ? '' : 'resourceType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceType.RESOURCE_TYPE_UNSPECIFIED,
        valueOf: ResourceType.valueOf,
        enumValues: ResourceType.values)
    ..aOS(2, _omitFieldNames ? '' : 'resourceId')
    ..e<ResourceActionType>(
        3, _omitFieldNames ? '' : 'actionType', $pb.PbFieldType.OE,
        defaultOrMaker: ResourceActionType.RESOURCE_ACTION_TYPE_UNSPECIFIED,
        valueOf: ResourceActionType.valueOf,
        enumValues: ResourceActionType.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Permission clone() => Permission()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Permission copyWith(void Function(Permission) updates) =>
      super.copyWith((message) => updates(message as Permission)) as Permission;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Permission create() => Permission._();
  @$core.override
  Permission createEmptyInstance() => create();
  static $pb.PbList<Permission> createRepeated() => $pb.PbList<Permission>();
  @$core.pragma('dart2js:noInline')
  static Permission getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Permission>(create);
  static Permission? _defaultInstance;

  @$pb.TagNumber(1)
  ResourceType get resourceType => $_getN(0);
  @$pb.TagNumber(1)
  set resourceType(ResourceType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasResourceType() => $_has(0);
  @$pb.TagNumber(1)
  void clearResourceType() => $_clearField(1);

  /// The resource_id is only specified when we want to restrict action on a specific resource.
  @$pb.TagNumber(2)
  $core.String get resourceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set resourceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasResourceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearResourceId() => $_clearField(2);

  /// The action that the member can perform on the resource.
  @$pb.TagNumber(3)
  ResourceActionType get actionType => $_getN(2);
  @$pb.TagNumber(3)
  set actionType(ResourceActionType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasActionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearActionType() => $_clearField(3);
}

class PermissionsGroup extends $pb.GeneratedMessage {
  factory PermissionsGroup({
    $core.String? refId,
    $core.String? name,
    $core.String? description,
    $core.Iterable<Permission>? permissions,
    $core.String? businessId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (permissions != null) result.permissions.addAll(permissions);
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  PermissionsGroup._();

  factory PermissionsGroup.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PermissionsGroup.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PermissionsGroup',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pc<Permission>(
        4, _omitFieldNames ? '' : 'permissions', $pb.PbFieldType.PM,
        subBuilder: Permission.create)
    ..aOS(6, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermissionsGroup clone() => PermissionsGroup()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PermissionsGroup copyWith(void Function(PermissionsGroup) updates) =>
      super.copyWith((message) => updates(message as PermissionsGroup))
          as PermissionsGroup;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PermissionsGroup create() => PermissionsGroup._();
  @$core.override
  PermissionsGroup createEmptyInstance() => create();
  static $pb.PbList<PermissionsGroup> createRepeated() =>
      $pb.PbList<PermissionsGroup>();
  @$core.pragma('dart2js:noInline')
  static PermissionsGroup getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PermissionsGroup>(create);
  static PermissionsGroup? _defaultInstance;

  /// The reference id to the permission group identifier.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The name of the permission group. Generally the role of the group.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// The description of the permission group.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// The permissions that the permission group has.
  @$pb.TagNumber(4)
  $pb.PbList<Permission> get permissions => $_getList(3);

  /// The unique identifier of the business.
  /// must be set if the permission group is create by a business.
  @$pb.TagNumber(6)
  $core.String get businessId => $_getSZ(4);
  @$pb.TagNumber(6)
  set businessId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(6)
  $core.bool hasBusinessId() => $_has(4);
  @$pb.TagNumber(6)
  void clearBusinessId() => $_clearField(6);
}

class CreatePermissionsGroupRequest extends $pb.GeneratedMessage {
  factory CreatePermissionsGroupRequest({
    PermissionsGroup? permissionsGroup,
    $core.String? businessId,
  }) {
    final result = create();
    if (permissionsGroup != null) result.permissionsGroup = permissionsGroup;
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  CreatePermissionsGroupRequest._();

  factory CreatePermissionsGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePermissionsGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePermissionsGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<PermissionsGroup>(1, _omitFieldNames ? '' : 'permissionsGroup',
        subBuilder: PermissionsGroup.create)
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePermissionsGroupRequest clone() =>
      CreatePermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePermissionsGroupRequest copyWith(
          void Function(CreatePermissionsGroupRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreatePermissionsGroupRequest))
          as CreatePermissionsGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupRequest create() =>
      CreatePermissionsGroupRequest._();
  @$core.override
  CreatePermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePermissionsGroupRequest> createRepeated() =>
      $pb.PbList<CreatePermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePermissionsGroupRequest>(create);
  static CreatePermissionsGroupRequest? _defaultInstance;

  /// The permission group information to create.
  /// Note:Only the fields that are set will be created.
  @$pb.TagNumber(1)
  PermissionsGroup get permissionsGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionsGroup(PermissionsGroup value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissionsGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionsGroup() => $_clearField(1);
  @$pb.TagNumber(1)
  PermissionsGroup ensurePermissionsGroup() => $_ensure(0);

  /// The unique identifier of the business on which the permission group is created.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);
}

class CreatePermissionsGroupResponse extends $pb.GeneratedMessage {
  factory CreatePermissionsGroupResponse({
    $core.String? permissionGroupId,
  }) {
    final result = create();
    if (permissionGroupId != null) result.permissionGroupId = permissionGroupId;
    return result;
  }

  CreatePermissionsGroupResponse._();

  factory CreatePermissionsGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePermissionsGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePermissionsGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'permissionGroupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePermissionsGroupResponse clone() =>
      CreatePermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePermissionsGroupResponse copyWith(
          void Function(CreatePermissionsGroupResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreatePermissionsGroupResponse))
          as CreatePermissionsGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupResponse create() =>
      CreatePermissionsGroupResponse._();
  @$core.override
  CreatePermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePermissionsGroupResponse> createRepeated() =>
      $pb.PbList<CreatePermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePermissionsGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePermissionsGroupResponse>(create);
  static CreatePermissionsGroupResponse? _defaultInstance;

  /// The unique identifier of the created permission group.
  @$pb.TagNumber(1)
  $core.String get permissionGroupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set permissionGroupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissionGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionGroupId() => $_clearField(1);
}

class GetPermissionsGroupRequest extends $pb.GeneratedMessage {
  factory GetPermissionsGroupRequest({
    $core.String? permissionGroupId,
  }) {
    final result = create();
    if (permissionGroupId != null) result.permissionGroupId = permissionGroupId;
    return result;
  }

  GetPermissionsGroupRequest._();

  factory GetPermissionsGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPermissionsGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPermissionsGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'permissionGroupId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPermissionsGroupRequest clone() =>
      GetPermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPermissionsGroupRequest copyWith(
          void Function(GetPermissionsGroupRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetPermissionsGroupRequest))
          as GetPermissionsGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupRequest create() => GetPermissionsGroupRequest._();
  @$core.override
  GetPermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<GetPermissionsGroupRequest> createRepeated() =>
      $pb.PbList<GetPermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPermissionsGroupRequest>(create);
  static GetPermissionsGroupRequest? _defaultInstance;

  /// The unique identifier of the permission group to retrieve.
  @$pb.TagNumber(1)
  $core.String get permissionGroupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set permissionGroupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissionGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionGroupId() => $_clearField(1);
}

class GetPermissionsGroupResponse extends $pb.GeneratedMessage {
  factory GetPermissionsGroupResponse({
    PermissionsGroup? permissionsGroup,
  }) {
    final result = create();
    if (permissionsGroup != null) result.permissionsGroup = permissionsGroup;
    return result;
  }

  GetPermissionsGroupResponse._();

  factory GetPermissionsGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPermissionsGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPermissionsGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOM<PermissionsGroup>(1, _omitFieldNames ? '' : 'permissionsGroup',
        subBuilder: PermissionsGroup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPermissionsGroupResponse clone() =>
      GetPermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPermissionsGroupResponse copyWith(
          void Function(GetPermissionsGroupResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetPermissionsGroupResponse))
          as GetPermissionsGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupResponse create() =>
      GetPermissionsGroupResponse._();
  @$core.override
  GetPermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<GetPermissionsGroupResponse> createRepeated() =>
      $pb.PbList<GetPermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPermissionsGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPermissionsGroupResponse>(create);
  static GetPermissionsGroupResponse? _defaultInstance;

  /// The retrieved permission group data.
  @$pb.TagNumber(1)
  PermissionsGroup get permissionsGroup => $_getN(0);
  @$pb.TagNumber(1)
  set permissionsGroup(PermissionsGroup value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissionsGroup() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionsGroup() => $_clearField(1);
  @$pb.TagNumber(1)
  PermissionsGroup ensurePermissionsGroup() => $_ensure(0);
}

class UpdatePermissionsGroupRequest extends $pb.GeneratedMessage {
  factory UpdatePermissionsGroupRequest({
    $core.String? permissionsGroupId,
    $core.String? name,
    $core.String? description,
    $core.Iterable<Permission>? addPermissions,
    $core.Iterable<Permission>? removePermissions,
    $core.String? businessId,
  }) {
    final result = create();
    if (permissionsGroupId != null)
      result.permissionsGroupId = permissionsGroupId;
    if (name != null) result.name = name;
    if (description != null) result.description = description;
    if (addPermissions != null) result.addPermissions.addAll(addPermissions);
    if (removePermissions != null)
      result.removePermissions.addAll(removePermissions);
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  UpdatePermissionsGroupRequest._();

  factory UpdatePermissionsGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePermissionsGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePermissionsGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'permissionsGroupId')
    ..aOS(2, _omitFieldNames ? '' : 'name')
    ..aOS(3, _omitFieldNames ? '' : 'description')
    ..pc<Permission>(
        4, _omitFieldNames ? '' : 'addPermissions', $pb.PbFieldType.PM,
        subBuilder: Permission.create)
    ..pc<Permission>(
        5, _omitFieldNames ? '' : 'removePermissions', $pb.PbFieldType.PM,
        subBuilder: Permission.create)
    ..aOS(6, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePermissionsGroupRequest clone() =>
      UpdatePermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePermissionsGroupRequest copyWith(
          void Function(UpdatePermissionsGroupRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdatePermissionsGroupRequest))
          as UpdatePermissionsGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupRequest create() =>
      UpdatePermissionsGroupRequest._();
  @$core.override
  UpdatePermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePermissionsGroupRequest> createRepeated() =>
      $pb.PbList<UpdatePermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePermissionsGroupRequest>(create);
  static UpdatePermissionsGroupRequest? _defaultInstance;

  /// The permission group id;
  @$pb.TagNumber(1)
  $core.String get permissionsGroupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set permissionsGroupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissionsGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionsGroupId() => $_clearField(1);

  /// The name of the permission group. Generally the role of the group.
  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => $_clearField(2);

  /// The description of the permission group.
  @$pb.TagNumber(3)
  $core.String get description => $_getSZ(2);
  @$pb.TagNumber(3)
  set description($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDescription() => $_has(2);
  @$pb.TagNumber(3)
  void clearDescription() => $_clearField(3);

  /// The permissions set to add.
  @$pb.TagNumber(4)
  $pb.PbList<Permission> get addPermissions => $_getList(3);

  /// The permissions set to remove.
  @$pb.TagNumber(5)
  $pb.PbList<Permission> get removePermissions => $_getList(4);

  /// The unique identifier of the business.
  @$pb.TagNumber(6)
  $core.String get businessId => $_getSZ(5);
  @$pb.TagNumber(6)
  set businessId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBusinessId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBusinessId() => $_clearField(6);
}

class UpdatePermissionsGroupResponse extends $pb.GeneratedMessage {
  factory UpdatePermissionsGroupResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdatePermissionsGroupResponse._();

  factory UpdatePermissionsGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePermissionsGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePermissionsGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePermissionsGroupResponse clone() =>
      UpdatePermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePermissionsGroupResponse copyWith(
          void Function(UpdatePermissionsGroupResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdatePermissionsGroupResponse))
          as UpdatePermissionsGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupResponse create() =>
      UpdatePermissionsGroupResponse._();
  @$core.override
  UpdatePermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePermissionsGroupResponse> createRepeated() =>
      $pb.PbList<UpdatePermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePermissionsGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePermissionsGroupResponse>(create);
  static UpdatePermissionsGroupResponse? _defaultInstance;

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

class DeletePermissionsGroupRequest extends $pb.GeneratedMessage {
  factory DeletePermissionsGroupRequest({
    $core.String? permissionGroupId,
    $core.String? businessId,
  }) {
    final result = create();
    if (permissionGroupId != null) result.permissionGroupId = permissionGroupId;
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  DeletePermissionsGroupRequest._();

  factory DeletePermissionsGroupRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeletePermissionsGroupRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeletePermissionsGroupRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'permissionGroupId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePermissionsGroupRequest clone() =>
      DeletePermissionsGroupRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePermissionsGroupRequest copyWith(
          void Function(DeletePermissionsGroupRequest) updates) =>
      super.copyWith(
              (message) => updates(message as DeletePermissionsGroupRequest))
          as DeletePermissionsGroupRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupRequest create() =>
      DeletePermissionsGroupRequest._();
  @$core.override
  DeletePermissionsGroupRequest createEmptyInstance() => create();
  static $pb.PbList<DeletePermissionsGroupRequest> createRepeated() =>
      $pb.PbList<DeletePermissionsGroupRequest>();
  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeletePermissionsGroupRequest>(create);
  static DeletePermissionsGroupRequest? _defaultInstance;

  /// The unique identifier of the permission group to delete.
  @$pb.TagNumber(1)
  $core.String get permissionGroupId => $_getSZ(0);
  @$pb.TagNumber(1)
  set permissionGroupId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPermissionGroupId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPermissionGroupId() => $_clearField(1);

  /// The unique identifier of the business.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);
}

class DeletePermissionsGroupResponse extends $pb.GeneratedMessage {
  factory DeletePermissionsGroupResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeletePermissionsGroupResponse._();

  factory DeletePermissionsGroupResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeletePermissionsGroupResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeletePermissionsGroupResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePermissionsGroupResponse clone() =>
      DeletePermissionsGroupResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeletePermissionsGroupResponse copyWith(
          void Function(DeletePermissionsGroupResponse) updates) =>
      super.copyWith(
              (message) => updates(message as DeletePermissionsGroupResponse))
          as DeletePermissionsGroupResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupResponse create() =>
      DeletePermissionsGroupResponse._();
  @$core.override
  DeletePermissionsGroupResponse createEmptyInstance() => create();
  static $pb.PbList<DeletePermissionsGroupResponse> createRepeated() =>
      $pb.PbList<DeletePermissionsGroupResponse>();
  @$core.pragma('dart2js:noInline')
  static DeletePermissionsGroupResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeletePermissionsGroupResponse>(create);
  static DeletePermissionsGroupResponse? _defaultInstance;

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

class UpdateMemberPermissionsRequest extends $pb.GeneratedMessage {
  factory UpdateMemberPermissionsRequest({
    $core.String? userId,
    $core.String? businessId,
    $core.Iterable<Permission>? removePermissions,
    $core.Iterable<Permission>? addPermissions,
    $core.Iterable<$core.String>? removePermissionsGroupsIds,
    $core.Iterable<$core.String>? addPermissionsGroupsIds,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    if (removePermissions != null)
      result.removePermissions.addAll(removePermissions);
    if (addPermissions != null) result.addPermissions.addAll(addPermissions);
    if (removePermissionsGroupsIds != null)
      result.removePermissionsGroupsIds.addAll(removePermissionsGroupsIds);
    if (addPermissionsGroupsIds != null)
      result.addPermissionsGroupsIds.addAll(addPermissionsGroupsIds);
    return result;
  }

  UpdateMemberPermissionsRequest._();

  factory UpdateMemberPermissionsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateMemberPermissionsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateMemberPermissionsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..pc<Permission>(
        3, _omitFieldNames ? '' : 'removePermissions', $pb.PbFieldType.PM,
        subBuilder: Permission.create)
    ..pc<Permission>(
        4, _omitFieldNames ? '' : 'addPermissions', $pb.PbFieldType.PM,
        subBuilder: Permission.create)
    ..pPS(5, _omitFieldNames ? '' : 'removePermissionsGroupsIds')
    ..pPS(6, _omitFieldNames ? '' : 'addPermissionsGroupsIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMemberPermissionsRequest clone() =>
      UpdateMemberPermissionsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMemberPermissionsRequest copyWith(
          void Function(UpdateMemberPermissionsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateMemberPermissionsRequest))
          as UpdateMemberPermissionsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMemberPermissionsRequest create() =>
      UpdateMemberPermissionsRequest._();
  @$core.override
  UpdateMemberPermissionsRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateMemberPermissionsRequest> createRepeated() =>
      $pb.PbList<UpdateMemberPermissionsRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateMemberPermissionsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateMemberPermissionsRequest>(create);
  static UpdateMemberPermissionsRequest? _defaultInstance;

  /// The unique identifier of the member.
  @$pb.TagNumber(1)
  $core.String get userId => $_getSZ(0);
  @$pb.TagNumber(1)
  set userId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearUserId() => $_clearField(1);

  /// The id of the business on which we want to update the permissions.
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// The set of permissions to remove from the member.
  @$pb.TagNumber(3)
  $pb.PbList<Permission> get removePermissions => $_getList(2);

  /// The set of permissions to add on the member
  @$pb.TagNumber(4)
  $pb.PbList<Permission> get addPermissions => $_getList(3);

  /// The set of permissions groups to remove the member from.
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get removePermissionsGroupsIds => $_getList(4);

  /// The set of permissions groups to add the member on.
  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get addPermissionsGroupsIds => $_getList(5);
}

class UpdateMemberPermissionsResponse extends $pb.GeneratedMessage {
  factory UpdateMemberPermissionsResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateMemberPermissionsResponse._();

  factory UpdateMemberPermissionsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateMemberPermissionsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateMemberPermissionsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMemberPermissionsResponse clone() =>
      UpdateMemberPermissionsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateMemberPermissionsResponse copyWith(
          void Function(UpdateMemberPermissionsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateMemberPermissionsResponse))
          as UpdateMemberPermissionsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateMemberPermissionsResponse create() =>
      UpdateMemberPermissionsResponse._();
  @$core.override
  UpdateMemberPermissionsResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateMemberPermissionsResponse> createRepeated() =>
      $pb.PbList<UpdateMemberPermissionsResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateMemberPermissionsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateMemberPermissionsResponse>(
          create);
  static UpdateMemberPermissionsResponse? _defaultInstance;

  /// Whether the member was successfully removed from the permission group.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetBusinessPermissionsGroupsRequest extends $pb.GeneratedMessage {
  factory GetBusinessPermissionsGroupsRequest({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  GetBusinessPermissionsGroupsRequest._();

  factory GetBusinessPermissionsGroupsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessPermissionsGroupsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessPermissionsGroupsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessPermissionsGroupsRequest clone() =>
      GetBusinessPermissionsGroupsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessPermissionsGroupsRequest copyWith(
          void Function(GetBusinessPermissionsGroupsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetBusinessPermissionsGroupsRequest))
          as GetBusinessPermissionsGroupsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsRequest create() =>
      GetBusinessPermissionsGroupsRequest._();
  @$core.override
  GetBusinessPermissionsGroupsRequest createEmptyInstance() => create();
  static $pb.PbList<GetBusinessPermissionsGroupsRequest> createRepeated() =>
      $pb.PbList<GetBusinessPermissionsGroupsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetBusinessPermissionsGroupsRequest>(create);
  static GetBusinessPermissionsGroupsRequest? _defaultInstance;

  /// The unique identifier of the business to retrieve.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

class GetBusinessPermissionsGroupsResponse extends $pb.GeneratedMessage {
  factory GetBusinessPermissionsGroupsResponse({
    $core.Iterable<PermissionsGroup>? permissionsGroups,
  }) {
    final result = create();
    if (permissionsGroups != null)
      result.permissionsGroups.addAll(permissionsGroups);
    return result;
  }

  GetBusinessPermissionsGroupsResponse._();

  factory GetBusinessPermissionsGroupsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetBusinessPermissionsGroupsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetBusinessPermissionsGroupsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..pc<PermissionsGroup>(
        1, _omitFieldNames ? '' : 'permissionsGroups', $pb.PbFieldType.PM,
        subBuilder: PermissionsGroup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessPermissionsGroupsResponse clone() =>
      GetBusinessPermissionsGroupsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetBusinessPermissionsGroupsResponse copyWith(
          void Function(GetBusinessPermissionsGroupsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetBusinessPermissionsGroupsResponse))
          as GetBusinessPermissionsGroupsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsResponse create() =>
      GetBusinessPermissionsGroupsResponse._();
  @$core.override
  GetBusinessPermissionsGroupsResponse createEmptyInstance() => create();
  static $pb.PbList<GetBusinessPermissionsGroupsResponse> createRepeated() =>
      $pb.PbList<GetBusinessPermissionsGroupsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetBusinessPermissionsGroupsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetBusinessPermissionsGroupsResponse>(create);
  static GetBusinessPermissionsGroupsResponse? _defaultInstance;

  /// The permission groups that the business has.
  @$pb.TagNumber(1)
  $pb.PbList<PermissionsGroup> get permissionsGroups => $_getList(0);
}

class CheckPermissionRequest extends $pb.GeneratedMessage {
  factory CheckPermissionRequest({
    $core.String? userId,
    $core.String? businessId,
    Permission? permission,
  }) {
    final result = create();
    if (userId != null) result.userId = userId;
    if (businessId != null) result.businessId = businessId;
    if (permission != null) result.permission = permission;
    return result;
  }

  CheckPermissionRequest._();

  factory CheckPermissionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPermissionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPermissionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'userId')
    ..aOS(3, _omitFieldNames ? '' : 'businessId')
    ..aOM<Permission>(4, _omitFieldNames ? '' : 'permission',
        subBuilder: Permission.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionRequest clone() =>
      CheckPermissionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionRequest copyWith(
          void Function(CheckPermissionRequest) updates) =>
      super.copyWith((message) => updates(message as CheckPermissionRequest))
          as CheckPermissionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest create() => CheckPermissionRequest._();
  @$core.override
  CheckPermissionRequest createEmptyInstance() => create();
  static $pb.PbList<CheckPermissionRequest> createRepeated() =>
      $pb.PbList<CheckPermissionRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPermissionRequest>(create);
  static CheckPermissionRequest? _defaultInstance;

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
  Permission get permission => $_getN(2);
  @$pb.TagNumber(4)
  set permission(Permission value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPermission() => $_has(2);
  @$pb.TagNumber(4)
  void clearPermission() => $_clearField(4);
  @$pb.TagNumber(4)
  Permission ensurePermission() => $_ensure(2);
}

class CheckPermissionResponse extends $pb.GeneratedMessage {
  factory CheckPermissionResponse({
    $core.bool? hasPermission,
  }) {
    final result = create();
    if (hasPermission != null) result.hasPermission = hasPermission;
    return result;
  }

  CheckPermissionResponse._();

  factory CheckPermissionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckPermissionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckPermissionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'hasPermission')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionResponse clone() =>
      CheckPermissionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckPermissionResponse copyWith(
          void Function(CheckPermissionResponse) updates) =>
      super.copyWith((message) => updates(message as CheckPermissionResponse))
          as CheckPermissionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse create() => CheckPermissionResponse._();
  @$core.override
  CheckPermissionResponse createEmptyInstance() => create();
  static $pb.PbList<CheckPermissionResponse> createRepeated() =>
      $pb.PbList<CheckPermissionResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckPermissionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckPermissionResponse>(create);
  static CheckPermissionResponse? _defaultInstance;

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

/// Request to stream business permissions groups
class StreamBusinessPermissionsGroupsRequest extends $pb.GeneratedMessage {
  factory StreamBusinessPermissionsGroupsRequest({
    $core.String? businessId,
  }) {
    final result = create();
    if (businessId != null) result.businessId = businessId;
    return result;
  }

  StreamBusinessPermissionsGroupsRequest._();

  factory StreamBusinessPermissionsGroupsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamBusinessPermissionsGroupsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamBusinessPermissionsGroupsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'businessId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessPermissionsGroupsRequest clone() =>
      StreamBusinessPermissionsGroupsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessPermissionsGroupsRequest copyWith(
          void Function(StreamBusinessPermissionsGroupsRequest) updates) =>
      super.copyWith((message) =>
              updates(message as StreamBusinessPermissionsGroupsRequest))
          as StreamBusinessPermissionsGroupsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamBusinessPermissionsGroupsRequest create() =>
      StreamBusinessPermissionsGroupsRequest._();
  @$core.override
  StreamBusinessPermissionsGroupsRequest createEmptyInstance() => create();
  static $pb.PbList<StreamBusinessPermissionsGroupsRequest> createRepeated() =>
      $pb.PbList<StreamBusinessPermissionsGroupsRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamBusinessPermissionsGroupsRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          StreamBusinessPermissionsGroupsRequest>(create);
  static StreamBusinessPermissionsGroupsRequest? _defaultInstance;

  /// The unique identifier of the business to stream.
  @$pb.TagNumber(1)
  $core.String get businessId => $_getSZ(0);
  @$pb.TagNumber(1)
  set businessId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBusinessId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBusinessId() => $_clearField(1);
}

/// Response for streaming business permissions groups
class StreamBusinessPermissionsGroupsResponse extends $pb.GeneratedMessage {
  factory StreamBusinessPermissionsGroupsResponse({
    $core.Iterable<PermissionsGroup>? permissionsGroups,
  }) {
    final result = create();
    if (permissionsGroups != null)
      result.permissionsGroups.addAll(permissionsGroups);
    return result;
  }

  StreamBusinessPermissionsGroupsResponse._();

  factory StreamBusinessPermissionsGroupsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamBusinessPermissionsGroupsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamBusinessPermissionsGroupsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'identity.v1'),
      createEmptyInstance: create)
    ..pc<PermissionsGroup>(
        1, _omitFieldNames ? '' : 'permissionsGroups', $pb.PbFieldType.PM,
        subBuilder: PermissionsGroup.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessPermissionsGroupsResponse clone() =>
      StreamBusinessPermissionsGroupsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamBusinessPermissionsGroupsResponse copyWith(
          void Function(StreamBusinessPermissionsGroupsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as StreamBusinessPermissionsGroupsResponse))
          as StreamBusinessPermissionsGroupsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamBusinessPermissionsGroupsResponse create() =>
      StreamBusinessPermissionsGroupsResponse._();
  @$core.override
  StreamBusinessPermissionsGroupsResponse createEmptyInstance() => create();
  static $pb.PbList<StreamBusinessPermissionsGroupsResponse> createRepeated() =>
      $pb.PbList<StreamBusinessPermissionsGroupsResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamBusinessPermissionsGroupsResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          StreamBusinessPermissionsGroupsResponse>(create);
  static StreamBusinessPermissionsGroupsResponse? _defaultInstance;

  /// The permission groups that the business has.
  @$pb.TagNumber(1)
  $pb.PbList<PermissionsGroup> get permissionsGroups => $_getList(0);
}

class PermissionServiceApi {
  final $pb.RpcClient _client;

  PermissionServiceApi(this._client);

  /// Creates a new permission group.
  $async.Future<CreatePermissionsGroupResponse> createPermissionsGroup(
          $pb.ClientContext? ctx, CreatePermissionsGroupRequest request) =>
      _client.invoke<CreatePermissionsGroupResponse>(ctx, 'PermissionService',
          'CreatePermissionsGroup', request, CreatePermissionsGroupResponse());

  /// Gets a permission group by id.
  $async.Future<GetPermissionsGroupResponse> getPermissionsGroup(
          $pb.ClientContext? ctx, GetPermissionsGroupRequest request) =>
      _client.invoke<GetPermissionsGroupResponse>(ctx, 'PermissionService',
          'GetPermissionsGroup', request, GetPermissionsGroupResponse());

  /// Updates a permission group.
  $async.Future<UpdatePermissionsGroupResponse> updatePermissionsGroup(
          $pb.ClientContext? ctx, UpdatePermissionsGroupRequest request) =>
      _client.invoke<UpdatePermissionsGroupResponse>(ctx, 'PermissionService',
          'UpdatePermissionsGroup', request, UpdatePermissionsGroupResponse());

  /// Deletes a permission group.
  $async.Future<DeletePermissionsGroupResponse> deletePermissionsGroup(
          $pb.ClientContext? ctx, DeletePermissionsGroupRequest request) =>
      _client.invoke<DeletePermissionsGroupResponse>(ctx, 'PermissionService',
          'DeletePermissionsGroup', request, DeletePermissionsGroupResponse());

  /// Update the member permissions on the provided business.
  $async.Future<UpdateMemberPermissionsResponse> updateMemberPermissions(
          $pb.ClientContext? ctx, UpdateMemberPermissionsRequest request) =>
      _client.invoke<UpdateMemberPermissionsResponse>(
          ctx,
          'PermissionService',
          'UpdateMemberPermissions',
          request,
          UpdateMemberPermissionsResponse());

  /// Gets the permission groups of the business.
  $async.Future<GetBusinessPermissionsGroupsResponse>
      getBusinessPermissionsGroups($pb.ClientContext? ctx,
              GetBusinessPermissionsGroupsRequest request) =>
          _client.invoke<GetBusinessPermissionsGroupsResponse>(
              ctx,
              'PermissionService',
              'GetBusinessPermissionsGroups',
              request,
              GetBusinessPermissionsGroupsResponse());

  /// Checks if the member has the provided permission for the provided resource.
  $async.Future<CheckPermissionResponse> checkPermission(
          $pb.ClientContext? ctx, CheckPermissionRequest request) =>
      _client.invoke<CheckPermissionResponse>(ctx, 'PermissionService',
          'CheckPermission', request, CheckPermissionResponse());

  /// Stream the permission groups of the business with real-time updates.
  $async.Future<StreamBusinessPermissionsGroupsResponse>
      streamBusinessPermissionsGroups($pb.ClientContext? ctx,
              StreamBusinessPermissionsGroupsRequest request) =>
          _client.invoke<StreamBusinessPermissionsGroupsResponse>(
              ctx,
              'PermissionService',
              'StreamBusinessPermissionsGroups',
              request,
              StreamBusinessPermissionsGroupsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
