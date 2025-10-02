// This is a generated file - do not edit.
//
// Generated from payments/v1/payments.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../financial/v1/invoice.pb.dart' as $1;
import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'payments.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'payments.pbenum.dart';

/// *
///  Payment represents money transfer between parties.
///  Links to invoices to track what's been paid.
///
///  Example:
///    payment_id: "PAY-2025-001"
///    payer_id: "CMP-003" (customer)
///    receiver: "CMP-001" (your company)
///    amount: 5400000
///    payment_method: PAYMENT_METHOD_BANK_TRANSFER
///    status: PAYMENT_STATUS_COMPLETED
class Payment extends $pb.GeneratedMessage {
  factory Payment({
    $core.String? documentId,
    $core.String? payerId,
    $core.String? receiver,
    $core.double? amount,
    $core.String? currency,
    $core.String? warehouseId,
    PaymentMethod? paymentMethod,
    PaymentStatus? status,
    $0.Timestamp? paymentDate,
    $core.String? referenceNumber,
    $core.String? createdByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (payerId != null) result.payerId = payerId;
    if (receiver != null) result.receiver = receiver;
    if (amount != null) result.amount = amount;
    if (currency != null) result.currency = currency;
    if (warehouseId != null) result.warehouseId = warehouseId;
    if (paymentMethod != null) result.paymentMethod = paymentMethod;
    if (status != null) result.status = status;
    if (paymentDate != null) result.paymentDate = paymentDate;
    if (referenceNumber != null) result.referenceNumber = referenceNumber;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (notes != null) result.notes = notes;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'payerId')
    ..aOS(3, _omitFieldNames ? '' : 'receiver')
    ..a<$core.double>(4, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(5, _omitFieldNames ? '' : 'currency')
    ..aOS(6, _omitFieldNames ? '' : 'warehouseId')
    ..e<PaymentMethod>(
        7, _omitFieldNames ? '' : 'paymentMethod', $pb.PbFieldType.OE,
        defaultOrMaker: PaymentMethod.PAYMENT_METHOD_UNSPECIFIED,
        valueOf: PaymentMethod.valueOf,
        enumValues: PaymentMethod.values)
    ..e<PaymentStatus>(8, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: PaymentStatus.PAYMENT_STATUS_UNSPECIFIED,
        valueOf: PaymentStatus.valueOf,
        enumValues: PaymentStatus.values)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'paymentDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(10, _omitFieldNames ? '' : 'referenceNumber')
    ..aOS(11, _omitFieldNames ? '' : 'createdByUserId')
    ..aOS(12, _omitFieldNames ? '' : 'notes')
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
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get payerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set payerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPayerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPayerId() => $_clearField(2);

  /// Can be a customer phone number or account number.
  @$pb.TagNumber(3)
  $core.String get receiver => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiver($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceiver() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiver() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get amount => $_getN(3);
  @$pb.TagNumber(4)
  set amount($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasAmount() => $_has(3);
  @$pb.TagNumber(4)
  void clearAmount() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get currency => $_getSZ(4);
  @$pb.TagNumber(5)
  set currency($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => $_clearField(5);

  /// The warehouse id. in general it's the warehouse of the store.
  @$pb.TagNumber(6)
  $core.String get warehouseId => $_getSZ(5);
  @$pb.TagNumber(6)
  set warehouseId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasWarehouseId() => $_has(5);
  @$pb.TagNumber(6)
  void clearWarehouseId() => $_clearField(6);

  @$pb.TagNumber(7)
  PaymentMethod get paymentMethod => $_getN(6);
  @$pb.TagNumber(7)
  set paymentMethod(PaymentMethod value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasPaymentMethod() => $_has(6);
  @$pb.TagNumber(7)
  void clearPaymentMethod() => $_clearField(7);

  @$pb.TagNumber(8)
  PaymentStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(PaymentStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.Timestamp get paymentDate => $_getN(8);
  @$pb.TagNumber(9)
  set paymentDate($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasPaymentDate() => $_has(8);
  @$pb.TagNumber(9)
  void clearPaymentDate() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensurePaymentDate() => $_ensure(8);

  @$pb.TagNumber(10)
  $core.String get referenceNumber => $_getSZ(9);
  @$pb.TagNumber(10)
  set referenceNumber($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasReferenceNumber() => $_has(9);
  @$pb.TagNumber(10)
  void clearReferenceNumber() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get createdByUserId => $_getSZ(10);
  @$pb.TagNumber(11)
  set createdByUserId($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasCreatedByUserId() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedByUserId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get notes => $_getSZ(11);
  @$pb.TagNumber(12)
  set notes($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasNotes() => $_has(11);
  @$pb.TagNumber(12)
  void clearNotes() => $_clearField(12);
}

class CreatePaymentRequest extends $pb.GeneratedMessage {
  factory CreatePaymentRequest({
    $core.String? payerId,
    $core.String? receiver,
    $core.double? amount,
    $core.String? currency,
    PaymentMethod? paymentMethod,
    $core.String? referenceNumber,
    $core.String? notes,
  }) {
    final result = create();
    if (payerId != null) result.payerId = payerId;
    if (receiver != null) result.receiver = receiver;
    if (amount != null) result.amount = amount;
    if (currency != null) result.currency = currency;
    if (paymentMethod != null) result.paymentMethod = paymentMethod;
    if (referenceNumber != null) result.referenceNumber = referenceNumber;
    if (notes != null) result.notes = notes;
    return result;
  }

  CreatePaymentRequest._();

  factory CreatePaymentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePaymentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePaymentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'payerId')
    ..aOS(2, _omitFieldNames ? '' : 'receiver')
    ..a<$core.double>(3, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOS(4, _omitFieldNames ? '' : 'currency')
    ..e<PaymentMethod>(
        5, _omitFieldNames ? '' : 'paymentMethod', $pb.PbFieldType.OE,
        defaultOrMaker: PaymentMethod.PAYMENT_METHOD_UNSPECIFIED,
        valueOf: PaymentMethod.valueOf,
        enumValues: PaymentMethod.values)
    ..aOS(6, _omitFieldNames ? '' : 'referenceNumber')
    ..aOS(7, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePaymentRequest clone() =>
      CreatePaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePaymentRequest copyWith(void Function(CreatePaymentRequest) updates) =>
      super.copyWith((message) => updates(message as CreatePaymentRequest))
          as CreatePaymentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePaymentRequest create() => CreatePaymentRequest._();
  @$core.override
  CreatePaymentRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePaymentRequest> createRepeated() =>
      $pb.PbList<CreatePaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePaymentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePaymentRequest>(create);
  static CreatePaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get payerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set payerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPayerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get receiver => $_getSZ(1);
  @$pb.TagNumber(2)
  set receiver($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReceiver() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceiver() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get amount => $_getN(2);
  @$pb.TagNumber(3)
  set amount($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearAmount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get currency => $_getSZ(3);
  @$pb.TagNumber(4)
  set currency($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCurrency() => $_has(3);
  @$pb.TagNumber(4)
  void clearCurrency() => $_clearField(4);

  @$pb.TagNumber(5)
  PaymentMethod get paymentMethod => $_getN(4);
  @$pb.TagNumber(5)
  set paymentMethod(PaymentMethod value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasPaymentMethod() => $_has(4);
  @$pb.TagNumber(5)
  void clearPaymentMethod() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get referenceNumber => $_getSZ(5);
  @$pb.TagNumber(6)
  set referenceNumber($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReferenceNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearReferenceNumber() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => $_clearField(7);
}

class CreatePaymentResponse extends $pb.GeneratedMessage {
  factory CreatePaymentResponse({
    Payment? payment,
  }) {
    final result = create();
    if (payment != null) result.payment = payment;
    return result;
  }

  CreatePaymentResponse._();

  factory CreatePaymentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePaymentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePaymentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOM<Payment>(1, _omitFieldNames ? '' : 'payment',
        subBuilder: Payment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePaymentResponse clone() =>
      CreatePaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePaymentResponse copyWith(
          void Function(CreatePaymentResponse) updates) =>
      super.copyWith((message) => updates(message as CreatePaymentResponse))
          as CreatePaymentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePaymentResponse create() => CreatePaymentResponse._();
  @$core.override
  CreatePaymentResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePaymentResponse> createRepeated() =>
      $pb.PbList<CreatePaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePaymentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePaymentResponse>(create);
  static CreatePaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment(Payment value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => $_clearField(1);
  @$pb.TagNumber(1)
  Payment ensurePayment() => $_ensure(0);
}

class GetPaymentRequest extends $pb.GeneratedMessage {
  factory GetPaymentRequest({
    $core.String? paymentId,
  }) {
    final result = create();
    if (paymentId != null) result.paymentId = paymentId;
    return result;
  }

  GetPaymentRequest._();

  factory GetPaymentRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPaymentRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPaymentRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'paymentId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPaymentRequest clone() => GetPaymentRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPaymentRequest copyWith(void Function(GetPaymentRequest) updates) =>
      super.copyWith((message) => updates(message as GetPaymentRequest))
          as GetPaymentRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest create() => GetPaymentRequest._();
  @$core.override
  GetPaymentRequest createEmptyInstance() => create();
  static $pb.PbList<GetPaymentRequest> createRepeated() =>
      $pb.PbList<GetPaymentRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPaymentRequest>(create);
  static GetPaymentRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get paymentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set paymentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPaymentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPaymentId() => $_clearField(1);
}

class GetPaymentResponse extends $pb.GeneratedMessage {
  factory GetPaymentResponse({
    Payment? payment,
    $1.Invoice? relatedInvoice,
  }) {
    final result = create();
    if (payment != null) result.payment = payment;
    if (relatedInvoice != null) result.relatedInvoice = relatedInvoice;
    return result;
  }

  GetPaymentResponse._();

  factory GetPaymentResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPaymentResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPaymentResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOM<Payment>(1, _omitFieldNames ? '' : 'payment',
        subBuilder: Payment.create)
    ..aOM<$1.Invoice>(2, _omitFieldNames ? '' : 'relatedInvoice',
        subBuilder: $1.Invoice.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPaymentResponse clone() => GetPaymentResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPaymentResponse copyWith(void Function(GetPaymentResponse) updates) =>
      super.copyWith((message) => updates(message as GetPaymentResponse))
          as GetPaymentResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse create() => GetPaymentResponse._();
  @$core.override
  GetPaymentResponse createEmptyInstance() => create();
  static $pb.PbList<GetPaymentResponse> createRepeated() =>
      $pb.PbList<GetPaymentResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPaymentResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPaymentResponse>(create);
  static GetPaymentResponse? _defaultInstance;

  @$pb.TagNumber(1)
  Payment get payment => $_getN(0);
  @$pb.TagNumber(1)
  set payment(Payment value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPayment() => $_has(0);
  @$pb.TagNumber(1)
  void clearPayment() => $_clearField(1);
  @$pb.TagNumber(1)
  Payment ensurePayment() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.Invoice get relatedInvoice => $_getN(1);
  @$pb.TagNumber(2)
  set relatedInvoice($1.Invoice value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasRelatedInvoice() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelatedInvoice() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Invoice ensureRelatedInvoice() => $_ensure(1);
}

class ListPaymentsRequest extends $pb.GeneratedMessage {
  factory ListPaymentsRequest({
    $core.String? warehouseId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (warehouseId != null) result.warehouseId = warehouseId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNumber != null) result.pageNumber = pageNumber;
    return result;
  }

  ListPaymentsRequest._();

  factory ListPaymentsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPaymentsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPaymentsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'warehouseId')
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPaymentsRequest clone() => ListPaymentsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPaymentsRequest copyWith(void Function(ListPaymentsRequest) updates) =>
      super.copyWith((message) => updates(message as ListPaymentsRequest))
          as ListPaymentsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPaymentsRequest create() => ListPaymentsRequest._();
  @$core.override
  ListPaymentsRequest createEmptyInstance() => create();
  static $pb.PbList<ListPaymentsRequest> createRepeated() =>
      $pb.PbList<ListPaymentsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPaymentsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPaymentsRequest>(create);
  static ListPaymentsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get warehouseId => $_getSZ(0);
  @$pb.TagNumber(1)
  set warehouseId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasWarehouseId() => $_has(0);
  @$pb.TagNumber(1)
  void clearWarehouseId() => $_clearField(1);

  @$pb.TagNumber(2)
  $0.Timestamp get startDate => $_getN(1);
  @$pb.TagNumber(2)
  set startDate($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStartDate() => $_has(1);
  @$pb.TagNumber(2)
  void clearStartDate() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureStartDate() => $_ensure(1);

  @$pb.TagNumber(3)
  $0.Timestamp get endDate => $_getN(2);
  @$pb.TagNumber(3)
  set endDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEndDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearEndDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureEndDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get pageSize => $_getIZ(3);
  @$pb.TagNumber(4)
  set pageSize($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPageSize() => $_has(3);
  @$pb.TagNumber(4)
  void clearPageSize() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get pageNumber => $_getIZ(4);
  @$pb.TagNumber(5)
  set pageNumber($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPageNumber() => $_has(4);
  @$pb.TagNumber(5)
  void clearPageNumber() => $_clearField(5);
}

class ListPaymentsResponse extends $pb.GeneratedMessage {
  factory ListPaymentsResponse({
    $core.Iterable<Payment>? payments,
    $core.int? totalCount,
    $core.double? totalAmount,
  }) {
    final result = create();
    if (payments != null) result.payments.addAll(payments);
    if (totalCount != null) result.totalCount = totalCount;
    if (totalAmount != null) result.totalAmount = totalAmount;
    return result;
  }

  ListPaymentsResponse._();

  factory ListPaymentsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPaymentsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPaymentsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..pc<Payment>(1, _omitFieldNames ? '' : 'payments', $pb.PbFieldType.PM,
        subBuilder: Payment.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'totalAmount', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPaymentsResponse clone() =>
      ListPaymentsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPaymentsResponse copyWith(void Function(ListPaymentsResponse) updates) =>
      super.copyWith((message) => updates(message as ListPaymentsResponse))
          as ListPaymentsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPaymentsResponse create() => ListPaymentsResponse._();
  @$core.override
  ListPaymentsResponse createEmptyInstance() => create();
  static $pb.PbList<ListPaymentsResponse> createRepeated() =>
      $pb.PbList<ListPaymentsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPaymentsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPaymentsResponse>(create);
  static ListPaymentsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Payment> get payments => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalAmount => $_getN(2);
  @$pb.TagNumber(3)
  set totalAmount($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalAmount() => $_clearField(3);
}

class PaymentServiceApi {
  final $pb.RpcClient _client;

  PaymentServiceApi(this._client);

  /// Record a payment
  $async.Future<CreatePaymentResponse> createPayment(
          $pb.ClientContext? ctx, CreatePaymentRequest request) =>
      _client.invoke<CreatePaymentResponse>(ctx, 'PaymentService',
          'CreatePayment', request, CreatePaymentResponse());

  /// Get payment details
  $async.Future<GetPaymentResponse> getPayment(
          $pb.ClientContext? ctx, GetPaymentRequest request) =>
      _client.invoke<GetPaymentResponse>(
          ctx, 'PaymentService', 'GetPayment', request, GetPaymentResponse());

  /// List payments with filtering
  $async.Future<ListPaymentsResponse> listPayments(
          $pb.ClientContext? ctx, ListPaymentsRequest request) =>
      _client.invoke<ListPaymentsResponse>(ctx, 'PaymentService',
          'ListPayments', request, ListPaymentsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
