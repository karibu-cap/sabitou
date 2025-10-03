// This is a generated file - do not edit.
//
// Generated from logistic/v1/receiving_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class ReceivingNoteStatus extends $pb.ProtobufEnum {
  static const ReceivingNoteStatus RN_STATUS_UNSPECIFIED =
      ReceivingNoteStatus._(0, _omitEnumNames ? '' : 'RN_STATUS_UNSPECIFIED');
  static const ReceivingNoteStatus RN_STATUS_PENDING =
      ReceivingNoteStatus._(1, _omitEnumNames ? '' : 'RN_STATUS_PENDING');
  static const ReceivingNoteStatus RN_STATUS_COMPLETED =
      ReceivingNoteStatus._(2, _omitEnumNames ? '' : 'RN_STATUS_COMPLETED');
  static const ReceivingNoteStatus RN_STATUS_REJECTED =
      ReceivingNoteStatus._(3, _omitEnumNames ? '' : 'RN_STATUS_REJECTED');

  static const $core.List<ReceivingNoteStatus> values = <ReceivingNoteStatus>[
    RN_STATUS_UNSPECIFIED,
    RN_STATUS_PENDING,
    RN_STATUS_COMPLETED,
    RN_STATUS_REJECTED,
  ];

  static final $core.List<ReceivingNoteStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static ReceivingNoteStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const ReceivingNoteStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
