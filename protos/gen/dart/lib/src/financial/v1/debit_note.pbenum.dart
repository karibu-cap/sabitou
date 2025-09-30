// This is a generated file - do not edit.
//
// Generated from financial/v1/debit_note.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class DebitNoteType extends $pb.ProtobufEnum {
  static const DebitNoteType DEBIT_TYPE_UNSPECIFIED =
      DebitNoteType._(0, _omitEnumNames ? '' : 'DEBIT_TYPE_UNSPECIFIED');
  static const DebitNoteType DEBIT_TYPE_RETURN =
      DebitNoteType._(1, _omitEnumNames ? '' : 'DEBIT_TYPE_RETURN');
  static const DebitNoteType DEBIT_TYPE_PRICE_DISPUTE =
      DebitNoteType._(2, _omitEnumNames ? '' : 'DEBIT_TYPE_PRICE_DISPUTE');
  static const DebitNoteType DEBIT_TYPE_QUALITY_ISSUE =
      DebitNoteType._(3, _omitEnumNames ? '' : 'DEBIT_TYPE_QUALITY_ISSUE');
  static const DebitNoteType DEBIT_TYPE_SHORTAGE =
      DebitNoteType._(4, _omitEnumNames ? '' : 'DEBIT_TYPE_SHORTAGE');

  static const $core.List<DebitNoteType> values = <DebitNoteType>[
    DEBIT_TYPE_UNSPECIFIED,
    DEBIT_TYPE_RETURN,
    DEBIT_TYPE_PRICE_DISPUTE,
    DEBIT_TYPE_QUALITY_ISSUE,
    DEBIT_TYPE_SHORTAGE,
  ];

  static final $core.List<DebitNoteType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static DebitNoteType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DebitNoteType._(super.value, super.name);
}

class DebitNoteStatus extends $pb.ProtobufEnum {
  static const DebitNoteStatus DEBIT_STATUS_UNSPECIFIED =
      DebitNoteStatus._(0, _omitEnumNames ? '' : 'DEBIT_STATUS_UNSPECIFIED');
  static const DebitNoteStatus DEBIT_STATUS_DRAFT =
      DebitNoteStatus._(1, _omitEnumNames ? '' : 'DEBIT_STATUS_DRAFT');
  static const DebitNoteStatus DEBIT_STATUS_ISSUED =
      DebitNoteStatus._(2, _omitEnumNames ? '' : 'DEBIT_STATUS_ISSUED');
  static const DebitNoteStatus DEBIT_STATUS_ACCEPTED =
      DebitNoteStatus._(3, _omitEnumNames ? '' : 'DEBIT_STATUS_ACCEPTED');
  static const DebitNoteStatus DEBIT_STATUS_DISPUTED =
      DebitNoteStatus._(4, _omitEnumNames ? '' : 'DEBIT_STATUS_DISPUTED');

  static const $core.List<DebitNoteStatus> values = <DebitNoteStatus>[
    DEBIT_STATUS_UNSPECIFIED,
    DEBIT_STATUS_DRAFT,
    DEBIT_STATUS_ISSUED,
    DEBIT_STATUS_ACCEPTED,
    DEBIT_STATUS_DISPUTED,
  ];

  static final $core.List<DebitNoteStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 4);
  static DebitNoteStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const DebitNoteStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
