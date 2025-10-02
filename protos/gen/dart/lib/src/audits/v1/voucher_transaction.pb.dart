// This is a generated file - do not edit.
//
// Generated from audits/v1/voucher_transaction.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
///  VoucherTransaction tracks each time a voucher is used.
///
///  Example:
///    transaction_id: "VT-001"
///    voucher_id: "GV-2025-001"
///    related_invoice_id: "INV-2025-005"
///    amount_used: 50000
///    remaining_after: 50000
class VoucherTransaction extends $pb.GeneratedMessage {
  factory VoucherTransaction({
    $core.String? documentId,
    $core.String? voucherId,
    $core.String? relatedInvoiceId,
    $core.String? relatedReceiptId,
    $core.double? amountUsed,
    $core.double? remainingAfter,
    $0.Timestamp? usedAt,
    $core.String? usedByUserId,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (voucherId != null) result.voucherId = voucherId;
    if (relatedInvoiceId != null) result.relatedInvoiceId = relatedInvoiceId;
    if (relatedReceiptId != null) result.relatedReceiptId = relatedReceiptId;
    if (amountUsed != null) result.amountUsed = amountUsed;
    if (remainingAfter != null) result.remainingAfter = remainingAfter;
    if (usedAt != null) result.usedAt = usedAt;
    if (usedByUserId != null) result.usedByUserId = usedByUserId;
    return result;
  }

  VoucherTransaction._();

  factory VoucherTransaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory VoucherTransaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'VoucherTransaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'audits.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'voucherId')
    ..aOS(3, _omitFieldNames ? '' : 'relatedInvoiceId')
    ..aOS(4, _omitFieldNames ? '' : 'relatedReceiptId')
    ..a<$core.double>(
        5, _omitFieldNames ? '' : 'amountUsed', $pb.PbFieldType.OD)
    ..a<$core.double>(
        6, _omitFieldNames ? '' : 'remainingAfter', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'usedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(8, _omitFieldNames ? '' : 'usedByUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoucherTransaction clone() => VoucherTransaction()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  VoucherTransaction copyWith(void Function(VoucherTransaction) updates) =>
      super.copyWith((message) => updates(message as VoucherTransaction))
          as VoucherTransaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static VoucherTransaction create() => VoucherTransaction._();
  @$core.override
  VoucherTransaction createEmptyInstance() => create();
  static $pb.PbList<VoucherTransaction> createRepeated() =>
      $pb.PbList<VoucherTransaction>();
  @$core.pragma('dart2js:noInline')
  static VoucherTransaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<VoucherTransaction>(create);
  static VoucherTransaction? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get voucherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set voucherId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVoucherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoucherId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get relatedInvoiceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set relatedInvoiceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRelatedInvoiceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRelatedInvoiceId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get relatedReceiptId => $_getSZ(3);
  @$pb.TagNumber(4)
  set relatedReceiptId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRelatedReceiptId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelatedReceiptId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get amountUsed => $_getN(4);
  @$pb.TagNumber(5)
  set amountUsed($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmountUsed() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmountUsed() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get remainingAfter => $_getN(5);
  @$pb.TagNumber(6)
  set remainingAfter($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRemainingAfter() => $_has(5);
  @$pb.TagNumber(6)
  void clearRemainingAfter() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get usedAt => $_getN(6);
  @$pb.TagNumber(7)
  set usedAt($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUsedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUsedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureUsedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get usedByUserId => $_getSZ(7);
  @$pb.TagNumber(8)
  set usedByUserId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasUsedByUserId() => $_has(7);
  @$pb.TagNumber(8)
  void clearUsedByUserId() => $_clearField(8);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
