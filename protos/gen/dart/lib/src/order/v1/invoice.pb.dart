// This is a generated file - do not edit.
//
// Generated from order/v1/invoice.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'invoice.pbenum.dart';
import 'order.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'invoice.pbenum.dart';

class Payment extends $pb.GeneratedMessage {
  factory Payment({
    $core.double? amount,
    PaymentMethod? method,
    $core.String? referenceId,
    $0.Timestamp? timestamp,
  }) {
    final result = create();
    if (amount != null) result.amount = amount;
    if (method != null) result.method = method;
    if (referenceId != null) result.referenceId = referenceId;
    if (timestamp != null) result.timestamp = timestamp;
    return result;
  }

  Payment._();

  factory Payment.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Payment.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Payment',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..a<$core.double>(1, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..e<PaymentMethod>(2, _omitFieldNames ? '' : 'method', $pb.PbFieldType.OE,
        defaultOrMaker: PaymentMethod.PAYMENT_METHOD_UNSPECIFIED,
        valueOf: PaymentMethod.valueOf,
        enumValues: PaymentMethod.values)
    ..aOS(3, _omitFieldNames ? '' : 'referenceId')
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'timestamp',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Payment clone() => Payment()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Payment copyWith(void Function(Payment) updates) =>
      super.copyWith((message) => updates(message as Payment)) as Payment;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Payment create() => Payment._();
  @$core.override
  Payment createEmptyInstance() => create();
  static $pb.PbList<Payment> createRepeated() => $pb.PbList<Payment>();
  @$core.pragma('dart2js:noInline')
  static Payment getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Payment>(create);
  static Payment? _defaultInstance;

  @$pb.TagNumber(1)
  $core.double get amount => $_getN(0);
  @$pb.TagNumber(1)
  set amount($core.double value) => $_setDouble(0, value);
  @$pb.TagNumber(1)
  $core.bool hasAmount() => $_has(0);
  @$pb.TagNumber(1)
  void clearAmount() => $_clearField(1);

  @$pb.TagNumber(2)
  PaymentMethod get method => $_getN(1);
  @$pb.TagNumber(2)
  set method(PaymentMethod value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasMethod() => $_has(1);
  @$pb.TagNumber(2)
  void clearMethod() => $_clearField(2);

  /// The reference id of the payment.
  /// For voucher, it is the voucher id.
  @$pb.TagNumber(3)
  $core.String get referenceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set referenceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReferenceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearReferenceId() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get timestamp => $_getN(3);
  @$pb.TagNumber(4)
  set timestamp($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasTimestamp() => $_has(3);
  @$pb.TagNumber(4)
  void clearTimestamp() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureTimestamp() => $_ensure(3);
}

/// The invoice of an order.
/// The invoice is a PDF file that can be downloaded by the customer.
/// It contains the order details, the customer details, the payment details.
class Invoice extends $pb.GeneratedMessage {
  factory Invoice({
    $core.String? refId,
    $core.String? orderId,
    InvoiceStatus? status,
    $core.Iterable<$1.OrderItem>? orderItems,
    $core.Iterable<Payment>? payments,
    $core.double? totalDiscount,
    $core.double? totalVat,
    $core.double? subtotal,
    $core.double? total,
    $core.double? customerTenderedAmount,
    $core.double? changeGiven,
    $core.double? balanceDue,
    $core.String? voucherId,
    $0.Timestamp? createdAt,
    $0.Timestamp? deliveryDate,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (orderId != null) result.orderId = orderId;
    if (status != null) result.status = status;
    if (orderItems != null) result.orderItems.addAll(orderItems);
    if (payments != null) result.payments.addAll(payments);
    if (totalDiscount != null) result.totalDiscount = totalDiscount;
    if (totalVat != null) result.totalVat = totalVat;
    if (subtotal != null) result.subtotal = subtotal;
    if (total != null) result.total = total;
    if (customerTenderedAmount != null)
      result.customerTenderedAmount = customerTenderedAmount;
    if (changeGiven != null) result.changeGiven = changeGiven;
    if (balanceDue != null) result.balanceDue = balanceDue;
    if (voucherId != null) result.voucherId = voucherId;
    if (createdAt != null) result.createdAt = createdAt;
    if (deliveryDate != null) result.deliveryDate = deliveryDate;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'orderId')
    ..e<InvoiceStatus>(3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: InvoiceStatus.INVOICE_STATUS_UNSPECIFIED,
        valueOf: InvoiceStatus.valueOf,
        enumValues: InvoiceStatus.values)
    ..pc<$1.OrderItem>(
        4, _omitFieldNames ? '' : 'orderItems', $pb.PbFieldType.PM,
        subBuilder: $1.OrderItem.create)
    ..pc<Payment>(5, _omitFieldNames ? '' : 'payments', $pb.PbFieldType.PM,
        subBuilder: Payment.create)
    ..a<$core.double>(
        6, _omitFieldNames ? '' : 'totalDiscount', $pb.PbFieldType.OD)
    ..a<$core.double>(7, _omitFieldNames ? '' : 'totalVat', $pb.PbFieldType.OD)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'subtotal', $pb.PbFieldType.OD)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OD)
    ..a<$core.double>(
        10, _omitFieldNames ? '' : 'customerTenderedAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(
        11, _omitFieldNames ? '' : 'changeGiven', $pb.PbFieldType.OD)
    ..a<$core.double>(
        12, _omitFieldNames ? '' : 'balanceDue', $pb.PbFieldType.OD)
    ..aOS(13, _omitFieldNames ? '' : 'voucherId')
    ..aOM<$0.Timestamp>(14, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(15, _omitFieldNames ? '' : 'deliveryDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Invoice clone() => Invoice()..mergeFromMessage(this);
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

  /// The unique identifier of the invoice.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The unique identifier of the order.
  @$pb.TagNumber(2)
  $core.String get orderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderId() => $_clearField(2);

  /// The status of the invoice.
  @$pb.TagNumber(3)
  InvoiceStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(InvoiceStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  /// The list of items in the invoice.
  @$pb.TagNumber(4)
  $pb.PbList<$1.OrderItem> get orderItems => $_getList(3);

  /// The payment methods used to pay the invoice.
  /// Some time, user can use multiple payment methods to pay the invoice.
  @$pb.TagNumber(5)
  $pb.PbList<Payment> get payments => $_getList(4);

  /// Total discounts applied (e.g., promotions)
  @$pb.TagNumber(6)
  $core.double get totalDiscount => $_getN(5);
  @$pb.TagNumber(6)
  set totalDiscount($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotalDiscount() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotalDiscount() => $_clearField(6);

  /// Total tax/VAT amount
  /// Example: 300.0 (e.g., 5% VAT on 6000 XAF subtotal, assuming no discount: 6000 * 0.05 = 300 XAF)
  @$pb.TagNumber(7)
  $core.double get totalVat => $_getN(6);
  @$pb.TagNumber(7)
  set totalVat($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalVat() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalVat() => $_clearField(7);

  /// Amount hors taxe: pre-tax, pre-discount total from order_items
  /// Example: 6000.0 (e.g., from the 3 items at 2000 XAF each: 3 * 2000 = 6000 XAF)
  @$pb.TagNumber(8)
  $core.double get subtotal => $_getN(7);
  @$pb.TagNumber(8)
  set subtotal($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSubtotal() => $_has(7);
  @$pb.TagNumber(8)
  void clearSubtotal() => $_clearField(8);

  /// Amount with tax: subtotal - total_discount + total_vat
  /// Example: 5801.0 (e.g., subtotal 6000 - discount 500 + VAT 300= 5801 XAF)
  @$pb.TagNumber(9)
  $core.double get total => $_getN(8);
  @$pb.TagNumber(9)
  set total($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTotal() => $_has(8);
  @$pb.TagNumber(9)
  void clearTotal() => $_clearField(9);

  /// Amount given by client (e.g., cash tendered).
  /// Example: 10000.0 (e.g., customer hands over 10000 XAF cash for a 6000 XAF total)
  @$pb.TagNumber(10)
  $core.double get customerTenderedAmount => $_getN(9);
  @$pb.TagNumber(10)
  set customerTenderedAmount($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCustomerTenderedAmount() => $_has(9);
  @$pb.TagNumber(10)
  void clearCustomerTenderedAmount() => $_clearField(10);

  /// Amount refunded to client (e.g., change or overpayment refund) Set to 0 for pending cases.
  /// Example: 4000.0 (e.g., immediate cash refund for overpayment: 10000 tendered - 6000 grand_total = 4000 XAF given back)
  @$pb.TagNumber(11)
  $core.double get changeGiven => $_getN(10);
  @$pb.TagNumber(11)
  set changeGiven($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasChangeGiven() => $_has(10);
  @$pb.TagNumber(11)
  void clearChangeGiven() => $_clearField(11);

  /// Unpaid balance: grand_total - paid_amount (covers remaining_to_pay)
  /// Example: -4000.0 (e.g., after paying 10000 XAF on a 6000 XAF total: 6000 - 10000 = -4000 XAF, meaning 4000 XAF owed to customer)
  @$pb.TagNumber(12)
  $core.double get balanceDue => $_getN(11);
  @$pb.TagNumber(12)
  set balanceDue($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasBalanceDue() => $_has(11);
  @$pb.TagNumber(12)
  void clearBalanceDue() => $_clearField(12);

  /// The voucher used to pay the invoice.
  @$pb.TagNumber(13)
  $core.String get voucherId => $_getSZ(12);
  @$pb.TagNumber(13)
  set voucherId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasVoucherId() => $_has(12);
  @$pb.TagNumber(13)
  void clearVoucherId() => $_clearField(13);

  /// The date and time the invoice was created.
  @$pb.TagNumber(14)
  $0.Timestamp get createdAt => $_getN(13);
  @$pb.TagNumber(14)
  set createdAt($0.Timestamp value) => $_setField(14, value);
  @$pb.TagNumber(14)
  $core.bool hasCreatedAt() => $_has(13);
  @$pb.TagNumber(14)
  void clearCreatedAt() => $_clearField(14);
  @$pb.TagNumber(14)
  $0.Timestamp ensureCreatedAt() => $_ensure(13);

  /// The delivery date of the invoice.
  @$pb.TagNumber(15)
  $0.Timestamp get deliveryDate => $_getN(14);
  @$pb.TagNumber(15)
  set deliveryDate($0.Timestamp value) => $_setField(15, value);
  @$pb.TagNumber(15)
  $core.bool hasDeliveryDate() => $_has(14);
  @$pb.TagNumber(15)
  void clearDeliveryDate() => $_clearField(15);
  @$pb.TagNumber(15)
  $0.Timestamp ensureDeliveryDate() => $_ensure(14);
}

class CreateInvoiceRequest extends $pb.GeneratedMessage {
  factory CreateInvoiceRequest({
    Invoice? invoice,
  }) {
    final result = create();
    if (invoice != null) result.invoice = invoice;
    return result;
  }

  CreateInvoiceRequest._();

  factory CreateInvoiceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInvoiceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInvoiceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<Invoice>(1, _omitFieldNames ? '' : 'invoice',
        subBuilder: Invoice.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceRequest clone() =>
      CreateInvoiceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceRequest copyWith(void Function(CreateInvoiceRequest) updates) =>
      super.copyWith((message) => updates(message as CreateInvoiceRequest))
          as CreateInvoiceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInvoiceRequest create() => CreateInvoiceRequest._();
  @$core.override
  CreateInvoiceRequest createEmptyInstance() => create();
  static $pb.PbList<CreateInvoiceRequest> createRepeated() =>
      $pb.PbList<CreateInvoiceRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateInvoiceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateInvoiceRequest>(create);
  static CreateInvoiceRequest? _defaultInstance;

  /// The invoice to create.
  @$pb.TagNumber(1)
  Invoice get invoice => $_getN(0);
  @$pb.TagNumber(1)
  set invoice(Invoice value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInvoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvoice() => $_clearField(1);
  @$pb.TagNumber(1)
  Invoice ensureInvoice() => $_ensure(0);
}

class CreateInvoiceResponse extends $pb.GeneratedMessage {
  factory CreateInvoiceResponse({
    $core.bool? success,
    $core.String? error,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  CreateInvoiceResponse._();

  factory CreateInvoiceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInvoiceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInvoiceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceResponse clone() =>
      CreateInvoiceResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceResponse copyWith(
          void Function(CreateInvoiceResponse) updates) =>
      super.copyWith((message) => updates(message as CreateInvoiceResponse))
          as CreateInvoiceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInvoiceResponse create() => CreateInvoiceResponse._();
  @$core.override
  CreateInvoiceResponse createEmptyInstance() => create();
  static $pb.PbList<CreateInvoiceResponse> createRepeated() =>
      $pb.PbList<CreateInvoiceResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateInvoiceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateInvoiceResponse>(create);
  static CreateInvoiceResponse? _defaultInstance;

  /// The invoice of the order.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  /// The error message.
  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);
}

class UpdateInvoiceRequest extends $pb.GeneratedMessage {
  factory UpdateInvoiceRequest({
    Invoice? invoice,
  }) {
    final result = create();
    if (invoice != null) result.invoice = invoice;
    return result;
  }

  UpdateInvoiceRequest._();

  factory UpdateInvoiceRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateInvoiceRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateInvoiceRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<Invoice>(1, _omitFieldNames ? '' : 'invoice',
        subBuilder: Invoice.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInvoiceRequest clone() =>
      UpdateInvoiceRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInvoiceRequest copyWith(void Function(UpdateInvoiceRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateInvoiceRequest))
          as UpdateInvoiceRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInvoiceRequest create() => UpdateInvoiceRequest._();
  @$core.override
  UpdateInvoiceRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateInvoiceRequest> createRepeated() =>
      $pb.PbList<UpdateInvoiceRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateInvoiceRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateInvoiceRequest>(create);
  static UpdateInvoiceRequest? _defaultInstance;

  /// The invoice to update.
  @$pb.TagNumber(1)
  Invoice get invoice => $_getN(0);
  @$pb.TagNumber(1)
  set invoice(Invoice value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasInvoice() => $_has(0);
  @$pb.TagNumber(1)
  void clearInvoice() => $_clearField(1);
  @$pb.TagNumber(1)
  Invoice ensureInvoice() => $_ensure(0);
}

class UpdateInvoiceResponse extends $pb.GeneratedMessage {
  factory UpdateInvoiceResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateInvoiceResponse._();

  factory UpdateInvoiceResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateInvoiceResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateInvoiceResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInvoiceResponse clone() =>
      UpdateInvoiceResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateInvoiceResponse copyWith(
          void Function(UpdateInvoiceResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateInvoiceResponse))
          as UpdateInvoiceResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateInvoiceResponse create() => UpdateInvoiceResponse._();
  @$core.override
  UpdateInvoiceResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateInvoiceResponse> createRepeated() =>
      $pb.PbList<UpdateInvoiceResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateInvoiceResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateInvoiceResponse>(create);
  static UpdateInvoiceResponse? _defaultInstance;

  /// Whether the invoice was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class InvoiceServiceApi {
  final $pb.RpcClient _client;

  InvoiceServiceApi(this._client);

  /// Creates an invoice for the order.
  $async.Future<CreateInvoiceResponse> createInvoice(
          $pb.ClientContext? ctx, CreateInvoiceRequest request) =>
      _client.invoke<CreateInvoiceResponse>(ctx, 'InvoiceService',
          'CreateInvoice', request, CreateInvoiceResponse());

  /// Updates an invoice.
  $async.Future<UpdateInvoiceResponse> updateInvoice(
          $pb.ClientContext? ctx, UpdateInvoiceRequest request) =>
      _client.invoke<UpdateInvoiceResponse>(ctx, 'InvoiceService',
          'UpdateInvoice', request, UpdateInvoiceResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
