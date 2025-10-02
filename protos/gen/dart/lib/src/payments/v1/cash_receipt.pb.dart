// This is a generated file - do not edit.
//
// Generated from payments/v1/cash_receipt.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../financial/v1/financial_utils.pb.dart' as $0;
import '../../google/protobuf/timestamp.pb.dart' as $1;
import 'gift_voucher.pb.dart' as $3;
import 'payments.pb.dart' as $2;

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
    $core.double? subtotal,
    $core.double? taxAmount,
    $core.double? totalAmount,
    $core.double? amountPaid,
    $core.double? changeGiven,
    $core.String? currency,
    $core.Iterable<$core.String>? paymentIds,
    $1.Timestamp? transactionTime,
    $core.String? notes,
    $core.String? voucherIssued,
    $core.double? owedToCustomer,
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
    if (voucherIssued != null) result.voucherIssued = voucherIssued;
    if (owedToCustomer != null) result.owedToCustomer = owedToCustomer;
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
    ..a<$core.double>(6, _omitFieldNames ? '' : 'subtotal', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'taxAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(
        8, _omitFieldNames ? '' : 'totalAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(
        9, _omitFieldNames ? '' : 'amountPaid', $pb.PbFieldType.OD)
    ..a<$core.double>(
        10, _omitFieldNames ? '' : 'changeGiven', $pb.PbFieldType.OD)
    ..aOS(11, _omitFieldNames ? '' : 'currency')
    ..pPS(12, _omitFieldNames ? '' : 'paymentIds')
    ..aOM<$1.Timestamp>(13, _omitFieldNames ? '' : 'transactionTime',
        subBuilder: $1.Timestamp.create)
    ..aOS(14, _omitFieldNames ? '' : 'notes')
    ..aOS(15, _omitFieldNames ? '' : 'voucherIssued')
    ..a<$core.double>(
        16, _omitFieldNames ? '' : 'owedToCustomer', $pb.PbFieldType.OD)
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
  $core.double get subtotal => $_getN(5);
  @$pb.TagNumber(6)
  set subtotal($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasSubtotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearSubtotal() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.double get taxAmount => $_getN(6);
  @$pb.TagNumber(7)
  set taxAmount($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTaxAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearTaxAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get totalAmount => $_getN(7);
  @$pb.TagNumber(8)
  set totalAmount($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalAmount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.double get amountPaid => $_getN(8);
  @$pb.TagNumber(9)
  set amountPaid($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasAmountPaid() => $_has(8);
  @$pb.TagNumber(9)
  void clearAmountPaid() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get changeGiven => $_getN(9);
  @$pb.TagNumber(10)
  set changeGiven($core.double value) => $_setDouble(9, value);
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

  @$pb.TagNumber(15)
  $core.String get voucherIssued => $_getSZ(14);
  @$pb.TagNumber(15)
  set voucherIssued($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasVoucherIssued() => $_has(14);
  @$pb.TagNumber(15)
  void clearVoucherIssued() => $_clearField(15);

  @$pb.TagNumber(16)
  $core.double get owedToCustomer => $_getN(15);
  @$pb.TagNumber(16)
  set owedToCustomer($core.double value) => $_setDouble(15, value);
  @$pb.TagNumber(16)
  $core.bool hasOwedToCustomer() => $_has(15);
  @$pb.TagNumber(16)
  void clearOwedToCustomer() => $_clearField(16);
}

class CreateCashReceiptRequest extends $pb.GeneratedMessage {
  factory CreateCashReceiptRequest({
    CashReceipt? receipt,
    $core.Iterable<$2.Payment>? payments,
    $core.bool? issueVoucherOnChange,
  }) {
    final result = create();
    if (receipt != null) result.receipt = receipt;
    if (payments != null) result.payments.addAll(payments);
    if (issueVoucherOnChange != null)
      result.issueVoucherOnChange = issueVoucherOnChange;
    return result;
  }

  CreateCashReceiptRequest._();

  factory CreateCashReceiptRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCashReceiptRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCashReceiptRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOM<CashReceipt>(1, _omitFieldNames ? '' : 'receipt',
        subBuilder: CashReceipt.create)
    ..pc<$2.Payment>(2, _omitFieldNames ? '' : 'payments', $pb.PbFieldType.PM,
        subBuilder: $2.Payment.create)
    ..aOB(3, _omitFieldNames ? '' : 'issueVoucherOnChange')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCashReceiptRequest clone() =>
      CreateCashReceiptRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCashReceiptRequest copyWith(
          void Function(CreateCashReceiptRequest) updates) =>
      super.copyWith((message) => updates(message as CreateCashReceiptRequest))
          as CreateCashReceiptRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCashReceiptRequest create() => CreateCashReceiptRequest._();
  @$core.override
  CreateCashReceiptRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCashReceiptRequest> createRepeated() =>
      $pb.PbList<CreateCashReceiptRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCashReceiptRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCashReceiptRequest>(create);
  static CreateCashReceiptRequest? _defaultInstance;

  /// The partial cash receipt to create.
  @$pb.TagNumber(1)
  CashReceipt get receipt => $_getN(0);
  @$pb.TagNumber(1)
  set receipt(CashReceipt value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReceipt() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceipt() => $_clearField(1);
  @$pb.TagNumber(1)
  CashReceipt ensureReceipt() => $_ensure(0);

  /// The partial payment use by the client.
  @$pb.TagNumber(2)
  $pb.PbList<$2.Payment> get payments => $_getList(1);

  /// Issue voucher on change
  /// If true and change_given > 0, issue a voucher instead of cash
  @$pb.TagNumber(3)
  $core.bool get issueVoucherOnChange => $_getBF(2);
  @$pb.TagNumber(3)
  set issueVoucherOnChange($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIssueVoucherOnChange() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssueVoucherOnChange() => $_clearField(3);
}

class CreateCashReceiptResponse extends $pb.GeneratedMessage {
  factory CreateCashReceiptResponse({
    $core.bool? success,
    $3.GiftVoucher? voucher,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (voucher != null) result.voucher = voucher;
    return result;
  }

  CreateCashReceiptResponse._();

  factory CreateCashReceiptResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCashReceiptResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCashReceiptResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOM<$3.GiftVoucher>(2, _omitFieldNames ? '' : 'voucher',
        subBuilder: $3.GiftVoucher.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCashReceiptResponse clone() =>
      CreateCashReceiptResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCashReceiptResponse copyWith(
          void Function(CreateCashReceiptResponse) updates) =>
      super.copyWith((message) => updates(message as CreateCashReceiptResponse))
          as CreateCashReceiptResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCashReceiptResponse create() => CreateCashReceiptResponse._();
  @$core.override
  CreateCashReceiptResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCashReceiptResponse> createRepeated() =>
      $pb.PbList<CreateCashReceiptResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCashReceiptResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCashReceiptResponse>(create);
  static CreateCashReceiptResponse? _defaultInstance;

  /// The created cash receipt.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.GiftVoucher get voucher => $_getN(1);
  @$pb.TagNumber(2)
  set voucher($3.GiftVoucher value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasVoucher() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoucher() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.GiftVoucher ensureVoucher() => $_ensure(1);
}

class CashReceiptServiceApi {
  final $pb.RpcClient _client;

  CashReceiptServiceApi(this._client);

  /// Create a cash receipt (most common - 95% of transactions)
  $async.Future<CreateCashReceiptResponse> createCashReceipt(
          $pb.ClientContext? ctx, CreateCashReceiptRequest request) =>
      _client.invoke<CreateCashReceiptResponse>(ctx, 'CashReceiptService',
          'CreateCashReceipt', request, CreateCashReceiptResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
