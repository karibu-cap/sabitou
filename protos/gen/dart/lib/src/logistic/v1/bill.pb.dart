// This is a generated file - do not edit.
//
// Generated from logistic/v1/bill.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'bill.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'bill.pbenum.dart';

class Bill extends $pb.GeneratedMessage {
  factory Bill({
    $core.String? refId,
    $core.String? relatedPurchaseOrderId,
    $core.String? supplierId,
    $core.String? storeId,
    BillStatus? status,
    $core.Iterable<$core.String>? paymentIds,
    $0.Timestamp? billDate,
    $0.Timestamp? dueDate,
    $core.double? subTotal,
    $core.double? taxTotal,
    $core.double? totalAmount,
    $core.double? balanceDue,
    $core.String? currency,
    $core.Iterable<BillLineItem>? items,
    $core.String? notes,
    $0.Timestamp? createdAt,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (relatedPurchaseOrderId != null)
      result.relatedPurchaseOrderId = relatedPurchaseOrderId;
    if (supplierId != null) result.supplierId = supplierId;
    if (storeId != null) result.storeId = storeId;
    if (status != null) result.status = status;
    if (paymentIds != null) result.paymentIds.addAll(paymentIds);
    if (billDate != null) result.billDate = billDate;
    if (dueDate != null) result.dueDate = dueDate;
    if (subTotal != null) result.subTotal = subTotal;
    if (taxTotal != null) result.taxTotal = taxTotal;
    if (totalAmount != null) result.totalAmount = totalAmount;
    if (balanceDue != null) result.balanceDue = balanceDue;
    if (currency != null) result.currency = currency;
    if (items != null) result.items.addAll(items);
    if (notes != null) result.notes = notes;
    if (createdAt != null) result.createdAt = createdAt;
    return result;
  }

  Bill._();

  factory Bill.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Bill.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Bill',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'relatedPurchaseOrderId')
    ..aOS(3, _omitFieldNames ? '' : 'supplierId')
    ..aOS(4, _omitFieldNames ? '' : 'storeId')
    ..e<BillStatus>(5, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: BillStatus.BILL_STATUS_UNSPECIFIED,
        valueOf: BillStatus.valueOf,
        enumValues: BillStatus.values)
    ..pPS(6, _omitFieldNames ? '' : 'paymentIds')
    ..aOM<$0.Timestamp>(7, _omitFieldNames ? '' : 'billDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(8, _omitFieldNames ? '' : 'dueDate',
        subBuilder: $0.Timestamp.create)
    ..a<$core.double>(9, _omitFieldNames ? '' : 'subTotal', $pb.PbFieldType.OD)
    ..a<$core.double>(10, _omitFieldNames ? '' : 'taxTotal', $pb.PbFieldType.OD)
    ..a<$core.double>(
        11, _omitFieldNames ? '' : 'totalAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(
        12, _omitFieldNames ? '' : 'balanceDue', $pb.PbFieldType.OD)
    ..aOS(13, _omitFieldNames ? '' : 'currency')
    ..pc<BillLineItem>(14, _omitFieldNames ? '' : 'items', $pb.PbFieldType.PM,
        subBuilder: BillLineItem.create)
    ..aOS(15, _omitFieldNames ? '' : 'notes')
    ..aOM<$0.Timestamp>(16, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Bill clone() => Bill()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Bill copyWith(void Function(Bill) updates) =>
      super.copyWith((message) => updates(message as Bill)) as Bill;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Bill create() => Bill._();
  @$core.override
  Bill createEmptyInstance() => create();
  static $pb.PbList<Bill> createRepeated() => $pb.PbList<Bill>();
  @$core.pragma('dart2js:noInline')
  static Bill getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Bill>(create);
  static Bill? _defaultInstance;

  /// "BILL-2026-0001"
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
  BillStatus get status => $_getN(4);
  @$pb.TagNumber(5)
  set status(BillStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStatus() => $_clearField(5);

  @$pb.TagNumber(6)
  $pb.PbList<$core.String> get paymentIds => $_getList(5);

  @$pb.TagNumber(7)
  $0.Timestamp get billDate => $_getN(6);
  @$pb.TagNumber(7)
  set billDate($0.Timestamp value) => $_setField(7, value);
  @$pb.TagNumber(7)
  $core.bool hasBillDate() => $_has(6);
  @$pb.TagNumber(7)
  void clearBillDate() => $_clearField(7);
  @$pb.TagNumber(7)
  $0.Timestamp ensureBillDate() => $_ensure(6);

  @$pb.TagNumber(8)
  $0.Timestamp get dueDate => $_getN(7);
  @$pb.TagNumber(8)
  set dueDate($0.Timestamp value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasDueDate() => $_has(7);
  @$pb.TagNumber(8)
  void clearDueDate() => $_clearField(8);
  @$pb.TagNumber(8)
  $0.Timestamp ensureDueDate() => $_ensure(7);

  @$pb.TagNumber(9)
  $core.double get subTotal => $_getN(8);
  @$pb.TagNumber(9)
  set subTotal($core.double value) => $_setDouble(8, value);
  @$pb.TagNumber(9)
  $core.bool hasSubTotal() => $_has(8);
  @$pb.TagNumber(9)
  void clearSubTotal() => $_clearField(9);

  @$pb.TagNumber(10)
  $core.double get taxTotal => $_getN(9);
  @$pb.TagNumber(10)
  set taxTotal($core.double value) => $_setDouble(9, value);
  @$pb.TagNumber(10)
  $core.bool hasTaxTotal() => $_has(9);
  @$pb.TagNumber(10)
  void clearTaxTotal() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.double get totalAmount => $_getN(10);
  @$pb.TagNumber(11)
  set totalAmount($core.double value) => $_setDouble(10, value);
  @$pb.TagNumber(11)
  $core.bool hasTotalAmount() => $_has(10);
  @$pb.TagNumber(11)
  void clearTotalAmount() => $_clearField(11);

  @$pb.TagNumber(12)
  $core.double get balanceDue => $_getN(11);
  @$pb.TagNumber(12)
  set balanceDue($core.double value) => $_setDouble(11, value);
  @$pb.TagNumber(12)
  $core.bool hasBalanceDue() => $_has(11);
  @$pb.TagNumber(12)
  void clearBalanceDue() => $_clearField(12);

  @$pb.TagNumber(13)
  $core.String get currency => $_getSZ(12);
  @$pb.TagNumber(13)
  set currency($core.String value) => $_setString(12, value);
  @$pb.TagNumber(13)
  $core.bool hasCurrency() => $_has(12);
  @$pb.TagNumber(13)
  void clearCurrency() => $_clearField(13);

  @$pb.TagNumber(14)
  $pb.PbList<BillLineItem> get items => $_getList(13);

  @$pb.TagNumber(15)
  $core.String get notes => $_getSZ(14);
  @$pb.TagNumber(15)
  set notes($core.String value) => $_setString(14, value);
  @$pb.TagNumber(15)
  $core.bool hasNotes() => $_has(14);
  @$pb.TagNumber(15)
  void clearNotes() => $_clearField(15);

  @$pb.TagNumber(16)
  $0.Timestamp get createdAt => $_getN(15);
  @$pb.TagNumber(16)
  set createdAt($0.Timestamp value) => $_setField(16, value);
  @$pb.TagNumber(16)
  $core.bool hasCreatedAt() => $_has(15);
  @$pb.TagNumber(16)
  void clearCreatedAt() => $_clearField(16);
  @$pb.TagNumber(16)
  $0.Timestamp ensureCreatedAt() => $_ensure(15);
}

class BillLineItem extends $pb.GeneratedMessage {
  factory BillLineItem({
    $core.String? productId,
    $core.String? description,
    $core.int? quantity,
    $core.double? unitPrice,
    $core.double? taxAmount,
    $core.double? total,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (description != null) result.description = description;
    if (quantity != null) result.quantity = quantity;
    if (unitPrice != null) result.unitPrice = unitPrice;
    if (taxAmount != null) result.taxAmount = taxAmount;
    if (total != null) result.total = total;
    return result;
  }

  BillLineItem._();

  factory BillLineItem.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory BillLineItem.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'BillLineItem',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'logistic.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOS(2, _omitFieldNames ? '' : 'description')
    ..a<$core.int>(3, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..a<$core.double>(4, _omitFieldNames ? '' : 'unitPrice', $pb.PbFieldType.OD)
    ..a<$core.double>(5, _omitFieldNames ? '' : 'taxAmount', $pb.PbFieldType.OD)
    ..a<$core.double>(6, _omitFieldNames ? '' : 'total', $pb.PbFieldType.OD)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BillLineItem clone() => BillLineItem()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  BillLineItem copyWith(void Function(BillLineItem) updates) =>
      super.copyWith((message) => updates(message as BillLineItem))
          as BillLineItem;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static BillLineItem create() => BillLineItem._();
  @$core.override
  BillLineItem createEmptyInstance() => create();
  static $pb.PbList<BillLineItem> createRepeated() =>
      $pb.PbList<BillLineItem>();
  @$core.pragma('dart2js:noInline')
  static BillLineItem getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<BillLineItem>(create);
  static BillLineItem? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get description => $_getSZ(1);
  @$pb.TagNumber(2)
  set description($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasDescription() => $_has(1);
  @$pb.TagNumber(2)
  void clearDescription() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.int get quantity => $_getIZ(2);
  @$pb.TagNumber(3)
  set quantity($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantity() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantity() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get unitPrice => $_getN(3);
  @$pb.TagNumber(4)
  set unitPrice($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasUnitPrice() => $_has(3);
  @$pb.TagNumber(4)
  void clearUnitPrice() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.double get taxAmount => $_getN(4);
  @$pb.TagNumber(5)
  set taxAmount($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasTaxAmount() => $_has(4);
  @$pb.TagNumber(5)
  void clearTaxAmount() => $_clearField(5);

  @$pb.TagNumber(6)
  $core.double get total => $_getN(5);
  @$pb.TagNumber(6)
  set total($core.double value) => $_setDouble(5, value);
  @$pb.TagNumber(6)
  $core.bool hasTotal() => $_has(5);
  @$pb.TagNumber(6)
  void clearTotal() => $_clearField(6);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
