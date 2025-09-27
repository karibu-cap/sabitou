// This is a generated file - do not edit.
//
// Generated from inventory/v1/stock_in_bound.proto.

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
import 'stock_in_bound.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'stock_in_bound.pbenum.dart';

/// Tracks all stock additions to inventory
class StockInbound extends $pb.GeneratedMessage {
  factory StockInbound({
    $core.String? refId,
    $core.String? globalProductId,
    InboundType? inboundType,
    $core.int? quantity,
    $core.int? quantityBefore,
    $core.int? quantityAfter,
    $core.int? unitCost,
    $core.String? supplierId,
    $core.String? referenceNumber,
    $core.String? batchNumber,
    $core.String? reason,
    $0.Timestamp? batchExpiryDate,
    $0.Timestamp? createdAt,
    $core.String? performedBy,
    $core.String? storeId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (globalProductId != null) result.globalProductId = globalProductId;
    if (inboundType != null) result.inboundType = inboundType;
    if (quantity != null) result.quantity = quantity;
    if (quantityBefore != null) result.quantityBefore = quantityBefore;
    if (quantityAfter != null) result.quantityAfter = quantityAfter;
    if (unitCost != null) result.unitCost = unitCost;
    if (supplierId != null) result.supplierId = supplierId;
    if (referenceNumber != null) result.referenceNumber = referenceNumber;
    if (batchNumber != null) result.batchNumber = batchNumber;
    if (reason != null) result.reason = reason;
    if (batchExpiryDate != null) result.batchExpiryDate = batchExpiryDate;
    if (createdAt != null) result.createdAt = createdAt;
    if (performedBy != null) result.performedBy = performedBy;
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  StockInbound._();

  factory StockInbound.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StockInbound.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StockInbound',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'globalProductId')
    ..e<InboundType>(
        3, _omitFieldNames ? '' : 'inboundType', $pb.PbFieldType.OE,
        defaultOrMaker: InboundType.INBOUND_TYPE_UNSPECIFIED,
        valueOf: InboundType.valueOf,
        enumValues: InboundType.values)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'quantityBefore', $pb.PbFieldType.O3)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'quantityAfter', $pb.PbFieldType.O3)
    ..a<$core.int>(7, _omitFieldNames ? '' : 'unitCost', $pb.PbFieldType.O3)
    ..aOS(8, _omitFieldNames ? '' : 'supplierId')
    ..aOS(9, _omitFieldNames ? '' : 'referenceNumber')
    ..aOS(10, _omitFieldNames ? '' : 'batchNumber')
    ..aOS(11, _omitFieldNames ? '' : 'reason')
    ..aOM<$0.Timestamp>(12, _omitFieldNames ? '' : 'batchExpiryDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(13, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(14, _omitFieldNames ? '' : 'performedBy')
    ..aOS(15, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockInbound clone() => StockInbound()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StockInbound copyWith(void Function(StockInbound) updates) =>
      super.copyWith((message) => updates(message as StockInbound))
          as StockInbound;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StockInbound create() => StockInbound._();
  @$core.override
  StockInbound createEmptyInstance() => create();
  static $pb.PbList<StockInbound> createRepeated() =>
      $pb.PbList<StockInbound>();
  @$core.pragma('dart2js:noInline')
  static StockInbound getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StockInbound>(create);
  static StockInbound? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The unique identifier of the global product.
  @$pb.TagNumber(2)
  $core.String get globalProductId => $_getSZ(1);
  @$pb.TagNumber(2)
  set globalProductId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasGlobalProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearGlobalProductId() => $_clearField(2);

  /// Type of inbound stock
  @$pb.TagNumber(3)
  InboundType get inboundType => $_getN(2);
  @$pb.TagNumber(3)
  set inboundType(InboundType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasInboundType() => $_has(2);
  @$pb.TagNumber(3)
  void clearInboundType() => $_clearField(3);

  /// Quantity added to inventory
  @$pb.TagNumber(4)
  $core.int get quantity => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantity($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => $_clearField(4);

  /// Stock quantity before this transaction
  @$pb.TagNumber(5)
  $core.int get quantityBefore => $_getIZ(4);
  @$pb.TagNumber(5)
  set quantityBefore($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQuantityBefore() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuantityBefore() => $_clearField(5);

  /// Stock quantity after this transaction
  @$pb.TagNumber(6)
  $core.int get quantityAfter => $_getIZ(5);
  @$pb.TagNumber(6)
  set quantityAfter($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasQuantityAfter() => $_has(5);
  @$pb.TagNumber(6)
  void clearQuantityAfter() => $_clearField(6);

  /// Purchase/cost price per unit
  @$pb.TagNumber(7)
  $core.int get unitCost => $_getIZ(6);
  @$pb.TagNumber(7)
  set unitCost($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUnitCost() => $_has(6);
  @$pb.TagNumber(7)
  void clearUnitCost() => $_clearField(7);

  /// Supplier ID (for stock in transactions)
  @$pb.TagNumber(8)
  $core.String get supplierId => $_getSZ(7);
  @$pb.TagNumber(8)
  set supplierId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSupplierId() => $_has(7);
  @$pb.TagNumber(8)
  void clearSupplierId() => $_clearField(8);

  /// Reference number (PO number, invoice number, etc.)
  @$pb.TagNumber(9)
  $core.String get referenceNumber => $_getSZ(8);
  @$pb.TagNumber(9)
  set referenceNumber($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasReferenceNumber() => $_has(8);
  @$pb.TagNumber(9)
  void clearReferenceNumber() => $_clearField(9);

  /// Batch/lot number (for traceability if needed)
  @$pb.TagNumber(10)
  $core.String get batchNumber => $_getSZ(9);
  @$pb.TagNumber(10)
  set batchNumber($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasBatchNumber() => $_has(9);
  @$pb.TagNumber(10)
  void clearBatchNumber() => $_clearField(10);

  /// Reason for the transaction (especially for adjustments)
  @$pb.TagNumber(11)
  $core.String get reason => $_getSZ(10);
  @$pb.TagNumber(11)
  set reason($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasReason() => $_has(10);
  @$pb.TagNumber(11)
  void clearReason() => $_clearField(11);

  /// Expiration date for this batch (if applicable)
  @$pb.TagNumber(12)
  $0.Timestamp get batchExpiryDate => $_getN(11);
  @$pb.TagNumber(12)
  set batchExpiryDate($0.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasBatchExpiryDate() => $_has(11);
  @$pb.TagNumber(12)
  void clearBatchExpiryDate() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureBatchExpiryDate() => $_ensure(11);

  /// When this supply was received/processed
  @$pb.TagNumber(13)
  $0.Timestamp get createdAt => $_getN(12);
  @$pb.TagNumber(13)
  set createdAt($0.Timestamp value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasCreatedAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearCreatedAt() => $_clearField(13);
  @$pb.TagNumber(13)
  $0.Timestamp ensureCreatedAt() => $_ensure(12);

  /// User who performed the transaction
  @$pb.TagNumber(14)
  $core.String get performedBy => $_getSZ(13);
  @$pb.TagNumber(14)
  set performedBy($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasPerformedBy() => $_has(13);
  @$pb.TagNumber(14)
  void clearPerformedBy() => $_clearField(14);

  /// The store id
  @$pb.TagNumber(15)
  $core.String get storeId => $_getSZ(14);
  @$pb.TagNumber(15)
  set storeId($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasStoreId() => $_has(14);
  @$pb.TagNumber(15)
  void clearStoreId() => $_clearField(15);
}

class CreateStockInboundRequest extends $pb.GeneratedMessage {
  factory CreateStockInboundRequest({
    StockInbound? stockInbound,
  }) {
    final result = create();
    if (stockInbound != null) result.stockInbound = stockInbound;
    return result;
  }

  CreateStockInboundRequest._();

  factory CreateStockInboundRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStockInboundRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStockInboundRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<StockInbound>(1, _omitFieldNames ? '' : 'stockInbound',
        subBuilder: StockInbound.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStockInboundRequest clone() =>
      CreateStockInboundRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStockInboundRequest copyWith(
          void Function(CreateStockInboundRequest) updates) =>
      super.copyWith((message) => updates(message as CreateStockInboundRequest))
          as CreateStockInboundRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStockInboundRequest create() => CreateStockInboundRequest._();
  @$core.override
  CreateStockInboundRequest createEmptyInstance() => create();
  static $pb.PbList<CreateStockInboundRequest> createRepeated() =>
      $pb.PbList<CreateStockInboundRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateStockInboundRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStockInboundRequest>(create);
  static CreateStockInboundRequest? _defaultInstance;

  /// The stock inbound to create.
  @$pb.TagNumber(1)
  StockInbound get stockInbound => $_getN(0);
  @$pb.TagNumber(1)
  set stockInbound(StockInbound value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStockInbound() => $_has(0);
  @$pb.TagNumber(1)
  void clearStockInbound() => $_clearField(1);
  @$pb.TagNumber(1)
  StockInbound ensureStockInbound() => $_ensure(0);
}

class CreateStockInboundResponse extends $pb.GeneratedMessage {
  factory CreateStockInboundResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  CreateStockInboundResponse._();

  factory CreateStockInboundResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateStockInboundResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateStockInboundResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStockInboundResponse clone() =>
      CreateStockInboundResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateStockInboundResponse copyWith(
          void Function(CreateStockInboundResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateStockInboundResponse))
          as CreateStockInboundResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateStockInboundResponse create() => CreateStockInboundResponse._();
  @$core.override
  CreateStockInboundResponse createEmptyInstance() => create();
  static $pb.PbList<CreateStockInboundResponse> createRepeated() =>
      $pb.PbList<CreateStockInboundResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateStockInboundResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateStockInboundResponse>(create);
  static CreateStockInboundResponse? _defaultInstance;

  /// Whether the stock inbound was successfully created.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

/// Limit the update to only (reason, quantity for return or adjustment, performed_by)
class UpdateStockInboundRequest extends $pb.GeneratedMessage {
  factory UpdateStockInboundRequest({
    $core.String? refId,
    $core.int? quantity,
    $core.String? reason,
    $core.String? performedBy,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (quantity != null) result.quantity = quantity;
    if (reason != null) result.reason = reason;
    if (performedBy != null) result.performedBy = performedBy;
    return result;
  }

  UpdateStockInboundRequest._();

  factory UpdateStockInboundRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStockInboundRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStockInboundRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..aOS(3, _omitFieldNames ? '' : 'reason')
    ..aOS(4, _omitFieldNames ? '' : 'performedBy')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStockInboundRequest clone() =>
      UpdateStockInboundRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStockInboundRequest copyWith(
          void Function(UpdateStockInboundRequest) updates) =>
      super.copyWith((message) => updates(message as UpdateStockInboundRequest))
          as UpdateStockInboundRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStockInboundRequest create() => UpdateStockInboundRequest._();
  @$core.override
  UpdateStockInboundRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateStockInboundRequest> createRepeated() =>
      $pb.PbList<UpdateStockInboundRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateStockInboundRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStockInboundRequest>(create);
  static UpdateStockInboundRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The quantity to update.
  /// Note the quantity  can be negative for adjustments.
  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get reason => $_getSZ(2);
  @$pb.TagNumber(3)
  set reason($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasReason() => $_has(2);
  @$pb.TagNumber(3)
  void clearReason() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get performedBy => $_getSZ(3);
  @$pb.TagNumber(4)
  set performedBy($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPerformedBy() => $_has(3);
  @$pb.TagNumber(4)
  void clearPerformedBy() => $_clearField(4);
}

class UpdateStockInboundResponse extends $pb.GeneratedMessage {
  factory UpdateStockInboundResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  UpdateStockInboundResponse._();

  factory UpdateStockInboundResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateStockInboundResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateStockInboundResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStockInboundResponse clone() =>
      UpdateStockInboundResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateStockInboundResponse copyWith(
          void Function(UpdateStockInboundResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateStockInboundResponse))
          as UpdateStockInboundResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateStockInboundResponse create() => UpdateStockInboundResponse._();
  @$core.override
  UpdateStockInboundResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateStockInboundResponse> createRepeated() =>
      $pb.PbList<UpdateStockInboundResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateStockInboundResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateStockInboundResponse>(create);
  static UpdateStockInboundResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class FindStockInboundRequest extends $pb.GeneratedMessage {
  factory FindStockInboundRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  FindStockInboundRequest._();

  factory FindStockInboundRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindStockInboundRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindStockInboundRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStockInboundRequest clone() =>
      FindStockInboundRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStockInboundRequest copyWith(
          void Function(FindStockInboundRequest) updates) =>
      super.copyWith((message) => updates(message as FindStockInboundRequest))
          as FindStockInboundRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindStockInboundRequest create() => FindStockInboundRequest._();
  @$core.override
  FindStockInboundRequest createEmptyInstance() => create();
  static $pb.PbList<FindStockInboundRequest> createRepeated() =>
      $pb.PbList<FindStockInboundRequest>();
  @$core.pragma('dart2js:noInline')
  static FindStockInboundRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindStockInboundRequest>(create);
  static FindStockInboundRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class FindStockInboundResponse extends $pb.GeneratedMessage {
  factory FindStockInboundResponse({
    $core.Iterable<StockInbound>? stockInbounds,
  }) {
    final result = create();
    if (stockInbounds != null) result.stockInbounds.addAll(stockInbounds);
    return result;
  }

  FindStockInboundResponse._();

  factory FindStockInboundResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindStockInboundResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindStockInboundResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pc<StockInbound>(
        1, _omitFieldNames ? '' : 'stockInbounds', $pb.PbFieldType.PM,
        subBuilder: StockInbound.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStockInboundResponse clone() =>
      FindStockInboundResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindStockInboundResponse copyWith(
          void Function(FindStockInboundResponse) updates) =>
      super.copyWith((message) => updates(message as FindStockInboundResponse))
          as FindStockInboundResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindStockInboundResponse create() => FindStockInboundResponse._();
  @$core.override
  FindStockInboundResponse createEmptyInstance() => create();
  static $pb.PbList<FindStockInboundResponse> createRepeated() =>
      $pb.PbList<FindStockInboundResponse>();
  @$core.pragma('dart2js:noInline')
  static FindStockInboundResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindStockInboundResponse>(create);
  static FindStockInboundResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<StockInbound> get stockInbounds => $_getList(0);
}

class StockInboundServiceApi {
  final $pb.RpcClient _client;

  StockInboundServiceApi(this._client);

  /// Creates a stock in bound.
  $async.Future<CreateStockInboundResponse> createStockInbound(
          $pb.ClientContext? ctx, CreateStockInboundRequest request) =>
      _client.invoke<CreateStockInboundResponse>(ctx, 'StockInboundService',
          'CreateStockInbound', request, CreateStockInboundResponse());

  /// Updates the stock in bound.
  $async.Future<UpdateStockInboundResponse> updateStockInbound(
          $pb.ClientContext? ctx, UpdateStockInboundRequest request) =>
      _client.invoke<UpdateStockInboundResponse>(ctx, 'StockInboundService',
          'UpdateStockInbound', request, UpdateStockInboundResponse());

  /// Finds the stock in bounds.
  $async.Future<FindStockInboundResponse> findStockInbounds(
          $pb.ClientContext? ctx, FindStockInboundRequest request) =>
      _client.invoke<FindStockInboundResponse>(ctx, 'StockInboundService',
          'FindStockInbounds', request, FindStockInboundResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
