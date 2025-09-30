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

import 'package:fixnum/fixnum.dart' as $fixnum;
import 'package:protobuf/protobuf.dart' as $pb;

import '../../financial/v1/credit_note.pb.dart' as $1;
import '../../financial/v1/debit_note.pb.dart' as $2;
import '../../google/protobuf/timestamp.pb.dart' as $0;
import '../../payments/v1/payments.pb.dart' as $3;
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
    $core.double? quantity,
    ReturnCondition? condition,
    $core.String? conditionNotes,
    $core.String? batchId,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
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
    ..a<$core.double>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OD)
    ..e<ReturnCondition>(
        3, _omitFieldNames ? '' : 'condition', $pb.PbFieldType.OE,
        defaultOrMaker: ReturnCondition.RETURN_CONDITION_UNSPECIFIED,
        valueOf: ReturnCondition.valueOf,
        enumValues: ReturnCondition.values)
    ..aOS(4, _omitFieldNames ? '' : 'conditionNotes')
    ..aOS(5, _omitFieldNames ? '' : 'batchId')
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
  $core.double get quantity => $_getN(1);
  @$pb.TagNumber(2)
  set quantity($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  ReturnCondition get condition => $_getN(2);
  @$pb.TagNumber(3)
  set condition(ReturnCondition value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasCondition() => $_has(2);
  @$pb.TagNumber(3)
  void clearCondition() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get conditionNotes => $_getSZ(3);
  @$pb.TagNumber(4)
  set conditionNotes($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasConditionNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearConditionNotes() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get batchId => $_getSZ(4);
  @$pb.TagNumber(5)
  set batchId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBatchId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBatchId() => $_clearField(5);
}

class CreateCustomerReturnRequest extends $pb.GeneratedMessage {
  factory CreateCustomerReturnRequest({
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

  CreateCustomerReturnRequest._();

  factory CreateCustomerReturnRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCustomerReturnRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCustomerReturnRequest',
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
  CreateCustomerReturnRequest clone() =>
      CreateCustomerReturnRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCustomerReturnRequest copyWith(
          void Function(CreateCustomerReturnRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateCustomerReturnRequest))
          as CreateCustomerReturnRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCustomerReturnRequest create() =>
      CreateCustomerReturnRequest._();
  @$core.override
  CreateCustomerReturnRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCustomerReturnRequest> createRepeated() =>
      $pb.PbList<CreateCustomerReturnRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCustomerReturnRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCustomerReturnRequest>(create);
  static CreateCustomerReturnRequest? _defaultInstance;

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

class CreateCustomerReturnResponse extends $pb.GeneratedMessage {
  factory CreateCustomerReturnResponse({
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

  CreateCustomerReturnResponse._();

  factory CreateCustomerReturnResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCustomerReturnResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCustomerReturnResponse',
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
  CreateCustomerReturnResponse clone() =>
      CreateCustomerReturnResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCustomerReturnResponse copyWith(
          void Function(CreateCustomerReturnResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateCustomerReturnResponse))
          as CreateCustomerReturnResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCustomerReturnResponse create() =>
      CreateCustomerReturnResponse._();
  @$core.override
  CreateCustomerReturnResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCustomerReturnResponse> createRepeated() =>
      $pb.PbList<CreateCustomerReturnResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCustomerReturnResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCustomerReturnResponse>(create);
  static CreateCustomerReturnResponse? _defaultInstance;

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

class ProcessReturnRequestRequest extends $pb.GeneratedMessage {
  factory ProcessReturnRequestRequest({
    $core.String? returnId,
    ReturnNoteStatus? newStatus,
    $core.String? processedByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (returnId != null) result.returnId = returnId;
    if (newStatus != null) result.newStatus = newStatus;
    if (processedByUserId != null) result.processedByUserId = processedByUserId;
    if (notes != null) result.notes = notes;
    return result;
  }

  ProcessReturnRequestRequest._();

  factory ProcessReturnRequestRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProcessReturnRequestRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProcessReturnRequestRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'returnId')
    ..e<ReturnNoteStatus>(
        2, _omitFieldNames ? '' : 'newStatus', $pb.PbFieldType.OE,
        defaultOrMaker: ReturnNoteStatus.RETURN_STATUS_UNSPECIFIED,
        valueOf: ReturnNoteStatus.valueOf,
        enumValues: ReturnNoteStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'processedByUserId')
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessReturnRequestRequest clone() =>
      ProcessReturnRequestRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessReturnRequestRequest copyWith(
          void Function(ProcessReturnRequestRequest) updates) =>
      super.copyWith(
              (message) => updates(message as ProcessReturnRequestRequest))
          as ProcessReturnRequestRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcessReturnRequestRequest create() =>
      ProcessReturnRequestRequest._();
  @$core.override
  ProcessReturnRequestRequest createEmptyInstance() => create();
  static $pb.PbList<ProcessReturnRequestRequest> createRepeated() =>
      $pb.PbList<ProcessReturnRequestRequest>();
  @$core.pragma('dart2js:noInline')
  static ProcessReturnRequestRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProcessReturnRequestRequest>(create);
  static ProcessReturnRequestRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get returnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set returnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnId() => $_clearField(1);

  @$pb.TagNumber(2)
  ReturnNoteStatus get newStatus => $_getN(1);
  @$pb.TagNumber(2)
  set newStatus(ReturnNoteStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNewStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get processedByUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set processedByUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasProcessedByUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearProcessedByUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => $_clearField(4);
}

class ProcessReturnRequestResponse extends $pb.GeneratedMessage {
  factory ProcessReturnRequestResponse({
    ReturnNote? returnNote,
    $core.String? message,
  }) {
    final result = create();
    if (returnNote != null) result.returnNote = returnNote;
    if (message != null) result.message = message;
    return result;
  }

  ProcessReturnRequestResponse._();

  factory ProcessReturnRequestResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ProcessReturnRequestResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ProcessReturnRequestResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOM<ReturnNote>(1, _omitFieldNames ? '' : 'returnNote',
        subBuilder: ReturnNote.create)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessReturnRequestResponse clone() =>
      ProcessReturnRequestResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ProcessReturnRequestResponse copyWith(
          void Function(ProcessReturnRequestResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ProcessReturnRequestResponse))
          as ProcessReturnRequestResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ProcessReturnRequestResponse create() =>
      ProcessReturnRequestResponse._();
  @$core.override
  ProcessReturnRequestResponse createEmptyInstance() => create();
  static $pb.PbList<ProcessReturnRequestResponse> createRepeated() =>
      $pb.PbList<ProcessReturnRequestResponse>();
  @$core.pragma('dart2js:noInline')
  static ProcessReturnRequestResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ProcessReturnRequestResponse>(create);
  static ProcessReturnRequestResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ReturnNote get returnNote => $_getN(0);
  @$pb.TagNumber(1)
  set returnNote(ReturnNote value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnNote() => $_clearField(1);
  @$pb.TagNumber(1)
  ReturnNote ensureReturnNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class CreateCreditNoteFromReturnRequest extends $pb.GeneratedMessage {
  factory CreateCreditNoteFromReturnRequest({
    $core.String? returnId,
    $core.String? relatedInvoiceId,
    $core.String? issuedByUserId,
  }) {
    final result = create();
    if (returnId != null) result.returnId = returnId;
    if (relatedInvoiceId != null) result.relatedInvoiceId = relatedInvoiceId;
    if (issuedByUserId != null) result.issuedByUserId = issuedByUserId;
    return result;
  }

  CreateCreditNoteFromReturnRequest._();

  factory CreateCreditNoteFromReturnRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCreditNoteFromReturnRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCreditNoteFromReturnRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'returnId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedInvoiceId')
    ..aOS(3, _omitFieldNames ? '' : 'issuedByUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCreditNoteFromReturnRequest clone() =>
      CreateCreditNoteFromReturnRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCreditNoteFromReturnRequest copyWith(
          void Function(CreateCreditNoteFromReturnRequest) updates) =>
      super.copyWith((message) =>
              updates(message as CreateCreditNoteFromReturnRequest))
          as CreateCreditNoteFromReturnRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCreditNoteFromReturnRequest create() =>
      CreateCreditNoteFromReturnRequest._();
  @$core.override
  CreateCreditNoteFromReturnRequest createEmptyInstance() => create();
  static $pb.PbList<CreateCreditNoteFromReturnRequest> createRepeated() =>
      $pb.PbList<CreateCreditNoteFromReturnRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateCreditNoteFromReturnRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCreditNoteFromReturnRequest>(
          create);
  static CreateCreditNoteFromReturnRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get returnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set returnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get relatedInvoiceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set relatedInvoiceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRelatedInvoiceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelatedInvoiceId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get issuedByUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set issuedByUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIssuedByUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssuedByUserId() => $_clearField(3);
}

class CreateCreditNoteFromReturnResponse extends $pb.GeneratedMessage {
  factory CreateCreditNoteFromReturnResponse({
    $core.String? cnId,
    $1.CreditNote? creditNote,
    $core.String? message,
  }) {
    final result = create();
    if (cnId != null) result.cnId = cnId;
    if (creditNote != null) result.creditNote = creditNote;
    if (message != null) result.message = message;
    return result;
  }

  CreateCreditNoteFromReturnResponse._();

  factory CreateCreditNoteFromReturnResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateCreditNoteFromReturnResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateCreditNoteFromReturnResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'cnId')
    ..aOM<$1.CreditNote>(2, _omitFieldNames ? '' : 'creditNote',
        subBuilder: $1.CreditNote.create)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCreditNoteFromReturnResponse clone() =>
      CreateCreditNoteFromReturnResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateCreditNoteFromReturnResponse copyWith(
          void Function(CreateCreditNoteFromReturnResponse) updates) =>
      super.copyWith((message) =>
              updates(message as CreateCreditNoteFromReturnResponse))
          as CreateCreditNoteFromReturnResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateCreditNoteFromReturnResponse create() =>
      CreateCreditNoteFromReturnResponse._();
  @$core.override
  CreateCreditNoteFromReturnResponse createEmptyInstance() => create();
  static $pb.PbList<CreateCreditNoteFromReturnResponse> createRepeated() =>
      $pb.PbList<CreateCreditNoteFromReturnResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateCreditNoteFromReturnResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateCreditNoteFromReturnResponse>(
          create);
  static CreateCreditNoteFromReturnResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get cnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set cnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCnId() => $_clearField(1);

  @$pb.TagNumber(2)
  $1.CreditNote get creditNote => $_getN(1);
  @$pb.TagNumber(2)
  set creditNote($1.CreditNote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCreditNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreditNote() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.CreditNote ensureCreditNote() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class CreateDebitNoteFromReturnRequest extends $pb.GeneratedMessage {
  factory CreateDebitNoteFromReturnRequest({
    $core.String? returnId,
    $core.String? relatedInvoiceId,
    $core.String? issuedByUserId,
  }) {
    final result = create();
    if (returnId != null) result.returnId = returnId;
    if (relatedInvoiceId != null) result.relatedInvoiceId = relatedInvoiceId;
    if (issuedByUserId != null) result.issuedByUserId = issuedByUserId;
    return result;
  }

  CreateDebitNoteFromReturnRequest._();

  factory CreateDebitNoteFromReturnRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDebitNoteFromReturnRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDebitNoteFromReturnRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'returnId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedInvoiceId')
    ..aOS(3, _omitFieldNames ? '' : 'issuedByUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDebitNoteFromReturnRequest clone() =>
      CreateDebitNoteFromReturnRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDebitNoteFromReturnRequest copyWith(
          void Function(CreateDebitNoteFromReturnRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreateDebitNoteFromReturnRequest))
          as CreateDebitNoteFromReturnRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDebitNoteFromReturnRequest create() =>
      CreateDebitNoteFromReturnRequest._();
  @$core.override
  CreateDebitNoteFromReturnRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDebitNoteFromReturnRequest> createRepeated() =>
      $pb.PbList<CreateDebitNoteFromReturnRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDebitNoteFromReturnRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDebitNoteFromReturnRequest>(
          create);
  static CreateDebitNoteFromReturnRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get returnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set returnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get relatedInvoiceId => $_getSZ(1);
  @$pb.TagNumber(2)
  set relatedInvoiceId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRelatedInvoiceId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelatedInvoiceId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get issuedByUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set issuedByUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIssuedByUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearIssuedByUserId() => $_clearField(3);
}

class CreateDebitNoteFromReturnResponse extends $pb.GeneratedMessage {
  factory CreateDebitNoteFromReturnResponse({
    $core.String? dnId,
    $2.DebitNote? debitNote,
    $core.String? message,
  }) {
    final result = create();
    if (dnId != null) result.dnId = dnId;
    if (debitNote != null) result.debitNote = debitNote;
    if (message != null) result.message = message;
    return result;
  }

  CreateDebitNoteFromReturnResponse._();

  factory CreateDebitNoteFromReturnResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDebitNoteFromReturnResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDebitNoteFromReturnResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'dnId')
    ..aOM<$2.DebitNote>(2, _omitFieldNames ? '' : 'debitNote',
        subBuilder: $2.DebitNote.create)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDebitNoteFromReturnResponse clone() =>
      CreateDebitNoteFromReturnResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDebitNoteFromReturnResponse copyWith(
          void Function(CreateDebitNoteFromReturnResponse) updates) =>
      super.copyWith((message) =>
              updates(message as CreateDebitNoteFromReturnResponse))
          as CreateDebitNoteFromReturnResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDebitNoteFromReturnResponse create() =>
      CreateDebitNoteFromReturnResponse._();
  @$core.override
  CreateDebitNoteFromReturnResponse createEmptyInstance() => create();
  static $pb.PbList<CreateDebitNoteFromReturnResponse> createRepeated() =>
      $pb.PbList<CreateDebitNoteFromReturnResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateDebitNoteFromReturnResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDebitNoteFromReturnResponse>(
          create);
  static CreateDebitNoteFromReturnResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get dnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set dnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDnId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.DebitNote get debitNote => $_getN(1);
  @$pb.TagNumber(2)
  set debitNote($2.DebitNote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDebitNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearDebitNote() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.DebitNote ensureDebitNote() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class GetReturnRequest extends $pb.GeneratedMessage {
  factory GetReturnRequest({
    $core.String? returnId,
  }) {
    final result = create();
    if (returnId != null) result.returnId = returnId;
    return result;
  }

  GetReturnRequest._();

  factory GetReturnRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetReturnRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetReturnRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'returnId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReturnRequest clone() => GetReturnRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReturnRequest copyWith(void Function(GetReturnRequest) updates) =>
      super.copyWith((message) => updates(message as GetReturnRequest))
          as GetReturnRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReturnRequest create() => GetReturnRequest._();
  @$core.override
  GetReturnRequest createEmptyInstance() => create();
  static $pb.PbList<GetReturnRequest> createRepeated() =>
      $pb.PbList<GetReturnRequest>();
  @$core.pragma('dart2js:noInline')
  static GetReturnRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetReturnRequest>(create);
  static GetReturnRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get returnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set returnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnId() => $_clearField(1);
}

class GetReturnResponse extends $pb.GeneratedMessage {
  factory GetReturnResponse({
    ReturnNote? returnNote,
    $1.CreditNote? creditNote,
    $2.DebitNote? debitNote,
    $3.Payment? refundPayment,
  }) {
    final result = create();
    if (returnNote != null) result.returnNote = returnNote;
    if (creditNote != null) result.creditNote = creditNote;
    if (debitNote != null) result.debitNote = debitNote;
    if (refundPayment != null) result.refundPayment = refundPayment;
    return result;
  }

  GetReturnResponse._();

  factory GetReturnResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetReturnResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetReturnResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOM<ReturnNote>(1, _omitFieldNames ? '' : 'returnNote',
        subBuilder: ReturnNote.create)
    ..aOM<$1.CreditNote>(2, _omitFieldNames ? '' : 'creditNote',
        subBuilder: $1.CreditNote.create)
    ..aOM<$2.DebitNote>(3, _omitFieldNames ? '' : 'debitNote',
        subBuilder: $2.DebitNote.create)
    ..aOM<$3.Payment>(4, _omitFieldNames ? '' : 'refundPayment',
        subBuilder: $3.Payment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReturnResponse clone() => GetReturnResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetReturnResponse copyWith(void Function(GetReturnResponse) updates) =>
      super.copyWith((message) => updates(message as GetReturnResponse))
          as GetReturnResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetReturnResponse create() => GetReturnResponse._();
  @$core.override
  GetReturnResponse createEmptyInstance() => create();
  static $pb.PbList<GetReturnResponse> createRepeated() =>
      $pb.PbList<GetReturnResponse>();
  @$core.pragma('dart2js:noInline')
  static GetReturnResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetReturnResponse>(create);
  static GetReturnResponse? _defaultInstance;

  @$pb.TagNumber(1)
  ReturnNote get returnNote => $_getN(0);
  @$pb.TagNumber(1)
  set returnNote(ReturnNote value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnNote() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnNote() => $_clearField(1);
  @$pb.TagNumber(1)
  ReturnNote ensureReturnNote() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.CreditNote get creditNote => $_getN(1);
  @$pb.TagNumber(2)
  set creditNote($1.CreditNote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCreditNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreditNote() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.CreditNote ensureCreditNote() => $_ensure(1);

  @$pb.TagNumber(3)
  $2.DebitNote get debitNote => $_getN(2);
  @$pb.TagNumber(3)
  set debitNote($2.DebitNote value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDebitNote() => $_has(2);
  @$pb.TagNumber(3)
  void clearDebitNote() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.DebitNote ensureDebitNote() => $_ensure(2);

  @$pb.TagNumber(4)
  $3.Payment get refundPayment => $_getN(3);
  @$pb.TagNumber(4)
  set refundPayment($3.Payment value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasRefundPayment() => $_has(3);
  @$pb.TagNumber(4)
  void clearRefundPayment() => $_clearField(4);
  @$pb.TagNumber(4)
  $3.Payment ensureRefundPayment() => $_ensure(3);
}

class ListReturnsRequest extends $pb.GeneratedMessage {
  factory ListReturnsRequest({
    ReturnType? returnType,
    ReturnNoteStatus? status,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (returnType != null) result.returnType = returnType;
    if (status != null) result.status = status;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNumber != null) result.pageNumber = pageNumber;
    return result;
  }

  ListReturnsRequest._();

  factory ListReturnsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReturnsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReturnsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..e<ReturnType>(1, _omitFieldNames ? '' : 'returnType', $pb.PbFieldType.OE,
        defaultOrMaker: ReturnType.RETURN_TYPE_UNSPECIFIED,
        valueOf: ReturnType.valueOf,
        enumValues: ReturnType.values)
    ..e<ReturnNoteStatus>(
        2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: ReturnNoteStatus.RETURN_STATUS_UNSPECIFIED,
        valueOf: ReturnNoteStatus.valueOf,
        enumValues: ReturnNoteStatus.values)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReturnsRequest clone() => ListReturnsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReturnsRequest copyWith(void Function(ListReturnsRequest) updates) =>
      super.copyWith((message) => updates(message as ListReturnsRequest))
          as ListReturnsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReturnsRequest create() => ListReturnsRequest._();
  @$core.override
  ListReturnsRequest createEmptyInstance() => create();
  static $pb.PbList<ListReturnsRequest> createRepeated() =>
      $pb.PbList<ListReturnsRequest>();
  @$core.pragma('dart2js:noInline')
  static ListReturnsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReturnsRequest>(create);
  static ListReturnsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  ReturnType get returnType => $_getN(0);
  @$pb.TagNumber(1)
  set returnType(ReturnType value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasReturnType() => $_has(0);
  @$pb.TagNumber(1)
  void clearReturnType() => $_clearField(1);

  @$pb.TagNumber(2)
  ReturnNoteStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(ReturnNoteStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get startDate => $_getN(2);
  @$pb.TagNumber(3)
  set startDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStartDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureStartDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $0.Timestamp get endDate => $_getN(3);
  @$pb.TagNumber(4)
  set endDate($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasEndDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureEndDate() => $_ensure(3);

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

class ListReturnsResponse extends $pb.GeneratedMessage {
  factory ListReturnsResponse({
    $core.Iterable<ReturnNote>? returns,
    $core.int? totalCount,
    $fixnum.Int64? totalValue,
  }) {
    final result = create();
    if (returns != null) result.returns.addAll(returns);
    if (totalCount != null) result.totalCount = totalCount;
    if (totalValue != null) result.totalValue = totalValue;
    return result;
  }

  ListReturnsResponse._();

  factory ListReturnsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListReturnsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListReturnsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..pc<ReturnNote>(1, _omitFieldNames ? '' : 'returns', $pb.PbFieldType.PM,
        subBuilder: ReturnNote.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..aInt64(3, _omitFieldNames ? '' : 'totalValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReturnsResponse clone() => ListReturnsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListReturnsResponse copyWith(void Function(ListReturnsResponse) updates) =>
      super.copyWith((message) => updates(message as ListReturnsResponse))
          as ListReturnsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListReturnsResponse create() => ListReturnsResponse._();
  @$core.override
  ListReturnsResponse createEmptyInstance() => create();
  static $pb.PbList<ListReturnsResponse> createRepeated() =>
      $pb.PbList<ListReturnsResponse>();
  @$core.pragma('dart2js:noInline')
  static ListReturnsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListReturnsResponse>(create);
  static ListReturnsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<ReturnNote> get returns => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get totalValue => $_getI64(2);
  @$pb.TagNumber(3)
  set totalValue($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalValue() => $_clearField(3);
}

class ReturnServiceApi {
  final $pb.RpcClient _client;

  ReturnServiceApi(this._client);

  /// Create a return note (customer returning to you)
  $async.Future<CreateCustomerReturnResponse> createCustomerReturn(
          $pb.ClientContext? ctx, CreateCustomerReturnRequest request) =>
      _client.invoke<CreateCustomerReturnResponse>(ctx, 'ReturnService',
          'CreateCustomerReturn', request, CreateCustomerReturnResponse());

  /// Approve/reject a return request
  $async.Future<ProcessReturnRequestResponse> processReturnRequest(
          $pb.ClientContext? ctx, ProcessReturnRequestRequest request) =>
      _client.invoke<ProcessReturnRequestResponse>(ctx, 'ReturnService',
          'ProcessReturnRequest', request, ProcessReturnRequestResponse());

  /// Create credit note from return
  $async.Future<CreateCreditNoteFromReturnResponse> createCreditNoteFromReturn(
          $pb.ClientContext? ctx, CreateCreditNoteFromReturnRequest request) =>
      _client.invoke<CreateCreditNoteFromReturnResponse>(
          ctx,
          'ReturnService',
          'CreateCreditNoteFromReturn',
          request,
          CreateCreditNoteFromReturnResponse());

  /// Create debit note for supplier return
  $async.Future<CreateDebitNoteFromReturnResponse> createDebitNoteFromReturn(
          $pb.ClientContext? ctx, CreateDebitNoteFromReturnRequest request) =>
      _client.invoke<CreateDebitNoteFromReturnResponse>(
          ctx,
          'ReturnService',
          'CreateDebitNoteFromReturn',
          request,
          CreateDebitNoteFromReturnResponse());

  /// Get return details
  $async.Future<GetReturnResponse> getReturn(
          $pb.ClientContext? ctx, GetReturnRequest request) =>
      _client.invoke<GetReturnResponse>(
          ctx, 'ReturnService', 'GetReturn', request, GetReturnResponse());

  /// List returns
  $async.Future<ListReturnsResponse> listReturns(
          $pb.ClientContext? ctx, ListReturnsRequest request) =>
      _client.invoke<ListReturnsResponse>(
          ctx, 'ReturnService', 'ListReturns', request, ListReturnsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
