// This is a generated file - do not edit.
//
// Generated from transaction/v1/transactions.proto.

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

import 'transactions.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'transactions.pbenum.dart';

/// The Transaction represents an entry of actions impacting the stock or finances,
/// such as sales, purchases, refunds, stock adjustments, or stock transfers.
/// It ensures traceability of operations by capturing the user, date, product,
/// associated order, amount or quantity, for audit and reports.
class Transaction extends $pb.GeneratedMessage {
  factory Transaction({
    $core.String? refId,
    TransactionType? type,
    TransactionStatus? status,
    $core.String? businessId,
    $core.String? storeId,
    $core.String? orderId,
    $core.String? fromId,
    $fixnum.Int64? amountInCents,
    $core.String? currencyCode,
    $core.String? createdAt,
    $core.String? updatedAt,
    $core.String? description,
    $core.String? businessProductId,
    $core.int? quantity,
    $core.String? initiatedBy,
    $core.Iterable<$core.String>? externalLinksIds,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (type != null) result.type = type;
    if (status != null) result.status = status;
    if (businessId != null) result.businessId = businessId;
    if (storeId != null) result.storeId = storeId;
    if (orderId != null) result.orderId = orderId;
    if (fromId != null) result.fromId = fromId;
    if (amountInCents != null) result.amountInCents = amountInCents;
    if (currencyCode != null) result.currencyCode = currencyCode;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (description != null) result.description = description;
    if (businessProductId != null) result.businessProductId = businessProductId;
    if (quantity != null) result.quantity = quantity;
    if (initiatedBy != null) result.initiatedBy = initiatedBy;
    if (externalLinksIds != null)
      result.externalLinksIds.addAll(externalLinksIds);
    return result;
  }

  Transaction._();

  factory Transaction.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Transaction.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Transaction',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..e<TransactionType>(2, _omitFieldNames ? '' : 'type', $pb.PbFieldType.OE,
        defaultOrMaker: TransactionType.TRANSACTION_TYPE_UNSPECIFIED,
        valueOf: TransactionType.valueOf,
        enumValues: TransactionType.values)
    ..e<TransactionStatus>(
        3, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: TransactionStatus.TRANSACTION_STATUS_UNSPECIFIED,
        valueOf: TransactionStatus.valueOf,
        enumValues: TransactionStatus.values)
    ..aOS(4, _omitFieldNames ? '' : 'businessId')
    ..aOS(5, _omitFieldNames ? '' : 'storeId')
    ..aOS(6, _omitFieldNames ? '' : 'orderId')
    ..aOS(7, _omitFieldNames ? '' : 'fromId')
    ..aInt64(8, _omitFieldNames ? '' : 'amountInCents')
    ..aOS(9, _omitFieldNames ? '' : 'currencyCode')
    ..aOS(10, _omitFieldNames ? '' : 'createdAt')
    ..aOS(11, _omitFieldNames ? '' : 'updatedAt')
    ..aOS(12, _omitFieldNames ? '' : 'description')
    ..aOS(13, _omitFieldNames ? '' : 'businessProductId')
    ..a<$core.int>(14, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..aOS(15, _omitFieldNames ? '' : 'initiatedBy')
    ..pPS(16, _omitFieldNames ? '' : 'externalLinksIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction clone() => Transaction()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Transaction copyWith(void Function(Transaction) updates) =>
      super.copyWith((message) => updates(message as Transaction))
          as Transaction;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Transaction create() => Transaction._();
  @$core.override
  Transaction createEmptyInstance() => create();
  static $pb.PbList<Transaction> createRepeated() => $pb.PbList<Transaction>();
  @$core.pragma('dart2js:noInline')
  static Transaction getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<Transaction>(create);
  static Transaction? _defaultInstance;

  /// The unique identifier of the transaction.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The type of the transaction (sale, purchase, refund, etc.).
  @$pb.TagNumber(2)
  TransactionType get type => $_getN(1);
  @$pb.TagNumber(2)
  set type(TransactionType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasType() => $_has(1);
  @$pb.TagNumber(2)
  void clearType() => $_clearField(2);

  /// The status of the transaction (pending, completed, failed, cancelled).
  @$pb.TagNumber(3)
  TransactionStatus get status => $_getN(2);
  @$pb.TagNumber(3)
  set status(TransactionStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearStatus() => $_clearField(3);

  /// The unique identifier of the business associated with the transaction.
  @$pb.TagNumber(4)
  $core.String get businessId => $_getSZ(3);
  @$pb.TagNumber(4)
  set businessId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBusinessId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBusinessId() => $_clearField(4);

  /// The unique identifier of the store associated with the transaction.
  @$pb.TagNumber(5)
  $core.String get storeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set storeId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStoreId() => $_has(4);
  @$pb.TagNumber(5)
  void clearStoreId() => $_clearField(5);

  /// The unique identifier of the order associated with the transaction.
  @$pb.TagNumber(6)
  $core.String get orderId => $_getSZ(5);
  @$pb.TagNumber(6)
  set orderId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasOrderId() => $_has(5);
  @$pb.TagNumber(6)
  void clearOrderId() => $_clearField(6);

  /// The unique identifier of the client or supplier associated with the transaction.
  @$pb.TagNumber(7)
  $core.String get fromId => $_getSZ(6);
  @$pb.TagNumber(7)
  set fromId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasFromId() => $_has(6);
  @$pb.TagNumber(7)
  void clearFromId() => $_clearField(7);

  /// The amount of the transaction in cents.
  @$pb.TagNumber(8)
  $fixnum.Int64 get amountInCents => $_getI64(7);
  @$pb.TagNumber(8)
  set amountInCents($fixnum.Int64 value) => $_setInt64(7, value);
  @$pb.TagNumber(8)
  $core.bool hasAmountInCents() => $_has(7);
  @$pb.TagNumber(8)
  void clearAmountInCents() => $_clearField(8);

  /// The currency code of the transaction (ISO 4217).
  @$pb.TagNumber(9)
  $core.String get currencyCode => $_getSZ(8);
  @$pb.TagNumber(9)
  set currencyCode($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCurrencyCode() => $_has(8);
  @$pb.TagNumber(9)
  void clearCurrencyCode() => $_clearField(9);

  /// The creation date of the transaction (ISO 8601).
  @$pb.TagNumber(10)
  $core.String get createdAt => $_getSZ(9);
  @$pb.TagNumber(10)
  set createdAt($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);

  /// The update date of the transaction (ISO 8601).
  @$pb.TagNumber(11)
  $core.String get updatedAt => $_getSZ(10);
  @$pb.TagNumber(11)
  set updatedAt($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasUpdatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearUpdatedAt() => $_clearField(11);

  /// The description or note of the transaction (ex. : "Refund for order cancellation").
  @$pb.TagNumber(12)
  $core.String get description => $_getSZ(11);
  @$pb.TagNumber(12)
  set description($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasDescription() => $_has(11);
  @$pb.TagNumber(12)
  void clearDescription() => $_clearField(12);

  /// The unique identifier of the business product associated with the transaction.
  @$pb.TagNumber(13)
  $core.String get businessProductId => $_getSZ(12);
  @$pb.TagNumber(13)
  set businessProductId($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasBusinessProductId() => $_has(12);
  @$pb.TagNumber(13)
  void clearBusinessProductId() => $_clearField(13);

  /// The quantity associated with the transaction (optional, for stock adjustments or stock transfers).
  @$pb.TagNumber(14)
  $core.int get quantity => $_getIZ(13);
  @$pb.TagNumber(14)
  set quantity($core.int value) => $_setSignedInt32(13, value);
  @$pb.TagNumber(14)
  $core.bool hasQuantity() => $_has(13);
  @$pb.TagNumber(14)
  void clearQuantity() => $_clearField(14);

  /// The unique identifier of the user who initiated the transaction.
  @$pb.TagNumber(15)
  $core.String get initiatedBy => $_getSZ(14);
  @$pb.TagNumber(15)
  set initiatedBy($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasInitiatedBy() => $_has(14);
  @$pb.TagNumber(15)
  void clearInitiatedBy() => $_clearField(15);

  /// The external links of the transaction (ex. : payment receipt, invoice).
  @$pb.TagNumber(16)
  $pb.PbList<$core.String> get externalLinksIds => $_getList(15);
}

class AddTransactionRequest extends $pb.GeneratedMessage {
  factory AddTransactionRequest({
    Transaction? transaction,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    return result;
  }

  AddTransactionRequest._();

  factory AddTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTransactionRequest clone() =>
      AddTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTransactionRequest copyWith(
          void Function(AddTransactionRequest) updates) =>
      super.copyWith((message) => updates(message as AddTransactionRequest))
          as AddTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTransactionRequest create() => AddTransactionRequest._();
  @$core.override
  AddTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<AddTransactionRequest> createRepeated() =>
      $pb.PbList<AddTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static AddTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddTransactionRequest>(create);
  static AddTransactionRequest? _defaultInstance;

  /// The transaction to add.
  @$pb.TagNumber(1)
  Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(Transaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  Transaction ensureTransaction() => $_ensure(0);
}

class AddTransactionResponse extends $pb.GeneratedMessage {
  factory AddTransactionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  AddTransactionResponse._();

  factory AddTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory AddTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'AddTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTransactionResponse clone() =>
      AddTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  AddTransactionResponse copyWith(
          void Function(AddTransactionResponse) updates) =>
      super.copyWith((message) => updates(message as AddTransactionResponse))
          as AddTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static AddTransactionResponse create() => AddTransactionResponse._();
  @$core.override
  AddTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<AddTransactionResponse> createRepeated() =>
      $pb.PbList<AddTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static AddTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<AddTransactionResponse>(create);
  static AddTransactionResponse? _defaultInstance;

  /// Whether the transaction was successfully added.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class GetTransactionRequest extends $pb.GeneratedMessage {
  factory GetTransactionRequest({
    $core.String? transactionId,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    return result;
  }

  GetTransactionRequest._();

  factory GetTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transactionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionRequest clone() =>
      GetTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionRequest copyWith(
          void Function(GetTransactionRequest) updates) =>
      super.copyWith((message) => updates(message as GetTransactionRequest))
          as GetTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionRequest create() => GetTransactionRequest._();
  @$core.override
  GetTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<GetTransactionRequest> createRepeated() =>
      $pb.PbList<GetTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTransactionRequest>(create);
  static GetTransactionRequest? _defaultInstance;

  /// The unique identifier of the transaction.
  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => $_clearField(1);
}

class GetTransactionResponse extends $pb.GeneratedMessage {
  factory GetTransactionResponse({
    Transaction? transaction,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    return result;
  }

  GetTransactionResponse._();

  factory GetTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionResponse clone() =>
      GetTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetTransactionResponse copyWith(
          void Function(GetTransactionResponse) updates) =>
      super.copyWith((message) => updates(message as GetTransactionResponse))
          as GetTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetTransactionResponse create() => GetTransactionResponse._();
  @$core.override
  GetTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<GetTransactionResponse> createRepeated() =>
      $pb.PbList<GetTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static GetTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetTransactionResponse>(create);
  static GetTransactionResponse? _defaultInstance;

  /// The retrieved transaction.
  @$pb.TagNumber(1)
  Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(Transaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  Transaction ensureTransaction() => $_ensure(0);
}

class UpdateTransactionRequest extends $pb.GeneratedMessage {
  factory UpdateTransactionRequest({
    Transaction? transaction,
  }) {
    final result = create();
    if (transaction != null) result.transaction = transaction;
    return result;
  }

  UpdateTransactionRequest._();

  factory UpdateTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOM<Transaction>(1, _omitFieldNames ? '' : 'transaction',
        subBuilder: Transaction.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTransactionRequest clone() =>
      UpdateTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTransactionRequest copyWith(
          void Function(UpdateTransactionRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateTransactionRequest))
          as UpdateTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTransactionRequest create() => UpdateTransactionRequest._();
  @$core.override
  UpdateTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateTransactionRequest> createRepeated() =>
      $pb.PbList<UpdateTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateTransactionRequest>(create);
  static UpdateTransactionRequest? _defaultInstance;

  /// The transaction to update.
  @$pb.TagNumber(1)
  Transaction get transaction => $_getN(0);
  @$pb.TagNumber(1)
  set transaction(Transaction value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasTransaction() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransaction() => $_clearField(1);
  @$pb.TagNumber(1)
  Transaction ensureTransaction() => $_ensure(0);
}

class UpdateTransactionResponse extends $pb.GeneratedMessage {
  factory UpdateTransactionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateTransactionResponse._();

  factory UpdateTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTransactionResponse clone() =>
      UpdateTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateTransactionResponse copyWith(
          void Function(UpdateTransactionResponse) updates) =>
      super.copyWith((message) => updates(message as UpdateTransactionResponse))
          as UpdateTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateTransactionResponse create() => UpdateTransactionResponse._();
  @$core.override
  UpdateTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateTransactionResponse> createRepeated() =>
      $pb.PbList<UpdateTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateTransactionResponse>(create);
  static UpdateTransactionResponse? _defaultInstance;

  /// Whether the transaction was successfully updated.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class DeleteTransactionRequest extends $pb.GeneratedMessage {
  factory DeleteTransactionRequest({
    $core.String? transactionId,
  }) {
    final result = create();
    if (transactionId != null) result.transactionId = transactionId;
    return result;
  }

  DeleteTransactionRequest._();

  factory DeleteTransactionRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteTransactionRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteTransactionRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'transactionId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTransactionRequest clone() =>
      DeleteTransactionRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTransactionRequest copyWith(
          void Function(DeleteTransactionRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteTransactionRequest))
          as DeleteTransactionRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTransactionRequest create() => DeleteTransactionRequest._();
  @$core.override
  DeleteTransactionRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteTransactionRequest> createRepeated() =>
      $pb.PbList<DeleteTransactionRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteTransactionRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteTransactionRequest>(create);
  static DeleteTransactionRequest? _defaultInstance;

  /// The unique identifier of the transaction.
  @$pb.TagNumber(1)
  $core.String get transactionId => $_getSZ(0);
  @$pb.TagNumber(1)
  set transactionId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTransactionId() => $_has(0);
  @$pb.TagNumber(1)
  void clearTransactionId() => $_clearField(1);
}

class DeleteTransactionResponse extends $pb.GeneratedMessage {
  factory DeleteTransactionResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteTransactionResponse._();

  factory DeleteTransactionResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteTransactionResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteTransactionResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'transaction.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTransactionResponse clone() =>
      DeleteTransactionResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteTransactionResponse copyWith(
          void Function(DeleteTransactionResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteTransactionResponse))
          as DeleteTransactionResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteTransactionResponse create() => DeleteTransactionResponse._();
  @$core.override
  DeleteTransactionResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteTransactionResponse> createRepeated() =>
      $pb.PbList<DeleteTransactionResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteTransactionResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteTransactionResponse>(create);
  static DeleteTransactionResponse? _defaultInstance;

  /// Whether the transaction was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class TransactionServiceApi {
  final $pb.RpcClient _client;

  TransactionServiceApi(this._client);

  /// Adds a transaction.
  $async.Future<AddTransactionResponse> addTransaction(
          $pb.ClientContext? ctx, AddTransactionRequest request) =>
      _client.invoke<AddTransactionResponse>(ctx, 'TransactionService',
          'AddTransaction', request, AddTransactionResponse());

  /// Gets a transaction by id.
  $async.Future<GetTransactionResponse> getTransaction(
          $pb.ClientContext? ctx, GetTransactionRequest request) =>
      _client.invoke<GetTransactionResponse>(ctx, 'TransactionService',
          'GetTransaction', request, GetTransactionResponse());

  /// Updates a transaction.
  $async.Future<UpdateTransactionResponse> updateTransaction(
          $pb.ClientContext? ctx, UpdateTransactionRequest request) =>
      _client.invoke<UpdateTransactionResponse>(ctx, 'TransactionService',
          'UpdateTransaction', request, UpdateTransactionResponse());

  /// Deletes a transaction.
  $async.Future<DeleteTransactionResponse> deleteTransaction(
          $pb.ClientContext? ctx, DeleteTransactionRequest request) =>
      _client.invoke<DeleteTransactionResponse>(ctx, 'TransactionService',
          'DeleteTransaction', request, DeleteTransactionResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
