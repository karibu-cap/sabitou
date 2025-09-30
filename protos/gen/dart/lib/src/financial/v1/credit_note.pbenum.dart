// This is a generated file - do not edit.
//
// Generated from financial/v1/credit_note.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

class CreditNoteType extends $pb.ProtobufEnum {
  static const CreditNoteType CREDIT_TYPE_UNSPECIFIED =
      CreditNoteType._(0, _omitEnumNames ? '' : 'CREDIT_TYPE_UNSPECIFIED');
  static const CreditNoteType CREDIT_TYPE_RETURN =
      CreditNoteType._(1, _omitEnumNames ? '' : 'CREDIT_TYPE_RETURN');
  static const CreditNoteType CREDIT_TYPE_PRICE_ERROR =
      CreditNoteType._(2, _omitEnumNames ? '' : 'CREDIT_TYPE_PRICE_ERROR');
  static const CreditNoteType CREDIT_TYPE_DISCOUNT =
      CreditNoteType._(3, _omitEnumNames ? '' : 'CREDIT_TYPE_DISCOUNT');
  static const CreditNoteType CREDIT_TYPE_CANCELLATION =
      CreditNoteType._(4, _omitEnumNames ? '' : 'CREDIT_TYPE_CANCELLATION');
  static const CreditNoteType CREDIT_TYPE_DAMAGED_GOODS =
      CreditNoteType._(5, _omitEnumNames ? '' : 'CREDIT_TYPE_DAMAGED_GOODS');

  static const $core.List<CreditNoteType> values = <CreditNoteType>[
    CREDIT_TYPE_UNSPECIFIED,
    CREDIT_TYPE_RETURN,
    CREDIT_TYPE_PRICE_ERROR,
    CREDIT_TYPE_DISCOUNT,
    CREDIT_TYPE_CANCELLATION,
    CREDIT_TYPE_DAMAGED_GOODS,
  ];

  static final $core.List<CreditNoteType?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 5);
  static CreditNoteType? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CreditNoteType._(super.value, super.name);
}

class CreditNoteStatus extends $pb.ProtobufEnum {
  static const CreditNoteStatus CN_STATUS_UNSPECIFIED =
      CreditNoteStatus._(0, _omitEnumNames ? '' : 'CN_STATUS_UNSPECIFIED');
  static const CreditNoteStatus CN_STATUS_DRAFT =
      CreditNoteStatus._(1, _omitEnumNames ? '' : 'CN_STATUS_DRAFT');
  static const CreditNoteStatus CN_STATUS_ISSUED =
      CreditNoteStatus._(2, _omitEnumNames ? '' : 'CN_STATUS_ISSUED');
  static const CreditNoteStatus CN_STATUS_APPLIED =
      CreditNoteStatus._(3, _omitEnumNames ? '' : 'CN_STATUS_APPLIED');

  static const $core.List<CreditNoteStatus> values = <CreditNoteStatus>[
    CN_STATUS_UNSPECIFIED,
    CN_STATUS_DRAFT,
    CN_STATUS_ISSUED,
    CN_STATUS_APPLIED,
  ];

  static final $core.List<CreditNoteStatus?> _byValue =
      $pb.ProtobufEnum.$_initByValueList(values, 3);
  static CreditNoteStatus? valueOf($core.int value) =>
      value < 0 || value >= _byValue.length ? null : _byValue[value];

  const CreditNoteStatus._(super.value, super.name);
}

const $core.bool _omitEnumNames =
    $core.bool.fromEnvironment('protobuf.omit_enum_names');
