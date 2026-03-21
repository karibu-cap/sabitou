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

import 'package:protobuf/protobuf.dart' as $pb;

import '../../financial/v1/invoice.pb.dart' as $4;
import '../../google/protobuf/timestamp.pb.dart' as $0;
import '../../inventory/v1/category.pb.dart' as $1;
import '../../logistic/v1/receiving_notes.pb.dart' as $3;
import '../../payments/v1/payments.pb.dart' as $5;
import 'order_utils.pb.dart' as $2;
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
///    purchase_order_id: "PO-2025-001"
///    supplier_id: "CMP-002" (supplier company)
///    buyer_id: "CMP-001" (your company)
///    status: PO_STATUS_PENDING
///    items: [50x PRD-001 @ 400000 each]
///    total_amount: 20000000 (centimes)
class PurchaseOrder extends $pb.GeneratedMessage {
  factory PurchaseOrder({
    $core.String? refId,
    $core.String? supplierId,
    $core.String? storeId,
    PurchaseOrderStatus? status,
    $core.Iterable<PurchaseOrderLineItems>? items,
    $core.double? totalAmount,
    $core.String? currency,
    $core.String? createdByUserId,
    $0.Timestamp? createdAt,
    $0.Timestamp? expectedDeliveryDate,
    $core.String? notes,
    $core.String? destinationAddress,
    $core.String? storeName,
    $core.String? supplierName,
    $0.Timestamp? orderDate,
    $core.String? paymentId,
    $core.double? subTotal,
    $core.double? taxTotal,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (supplierId != null) result.supplierId = supplierId;
    if (storeId != null) result.storeId = storeId;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (currency != null) result.currency = currency;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (createdAt != null) result.createdAt = createdAt;
    if (expectedDeliveryDate != null)
      result.expectedDeliveryDate = expectedDeliveryDate;
    if (notes != null) result.notes = notes;
    if (destinationAddress != null)
      result.destinationAddress = destinationAddress;
    if (storeName != null) result.storeName = storeName;
    if (supplierName != null) result.supplierName = supplierName;
    if (orderDate != null) result.orderDate = orderDate;
    if (paymentId != null) result.paymentId = paymentId;
    if (subTotal != null) result.subTotal = subTotal;
    if (taxTotal != null) result.taxTotal = taxTotal;
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
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'supplierId')
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..e<PurchaseOrderStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: PurchaseOrderStatus.PO_STATUS_UNSPECIFIED,
        valueOf: PurchaseOrderStatus.valueOf,
        enumValues: PurchaseOrderStatus.values)
    ..pc<PurchaseOrderLineItems>(
        6, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: PurchaseOrderLineItems.create)
    ..a<$core.double>(
        7, _omitFieldNames ? '' : 'totalAmount', $pb.PbFieldType.OD)
    ..aOS(8, _omitFieldNames ? '' : 'currency')
    ..aOS(9, _omitFieldNames ? '' : 'createdByUserId')
    ..aOM<$0.Timestamp>(10, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(11, _omitFieldNames ? '' : 'expectedDeliveryDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'notes')
    ..aOS(13, _omitFieldNames ? '' : 'destinationAddress')
    ..aOS(14, _omitFieldNames ? '' : 'storeName')
    ..aOS(15, _omitFieldNames ? '' : 'supplierName')
    ..aOM<$0.Timestamp>(16, _omitFieldNames ? '' : 'orderDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(17, _omitFieldNames ? '' : 'paymentId')
    ..a<$core.double>(18, _omitFieldNames ? '' : 'subTotal', $pb.PbFieldType.OD)
    ..a<$core.double>(19, _omitFieldNames ? '' : 'taxTotal', $pb.PbFieldType.OD)
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

  /// "PO-2025-001"
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// Company selling to you
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

  @$pb.TagNumber(5)
  PurchaseOrderStatus get status => $_getN(3);
  @$pb.TagNumber(5)
  set status(PurchaseOrderStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<PurchaseOrderLineItems> get items => $_getList(4);

  @$pb.TagNumber(7)
  $core.double get totalAmount => $_getN(5);
  @$pb.TagNumber(7)
  set totalAmount($core.double value) => $_setDouble(5, value);
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
  $0.Timestamp get createdAt => $_getN(8);
  @$pb.TagNumber(10)
  set createdAt($0.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(8);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.Timestamp ensureCreatedAt() => $_ensure(8);

  @$pb.TagNumber(11)
  $0.Timestamp get expectedDeliveryDate => $_getN(9);
  @$pb.TagNumber(11)
  set expectedDeliveryDate($0.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasExpectedDeliveryDate() => $_has(9);
  @$pb.TagNumber(11)
  void clearExpectedDeliveryDate() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.Timestamp ensureExpectedDeliveryDate() => $_ensure(9);

  @$pb.TagNumber(12)
  $core.String get notes => $_getSZ(10);
  @$pb.TagNumber(12)
  set notes($core.String value) => $_setString(10, value);
  @$pb.TagNumber(12)
  $core.bool hasNotes() => $_has(10);
  @$pb.TagNumber(12)
  void clearNotes() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get destinationAddress => $_getSZ(11);
  @$pb.TagNumber(13)
  set destinationAddress($core.String value) => $_setString(11, value);
  @$pb.TagNumber(13)
  $core.bool hasDestinationAddress() => $_has(11);
  @$pb.TagNumber(13)
  void clearDestinationAddress() => $_clearField(13);

  @$pb.TagNumber(14)
  $core.String get storeName => $_getSZ(12);
  @$pb.TagNumber(14)
  set storeName($core.String value) => $_setString(12, value);
  @$pb.TagNumber(14)
  $core.bool hasStoreName() => $_has(12);
  @$pb.TagNumber(14)
  void clearStoreName() => $_clearField(14);

  @$pb.TagNumber(15)
  $core.String get supplierName => $_getSZ(13);
  @$pb.TagNumber(15)
  set supplierName($core.String value) => $_setString(13, value);
  @$pb.TagNumber(15)
  $core.bool hasSupplierName() => $_has(13);
  @$pb.TagNumber(15)
  void clearSupplierName() => $_clearField(15);

  @$pb.TagNumber(16)
  $0.Timestamp get orderDate => $_getN(14);
  @$pb.TagNumber(16)
  set orderDate($0.Timestamp value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasOrderDate() => $_has(14);
  @$pb.TagNumber(16)
  void clearOrderDate() => $_clearField(16);
  @$pb.TagNumber(16)
  $0.Timestamp ensureOrderDate() => $_ensure(14);

  @$pb.TagNumber(17)
  $core.String get paymentId => $_getSZ(15);
  @$pb.TagNumber(17)
  set paymentId($core.String value) => $_setString(15, value);
  @$pb.TagNumber(17)
  $core.bool hasPaymentId() => $_has(15);
  @$pb.TagNumber(17)
  void clearPaymentId() => $_clearField(17);

  @$pb.TagNumber(18)
  $core.double get subTotal => $_getN(16);
  @$pb.TagNumber(18)
  set subTotal($core.double value) => $_setDouble(16, value);
  @$pb.TagNumber(18)
  $core.bool hasSubTotal() => $_has(16);
  @$pb.TagNumber(18)
  void clearSubTotal() => $_clearField(18);

  @$pb.TagNumber(19)
  $core.double get taxTotal => $_getN(17);
  @$pb.TagNumber(19)
  set taxTotal($core.double value) => $_setDouble(17, value);
  @$pb.TagNumber(19)
  $core.bool hasTaxTotal() => $_has(17);
  @$pb.TagNumber(19)
  void clearTaxTotal() => $_clearField(19);
}

class PurchaseOrderLineItems extends $pb.GeneratedMessage {
  factory PurchaseOrderLineItems({
    $core.String? productId,
    $core.int? quantityOrdered,
    $1.Internationalized? productName,
    $core.double? unitPrice,
    $core.double? total,
    $core.String? batchId,
    $core.int? quantityReceived,
    $core.double? taxAmount,
    $core.String? storeId,
    $core.int? lineIndex,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (quantityOrdered != null) result.quantityOrdered = quantityOrdered;
    if (productName != null) result.productName = productName;
    if (unitPrice != null) result.unitPrice = unitPrice;
    if (total != null) result.total = total;
    if (batchId != null) result.batchId = batchId;
    if (quantityReceived != null) result.quantityReceived = quantityReceived;
    if (taxAmount != null) result.taxAmount = taxAmount;
    if (storeId != null) result.storeId = storeId;
    if (lineIndex != null) result.lineIndex = lineIndex;
    return result;
  }

  PurchaseOrderLineItems._();

  factory PurchaseOrderLineItems.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory PurchaseOrderLineItems.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'PurchaseOrderLineItems',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'quantityOrdered', $pb.PbFieldType.O3)
    ..aOM<$1.Internationalized>(3, _omitFieldNames ? '' : 'productName',
        subBuilder: $1.Internationalized.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'unitPrice', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OD)
    ..aOS(6, _omitFieldNames ? '' : 'batchId')
    ..a<$core.int>(
        7, _omitFieldNames ? '' : 'quantityReceived', $pb.PbFieldType.O3)
    ..a<$core.double>(8, _omitFieldNames ? '' : 'taxAmount', $pb.PbFieldType.OD)
    ..aOS(9, _omitFieldNames ? '' : 'storeId')
    ..a<$core.int>(10, _omitFieldNames ? '' : 'lineIndex', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseOrderLineItems clone() =>
      PurchaseOrderLineItems()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  PurchaseOrderLineItems copyWith(
          void Function(PurchaseOrderLineItems) updates) =>
      super.copyWith((message) => updates(message as PurchaseOrderLineItems))
          as PurchaseOrderLineItems;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static PurchaseOrderLineItems create() => PurchaseOrderLineItems._();
  @$core.override
  PurchaseOrderLineItems createEmptyInstance() => create();
  static $pb.PbList<PurchaseOrderLineItems> createRepeated() =>
      $pb.PbList<PurchaseOrderLineItems>();
  @$core.pragma('dart2js:noInline')
  static PurchaseOrderLineItems getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<PurchaseOrderLineItems>(create);
  static PurchaseOrderLineItems? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get quantityOrdered => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantityOrdered($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantityOrdered() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantityOrdered() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Internationalized get productName => $_getN(2);
  @$pb.TagNumber(3)
  set productName($1.Internationalized value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProductName() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductName() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Internationalized ensureProductName() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.double get unitPrice => $_getN(3);
  @$pb.TagNumber(4)
  set unitPrice($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnitPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnitPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get total => $_getN(4);
  @$pb.TagNumber(5)
  set total($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTotal() => $_has(4);
  @$pb.TagNumber(5)
  void clearTotal() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.String get batchId => $_getSZ(5);
  @$pb.TagNumber(6)
  set batchId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBatchId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBatchId() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get quantityReceived => $_getIZ(6);
  @$pb.TagNumber(7)
  set quantityReceived($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasQuantityReceived() => $_has(6);
  @$pb.TagNumber(7)
  void clearQuantityReceived() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.double get taxAmount => $_getN(7);
  @$pb.TagNumber(8)
  set taxAmount($core.double value) => $_setDouble(7, value);
  @$pb.TagNumber(8)
  $core.bool hasTaxAmount() => $_has(7);
  @$pb.TagNumber(8)
  void clearTaxAmount() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get storeId => $_getSZ(8);
  @$pb.TagNumber(9)
  set storeId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasStoreId() => $_has(8);
  @$pb.TagNumber(9)
  void clearStoreId() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.int get lineIndex => $_getIZ(9);
  @$pb.TagNumber(10)
  set lineIndex($core.int value) => $_setSignedInt32(9, value);
  @$pb.TagNumber(10)
  $core.bool hasLineIndex() => $_has(9);
  @$pb.TagNumber(10)
  void clearLineIndex() => $_clearField(10);
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
    $core.String? destinationAddress,
    $core.Iterable<$2.OrderLineItem>? items,
    $0.Timestamp? expectedDeliveryDate,
    $core.String? createdByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    if (buyerId != null) result.buyerId = buyerId;
    if (destinationAddress != null)
      result.destinationAddress = destinationAddress;
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
    ..aOS(3, _omitFieldNames ? '' : 'destinationAddress')
    ..pc<$2.OrderLineItem>(
        4, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $2.OrderLineItem.create)
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'expectedDeliveryDate',
        subBuilder: $0.Timestamp.create)
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

  /// Where to receive items by default is the buyer's warehouse.
  @$pb.TagNumber(3)
  $core.String get destinationAddress => $_getSZ(2);
  @$pb.TagNumber(3)
  set destinationAddress($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasDestinationAddress() => $_has(2);
  @$pb.TagNumber(3)
  void clearDestinationAddress() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$2.OrderLineItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $0.Timestamp get expectedDeliveryDate => $_getN(4);
  @$pb.TagNumber(5)
  set expectedDeliveryDate($0.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasExpectedDeliveryDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpectedDeliveryDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureExpectedDeliveryDate() => $_ensure(4);

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
    $core.String? purchaseOrderId,
    PurchaseOrder? purchaseOrder,
    $core.String? message,
  }) {
    final result = create();
    if (purchaseOrderId != null) result.purchaseOrderId = purchaseOrderId;
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
    ..aOS(1, _omitFieldNames ? '' : 'purchaseOrderId')
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
  $core.String get purchaseOrderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set purchaseOrderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrderId() => $_clearField(1);

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
    $core.String? purchaseOrderId,
  }) {
    final result = create();
    if (purchaseOrderId != null) result.purchaseOrderId = purchaseOrderId;
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
    ..aOS(1, _omitFieldNames ? '' : 'purchaseOrderId')
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
  $core.String get purchaseOrderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set purchaseOrderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrderId() => $_clearField(1);
}

class GetPurchaseOrderResponse extends $pb.GeneratedMessage {
  factory GetPurchaseOrderResponse({
    PurchaseOrder? purchaseOrder,
    $core.Iterable<$3.ReceivingNote>? receivingNotes,
    $core.Iterable<$4.Invoice>? invoices,
    $core.Iterable<$5.Payment>? payments,
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
    ..pc<$3.ReceivingNote>(
        2, _omitFieldNames ? '' : 'receivingNotes', $pb.PbFieldType.PM,
        subBuilder: $3.ReceivingNote.create)
    ..pc<$4.Invoice>(3, _omitFieldNames ? '' : 'invoices', $pb.PbFieldType.PM,
        subBuilder: $4.Invoice.create)
    ..pc<$5.Payment>(4, _omitFieldNames ? '' : 'payments', $pb.PbFieldType.PM,
        subBuilder: $5.Payment.create)
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
  $pb.PbList<$3.ReceivingNote> get receivingNotes => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$4.Invoice> get invoices => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$5.Payment> get payments => $_getList(3);
}

class ListPurchaseOrdersRequest extends $pb.GeneratedMessage {
  factory ListPurchaseOrdersRequest({
    $core.String? supplierId,
    $core.String? buyerId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (supplierId != null) result.supplierId = supplierId;
    if (buyerId != null) result.buyerId = buyerId;
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
    ..aOS(2, _omitFieldNames ? '' : 'buyerId')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
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
  $core.String get buyerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set buyerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBuyerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBuyerId() => $_clearField(2);

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

class ListPurchaseOrdersResponse extends $pb.GeneratedMessage {
  factory ListPurchaseOrdersResponse({
    $core.Iterable<PurchaseOrder>? purchaseOrders,
    $core.int? totalCount,
    $core.double? totalValue,
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
    ..a<$core.double>(
        3, _omitFieldNames ? '' : 'totalValue', $pb.PbFieldType.OD)
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
  $core.double get totalValue => $_getN(2);
  @$pb.TagNumber(3)
  set totalValue($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalValue() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalValue() => $_clearField(3);
}

class UpdatePurchaseOrderStatusRequest extends $pb.GeneratedMessage {
  factory UpdatePurchaseOrderStatusRequest({
    $core.String? purchaseOrderId,
    PurchaseOrderStatus? newStatus,
    $core.String? updatedByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (purchaseOrderId != null) result.purchaseOrderId = purchaseOrderId;
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
    ..aOS(1, _omitFieldNames ? '' : 'purchaseOrderId')
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
  $core.String get purchaseOrderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set purchaseOrderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrderId() => $_clearField(1);

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
    $core.String? purchaseOrderId,
    $core.String? reason,
    $core.String? cancelledByUserId,
  }) {
    final result = create();
    if (purchaseOrderId != null) result.purchaseOrderId = purchaseOrderId;
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
    ..aOS(1, _omitFieldNames ? '' : 'purchaseOrderId')
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
  $core.String get purchaseOrderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set purchaseOrderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasPurchaseOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearPurchaseOrderId() => $_clearField(1);

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
    $core.String? buyerId,
    $core.Iterable<$3.ReceivingNoteLineItem>? items,
    $core.String? receivedByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (purchaseOrderId != null) result.purchaseOrderId = purchaseOrderId;
    if (supplierId != null) result.supplierId = supplierId;
    if (buyerId != null) result.buyerId = buyerId;
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
    ..aOS(3, _omitFieldNames ? '' : 'buyerId')
    ..pc<$3.ReceivingNoteLineItem>(
        4, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $3.ReceivingNoteLineItem.create)
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
  $core.String get buyerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set buyerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasBuyerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearBuyerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$3.ReceivingNoteLineItem> get items => $_getList(3);

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
    $3.ReceivingNote? receivingNote,
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
    ..aOM<$3.ReceivingNote>(2, _omitFieldNames ? '' : 'receivingNote',
        subBuilder: $3.ReceivingNote.create)
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
  $3.ReceivingNote get receivingNote => $_getN(1);
  @$pb.TagNumber(2)
  set receivingNote($3.ReceivingNote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasReceivingNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearReceivingNote() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.ReceivingNote ensureReceivingNote() => $_ensure(1);

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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
