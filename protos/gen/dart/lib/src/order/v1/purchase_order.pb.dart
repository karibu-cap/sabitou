// This is a generated file - do not edit.
//
// Generated from order/v1/purchase_order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import '../../inventory/v1/category.pb.dart' as $1;
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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
