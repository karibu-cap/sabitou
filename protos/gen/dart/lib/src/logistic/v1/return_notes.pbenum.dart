// This is a generated file - do not edit.
//
// Generated from logistic/v1/return_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReturnType extends $pb.ProtobufEnum {
  static const ReturnType RETURN_TYPE_UNSPECIFIED =
      ReturnType._(0, _omitEnumNames ? '' : 'RETURN_TYPE_UNSPECIFIED');
  static const ReturnType RETURN_TYPE_CUSTOMER_TO_SELLER =
      ReturnType._(1, _omitEnumNames ? '' : 'RETURN_TYPE_CUSTOMER_TO_SELLER');
  static const ReturnType RETURN_TYPE_SELLER_TO_SUPPLIER =
      ReturnType._(2, _omitEnumNames ? '' : 'RETURN_TYPE_SELLER_TO_SUPPLIER');

  static const $core.List<ReturnType> values = <ReturnType>[
    RETURN_TYPE_UNSPECIFIED,
    RETURN_TYPE_CUSTOMER_TO_SELLER,
    RETURN_TYPE_SELLER_TO_SUPPLIER,
  ];

  static final $core.List<ReturnType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 2);
  static ReturnType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReturnType._(super.value, super.name);
}

class ReturnNoteStatus extends $pb.ProtobufEnum {
  static const ReturnNoteStatus RETURN_STATUS_UNSPECIFIED =
      ReturnNoteStatus._(0, _omitEnumNames ? '' : 'RETURN_STATUS_UNSPECIFIED');
  static const ReturnNoteStatus RETURN_STATUS_PENDING =
      ReturnNoteStatus._(1, _omitEnumNames ? '' : 'RETURN_STATUS_PENDING');
  static const ReturnNoteStatus RETURN_STATUS_APPROVED =
      ReturnNoteStatus._(2, _omitEnumNames ? '' : 'RETURN_STATUS_APPROVED');
  static const ReturnNoteStatus RETURN_STATUS_IN_TRANSIT =
      ReturnNoteStatus._(3, _omitEnumNames ? '' : 'RETURN_STATUS_IN_TRANSIT');
  static const ReturnNoteStatus RETURN_STATUS_RECEIVED =
      ReturnNoteStatus._(4, _omitEnumNames ? '' : 'RETURN_STATUS_RECEIVED');
  static const ReturnNoteStatus RETURN_STATUS_REJECTED =
      ReturnNoteStatus._(5, _omitEnumNames ? '' : 'RETURN_STATUS_REJECTED');

  static const $core.List<ReturnNoteStatus> values = <ReturnNoteStatus>[
    RETURN_STATUS_UNSPECIFIED,
    RETURN_STATUS_PENDING,
    RETURN_STATUS_APPROVED,
    RETURN_STATUS_IN_TRANSIT,
    RETURN_STATUS_RECEIVED,
    RETURN_STATUS_REJECTED,
  ];

  static final $core.List<ReturnNoteStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static ReturnNoteStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReturnNoteStatus._(super.value, super.name);
}

class ReturnCondition extends $pb.ProtobufEnum {
  static const ReturnCondition RETURN_CONDITION_UNSPECIFIED = ReturnCondition._(
      0, _omitEnumNames ? '' : 'RETURN_CONDITION_UNSPECIFIED');
  static const ReturnCondition RETURN_CONDITION_NEW =
      ReturnCondition._(1, _omitEnumNames ? '' : 'RETURN_CONDITION_NEW');
  static const ReturnCondition RETURN_CONDITION_USED_GOOD =
      ReturnCondition._(2, _omitEnumNames ? '' : 'RETURN_CONDITION_USED_GOOD');
  static const ReturnCondition RETURN_CONDITION_DAMAGED =
      ReturnCondition._(3, _omitEnumNames ? '' : 'RETURN_CONDITION_DAMAGED');
  static const ReturnCondition RETURN_CONDITION_DEFECTIVE =
      ReturnCondition._(4, _omitEnumNames ? '' : 'RETURN_CONDITION_DEFECTIVE');

  static const $core.List<ReturnCondition> values = <ReturnCondition>[
    RETURN_CONDITION_UNSPECIFIED,
    RETURN_CONDITION_NEW,
    RETURN_CONDITION_USED_GOOD,
    RETURN_CONDITION_DAMAGED,
    RETURN_CONDITION_DEFECTIVE,
  ];

  static final $core.List<ReturnCondition?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static ReturnCondition? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReturnCondition._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
