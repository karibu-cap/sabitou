// This is a generated file - do not edit.
//
// Generated from payments/v1/gift_voucher.proto.

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
import 'gift_voucher.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'gift_voucher.pbenum.dart';

/// *
///  GiftVoucher (Bon Cadeau / Bon d'Achat)
///  Prepaid credit that can be used for future purchases.
///  Like a gift card or store credit.
///
///  Example:
///    voucher_id: "GV-2025-001"
///    voucher_code: "GIFT-XMAS-12345"
///    initial_value: 100000
///    remaining_value: 100000
///    issued_to_customer_id: "CMP-003"
///    valid_until: 2026-12-31
///    status: VOUCHER_STATUS_ACTIVE
class GiftVoucher extends $pb.GeneratedMessage {
  factory GiftVoucher({
    $core.String? documentId,
    $core.String? voucherCode,
    $core.double? initialValue,
    $core.double? remainingValue,
    $core.String? currency,
    $core.String? issuedToCustomerId,
    $core.String? issuedByUserId,
    VoucherStatus? status,
    $0.Timestamp? issuedAt,
    $0.Timestamp? validUntil,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (voucherCode != null) result.voucherCode = voucherCode;
    if (initialValue != null) result.initialValue = initialValue;
    if (remainingValue != null) result.remainingValue = remainingValue;
    if (currency != null) result.currency = currency;
    if (issuedToCustomerId != null)
      result.issuedToCustomerId = issuedToCustomerId;
    if (issuedByUserId != null) result.issuedByUserId = issuedByUserId;
    if (status != null) result.status = status;
    if (issuedAt != null) result.issuedAt = issuedAt;
    if (validUntil != null) result.validUntil = validUntil;
    if (notes != null) result.notes = notes;
    return result;
  }

  GiftVoucher._();

  factory GiftVoucher.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GiftVoucher.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GiftVoucher',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'voucherCode')
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'initialValue', $pb.PbFieldType.OD)
    ..a<$core.double>(
        4, _omitFieldNames ? '' : 'remainingValue', $pb.PbFieldType.OD)
    ..aOS(5, _omitFieldNames ? '' : 'currency')
    ..aOS(6, _omitFieldNames ? '' : 'issuedToCustomerId')
    ..aOS(7, _omitFieldNames ? '' : 'issuedByUserId')
    ..e<VoucherStatus>(8, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: VoucherStatus.VOUCHER_STATUS_UNSPECIFIED,
        valueOf: VoucherStatus.valueOf,
        enumValues: VoucherStatus.values)
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'issuedAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'validUntil',
        subBuilder: $0.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftVoucher clone() => GiftVoucher()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GiftVoucher copyWith(void Function(GiftVoucher) updates) =>
      super.copyWith((message) => updates(message as GiftVoucher))
          as GiftVoucher;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GiftVoucher create() => GiftVoucher._();
  @$core.override
  GiftVoucher createEmptyInstance() => create();
  static $pb.PbList<GiftVoucher> createRepeated() => $pb.PbList<GiftVoucher>();
  @$core.pragma('dart2js:noInline')
  static GiftVoucher getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GiftVoucher>(create);
  static GiftVoucher? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get voucherCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set voucherCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVoucherCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoucherCode() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get initialValue => $_getN(2);
  @$pb.TagNumber(3)
  set initialValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInitialValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearInitialValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get remainingValue => $_getN(3);
  @$pb.TagNumber(4)
  set remainingValue($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRemainingValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearRemainingValue() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get currency => $_getSZ(4);
  @$pb.TagNumber(5)
  set currency($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCurrency() => $_has(4);
  @$pb.TagNumber(5)
  void clearCurrency() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get issuedToCustomerId => $_getSZ(5);
  @$pb.TagNumber(6)
  set issuedToCustomerId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasIssuedToCustomerId() => $_has(5);
  @$pb.TagNumber(6)
  void clearIssuedToCustomerId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get issuedByUserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set issuedByUserId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasIssuedByUserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearIssuedByUserId() => $_clearField(7);

  @$pb.TagNumber(8)
  VoucherStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(VoucherStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.Timestamp get issuedAt => $_getN(8);
  @$pb.TagNumber(9)
  set issuedAt($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasIssuedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearIssuedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureIssuedAt() => $_ensure(8);

  @$pb.TagNumber(10)
  $0.Timestamp get validUntil => $_getN(9);
  @$pb.TagNumber(10)
  set validUntil($0.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasValidUntil() => $_has(9);
  @$pb.TagNumber(10)
  void clearValidUntil() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureValidUntil() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get notes => $_getSZ(10);
  @$pb.TagNumber(11)
  set notes($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasNotes() => $_has(10);
  @$pb.TagNumber(11)
  void clearNotes() => $_clearField(11);
}

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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
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

class ValidateVoucherRequest extends $pb.GeneratedMessage {
  factory ValidateVoucherRequest({
    $core.String? voucherCode,
  }) {
    final result = create();
    if (voucherCode != null) result.voucherCode = voucherCode;
    return result;
  }

  ValidateVoucherRequest._();

  factory ValidateVoucherRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateVoucherRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateVoucherRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'voucherCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateVoucherRequest clone() =>
      ValidateVoucherRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateVoucherRequest copyWith(
          void Function(ValidateVoucherRequest) updates) =>
      super.copyWith((message) => updates(message as ValidateVoucherRequest))
          as ValidateVoucherRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateVoucherRequest create() => ValidateVoucherRequest._();
  @$core.override
  ValidateVoucherRequest createEmptyInstance() => create();
  static $pb.PbList<ValidateVoucherRequest> createRepeated() =>
      $pb.PbList<ValidateVoucherRequest>();
  @$core.pragma('dart2js:noInline')
  static ValidateVoucherRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateVoucherRequest>(create);
  static ValidateVoucherRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get voucherCode => $_getSZ(0);
  @$pb.TagNumber(1)
  set voucherCode($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVoucherCode() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoucherCode() => $_clearField(1);
}

class ValidateVoucherResponse extends $pb.GeneratedMessage {
  factory ValidateVoucherResponse({
    $core.bool? isValid,
    $core.String? voucherId,
    $core.double? remainingValue,
    $0.Timestamp? validUntil,
    VoucherStatus? status,
    $core.String? message,
  }) {
    final result = create();
    if (isValid != null) result.isValid = isValid;
    if (voucherId != null) result.voucherId = voucherId;
    if (remainingValue != null) result.remainingValue = remainingValue;
    if (validUntil != null) result.validUntil = validUntil;
    if (status != null) result.status = status;
    if (message != null) result.message = message;
    return result;
  }

  ValidateVoucherResponse._();

  factory ValidateVoucherResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ValidateVoucherResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ValidateVoucherResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isValid')
    ..aOS(2, _omitFieldNames ? '' : 'voucherId')
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'remainingValue', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'validUntil',
        subBuilder: $0.Timestamp.create)
    ..e<VoucherStatus>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: VoucherStatus.VOUCHER_STATUS_UNSPECIFIED,
        valueOf: VoucherStatus.valueOf,
        enumValues: VoucherStatus.values)
    ..aOS(6, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateVoucherResponse clone() =>
      ValidateVoucherResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ValidateVoucherResponse copyWith(
          void Function(ValidateVoucherResponse) updates) =>
      super.copyWith((message) => updates(message as ValidateVoucherResponse))
          as ValidateVoucherResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ValidateVoucherResponse create() => ValidateVoucherResponse._();
  @$core.override
  ValidateVoucherResponse createEmptyInstance() => create();
  static $pb.PbList<ValidateVoucherResponse> createRepeated() =>
      $pb.PbList<ValidateVoucherResponse>();
  @$core.pragma('dart2js:noInline')
  static ValidateVoucherResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ValidateVoucherResponse>(create);
  static ValidateVoucherResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isValid => $_getBF(0);
  @$pb.TagNumber(1)
  set isValid($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsValid() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsValid() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get voucherId => $_getSZ(1);
  @$pb.TagNumber(2)
  set voucherId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVoucherId() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoucherId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get remainingValue => $_getN(2);
  @$pb.TagNumber(3)
  set remainingValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRemainingValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearRemainingValue() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get validUntil => $_getN(3);
  @$pb.TagNumber(4)
  set validUntil($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasValidUntil() => $_has(3);
  @$pb.TagNumber(4)
  void clearValidUntil() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureValidUntil() => $_ensure(3);

  @$pb.TagNumber(5)
  VoucherStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(VoucherStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get message => $_getSZ(5);
  @$pb.TagNumber(6)
  set message($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessage() => $_clearField(6);
}

enum GetVoucherRequest_Identifier { voucherId, voucherCode, notSet }

class GetVoucherRequest extends $pb.GeneratedMessage {
  factory GetVoucherRequest({
    $core.String? voucherId,
    $core.String? voucherCode,
  }) {
    final result = create();
    if (voucherId != null) result.voucherId = voucherId;
    if (voucherCode != null) result.voucherCode = voucherCode;
    return result;
  }

  GetVoucherRequest._();

  factory GetVoucherRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVoucherRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, GetVoucherRequest_Identifier>
      _GetVoucherRequest_IdentifierByTag = {
    1: GetVoucherRequest_Identifier.voucherId,
    2: GetVoucherRequest_Identifier.voucherCode,
    0: GetVoucherRequest_Identifier.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVoucherRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..oo(0, [1, 2])
    ..aOS(1, _omitFieldNames ? '' : 'voucherId')
    ..aOS(2, _omitFieldNames ? '' : 'voucherCode')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherRequest clone() => GetVoucherRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherRequest copyWith(void Function(GetVoucherRequest) updates) =>
      super.copyWith((message) => updates(message as GetVoucherRequest))
          as GetVoucherRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVoucherRequest create() => GetVoucherRequest._();
  @$core.override
  GetVoucherRequest createEmptyInstance() => create();
  static $pb.PbList<GetVoucherRequest> createRepeated() =>
      $pb.PbList<GetVoucherRequest>();
  @$core.pragma('dart2js:noInline')
  static GetVoucherRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVoucherRequest>(create);
  static GetVoucherRequest? _defaultInstance;

  GetVoucherRequest_Identifier whichIdentifier() =>
      _GetVoucherRequest_IdentifierByTag[$_whichOneof(0)]!;
  void clearIdentifier() => $_clearField($_whichOneof(0));

  @$pb.TagNumber(1)
  $core.String get voucherId => $_getSZ(0);
  @$pb.TagNumber(1)
  set voucherId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasVoucherId() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoucherId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get voucherCode => $_getSZ(1);
  @$pb.TagNumber(2)
  set voucherCode($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasVoucherCode() => $_has(1);
  @$pb.TagNumber(2)
  void clearVoucherCode() => $_clearField(2);
}

class GetVoucherResponse extends $pb.GeneratedMessage {
  factory GetVoucherResponse({
    GiftVoucher? voucher,
    $core.Iterable<VoucherTransaction>? transactions,
  }) {
    final result = create();
    if (voucher != null) result.voucher = voucher;
    if (transactions != null) result.transactions.addAll(transactions);
    return result;
  }

  GetVoucherResponse._();

  factory GetVoucherResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVoucherResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVoucherResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOM<GiftVoucher>(1, _omitFieldNames ? '' : 'voucher',
        subBuilder: GiftVoucher.create)
    ..pc<VoucherTransaction>(
        2, _omitFieldNames ? '' : 'transactions', $pb.PbFieldType.PM,
        subBuilder: VoucherTransaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherResponse clone() => GetVoucherResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetVoucherResponse copyWith(void Function(GetVoucherResponse) updates) =>
      super.copyWith((message) => updates(message as GetVoucherResponse))
          as GetVoucherResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetVoucherResponse create() => GetVoucherResponse._();
  @$core.override
  GetVoucherResponse createEmptyInstance() => create();
  static $pb.PbList<GetVoucherResponse> createRepeated() =>
      $pb.PbList<GetVoucherResponse>();
  @$core.pragma('dart2js:noInline')
  static GetVoucherResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetVoucherResponse>(create);
  static GetVoucherResponse? _defaultInstance;

  @$pb.TagNumber(1)
  GiftVoucher get voucher => $_getN(0);
  @$pb.TagNumber(1)
  set voucher(GiftVoucher value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVoucher() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoucher() => $_clearField(1);
  @$pb.TagNumber(1)
  GiftVoucher ensureVoucher() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<VoucherTransaction> get transactions => $_getList(1);
}

class ListVouchersRequest extends $pb.GeneratedMessage {
  factory ListVouchersRequest({
    $core.String? customerId,
    VoucherStatus? status,
    $core.bool? expiringSoon,
    $0.Timestamp? issuedAfter,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (customerId != null) result.customerId = customerId;
    if (status != null) result.status = status;
    if (expiringSoon != null) result.expiringSoon = expiringSoon;
    if (issuedAfter != null) result.issuedAfter = issuedAfter;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNumber != null) result.pageNumber = pageNumber;
    return result;
  }

  ListVouchersRequest._();

  factory ListVouchersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListVouchersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListVouchersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'customerId')
    ..e<VoucherStatus>(2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: VoucherStatus.VOUCHER_STATUS_UNSPECIFIED,
        valueOf: VoucherStatus.valueOf,
        enumValues: VoucherStatus.values)
    ..aOB(3, _omitFieldNames ? '' : 'expiringSoon')
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'issuedAfter',
        subBuilder: $0.Timestamp.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVouchersRequest clone() => ListVouchersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVouchersRequest copyWith(void Function(ListVouchersRequest) updates) =>
      super.copyWith((message) => updates(message as ListVouchersRequest))
          as ListVouchersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVouchersRequest create() => ListVouchersRequest._();
  @$core.override
  ListVouchersRequest createEmptyInstance() => create();
  static $pb.PbList<ListVouchersRequest> createRepeated() =>
      $pb.PbList<ListVouchersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListVouchersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListVouchersRequest>(create);
  static ListVouchersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get customerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set customerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCustomerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomerId() => $_clearField(1);

  @$pb.TagNumber(2)
  VoucherStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(VoucherStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.bool get expiringSoon => $_getBF(2);
  @$pb.TagNumber(3)
  set expiringSoon($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasExpiringSoon() => $_has(2);
  @$pb.TagNumber(3)
  void clearExpiringSoon() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get issuedAfter => $_getN(3);
  @$pb.TagNumber(4)
  set issuedAfter($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasIssuedAfter() => $_has(3);
  @$pb.TagNumber(4)
  void clearIssuedAfter() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureIssuedAfter() => $_ensure(3);

  @$pb.TagNumber(5)
  $core.int get pageSize => $_getIZ(4);
  @$pb.TagNumber(5)
  set pageSize($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasPageSize() => $_has(4);
  @$pb.TagNumber(5)
  void clearPageSize() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.int get pageNumber => $_getIZ(5);
  @$pb.TagNumber(6)
  set pageNumber($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPageNumber() => $_has(5);
  @$pb.TagNumber(6)
  void clearPageNumber() => $_clearField(6);
}

class ListVouchersResponse extends $pb.GeneratedMessage {
  factory ListVouchersResponse({
    $core.Iterable<GiftVoucher>? vouchers,
    $core.int? totalCount,
    $core.double? totalValue,
  }) {
    final result = create();
    if (vouchers != null) result.vouchers.addAll(vouchers);
    if (totalCount != null) result.totalCount = totalCount;
    if (totalValue != null) result.totalValue = totalValue;
    return result;
  }

  ListVouchersResponse._();

  factory ListVouchersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListVouchersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListVouchersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'payments.v1'),
      createEmptyInstance: create)
    ..pc<GiftVoucher>(1, _omitFieldNames ? '' : 'vouchers', $pb.PbFieldType.PM,
        subBuilder: GiftVoucher.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'totalValue', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVouchersResponse clone() =>
      ListVouchersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListVouchersResponse copyWith(void Function(ListVouchersResponse) updates) =>
      super.copyWith((message) => updates(message as ListVouchersResponse))
          as ListVouchersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListVouchersResponse create() => ListVouchersResponse._();
  @$core.override
  ListVouchersResponse createEmptyInstance() => create();
  static $pb.PbList<ListVouchersResponse> createRepeated() =>
      $pb.PbList<ListVouchersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListVouchersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListVouchersResponse>(create);
  static ListVouchersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<GiftVoucher> get vouchers => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalValue => $_getN(2);
  @$pb.TagNumber(3)
  set totalValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalValue() => $_clearField(3);
}

class GiftVoucherServiceApi {
  final $pb.RpcClient _client;

  GiftVoucherServiceApi(this._client);

  /// Validate voucher before use
  $async.Future<ValidateVoucherResponse> validateVoucher(
          $pb.ClientContext? ctx, ValidateVoucherRequest request) =>
      _client.invoke<ValidateVoucherResponse>(ctx, 'GiftVoucherService',
          'ValidateVoucher', request, ValidateVoucherResponse());

  /// Get voucher details
  $async.Future<GetVoucherResponse> getVoucher(
          $pb.ClientContext? ctx, GetVoucherRequest request) =>
      _client.invoke<GetVoucherResponse>(ctx, 'GiftVoucherService',
          'GetVoucher', request, GetVoucherResponse());

  /// List vouchers with filtering
  $async.Future<ListVouchersResponse> listVouchers(
          $pb.ClientContext? ctx, ListVouchersRequest request) =>
      _client.invoke<ListVouchersResponse>(ctx, 'GiftVoucherService',
          'ListVouchers', request, ListVouchersResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
