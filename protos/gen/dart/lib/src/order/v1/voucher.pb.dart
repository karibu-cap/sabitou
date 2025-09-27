// This is a generated file - do not edit.
//
// Generated from order/v1/voucher.proto.

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
import 'voucher.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'voucher.pbenum.dart';

class Voucher extends $pb.GeneratedMessage {
  factory Voucher({
    $core.String? refId,
    $core.String? orderId,
    $core.String? invoiceId,
    $core.String? storeId,
    $core.double? amount,
    $0.Timestamp? createdAt,
    $0.Timestamp? expiryDate,
    VoucherStatus? status,
    $core.String? redeemedByReferenceId,
    $0.Timestamp? redeemedAt,
    $core.String? additionalInfo,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (orderId != null) result.orderId = orderId;
    if (invoiceId != null) result.invoiceId = invoiceId;
    if (storeId != null) result.storeId = storeId;
    if (amount != null) result.amount = amount;
    if (createdAt != null) result.createdAt = createdAt;
    if (expiryDate != null) result.expiryDate = expiryDate;
    if (status != null) result.status = status;
    if (redeemedByReferenceId != null)
      result.redeemedByReferenceId = redeemedByReferenceId;
    if (redeemedAt != null) result.redeemedAt = redeemedAt;
    if (additionalInfo != null) result.additionalInfo = additionalInfo;
    return result;
  }

  Voucher._();

  factory Voucher.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Voucher.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Voucher',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'orderId')
    ..aOS(3, _omitFieldNames ? '' : 'invoiceId')
    ..aOS(4, _omitFieldNames ? '' : 'storeId')
    ..a<$core.double>(5, _omitFieldNames ? '' : 'amount', $pb.PbFieldType.OD)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'expiryDate',
        subBuilder: $0.Timestamp.create)
    ..e<VoucherStatus>(8, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: VoucherStatus.VOUCHER_STATUS_UNSPECIFIED,
        valueOf: VoucherStatus.valueOf,
        enumValues: VoucherStatus.values)
    ..aOS(9, _omitFieldNames ? '' : 'redeemedByReferenceId')
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'redeemedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'additionalInfo')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Voucher clone() => Voucher()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Voucher copyWith(void Function(Voucher) updates) =>
      super.copyWith((message) => updates(message as Voucher)) as Voucher;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Voucher create() => Voucher._();
  @$core.override
  Voucher createEmptyInstance() => create();
  static $pb.PbList<Voucher> createRepeated() => $pb.PbList<Voucher>();
  @$core.pragma('dart2js:noInline')
  static Voucher getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Voucher>(create);
  static Voucher? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get orderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set orderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasOrderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearOrderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get invoiceId => $_getSZ(2);
  @$pb.TagNumber(3)
  set invoiceId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInvoiceId() => $_has(2);
  @$pb.TagNumber(3)
  void clearInvoiceId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get storeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set storeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStoreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get amount => $_getN(4);
  @$pb.TagNumber(5)
  set amount($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearAmount() => $_clearField(5);

  /// When the voucher was created.
  @$pb.TagNumber(6)
  $0.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureCreatedAt() => $_ensure(5);

  /// When the voucher expires.
  @$pb.TagNumber(7)
  $0.Timestamp get expiryDate => $_getN(6);
  @$pb.TagNumber(7)
  set expiryDate($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasExpiryDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpiryDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureExpiryDate() => $_ensure(6);

  @$pb.TagNumber(8)
  VoucherStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(VoucherStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  /// Who redeemed the voucher.
  /// The voucher can be redeemed by another invoice.
  @$pb.TagNumber(9)
  $core.String get redeemedByReferenceId => $_getSZ(8);
  @$pb.TagNumber(9)
  set redeemedByReferenceId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasRedeemedByReferenceId() => $_has(8);
  @$pb.TagNumber(9)
  void clearRedeemedByReferenceId() => $_clearField(9);

  @$pb.TagNumber(10)
  $0.Timestamp get redeemedAt => $_getN(9);
  @$pb.TagNumber(10)
  set redeemedAt($0.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasRedeemedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearRedeemedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureRedeemedAt() => $_ensure(9);

  /// The additional information about the voucher.
  @$pb.TagNumber(11)
  $core.String get additionalInfo => $_getSZ(10);
  @$pb.TagNumber(11)
  set additionalInfo($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasAdditionalInfo() => $_has(10);
  @$pb.TagNumber(11)
  void clearAdditionalInfo() => $_clearField(11);
}

class CreateVoucherRequest extends $pb.GeneratedMessage {
  factory CreateVoucherRequest({
    Voucher? voucher,
  }) {
    final result = create();
    if (voucher != null) result.voucher = voucher;
    return result;
  }

  CreateVoucherRequest._();

  factory CreateVoucherRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateVoucherRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateVoucherRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<Voucher>(1, _omitFieldNames ? '' : 'voucher',
        subBuilder: Voucher.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateVoucherRequest clone() =>
      CreateVoucherRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateVoucherRequest copyWith(void Function(CreateVoucherRequest) updates) =>
      super.copyWith((message) => updates(message as CreateVoucherRequest))
          as CreateVoucherRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateVoucherRequest create() => CreateVoucherRequest._();
  @$core.override
  CreateVoucherRequest createEmptyInstance() => create();
  static $pb.PbList<CreateVoucherRequest> createRepeated() =>
      $pb.PbList<CreateVoucherRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateVoucherRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateVoucherRequest>(create);
  static CreateVoucherRequest? _defaultInstance;

  @$pb.TagNumber(1)
  Voucher get voucher => $_getN(0);
  @$pb.TagNumber(1)
  set voucher(Voucher value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVoucher() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoucher() => $_clearField(1);
  @$pb.TagNumber(1)
  Voucher ensureVoucher() => $_ensure(0);
}

class CreateVoucherResponse extends $pb.GeneratedMessage {
  factory CreateVoucherResponse({
    $core.String? refId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    return result;
  }

  CreateVoucherResponse._();

  factory CreateVoucherResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateVoucherResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateVoucherResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateVoucherResponse clone() =>
      CreateVoucherResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateVoucherResponse copyWith(
          void Function(CreateVoucherResponse) updates) =>
      super.copyWith((message) => updates(message as CreateVoucherResponse))
          as CreateVoucherResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateVoucherResponse create() => CreateVoucherResponse._();
  @$core.override
  CreateVoucherResponse createEmptyInstance() => create();
  static $pb.PbList<CreateVoucherResponse> createRepeated() =>
      $pb.PbList<CreateVoucherResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateVoucherResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateVoucherResponse>(create);
  static CreateVoucherResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);
}

class GetVoucherRequest extends $pb.GeneratedMessage {
  factory GetVoucherRequest({
    $core.String? refId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    return result;
  }

  GetVoucherRequest._();

  factory GetVoucherRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetVoucherRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetVoucherRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
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

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);
}

class GetVoucherResponse extends $pb.GeneratedMessage {
  factory GetVoucherResponse({
    Voucher? voucher,
  }) {
    final result = create();
    if (voucher != null) result.voucher = voucher;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<Voucher>(1, _omitFieldNames ? '' : 'voucher',
        subBuilder: Voucher.create)
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
  Voucher get voucher => $_getN(0);
  @$pb.TagNumber(1)
  set voucher(Voucher value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasVoucher() => $_has(0);
  @$pb.TagNumber(1)
  void clearVoucher() => $_clearField(1);
  @$pb.TagNumber(1)
  Voucher ensureVoucher() => $_ensure(0);
}

class RedeemVoucherRequest extends $pb.GeneratedMessage {
  factory RedeemVoucherRequest({
    $core.String? refId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    return result;
  }

  RedeemVoucherRequest._();

  factory RedeemVoucherRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RedeemVoucherRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RedeemVoucherRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedeemVoucherRequest clone() =>
      RedeemVoucherRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedeemVoucherRequest copyWith(void Function(RedeemVoucherRequest) updates) =>
      super.copyWith((message) => updates(message as RedeemVoucherRequest))
          as RedeemVoucherRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedeemVoucherRequest create() => RedeemVoucherRequest._();
  @$core.override
  RedeemVoucherRequest createEmptyInstance() => create();
  static $pb.PbList<RedeemVoucherRequest> createRepeated() =>
      $pb.PbList<RedeemVoucherRequest>();
  @$core.pragma('dart2js:noInline')
  static RedeemVoucherRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedeemVoucherRequest>(create);
  static RedeemVoucherRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);
}

class RedeemVoucherResponse extends $pb.GeneratedMessage {
  factory RedeemVoucherResponse({
    $core.bool? success,
    $core.String? error,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (error != null) result.error = error;
    return result;
  }

  RedeemVoucherResponse._();

  factory RedeemVoucherResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RedeemVoucherResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RedeemVoucherResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'error')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedeemVoucherResponse clone() =>
      RedeemVoucherResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RedeemVoucherResponse copyWith(
          void Function(RedeemVoucherResponse) updates) =>
      super.copyWith((message) => updates(message as RedeemVoucherResponse))
          as RedeemVoucherResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RedeemVoucherResponse create() => RedeemVoucherResponse._();
  @$core.override
  RedeemVoucherResponse createEmptyInstance() => create();
  static $pb.PbList<RedeemVoucherResponse> createRepeated() =>
      $pb.PbList<RedeemVoucherResponse>();
  @$core.pragma('dart2js:noInline')
  static RedeemVoucherResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RedeemVoucherResponse>(create);
  static RedeemVoucherResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get error => $_getSZ(1);
  @$pb.TagNumber(2)
  set error($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasError() => $_has(1);
  @$pb.TagNumber(2)
  void clearError() => $_clearField(2);
}

class FindVouchersRequest extends $pb.GeneratedMessage {
  factory FindVouchersRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  FindVouchersRequest._();

  factory FindVouchersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindVouchersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindVouchersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindVouchersRequest clone() => FindVouchersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindVouchersRequest copyWith(void Function(FindVouchersRequest) updates) =>
      super.copyWith((message) => updates(message as FindVouchersRequest))
          as FindVouchersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindVouchersRequest create() => FindVouchersRequest._();
  @$core.override
  FindVouchersRequest createEmptyInstance() => create();
  static $pb.PbList<FindVouchersRequest> createRepeated() =>
      $pb.PbList<FindVouchersRequest>();
  @$core.pragma('dart2js:noInline')
  static FindVouchersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindVouchersRequest>(create);
  static FindVouchersRequest? _defaultInstance;

  /// The store id.
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class FindVouchersResponse extends $pb.GeneratedMessage {
  factory FindVouchersResponse({
    $core.Iterable<Voucher>? vouchers,
  }) {
    final result = create();
    if (vouchers != null) result.vouchers.addAll(vouchers);
    return result;
  }

  FindVouchersResponse._();

  factory FindVouchersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindVouchersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindVouchersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..pc<Voucher>(1, _omitFieldNames ? '' : 'vouchers', $pb.PbFieldType.PM,
        subBuilder: Voucher.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindVouchersResponse clone() =>
      FindVouchersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindVouchersResponse copyWith(void Function(FindVouchersResponse) updates) =>
      super.copyWith((message) => updates(message as FindVouchersResponse))
          as FindVouchersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindVouchersResponse create() => FindVouchersResponse._();
  @$core.override
  FindVouchersResponse createEmptyInstance() => create();
  static $pb.PbList<FindVouchersResponse> createRepeated() =>
      $pb.PbList<FindVouchersResponse>();
  @$core.pragma('dart2js:noInline')
  static FindVouchersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindVouchersResponse>(create);
  static FindVouchersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<Voucher> get vouchers => $_getList(0);
}

class VoucherServiceApi {
  final $pb.RpcClient _client;

  VoucherServiceApi(this._client);

  $async.Future<CreateVoucherResponse> createVoucher(
          $pb.ClientContext? ctx, CreateVoucherRequest request) =>
      _client.invoke<CreateVoucherResponse>(ctx, 'VoucherService',
          'CreateVoucher', request, CreateVoucherResponse());
  $async.Future<GetVoucherResponse> getVoucher(
          $pb.ClientContext? ctx, GetVoucherRequest request) =>
      _client.invoke<GetVoucherResponse>(
          ctx, 'VoucherService', 'GetVoucher', request, GetVoucherResponse());
  $async.Future<RedeemVoucherResponse> redeemVoucher(
          $pb.ClientContext? ctx, RedeemVoucherRequest request) =>
      _client.invoke<RedeemVoucherResponse>(ctx, 'VoucherService',
          'RedeemVoucher', request, RedeemVoucherResponse());
  $async.Future<FindVouchersResponse> findVouchers(
          $pb.ClientContext? ctx, FindVouchersRequest request) =>
      _client.invoke<FindVouchersResponse>(ctx, 'VoucherService',
          'FindVouchers', request, FindVouchersResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
