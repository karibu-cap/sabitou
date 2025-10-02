// This is a generated file - do not edit.
//
// Generated from order/v1/order_utils.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../inventory/v1/category.pb.dart' as $0;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

/// *
///  OrderLineItem represents a single product line in an order or quotation.
///  Used in PurchaseOrder, SalesOrder, Quotation, etc.
///
///  Fix: Added optional batch_id for specifying lots in orders (e.g., for perishable goods).
///
///  Example:
///    product_id: "PRD-001"
///    quantity: 10
///    product_name: "Product Name"
///    unit_price: 450000
///    total: 4500000
///    batch_id: "BATCH-2025-001" (optional)
class OrderLineItem extends $pb.GeneratedMessage {
  factory OrderLineItem({
    $core.String? productId,
    $core.int? quantity,
    $0.Internationalized? productName,
    $core.double? unitPrice,
    $core.double? total,
    $core.String? batchId,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (quantity != null) result.quantity = quantity;
    if (productName != null) result.productName = productName;
    if (unitPrice != null) result.unitPrice = unitPrice;
    if (total != null) result.total = total;
    if (batchId != null) result.batchId = batchId;
    return result;
  }

  OrderLineItem._();

  factory OrderLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory OrderLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'OrderLineItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'order.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..a<$core.int>(2, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..aOM<$0.Internationalized>(3, _omitFieldNames ? '' : 'productName',
        subBuilder: $0.Internationalized.create)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'unitPrice', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OD)
    ..aOS(6, _omitFieldNames ? '' : 'batchId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderLineItem clone() => OrderLineItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  OrderLineItem copyWith(void Function(OrderLineItem) updates) =>
      super.copyWith((message) => updates(message as OrderLineItem))
          as OrderLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static OrderLineItem create() => OrderLineItem._();
  @$core.override
  OrderLineItem createEmptyInstance() => create();
  static $pb.PbList<OrderLineItem> createRepeated() =>
      $pb.PbList<OrderLineItem>();
  @$core.pragma('dart2js:noInline')
  static OrderLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<OrderLineItem>(create);
  static OrderLineItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.int get quantity => $_getIZ(1);
  @$pb.TagNumber(2)
  set quantity($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Internationalized get productName => $_getN(2);
  @$pb.TagNumber(3)
  set productName($0.Internationalized value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasProductName() => $_has(2);
  @$pb.TagNumber(3)
  void clearProductName() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Internationalized ensureProductName() => $_ensure(2);

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
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
