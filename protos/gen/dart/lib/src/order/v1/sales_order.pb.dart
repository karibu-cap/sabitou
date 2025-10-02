// This is a generated file - do not edit.
//
// Generated from order/v1/sales_order.proto.

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
import '../../logistic/v1/delivery_notes.pb.dart' as $2;
import '../../payments/v1/payments.pb.dart' as $4;
import 'order_utils.pb.dart' as $0;
import 'sales_order.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'sales_order.pbenum.dart';

/// *
///  SalesOrder (Bon de Commande from customer)
///  Created when a customer wants to buy from you.
///  Does NOT change inventory yet - just reserves it.
///
///  Flow: Receive customer order → Prepare items → Ship
///
///  Example:
///    so_id: "SO-2025-001"
///    customer_id: "CMP-003"
///    seller_id: "CMP-001" (your company)
///    status: SO_STATUS_CONFIRMED
///    items: [10x PRD-001 @ 450000 each]
class SalesOrder extends $pb.GeneratedMessage {
  factory SalesOrder({
    $core.String? documentId,
    $core.String? customerId,
    $core.String? sellerId,
    $core.String? sourceWarehouseId,
    SalesOrderStatus? status,
    $core.Iterable<$0.OrderLineItem>? items,
    $0.OrderPrices? orderPrices,
    $core.String? currency,
    $core.String? createdByUserId,
    $1.Timestamp? createdAt,
    $1.Timestamp? deliveryDate,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (customerId != null) result.customerId = customerId;
    if (sellerId != null) result.sellerId = sellerId;
    if (sourceWarehouseId != null) result.sourceWarehouseId = sourceWarehouseId;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (orderPrices != null) result.orderPrices = orderPrices;
    if (currency != null) result.currency = currency;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (createdAt != null) result.createdAt = createdAt;
    if (deliveryDate != null) result.deliveryDate = deliveryDate;
    if (notes != null) result.notes = notes;
    return result;
  }

  SalesOrder._();

  factory SalesOrder.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SalesOrder.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SalesOrder',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'customerId')
    ..aOS(3, _omitFieldNames ? '' : 'sellerId')
    ..aOS(4, _omitFieldNames ? '' : 'sourceWarehouseId')
    ..aE<SalesOrderStatus>(5, _omitFieldNames ? '' : 'status',
        enumValues: SalesOrderStatus.values)
    ..pPM<$0.OrderLineItem>(6, _omitFieldNames ? '' : 'items',
        subBuilder: $0.OrderLineItem.create)
    ..aOM<$0.OrderPrices>(7, _omitFieldNames ? '' : 'orderPrices',
        subBuilder: $0.OrderPrices.create)
    ..aOS(8, _omitFieldNames ? '' : 'currency')
    ..aOS(9, _omitFieldNames ? '' : 'createdByUserId')
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'deliveryDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalesOrder clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalesOrder copyWith(void Function(SalesOrder) updates) =>
      super.copyWith((message) => updates(message as SalesOrder)) as SalesOrder;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SalesOrder create() => SalesOrder._();
  @$core.override
  SalesOrder createEmptyInstance() => create();
  static $pb.PbList<SalesOrder> createRepeated() => $pb.PbList<SalesOrder>();
  @$core.pragma('dart2js:noInline')
  static SalesOrder getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SalesOrder>(create);
  static SalesOrder? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get customerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set customerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCustomerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearCustomerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get sellerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sellerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSellerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSellerId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get sourceWarehouseId => $_getSZ(3);
  @$pb.TagNumber(4)
  set sourceWarehouseId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSourceWarehouseId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceWarehouseId() => $_clearField(4);

  @$pb.TagNumber(5)
  SalesOrderStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(SalesOrderStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$0.OrderLineItem> get items => $_getList(5);

  @$pb.TagNumber(7)
  $0.OrderPrices get orderPrices => $_getN(6);
  @$pb.TagNumber(7)
  set orderPrices($0.OrderPrices value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasOrderPrices() => $_has(6);
  @$pb.TagNumber(7)
  void clearOrderPrices() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.OrderPrices ensureOrderPrices() => $_ensure(6);

  @$pb.TagNumber(8)
  $core.String get currency => $_getSZ(7);
  @$pb.TagNumber(8)
  set currency($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasCurrency() => $_has(7);
  @$pb.TagNumber(8)
  void clearCurrency() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get createdByUserId => $_getSZ(8);
  @$pb.TagNumber(9)
  set createdByUserId($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasCreatedByUserId() => $_has(8);
  @$pb.TagNumber(9)
  void clearCreatedByUserId() => $_clearField(9);

  @$pb.TagNumber(10)
  $1.Timestamp get createdAt => $_getN(9);
  @$pb.TagNumber(10)
  set createdAt($1.Timestamp value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasCreatedAt() => $_has(9);
  @$pb.TagNumber(10)
  void clearCreatedAt() => $_clearField(10);
  @$pb.TagNumber(10)
  $1.Timestamp ensureCreatedAt() => $_ensure(9);

  @$pb.TagNumber(11)
  $1.Timestamp get deliveryDate => $_getN(10);
  @$pb.TagNumber(11)
  set deliveryDate($1.Timestamp value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasDeliveryDate() => $_has(10);
  @$pb.TagNumber(11)
  void clearDeliveryDate() => $_clearField(11);
  @$pb.TagNumber(11)
  $1.Timestamp ensureDeliveryDate() => $_ensure(10);

  @$pb.TagNumber(12)
  $core.String get notes => $_getSZ(11);
  @$pb.TagNumber(12)
  set notes($core.String value) => $_setString(11, value);
  @$pb.TagNumber(12)
  $core.bool hasNotes() => $_has(11);
  @$pb.TagNumber(12)
  void clearNotes() => $_clearField(12);
}

class CreateSalesOrderRequest extends $pb.GeneratedMessage {
  factory CreateSalesOrderRequest({
    $core.String? customerId,
    $core.String? sellerId,
    $core.String? sourceWarehouseId,
    $core.Iterable<$0.OrderLineItem>? items,
    $1.Timestamp? deliveryDate,
    $core.String? createdByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (customerId != null) result.customerId = customerId;
    if (sellerId != null) result.sellerId = sellerId;
    if (sourceWarehouseId != null) result.sourceWarehouseId = sourceWarehouseId;
    if (items != null) result.items.addAll(items);
    if (deliveryDate != null) result.deliveryDate = deliveryDate;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (notes != null) result.notes = notes;
    return result;
  }

  CreateSalesOrderRequest._();

  factory CreateSalesOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSalesOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSalesOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'customerId')
    ..aOS(2, _omitFieldNames ? '' : 'sellerId')
    ..aOS(3, _omitFieldNames ? '' : 'sourceWarehouseId')
    ..pPM<$0.OrderLineItem>(4, _omitFieldNames ? '' : 'items',
        subBuilder: $0.OrderLineItem.create)
    ..aOM<$1.Timestamp>(5, _omitFieldNames ? '' : 'deliveryDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(6, _omitFieldNames ? '' : 'createdByUserId')
    ..aOS(7, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSalesOrderRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSalesOrderRequest copyWith(
          void Function(CreateSalesOrderRequest) updates) =>
      super.copyWith((message) => updates(message as CreateSalesOrderRequest))
          as CreateSalesOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSalesOrderRequest create() => CreateSalesOrderRequest._();
  @$core.override
  CreateSalesOrderRequest createEmptyInstance() => create();
  static $pb.PbList<CreateSalesOrderRequest> createRepeated() =>
      $pb.PbList<CreateSalesOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateSalesOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSalesOrderRequest>(create);
  static CreateSalesOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get customerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set customerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCustomerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomerId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get sellerId => $_getSZ(1);
  @$pb.TagNumber(2)
  set sellerId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasSellerId() => $_has(1);
  @$pb.TagNumber(2)
  void clearSellerId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get sourceWarehouseId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sourceWarehouseId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSourceWarehouseId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSourceWarehouseId() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$0.OrderLineItem> get items => $_getList(3);

  @$pb.TagNumber(5)
  $1.Timestamp get deliveryDate => $_getN(4);
  @$pb.TagNumber(5)
  set deliveryDate($1.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasDeliveryDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeliveryDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $1.Timestamp ensureDeliveryDate() => $_ensure(4);

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

class CreateSalesOrderResponse extends $pb.GeneratedMessage {
  factory CreateSalesOrderResponse({
    $core.String? soId,
    SalesOrder? salesOrder,
    $core.bool? allItemsAvailable,
    $core.Iterable<$core.String>? unavailableProductIds,
    $core.String? message,
  }) {
    final result = create();
    if (soId != null) result.soId = soId;
    if (salesOrder != null) result.salesOrder = salesOrder;
    if (allItemsAvailable != null) result.allItemsAvailable = allItemsAvailable;
    if (unavailableProductIds != null)
      result.unavailableProductIds.addAll(unavailableProductIds);
    if (message != null) result.message = message;
    return result;
  }

  CreateSalesOrderResponse._();

  factory CreateSalesOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateSalesOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateSalesOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'soId')
    ..aOM<SalesOrder>(2, _omitFieldNames ? '' : 'salesOrder',
        subBuilder: SalesOrder.create)
    ..aOB(3, _omitFieldNames ? '' : 'allItemsAvailable')
    ..pPS(4, _omitFieldNames ? '' : 'unavailableProductIds')
    ..aOS(5, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSalesOrderResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateSalesOrderResponse copyWith(
          void Function(CreateSalesOrderResponse) updates) =>
      super.copyWith((message) => updates(message as CreateSalesOrderResponse))
          as CreateSalesOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateSalesOrderResponse create() => CreateSalesOrderResponse._();
  @$core.override
  CreateSalesOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CreateSalesOrderResponse> createRepeated() =>
      $pb.PbList<CreateSalesOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateSalesOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateSalesOrderResponse>(create);
  static CreateSalesOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get soId => $_getSZ(0);
  @$pb.TagNumber(1)
  set soId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSoId() => $_clearField(1);

  @$pb.TagNumber(2)
  SalesOrder get salesOrder => $_getN(1);
  @$pb.TagNumber(2)
  set salesOrder(SalesOrder value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasSalesOrder() => $_has(1);
  @$pb.TagNumber(2)
  void clearSalesOrder() => $_clearField(2);
  @$pb.TagNumber(2)
  SalesOrder ensureSalesOrder() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.bool get allItemsAvailable => $_getBF(2);
  @$pb.TagNumber(3)
  set allItemsAvailable($core.bool value) => $_setBool(2, value);
  @$pb.TagNumber(3)
  $core.bool hasAllItemsAvailable() => $_has(2);
  @$pb.TagNumber(3)
  void clearAllItemsAvailable() => $_clearField(3);

  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get unavailableProductIds => $_getList(3);

  @$pb.TagNumber(5)
  $core.String get message => $_getSZ(4);
  @$pb.TagNumber(5)
  set message($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasMessage() => $_has(4);
  @$pb.TagNumber(5)
  void clearMessage() => $_clearField(5);
}

class GetSalesOrderRequest extends $pb.GeneratedMessage {
  factory GetSalesOrderRequest({
    $core.String? soId,
  }) {
    final result = create();
    if (soId != null) result.soId = soId;
    return result;
  }

  GetSalesOrderRequest._();

  factory GetSalesOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSalesOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSalesOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'soId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesOrderRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesOrderRequest copyWith(void Function(GetSalesOrderRequest) updates) =>
      super.copyWith((message) => updates(message as GetSalesOrderRequest))
          as GetSalesOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSalesOrderRequest create() => GetSalesOrderRequest._();
  @$core.override
  GetSalesOrderRequest createEmptyInstance() => create();
  static $pb.PbList<GetSalesOrderRequest> createRepeated() =>
      $pb.PbList<GetSalesOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSalesOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSalesOrderRequest>(create);
  static GetSalesOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get soId => $_getSZ(0);
  @$pb.TagNumber(1)
  set soId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSoId() => $_clearField(1);
}

class GetSalesOrderResponse extends $pb.GeneratedMessage {
  factory GetSalesOrderResponse({
    SalesOrder? salesOrder,
    $core.Iterable<$2.DeliveryNote>? deliveryNotes,
    $core.Iterable<$3.Invoice>? invoices,
    $core.Iterable<$4.Payment>? payments,
  }) {
    final result = create();
    if (salesOrder != null) result.salesOrder = salesOrder;
    if (deliveryNotes != null) result.deliveryNotes.addAll(deliveryNotes);
    if (invoices != null) result.invoices.addAll(invoices);
    if (payments != null) result.payments.addAll(payments);
    return result;
  }

  GetSalesOrderResponse._();

  factory GetSalesOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSalesOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSalesOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<SalesOrder>(1, _omitFieldNames ? '' : 'salesOrder',
        subBuilder: SalesOrder.create)
    ..pPM<$2.DeliveryNote>(2, _omitFieldNames ? '' : 'deliveryNotes',
        subBuilder: $2.DeliveryNote.create)
    ..pPM<$3.Invoice>(3, _omitFieldNames ? '' : 'invoices',
        subBuilder: $3.Invoice.create)
    ..pPM<$4.Payment>(4, _omitFieldNames ? '' : 'payments',
        subBuilder: $4.Payment.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesOrderResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSalesOrderResponse copyWith(
          void Function(GetSalesOrderResponse) updates) =>
      super.copyWith((message) => updates(message as GetSalesOrderResponse))
          as GetSalesOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSalesOrderResponse create() => GetSalesOrderResponse._();
  @$core.override
  GetSalesOrderResponse createEmptyInstance() => create();
  static $pb.PbList<GetSalesOrderResponse> createRepeated() =>
      $pb.PbList<GetSalesOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSalesOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSalesOrderResponse>(create);
  static GetSalesOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SalesOrder get salesOrder => $_getN(0);
  @$pb.TagNumber(1)
  set salesOrder(SalesOrder value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSalesOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearSalesOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  SalesOrder ensureSalesOrder() => $_ensure(0);

  @$pb.TagNumber(2)
  $pb.PbList<$2.DeliveryNote> get deliveryNotes => $_getList(1);

  @$pb.TagNumber(3)
  $pb.PbList<$3.Invoice> get invoices => $_getList(2);

  @$pb.TagNumber(4)
  $pb.PbList<$4.Payment> get payments => $_getList(3);
}

class ListSalesOrdersRequest extends $pb.GeneratedMessage {
  factory ListSalesOrdersRequest({
    $core.String? customerId,
    SalesOrderStatus? status,
    $1.Timestamp? startDate,
    $1.Timestamp? endDate,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (customerId != null) result.customerId = customerId;
    if (status != null) result.status = status;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNumber != null) result.pageNumber = pageNumber;
    return result;
  }

  ListSalesOrdersRequest._();

  factory ListSalesOrdersRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSalesOrdersRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSalesOrdersRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'customerId')
    ..aE<SalesOrderStatus>(2, _omitFieldNames ? '' : 'status',
        enumValues: SalesOrderStatus.values)
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'startDate',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(4, _omitFieldNames ? '' : 'endDate',
        subBuilder: $1.Timestamp.create)
    ..aI(5, _omitFieldNames ? '' : 'pageSize')
    ..aI(6, _omitFieldNames ? '' : 'pageNumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSalesOrdersRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSalesOrdersRequest copyWith(
          void Function(ListSalesOrdersRequest) updates) =>
      super.copyWith((message) => updates(message as ListSalesOrdersRequest))
          as ListSalesOrdersRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSalesOrdersRequest create() => ListSalesOrdersRequest._();
  @$core.override
  ListSalesOrdersRequest createEmptyInstance() => create();
  static $pb.PbList<ListSalesOrdersRequest> createRepeated() =>
      $pb.PbList<ListSalesOrdersRequest>();
  @$core.pragma('dart2js:noInline')
  static ListSalesOrdersRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSalesOrdersRequest>(create);
  static ListSalesOrdersRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get customerId => $_getSZ(0);
  @$pb.TagNumber(1)
  set customerId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasCustomerId() => $_has(0);
  @$pb.TagNumber(1)
  void clearCustomerId() => $_clearField(1);

  @$pb.TagNumber(2)
  SalesOrderStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(SalesOrderStatus value) => $_setField(2, value);
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

class ListSalesOrdersResponse extends $pb.GeneratedMessage {
  factory ListSalesOrdersResponse({
    $core.Iterable<SalesOrder>? salesOrders,
    $core.int? totalCount,
    $fixnum.Int64? totalValue,
  }) {
    final result = create();
    if (salesOrders != null) result.salesOrders.addAll(salesOrders);
    if (totalCount != null) result.totalCount = totalCount;
    if (totalValue != null) result.totalValue = totalValue;
    return result;
  }

  ListSalesOrdersResponse._();

  factory ListSalesOrdersResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory ListSalesOrdersResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'ListSalesOrdersResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..pPM<SalesOrder>(1, _omitFieldNames ? '' : 'salesOrders',
        subBuilder: SalesOrder.create)
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..aInt64(3, _omitFieldNames ? '' : 'totalValue')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSalesOrdersResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  ListSalesOrdersResponse copyWith(
          void Function(ListSalesOrdersResponse) updates) =>
      super.copyWith((message) => updates(message as ListSalesOrdersResponse))
          as ListSalesOrdersResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static ListSalesOrdersResponse create() => ListSalesOrdersResponse._();
  @$core.override
  ListSalesOrdersResponse createEmptyInstance() => create();
  static $pb.PbList<ListSalesOrdersResponse> createRepeated() =>
      $pb.PbList<ListSalesOrdersResponse>();
  @$core.pragma('dart2js:noInline')
  static ListSalesOrdersResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<ListSalesOrdersResponse>(create);
  static ListSalesOrdersResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<SalesOrder> get salesOrders => $_getList(0);

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

class UpdateSalesOrderStatusRequest extends $pb.GeneratedMessage {
  factory UpdateSalesOrderStatusRequest({
    $core.String? soId,
    SalesOrderStatus? newStatus,
    $core.String? updatedByUserId,
    $core.String? notes,
  }) {
    final result = create();
    if (soId != null) result.soId = soId;
    if (newStatus != null) result.newStatus = newStatus;
    if (updatedByUserId != null) result.updatedByUserId = updatedByUserId;
    if (notes != null) result.notes = notes;
    return result;
  }

  UpdateSalesOrderStatusRequest._();

  factory UpdateSalesOrderStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSalesOrderStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSalesOrderStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'soId')
    ..aE<SalesOrderStatus>(2, _omitFieldNames ? '' : 'newStatus',
        enumValues: SalesOrderStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'updatedByUserId')
    ..aOS(4, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSalesOrderStatusRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSalesOrderStatusRequest copyWith(
          void Function(UpdateSalesOrderStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateSalesOrderStatusRequest))
          as UpdateSalesOrderStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSalesOrderStatusRequest create() =>
      UpdateSalesOrderStatusRequest._();
  @$core.override
  UpdateSalesOrderStatusRequest createEmptyInstance() => create();
  static $pb.PbList<UpdateSalesOrderStatusRequest> createRepeated() =>
      $pb.PbList<UpdateSalesOrderStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static UpdateSalesOrderStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSalesOrderStatusRequest>(create);
  static UpdateSalesOrderStatusRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get soId => $_getSZ(0);
  @$pb.TagNumber(1)
  set soId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSoId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSoId() => $_clearField(1);

  @$pb.TagNumber(2)
  SalesOrderStatus get newStatus => $_getN(1);
  @$pb.TagNumber(2)
  set newStatus(SalesOrderStatus value) => $_setField(2, value);
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

class UpdateSalesOrderStatusResponse extends $pb.GeneratedMessage {
  factory UpdateSalesOrderStatusResponse({
    SalesOrder? salesOrder,
    $core.String? message,
  }) {
    final result = create();
    if (salesOrder != null) result.salesOrder = salesOrder;
    if (message != null) result.message = message;
    return result;
  }

  UpdateSalesOrderStatusResponse._();

  factory UpdateSalesOrderStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory UpdateSalesOrderStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'UpdateSalesOrderStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOM<SalesOrder>(1, _omitFieldNames ? '' : 'salesOrder',
        subBuilder: SalesOrder.create)
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSalesOrderStatusResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  UpdateSalesOrderStatusResponse copyWith(
          void Function(UpdateSalesOrderStatusResponse) updates) =>
      super.copyWith(
              (message) => updates(message as UpdateSalesOrderStatusResponse))
          as UpdateSalesOrderStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static UpdateSalesOrderStatusResponse create() =>
      UpdateSalesOrderStatusResponse._();
  @$core.override
  UpdateSalesOrderStatusResponse createEmptyInstance() => create();
  static $pb.PbList<UpdateSalesOrderStatusResponse> createRepeated() =>
      $pb.PbList<UpdateSalesOrderStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static UpdateSalesOrderStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<UpdateSalesOrderStatusResponse>(create);
  static UpdateSalesOrderStatusResponse? _defaultInstance;

  @$pb.TagNumber(1)
  SalesOrder get salesOrder => $_getN(0);
  @$pb.TagNumber(1)
  set salesOrder(SalesOrder value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasSalesOrder() => $_has(0);
  @$pb.TagNumber(1)
  void clearSalesOrder() => $_clearField(1);
  @$pb.TagNumber(1)
  SalesOrder ensureSalesOrder() => $_ensure(0);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class CancelSalesOrderRequest extends $pb.GeneratedMessage {
  factory CancelSalesOrderRequest({
    $core.String? documentId,
    $core.String? reason,
    $core.String? cancelledByUserId,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (reason != null) result.reason = reason;
    if (cancelledByUserId != null) result.cancelledByUserId = cancelledByUserId;
    return result;
  }

  CancelSalesOrderRequest._();

  factory CancelSalesOrderRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelSalesOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelSalesOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'reason')
    ..aOS(3, _omitFieldNames ? '' : 'cancelledByUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelSalesOrderRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelSalesOrderRequest copyWith(
          void Function(CancelSalesOrderRequest) updates) =>
      super.copyWith((message) => updates(message as CancelSalesOrderRequest))
          as CancelSalesOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelSalesOrderRequest create() => CancelSalesOrderRequest._();
  @$core.override
  CancelSalesOrderRequest createEmptyInstance() => create();
  static $pb.PbList<CancelSalesOrderRequest> createRepeated() =>
      $pb.PbList<CancelSalesOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static CancelSalesOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelSalesOrderRequest>(create);
  static CancelSalesOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

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

class CancelSalesOrderResponse extends $pb.GeneratedMessage {
  factory CancelSalesOrderResponse({
    $core.bool? success,
    $core.String? message,
  }) {
    final result = create();
    if (success != null) result.success = success;
    if (message != null) result.message = message;
    return result;
  }

  CancelSalesOrderResponse._();

  factory CancelSalesOrderResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CancelSalesOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CancelSalesOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'success')
    ..aOS(2, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelSalesOrderResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CancelSalesOrderResponse copyWith(
          void Function(CancelSalesOrderResponse) updates) =>
      super.copyWith((message) => updates(message as CancelSalesOrderResponse))
          as CancelSalesOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CancelSalesOrderResponse create() => CancelSalesOrderResponse._();
  @$core.override
  CancelSalesOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CancelSalesOrderResponse> createRepeated() =>
      $pb.PbList<CancelSalesOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CancelSalesOrderResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CancelSalesOrderResponse>(create);
  static CancelSalesOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get message => $_getSZ(1);
  @$pb.TagNumber(2)
  set message($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasMessage() => $_has(1);
  @$pb.TagNumber(2)
  void clearMessage() => $_clearField(2);
}

class CreateDeliveryNoteRequest extends $pb.GeneratedMessage {
  factory CreateDeliveryNoteRequest({
    $core.String? salesOrderId,
    $core.String? carrier,
    $core.String? trackingNumber,
    $core.String? createdByUserId,
    $core.Iterable<$2.DeliveryLineItem>? items,
    $core.String? notes,
  }) {
    final result = create();
    if (salesOrderId != null) result.salesOrderId = salesOrderId;
    if (carrier != null) result.carrier = carrier;
    if (trackingNumber != null) result.trackingNumber = trackingNumber;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    if (items != null) result.items.addAll(items);
    if (notes != null) result.notes = notes;
    return result;
  }

  CreateDeliveryNoteRequest._();

  factory CreateDeliveryNoteRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDeliveryNoteRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeliveryNoteRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'salesOrderId')
    ..aOS(2, _omitFieldNames ? '' : 'carrier')
    ..aOS(3, _omitFieldNames ? '' : 'trackingNumber')
    ..aOS(4, _omitFieldNames ? '' : 'createdByUserId')
    ..pPM<$2.DeliveryLineItem>(5, _omitFieldNames ? '' : 'items',
        subBuilder: $2.DeliveryLineItem.create)
    ..aOS(6, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeliveryNoteRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeliveryNoteRequest copyWith(
          void Function(CreateDeliveryNoteRequest) updates) =>
      super.copyWith((message) => updates(message as CreateDeliveryNoteRequest))
          as CreateDeliveryNoteRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDeliveryNoteRequest create() => CreateDeliveryNoteRequest._();
  @$core.override
  CreateDeliveryNoteRequest createEmptyInstance() => create();
  static $pb.PbList<CreateDeliveryNoteRequest> createRepeated() =>
      $pb.PbList<CreateDeliveryNoteRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateDeliveryNoteRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDeliveryNoteRequest>(create);
  static CreateDeliveryNoteRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get salesOrderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set salesOrderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSalesOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSalesOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get carrier => $_getSZ(1);
  @$pb.TagNumber(2)
  set carrier($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCarrier() => $_has(1);
  @$pb.TagNumber(2)
  void clearCarrier() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get trackingNumber => $_getSZ(2);
  @$pb.TagNumber(3)
  set trackingNumber($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTrackingNumber() => $_has(2);
  @$pb.TagNumber(3)
  void clearTrackingNumber() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get createdByUserId => $_getSZ(3);
  @$pb.TagNumber(4)
  set createdByUserId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasCreatedByUserId() => $_has(3);
  @$pb.TagNumber(4)
  void clearCreatedByUserId() => $_clearField(4);

  @$pb.TagNumber(5)
  $pb.PbList<$2.DeliveryLineItem> get items => $_getList(4);

  @$pb.TagNumber(6)
  $core.String get notes => $_getSZ(5);
  @$pb.TagNumber(6)
  set notes($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasNotes() => $_has(5);
  @$pb.TagNumber(6)
  void clearNotes() => $_clearField(6);
}

class CreateDeliveryNoteResponse extends $pb.GeneratedMessage {
  factory CreateDeliveryNoteResponse({
    $core.String? documentId,
    $2.DeliveryNote? deliveryNote,
    $core.Iterable<$core.String>? inventoryTransactionIds,
    $core.String? message,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (deliveryNote != null) result.deliveryNote = deliveryNote;
    if (inventoryTransactionIds != null)
      result.inventoryTransactionIds.addAll(inventoryTransactionIds);
    if (message != null) result.message = message;
    return result;
  }

  CreateDeliveryNoteResponse._();

  factory CreateDeliveryNoteResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateDeliveryNoteResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateDeliveryNoteResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOM<$2.DeliveryNote>(2, _omitFieldNames ? '' : 'deliveryNote',
        subBuilder: $2.DeliveryNote.create)
    ..pPS(3, _omitFieldNames ? '' : 'inventoryTransactionIds')
    ..aOS(4, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeliveryNoteResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateDeliveryNoteResponse copyWith(
          void Function(CreateDeliveryNoteResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CreateDeliveryNoteResponse))
          as CreateDeliveryNoteResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateDeliveryNoteResponse create() => CreateDeliveryNoteResponse._();
  @$core.override
  CreateDeliveryNoteResponse createEmptyInstance() => create();
  static $pb.PbList<CreateDeliveryNoteResponse> createRepeated() =>
      $pb.PbList<CreateDeliveryNoteResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateDeliveryNoteResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateDeliveryNoteResponse>(create);
  static CreateDeliveryNoteResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $2.DeliveryNote get deliveryNote => $_getN(1);
  @$pb.TagNumber(2)
  set deliveryNote($2.DeliveryNote value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasDeliveryNote() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeliveryNote() => $_clearField(2);
  @$pb.TagNumber(2)
  $2.DeliveryNote ensureDeliveryNote() => $_ensure(1);

  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get inventoryTransactionIds => $_getList(2);

  @$pb.TagNumber(4)
  $core.String get message => $_getSZ(3);
  @$pb.TagNumber(4)
  set message($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasMessage() => $_has(3);
  @$pb.TagNumber(4)
  void clearMessage() => $_clearField(4);
}

class CreateInvoiceFromSalesOrderRequest extends $pb.GeneratedMessage {
  factory CreateInvoiceFromSalesOrderRequest({
    $core.String? salesOrderId,
    $core.String? deliveryNoteId,
    $1.Timestamp? dueDate,
    $core.String? paymentTerms,
    $core.String? createdByUserId,
  }) {
    final result = create();
    if (salesOrderId != null) result.salesOrderId = salesOrderId;
    if (deliveryNoteId != null) result.deliveryNoteId = deliveryNoteId;
    if (dueDate != null) result.dueDate = dueDate;
    if (paymentTerms != null) result.paymentTerms = paymentTerms;
    if (createdByUserId != null) result.createdByUserId = createdByUserId;
    return result;
  }

  CreateInvoiceFromSalesOrderRequest._();

  factory CreateInvoiceFromSalesOrderRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInvoiceFromSalesOrderRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInvoiceFromSalesOrderRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'salesOrderId')
    ..aOS(2, _omitFieldNames ? '' : 'deliveryNoteId')
    ..aOM<$1.Timestamp>(3, _omitFieldNames ? '' : 'dueDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'paymentTerms')
    ..aOS(5, _omitFieldNames ? '' : 'createdByUserId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceFromSalesOrderRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceFromSalesOrderRequest copyWith(
          void Function(CreateInvoiceFromSalesOrderRequest) updates) =>
      super.copyWith((message) =>
              updates(message as CreateInvoiceFromSalesOrderRequest))
          as CreateInvoiceFromSalesOrderRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInvoiceFromSalesOrderRequest create() =>
      CreateInvoiceFromSalesOrderRequest._();
  @$core.override
  CreateInvoiceFromSalesOrderRequest createEmptyInstance() => create();
  static $pb.PbList<CreateInvoiceFromSalesOrderRequest> createRepeated() =>
      $pb.PbList<CreateInvoiceFromSalesOrderRequest>();
  @$core.pragma('dart2js:noInline')
  static CreateInvoiceFromSalesOrderRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CreateInvoiceFromSalesOrderRequest>(
          create);
  static CreateInvoiceFromSalesOrderRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get salesOrderId => $_getSZ(0);
  @$pb.TagNumber(1)
  set salesOrderId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasSalesOrderId() => $_has(0);
  @$pb.TagNumber(1)
  void clearSalesOrderId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get deliveryNoteId => $_getSZ(1);
  @$pb.TagNumber(2)
  set deliveryNoteId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDeliveryNoteId() => $_has(1);
  @$pb.TagNumber(2)
  void clearDeliveryNoteId() => $_clearField(2);

  @$pb.TagNumber(3)
  $1.Timestamp get dueDate => $_getN(2);
  @$pb.TagNumber(3)
  set dueDate($1.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasDueDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearDueDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.Timestamp ensureDueDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get paymentTerms => $_getSZ(3);
  @$pb.TagNumber(4)
  set paymentTerms($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasPaymentTerms() => $_has(3);
  @$pb.TagNumber(4)
  void clearPaymentTerms() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.String get createdByUserId => $_getSZ(4);
  @$pb.TagNumber(5)
  set createdByUserId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasCreatedByUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearCreatedByUserId() => $_clearField(5);
}

class CreateInvoiceFromSalesOrderResponse extends $pb.GeneratedMessage {
  factory CreateInvoiceFromSalesOrderResponse({
    $core.String? documentId,
    $3.Invoice? invoice,
    $core.String? message,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (invoice != null) result.invoice = invoice;
    if (message != null) result.message = message;
    return result;
  }

  CreateInvoiceFromSalesOrderResponse._();

  factory CreateInvoiceFromSalesOrderResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CreateInvoiceFromSalesOrderResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CreateInvoiceFromSalesOrderResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOM<$3.Invoice>(2, _omitFieldNames ? '' : 'invoice',
        subBuilder: $3.Invoice.create)
    ..aOS(3, _omitFieldNames ? '' : 'message')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceFromSalesOrderResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CreateInvoiceFromSalesOrderResponse copyWith(
          void Function(CreateInvoiceFromSalesOrderResponse) updates) =>
      super.copyWith((message) =>
              updates(message as CreateInvoiceFromSalesOrderResponse))
          as CreateInvoiceFromSalesOrderResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CreateInvoiceFromSalesOrderResponse create() =>
      CreateInvoiceFromSalesOrderResponse._();
  @$core.override
  CreateInvoiceFromSalesOrderResponse createEmptyInstance() => create();
  static $pb.PbList<CreateInvoiceFromSalesOrderResponse> createRepeated() =>
      $pb.PbList<CreateInvoiceFromSalesOrderResponse>();
  @$core.pragma('dart2js:noInline')
  static CreateInvoiceFromSalesOrderResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          CreateInvoiceFromSalesOrderResponse>(create);
  static CreateInvoiceFromSalesOrderResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

  @$pb.TagNumber(2)
  $3.Invoice get invoice => $_getN(1);
  @$pb.TagNumber(2)
  set invoice($3.Invoice value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasInvoice() => $_has(1);
  @$pb.TagNumber(2)
  void clearInvoice() => $_clearField(2);
  @$pb.TagNumber(2)
  $3.Invoice ensureInvoice() => $_ensure(1);

  @$pb.TagNumber(3)
  $core.String get message => $_getSZ(2);
  @$pb.TagNumber(3)
  set message($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearMessage() => $_clearField(3);
}

class SalesOrderServiceApi {
  final $pb.RpcClient _client;

  SalesOrderServiceApi(this._client);

  /// Create a sales order (customer order)
  $async.Future<CreateSalesOrderResponse> createSalesOrder(
          $pb.ClientContext? ctx, CreateSalesOrderRequest request) =>
      _client.invoke<CreateSalesOrderResponse>(ctx, 'SalesOrderService',
          'CreateSalesOrder', request, CreateSalesOrderResponse());

  /// Get sales order details
  $async.Future<GetSalesOrderResponse> getSalesOrder(
          $pb.ClientContext? ctx, GetSalesOrderRequest request) =>
      _client.invoke<GetSalesOrderResponse>(ctx, 'SalesOrderService',
          'GetSalesOrder', request, GetSalesOrderResponse());

  /// List sales orders with filtering
  $async.Future<ListSalesOrdersResponse> listSalesOrders(
          $pb.ClientContext? ctx, ListSalesOrdersRequest request) =>
      _client.invoke<ListSalesOrdersResponse>(ctx, 'SalesOrderService',
          'ListSalesOrders', request, ListSalesOrdersResponse());

  /// Update sales order status
  $async.Future<UpdateSalesOrderStatusResponse> updateSalesOrderStatus(
          $pb.ClientContext? ctx, UpdateSalesOrderStatusRequest request) =>
      _client.invoke<UpdateSalesOrderStatusResponse>(ctx, 'SalesOrderService',
          'UpdateSalesOrderStatus', request, UpdateSalesOrderStatusResponse());

  /// Cancel a sales order
  $async.Future<CancelSalesOrderResponse> cancelSalesOrder(
          $pb.ClientContext? ctx, CancelSalesOrderRequest request) =>
      _client.invoke<CancelSalesOrderResponse>(ctx, 'SalesOrderService',
          'CancelSalesOrder', request, CancelSalesOrderResponse());

  /// Create delivery note from sales order
  $async.Future<CreateDeliveryNoteResponse> createDeliveryNote(
          $pb.ClientContext? ctx, CreateDeliveryNoteRequest request) =>
      _client.invoke<CreateDeliveryNoteResponse>(ctx, 'SalesOrderService',
          'CreateDeliveryNote', request, CreateDeliveryNoteResponse());

  /// Create invoice from sales order
  $async.Future<CreateInvoiceFromSalesOrderResponse>
      createInvoiceFromSalesOrder($pb.ClientContext? ctx,
              CreateInvoiceFromSalesOrderRequest request) =>
          _client.invoke<CreateInvoiceFromSalesOrderResponse>(
              ctx,
              'SalesOrderService',
              'CreateInvoiceFromSalesOrder',
              request,
              CreateInvoiceFromSalesOrderResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
