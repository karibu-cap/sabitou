// This is a generated file - do not edit.
//
// Generated from financial/v1/invoice.proto.

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
import 'financial_utils.pb.dart' as $0;
import 'invoice.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'invoice.pbenum.dart';

/// *
///  Invoice (Facture)
///  The official accounting document for a sale or purchase.
///  Created AFTER goods are delivered (usually).
///
///  Fix: InvoiceLineItem now includes optional batch_id for traceability.
///
///  For SALES: You issue to customer
///  For PURCHASES: You receive from supplier
///
///  Example SALES invoice:
///    invoice_id: "INV-2025-001"
///    invoice_type: INVOICE_TYPE_SALES
///    issuer_id: "CMP-001" (your company)
///    recipient_id: "CMP-003" (customer)
///    related_sales_order_id: "SO-2025-001"
///    related_delivery_note_id: "DN-2025-001"
///    items: [10x PRD-001 @ 450000]
///    subtotal: 4500000
///    tax_amount: 900000 (20% VAT)
///    total_amount: 5400000
///    status: INVOICE_STATUS_UNPAID
///
///  INVENTORY IMPACT: None (already moved by DeliveryNote)
class Invoice extends $pb.GeneratedMessage {
  factory Invoice({
    $core.String? documentId,
    InvoiceType? invoiceType,
    $core.String? issuerId,
    $core.String? recipientId,
    $core.String? relatedSalesOrderId,
    $core.String? relatedPurchaseOrderId,
    $core.String? relatedDeliveryNoteId,
    InvoiceStatus? status,
    $core.Iterable<$0.InvoiceLineItem>? items,
    $fixnum.Int64? subtotal,
    $fixnum.Int64? taxAmount,
    $fixnum.Int64? totalAmount,
    $core.String? currency,
    $1.Timestamp? issueDate,
    $1.Timestamp? dueDate,
    $core.String? createdByUserId,
    $1.Timestamp? createdAt,
    $core.Iterable<$core.String>? paymentIds,
    $core.String? notes,
    $core.String? paymentTerms,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (invoiceType != null) result.invoiceType = invoiceType;
    if (issuerId != null) result.issuerId = issuerId;
    if (recipientId != null) result.recipientId = recipientId;
    if (relatedSalesOrderId != null)
      result.relatedSalesOrderId = relatedSalesOrderId;
    if (relatedPurchaseOrderId != null)
      result.relatedPurchaseOrderId = relatedPurchaseOrderId;
    if (relatedDeliveryNoteId != null)
      result.relatedDeliveryNoteId = relatedDeliveryNoteId;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (subtotal != null) result.subtotal = subtotal;
    if (taxAmount != null) result.taxAmount = taxAmount;
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (currency != null) result.currency = currency;
    if (issueDate != null) result.issueDate = issueDate;
    if (dueDate != null) result.dueDate = dueDate;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (createdAt != null) result.createdAt = createdAt;
    if (paymentIds != null) result.paymentIds.addAll(paymentIds);
    if (notes != null) result.notes = notes;
    if (paymentTerms != null) result.paymentTerms = paymentTerms;
    return result;
  }

  Invoice._();

  factory Invoice.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Invoice.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Invoice',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'financial.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aE<InvoiceType>(2, _omitFieldNames ? '' : 'invoiceType',
        enumValues: InvoiceType.values)
    ..aOS(3, _omitFieldNames ? '' : 'issuerId')
    ..aOS(4, _omitFieldNames ? '' : 'recipientId')
    ..aOS(5, _omitFieldNames ? '' : 'relatedSalesOrderId')
    ..aOS(6, _omitFieldNames ? '' : 'relatedPurchaseOrderId')
    ..aOS(7, _omitFieldNames ? '' : 'relatedDeliveryNoteId')
    ..aE<InvoiceStatus>(8, _omitFieldNames ? '' : 'status',
        enumValues: InvoiceStatus.values)
    ..pPM<$0.InvoiceLineItem>(9, _omitFieldNames ? '' : 'items',
        subBuilder: $0.InvoiceLineItem.create)
    ..aInt64(10, _omitFieldNames ? '' : 'subtotal')
    ..aInt64(11, _omitFieldNames ? '' : 'taxAmount')
    ..aInt64(12, _omitFieldNames ? '' : 'totalAmount')
    ..aOS(13, _omitFieldNames ? '' : 'currency')
    ..aOM<$1.Timestamp>(14, _omitFieldNames ? '' : 'issueDate',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(15, _omitFieldNames ? '' : 'dueDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(16, _omitFieldNames ? '' : 'createdByUserId')
    ..aOM<$1.Timestamp>(17, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..pPS(18, _omitFieldNames ? '' : 'paymentIds')
    ..aOS(19, _omitFieldNames ? '' : 'notes')
    ..aOS(20, _omitFieldNames ? '' : 'paymentTerms')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Invoice clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Invoice copyWith(void Function(Invoice) updates) =>
      super.copyWith((message) => updates(message as Invoice)) as Invoice;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Invoice create() => Invoice._();
  @$core.override
  Invoice createEmptyInstance() => create();
  static $pb.PbList<Invoice> createRepeated() => $pb.PbList<Invoice>();
  @$core.pragma('dart2js:noInline')
  static Invoice getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Invoice>(create);
  static Invoice? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  InvoiceType get invoiceType => $_getN(1);
  @$pb.TagNumber(2)
  set invoiceType(InvoiceType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInvoiceType() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvoiceType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get issuerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set issuerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIssuerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssuerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get recipientId => $_getSZ(3);
  @$pb.TagNumber(4)
  set recipientId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRecipientId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRecipientId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get relatedSalesOrderId => $_getSZ(4);
  @$pb.TagNumber(5)
  set relatedSalesOrderId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRelatedSalesOrderId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelatedSalesOrderId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get relatedPurchaseOrderId => $_getSZ(5);
  @$pb.TagNumber(6)
  set relatedPurchaseOrderId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRelatedPurchaseOrderId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRelatedPurchaseOrderId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get relatedDeliveryNoteId => $_getSZ(6);
  @$pb.TagNumber(7)
  set relatedDeliveryNoteId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasRelatedDeliveryNoteId() => $_has(6);
  @$pb.TagNumber(7)
  void clearRelatedDeliveryNoteId() => $_clearField(7);

  @$pb.TagNumber(8)
  InvoiceStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(InvoiceStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $pb.PbList<$0.InvoiceLineItem> get items => $_getList(8);

  @$pb.TagNumber(10)
  $fixnum.Int64 get subtotal => $_getI64(9);
  @$pb.TagNumber(10)
  set subtotal($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasSubtotal() => $_has(9);
  @$pb.TagNumber(10)
  void clearSubtotal() => $_clearField(10);

  @$pb.TagNumber(11)
  $fixnum.Int64 get taxAmount => $_getI64(10);
  @$pb.TagNumber(11)
  set taxAmount($fixnum.Int64 value) => $_setInt64(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTaxAmount() => $_has(10);
  @$pb.TagNumber(11)
  void clearTaxAmount() => $_clearField(11);

  @$pb.TagNumber(12)
  $fixnum.Int64 get totalAmount => $_getI64(11);
  @$pb.TagNumber(12)
  set totalAmount($fixnum.Int64 value) => $_setInt64(11, value);
  @$pb.TagNumber(12)
  $core.bool hasTotalAmount() => $_has(11);
  @$pb.TagNumber(12)
  void clearTotalAmount() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get currency => $_getSZ(12);
  @$pb.TagNumber(13)
  set currency($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCurrency() => $_has(12);
  @$pb.TagNumber(13)
  void clearCurrency() => $_clearField(13);

  @$pb.TagNumber(14)
  $1.Timestamp get issueDate => $_getN(13);
  @$pb.TagNumber(14)
  set issueDate($1.Timestamp value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasIssueDate() => $_has(13);
  @$pb.TagNumber(14)
  void clearIssueDate() => $_clearField(14);
  @$pb.TagNumber(14)
  $1.Timestamp ensureIssueDate() => $_ensure(13);

  @$pb.TagNumber(15)
  $1.Timestamp get dueDate => $_getN(14);
  @$pb.TagNumber(15)
  set dueDate($1.Timestamp value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasDueDate() => $_has(14);
  @$pb.TagNumber(15)
  void clearDueDate() => $_clearField(15);
  @$pb.TagNumber(15)
  $1.Timestamp ensureDueDate() => $_ensure(14);

  @$pb.TagNumber(16)
  $core.String get createdByUserId => $_getSZ(15);
  @$pb.TagNumber(16)
  set createdByUserId($core.String value) => $_setString(15, value);
  @$pb.TagNumber(16)
  $core.bool hasCreatedByUserId() => $_has(15);
  @$pb.TagNumber(16)
  void clearCreatedByUserId() => $_clearField(16);

  @$pb.TagNumber(17)
  $1.Timestamp get createdAt => $_getN(16);
  @$pb.TagNumber(17)
  set createdAt($1.Timestamp value) => $_setField(17, value);
  @$pb.TagNumber(17)
  $core.bool hasCreatedAt() => $_has(16);
  @$pb.TagNumber(17)
  void clearCreatedAt() => $_clearField(17);
  @$pb.TagNumber(17)
  $1.Timestamp ensureCreatedAt() => $_ensure(16);

  @$pb.TagNumber(18)
  $pb.PbList<$core.String> get paymentIds => $_getList(17);

  @$pb.TagNumber(19)
  $core.String get notes => $_getSZ(18);
  @$pb.TagNumber(19)
  set notes($core.String value) => $_setString(18, value);
  @$pb.TagNumber(19)
  $core.bool hasNotes() => $_has(18);
  @$pb.TagNumber(19)
  void clearNotes() => $_clearField(19);

  @$pb.TagNumber(20)
  $core.String get paymentTerms => $_getSZ(19);
  @$pb.TagNumber(20)
  set paymentTerms($core.String value) => $_setString(19, value);
  @$pb.TagNumber(20)
  $core.bool hasPaymentTerms() => $_has(19);
  @$pb.TagNumber(20)
  void clearPaymentTerms() => $_clearField(20);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
