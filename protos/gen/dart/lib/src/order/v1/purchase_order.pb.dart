// This is a generated file - do not edit.
//
// Generated from order/v1/purchase_order.proto.

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

import '../../financial/v1/invoice.pb.dart' as $3;
import '../../google/protobuf/timestamp.pb.dart' as $1;
import '../../inventory/v1/store_product.pb.dart' as $5;
import '../../logistic/v1/receiving_notes.pb.dart' as $2;
import '../../payments/v1/payments.pb.dart' as $4;
import 'order_utils.pb.dart' as $0;
import 'purchase_order.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'purchase_order.pbenum.dart';

/// *
///  PurchaseOrder (Bon de Commande to supplier)
///  Created when you want to buy products from a supplier.
///  Does NOT change inventory yet - just an intention.
///
///  Flow: Create PO → Send to supplier → Wait for delivery
///
///  Example:
///    po_id: "PO-2025-001"
///    supplier_id: "CMP-002" (supplier company)
///    buyer_id: "CMP-001" (your company)
///    status: PO_STATUS_PENDING
///    items: [50x PRD-001 @ 400000 each]
///    total_amount: 20000000 (centimes)
class PurchaseOrder extends $pb.GeneratedMessage {
  factory PurchaseOrder({
    $core.String? documentId,
    $core.String? supplierId,
    $core.String? buyerIdId,
    PurchaseOrderStatus? status,
    $core.Iterable<$0.OrderLineItem>? items,
    $fixnum.Int64? totalAmount,
    $core.String? currency,
    $core.String? createdByUserId,
    $1.Timestamp? createdAt,
    $1.Timestamp? expectedDeliveryDate,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (supplierId != null) result.supplierId = supplierId;
    if (buyerIdId != null) result.buyerIdId = buyerIdId;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (currency != null) result.currency = currency;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (createdAt != null) result.createdAt = createdAt;
    if (expectedDeliveryDate != null)
      result.expectedDeliveryDate = expectedDeliveryDate;
    if (notes != null) result.notes = notes;
    return result;
  }

  PurchaseOrder._();

  factory PurchaseOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PurchaseOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PurchaseOrder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'supplierId')
    ..aOS(3, _omitFieldNames ? '' : 'buyerIdId')
    ..e<PurchaseOrderStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: PurchaseOrderStatus.PO_STATUS_UNSPECIFIED,
        valueOf: PurchaseOrderStatus.valueOf,
        enumValues: PurchaseOrderStatus.values)
    ..pc<$0.OrderLineItem>(
        6, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $0.OrderLineItem.create)
    ..aInt64(7, _omitFieldNames ? '' : 'totalAmount')
    ..aOS(8, _omitFieldNames ? '' : 'currency')
    ..aOS(9, _omitFieldNames ? '' : 'createdByUserId')
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'expectedDeliveryDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseOrder clone() => PurchaseOrder()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseOrder copyWith(void Function(PurchaseOrder) updates) =>
      super.copyWith((message) => updates(message as PurchaseOrder))
          as PurchaseOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchaseOrder create() => PurchaseOrder._();
  @$core.override
  PurchaseOrder createEmptyInstance() => create();
  static $pb.PbList<PurchaseOrder> createRepeated() =>
      $pb.PbList<PurchaseOrder>();
  @$core.pragma('dart2js:noInline')
  static PurchaseOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PurchaseOrder>(create);
  static PurchaseOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get supplierId => $_getSZ(1);
  @$pb.TagNumber(2)
  set supplierId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSupplierId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupplierId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get buyerIdId => $_getSZ(2);
  @$pb.TagNumber(3)
  set buyerIdId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBuyerIdId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuyerIdId() => $_clearField(3);

  @$pb.TagNumber(5)
  PurchaseOrderStatus get status => $_getN(3);
  @$pb.TagNumber(5)
  set status(PurchaseOrderStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.OrderLineItem> get items => $_getList(4);

  @$pb.TagNumber(7)
  $fixnum.Int64 get totalAmount => $_getI64(5);
  @$pb.TagNumber(7)
  set totalAmount($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalAmount() => $_has(5);
  @$pb.TagNumber(7)
  void clearTotalAmount() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get currency => $_getSZ(6);
  @$pb.TagNumber(8)
  set currency($core.String value) => $_setString(6, value);
  @$pb.TagNumber(8)
  $core.bool hasCurrency() => $_has(6);
  @$pb.TagNumber(8)
  void clearCurrency() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get createdByUserId => $_getSZ(7);
  @$pb.TagNumber(9)
  set createdByUserId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedByUserId() => $_has(7);
  @$pb.TagNumber(9)
  void clearCreatedByUserId() => $_clearField(9);

  @$pb.TagNumber(10)
  $1.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(10)
  set createdAt($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(11)
  $1.Timestamp get expectedDeliveryDate => $_getN(9);
  @$pb.TagNumber(11)
  set expectedDeliveryDate($1.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasExpectedDeliveryDate() => $_has(9);
  @$pb.TagNumber(11)
  void clearExpectedDeliveryDate() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureExpectedDeliveryDate() => $_ensure(9);

  @$pb.TagNumber(12)
  $core.String get notes => $_getSZ(10);
  @$pb.TagNumber(12)
  set notes($core.String value) => $_setString(10, value);
  @$pb.TagNumber(12)
  $core.bool hasNotes() => $_has(10);
  @$pb.TagNumber(12)
  void clearNotes() => $_clearField(12);
}

class CancelPurchaseOrderResponse extends $pb.GeneratedMessage {
  factory CancelPurchaseOrderResponse({
    PurchaseOrder? purchaseOrder,
    $core.String? message,
  }) {
    final result = create();
    if (purchaseOrder != null) result.purchaseOrder = purchaseOrder;
    if (message != null) result.message = message;
    return result;
  }

  CancelPurchaseOrderResponse._();

  factory CancelPurchaseOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelPurchaseOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelPurchaseOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<PurchaseOrder>(1, _omitFieldNames ? '' : 'purchaseOrder',
        subBuilder: PurchaseOrder.create)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelPurchaseOrderResponse clone() =>
      CancelPurchaseOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelPurchaseOrderResponse copyWith(
          void Function(CancelPurchaseOrderResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CancelPurchaseOrderResponse))
          as CancelPurchaseOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelPurchaseOrderResponse create() =>
      CancelPurchaseOrderResponse._();
  @$core.override
  CancelPurchaseOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CancelPurchaseOrderResponse> createRepeated() =>
      $pb.PbList<CancelPurchaseOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CancelPurchaseOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelPurchaseOrderResponse>(create);
  static CancelPurchaseOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PurchaseOrder get purchaseOrder => $_getN(0);
  @$pb.TagNumber(1)
  set purchaseOrder(PurchaseOrder value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  PurchaseOrder ensurePurchaseOrder() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class CreatePurchaseOrderRequest extends $pb.GeneratedMessage {
  factory CreatePurchaseOrderRequest({
    $core.String? supplierId,
    $core.String? buyerId,
    $core.String? destinationId,
    $core.Iterable<$0.OrderLineItem>? items,
    $1.Timestamp? expectedDeliveryDate,
    $core.String? createdByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    if (buyerId != null) result.buyerId = buyerId;
    if (destinationId != null) result.destinationId = destinationId;
    if (items != null) result.items.addAll(items);
    if (expectedDeliveryDate != null)
      result.expectedDeliveryDate = expectedDeliveryDate;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (notes != null) result.notes = notes;
    return result;
  }

  CreatePurchaseOrderRequest._();

  factory CreatePurchaseOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePurchaseOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePurchaseOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'supplierId')
    ..aOS(2, _omitFieldNames ? '' : 'buyerId')
    ..aOS(3, _omitFieldNames ? '' : 'destinationId')
    ..pc<$0.OrderLineItem>(
        4, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $0.OrderLineItem.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'expectedDeliveryDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'createdByUserId')
    ..aOS(7, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePurchaseOrderRequest clone() =>
      CreatePurchaseOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePurchaseOrderRequest copyWith(
          void Function(CreatePurchaseOrderRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CreatePurchaseOrderRequest))
          as CreatePurchaseOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePurchaseOrderRequest create() => CreatePurchaseOrderRequest._();
  @$core.override
  CreatePurchaseOrderRequest createEmptyInstance() => create();
  static $pb.PbList<CreatePurchaseOrderRequest> createRepeated() =>
      $pb.PbList<CreatePurchaseOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static CreatePurchaseOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePurchaseOrderRequest>(create);
  static CreatePurchaseOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get supplierId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supplierId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplierId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplierId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get buyerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set buyerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBuyerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuyerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get destinationId => $_getSZ(2);
  @$pb.TagNumber(3)
  set destinationId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDestinationId() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestinationId() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$0.OrderLineItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $1.Timestamp get expectedDeliveryDate => $_getN(4);
  @$pb.TagNumber(5)
  set expectedDeliveryDate($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasExpectedDeliveryDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpectedDeliveryDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureExpectedDeliveryDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.String get createdByUserId => $_getSZ(5);
  @$pb.TagNumber(6)
  set createdByUserId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedByUserId() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedByUserId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.String get notes => $_getSZ(6);
  @$pb.TagNumber(7)
  set notes($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasNotes() => $_has(6);
  @$pb.TagNumber(7)
  void clearNotes() => $_clearField(7);
}

class CreatePurchaseOrderResponse extends $pb.GeneratedMessage {
  factory CreatePurchaseOrderResponse({
    $core.String? poId,
    PurchaseOrder? purchaseOrder,
    $core.String? message,
  }) {
    final result = create();
    if (poId != null) result.poId = poId;
    if (purchaseOrder != null) result.purchaseOrder = purchaseOrder;
    if (message != null) result.message = message;
    return result;
  }

  CreatePurchaseOrderResponse._();

  factory CreatePurchaseOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreatePurchaseOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreatePurchaseOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'poId')
    ..aOM<PurchaseOrder>(2, _omitFieldNames ? '' : 'purchaseOrder',
        subBuilder: PurchaseOrder.create)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePurchaseOrderResponse clone() =>
      CreatePurchaseOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreatePurchaseOrderResponse copyWith(
          void Function(CreatePurchaseOrderResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreatePurchaseOrderResponse))
          as CreatePurchaseOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreatePurchaseOrderResponse create() =>
      CreatePurchaseOrderResponse._();
  @$core.override
  CreatePurchaseOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CreatePurchaseOrderResponse> createRepeated() =>
      $pb.PbList<CreatePurchaseOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CreatePurchaseOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreatePurchaseOrderResponse>(create);
  static CreatePurchaseOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get poId => $_getSZ(0);
  @$pb.TagNumber(1)
  set poId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoId() => $_clearField(1);

  @$pb.TagNumber(2)
  PurchaseOrder get purchaseOrder => $_getN(1);
  @$pb.TagNumber(2)
  set purchaseOrder(PurchaseOrder value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasPurchaseOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearPurchaseOrder() => $_clearField(2);
  @$pb.TagNumber(2)
  PurchaseOrder ensurePurchaseOrder() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class GetPurchaseOrderRequest extends $pb.GeneratedMessage {
  factory GetPurchaseOrderRequest({
    $core.String? poId,
  }) {
    final result = create();
    if (poId != null) result.poId = poId;
    return result;
  }

  GetPurchaseOrderRequest._();

  factory GetPurchaseOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPurchaseOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPurchaseOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'poId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseOrderRequest clone() =>
      GetPurchaseOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseOrderRequest copyWith(
          void Function(GetPurchaseOrderRequest) updates) =>
      super.copyWith((message) => updates(message as GetPurchaseOrderRequest))
          as GetPurchaseOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPurchaseOrderRequest create() => GetPurchaseOrderRequest._();
  @$core.override
  GetPurchaseOrderRequest createEmptyInstance() => create();
  static $pb.PbList<GetPurchaseOrderRequest> createRepeated() =>
      $pb.PbList<GetPurchaseOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static GetPurchaseOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPurchaseOrderRequest>(create);
  static GetPurchaseOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get poId => $_getSZ(0);
  @$pb.TagNumber(1)
  set poId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoId() => $_clearField(1);
}

class GetPurchaseOrderResponse extends $pb.GeneratedMessage {
  factory GetPurchaseOrderResponse({
    PurchaseOrder? purchaseOrder,
    $core.Iterable<$2.ReceivingNote>? receivingNotes,
    $core.Iterable<$3.Invoice>? invoices,
    $core.Iterable<$4.Payment>? payments,
  }) {
    final result = create();
    if (purchaseOrder != null) result.purchaseOrder = purchaseOrder;
    if (receivingNotes != null) result.receivingNotes.addAll(receivingNotes);
    if (invoices != null) result.invoices.addAll(invoices);
    if (payments != null) result.payments.addAll(payments);
    return result;
  }

  GetPurchaseOrderResponse._();

  factory GetPurchaseOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetPurchaseOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetPurchaseOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<PurchaseOrder>(1, _omitFieldNames ? '' : 'purchaseOrder',
        subBuilder: PurchaseOrder.create)
    ..pc<$2.ReceivingNote>(
        2, _omitFieldNames ? '' : 'receivingNotes', $pb.PbFieldType.PM,
        subBuilder: $2.ReceivingNote.create)
    ..pc<$3.Invoice>(3, _omitFieldNames ? '' : 'invoices', $pb.PbFieldType.PM,
        subBuilder: $3.Invoice.create)
    ..pc<$4.Payment>(4, _omitFieldNames ? '' : 'payments', $pb.PbFieldType.PM,
        subBuilder: $4.Payment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseOrderResponse clone() =>
      GetPurchaseOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetPurchaseOrderResponse copyWith(
          void Function(GetPurchaseOrderResponse) updates) =>
      super.copyWith((message) => updates(message as GetPurchaseOrderResponse))
          as GetPurchaseOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetPurchaseOrderResponse create() => GetPurchaseOrderResponse._();
  @$core.override
  GetPurchaseOrderResponse createEmptyInstance() => create();
  static $pb.PbList<GetPurchaseOrderResponse> createRepeated() =>
      $pb.PbList<GetPurchaseOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static GetPurchaseOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetPurchaseOrderResponse>(create);
  static GetPurchaseOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PurchaseOrder get purchaseOrder => $_getN(0);
  @$pb.TagNumber(1)
  set purchaseOrder(PurchaseOrder value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  PurchaseOrder ensurePurchaseOrder() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$2.ReceivingNote> get receivingNotes => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$3.Invoice> get invoices => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$4.Payment> get payments => $_getList(3);
}

class ListPurchaseOrdersRequest extends $pb.GeneratedMessage {
  factory ListPurchaseOrdersRequest({
    $core.String? supplierId,
    PurchaseOrderStatus? status,
    $1.Timestamp? startDate,
    $1.Timestamp? endDate,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    if (status != null) result.status = status;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNumber != null) result.pageNumber = pageNumber;
    return result;
  }

  ListPurchaseOrdersRequest._();

  factory ListPurchaseOrdersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPurchaseOrdersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPurchaseOrdersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'supplierId')
    ..e<PurchaseOrderStatus>(
        2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: PurchaseOrderStatus.PO_STATUS_UNSPECIFIED,
        valueOf: PurchaseOrderStatus.valueOf,
        enumValues: PurchaseOrderStatus.values)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'startDate',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'endDate',
        subBuilder: $1.Timestamp.create)
    ..a<$core.int>(5, _omitFieldNames ? '' : 'pageSize', $pb.PbFieldType.O3)
    ..a<$core.int>(6, _omitFieldNames ? '' : 'pageNumber', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPurchaseOrdersRequest clone() =>
      ListPurchaseOrdersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPurchaseOrdersRequest copyWith(
          void Function(ListPurchaseOrdersRequest) updates) =>
      super.copyWith((message) => updates(message as ListPurchaseOrdersRequest))
          as ListPurchaseOrdersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPurchaseOrdersRequest create() => ListPurchaseOrdersRequest._();
  @$core.override
  ListPurchaseOrdersRequest createEmptyInstance() => create();
  static $pb.PbList<ListPurchaseOrdersRequest> createRepeated() =>
      $pb.PbList<ListPurchaseOrdersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListPurchaseOrdersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPurchaseOrdersRequest>(create);
  static ListPurchaseOrdersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get supplierId => $_getSZ(0);
  @$pb.TagNumber(1)
  set supplierId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSupplierId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSupplierId() => $_clearField(1);

  @$pb.TagNumber(2)
  PurchaseOrderStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(PurchaseOrderStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get startDate => $_getN(2);
  @$pb.TagNumber(3)
  set startDate($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasStartDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearStartDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureStartDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $1.Timestamp get endDate => $_getN(3);
  @$pb.TagNumber(4)
  set endDate($1.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasEndDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearEndDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $1.Timestamp ensureEndDate() => $_ensure(3);

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

class ListPurchaseOrdersResponse extends $pb.GeneratedMessage {
  factory ListPurchaseOrdersResponse({
    $core.Iterable<PurchaseOrder>? purchaseOrders,
    $core.int? totalCount,
    $fixnum.Int64? totalValue,
  }) {
    final result = create();
    if (purchaseOrders != null) result.purchaseOrders.addAll(purchaseOrders);
    if (totalCount != null) result.totalCount = totalCount;
    if (totalValue != null) result.totalValue = totalValue;
    return result;
  }

  ListPurchaseOrdersResponse._();

  factory ListPurchaseOrdersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListPurchaseOrdersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListPurchaseOrdersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..pc<PurchaseOrder>(
        1, _omitFieldNames ? '' : 'purchaseOrders', $pb.PbFieldType.PM,
        subBuilder: PurchaseOrder.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..aInt64(3, _omitFieldNames ? '' : 'totalValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPurchaseOrdersResponse clone() =>
      ListPurchaseOrdersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListPurchaseOrdersResponse copyWith(
          void Function(ListPurchaseOrdersResponse) updates) =>
      super.copyWith(
              (message) => updates(message as ListPurchaseOrdersResponse))
          as ListPurchaseOrdersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListPurchaseOrdersResponse create() => ListPurchaseOrdersResponse._();
  @$core.override
  ListPurchaseOrdersResponse createEmptyInstance() => create();
  static $pb.PbList<ListPurchaseOrdersResponse> createRepeated() =>
      $pb.PbList<ListPurchaseOrdersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListPurchaseOrdersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListPurchaseOrdersResponse>(create);
  static ListPurchaseOrdersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<PurchaseOrder> get purchaseOrders => $_getList(0);

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

class UpdatePurchaseOrderStatusRequest extends $pb.GeneratedMessage {
  factory UpdatePurchaseOrderStatusRequest({
    $core.String? poId,
    PurchaseOrderStatus? newStatus,
    $core.String? updatedByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (poId != null) result.poId = poId;
    if (newStatus != null) result.newStatus = newStatus;
    if (updatedByUserId != null) result.updatedByUserId = updatedByUserId;
    if (notes != null) result.notes = notes;
    return result;
  }

  UpdatePurchaseOrderStatusRequest._();

  factory UpdatePurchaseOrderStatusRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePurchaseOrderStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePurchaseOrderStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'poId')
    ..e<PurchaseOrderStatus>(
        2, _omitFieldNames ? '' : 'newStatus', $pb.PbFieldType.OE,
        defaultOrMaker: PurchaseOrderStatus.PO_STATUS_UNSPECIFIED,
        valueOf: PurchaseOrderStatus.valueOf,
        enumValues: PurchaseOrderStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'updatedByUserId')
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePurchaseOrderStatusRequest clone() =>
      UpdatePurchaseOrderStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePurchaseOrderStatusRequest copyWith(
          void Function(UpdatePurchaseOrderStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdatePurchaseOrderStatusRequest))
          as UpdatePurchaseOrderStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePurchaseOrderStatusRequest create() =>
      UpdatePurchaseOrderStatusRequest._();
  @$core.override
  UpdatePurchaseOrderStatusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdatePurchaseOrderStatusRequest> createRepeated() =>
      $pb.PbList<UpdatePurchaseOrderStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdatePurchaseOrderStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePurchaseOrderStatusRequest>(
          create);
  static UpdatePurchaseOrderStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get poId => $_getSZ(0);
  @$pb.TagNumber(1)
  set poId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoId() => $_clearField(1);

  @$pb.TagNumber(2)
  PurchaseOrderStatus get newStatus => $_getN(1);
  @$pb.TagNumber(2)
  set newStatus(PurchaseOrderStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasNewStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearNewStatus() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get updatedByUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set updatedByUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdatedByUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedByUserId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get notes => $_getSZ(3);
  @$pb.TagNumber(4)
  set notes($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasNotes() => $_has(3);
  @$pb.TagNumber(4)
  void clearNotes() => $_clearField(4);
}

class UpdatePurchaseOrderStatusResponse extends $pb.GeneratedMessage {
  factory UpdatePurchaseOrderStatusResponse({
    PurchaseOrder? purchaseOrder,
    $core.String? message,
  }) {
    final result = create();
    if (purchaseOrder != null) result.purchaseOrder = purchaseOrder;
    if (message != null) result.message = message;
    return result;
  }

  UpdatePurchaseOrderStatusResponse._();

  factory UpdatePurchaseOrderStatusResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdatePurchaseOrderStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdatePurchaseOrderStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<PurchaseOrder>(1, _omitFieldNames ? '' : 'purchaseOrder',
        subBuilder: PurchaseOrder.create)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePurchaseOrderStatusResponse clone() =>
      UpdatePurchaseOrderStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdatePurchaseOrderStatusResponse copyWith(
          void Function(UpdatePurchaseOrderStatusResponse) updates) =>
      super.copyWith((message) =>
              updates(message as UpdatePurchaseOrderStatusResponse))
          as UpdatePurchaseOrderStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdatePurchaseOrderStatusResponse create() =>
      UpdatePurchaseOrderStatusResponse._();
  @$core.override
  UpdatePurchaseOrderStatusResponse createEmptyInstance() => create();
  static $pb.PbList<UpdatePurchaseOrderStatusResponse> createRepeated() =>
      $pb.PbList<UpdatePurchaseOrderStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdatePurchaseOrderStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdatePurchaseOrderStatusResponse>(
          create);
  static UpdatePurchaseOrderStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  PurchaseOrder get purchaseOrder => $_getN(0);
  @$pb.TagNumber(1)
  set purchaseOrder(PurchaseOrder value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  PurchaseOrder ensurePurchaseOrder() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class CancelPurchaseOrderRequest extends $pb.GeneratedMessage {
  factory CancelPurchaseOrderRequest({
    $core.String? poId,
    $core.String? reason,
    $core.String? cancelledByUserId,
  }) {
    final result = create();
    if (poId != null) result.poId = poId;
    if (reason != null) result.reason = reason;
    if (cancelledByUserId != null) result.cancelledByUserId = cancelledByUserId;
    return result;
  }

  CancelPurchaseOrderRequest._();

  factory CancelPurchaseOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelPurchaseOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelPurchaseOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'poId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..aOS(3, _omitFieldNames ? '' : 'cancelledByUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelPurchaseOrderRequest clone() =>
      CancelPurchaseOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelPurchaseOrderRequest copyWith(
          void Function(CancelPurchaseOrderRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CancelPurchaseOrderRequest))
          as CancelPurchaseOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelPurchaseOrderRequest create() => CancelPurchaseOrderRequest._();
  @$core.override
  CancelPurchaseOrderRequest createEmptyInstance() => create();
  static $pb.PbList<CancelPurchaseOrderRequest> createRepeated() =>
      $pb.PbList<CancelPurchaseOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static CancelPurchaseOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelPurchaseOrderRequest>(create);
  static CancelPurchaseOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get poId => $_getSZ(0);
  @$pb.TagNumber(1)
  set poId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPoId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get reason => $_getSZ(1);
  @$pb.TagNumber(2)
  set reason($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasReason() => $_has(1);
  @$pb.TagNumber(2)
  void clearReason() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get cancelledByUserId => $_getSZ(2);
  @$pb.TagNumber(3)
  set cancelledByUserId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCancelledByUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCancelledByUserId() => $_clearField(3);
}

class CreateReceivingNoteRequest extends $pb.GeneratedMessage {
  factory CreateReceivingNoteRequest({
    $core.String? purchaseOrderId,
    $core.String? supplierId,
    $core.String? storeId,
    $core.Iterable<$2.ReceivingLineItem>? items,
    $core.String? receivedByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (purchaseOrderId != null) result.purchaseOrderId = purchaseOrderId;
    if (supplierId != null) result.supplierId = supplierId;
    if (storeId != null) result.storeId = storeId;
    if (items != null) result.items.addAll(items);
    if (receivedByUserId != null) result.receivedByUserId = receivedByUserId;
    if (notes != null) result.notes = notes;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'purchaseOrderId')
    ..aOS(2, _omitFieldNames ? '' : 'supplierId')
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..pc<$2.ReceivingLineItem>(
        4, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $2.ReceivingLineItem.create)
    ..aOS(5, _omitFieldNames ? '' : 'receivedByUserId')
    ..aOS(6, _omitFieldNames ? '' : 'notes')
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
  $core.String get purchaseOrderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set purchaseOrderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get supplierId => $_getSZ(1);
  @$pb.TagNumber(2)
  set supplierId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSupplierId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupplierId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$2.ReceivingLineItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get receivedByUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set receivedByUserId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasReceivedByUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearReceivedByUserId() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => $_clearField(6);
}

class CreateReceivingNoteResponse extends $pb.GeneratedMessage {
  factory CreateReceivingNoteResponse({
    $core.String? rnId,
    $2.ReceivingNote? receivingNote,
    $core.Iterable<$core.String>? inventoryTransactionIds,
    $core.bool? hasDiscrepancies,
    $core.Iterable<$core.String>? discrepancyProductIds,
    $core.String? message,
  }) {
    final result = create();
    if (rnId != null) result.rnId = rnId;
    if (receivingNote != null) result.receivingNote = receivingNote;
    if (inventoryTransactionIds != null)
      result.inventoryTransactionIds.addAll(inventoryTransactionIds);
    if (hasDiscrepancies != null) result.hasDiscrepancies = hasDiscrepancies;
    if (discrepancyProductIds != null)
      result.discrepancyProductIds.addAll(discrepancyProductIds);
    if (message != null) result.message = message;
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
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'rnId')
    ..aOM<$2.ReceivingNote>(2, _omitFieldNames ? '' : 'receivingNote',
        subBuilder: $2.ReceivingNote.create)
    ..pPS(3, _omitFieldNames ? '' : 'inventoryTransactionIds')
    ..aOB(4, _omitFieldNames ? '' : 'hasDiscrepancies')
    ..pPS(5, _omitFieldNames ? '' : 'discrepancyProductIds')
    ..aOS(6, _omitFieldNames ? '' : 'message')
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
  $core.String get rnId => $_getSZ(0);
  @$pb.TagNumber(1)
  set rnId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRnId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRnId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.ReceivingNote get receivingNote => $_getN(1);
  @$pb.TagNumber(2)
  set receivingNote($2.ReceivingNote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReceivingNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceivingNote() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.ReceivingNote ensureReceivingNote() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get inventoryTransactionIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.bool get hasDiscrepancies => $_getBF(3);
  @$pb.TagNumber(4)
  set hasDiscrepancies($core.bool value) => $_setBool(3, value);
  @$pb.TagNumber(4)
  $core.bool hasHasDiscrepancies() => $_has(3);
  @$pb.TagNumber(4)
  void clearHasDiscrepancies() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get discrepancyProductIds => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get message => $_getSZ(5);
  @$pb.TagNumber(6)
  set message($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasMessage() => $_has(5);
  @$pb.TagNumber(6)
  void clearMessage() => $_clearField(6);
}

class GetSuggestedPurchaseOrdersRequest extends $pb.GeneratedMessage {
  factory GetSuggestedPurchaseOrdersRequest({
    $core.String? storeId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  GetSuggestedPurchaseOrdersRequest._();

  factory GetSuggestedPurchaseOrdersRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSuggestedPurchaseOrdersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSuggestedPurchaseOrdersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSuggestedPurchaseOrdersRequest clone() =>
      GetSuggestedPurchaseOrdersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSuggestedPurchaseOrdersRequest copyWith(
          void Function(GetSuggestedPurchaseOrdersRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetSuggestedPurchaseOrdersRequest))
          as GetSuggestedPurchaseOrdersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSuggestedPurchaseOrdersRequest create() =>
      GetSuggestedPurchaseOrdersRequest._();
  @$core.override
  GetSuggestedPurchaseOrdersRequest createEmptyInstance() => create();
  static $pb.PbList<GetSuggestedPurchaseOrdersRequest> createRepeated() =>
      $pb.PbList<GetSuggestedPurchaseOrdersRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSuggestedPurchaseOrdersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSuggestedPurchaseOrdersRequest>(
          create);
  static GetSuggestedPurchaseOrdersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);
}

class GetSuggestedPurchaseOrdersResponse extends $pb.GeneratedMessage {
  factory GetSuggestedPurchaseOrdersResponse({
    $core.Iterable<SuggestedPurchase>? suggestions,
    $core.int? totalItems,
  }) {
    final result = create();
    if (suggestions != null) result.suggestions.addAll(suggestions);
    if (totalItems != null) result.totalItems = totalItems;
    return result;
  }

  GetSuggestedPurchaseOrdersResponse._();

  factory GetSuggestedPurchaseOrdersResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSuggestedPurchaseOrdersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSuggestedPurchaseOrdersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..pc<SuggestedPurchase>(
        1, _omitFieldNames ? '' : 'suggestions', $pb.PbFieldType.PM,
        subBuilder: SuggestedPurchase.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalItems', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSuggestedPurchaseOrdersResponse clone() =>
      GetSuggestedPurchaseOrdersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSuggestedPurchaseOrdersResponse copyWith(
          void Function(GetSuggestedPurchaseOrdersResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetSuggestedPurchaseOrdersResponse))
          as GetSuggestedPurchaseOrdersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSuggestedPurchaseOrdersResponse create() =>
      GetSuggestedPurchaseOrdersResponse._();
  @$core.override
  GetSuggestedPurchaseOrdersResponse createEmptyInstance() => create();
  static $pb.PbList<GetSuggestedPurchaseOrdersResponse> createRepeated() =>
      $pb.PbList<GetSuggestedPurchaseOrdersResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSuggestedPurchaseOrdersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSuggestedPurchaseOrdersResponse>(
          create);
  static GetSuggestedPurchaseOrdersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SuggestedPurchase> get suggestions => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalItems => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalItems($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalItems() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalItems() => $_clearField(2);
}

class SuggestedPurchase extends $pb.GeneratedMessage {
  factory SuggestedPurchase({
    $5.StoreProduct? product,
    $core.String? preferredSupplierId,
    $fixnum.Int64? currentStock,
    $fixnum.Int64? reorderLevel,
    $fixnum.Int64? suggestedQuantity,
    $fixnum.Int64? estimatedCost,
  }) {
    final result = create();
    if (product != null) result.product = product;
    if (preferredSupplierId != null)
      result.preferredSupplierId = preferredSupplierId;
    if (currentStock != null) result.currentStock = currentStock;
    if (reorderLevel != null) result.reorderLevel = reorderLevel;
    if (suggestedQuantity != null) result.suggestedQuantity = suggestedQuantity;
    if (estimatedCost != null) result.estimatedCost = estimatedCost;
    return result;
  }

  SuggestedPurchase._();

  factory SuggestedPurchase.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SuggestedPurchase.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SuggestedPurchase',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<$5.StoreProduct>(1, _omitFieldNames ? '' : 'product',
        subBuilder: $5.StoreProduct.create)
    ..aOS(2, _omitFieldNames ? '' : 'preferredSupplierId')
    ..aInt64(3, _omitFieldNames ? '' : 'currentStock')
    ..aInt64(4, _omitFieldNames ? '' : 'reorderLevel')
    ..aInt64(5, _omitFieldNames ? '' : 'suggestedQuantity')
    ..aInt64(6, _omitFieldNames ? '' : 'estimatedCost')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuggestedPurchase clone() => SuggestedPurchase()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SuggestedPurchase copyWith(void Function(SuggestedPurchase) updates) =>
      super.copyWith((message) => updates(message as SuggestedPurchase))
          as SuggestedPurchase;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SuggestedPurchase create() => SuggestedPurchase._();
  @$core.override
  SuggestedPurchase createEmptyInstance() => create();
  static $pb.PbList<SuggestedPurchase> createRepeated() =>
      $pb.PbList<SuggestedPurchase>();
  @$core.pragma('dart2js:noInline')
  static SuggestedPurchase getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SuggestedPurchase>(create);
  static SuggestedPurchase? _defaultInstance;

  @$pb.TagNumber(1)
  $5.StoreProduct get product => $_getN(0);
  @$pb.TagNumber(1)
  set product($5.StoreProduct value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasProduct() => $_has(0);
  @$pb.TagNumber(1)
  void clearProduct() => $_clearField(1);
  @$pb.TagNumber(1)
  $5.StoreProduct ensureProduct() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get preferredSupplierId => $_getSZ(1);
  @$pb.TagNumber(2)
  set preferredSupplierId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPreferredSupplierId() => $_has(1);
  @$pb.TagNumber(2)
  void clearPreferredSupplierId() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get currentStock => $_getI64(2);
  @$pb.TagNumber(3)
  set currentStock($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCurrentStock() => $_has(2);
  @$pb.TagNumber(3)
  void clearCurrentStock() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get reorderLevel => $_getI64(3);
  @$pb.TagNumber(4)
  set reorderLevel($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasReorderLevel() => $_has(3);
  @$pb.TagNumber(4)
  void clearReorderLevel() => $_clearField(4);

  @$pb.TagNumber(5)
  $fixnum.Int64 get suggestedQuantity => $_getI64(4);
  @$pb.TagNumber(5)
  set suggestedQuantity($fixnum.Int64 value) => $_setInt64(4, value);
  @$pb.TagNumber(5)
  $core.bool hasSuggestedQuantity() => $_has(4);
  @$pb.TagNumber(5)
  void clearSuggestedQuantity() => $_clearField(5);

  @$pb.TagNumber(6)
  $fixnum.Int64 get estimatedCost => $_getI64(5);
  @$pb.TagNumber(6)
  set estimatedCost($fixnum.Int64 value) => $_setInt64(5, value);
  @$pb.TagNumber(6)
  $core.bool hasEstimatedCost() => $_has(5);
  @$pb.TagNumber(6)
  void clearEstimatedCost() => $_clearField(6);
}

class PurchaseOrderServiceApi {
  final $pb.RpcClient _client;

  PurchaseOrderServiceApi(this._client);

  /// Create a purchase order to supplier
  $async.Future<CreatePurchaseOrderResponse> createPurchaseOrder(
          $pb.ClientContext? ctx, CreatePurchaseOrderRequest request) =>
      _client.invoke<CreatePurchaseOrderResponse>(ctx, 'PurchaseOrderService',
          'CreatePurchaseOrder', request, CreatePurchaseOrderResponse());

  /// Get purchase order details
  $async.Future<GetPurchaseOrderResponse> getPurchaseOrder(
          $pb.ClientContext? ctx, GetPurchaseOrderRequest request) =>
      _client.invoke<GetPurchaseOrderResponse>(ctx, 'PurchaseOrderService',
          'GetPurchaseOrder', request, GetPurchaseOrderResponse());

  /// List purchase orders
  $async.Future<ListPurchaseOrdersResponse> listPurchaseOrders(
          $pb.ClientContext? ctx, ListPurchaseOrdersRequest request) =>
      _client.invoke<ListPurchaseOrdersResponse>(ctx, 'PurchaseOrderService',
          'ListPurchaseOrders', request, ListPurchaseOrdersResponse());

  /// Update purchase order status
  $async.Future<UpdatePurchaseOrderStatusResponse> updatePurchaseOrderStatus(
          $pb.ClientContext? ctx, UpdatePurchaseOrderStatusRequest request) =>
      _client.invoke<UpdatePurchaseOrderStatusResponse>(
          ctx,
          'PurchaseOrderService',
          'UpdatePurchaseOrderStatus',
          request,
          UpdatePurchaseOrderStatusResponse());

  /// Cancel purchase order
  $async.Future<CancelPurchaseOrderResponse> cancelPurchaseOrder(
          $pb.ClientContext? ctx, CancelPurchaseOrderRequest request) =>
      _client.invoke<CancelPurchaseOrderResponse>(ctx, 'PurchaseOrderService',
          'CancelPurchaseOrder', request, CancelPurchaseOrderResponse());

  /// Create receiving note when goods arrive
  $async.Future<CreateReceivingNoteResponse> createReceivingNote(
          $pb.ClientContext? ctx, CreateReceivingNoteRequest request) =>
      _client.invoke<CreateReceivingNoteResponse>(ctx, 'PurchaseOrderService',
          'CreateReceivingNote', request, CreateReceivingNoteResponse());

  /// Get suggested purchase orders (low stock items)
  $async.Future<GetSuggestedPurchaseOrdersResponse> getSuggestedPurchaseOrders(
          $pb.ClientContext? ctx, GetSuggestedPurchaseOrdersRequest request) =>
      _client.invoke<GetSuggestedPurchaseOrdersResponse>(
          ctx,
          'PurchaseOrderService',
          'GetSuggestedPurchaseOrders',
          request,
          GetSuggestedPurchaseOrdersResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
