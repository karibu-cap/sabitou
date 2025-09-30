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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $1;
import 'credit_note.pbenum.dart';
import 'financial_utils.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'credit_note.pbenum.dart';

/// *
///  CreditNote (Avoir / Bon d'Avoir)
///  Issued to cancel or reduce a previous invoice.
///  Can be for returns, errors, discounts, etc.
///
///  Fix: Items include batch_id if inventory impact involves specific lots.
///
///  Example - Customer returns damaged goods:
///    cn_id: "CN-2025-001"
///    related_invoice_id: "INV-2025-001"
///    credit_type: CREDIT_TYPE_RETURN
///    recipient_id: "CMP-003" (customer)
///    items: [2x PRD-001 @ 450000]
///    total_amount: -900000 (negative = credit)
///    has_inventory_impact: true
///
///  INVENTORY IMPACT (if has_inventory_impact = true):
///    +2 PRD-001 back to warehouse
///
///  ACCOUNTING IMPACT:
///    Customer now owes: 5400000 - 900000 = 4500000
class CreditNote extends $pb.GeneratedMessage {
  factory CreditNote({
    $core.String? documentId,
    $core.String? relatedInvoiceId,
    CreditNoteType? creditType,
    $core.String? issuerId,
    $core.String? recipientId,
    CreditNoteStatus? status,
    $core.Iterable<$0.InvoiceLineItem>? items,
    $fixnum.Int64? totalAmount,
    $core.String? currency,
    $core.bool? hasInventoryImpact,
    $core.String? relatedReturnNoteId,
    $1.Timestamp? issueDate,
    $core.String? createdByUserId,
    $core.String? reason,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (relatedInvoiceId != null) result.relatedInvoiceId = relatedInvoiceId;
    if (creditType != null) result.creditType = creditType;
    if (issuerId != null) result.issuerId = issuerId;
    if (recipientId != null) result.recipientId = recipientId;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (currency != null) result.currency = currency;
    if (hasInventoryImpact != null)
      result.hasInventoryImpact = hasInventoryImpact;
    if (relatedReturnNoteId != null)
      result.relatedReturnNoteId = relatedReturnNoteId;
    if (issueDate != null) result.issueDate = issueDate;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (reason != null) result.reason = reason;
    if (notes != null) result.notes = notes;
    return result;
  }

  CreditNote._();

  factory CreditNote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreditNote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreditNote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'financial.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedInvoiceId')
    ..e<CreditNoteType>(
        3, _omitFieldNames ? '' : 'creditType', $pb.PbFieldType.OE,
        defaultOrMaker: CreditNoteType.CREDIT_TYPE_UNSPECIFIED,
        valueOf: CreditNoteType.valueOf,
        enumValues: CreditNoteType.values)
    ..aOS(4, _omitFieldNames ? '' : 'issuerId')
    ..aOS(5, _omitFieldNames ? '' : 'recipientId')
    ..e<CreditNoteStatus>(
        6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: CreditNoteStatus.CN_STATUS_UNSPECIFIED,
        valueOf: CreditNoteStatus.valueOf,
        enumValues: CreditNoteStatus.values)
    ..pc<$0.InvoiceLineItem>(
        7, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $0.InvoiceLineItem.create)
    ..aInt64(8, _omitFieldNames ? '' : 'totalAmount')
    ..aOS(9, _omitFieldNames ? '' : 'currency')
    ..aOB(10, _omitFieldNames ? '' : 'hasInventoryImpact')
    ..aOS(11, _omitFieldNames ? '' : 'relatedReturnNoteId')
    ..aOM<$1.Timestamp>(12, _omitFieldNames ? '' : 'issueDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(13, _omitFieldNames ? '' : 'createdByUserId')
    ..aOS(14, _omitFieldNames ? '' : 'reason')
    ..aOS(15, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreditNote clone() => CreditNote()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreditNote copyWith(void Function(CreditNote) updates) =>
      super.copyWith((message) => updates(message as CreditNote)) as CreditNote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreditNote create() => CreditNote._();
  @$core.override
  CreditNote createEmptyInstance() => create();
  static $pb.PbList<CreditNote> createRepeated() => $pb.PbList<CreditNote>();
  @$core.pragma('dart2js:noInline')
  static CreditNote getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreditNote>(create);
  static CreditNote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get relatedInvoiceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set relatedInvoiceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRelatedInvoiceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelatedInvoiceId() => $_clearField(2);

  @$pb.TagNumber(3)
  CreditNoteType get creditType => $_getN(2);
  @$pb.TagNumber(3)
  set creditType(CreditNoteType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCreditType() => $_has(2);
  @$pb.TagNumber(3)
  void clearCreditType() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get issuerId => $_getSZ(3);
  @$pb.TagNumber(4)
  set issuerId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasIssuerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearIssuerId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get recipientId => $_getSZ(4);
  @$pb.TagNumber(5)
  set recipientId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRecipientId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRecipientId() => $_clearField(5);

  @$pb.TagNumber(6)
  CreditNoteStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(CreditNoteStatus value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<$0.InvoiceLineItem> get items => $_getList(6);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalAmount => $_getI64(7);
  @$pb.TagNumber(8)
  set totalAmount($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalAmount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get currency => $_getSZ(8);
  @$pb.TagNumber(9)
  set currency($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCurrency() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurrency() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.bool get hasInventoryImpact => $_getBF(9);
  @$pb.TagNumber(10)
  set hasInventoryImpact($core.bool value) => $_setBool(9, value);
  @$pb.TagNumber(10)
  $core.bool hasHasInventoryImpact() => $_has(9);
  @$pb.TagNumber(10)
  void clearHasInventoryImpact() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get relatedReturnNoteId => $_getSZ(10);
  @$pb.TagNumber(11)
  set relatedReturnNoteId($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasRelatedReturnNoteId() => $_has(10);
  @$pb.TagNumber(11)
  void clearRelatedReturnNoteId() => $_clearField(11);

  @$pb.TagNumber(12)
  $1.Timestamp get issueDate => $_getN(11);
  @$pb.TagNumber(12)
  set issueDate($1.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasIssueDate() => $_has(11);
  @$pb.TagNumber(12)
  void clearIssueDate() => $_clearField(12);
  @$pb.TagNumber(12)
  $1.Timestamp ensureIssueDate() => $_ensure(11);

  @$pb.TagNumber(13)
  $core.String get createdByUserId => $_getSZ(12);
  @$pb.TagNumber(13)
  set createdByUserId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCreatedByUserId() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreatedByUserId() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get reason => $_getSZ(13);
  @$pb.TagNumber(14)
  set reason($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasReason() => $_has(13);
  @$pb.TagNumber(14)
  void clearReason() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get notes => $_getSZ(14);
  @$pb.TagNumber(15)
  set notes($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasNotes() => $_has(14);
  @$pb.TagNumber(15)
  void clearNotes() => $_clearField(15);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
