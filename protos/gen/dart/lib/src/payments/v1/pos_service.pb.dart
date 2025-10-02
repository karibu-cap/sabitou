// This is a generated file - do not edit.
//
// Generated from payments/v1/pos_service.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../financial/v1/invoice.pb.dart' as $1;
import '../../google/protobuf/timestamp.pb.dart' as $4;
import 'cash_receipt.pb.dart' as $0;
import 'gift_voucher.pb.dart' as $3;
import 'payment_utils.pbenum.dart' as $5;
import 'payments.pb.dart' as $2;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

class CreateCashReceiptRequest extends $pb.GeneratedMessage {
  factory CreateCashReceiptRequest({
    $core.String? cashierUserId,
    $core.String? storeId,
    $core.String? customerId,
    $core.Iterable<SaleLineItem>? items,
    $fixnum.Int64? amountPaid,
    $5.PaymentMethod? paymentMethod,
    $core.String? notes,
  }) {
    final result = create();
    if (cashierUserId != null) result.cashierUserId = cashierUserId;
    if (storeId != null) result.storeId = storeId;
    if (customerId != null) result.customerId = customerId;
    if (items != null) result.items.addAll(items);
    if (amountPaid != null) result.amountPaid = amountPaid;
    if (paymentMethod != null) result.paymentMethod = paymentMethod;
    if (notes != null) result.notes = notes;
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
    ..aOS(1, _omitFieldNames ? '' : 'cashierUserId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOS(3, _omitFieldNames ? '' : 'customerId')
    ..pPM<SaleLineItem>(4, _omitFieldNames ? '' : 'items',
        subBuilder: SaleLineItem.create)
    ..aInt64(5, _omitFieldNames ? '' : 'amountPaid')
    ..aE<$5.PaymentMethod>(6, _omitFieldNames ? '' : 'paymentMethod',
        enumValues: $5.PaymentMethod.values)
    ..aOS(7, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCashReceiptRequest clone() => deepCopy();
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

  @$pb.TagNumber(1)
  $core.String get cashierUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cashierUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCashierUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCashierUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get customerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set customerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<SaleLineItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get amountPaid => $_getI64(4);
  @$pb.TagNumber(5)
  set amountPaid($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmountPaid() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmountPaid() => $_clearField(5);

  @$pb.TagNumber(6)
  $5.PaymentMethod get paymentMethod => $_getN(5);
  @$pb.TagNumber(6)
  set paymentMethod($5.PaymentMethod value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPaymentMethod() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaymentMethod() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => $_clearField(7);
}

class SaleLineItem extends $pb.GeneratedMessage {
  factory SaleLineItem({
    $core.String? productId,
    $core.double? quantity,
    $fixnum.Int64? unitPrice,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (quantity != null) result.quantity = quantity;
    if (unitPrice != null) result.unitPrice = unitPrice;
    return result;
  }

  SaleLineItem._();

  factory SaleLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaleLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaleLineItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aD(2, _omitFieldNames ? '' : 'quantity')
    ..aInt64(3, _omitFieldNames ? '' : 'unitPrice')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaleLineItem clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaleLineItem copyWith(void Function(SaleLineItem) updates) =>
      super.copyWith((message) => updates(message as SaleLineItem))
          as SaleLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaleLineItem create() => SaleLineItem._();
  @$core.override
  SaleLineItem createEmptyInstance() => create();
  static $pb.PbList<SaleLineItem> createRepeated() =>
      $pb.PbList<SaleLineItem>();
  @$core.pragma('dart2js:noInline')
  static SaleLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SaleLineItem>(create);
  static SaleLineItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get quantity => $_getN(1);
  @$pb.TagNumber(2)
  set quantity($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get unitPrice => $_getI64(2);
  @$pb.TagNumber(3)
  set unitPrice($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnitPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnitPrice() => $_clearField(3);
}

class CreateCashReceiptResponse extends $pb.GeneratedMessage {
  factory CreateCashReceiptResponse({
    $core.String? receiptId,
    $0.CashReceipt? receipt,
    $fixnum.Int64? changeGiven,
    $core.Iterable<$core.String>? inventoryTransactionIds,
    $core.String? message,
  }) {
    final result = create();
    if (receiptId != null) result.receiptId = receiptId;
    if (receipt != null) result.receipt = receipt;
    if (changeGiven != null) result.changeGiven = changeGiven;
    if (inventoryTransactionIds != null)
      result.inventoryTransactionIds.addAll(inventoryTransactionIds);
    if (message != null) result.message = message;
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
    ..aOS(1, _omitFieldNames ? '' : 'receiptId')
    ..aOM<$0.CashReceipt>(2, _omitFieldNames ? '' : 'receipt',
        subBuilder: $0.CashReceipt.create)
    ..aInt64(3, _omitFieldNames ? '' : 'changeGiven')
    ..pPS(4, _omitFieldNames ? '' : 'inventoryTransactionIds')
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCashReceiptResponse clone() => deepCopy();
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

  @$pb.TagNumber(1)
  $core.String get receiptId => $_getSZ(0);
  @$pb.TagNumber(1)
  set receiptId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiptId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiptId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.CashReceipt get receipt => $_getN(1);
  @$pb.TagNumber(2)
  set receipt($0.CashReceipt value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReceipt() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceipt() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CashReceipt ensureReceipt() => $_ensure(1);

  @$pb.TagNumber(3)
  $fixnum.Int64 get changeGiven => $_getI64(2);
  @$pb.TagNumber(3)
  set changeGiven($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasChangeGiven() => $_has(2);
  @$pb.TagNumber(3)
  void clearChangeGiven() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get inventoryTransactionIds => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => $_clearField(5);
}

class ProcessSaleWithVoucherRequest extends $pb.GeneratedMessage {
  factory ProcessSaleWithVoucherRequest({
    $core.String? cashierUserId,
    $core.String? storeId,
    $core.String? customerId,
    $core.Iterable<SaleLineItem>? items,
    $fixnum.Int64? amountPaid,
    $5.PaymentMethod? paymentMethod,
    $fixnum.Int64? changeShortage,
    $core.String? notes,
  }) {
    final result = create();
    if (cashierUserId != null) result.cashierUserId = cashierUserId;
    if (storeId != null) result.storeId = storeId;
    if (customerId != null) result.customerId = customerId;
    if (items != null) result.items.addAll(items);
    if (amountPaid != null) result.amountPaid = amountPaid;
    if (paymentMethod != null) result.paymentMethod = paymentMethod;
    if (changeShortage != null) result.changeShortage = changeShortage;
    if (notes != null) result.notes = notes;
    return result;
  }

  ProcessSaleWithVoucherRequest._();

  factory ProcessSaleWithVoucherRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProcessSaleWithVoucherRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProcessSaleWithVoucherRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cashierUserId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOS(3, _omitFieldNames ? '' : 'customerId')
    ..pPM<SaleLineItem>(4, _omitFieldNames ? '' : 'items',
        subBuilder: SaleLineItem.create)
    ..aInt64(5, _omitFieldNames ? '' : 'amountPaid')
    ..aE<$5.PaymentMethod>(6, _omitFieldNames ? '' : 'paymentMethod',
        enumValues: $5.PaymentMethod.values)
    ..aInt64(7, _omitFieldNames ? '' : 'changeShortage')
    ..aOS(8, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessSaleWithVoucherRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessSaleWithVoucherRequest copyWith(
          void Function(ProcessSaleWithVoucherRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ProcessSaleWithVoucherRequest))
          as ProcessSaleWithVoucherRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcessSaleWithVoucherRequest create() =>
      ProcessSaleWithVoucherRequest._();
  @$core.override
  ProcessSaleWithVoucherRequest createEmptyInstance() => create();
  static $pb.PbList<ProcessSaleWithVoucherRequest> createRepeated() =>
      $pb.PbList<ProcessSaleWithVoucherRequest>();
  @$core.pragma('dart2js:noInline')
  static ProcessSaleWithVoucherRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProcessSaleWithVoucherRequest>(create);
  static ProcessSaleWithVoucherRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cashierUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cashierUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCashierUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCashierUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get customerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set customerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCustomerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCustomerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<SaleLineItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get amountPaid => $_getI64(4);
  @$pb.TagNumber(5)
  set amountPaid($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmountPaid() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmountPaid() => $_clearField(5);

  @$pb.TagNumber(6)
  $5.PaymentMethod get paymentMethod => $_getN(5);
  @$pb.TagNumber(6)
  set paymentMethod($5.PaymentMethod value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasPaymentMethod() => $_has(5);
  @$pb.TagNumber(6)
  void clearPaymentMethod() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get changeShortage => $_getI64(6);
  @$pb.TagNumber(7)
  set changeShortage($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasChangeShortage() => $_has(6);
  @$pb.TagNumber(7)
  void clearChangeShortage() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get notes => $_getSZ(7);
  @$pb.TagNumber(8)
  set notes($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasNotes() => $_has(7);
  @$pb.TagNumber(8)
  void clearNotes() => $_clearField(8);
}

class ProcessSaleWithVoucherResponse extends $pb.GeneratedMessage {
  factory ProcessSaleWithVoucherResponse({
    $core.String? invoiceId,
    $1.Invoice? invoice,
    $core.String? paymentId,
    $2.Payment? payment,
    $core.String? voucherId,
    $3.GiftVoucher? voucher,
    $core.String? voucherCode,
    $core.Iterable<$core.String>? inventoryTransactionIds,
    $core.String? message,
  }) {
    final result = create();
    if (invoiceId != null) result.invoiceId = invoiceId;
    if (invoice != null) result.invoice = invoice;
    if (paymentId != null) result.paymentId = paymentId;
    if (payment != null) result.payment = payment;
    if (voucherId != null) result.voucherId = voucherId;
    if (voucher != null) result.voucher = voucher;
    if (voucherCode != null) result.voucherCode = voucherCode;
    if (inventoryTransactionIds != null)
      result.inventoryTransactionIds.addAll(inventoryTransactionIds);
    if (message != null) result.message = message;
    return result;
  }

  ProcessSaleWithVoucherResponse._();

  factory ProcessSaleWithVoucherResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProcessSaleWithVoucherResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProcessSaleWithVoucherResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'invoiceId')
    ..aOM<$1.Invoice>(2, _omitFieldNames ? '' : 'invoice',
        subBuilder: $1.Invoice.create)
    ..aOS(3, _omitFieldNames ? '' : 'paymentId')
    ..aOM<$2.Payment>(4, _omitFieldNames ? '' : 'payment',
        subBuilder: $2.Payment.create)
    ..aOS(5, _omitFieldNames ? '' : 'voucherId')
    ..aOM<$3.GiftVoucher>(6, _omitFieldNames ? '' : 'voucher',
        subBuilder: $3.GiftVoucher.create)
    ..aOS(7, _omitFieldNames ? '' : 'voucherCode')
    ..pPS(8, _omitFieldNames ? '' : 'inventoryTransactionIds')
    ..aOS(9, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessSaleWithVoucherResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessSaleWithVoucherResponse copyWith(
          void Function(ProcessSaleWithVoucherResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ProcessSaleWithVoucherResponse))
          as ProcessSaleWithVoucherResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcessSaleWithVoucherResponse create() =>
      ProcessSaleWithVoucherResponse._();
  @$core.override
  ProcessSaleWithVoucherResponse createEmptyInstance() => create();
  static $pb.PbList<ProcessSaleWithVoucherResponse> createRepeated() =>
      $pb.PbList<ProcessSaleWithVoucherResponse>();
  @$core.pragma('dart2js:noInline')
  static ProcessSaleWithVoucherResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProcessSaleWithVoucherResponse>(create);
  static ProcessSaleWithVoucherResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get invoiceId => $_getSZ(0);
  @$pb.TagNumber(1)
  set invoiceId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasInvoiceId() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvoiceId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.Invoice get invoice => $_getN(1);
  @$pb.TagNumber(2)
  set invoice($1.Invoice value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInvoice() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvoice() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Invoice ensureInvoice() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get paymentId => $_getSZ(2);
  @$pb.TagNumber(3)
  set paymentId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasPaymentId() => $_has(2);
  @$pb.TagNumber(3)
  void clearPaymentId() => $_clearField(3);

  @$pb.TagNumber(4)
  $2.Payment get payment => $_getN(3);
  @$pb.TagNumber(4)
  set payment($2.Payment value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasPayment() => $_has(3);
  @$pb.TagNumber(4)
  void clearPayment() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.Payment ensurePayment() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.String get voucherId => $_getSZ(4);
  @$pb.TagNumber(5)
  set voucherId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVoucherId() => $_has(4);
  @$pb.TagNumber(5)
  void clearVoucherId() => $_clearField(5);

  @$pb.TagNumber(6)
  $3.GiftVoucher get voucher => $_getN(5);
  @$pb.TagNumber(6)
  set voucher($3.GiftVoucher value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasVoucher() => $_has(5);
  @$pb.TagNumber(6)
  void clearVoucher() => $_clearField(6);
  @$pb.TagNumber(6)
  $3.GiftVoucher ensureVoucher() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get voucherCode => $_getSZ(6);
  @$pb.TagNumber(7)
  set voucherCode($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVoucherCode() => $_has(6);
  @$pb.TagNumber(7)
  void clearVoucherCode() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<$core.String> get inventoryTransactionIds => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get message => $_getSZ(8);
  @$pb.TagNumber(9)
  set message($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasMessage() => $_has(8);
  @$pb.TagNumber(9)
  void clearMessage() => $_clearField(9);
}

class PayWithVoucherRequest extends $pb.GeneratedMessage {
  factory PayWithVoucherRequest({
    $core.String? cashierUserId,
    $core.String? storeId,
    $core.String? voucherCode,
    $core.Iterable<SaleLineItem>? items,
    $fixnum.Int64? additionalCashPayment,
    $5.PaymentMethod? additionalPaymentMethod,
  }) {
    final result = create();
    if (cashierUserId != null) result.cashierUserId = cashierUserId;
    if (storeId != null) result.storeId = storeId;
    if (voucherCode != null) result.voucherCode = voucherCode;
    if (items != null) result.items.addAll(items);
    if (additionalCashPayment != null)
      result.additionalCashPayment = additionalCashPayment;
    if (additionalPaymentMethod != null)
      result.additionalPaymentMethod = additionalPaymentMethod;
    return result;
  }

  PayWithVoucherRequest._();

  factory PayWithVoucherRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayWithVoucherRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayWithVoucherRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cashierUserId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOS(3, _omitFieldNames ? '' : 'voucherCode')
    ..pPM<SaleLineItem>(4, _omitFieldNames ? '' : 'items',
        subBuilder: SaleLineItem.create)
    ..aInt64(5, _omitFieldNames ? '' : 'additionalCashPayment')
    ..aE<$5.PaymentMethod>(6, _omitFieldNames ? '' : 'additionalPaymentMethod',
        enumValues: $5.PaymentMethod.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayWithVoucherRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayWithVoucherRequest copyWith(
          void Function(PayWithVoucherRequest) updates) =>
      super.copyWith((message) => updates(message as PayWithVoucherRequest))
          as PayWithVoucherRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayWithVoucherRequest create() => PayWithVoucherRequest._();
  @$core.override
  PayWithVoucherRequest createEmptyInstance() => create();
  static $pb.PbList<PayWithVoucherRequest> createRepeated() =>
      $pb.PbList<PayWithVoucherRequest>();
  @$core.pragma('dart2js:noInline')
  static PayWithVoucherRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayWithVoucherRequest>(create);
  static PayWithVoucherRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cashierUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cashierUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCashierUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCashierUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get voucherCode => $_getSZ(2);
  @$pb.TagNumber(3)
  set voucherCode($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVoucherCode() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoucherCode() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<SaleLineItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get additionalCashPayment => $_getI64(4);
  @$pb.TagNumber(5)
  set additionalCashPayment($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAdditionalCashPayment() => $_has(4);
  @$pb.TagNumber(5)
  void clearAdditionalCashPayment() => $_clearField(5);

  @$pb.TagNumber(6)
  $5.PaymentMethod get additionalPaymentMethod => $_getN(5);
  @$pb.TagNumber(6)
  set additionalPaymentMethod($5.PaymentMethod value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasAdditionalPaymentMethod() => $_has(5);
  @$pb.TagNumber(6)
  void clearAdditionalPaymentMethod() => $_clearField(6);
}

class PayWithVoucherResponse extends $pb.GeneratedMessage {
  factory PayWithVoucherResponse({
    $core.String? receiptId,
    $0.CashReceipt? receipt,
    $core.String? voucherTransactionId,
    $3.VoucherTransaction? voucherTransaction,
    $fixnum.Int64? voucherAmountUsed,
    $fixnum.Int64? voucherRemaining,
    $core.bool? voucherFullyUsed,
    $core.String? message,
  }) {
    final result = create();
    if (receiptId != null) result.receiptId = receiptId;
    if (receipt != null) result.receipt = receipt;
    if (voucherTransactionId != null)
      result.voucherTransactionId = voucherTransactionId;
    if (voucherTransaction != null)
      result.voucherTransaction = voucherTransaction;
    if (voucherAmountUsed != null) result.voucherAmountUsed = voucherAmountUsed;
    if (voucherRemaining != null) result.voucherRemaining = voucherRemaining;
    if (voucherFullyUsed != null) result.voucherFullyUsed = voucherFullyUsed;
    if (message != null) result.message = message;
    return result;
  }

  PayWithVoucherResponse._();

  factory PayWithVoucherResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PayWithVoucherResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PayWithVoucherResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'receiptId')
    ..aOM<$0.CashReceipt>(2, _omitFieldNames ? '' : 'receipt',
        subBuilder: $0.CashReceipt.create)
    ..aOS(3, _omitFieldNames ? '' : 'voucherTransactionId')
    ..aOM<$3.VoucherTransaction>(4, _omitFieldNames ? '' : 'voucherTransaction',
        subBuilder: $3.VoucherTransaction.create)
    ..aInt64(5, _omitFieldNames ? '' : 'voucherAmountUsed')
    ..aInt64(6, _omitFieldNames ? '' : 'voucherRemaining')
    ..aOB(7, _omitFieldNames ? '' : 'voucherFullyUsed')
    ..aOS(8, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayWithVoucherResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PayWithVoucherResponse copyWith(
          void Function(PayWithVoucherResponse) updates) =>
      super.copyWith((message) => updates(message as PayWithVoucherResponse))
          as PayWithVoucherResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PayWithVoucherResponse create() => PayWithVoucherResponse._();
  @$core.override
  PayWithVoucherResponse createEmptyInstance() => create();
  static $pb.PbList<PayWithVoucherResponse> createRepeated() =>
      $pb.PbList<PayWithVoucherResponse>();
  @$core.pragma('dart2js:noInline')
  static PayWithVoucherResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PayWithVoucherResponse>(create);
  static PayWithVoucherResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get receiptId => $_getSZ(0);
  @$pb.TagNumber(1)
  set receiptId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReceiptId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceiptId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.CashReceipt get receipt => $_getN(1);
  @$pb.TagNumber(2)
  set receipt($0.CashReceipt value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReceipt() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceipt() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.CashReceipt ensureReceipt() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get voucherTransactionId => $_getSZ(2);
  @$pb.TagNumber(3)
  set voucherTransactionId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasVoucherTransactionId() => $_has(2);
  @$pb.TagNumber(3)
  void clearVoucherTransactionId() => $_clearField(3);

  @$pb.TagNumber(4)
  $3.VoucherTransaction get voucherTransaction => $_getN(3);
  @$pb.TagNumber(4)
  set voucherTransaction($3.VoucherTransaction value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasVoucherTransaction() => $_has(3);
  @$pb.TagNumber(4)
  void clearVoucherTransaction() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.VoucherTransaction ensureVoucherTransaction() => $_ensure(3);

  @$pb.TagNumber(5)
  $fixnum.Int64 get voucherAmountUsed => $_getI64(4);
  @$pb.TagNumber(5)
  set voucherAmountUsed($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasVoucherAmountUsed() => $_has(4);
  @$pb.TagNumber(5)
  void clearVoucherAmountUsed() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get voucherRemaining => $_getI64(5);
  @$pb.TagNumber(6)
  set voucherRemaining($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasVoucherRemaining() => $_has(5);
  @$pb.TagNumber(6)
  void clearVoucherRemaining() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.bool get voucherFullyUsed => $_getBF(6);
  @$pb.TagNumber(7)
  set voucherFullyUsed($core.bool value) => $_setBool(6, value);
  @$pb.TagNumber(7)
  $core.bool hasVoucherFullyUsed() => $_has(6);
  @$pb.TagNumber(7)
  void clearVoucherFullyUsed() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get message => $_getSZ(7);
  @$pb.TagNumber(8)
  set message($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMessage() => $_has(7);
  @$pb.TagNumber(8)
  void clearMessage() => $_clearField(8);
}

class GetCashierDailySummaryRequest extends $pb.GeneratedMessage {
  factory GetCashierDailySummaryRequest({
    $core.String? cashierUserId,
    $4.Timestamp? date,
  }) {
    final result = create();
    if (cashierUserId != null) result.cashierUserId = cashierUserId;
    if (date != null) result.date = date;
    return result;
  }

  GetCashierDailySummaryRequest._();

  factory GetCashierDailySummaryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCashierDailySummaryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCashierDailySummaryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cashierUserId')
    ..aOM<$4.Timestamp>(2, _omitFieldNames ? '' : 'date',
        subBuilder: $4.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCashierDailySummaryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCashierDailySummaryRequest copyWith(
          void Function(GetCashierDailySummaryRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetCashierDailySummaryRequest))
          as GetCashierDailySummaryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCashierDailySummaryRequest create() =>
      GetCashierDailySummaryRequest._();
  @$core.override
  GetCashierDailySummaryRequest createEmptyInstance() => create();
  static $pb.PbList<GetCashierDailySummaryRequest> createRepeated() =>
      $pb.PbList<GetCashierDailySummaryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetCashierDailySummaryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCashierDailySummaryRequest>(create);
  static GetCashierDailySummaryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cashierUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cashierUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCashierUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCashierUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $4.Timestamp get date => $_getN(1);
  @$pb.TagNumber(2)
  set date($4.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $4.Timestamp ensureDate() => $_ensure(1);
}

class GetCashierDailySummaryResponse extends $pb.GeneratedMessage {
  factory GetCashierDailySummaryResponse({
    $core.String? cashierUserId,
    $4.Timestamp? date,
    $core.int? totalTransactions,
    $fixnum.Int64? totalSalesAmount,
    $fixnum.Int64? totalCashCollected,
    $fixnum.Int64? totalCardPayments,
    $fixnum.Int64? totalMobileMoney,
    $fixnum.Int64? totalVouchersIssued,
    $fixnum.Int64? totalVouchersRedeemed,
    $core.Iterable<$0.CashReceipt>? receipts,
  }) {
    final result = create();
    if (cashierUserId != null) result.cashierUserId = cashierUserId;
    if (date != null) result.date = date;
    if (totalTransactions != null) result.totalTransactions = totalTransactions;
    if (totalSalesAmount != null) result.totalSalesAmount = totalSalesAmount;
    if (totalCashCollected != null)
      result.totalCashCollected = totalCashCollected;
    if (totalCardPayments != null) result.totalCardPayments = totalCardPayments;
    if (totalMobileMoney != null) result.totalMobileMoney = totalMobileMoney;
    if (totalVouchersIssued != null)
      result.totalVouchersIssued = totalVouchersIssued;
    if (totalVouchersRedeemed != null)
      result.totalVouchersRedeemed = totalVouchersRedeemed;
    if (receipts != null) result.receipts.addAll(receipts);
    return result;
  }

  GetCashierDailySummaryResponse._();

  factory GetCashierDailySummaryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetCashierDailySummaryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetCashierDailySummaryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cashierUserId')
    ..aOM<$4.Timestamp>(2, _omitFieldNames ? '' : 'date',
        subBuilder: $4.Timestamp.create)
    ..aI(3, _omitFieldNames ? '' : 'totalTransactions')
    ..aInt64(4, _omitFieldNames ? '' : 'totalSalesAmount')
    ..aInt64(5, _omitFieldNames ? '' : 'totalCashCollected')
    ..aInt64(6, _omitFieldNames ? '' : 'totalCardPayments')
    ..aInt64(7, _omitFieldNames ? '' : 'totalMobileMoney')
    ..aInt64(8, _omitFieldNames ? '' : 'totalVouchersIssued')
    ..aInt64(9, _omitFieldNames ? '' : 'totalVouchersRedeemed')
    ..pPM<$0.CashReceipt>(10, _omitFieldNames ? '' : 'receipts',
        subBuilder: $0.CashReceipt.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCashierDailySummaryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetCashierDailySummaryResponse copyWith(
          void Function(GetCashierDailySummaryResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetCashierDailySummaryResponse))
          as GetCashierDailySummaryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetCashierDailySummaryResponse create() =>
      GetCashierDailySummaryResponse._();
  @$core.override
  GetCashierDailySummaryResponse createEmptyInstance() => create();
  static $pb.PbList<GetCashierDailySummaryResponse> createRepeated() =>
      $pb.PbList<GetCashierDailySummaryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetCashierDailySummaryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetCashierDailySummaryResponse>(create);
  static GetCashierDailySummaryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cashierUserId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cashierUserId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCashierUserId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCashierUserId() => $_clearField(1);

  @$pb.TagNumber(2)
  $4.Timestamp get date => $_getN(1);
  @$pb.TagNumber(2)
  set date($4.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $4.Timestamp ensureDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.int get totalTransactions => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalTransactions($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalTransactions() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalTransactions() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalSalesAmount => $_getI64(3);
  @$pb.TagNumber(4)
  set totalSalesAmount($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalSalesAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalSalesAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get totalCashCollected => $_getI64(4);
  @$pb.TagNumber(5)
  set totalCashCollected($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotalCashCollected() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotalCashCollected() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get totalCardPayments => $_getI64(5);
  @$pb.TagNumber(6)
  set totalCardPayments($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalCardPayments() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalCardPayments() => $_clearField(6);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalMobileMoney => $_getI64(6);
  @$pb.TagNumber(7)
  set totalMobileMoney($fixnum.Int64 value) => $_setInt64(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalMobileMoney() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalMobileMoney() => $_clearField(7);

  @$pb.TagNumber(8)
  $fixnum.Int64 get totalVouchersIssued => $_getI64(7);
  @$pb.TagNumber(8)
  set totalVouchersIssued($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTotalVouchersIssued() => $_has(7);
  @$pb.TagNumber(8)
  void clearTotalVouchersIssued() => $_clearField(8);

  @$pb.TagNumber(9)
  $fixnum.Int64 get totalVouchersRedeemed => $_getI64(8);
  @$pb.TagNumber(9)
  set totalVouchersRedeemed($fixnum.Int64 value) => $_setInt64(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTotalVouchersRedeemed() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotalVouchersRedeemed() => $_clearField(9);

  @$pb.TagNumber(10)
  $pb.PbList<$0.CashReceipt> get receipts => $_getList(9);
}

class PointOfSaleServiceApi {
  final $pb.RpcClient _client;

  PointOfSaleServiceApi(this._client);

  /// Create a cash receipt (most common - 95% of transactions)
  $async.Future<CreateCashReceiptResponse> createCashReceipt(
          $pb.ClientContext? ctx, CreateCashReceiptRequest request) =>
      _client.invoke<CreateCashReceiptResponse>(ctx, 'PointOfSaleService',
          'CreateCashReceipt', request, CreateCashReceiptResponse());

  /// Handle insufficient change scenario (create invoice + gift voucher)
  $async.Future<ProcessSaleWithVoucherResponse> processSaleWithVoucher(
          $pb.ClientContext? ctx, ProcessSaleWithVoucherRequest request) =>
      _client.invoke<ProcessSaleWithVoucherResponse>(ctx, 'PointOfSaleService',
          'ProcessSaleWithVoucher', request, ProcessSaleWithVoucherResponse());

  /// Use gift voucher in payment
  $async.Future<PayWithVoucherResponse> payWithVoucher(
          $pb.ClientContext? ctx, PayWithVoucherRequest request) =>
      _client.invoke<PayWithVoucherResponse>(ctx, 'PointOfSaleService',
          'PayWithVoucher', request, PayWithVoucherResponse());

  /// Get daily sales summary for a cashier
  $async.Future<GetCashierDailySummaryResponse> getCashierDailySummary(
          $pb.ClientContext? ctx, GetCashierDailySummaryRequest request) =>
      _client.invoke<GetCashierDailySummaryResponse>(ctx, 'PointOfSaleService',
          'GetCashierDailySummary', request, GetCashierDailySummaryResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
