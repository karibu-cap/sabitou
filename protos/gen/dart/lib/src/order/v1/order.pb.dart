// This is a generated file - do not edit.
//
// Generated from order/v1/order.proto.

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
import 'order.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'order.pbenum.dart';

class StatusHistory extends $pb.GeneratedMessage {
  factory StatusHistory({
    OrderStatus? status,
    $core.String? updatedBy,
    $0.Timestamp? updatedAt,
  }) {
    final result = create();
    if (status != null) result.status = status;
    if (updatedBy != null) result.updatedBy = updatedBy;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  StatusHistory._();

  factory StatusHistory.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StatusHistory.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StatusHistory',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..e<OrderStatus>(1, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: OrderStatus.ORDER_STATUS_UNSPECIFIED,
        valueOf: OrderStatus.valueOf,
        enumValues: OrderStatus.values)
    ..aOS(2, _omitFieldNames ? '' : 'updatedBy')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatusHistory clone() => StatusHistory()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StatusHistory copyWith(void Function(StatusHistory) updates) =>
      super.copyWith((message) => updates(message as StatusHistory))
          as StatusHistory;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StatusHistory create() => StatusHistory._();
  @$core.override
  StatusHistory createEmptyInstance() => create();
  static $pb.PbList<StatusHistory> createRepeated() =>
      $pb.PbList<StatusHistory>();
  @$core.pragma('dart2js:noInline')
  static StatusHistory getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StatusHistory>(create);
  static StatusHistory? _defaultInstance;

  @$pb.TagNumber(1)
  OrderStatus get status => $_getN(0);
  @$pb.TagNumber(1)
  set status(OrderStatus value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasStatus() => $_has(0);
  @$pb.TagNumber(1)
  void clearStatus() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get updatedBy => $_getSZ(1);
  @$pb.TagNumber(2)
  set updatedBy($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdatedBy() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdatedBy() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get updatedAt => $_getN(2);
  @$pb.TagNumber(3)
  set updatedAt($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureUpdatedAt() => $_ensure(2);
}

class OrderItem extends $pb.GeneratedMessage {
  factory OrderItem({
    $core.String? storeProductId,
    $core.int? quantity,
    $core.int? unitPrice,
    $core.String? itemName,
  }) {
    final result = create();
    if (storeProductId != null) result.storeProductId = storeProductId;
    if (quantity != null) result.quantity = quantity;
    if (unitPrice != null) result.unitPrice = unitPrice;
    if (itemName != null) result.itemName = itemName;
    return result;
  }

  OrderItem._();

  factory OrderItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrderItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrderItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeProductId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.int>(3, _omitFieldNames ? '' : 'unitPrice', $pb.PbFieldType.O3)
    ..aOS(4, _omitFieldNames ? '' : 'itemName')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderItem clone() => OrderItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderItem copyWith(void Function(OrderItem) updates) =>
      super.copyWith((message) => updates(message as OrderItem)) as OrderItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderItem create() => OrderItem._();
  @$core.override
  OrderItem createEmptyInstance() => create();
  static $pb.PbList<OrderItem> createRepeated() => $pb.PbList<OrderItem>();
  @$core.pragma('dart2js:noInline')
  static OrderItem getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<OrderItem>(create);
  static OrderItem? _defaultInstance;

  /// The unique identifier of the store product.
  @$pb.TagNumber(1)
  $core.String get storeProductId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeProductId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreProductId() => $_clearField(1);

  /// The quantity of the product.
  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  /// The unit price in XAF of the product.
  /// WARN: This value is stored because the unit price can change over time.
  @$pb.TagNumber(3)
  $core.int get unitPrice => $_getIZ(2);
  @$pb.TagNumber(3)
  set unitPrice($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUnitPrice() => $_has(2);
  @$pb.TagNumber(3)
  void clearUnitPrice() => $_clearField(3);

  /// The name of the product.
  @$pb.TagNumber(4)
  $core.String get itemName => $_getSZ(3);
  @$pb.TagNumber(4)
  set itemName($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasItemName() => $_has(3);
  @$pb.TagNumber(4)
  void clearItemName() => $_clearField(4);
}

class PurchaseOrder extends $pb.GeneratedMessage {
  factory PurchaseOrder({
    $0.Timestamp? expectedDeliveryDate,
    $core.String? supplierId,
  }) {
    final result = create();
    if (expectedDeliveryDate != null)
      result.expectedDeliveryDate = expectedDeliveryDate;
    if (supplierId != null) result.supplierId = supplierId;
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
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'expectedDeliveryDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(2, _omitFieldNames ? '' : 'supplierId')
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
  $0.Timestamp get expectedDeliveryDate => $_getN(0);
  @$pb.TagNumber(1)
  set expectedDeliveryDate($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasExpectedDeliveryDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearExpectedDeliveryDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureExpectedDeliveryDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get supplierId => $_getSZ(1);
  @$pb.TagNumber(2)
  set supplierId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSupplierId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSupplierId() => $_clearField(2);
}

class SaleOrder extends $pb.GeneratedMessage {
  factory SaleOrder({
    $0.Timestamp? commitmentDate,
    $core.String? clientId,
  }) {
    final result = create();
    if (commitmentDate != null) result.commitmentDate = commitmentDate;
    if (clientId != null) result.clientId = clientId;
    return result;
  }

  SaleOrder._();

  factory SaleOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SaleOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SaleOrder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<$0.Timestamp>(1, _omitFieldNames ? '' : 'commitmentDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(2, _omitFieldNames ? '' : 'clientId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaleOrder clone() => SaleOrder()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SaleOrder copyWith(void Function(SaleOrder) updates) =>
      super.copyWith((message) => updates(message as SaleOrder)) as SaleOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SaleOrder create() => SaleOrder._();
  @$core.override
  SaleOrder createEmptyInstance() => create();
  static $pb.PbList<SaleOrder> createRepeated() => $pb.PbList<SaleOrder>();
  @$core.pragma('dart2js:noInline')
  static SaleOrder getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<SaleOrder>(create);
  static SaleOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $0.Timestamp get commitmentDate => $_getN(0);
  @$pb.TagNumber(1)
  set commitmentDate($0.Timestamp value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasCommitmentDate() => $_has(0);
  @$pb.TagNumber(1)
  void clearCommitmentDate() => $_clearField(1);
  @$pb.TagNumber(1)
  $0.Timestamp ensureCommitmentDate() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get clientId => $_getSZ(1);
  @$pb.TagNumber(2)
  set clientId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasClientId() => $_has(1);
  @$pb.TagNumber(2)
  void clearClientId() => $_clearField(2);
}

class OrderPrices extends $pb.GeneratedMessage {
  factory OrderPrices({
    $core.int? subtotal,
    $core.int? discounts,
    $core.int? totalVatAmount,
    $core.int? grandTotal,
  }) {
    final result = create();
    if (subtotal != null) result.subtotal = subtotal;
    if (discounts != null) result.discounts = discounts;
    if (totalVatAmount != null) result.totalVatAmount = totalVatAmount;
    if (grandTotal != null) result.grandTotal = grandTotal;
    return result;
  }

  OrderPrices._();

  factory OrderPrices.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrderPrices.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrderPrices',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(1, _omitFieldNames ? '' : 'subtotal', $pb.PbFieldType.O3)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'discounts', $pb.PbFieldType.O3)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'totalVatAmount', $pb.PbFieldType.O3)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'grandTotal', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderPrices clone() => OrderPrices()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderPrices copyWith(void Function(OrderPrices) updates) =>
      super.copyWith((message) => updates(message as OrderPrices))
          as OrderPrices;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderPrices create() => OrderPrices._();
  @$core.override
  OrderPrices createEmptyInstance() => create();
  static $pb.PbList<OrderPrices> createRepeated() => $pb.PbList<OrderPrices>();
  @$core.pragma('dart2js:noInline')
  static OrderPrices getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrderPrices>(create);
  static OrderPrices? _defaultInstance;

  @$pb.TagNumber(1)
  $core.int get subtotal => $_getIZ(0);
  @$pb.TagNumber(1)
  set subtotal($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSubtotal() => $_has(0);
  @$pb.TagNumber(1)
  void clearSubtotal() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get discounts => $_getIZ(1);
  @$pb.TagNumber(2)
  set discounts($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDiscounts() => $_has(1);
  @$pb.TagNumber(2)
  void clearDiscounts() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get totalVatAmount => $_getIZ(2);
  @$pb.TagNumber(3)
  set totalVatAmount($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalVatAmount() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalVatAmount() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get grandTotal => $_getIZ(3);
  @$pb.TagNumber(4)
  set grandTotal($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasGrandTotal() => $_has(3);
  @$pb.TagNumber(4)
  void clearGrandTotal() => $_clearField(4);
}

enum Order_OrderType { purchaseOrder, saleOrder, notSet }

class Order extends $pb.GeneratedMessage {
  factory Order({
    $core.String? refId,
    $core.Iterable<OrderItem>? orderItems,
    OrderPrices? orderPrices,
    OrderStatus? status,
    $core.Iterable<StatusHistory>? statusHistory,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
    $core.String? storeId,
    $core.String? initiatedBy,
    PurchaseOrder? purchaseOrder,
    SaleOrder? saleOrder,
    $core.String? cancellationReason,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (orderItems != null) result.orderItems.addAll(orderItems);
    if (orderPrices != null) result.orderPrices = orderPrices;
    if (status != null) result.status = status;
    if (statusHistory != null) result.statusHistory.addAll(statusHistory);
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (storeId != null) result.storeId = storeId;
    if (initiatedBy != null) result.initiatedBy = initiatedBy;
    if (purchaseOrder != null) result.purchaseOrder = purchaseOrder;
    if (saleOrder != null) result.saleOrder = saleOrder;
    if (cancellationReason != null)
      result.cancellationReason = cancellationReason;
    return result;
  }

  Order._();

  factory Order.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Order.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, Order_OrderType> _Order_OrderTypeByTag = {
    10: Order_OrderType.purchaseOrder,
    11: Order_OrderType.saleOrder,
    0: Order_OrderType.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Order',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..oo(0, [10, 11])
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..pc<OrderItem>(2, _omitFieldNames ? '' : 'orderItems', $pb.PbFieldType.PM,
        subBuilder: OrderItem.create)
    ..aOM<OrderPrices>(3, _omitFieldNames ? '' : 'orderPrices',
        subBuilder: OrderPrices.create)
    ..e<OrderStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: OrderStatus.ORDER_STATUS_UNSPECIFIED,
        valueOf: OrderStatus.valueOf,
        enumValues: OrderStatus.values)
    ..pc<StatusHistory>(
        5, _omitFieldNames ? '' : 'statusHistory', $pb.PbFieldType.PM,
        subBuilder: StatusHistory.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(8, _omitFieldNames ? '' : 'storeId')
    ..aOS(9, _omitFieldNames ? '' : 'initiatedBy')
    ..aOM<PurchaseOrder>(10, _omitFieldNames ? '' : 'purchaseOrder',
        subBuilder: PurchaseOrder.create)
    ..aOM<SaleOrder>(11, _omitFieldNames ? '' : 'saleOrder',
        subBuilder: SaleOrder.create)
    ..aOS(12, _omitFieldNames ? '' : 'cancellationReason')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Order clone() => Order()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Order copyWith(void Function(Order) updates) =>
      super.copyWith((message) => updates(message as Order)) as Order;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Order create() => Order._();
  @$core.override
  Order createEmptyInstance() => create();
  static $pb.PbList<Order> createRepeated() => $pb.PbList<Order>();
  @$core.pragma('dart2js:noInline')
  static Order getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Order>(create);
  static Order? _defaultInstance;

  Order_OrderType whichOrderType() => _Order_OrderTypeByTag[$_whichOneof(0)]!;
  void clearOrderType() => $_clearField($_whichOneof(0));

  /// The unique identifier of the order.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The list of items in the order.
  @$pb.TagNumber(2)
  $pb.PbList<OrderItem> get orderItems => $_getList(1);

  /// The total price of the order in XAF.
  @$pb.TagNumber(3)
  OrderPrices get orderPrices => $_getN(2);
  @$pb.TagNumber(3)
  set orderPrices(OrderPrices value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasOrderPrices() => $_has(2);
  @$pb.TagNumber(3)
  void clearOrderPrices() => $_clearField(3);
  @$pb.TagNumber(3)
  OrderPrices ensureOrderPrices() => $_ensure(2);

  /// The status of the order.
  @$pb.TagNumber(4)
  OrderStatus get status => $_getN(3);
  @$pb.TagNumber(4)
  set status(OrderStatus value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStatus() => $_has(3);
  @$pb.TagNumber(4)
  void clearStatus() => $_clearField(4);

  /// The status history.
  @$pb.TagNumber(5)
  $pb.PbList<StatusHistory> get statusHistory => $_getList(4);

  /// The date and time the order was created.
  @$pb.TagNumber(6)
  $0.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureCreatedAt() => $_ensure(5);

  /// The date and time the order was last updated.
  @$pb.TagNumber(7)
  $0.Timestamp get updatedAt => $_getN(6);
  @$pb.TagNumber(7)
  set updatedAt($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasUpdatedAt() => $_has(6);
  @$pb.TagNumber(7)
  void clearUpdatedAt() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureUpdatedAt() => $_ensure(6);

  /// The unique identifier of the store associated with the order.
  @$pb.TagNumber(8)
  $core.String get storeId => $_getSZ(7);
  @$pb.TagNumber(8)
  set storeId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasStoreId() => $_has(7);
  @$pb.TagNumber(8)
  void clearStoreId() => $_clearField(8);

  /// The unique identifier of the user who initiated the order.
  @$pb.TagNumber(9)
  $core.String get initiatedBy => $_getSZ(8);
  @$pb.TagNumber(9)
  set initiatedBy($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasInitiatedBy() => $_has(8);
  @$pb.TagNumber(9)
  void clearInitiatedBy() => $_clearField(9);

  @$pb.TagNumber(10)
  PurchaseOrder get purchaseOrder => $_getN(9);
  @$pb.TagNumber(10)
  set purchaseOrder(PurchaseOrder value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasPurchaseOrder() => $_has(9);
  @$pb.TagNumber(10)
  void clearPurchaseOrder() => $_clearField(10);
  @$pb.TagNumber(10)
  PurchaseOrder ensurePurchaseOrder() => $_ensure(9);

  @$pb.TagNumber(11)
  SaleOrder get saleOrder => $_getN(10);
  @$pb.TagNumber(11)
  set saleOrder(SaleOrder value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasSaleOrder() => $_has(10);
  @$pb.TagNumber(11)
  void clearSaleOrder() => $_clearField(11);
  @$pb.TagNumber(11)
  SaleOrder ensureSaleOrder() => $_ensure(10);

  /// The reason for the cancellation of the order.
  @$pb.TagNumber(12)
  $core.String get cancellationReason => $_getSZ(11);
  @$pb.TagNumber(12)
  set cancellationReason($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasCancellationReason() => $_has(11);
  @$pb.TagNumber(12)
  void clearCancellationReason() => $_clearField(12);
}

class CreateOrderRequest extends $pb.GeneratedMessage {
  factory CreateOrderRequest({
    Order? order,
  }) {
    final result = create();
    if (order != null) result.order = order;
    return result;
  }

  CreateOrderRequest._();

  factory CreateOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<Order>(1, _omitFieldNames ? '' : 'order', subBuilder: Order.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrderRequest clone() => CreateOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrderRequest copyWith(void Function(CreateOrderRequest) updates) =>
      super.copyWith((message) => updates(message as CreateOrderRequest))
          as CreateOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrderRequest create() => CreateOrderRequest._();
  @$core.override
  CreateOrderRequest createEmptyInstance() => create();
  static $pb.PbList<CreateOrderRequest> createRepeated() =>
      $pb.PbList<CreateOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrderRequest>(create);
  static CreateOrderRequest? _defaultInstance;

  /// The order to create.
  @$pb.TagNumber(1)
  Order get order => $_getN(0);
  @$pb.TagNumber(1)
  set order(Order value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  Order ensureOrder() => $_ensure(0);
}

class CreateOrderResponse extends $pb.GeneratedMessage {
  factory CreateOrderResponse({
    $core.String? orderId,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    return result;
  }

  CreateOrderResponse._();

  factory CreateOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrderResponse clone() => CreateOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateOrderResponse copyWith(void Function(CreateOrderResponse) updates) =>
      super.copyWith((message) => updates(message as CreateOrderResponse))
          as CreateOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateOrderResponse create() => CreateOrderResponse._();
  @$core.override
  CreateOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CreateOrderResponse> createRepeated() =>
      $pb.PbList<CreateOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateOrderResponse>(create);
  static CreateOrderResponse? _defaultInstance;

  /// The unique identifier of the created order.
  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);
}

class GetOrderRequest extends $pb.GeneratedMessage {
  factory GetOrderRequest({
    $core.String? orderId,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    return result;
  }

  GetOrderRequest._();

  factory GetOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrderRequest clone() => GetOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrderRequest copyWith(void Function(GetOrderRequest) updates) =>
      super.copyWith((message) => updates(message as GetOrderRequest))
          as GetOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOrderRequest create() => GetOrderRequest._();
  @$core.override
  GetOrderRequest createEmptyInstance() => create();
  static $pb.PbList<GetOrderRequest> createRepeated() =>
      $pb.PbList<GetOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static GetOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOrderRequest>(create);
  static GetOrderRequest? _defaultInstance;

  /// The unique identifier of the order to retrieve.
  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);
}

class GetOrderResponse extends $pb.GeneratedMessage {
  factory GetOrderResponse({
    Order? order,
    $0.Timestamp? createdAt,
    $0.Timestamp? updatedAt,
  }) {
    final result = create();
    if (order != null) result.order = order;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    return result;
  }

  GetOrderResponse._();

  factory GetOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<Order>(1, _omitFieldNames ? '' : 'order', subBuilder: Order.create)
    ..aOM<$0.Timestamp>(2, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrderResponse clone() => GetOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetOrderResponse copyWith(void Function(GetOrderResponse) updates) =>
      super.copyWith((message) => updates(message as GetOrderResponse))
          as GetOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetOrderResponse create() => GetOrderResponse._();
  @$core.override
  GetOrderResponse createEmptyInstance() => create();
  static $pb.PbList<GetOrderResponse> createRepeated() =>
      $pb.PbList<GetOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static GetOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetOrderResponse>(create);
  static GetOrderResponse? _defaultInstance;

  /// The retrieved order data.
  @$pb.TagNumber(1)
  Order get order => $_getN(0);
  @$pb.TagNumber(1)
  set order(Order value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  Order ensureOrder() => $_ensure(0);

  /// The date and time the order was created.
  @$pb.TagNumber(2)
  $0.Timestamp get createdAt => $_getN(1);
  @$pb.TagNumber(2)
  set createdAt($0.Timestamp value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasCreatedAt() => $_has(1);
  @$pb.TagNumber(2)
  void clearCreatedAt() => $_clearField(2);
  @$pb.TagNumber(2)
  $0.Timestamp ensureCreatedAt() => $_ensure(1);

  /// The date and time the order was last updated.
  @$pb.TagNumber(3)
  $0.Timestamp get updatedAt => $_getN(2);
  @$pb.TagNumber(3)
  set updatedAt($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdatedAt() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdatedAt() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureUpdatedAt() => $_ensure(2);
}

class DeleteOrderRequest extends $pb.GeneratedMessage {
  factory DeleteOrderRequest({
    $core.String? orderId,
  }) {
    final result = create();
    if (orderId != null) result.orderId = orderId;
    return result;
  }

  DeleteOrderRequest._();

  factory DeleteOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'orderId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrderRequest clone() => DeleteOrderRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrderRequest copyWith(void Function(DeleteOrderRequest) updates) =>
      super.copyWith((message) => updates(message as DeleteOrderRequest))
          as DeleteOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteOrderRequest create() => DeleteOrderRequest._();
  @$core.override
  DeleteOrderRequest createEmptyInstance() => create();
  static $pb.PbList<DeleteOrderRequest> createRepeated() =>
      $pb.PbList<DeleteOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static DeleteOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteOrderRequest>(create);
  static DeleteOrderRequest? _defaultInstance;

  /// The unique identifier of the order to delete.
  @$pb.TagNumber(1)
  $core.String get orderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set orderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOrderId() => $_clearField(1);
}

class DeleteOrderResponse extends $pb.GeneratedMessage {
  factory DeleteOrderResponse({
    $core.bool? success,
  }) {
    final result = create();
    if (success != null) result.success = success;
    return result;
  }

  DeleteOrderResponse._();

  factory DeleteOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory DeleteOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'DeleteOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrderResponse clone() => DeleteOrderResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  DeleteOrderResponse copyWith(void Function(DeleteOrderResponse) updates) =>
      super.copyWith((message) => updates(message as DeleteOrderResponse))
          as DeleteOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static DeleteOrderResponse create() => DeleteOrderResponse._();
  @$core.override
  DeleteOrderResponse createEmptyInstance() => create();
  static $pb.PbList<DeleteOrderResponse> createRepeated() =>
      $pb.PbList<DeleteOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static DeleteOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<DeleteOrderResponse>(create);
  static DeleteOrderResponse? _defaultInstance;

  /// Whether the order was successfully deleted.
  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);
}

class FindOrdersRequest extends $pb.GeneratedMessage {
  factory FindOrdersRequest({
    $core.String? refId,
    $core.String? fromId,
    $core.String? isClientOrder,
    $core.Iterable<OrderStatus>? status,
    $core.String? storeId,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (fromId != null) result.fromId = fromId;
    if (isClientOrder != null) result.isClientOrder = isClientOrder;
    if (status != null) result.status.addAll(status);
    if (storeId != null) result.storeId = storeId;
    return result;
  }

  FindOrdersRequest._();

  factory FindOrdersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindOrdersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindOrdersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'fromId')
    ..aOS(3, _omitFieldNames ? '' : 'isClientOrder')
    ..pc<OrderStatus>(4, _omitFieldNames ? '' : 'status', $pb.PbFieldType.KE,
        valueOf: OrderStatus.valueOf,
        enumValues: OrderStatus.values,
        defaultEnumValue: OrderStatus.ORDER_STATUS_UNSPECIFIED)
    ..aOS(5, _omitFieldNames ? '' : 'storeId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindOrdersRequest clone() => FindOrdersRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindOrdersRequest copyWith(void Function(FindOrdersRequest) updates) =>
      super.copyWith((message) => updates(message as FindOrdersRequest))
          as FindOrdersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindOrdersRequest create() => FindOrdersRequest._();
  @$core.override
  FindOrdersRequest createEmptyInstance() => create();
  static $pb.PbList<FindOrdersRequest> createRepeated() =>
      $pb.PbList<FindOrdersRequest>();
  @$core.pragma('dart2js:noInline')
  static FindOrdersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindOrdersRequest>(create);
  static FindOrdersRequest? _defaultInstance;

  /// The unique identifier of the order to retrieve.
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// The id of the client or the supplier if available.
  @$pb.TagNumber(2)
  $core.String get fromId => $_getSZ(1);
  @$pb.TagNumber(2)
  set fromId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasFromId() => $_has(1);
  @$pb.TagNumber(2)
  void clearFromId() => $_clearField(2);

  /// Whether the order is from the client or the supplier.
  @$pb.TagNumber(3)
  $core.String get isClientOrder => $_getSZ(2);
  @$pb.TagNumber(3)
  set isClientOrder($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasIsClientOrder() => $_has(2);
  @$pb.TagNumber(3)
  void clearIsClientOrder() => $_clearField(3);

  /// The status of the order.
  @$pb.TagNumber(4)
  $pb.PbList<OrderStatus> get status => $_getList(3);

  /// The unique identifier of the store associated with the order.
  @$pb.TagNumber(5)
  $core.String get storeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set storeId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStoreId() => $_has(4);
  @$pb.TagNumber(5)
  void clearStoreId() => $_clearField(5);
}

class FindOrdersResponse extends $pb.GeneratedMessage {
  factory FindOrdersResponse({
    $core.Iterable<Order>? orders,
  }) {
    final result = create();
    if (orders != null) result.orders.addAll(orders);
    return result;
  }

  FindOrdersResponse._();

  factory FindOrdersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory FindOrdersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'FindOrdersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..pc<Order>(1, _omitFieldNames ? '' : 'orders', $pb.PbFieldType.PM,
        subBuilder: Order.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindOrdersResponse clone() => FindOrdersResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  FindOrdersResponse copyWith(void Function(FindOrdersResponse) updates) =>
      super.copyWith((message) => updates(message as FindOrdersResponse))
          as FindOrdersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static FindOrdersResponse create() => FindOrdersResponse._();
  @$core.override
  FindOrdersResponse createEmptyInstance() => create();
  static $pb.PbList<FindOrdersResponse> createRepeated() =>
      $pb.PbList<FindOrdersResponse>();
  @$core.pragma('dart2js:noInline')
  static FindOrdersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<FindOrdersResponse>(create);
  static FindOrdersResponse? _defaultInstance;

  /// The unique identifiers of the orders.
  @$pb.TagNumber(1)
  $pb.PbList<Order> get orders => $_getList(0);
}

class OrderServiceApi {
  final $pb.RpcClient _client;

  OrderServiceApi(this._client);

  /// Creates a new order.
  $async.Future<CreateOrderResponse> createOrder(
          $pb.ClientContext? ctx, CreateOrderRequest request) =>
      _client.invoke<CreateOrderResponse>(
          ctx, 'OrderService', 'CreateOrder', request, CreateOrderResponse());

  /// Gets an order by id.
  $async.Future<GetOrderResponse> getOrder(
          $pb.ClientContext? ctx, GetOrderRequest request) =>
      _client.invoke<GetOrderResponse>(
          ctx, 'OrderService', 'GetOrder', request, GetOrderResponse());

  /// Deletes an order.
  $async.Future<DeleteOrderResponse> deleteOrder(
          $pb.ClientContext? ctx, DeleteOrderRequest request) =>
      _client.invoke<DeleteOrderResponse>(
          ctx, 'OrderService', 'DeleteOrder', request, DeleteOrderResponse());

  /// Finds orders by query.
  $async.Future<FindOrdersResponse> findOrders(
          $pb.ClientContext? ctx, FindOrdersRequest request) =>
      _client.invoke<FindOrdersResponse>(
          ctx, 'OrderService', 'FindOrders', request, FindOrdersResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
