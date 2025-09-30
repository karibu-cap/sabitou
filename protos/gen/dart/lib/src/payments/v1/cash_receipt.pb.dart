// This is a generated file - do not edit.
//
// Generated from payments/v1/cash_receipt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../financial/v1/financial_utils.pb.dart' as $0;
import '../../google/protobuf/timestamp.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
///  CashReceipt (Bon de Caisse)
///  Issued at point of sale for immediate payment.
///  Combines invoice + payment proof in one document.
///  Common in retail where customer pays immediately.
///
///  Fix: Items include batch_id for lot-specific sales (e.g., FIFO for perishables).
///
///  Example - Retail store sale:
///    receipt_id: "CASH-2025-001"
///    cashier_user_id: "USR-005"
///    customer_id: "CMP-003" (can be null for walk-in)
///    store_id: "WH-002" (retail store)
///    items: [1x PRD-001 @ 450000]
///    subtotal: 450000
///    tax: 90000
///    total: 540000
///    amount_paid: 540000
///    payment_method: PAYMENT_METHOD_CASH
///
///  INVENTORY IMPACT: -1 PRD-001 from WH-002
///  ACCOUNTING IMPACT: Immediate revenue + payment
class CashReceipt extends $pb.GeneratedMessage {
  factory CashReceipt({
    $core.String? documentId,
    $core.String? cashierUserId,
    $core.String? customerId,
    $core.String? storeId,
    $core.Iterable<$0.InvoiceLineItem>? items,
    $fixnum.Int64? subtotal,
    $fixnum.Int64? taxAmount,
    $fixnum.Int64? totalAmount,
    $fixnum.Int64? amountPaid,
    $fixnum.Int64? changeGiven,
    $core.String? currency,
    $core.Iterable<$core.String>? paymentIds,
    $1.Timestamp? transactionTime,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (cashierUserId != null) result.cashierUserId = cashierUserId;
    if (customerId != null) result.customerId = customerId;
    if (storeId != null) result.storeId = storeId;
    if (items != null) result.items.addAll(items);
    if (subtotal != null) result.subtotal = subtotal;
    if (taxAmount != null) result.taxAmount = taxAmount;
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (amountPaid != null) result.amountPaid = amountPaid;
    if (changeGiven != null) result.changeGiven = changeGiven;
    if (currency != null) result.currency = currency;
    if (paymentIds != null) result.paymentIds.addAll(paymentIds);
    if (transactionTime != null) result.transactionTime = transactionTime;
    if (notes != null) result.notes = notes;
    return result;
  }

  CashReceipt._();

  factory CashReceipt.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CashReceipt.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CashReceipt',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'cashierUserId')
    ..aOS(3, _omitFieldNames ? '' : 'customerId')
    ..aOS(4, _omitFieldNames ? '' : 'storeId')
    ..pc<$0.InvoiceLineItem>(
        5, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $0.InvoiceLineItem.create)
    ..aInt64(6, _omitFieldNames ? '' : 'subtotal')
    ..aInt64(7, _omitFieldNames ? '' : 'taxAmount')
    ..aInt64(8, _omitFieldNames ? '' : 'totalAmount')
    ..aInt64(9, _omitFieldNames ? '' : 'amountPaid')
    ..aInt64(10, _omitFieldNames ? '' : 'changeGiven')
    ..aOS(11, _omitFieldNames ? '' : 'currency')
    ..pPS(12, _omitFieldNames ? '' : 'paymentIds')
    ..aOM<$1.Timestamp>(13, _omitFieldNames ? '' : 'transactionTime',
        subBuilder: $1.Timestamp.create)
    ..aOS(14, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashReceipt clone() => CashReceipt()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CashReceipt copyWith(void Function(CashReceipt) updates) =>
      super.copyWith((message) => updates(message as CashReceipt))
          as CashReceipt;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CashReceipt create() => CashReceipt._();
  @$core.override
  CashReceipt createEmptyInstance() => create();
  static $pb.PbList<CashReceipt> createRepeated() => $pb.PbList<CashReceipt>();
  @$core.pragma('dart2js:noInline')
  static CashReceipt getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CashReceipt>(create);
  static CashReceipt? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get cashierUserId => $_getSZ(1);
  @$pb.TagNumber(2)
  set cashierUserId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCashierUserId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCashierUserId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get customerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set customerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get storeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set storeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStoreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreId() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$0.InvoiceLineItem> get items => $_getList(4);

  @$pb.TagNumber(6)
  $fixnum.Int64 get subtotal => $_getI64(5);
  @$pb.TagNumber(6)
  set subtotal($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSubtotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubtotal() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get taxAmount => $_getI64(6);
  @$pb.TagNumber(7)
  set taxAmount($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTaxAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearTaxAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalAmount => $_getI64(7);
  @$pb.TagNumber(8)
  set totalAmount($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalAmount() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get amountPaid => $_getI64(8);
  @$pb.TagNumber(9)
  set amountPaid($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAmountPaid() => $_has(8);
  @$pb.TagNumber(9)
  void clearAmountPaid() => $_clearField(9);

  @$pb.TagNumber(10)
  $fixnum.Int64 get changeGiven => $_getI64(9);
  @$pb.TagNumber(10)
  set changeGiven($fixnum.Int64 value) => $_setInt64(9, value);
  @$pb.TagNumber(10)
  $core.bool hasChangeGiven() => $_has(9);
  @$pb.TagNumber(10)
  void clearChangeGiven() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get currency => $_getSZ(10);
  @$pb.TagNumber(11)
  set currency($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCurrency() => $_has(10);
  @$pb.TagNumber(11)
  void clearCurrency() => $_clearField(11);

  @$pb.TagNumber(12)
  $pb.PbList<$core.String> get paymentIds => $_getList(11);

  @$pb.TagNumber(13)
  $1.Timestamp get transactionTime => $_getN(12);
  @$pb.TagNumber(13)
  set transactionTime($1.Timestamp value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasTransactionTime() => $_has(12);
  @$pb.TagNumber(13)
  void clearTransactionTime() => $_clearField(13);
  @$pb.TagNumber(13)
  $1.Timestamp ensureTransactionTime() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.String get notes => $_getSZ(13);
  @$pb.TagNumber(14)
  set notes($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasNotes() => $_has(13);
  @$pb.TagNumber(14)
  void clearNotes() => $_clearField(14);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
