// This is a generated file - do not edit.
//
// Generated from logistic/v1/delivery_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DeliveryNoteStatus extends $pb.ProtobufEnum {
  static const DeliveryNoteStatus DN_STATUS_UNSPECIFIED =
      DeliveryNoteStatus._(0, _omitEnumNames ? '' : 'DN_STATUS_UNSPECIFIED');
  static const DeliveryNoteStatus DN_STATUS_PREPARED =
      DeliveryNoteStatus._(1, _omitEnumNames ? '' : 'DN_STATUS_PREPARED');
  static const DeliveryNoteStatus DN_STATUS_IN_TRANSIT =
      DeliveryNoteStatus._(2, _omitEnumNames ? '' : 'DN_STATUS_IN_TRANSIT');
  static const DeliveryNoteStatus DN_STATUS_DELIVERED =
      DeliveryNoteStatus._(3, _omitEnumNames ? '' : 'DN_STATUS_DELIVERED');
  static const DeliveryNoteStatus DN_STATUS_RETURNED =
      DeliveryNoteStatus._(4, _omitEnumNames ? '' : 'DN_STATUS_RETURNED');

  static const $core.List<DeliveryNoteStatus> values = <DeliveryNoteStatus>[
    DN_STATUS_UNSPECIFIED,
    DN_STATUS_PREPARED,
    DN_STATUS_IN_TRANSIT,
    DN_STATUS_DELIVERED,
    DN_STATUS_RETURNED,
  ];

  static final $core.List<DeliveryNoteStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static DeliveryNoteStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DeliveryNoteStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
