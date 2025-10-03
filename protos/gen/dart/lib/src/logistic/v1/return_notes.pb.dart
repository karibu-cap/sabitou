// This is a generated file - do not edit.
//
// Generated from logistic/v1/return_notes.proto.

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
import '../../inventory/v1/category.pb.dart' as $1;
import 'return_notes.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'return_notes.pbenum.dart';

/// *
///  ReturnNote (Bon de Retour)
///  Logistics document for goods coming BACK.
///  Can be customer returning to you OR you returning to supplier.
///
///  Fix: ReturnLineItem now includes batch_id for returning specific lots.
///
///  Example - Customer returns:
///    return_id: "RET-2025-001"
///    return_type: RETURN_TYPE_CUSTOMER_TO_SELLER
///    from_id: "CMP-003" (customer)
///    to_id: "WH-001" (your warehouse)
///    related_delivery_note_id: "DN-2025-001"
///    items: [2x PRD-001]
///    reason: "Defective"
///
///  INVENTORY IMPACT: +2 PRD-001 in WH-001
class ReturnNote extends $pb.GeneratedMessage {
  factory ReturnNote({
    $core.String? documentId,
    ReturnType? returnType,
    $core.String? fromId,
    $core.String? toId,
    $core.String? relatedDeliveryNoteId,
    $core.String? relatedInvoiceId,
    ReturnNoteStatus? status,
    $core.Iterable<ReturnLineItem>? items,
    $core.String? reason,
    $0.Timestamp? receivedAt,
    $core.String? receivedByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (returnType != null) result.returnType = returnType;
    if (fromId != null) result.fromId = fromId;
    if (toId != null) result.toId = toId;
    if (relatedDeliveryNoteId != null)
      result.relatedDeliveryNoteId = relatedDeliveryNoteId;
    if (relatedInvoiceId != null) result.relatedInvoiceId = relatedInvoiceId;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (reason != null) result.reason = reason;
    if (receivedAt != null) result.receivedAt = receivedAt;
    if (receivedByUserId != null) result.receivedByUserId = receivedByUserId;
    if (notes != null) result.notes = notes;
    return result;
  }

  ReturnNote._();

  factory ReturnNote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReturnNote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReturnNote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..e<ReturnType>(2, _omitFieldNames ? '' : 'returnType', $pb.PbFieldType.OE,
        defaultOrMaker: ReturnType.RETURN_TYPE_UNSPECIFIED,
        valueOf: ReturnType.valueOf,
        enumValues: ReturnType.values)
    ..aOS(3, _omitFieldNames ? '' : 'fromId')
    ..aOS(4, _omitFieldNames ? '' : 'toId')
    ..aOS(5, _omitFieldNames ? '' : 'relatedDeliveryNoteId')
    ..aOS(6, _omitFieldNames ? '' : 'relatedInvoiceId')
    ..e<ReturnNoteStatus>(
        7, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ReturnNoteStatus.RETURN_STATUS_UNSPECIFIED,
        valueOf: ReturnNoteStatus.valueOf,
        enumValues: ReturnNoteStatus.values)
    ..pc<ReturnLineItem>(8, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: ReturnLineItem.create)
    ..aOS(9, _omitFieldNames ? '' : 'reason')
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'receivedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(11, _omitFieldNames ? '' : 'receivedByUserId')
    ..aOS(12, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReturnNote clone() => ReturnNote()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReturnNote copyWith(void Function(ReturnNote) updates) =>
      super.copyWith((message) => updates(message as ReturnNote)) as ReturnNote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReturnNote create() => ReturnNote._();
  @$core.override
  ReturnNote createEmptyInstance() => create();
  static $pb.PbList<ReturnNote> createRepeated() => $pb.PbList<ReturnNote>();
  @$core.pragma('dart2js:noInline')
  static ReturnNote getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReturnNote>(create);
  static ReturnNote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  ReturnType get returnType => $_getN(1);
  @$pb.TagNumber(2)
  set returnType(ReturnType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReturnType() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturnType() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFromId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get toId => $_getSZ(3);
  @$pb.TagNumber(4)
  set toId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToId() => $_has(3);
  @$pb.TagNumber(4)
  void clearToId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get relatedDeliveryNoteId => $_getSZ(4);
  @$pb.TagNumber(5)
  set relatedDeliveryNoteId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasRelatedDeliveryNoteId() => $_has(4);
  @$pb.TagNumber(5)
  void clearRelatedDeliveryNoteId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get relatedInvoiceId => $_getSZ(5);
  @$pb.TagNumber(6)
  set relatedInvoiceId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRelatedInvoiceId() => $_has(5);
  @$pb.TagNumber(6)
  void clearRelatedInvoiceId() => $_clearField(6);

  @$pb.TagNumber(7)
  ReturnNoteStatus get status => $_getN(6);
  @$pb.TagNumber(7)
  set status(ReturnNoteStatus value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasStatus() => $_has(6);
  @$pb.TagNumber(7)
  void clearStatus() => $_clearField(7);

  @$pb.TagNumber(8)
  $pb.PbList<ReturnLineItem> get items => $_getList(7);

  @$pb.TagNumber(9)
  $core.String get reason => $_getSZ(8);
  @$pb.TagNumber(9)
  set reason($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasReason() => $_has(8);
  @$pb.TagNumber(9)
  void clearReason() => $_clearField(9);

  @$pb.TagNumber(10)
  $0.Timestamp get receivedAt => $_getN(9);
  @$pb.TagNumber(10)
  set receivedAt($0.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasReceivedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearReceivedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureReceivedAt() => $_ensure(9);

  @$pb.TagNumber(11)
  $core.String get receivedByUserId => $_getSZ(10);
  @$pb.TagNumber(11)
  set receivedByUserId($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasReceivedByUserId() => $_has(10);
  @$pb.TagNumber(11)
  void clearReceivedByUserId() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.String get notes => $_getSZ(11);
  @$pb.TagNumber(12)
  set notes($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasNotes() => $_has(11);
  @$pb.TagNumber(12)
  void clearNotes() => $_clearField(12);
}

/// *
///  ReturnLineItem shows what's being returned and its condition.
///
///  Fix: Added batch_id to identify the specific lot being returned.
class ReturnLineItem extends $pb.GeneratedMessage {
  factory ReturnLineItem({
    $core.String? productId,
    $1.Internationalized? productName,
    $core.double? quantity,
    ReturnCondition? condition,
    $core.String? conditionNotes,
    $core.String? batchId,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (productName != null) result.productName = productName;
    if (quantity != null) result.quantity = quantity;
    if (condition != null) result.condition = condition;
    if (conditionNotes != null) result.conditionNotes = conditionNotes;
    if (batchId != null) result.batchId = batchId;
    return result;
  }

  ReturnLineItem._();

  factory ReturnLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReturnLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReturnLineItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOM<$1.Internationalized>(2, _omitFieldNames ? '' : 'productName',
        subBuilder: $1.Internationalized.create)
    ..a<$core.double>(3, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OD)
    ..e<ReturnCondition>(
        4, _omitFieldNames ? '' : 'condition', $pb.PbFieldType.OE,
        defaultOrMaker: ReturnCondition.RETURN_CONDITION_UNSPECIFIED,
        valueOf: ReturnCondition.valueOf,
        enumValues: ReturnCondition.values)
    ..aOS(5, _omitFieldNames ? '' : 'conditionNotes')
    ..aOS(6, _omitFieldNames ? '' : 'batchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReturnLineItem clone() => ReturnLineItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReturnLineItem copyWith(void Function(ReturnLineItem) updates) =>
      super.copyWith((message) => updates(message as ReturnLineItem))
          as ReturnLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReturnLineItem create() => ReturnLineItem._();
  @$core.override
  ReturnLineItem createEmptyInstance() => create();
  static $pb.PbList<ReturnLineItem> createRepeated() =>
      $pb.PbList<ReturnLineItem>();
  @$core.pragma('dart2js:noInline')
  static ReturnLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReturnLineItem>(create);
  static ReturnLineItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.Internationalized get productName => $_getN(1);
  @$pb.TagNumber(2)
  set productName($1.Internationalized value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProductName() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductName() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.Internationalized ensureProductName() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.double get quantity => $_getN(2);
  @$pb.TagNumber(3)
  set quantity($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantity() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantity() => $_clearField(3);

  @$pb.TagNumber(4)
  ReturnCondition get condition => $_getN(3);
  @$pb.TagNumber(4)
  set condition(ReturnCondition value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasCondition() => $_has(3);
  @$pb.TagNumber(4)
  void clearCondition() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get conditionNotes => $_getSZ(4);
  @$pb.TagNumber(5)
  set conditionNotes($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasConditionNotes() => $_has(4);
  @$pb.TagNumber(5)
  void clearConditionNotes() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get batchId => $_getSZ(5);
  @$pb.TagNumber(6)
  set batchId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBatchId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBatchId() => $_clearField(6);
}

class CreateReturnNotesRequest extends $pb.GeneratedMessage {
  factory CreateReturnNotesRequest({
    $core.String? fromCompanyId,
    $core.String? toWarehouseId,
    $core.String? relatedDeliveryNoteId,
    $core.String? relatedInvoiceId,
    $core.Iterable<ReturnLineItem>? items,
    $core.String? reason,
    $core.String? receivedByUserId,
  }) {
    final result = create();
    if (fromCompanyId != null) result.fromCompanyId = fromCompanyId;
    if (toWarehouseId != null) result.toWarehouseId = toWarehouseId;
    if (relatedDeliveryNoteId != null)
      result.relatedDeliveryNoteId = relatedDeliveryNoteId;
    if (relatedInvoiceId != null) result.relatedInvoiceId = relatedInvoiceId;
    if (items != null) result.items.addAll(items);
    if (reason != null) result.reason = reason;
    if (receivedByUserId != null) result.receivedByUserId = receivedByUserId;
    return result;
  }

  CreateReturnNotesRequest._();

  factory CreateReturnNotesRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateReturnNotesRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateReturnNotesRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'fromCompanyId')
    ..aOS(2, _omitFieldNames ? '' : 'toWarehouseId')
    ..aOS(3, _omitFieldNames ? '' : 'relatedDeliveryNoteId')
    ..aOS(4, _omitFieldNames ? '' : 'relatedInvoiceId')
    ..pc<ReturnLineItem>(5, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: ReturnLineItem.create)
    ..aOS(6, _omitFieldNames ? '' : 'reason')
    ..aOS(7, _omitFieldNames ? '' : 'receivedByUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReturnNotesRequest clone() =>
      CreateReturnNotesRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReturnNotesRequest copyWith(
          void Function(CreateReturnNotesRequest) updates) =>
      super.copyWith((message) => updates(message as CreateReturnNotesRequest))
          as CreateReturnNotesRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReturnNotesRequest create() => CreateReturnNotesRequest._();
  @$core.override
  CreateReturnNotesRequest createEmptyInstance() => create();
  static $pb.PbList<CreateReturnNotesRequest> createRepeated() =>
      $pb.PbList<CreateReturnNotesRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateReturnNotesRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReturnNotesRequest>(create);
  static CreateReturnNotesRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get fromCompanyId => $_getSZ(0);
  @$pb.TagNumber(1)
  set fromCompanyId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasFromCompanyId() => $_has(0);
  @$pb.TagNumber(1)
  void clearFromCompanyId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get toWarehouseId => $_getSZ(1);
  @$pb.TagNumber(2)
  set toWarehouseId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasToWarehouseId() => $_has(1);
  @$pb.TagNumber(2)
  void clearToWarehouseId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get relatedDeliveryNoteId => $_getSZ(2);
  @$pb.TagNumber(3)
  set relatedDeliveryNoteId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasRelatedDeliveryNoteId() => $_has(2);
  @$pb.TagNumber(3)
  void clearRelatedDeliveryNoteId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get relatedInvoiceId => $_getSZ(3);
  @$pb.TagNumber(4)
  set relatedInvoiceId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRelatedInvoiceId() => $_has(3);
  @$pb.TagNumber(4)
  void clearRelatedInvoiceId() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<ReturnLineItem> get items => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get reason => $_getSZ(5);
  @$pb.TagNumber(6)
  set reason($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReason() => $_has(5);
  @$pb.TagNumber(6)
  void clearReason() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get receivedByUserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set receivedByUserId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasReceivedByUserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceivedByUserId() => $_clearField(7);
}

class CreateReturnNotesResponse extends $pb.GeneratedMessage {
  factory CreateReturnNotesResponse({
    $core.String? returnId,
    ReturnNote? returnNote,
    $core.Iterable<$core.String>? inventoryTransactionIds,
    $core.bool? requiresCreditNote,
    $core.String? message,
  }) {
    final result = create();
    if (returnId != null) result.returnId = returnId;
    if (returnNote != null) result.returnNote = returnNote;
    if (inventoryTransactionIds != null)
      result.inventoryTransactionIds.addAll(inventoryTransactionIds);
    if (requiresCreditNote != null)
      result.requiresCreditNote = requiresCreditNote;
    if (message != null) result.message = message;
    return result;
  }

  CreateReturnNotesResponse._();

  factory CreateReturnNotesResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateReturnNotesResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateReturnNotesResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'returnId')
    ..aOM<ReturnNote>(2, _omitFieldNames ? '' : 'returnNote',
        subBuilder: ReturnNote.create)
    ..pPS(3, _omitFieldNames ? '' : 'inventoryTransactionIds')
    ..aOB(4, _omitFieldNames ? '' : 'requiresCreditNote')
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReturnNotesResponse clone() =>
      CreateReturnNotesResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateReturnNotesResponse copyWith(
          void Function(CreateReturnNotesResponse) updates) =>
      super.copyWith((message) => updates(message as CreateReturnNotesResponse))
          as CreateReturnNotesResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateReturnNotesResponse create() => CreateReturnNotesResponse._();
  @$core.override
  CreateReturnNotesResponse createEmptyInstance() => create();
  static $pb.PbList<CreateReturnNotesResponse> createRepeated() =>
      $pb.PbList<CreateReturnNotesResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateReturnNotesResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateReturnNotesResponse>(create);
  static CreateReturnNotesResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get returnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set returnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnId() => $_clearField(1);

  @$pb.TagNumber(2)
  ReturnNote get returnNote => $_getN(1);
  @$pb.TagNumber(2)
  set returnNote(ReturnNote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReturnNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearReturnNote() => $_clearField(2);
  @$pb.TagNumber(2)
  ReturnNote ensureReturnNote() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get inventoryTransactionIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get requiresCreditNote => $_getBF(3);
  @$pb.TagNumber(4)
  set requiresCreditNote($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasRequiresCreditNote() => $_has(3);
  @$pb.TagNumber(4)
  void clearRequiresCreditNote() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => $_clearField(5);
}

class ReturnNotesServiceApi {
  final $pb.RpcClient _client;

  ReturnNotesServiceApi(this._client);

  /// Create a return note (customer returning to you)
  $async.Future<CreateReturnNotesResponse> createReturnNotes(
          $pb.ClientContext? ctx, CreateReturnNotesRequest request) =>
      _client.invoke<CreateReturnNotesResponse>(ctx, 'ReturnNotesService',
          'CreateReturnNotes', request, CreateReturnNotesResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
