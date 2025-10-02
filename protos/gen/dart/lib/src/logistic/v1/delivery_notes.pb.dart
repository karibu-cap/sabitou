// This is a generated file - do not edit.
//
// Generated from logistic/v1/delivery_notes.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'delivery_notes.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'delivery_notes.pbenum.dart';

/// *
///  DeliveryNote (Bon de Livraison)
///  Accompanies goods when they are physically shipped.
///  THIS IS WHAT REDUCES INVENTORY at the source.
///
///  Fix: DeliveryLineItem now includes batch_id for lot tracking.
///
///  Flow: Pick items → Create DeliveryNote → Ship → Customer receives
///
///  Example:
///    dn_id: "DN-2025-001"
///    related_sales_order_id: "SO-2025-001"
///    from_warehouse_id: "WH-001"
///    to_company_id: "CMP-003" (customer)
///    items: [10x PRD-001]
///    status: DN_STATUS_IN_TRANSIT
///
///  INVENTORY IMPACT: -10 PRD-001 from WH-001
class DeliveryNote extends $pb.GeneratedMessage {
  factory DeliveryNote({
    $core.String? documentId,
    $core.String? relatedSalesOrderId,
    $core.String? fromWarehouseId,
    $core.String? toCompanyId,
    $core.String? toAddress,
    DeliveryNoteStatus? status,
    $core.Iterable<DeliveryLineItem>? items,
    $core.String? carrier,
    $core.String? trackingNumber,
    $core.String? createdByUserId,
    $0.Timestamp? createdAt,
    $0.Timestamp? shippedAt,
    $0.Timestamp? deliveredAt,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (relatedSalesOrderId != null)
      result.relatedSalesOrderId = relatedSalesOrderId;
    if (fromWarehouseId != null) result.fromWarehouseId = fromWarehouseId;
    if (toCompanyId != null) result.toCompanyId = toCompanyId;
    if (toAddress != null) result.toAddress = toAddress;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (carrier != null) result.carrier = carrier;
    if (trackingNumber != null) result.trackingNumber = trackingNumber;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (createdAt != null) result.createdAt = createdAt;
    if (shippedAt != null) result.shippedAt = shippedAt;
    if (deliveredAt != null) result.deliveredAt = deliveredAt;
    if (notes != null) result.notes = notes;
    return result;
  }

  DeliveryNote._();

  factory DeliveryNote.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeliveryNote.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeliveryNote',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedSalesOrderId')
    ..aOS(3, _omitFieldNames ? '' : 'fromWarehouseId')
    ..aOS(4, _omitFieldNames ? '' : 'toCompanyId')
    ..aOS(5, _omitFieldNames ? '' : 'toAddress')
    ..e<DeliveryNoteStatus>(
        6, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: DeliveryNoteStatus.DN_STATUS_UNSPECIFIED,
        valueOf: DeliveryNoteStatus.valueOf,
        enumValues: DeliveryNoteStatus.values)
    ..pc<DeliveryLineItem>(
        7, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: DeliveryLineItem.create)
    ..aOS(8, _omitFieldNames ? '' : 'carrier')
    ..aOS(9, _omitFieldNames ? '' : 'trackingNumber')
    ..aOS(10, _omitFieldNames ? '' : 'createdByUserId')
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(12, _omitFieldNames ? '' : 'shippedAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(13, _omitFieldNames ? '' : 'deliveredAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(14, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeliveryNote clone() => DeliveryNote()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeliveryNote copyWith(void Function(DeliveryNote) updates) =>
      super.copyWith((message) => updates(message as DeliveryNote))
          as DeliveryNote;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeliveryNote create() => DeliveryNote._();
  @$core.override
  DeliveryNote createEmptyInstance() => create();
  static $pb.PbList<DeliveryNote> createRepeated() =>
      $pb.PbList<DeliveryNote>();
  @$core.pragma('dart2js:noInline')
  static DeliveryNote getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeliveryNote>(create);
  static DeliveryNote? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get relatedSalesOrderId => $_getSZ(1);
  @$pb.TagNumber(2)
  set relatedSalesOrderId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasRelatedSalesOrderId() => $_has(1);
  @$pb.TagNumber(2)
  void clearRelatedSalesOrderId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get fromWarehouseId => $_getSZ(2);
  @$pb.TagNumber(3)
  set fromWarehouseId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasFromWarehouseId() => $_has(2);
  @$pb.TagNumber(3)
  void clearFromWarehouseId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get toCompanyId => $_getSZ(3);
  @$pb.TagNumber(4)
  set toCompanyId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasToCompanyId() => $_has(3);
  @$pb.TagNumber(4)
  void clearToCompanyId() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get toAddress => $_getSZ(4);
  @$pb.TagNumber(5)
  set toAddress($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasToAddress() => $_has(4);
  @$pb.TagNumber(5)
  void clearToAddress() => $_clearField(5);

  @$pb.TagNumber(6)
  DeliveryNoteStatus get status => $_getN(5);
  @$pb.TagNumber(6)
  set status(DeliveryNoteStatus value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasStatus() => $_has(5);
  @$pb.TagNumber(6)
  void clearStatus() => $_clearField(6);

  @$pb.TagNumber(7)
  $pb.PbList<DeliveryLineItem> get items => $_getList(6);

  /// "DHL", "Local Delivery", etc.
  @$pb.TagNumber(8)
  $core.String get carrier => $_getSZ(7);
  @$pb.TagNumber(8)
  set carrier($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCarrier() => $_has(7);
  @$pb.TagNumber(8)
  void clearCarrier() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get trackingNumber => $_getSZ(8);
  @$pb.TagNumber(9)
  set trackingNumber($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasTrackingNumber() => $_has(8);
  @$pb.TagNumber(9)
  void clearTrackingNumber() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.String get createdByUserId => $_getSZ(9);
  @$pb.TagNumber(10)
  set createdByUserId($core.String value) => $_setString(9, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedByUserId() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedByUserId() => $_clearField(10);

  @$pb.TagNumber(11)
  $0.Timestamp get createdAt => $_getN(10);
  @$pb.TagNumber(11)
  set createdAt($0.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasCreatedAt() => $_has(10);
  @$pb.TagNumber(11)
  void clearCreatedAt() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureCreatedAt() => $_ensure(10);

  @$pb.TagNumber(12)
  $0.Timestamp get shippedAt => $_getN(11);
  @$pb.TagNumber(12)
  set shippedAt($0.Timestamp value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasShippedAt() => $_has(11);
  @$pb.TagNumber(12)
  void clearShippedAt() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.Timestamp ensureShippedAt() => $_ensure(11);

  @$pb.TagNumber(13)
  $0.Timestamp get deliveredAt => $_getN(12);
  @$pb.TagNumber(13)
  set deliveredAt($0.Timestamp value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasDeliveredAt() => $_has(12);
  @$pb.TagNumber(13)
  void clearDeliveredAt() => $_clearField(13);
  @$pb.TagNumber(13)
  $0.Timestamp ensureDeliveredAt() => $_ensure(12);

  @$pb.TagNumber(14)
  $core.String get notes => $_getSZ(13);
  @$pb.TagNumber(14)
  set notes($core.String value) => $_setString(13, value);
  @$pb.TagNumber(14)
  $core.bool hasNotes() => $_has(13);
  @$pb.TagNumber(14)
  void clearNotes() => $_clearField(14);
}

/// *
///  DeliveryLineItem for tracking shipped quantities.
///
///  Fix: Added batch_id to specify which lot is being shipped (FIFO/LIFO/expiration-based picking).
class DeliveryLineItem extends $pb.GeneratedMessage {
  factory DeliveryLineItem({
    $core.String? productId,
    $core.double? quantity,
    $core.String? serialNumbers,
    $core.String? batchId,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (quantity != null) result.quantity = quantity;
    if (serialNumbers != null) result.serialNumbers = serialNumbers;
    if (batchId != null) result.batchId = batchId;
    return result;
  }

  DeliveryLineItem._();

  factory DeliveryLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeliveryLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeliveryLineItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..a<$core.double>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.OD)
    ..aOS(3, _omitFieldNames ? '' : 'serialNumbers')
    ..aOS(4, _omitFieldNames ? '' : 'batchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeliveryLineItem clone() => DeliveryLineItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeliveryLineItem copyWith(void Function(DeliveryLineItem) updates) =>
      super.copyWith((message) => updates(message as DeliveryLineItem))
          as DeliveryLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeliveryLineItem create() => DeliveryLineItem._();
  @$core.override
  DeliveryLineItem createEmptyInstance() => create();
  static $pb.PbList<DeliveryLineItem> createRepeated() =>
      $pb.PbList<DeliveryLineItem>();
  @$core.pragma('dart2js:noInline')
  static DeliveryLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeliveryLineItem>(create);
  static DeliveryLineItem? _defaultInstance;

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
  $core.String get serialNumbers => $_getSZ(2);
  @$pb.TagNumber(3)
  set serialNumbers($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSerialNumbers() => $_has(2);
  @$pb.TagNumber(3)
  void clearSerialNumbers() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get batchId => $_getSZ(3);
  @$pb.TagNumber(4)
  set batchId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBatchId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBatchId() => $_clearField(4);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
