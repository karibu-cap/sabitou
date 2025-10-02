// This is a generated file - do not edit.
//
// Generated from logistic/v1/receiving_notes.proto.

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
import 'receiving_notes.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'receiving_notes.pbenum.dart';

/// *
///  ReceivingNote (Bon de Réception)
///  Created when YOU receive goods from a supplier.
///  THIS IS WHAT INCREASES YOUR INVENTORY.
///
///  Flow: Goods arrive → Inspect → Create ReceivingNote → Update inventory
///
///  Example:
///    rn_id: "RN-2025-001"
///    related_purchase_order_id: "PO-2025-001"
///    supplier_id: "CMP-002"
///    buyer_id: "WH-001"
///    items: [48x PRD-001] (expected 50, but 2 damaged)
///    status: RN_STATUS_COMPLETED
///
///  INVENTORY IMPACT: +48 PRD-001 in WH-001
class ReceivingNote extends $pb.GeneratedMessage {
  factory ReceivingNote({
    $core.String? documentId,
    $core.String? relatedPurchaseOrderId,
    $core.String? supplierId,
    $core.String? buyerId,
    ReceivingNoteStatus? status,
    $core.Iterable<ReceivingLineItem>? items,
    $core.String? receivedByUserId,
    $0.Timestamp? receivedAt,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (relatedPurchaseOrderId != null)
      result.relatedPurchaseOrderId = relatedPurchaseOrderId;
    if (supplierId != null) result.supplierId = supplierId;
    if (buyerId != null) result.buyerId = buyerId;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (receivedByUserId != null) result.receivedByUserId = receivedByUserId;
    if (receivedAt != null) result.receivedAt = receivedAt;
    if (notes != null) result.notes = notes;
    return result;
  }

  ReceivingNote._();

  factory ReceivingNote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReceivingNote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReceivingNote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedPurchaseOrderId')
    ..aOS(3, _omitFieldNames ? '' : 'supplierId')
    ..aOS(4, _omitFieldNames ? '' : 'buyerId')
    ..e<ReceivingNoteStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ReceivingNoteStatus.RN_STATUS_UNSPECIFIED,
        valueOf: ReceivingNoteStatus.valueOf,
        enumValues: ReceivingNoteStatus.values)
    ..pc<ReceivingLineItem>(
        6, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: ReceivingLineItem.create)
    ..aOS(7, _omitFieldNames ? '' : 'receivedByUserId')
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'receivedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(9, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceivingNote clone() => ReceivingNote()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceivingNote copyWith(void Function(ReceivingNote) updates) =>
      super.copyWith((message) => updates(message as ReceivingNote))
          as ReceivingNote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceivingNote create() => ReceivingNote._();
  @$core.override
  ReceivingNote createEmptyInstance() => create();
  static $pb.PbList<ReceivingNote> createRepeated() =>
      $pb.PbList<ReceivingNote>();
  @$core.pragma('dart2js:noInline')
  static ReceivingNote getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReceivingNote>(create);
  static ReceivingNote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get relatedPurchaseOrderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set relatedPurchaseOrderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRelatedPurchaseOrderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelatedPurchaseOrderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get supplierId => $_getSZ(2);
  @$pb.TagNumber(3)
  set supplierId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSupplierId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSupplierId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get buyerId => $_getSZ(3);
  @$pb.TagNumber(4)
  set buyerId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBuyerId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBuyerId() => $_clearField(4);

  @$pb.TagNumber(5)
  ReceivingNoteStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(ReceivingNoteStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<ReceivingLineItem> get items => $_getList(5);

  @$pb.TagNumber(7)
  $core.String get receivedByUserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set receivedByUserId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasReceivedByUserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceivedByUserId() => $_clearField(7);

  @$pb.TagNumber(8)
  $0.Timestamp get receivedAt => $_getN(7);
  @$pb.TagNumber(8)
  set receivedAt($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasReceivedAt() => $_has(7);
  @$pb.TagNumber(8)
  void clearReceivedAt() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureReceivedAt() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.String get notes => $_getSZ(8);
  @$pb.TagNumber(9)
  set notes($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasNotes() => $_has(8);
  @$pb.TagNumber(9)
  void clearNotes() => $_clearField(9);
}

/// *
///  ReceivingLineItem shows what was actually received vs expected.
///
///  Example:
///    product_id: "PRD-001"
///    quantity_expected: 50
///    quantity_received: 48
///    quantity_rejected: 2 (damaged)
///    rejection_reason: "Damaged packaging"
///    batch_id: "BATCH-2025-001" (generated)
///    expiration_date: 2026-09-29T00:00:00Z
class ReceivingLineItem extends $pb.GeneratedMessage {
  factory ReceivingLineItem({
    $core.String? productId,
    $core.double? quantityExpected,
    $core.double? quantityReceived,
    $core.double? quantityRejected,
    $core.String? rejectionReason,
    $core.String? batchId,
    $0.Timestamp? expirationDate,
    $core.int? purchasePrice,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (quantityExpected != null) result.quantityExpected = quantityExpected;
    if (quantityReceived != null) result.quantityReceived = quantityReceived;
    if (quantityRejected != null) result.quantityRejected = quantityRejected;
    if (rejectionReason != null) result.rejectionReason = rejectionReason;
    if (batchId != null) result.batchId = batchId;
    if (expirationDate != null) result.expirationDate = expirationDate;
    if (purchasePrice != null) result.purchasePrice = purchasePrice;
    return result;
  }

  ReceivingLineItem._();

  factory ReceivingLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReceivingLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReceivingLineItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..a<$core.double>(
        2, _omitFieldNames ? '' : 'quantityExpected', $pb.PbFieldType.OD)
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'quantityReceived', $pb.PbFieldType.OD)
    ..a<$core.double>(
        4, _omitFieldNames ? '' : 'quantityRejected', $pb.PbFieldType.OD)
    ..aOS(5, _omitFieldNames ? '' : 'rejectionReason')
    ..aOS(6, _omitFieldNames ? '' : 'batchId')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'expirationDate',
        subBuilder: $0.Timestamp.create)
    ..a<$core.int>(
        8, _omitFieldNames ? '' : 'purchasePrice', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceivingLineItem clone() => ReceivingLineItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceivingLineItem copyWith(void Function(ReceivingLineItem) updates) =>
      super.copyWith((message) => updates(message as ReceivingLineItem))
          as ReceivingLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceivingLineItem create() => ReceivingLineItem._();
  @$core.override
  ReceivingLineItem createEmptyInstance() => create();
  static $pb.PbList<ReceivingLineItem> createRepeated() =>
      $pb.PbList<ReceivingLineItem>();
  @$core.pragma('dart2js:noInline')
  static ReceivingLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReceivingLineItem>(create);
  static ReceivingLineItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get quantityExpected => $_getN(1);
  @$pb.TagNumber(2)
  set quantityExpected($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantityExpected() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantityExpected() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get quantityReceived => $_getN(2);
  @$pb.TagNumber(3)
  set quantityReceived($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantityReceived() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantityReceived() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get quantityRejected => $_getN(3);
  @$pb.TagNumber(4)
  set quantityRejected($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantityRejected() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantityRejected() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get rejectionReason => $_getSZ(4);
  @$pb.TagNumber(5)
  set rejectionReason($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRejectionReason() => $_has(4);
  @$pb.TagNumber(5)
  void clearRejectionReason() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get batchId => $_getSZ(5);
  @$pb.TagNumber(6)
  set batchId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBatchId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBatchId() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get expirationDate => $_getN(6);
  @$pb.TagNumber(7)
  set expirationDate($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasExpirationDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearExpirationDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureExpirationDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.int get purchasePrice => $_getIZ(7);
  @$pb.TagNumber(8)
  set purchasePrice($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPurchasePrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearPurchasePrice() => $_clearField(8);
}

class CreateReceivingNoteRequest extends $pb.GeneratedMessage {
  factory CreateReceivingNoteRequest({
    ReceivingNote? receivingNote,
  }) {
    final result = create();
    if (receivingNote != null) result.receivingNote = receivingNote;
    return result;
  }

  CreateReceivingNoteRequest._();

  factory CreateReceivingNoteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateReceivingNoteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateReceivingNoteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOM<ReceivingNote>(1, _omitFieldNames ? '' : 'receivingNote',
        subBuilder: ReceivingNote.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReceivingNoteRequest clone() =>
      CreateReceivingNoteRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReceivingNoteRequest copyWith(
          void Function(CreateReceivingNoteRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateReceivingNoteRequest))
          as CreateReceivingNoteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReceivingNoteRequest create() => CreateReceivingNoteRequest._();
  @$core.override
  CreateReceivingNoteRequest createEmptyInstance() => create();
  static $pb.PbList<CreateReceivingNoteRequest> createRepeated() =>
      $pb.PbList<CreateReceivingNoteRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateReceivingNoteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReceivingNoteRequest>(create);
  static CreateReceivingNoteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ReceivingNote get receivingNote => $_getN(0);
  @$pb.TagNumber(1)
  set receivingNote(ReceivingNote value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReceivingNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearReceivingNote() => $_clearField(1);
  @$pb.TagNumber(1)
  ReceivingNote ensureReceivingNote() => $_ensure(0);
}

class CreateReceivingNoteResponse extends $pb.GeneratedMessage {
  factory CreateReceivingNoteResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  CreateReceivingNoteResponse._();

  factory CreateReceivingNoteResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateReceivingNoteResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateReceivingNoteResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReceivingNoteResponse clone() =>
      CreateReceivingNoteResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReceivingNoteResponse copyWith(
          void Function(CreateReceivingNoteResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateReceivingNoteResponse))
          as CreateReceivingNoteResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReceivingNoteResponse create() =>
      CreateReceivingNoteResponse._();
  @$core.override
  CreateReceivingNoteResponse createEmptyInstance() => create();
  static $pb.PbList<CreateReceivingNoteResponse> createRepeated() =>
      $pb.PbList<CreateReceivingNoteResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateReceivingNoteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReceivingNoteResponse>(create);
  static CreateReceivingNoteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class ReceivingNoteServiceApi {
  final $pb.RpcClient _client;

  ReceivingNoteServiceApi(this._client);

  $async.Future<CreateReceivingNoteResponse> createReceivingNote(
          $pb.ClientContext? ctx, CreateReceivingNoteRequest request) =>
      _client.invoke<CreateReceivingNoteResponse>(ctx, 'ReceivingNoteService',
          'CreateReceivingNote', request, CreateReceivingNoteResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
