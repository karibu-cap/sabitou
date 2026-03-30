// This is a generated file - do not edit.
//
// Generated from logistic/v1/receiving_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'receiving_notes.pbenum.dart';

/// *
///  ReceivingNote (Bon de Réception)
///  Created when we receive goods from a supplier.
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
    $core.String? refId,
    $core.String? relatedPurchaseOrderId,
    $core.String? supplierId,
    $core.String? storeId,
    $core.Iterable<ReceivingNoteLineItem>? items,
    $core.String? receivedByUserId,
    $0.Timestamp? receivedAt,
    $core.String? notes,
    $0.Timestamp? createdAt,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (relatedPurchaseOrderId != null)
      result.relatedPurchaseOrderId = relatedPurchaseOrderId;
    if (supplierId != null) result.supplierId = supplierId;
    if (storeId != null) result.storeId = storeId;
    if (items != null) result.items.addAll(items);
    if (receivedByUserId != null) result.receivedByUserId = receivedByUserId;
    if (receivedAt != null) result.receivedAt = receivedAt;
    if (notes != null) result.notes = notes;
    if (createdAt != null) result.createdAt = createdAt;
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
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedPurchaseOrderId')
    ..aOS(3, _omitFieldNames ? '' : 'supplierId')
    ..aOS(4, _omitFieldNames ? '' : 'storeId')
    ..pc<ReceivingNoteLineItem>(
        5, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: ReceivingNoteLineItem.create)
    ..aOS(6, _omitFieldNames ? '' : 'receivedByUserId')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'receivedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(8, _omitFieldNames ? '' : 'notes')
    ..aOM<$0.Timestamp>(9, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
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
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

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
  $core.String get storeId => $_getSZ(3);
  @$pb.TagNumber(4)
  set storeId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStoreId() => $_has(3);
  @$pb.TagNumber(4)
  void clearStoreId() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<ReceivingNoteLineItem> get items => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get receivedByUserId => $_getSZ(5);
  @$pb.TagNumber(6)
  set receivedByUserId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasReceivedByUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearReceivedByUserId() => $_clearField(6);

  @$pb.TagNumber(7)
  $0.Timestamp get receivedAt => $_getN(6);
  @$pb.TagNumber(7)
  set receivedAt($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasReceivedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearReceivedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureReceivedAt() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get notes => $_getSZ(7);
  @$pb.TagNumber(8)
  set notes($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasNotes() => $_has(7);
  @$pb.TagNumber(8)
  void clearNotes() => $_clearField(8);

  @$pb.TagNumber(9)
  $0.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(9)
  set createdAt($0.Timestamp value) => $_setField(9, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedAt() => $_clearField(9);
  @$pb.TagNumber(9)
  $0.Timestamp ensureCreatedAt() => $_ensure(8);
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
class ReceivingNoteLineItem extends $pb.GeneratedMessage {
  factory ReceivingNoteLineItem({
    $core.String? productId,
    $core.double? quantityExpected,
    $core.double? quantityReceived,
    $core.double? quantityRejected,
    $core.String? rejectionReason,
    $core.String? batchId,
    $0.Timestamp? expirationDate,
    $core.double? purchasePrice,
    $core.String? storeId,
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
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  ReceivingNoteLineItem._();

  factory ReceivingNoteLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ReceivingNoteLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ReceivingNoteLineItem',
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
    ..a<$core.double>(
        8, _omitFieldNames ? '' : 'purchasePrice', $pb.PbFieldType.OD)
    ..aOS(9, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceivingNoteLineItem clone() =>
      ReceivingNoteLineItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ReceivingNoteLineItem copyWith(
          void Function(ReceivingNoteLineItem) updates) =>
      super.copyWith((message) => updates(message as ReceivingNoteLineItem))
          as ReceivingNoteLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ReceivingNoteLineItem create() => ReceivingNoteLineItem._();
  @$core.override
  ReceivingNoteLineItem createEmptyInstance() => create();
  static $pb.PbList<ReceivingNoteLineItem> createRepeated() =>
      $pb.PbList<ReceivingNoteLineItem>();
  @$core.pragma('dart2js:noInline')
  static ReceivingNoteLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ReceivingNoteLineItem>(create);
  static ReceivingNoteLineItem? _defaultInstance;

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
  $core.double get purchasePrice => $_getN(7);
  @$pb.TagNumber(8)
  set purchasePrice($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasPurchasePrice() => $_has(7);
  @$pb.TagNumber(8)
  void clearPurchasePrice() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get storeId => $_getSZ(8);
  @$pb.TagNumber(9)
  set storeId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStoreId() => $_has(8);
  @$pb.TagNumber(9)
  void clearStoreId() => $_clearField(9);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
