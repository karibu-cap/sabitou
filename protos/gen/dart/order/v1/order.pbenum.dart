//
//  Generated code. Do not modify.
//  source: order/v1/order.proto
//
// @dart = 2.12

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names, library_prefixes
// ignore_for_file: non_constant_identifier_names, prefer_final_fields
// ignore_for_file: unnecessary_import, unnecessary_this, unused_import

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class Status extends $pb.ProtobufEnum {
  static const Status STATUS_UNSPECIFIED = Status._(0, _omitEnumNames ? '' : 'STATUS_UNSPECIFIED');
  static const Status STATUS_PENDING = Status._(1, _omitEnumNames ? '' : 'STATUS_PENDING');
  static const Status STATUS_PROCESSING = Status._(2, _omitEnumNames ? '' : 'STATUS_PROCESSING');
  static const Status STATUS_COMPLETED = Status._(3, _omitEnumNames ? '' : 'STATUS_COMPLETED');
  static const Status STATUS_CANCELLED = Status._(4, _omitEnumNames ? '' : 'STATUS_CANCELLED');

  static const $core.List<Status> values = <Status> [
    STATUS_UNSPECIFIED,
    STATUS_PENDING,
    STATUS_PROCESSING,
    STATUS_COMPLETED,
    STATUS_CANCELLED,
  ];

  static final $core.Map<$core.int, Status> _byValue = $pb.ProtobufEnum.initByValue(values);
  static Status? valueOf($core.int value) => _byValue[value];

  const Status._($core.int v, $core.String n) : super(v, n);
}

class ResourceType extends $pb.ProtobufEnum {
  static const ResourceType RESOURCE_TYPE_UNSPECIFIED = ResourceType._(0, _omitEnumNames ? '' : 'RESOURCE_TYPE_UNSPECIFIED');
  static const ResourceType RESOURCE_TYPE_INTERNAL_STORE = ResourceType._(1, _omitEnumNames ? '' : 'RESOURCE_TYPE_INTERNAL_STORE');
  static const ResourceType RESOURCE_TYPE_SUPPLIER_STORE = ResourceType._(2, _omitEnumNames ? '' : 'RESOURCE_TYPE_SUPPLIER_STORE');

  static const $core.List<ResourceType> values = <ResourceType> [
    RESOURCE_TYPE_UNSPECIFIED,
    RESOURCE_TYPE_INTERNAL_STORE,
    RESOURCE_TYPE_SUPPLIER_STORE,
  ];

  static final $core.Map<$core.int, ResourceType> _byValue = $pb.ProtobufEnum.initByValue(values);
  static ResourceType? valueOf($core.int value) => _byValue[value];

  const ResourceType._($core.int v, $core.String n) : super(v, n);
}


const _omitEnumNames = $core.bool.fromEnvironment('protobuf.omit_enum_names');
