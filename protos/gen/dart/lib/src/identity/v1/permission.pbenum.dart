// This is a generated file - do not edit.
//
// Generated from identity/v1/permission.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ResourceActionType extends $pb.ProtobufEnum {
  static const ResourceActionType RESOURCE_ACTION_TYPE_UNSPECIFIED =
      ResourceActionType._(
          0, _omitEnumNames ? '' : 'RESOURCE_ACTION_TYPE_UNSPECIFIED');

  /// Can read the resource.
  static const ResourceActionType RESOURCE_ACTION_TYPE_READ =
      ResourceActionType._(
          1, _omitEnumNames ? '' : 'RESOURCE_ACTION_TYPE_READ');

  /// Can read and (create or add) the resource.
  static const ResourceActionType RESOURCE_ACTION_TYPE_ADD =
      ResourceActionType._(2, _omitEnumNames ? '' : 'RESOURCE_ACTION_TYPE_ADD');

  /// Can read, create, update the resource.
  static const ResourceActionType RESOURCE_ACTION_TYPE_UPDATE =
      ResourceActionType._(
          3, _omitEnumNames ? '' : 'RESOURCE_ACTION_TYPE_UPDATE');

  /// Can read, create, update, delete the resource.
  static const ResourceActionType RESOURCE_ACTION_TYPE_REMOVE =
      ResourceActionType._(
          4, _omitEnumNames ? '' : 'RESOURCE_ACTION_TYPE_REMOVE');

  static const $core.List<ResourceActionType> values = <ResourceActionType>[
    RESOURCE_ACTION_TYPE_UNSPECIFIED,
    RESOURCE_ACTION_TYPE_READ,
    RESOURCE_ACTION_TYPE_ADD,
    RESOURCE_ACTION_TYPE_UPDATE,
    RESOURCE_ACTION_TYPE_REMOVE,
  ];

  static final $core.List<ResourceActionType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ResourceActionType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResourceActionType._(super.value, super.name);
}

class ResourceType extends $pb.ProtobufEnum {
  static const ResourceType RESOURCE_TYPE_UNSPECIFIED =
      ResourceType._(0, _omitEnumNames ? '' : 'RESOURCE_TYPE_UNSPECIFIED');
  static const ResourceType RESOURCE_TYPE_BUSINESS =
      ResourceType._(1, _omitEnumNames ? '' : 'RESOURCE_TYPE_BUSINESS');
  static const ResourceType RESOURCE_TYPE_BUSINESS_MEMBER =
      ResourceType._(2, _omitEnumNames ? '' : 'RESOURCE_TYPE_BUSINESS_MEMBER');
  static const ResourceType RESOURCE_TYPE_BUSINESS_SUPPLIER = ResourceType._(
      4, _omitEnumNames ? '' : 'RESOURCE_TYPE_BUSINESS_SUPPLIER');
  static const ResourceType RESOURCE_TYPE_STORE =
      ResourceType._(5, _omitEnumNames ? '' : 'RESOURCE_TYPE_STORE');
  static const ResourceType RESOURCE_TYPE_INVOICE =
      ResourceType._(6, _omitEnumNames ? '' : 'RESOURCE_TYPE_INVOICE');
  static const ResourceType RESOURCE_TYPE_STORE_ORDER =
      ResourceType._(7, _omitEnumNames ? '' : 'RESOURCE_TYPE_STORE_ORDER');
  static const ResourceType RESOURCE_TYPE_SUPPLIER_ORDER =
      ResourceType._(8, _omitEnumNames ? '' : 'RESOURCE_TYPE_SUPPLIER_ORDER');
  static const ResourceType RESOURCE_TYPE_PRODUCT =
      ResourceType._(9, _omitEnumNames ? '' : 'RESOURCE_TYPE_PRODUCT');

  static const $core.List<ResourceType> values = <ResourceType>[
    RESOURCE_TYPE_UNSPECIFIED,
    RESOURCE_TYPE_BUSINESS,
    RESOURCE_TYPE_BUSINESS_MEMBER,
    RESOURCE_TYPE_BUSINESS_SUPPLIER,
    RESOURCE_TYPE_STORE,
    RESOURCE_TYPE_INVOICE,
    RESOURCE_TYPE_STORE_ORDER,
    RESOURCE_TYPE_SUPPLIER_ORDER,
    RESOURCE_TYPE_PRODUCT,
  ];

  static final $core.List<ResourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 9);
  static ResourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ResourceType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
