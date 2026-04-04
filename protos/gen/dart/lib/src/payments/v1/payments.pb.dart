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
    $core.String? refId,
    $core.String? payerId,
    $core.String? receiverRef,
    $core.double? amount,
    $core.String? currency,
    $core.String? warehouseId,
    PaymentMethod? paymentMethod,
    PaymentStatus? status,
    $0.Timestamp? paymentDate,
    $core.String? referenceNumber,
    $core.String? createdByUserId,
    $core.String? notes,
    $core.Iterable<PaymentRelatedDoc>? relatedDocs,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (payerId != null) result.payerId = payerId;
    if (receiverRef != null) result.receiverRef = receiverRef;
    if (amount != null) result.amount = amount;
    if (currency != null) result.currency = currency;
    if (warehouseId != null) result.warehouseId = warehouseId;
    if (paymentMethod != null) result.paymentMethod = paymentMethod;
    if (status != null) result.status = status;
    if (paymentDate != null) result.paymentDate = paymentDate;
    if (referenceNumber != null) result.referenceNumber = referenceNumber;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (notes != null) result.notes = notes;
    if (relatedDocs != null) result.relatedDocs.addAll(relatedDocs);
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
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'payerId')
    ..aOS(3, _omitFieldNames ? '' : 'receiverRef')
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
    ..pc<PaymentRelatedDoc>(
        13, _omitFieldNames ? '' : 'relatedDocs', $pb.PbFieldType.PM,
        subBuilder: PaymentRelatedDoc.create)
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
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

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
  $core.String get receiverRef => $_getSZ(2);
  @$pb.TagNumber(3)
  set receiverRef($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReceiverRef() => $_has(2);
  @$pb.TagNumber(3)
  void clearReceiverRef() => $_clearField(3);

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

  @$pb.TagNumber(13)
  $pb.PbList<PaymentRelatedDoc> get relatedDocs => $_getList(12);
}

class PaymentRelatedDoc extends $pb.GeneratedMessage {
  factory PaymentRelatedDoc({
    $core.String? docId,
    $core.double? amount,
  }) {
    final result = create();
    if (docId != null) result.docId = docId;
    if (amount != null) result.amount = amount;
    return result;
  }

  PaymentRelatedDoc._();

  factory PaymentRelatedDoc.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PaymentRelatedDoc.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PaymentRelatedDoc',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'docId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaymentRelatedDoc clone() => PaymentRelatedDoc()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PaymentRelatedDoc copyWith(void Function(PaymentRelatedDoc) updates) =>
      super.copyWith((message) => updates(message as PaymentRelatedDoc))
          as PaymentRelatedDoc;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PaymentRelatedDoc create() => PaymentRelatedDoc._();
  @$core.override
  PaymentRelatedDoc createEmptyInstance() => create();
  static $pb.PbList<PaymentRelatedDoc> createRepeated() =>
      $pb.PbList<PaymentRelatedDoc>();
  @$core.pragma('dart2js:noInline')
  static PaymentRelatedDoc getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PaymentRelatedDoc>(create);
  static PaymentRelatedDoc? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get docId => $_getSZ(0);
  @$pb.TagNumber(1)
  set docId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get amount => $_getN(1);
  @$pb.TagNumber(2)
  set amount($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasAmount() => $_has(1);
  @$pb.TagNumber(2)
  void clearAmount() => $_clearField(2);
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

class PaymentsServiceApi {
  final $pb.RpcClient _client;

  PaymentsServiceApi(this._client);

  /// Record a payment
  $async.Future<CreatePaymentResponse> createPayment(
          $pb.ClientContext? ctx, CreatePaymentRequest request) =>
      _client.invoke<CreatePaymentResponse>(ctx, 'PaymentsService',
          'CreatePayment', request, CreatePaymentResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
