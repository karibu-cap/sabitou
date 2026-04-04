// This is a generated file - do not edit.
//
// Generated from order/v1/sales_order.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $1;
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
///    customer: "CMP-003"
///    seller_id: "CMP-001" (your company)
///    status: SO_STATUS_CONFIRMED
///    items: [10x PRD-001 @ 450000 each]
class SalesOrder extends $pb.GeneratedMessage {
  factory SalesOrder({
    $core.String? refId,
    $core.String? customer,
    $core.String? sellerId,
    $core.String? sourceWarehouseAddress,
    SalesOrderStatus? status,
    $core.Iterable<$0.OrderLineItem>? items,
    $core.double? totalAmount,
    $core.String? currency,
    $core.String? createdByUserId,
    $1.Timestamp? createdAt,
    $1.Timestamp? deliveryDate,
    $core.String? notes,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (customer != null) result.customer = customer;
    if (sellerId != null) result.sellerId = sellerId;
    if (sourceWarehouseAddress != null)
      result.sourceWarehouseAddress = sourceWarehouseAddress;
    if (status != null) result.status = status;
    if (items != null) result.items.addAll(items);
    if (totalAmount != null) result.totalAmount = totalAmount;
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
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'customer')
    ..aOS(3, _omitFieldNames ? '' : 'sellerId')
    ..aOS(4, _omitFieldNames ? '' : 'sourceWarehouseAddress')
    ..e<SalesOrderStatus>(
        5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: SalesOrderStatus.SO_STATUS_UNSPECIFIED,
        valueOf: SalesOrderStatus.valueOf,
        enumValues: SalesOrderStatus.values)
    ..pc<$0.OrderLineItem>(
        6, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: $0.OrderLineItem.create)
    ..a<$core.double>(
        7, _omitFieldNames ? '' : 'totalAmount', $pb.PbFieldType.OD)
    ..aOS(8, _omitFieldNames ? '' : 'currency')
    ..aOS(9, _omitFieldNames ? '' : 'createdByUserId')
    ..aOM<$1.Timestamp>(10, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $1.Timestamp.create)
    ..aOM<$1.Timestamp>(11, _omitFieldNames ? '' : 'deliveryDate',
        subBuilder: $1.Timestamp.create)
    ..aOS(12, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SalesOrder clone() => SalesOrder()..mergeFromMessage(this);
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
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// Company buying from you
  @$pb.TagNumber(2)
  $core.String get customer => $_getSZ(1);
  @$pb.TagNumber(2)
  set customer($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasCustomer() => $_has(1);
  @$pb.TagNumber(2)
  void clearCustomer() => $_clearField(2);

  /// Your company
  @$pb.TagNumber(3)
  $core.String get sellerId => $_getSZ(2);
  @$pb.TagNumber(3)
  set sellerId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasSellerId() => $_has(2);
  @$pb.TagNumber(3)
  void clearSellerId() => $_clearField(3);

  /// Where to pick items
  @$pb.TagNumber(4)
  $core.String get sourceWarehouseAddress => $_getSZ(3);
  @$pb.TagNumber(4)
  set sourceWarehouseAddress($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSourceWarehouseAddress() => $_has(3);
  @$pb.TagNumber(4)
  void clearSourceWarehouseAddress() => $_clearField(4);

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
  $core.double get totalAmount => $_getN(6);
  @$pb.TagNumber(7)
  set totalAmount($core.double value) => $_setDouble(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalAmount() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalAmount() => $_clearField(7);

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

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
