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

  /// Can read and create the resource.
  static const ResourceActionType RESOURCE_ACTION_TYPE_ADD =
      ResourceActionType._(2, _omitEnumNames ? '' : 'RESOURCE_ACTION_TYPE_ADD');

  /// Can read, update the resource.
  static const ResourceActionType RESOURCE_ACTION_TYPE_UPDATE =
      ResourceActionType._(
          3, _omitEnumNames ? '' : 'RESOURCE_ACTION_TYPE_UPDATE');

  /// Can read, delete the resource.
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

class BusinessResourceType extends $pb.ProtobufEnum {
  static const BusinessResourceType BUSINESS_RESOURCE_TYPE_UNSPECIFIED =
      BusinessResourceType._(
          0, _omitEnumNames ? '' : 'BUSINESS_RESOURCE_TYPE_UNSPECIFIED');

  /// / Can make all actions about information business.
  static const BusinessResourceType BUSINESS_RESOURCE_TYPE_BUSINESS =
      BusinessResourceType._(
          1, _omitEnumNames ? '' : 'BUSINESS_RESOURCE_TYPE_BUSINESS');

  /// / Can make all actions about business member.
  static const BusinessResourceType BUSINESS_RESOURCE_TYPE_MEMBER =
      BusinessResourceType._(
          2, _omitEnumNames ? '' : 'BUSINESS_RESOURCE_TYPE_MEMBER');

  /// / Can make all actions about business supplier.
  static const BusinessResourceType BUSINESS_RESOURCE_TYPE_SUPPLIER =
      BusinessResourceType._(
          3, _omitEnumNames ? '' : 'BUSINESS_RESOURCE_TYPE_SUPPLIER');

  static const $core.List<BusinessResourceType> values = <BusinessResourceType>[
    BUSINESS_RESOURCE_TYPE_UNSPECIFIED,
    BUSINESS_RESOURCE_TYPE_BUSINESS,
    BUSINESS_RESOURCE_TYPE_MEMBER,
    BUSINESS_RESOURCE_TYPE_SUPPLIER,
  ];

  static final $core.List<BusinessResourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static BusinessResourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const BusinessResourceType._(super.value, super.name);
}

class StoreResourceType extends $pb.ProtobufEnum {
  static const StoreResourceType STORE_RESOURCE_TYPE_UNSPECIFIED =
      StoreResourceType._(
          0, _omitEnumNames ? '' : 'STORE_RESOURCE_TYPE_UNSPECIFIED');

  /// / Can make all actions about information store.
  static const StoreResourceType STORE_RESOURCE_TYPE_STORE =
      StoreResourceType._(1, _omitEnumNames ? '' : 'STORE_RESOURCE_TYPE_STORE');

  /// / Can make all actions about store invoice.
  static const StoreResourceType STORE_RESOURCE_TYPE_INVOICE =
      StoreResourceType._(
          2, _omitEnumNames ? '' : 'STORE_RESOURCE_TYPE_INVOICE');

  /// / Can make all actions about store order.
  static const StoreResourceType STORE_RESOURCE_TYPE_ORDER =
      StoreResourceType._(3, _omitEnumNames ? '' : 'STORE_RESOURCE_TYPE_ORDER');

  /// / Can make all actions about supplier order.
  static const StoreResourceType STORE_RESOURCE_TYPE_SUPPLIER_ORDER =
      StoreResourceType._(
          4, _omitEnumNames ? '' : 'STORE_RESOURCE_TYPE_SUPPLIER_ORDER');

  /// / Can make all actions about store product.
  static const StoreResourceType STORE_RESOURCE_TYPE_PRODUCT =
      StoreResourceType._(
          5, _omitEnumNames ? '' : 'STORE_RESOURCE_TYPE_PRODUCT');

  static const $core.List<StoreResourceType> values = <StoreResourceType>[
    STORE_RESOURCE_TYPE_UNSPECIFIED,
    STORE_RESOURCE_TYPE_STORE,
    STORE_RESOURCE_TYPE_INVOICE,
    STORE_RESOURCE_TYPE_ORDER,
    STORE_RESOURCE_TYPE_SUPPLIER_ORDER,
    STORE_RESOURCE_TYPE_PRODUCT,
  ];

  static final $core.List<StoreResourceType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static StoreResourceType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const StoreResourceType._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
