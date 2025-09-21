// This is a generated file - do not edit.
//
// Generated from sync/v1/sync.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

/// Enum for sync operation types
class SyncOperationType extends $pb.ProtobufEnum {
  /// Unknown operation type
  static const SyncOperationType SYNC_OPERATION_TYPE_UNSPECIFIED =
      SyncOperationType._(
          0, _omitEnumNames ? '' : 'SYNC_OPERATION_TYPE_UNSPECIFIED');

  /// Create operation
  static const SyncOperationType SYNC_OPERATION_TYPE_CREATE =
      SyncOperationType._(
          1, _omitEnumNames ? '' : 'SYNC_OPERATION_TYPE_CREATE');

  /// Update operation
  static const SyncOperationType SYNC_OPERATION_TYPE_UPDATE =
      SyncOperationType._(
          2, _omitEnumNames ? '' : 'SYNC_OPERATION_TYPE_UPDATE');

  /// Delete operation
  static const SyncOperationType SYNC_OPERATION_TYPE_DELETE =
      SyncOperationType._(
          3, _omitEnumNames ? '' : 'SYNC_OPERATION_TYPE_DELETE');

  static const $core.List<SyncOperationType> values = <SyncOperationType>[
    SYNC_OPERATION_TYPE_UNSPECIFIED,
    SYNC_OPERATION_TYPE_CREATE,
    SYNC_OPERATION_TYPE_UPDATE,
    SYNC_OPERATION_TYPE_DELETE,
  ];

  static final $core.List<SyncOperationType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static SyncOperationType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SyncOperationType._(super.value, super.name);
}

/// Enum for sync entity types
class SyncEntityType extends $pb.ProtobufEnum {
  /// Unknown entity type
  static const SyncEntityType SYNC_ENTITY_TYPE_UNSPECIFIED =
      SyncEntityType._(0, _omitEnumNames ? '' : 'SYNC_ENTITY_TYPE_UNSPECIFIED');

  /// Order entity
  static const SyncEntityType SYNC_ENTITY_TYPE_ORDER =
      SyncEntityType._(1, _omitEnumNames ? '' : 'SYNC_ENTITY_TYPE_ORDER');

  static const $core.List<SyncEntityType> values = <SyncEntityType>[
    SYNC_ENTITY_TYPE_UNSPECIFIED,
    SYNC_ENTITY_TYPE_ORDER,
  ];

  static final $core.List<SyncEntityType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 1);
  static SyncEntityType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SyncEntityType._(super.value, super.name);
}

/// Enum for sync operation status
class SyncOperationStatus extends $pb.ProtobufEnum {
  /// Unknown status
  static const SyncOperationStatus SYNC_OPERATION_STATUS_UNSPECIFIED =
      SyncOperationStatus._(
          0, _omitEnumNames ? '' : 'SYNC_OPERATION_STATUS_UNSPECIFIED');

  /// Operation is pending
  static const SyncOperationStatus SYNC_OPERATION_STATUS_PENDING =
      SyncOperationStatus._(
          1, _omitEnumNames ? '' : 'SYNC_OPERATION_STATUS_PENDING');

  /// Operation is in progress
  static const SyncOperationStatus SYNC_OPERATION_STATUS_IN_PROGRESS =
      SyncOperationStatus._(
          2, _omitEnumNames ? '' : 'SYNC_OPERATION_STATUS_IN_PROGRESS');

  /// Operation completed successfully
  static const SyncOperationStatus SYNC_OPERATION_STATUS_SUCCESS =
      SyncOperationStatus._(
          3, _omitEnumNames ? '' : 'SYNC_OPERATION_STATUS_SUCCESS');

  /// Operation failed
  static const SyncOperationStatus SYNC_OPERATION_STATUS_FAILED =
      SyncOperationStatus._(
          4, _omitEnumNames ? '' : 'SYNC_OPERATION_STATUS_FAILED');

  /// Operation was retried
  static const SyncOperationStatus SYNC_OPERATION_STATUS_RETRYING =
      SyncOperationStatus._(
          5, _omitEnumNames ? '' : 'SYNC_OPERATION_STATUS_RETRYING');

  /// Operation exceeded max retries
  static const SyncOperationStatus SYNC_OPERATION_STATUS_ABANDONED =
      SyncOperationStatus._(
          6, _omitEnumNames ? '' : 'SYNC_OPERATION_STATUS_ABANDONED');

  static const $core.List<SyncOperationStatus> values = <SyncOperationStatus>[
    SYNC_OPERATION_STATUS_UNSPECIFIED,
    SYNC_OPERATION_STATUS_PENDING,
    SYNC_OPERATION_STATUS_IN_PROGRESS,
    SYNC_OPERATION_STATUS_SUCCESS,
    SYNC_OPERATION_STATUS_FAILED,
    SYNC_OPERATION_STATUS_RETRYING,
    SYNC_OPERATION_STATUS_ABANDONED,
  ];

  static final $core.List<SyncOperationStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 6);
  static SyncOperationStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const SyncOperationStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
