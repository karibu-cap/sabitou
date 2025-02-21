//
//  Generated code. Do not modify.
//  source: identity/v1/permission.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class PermissionActionType extends $pb.ProtobufEnum {
  static const PermissionActionType PERMISSION_ACTION_TYPE_UNSPECIFIED = PermissionActionType._(0, _omitEnumNames ? '' : 'PERMISSION_ACTION_TYPE_UNSPECIFIED');
  static const PermissionActionType PERMISSION_ACTION_TYPE_READ = PermissionActionType._(1, _omitEnumNames ? '' : 'PERMISSION_ACTION_TYPE_READ');
  static const PermissionActionType PERMISSION_ACTION_TYPE_ADD = PermissionActionType._(2, _omitEnumNames ? '' : 'PERMISSION_ACTION_TYPE_ADD');
  static const PermissionActionType PERMISSION_ACTION_TYPE_UPDATE = PermissionActionType._(3, _omitEnumNames ? '' : 'PERMISSION_ACTION_TYPE_UPDATE');
  static const PermissionActionType PERMISSION_ACTION_TYPE_REMOVE = PermissionActionType._(4, _omitEnumNames ? '' : 'PERMISSION_ACTION_TYPE_REMOVE');

  static const $core.List<PermissionActionType> values = <PermissionActionType> [
    PERMISSION_ACTION_TYPE_UNSPECIFIED,
    PERMISSION_ACTION_TYPE_READ,
    PERMISSION_ACTION_TYPE_ADD,
    PERMISSION_ACTION_TYPE_UPDATE,
    PERMISSION_ACTION_TYPE_REMOVE,
  ];

  static final $core.Map<$core.int, PermissionActionType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PermissionActionType? valueOf($core.int value) => _byValue[value];

  const PermissionActionType._($core.int v, $core.String n) : super(v, n);
}

class PermissionResourceType extends $pb.ProtobufEnum {
  static const PermissionResourceType PERMISSION_RESOURCE_TYPE_UNSPECIFIED = PermissionResourceType._(0, _omitEnumNames ? '' : 'PERMISSION_RESOURCE_TYPE_UNSPECIFIED');
  static const PermissionResourceType PERMISSION_RESOURCE_TYPE_BUSINESS = PermissionResourceType._(1, _omitEnumNames ? '' : 'PERMISSION_RESOURCE_TYPE_BUSINESS');
  static const PermissionResourceType PERMISSION_RESOURCE_TYPE_STORE = PermissionResourceType._(2, _omitEnumNames ? '' : 'PERMISSION_RESOURCE_TYPE_STORE');

  static const $core.List<PermissionResourceType> values = <PermissionResourceType> [
    PERMISSION_RESOURCE_TYPE_UNSPECIFIED,
    PERMISSION_RESOURCE_TYPE_BUSINESS,
    PERMISSION_RESOURCE_TYPE_STORE,
  ];

  static final $core.Map<$core.int, PermissionResourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PermissionResourceType? valueOf($core.int value) => _byValue[value];

  const PermissionResourceType._($core.int v, $core.String n) : super(v, n);
}

class PermissionEntityType extends $pb.ProtobufEnum {
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_UNSPECIFIED = PermissionEntityType._(0, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_UNSPECIFIED');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_BUSINESS = PermissionEntityType._(1, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_BUSINESS');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_STORE = PermissionEntityType._(2, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_STORE');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_USER = PermissionEntityType._(3, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_USER');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_ARTICLE = PermissionEntityType._(4, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_ARTICLE');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_INVOICE = PermissionEntityType._(5, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_INVOICE');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_PAYMENT = PermissionEntityType._(6, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_PAYMENT');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_ORDER = PermissionEntityType._(7, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_ORDER');
  static const PermissionEntityType PERMISSION_ENTITY_TYPE_PERMISSION_GROUP = PermissionEntityType._(8, _omitEnumNames ? '' : 'PERMISSION_ENTITY_TYPE_PERMISSION_GROUP');

  static const $core.List<PermissionEntityType> values = <PermissionEntityType> [
    PERMISSION_ENTITY_TYPE_UNSPECIFIED,
    PERMISSION_ENTITY_TYPE_BUSINESS,
    PERMISSION_ENTITY_TYPE_STORE,
    PERMISSION_ENTITY_TYPE_USER,
    PERMISSION_ENTITY_TYPE_ARTICLE,
    PERMISSION_ENTITY_TYPE_INVOICE,
    PERMISSION_ENTITY_TYPE_PAYMENT,
    PERMISSION_ENTITY_TYPE_ORDER,
    PERMISSION_ENTITY_TYPE_PERMISSION_GROUP,
  ];

  static final $core.Map<$core.int, PermissionEntityType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PermissionEntityType? valueOf($core.int value) => _byValue[value];

  const PermissionEntityType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
