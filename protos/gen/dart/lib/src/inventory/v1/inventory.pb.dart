// This is a generated file - do not edit.
//
// Generated from inventory/v1/inventory.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'inventory.pbenum.dart';
import 'store_product.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'inventory.pbenum.dart';

/// *
///  Batch represents a lot of products with specific attributes like expiration.
///
///  Example:
///    batch_id: "BATCH-2025-001"
///    product_id: "PRD-001"
///    warehouse_id: "WH-001"
///    quantity: 50.0
///    expiration_date: 2026-09-29T00:00:00Z
///    received_at: 2025-09-29T10:30:00Z
class Batch extends $pb.GeneratedMessage {
  factory Batch({
    $core.String? refId,
    $core.String? productId,
    $core.String? warehouseId,
    $core.int? quantity,
    $0.Timestamp? expirationDate,
    $0.Timestamp? receivedAt,
    $core.String? supplierBatchNumber,
    $core.String? supplierId,
    $core.int? purchasePrice,
    BatchStatus? status,
    $core.String? notes,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (productId != null) result.productId = productId;
    if (warehouseId != null) result.warehouseId = warehouseId;
    if (quantity != null) result.quantity = quantity;
    if (expirationDate != null) result.expirationDate = expirationDate;
    if (receivedAt != null) result.receivedAt = receivedAt;
    if (supplierBatchNumber != null)
      result.supplierBatchNumber = supplierBatchNumber;
    if (supplierId != null) result.supplierId = supplierId;
    if (purchasePrice != null) result.purchasePrice = purchasePrice;
    if (status != null) result.status = status;
    if (notes != null) result.notes = notes;
    return result;
  }

  Batch._();

  factory Batch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory Batch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'Batch',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..aOS(2, _omitFieldNames ? '' : 'productId')
    ..aOS(3, _omitFieldNames ? '' : 'warehouseId')
    ..a<$core.int>(4, _omitFieldNames ? '' : 'quantity', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'expirationDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'receivedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'supplierBatchNumber')
    ..aOS(8, _omitFieldNames ? '' : 'supplierId')
    ..a<$core.int>(
        9, _omitFieldNames ? '' : 'purchasePrice', $pb.PbFieldType.O3)
    ..e<BatchStatus>(10, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: BatchStatus.BATCH_STATUS_UNSPECIFIED,
        valueOf: BatchStatus.valueOf,
        enumValues: BatchStatus.values)
    ..aOS(11, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Batch clone() => Batch()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Batch copyWith(void Function(Batch) updates) =>
      super.copyWith((message) => updates(message as Batch)) as Batch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static Batch create() => Batch._();
  @$core.override
  Batch createEmptyInstance() => create();
  static $pb.PbList<Batch> createRepeated() => $pb.PbList<Batch>();
  @$core.pragma('dart2js:noInline')
  static Batch getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Batch>(create);
  static Batch? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get productId => $_getSZ(1);
  @$pb.TagNumber(2)
  set productId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get warehouseId => $_getSZ(2);
  @$pb.TagNumber(3)
  set warehouseId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasWarehouseId() => $_has(2);
  @$pb.TagNumber(3)
  void clearWarehouseId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get quantity => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantity($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantity() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantity() => $_clearField(4);

  @$pb.TagNumber(5)
  $0.Timestamp get expirationDate => $_getN(4);
  @$pb.TagNumber(5)
  set expirationDate($0.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasExpirationDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearExpirationDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureExpirationDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $0.Timestamp get receivedAt => $_getN(5);
  @$pb.TagNumber(6)
  set receivedAt($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasReceivedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearReceivedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureReceivedAt() => $_ensure(5);

  @$pb.TagNumber(7)
  $core.String get supplierBatchNumber => $_getSZ(6);
  @$pb.TagNumber(7)
  set supplierBatchNumber($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasSupplierBatchNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearSupplierBatchNumber() => $_clearField(7);

  @$pb.TagNumber(8)
  $core.String get supplierId => $_getSZ(7);
  @$pb.TagNumber(8)
  set supplierId($core.String value) => $_setString(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSupplierId() => $_has(7);
  @$pb.TagNumber(8)
  void clearSupplierId() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.int get purchasePrice => $_getIZ(8);
  @$pb.TagNumber(9)
  set purchasePrice($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasPurchasePrice() => $_has(8);
  @$pb.TagNumber(9)
  void clearPurchasePrice() => $_clearField(9);

  @$pb.TagNumber(10)
  BatchStatus get status => $_getN(9);
  @$pb.TagNumber(10)
  set status(BatchStatus value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasStatus() => $_has(9);
  @$pb.TagNumber(10)
  void clearStatus() => $_clearField(10);

  @$pb.TagNumber(11)
  $core.String get notes => $_getSZ(10);
  @$pb.TagNumber(11)
  set notes($core.String value) => $_setString(10, value);
  @$pb.TagNumber(11)
  $core.bool hasNotes() => $_has(10);
  @$pb.TagNumber(11)
  void clearNotes() => $_clearField(11);
}

/// *
///  InventoryLevel tracks how much stock exists in each warehouse.
///  This is the current state, updated by various documents.
///
///  Example:
///    product_id: "PRD-001"
///    store_id: "WH-001"
///    quantity_available: 50
///    quantity_reserved: 10 (in pending orders)
///    quantity_in_transit: 20 (being delivered)
///    min_threshold: 15.0
///    last_updated: 2025-09-29T10:30:00Z
///    batches: [Batch1 with qty 30 exp 2026-01-01, Batch2 with qty 20 exp 2026-06-01]
///  Note we can only have one InventoryLevel per (product_id).
class InventoryLevel extends $pb.GeneratedMessage {
  factory InventoryLevel({
    $core.String? storeProductId,
    $core.String? storeId,
    $core.int? quantityAvailable,
    $core.int? quantityCommitted,
    $core.int? quantityOnHand,
    $0.Timestamp? lastUpdated,
    $core.String? lastUpdatedByUserId,
    $core.int? minThreshold,
    $core.Iterable<Batch>? batches,
  }) {
    final result = create();
    if (storeProductId != null) result.storeProductId = storeProductId;
    if (storeId != null) result.storeId = storeId;
    if (quantityAvailable != null) result.quantityAvailable = quantityAvailable;
    if (quantityCommitted != null) result.quantityCommitted = quantityCommitted;
    if (quantityOnHand != null) result.quantityOnHand = quantityOnHand;
    if (lastUpdated != null) result.lastUpdated = lastUpdated;
    if (lastUpdatedByUserId != null)
      result.lastUpdatedByUserId = lastUpdatedByUserId;
    if (minThreshold != null) result.minThreshold = minThreshold;
    if (batches != null) result.batches.addAll(batches);
    return result;
  }

  InventoryLevel._();

  factory InventoryLevel.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InventoryLevel.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InventoryLevel',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeProductId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'quantityAvailable', $pb.PbFieldType.O3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'quantityCommitted', $pb.PbFieldType.O3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'quantityOnHand', $pb.PbFieldType.O3)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'lastUpdated',
        subBuilder: $0.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'lastUpdatedByUserId')
    ..a<$core.int>(8, _omitFieldNames ? '' : 'minThreshold', $pb.PbFieldType.O3)
    ..pc<Batch>(9, _omitFieldNames ? '' : 'batches', $pb.PbFieldType.PM,
        subBuilder: Batch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryLevel clone() => InventoryLevel()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryLevel copyWith(void Function(InventoryLevel) updates) =>
      super.copyWith((message) => updates(message as InventoryLevel))
          as InventoryLevel;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InventoryLevel create() => InventoryLevel._();
  @$core.override
  InventoryLevel createEmptyInstance() => create();
  static $pb.PbList<InventoryLevel> createRepeated() =>
      $pb.PbList<InventoryLevel>();
  @$core.pragma('dart2js:noInline')
  static InventoryLevel getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InventoryLevel>(create);
  static InventoryLevel? _defaultInstance;

  /// The product id to get level.
  @$pb.TagNumber(1)
  $core.String get storeProductId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeProductId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreProductId() => $_clearField(1);

  /// The warehouse id to get level.
  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  /// Ready to sell/use (sum of batch quantities)
  @$pb.TagNumber(3)
  $core.int get quantityAvailable => $_getIZ(2);
  @$pb.TagNumber(3)
  set quantityAvailable($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantityAvailable() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantityAvailable() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.int get quantityCommitted => $_getIZ(3);
  @$pb.TagNumber(4)
  set quantityCommitted($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantityCommitted() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantityCommitted() => $_clearField(4);

  @$pb.TagNumber(5)
  $core.int get quantityOnHand => $_getIZ(4);
  @$pb.TagNumber(5)
  set quantityOnHand($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQuantityOnHand() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuantityOnHand() => $_clearField(5);

  @$pb.TagNumber(6)
  $0.Timestamp get lastUpdated => $_getN(5);
  @$pb.TagNumber(6)
  set lastUpdated($0.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasLastUpdated() => $_has(5);
  @$pb.TagNumber(6)
  void clearLastUpdated() => $_clearField(6);
  @$pb.TagNumber(6)
  $0.Timestamp ensureLastUpdated() => $_ensure(5);

  /// Who made last change
  @$pb.TagNumber(7)
  $core.String get lastUpdatedByUserId => $_getSZ(6);
  @$pb.TagNumber(7)
  set lastUpdatedByUserId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasLastUpdatedByUserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearLastUpdatedByUserId() => $_clearField(7);

  /// Minimum stock threshold for this product in this warehouse
  @$pb.TagNumber(8)
  $core.int get minThreshold => $_getIZ(7);
  @$pb.TagNumber(8)
  set minThreshold($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasMinThreshold() => $_has(7);
  @$pb.TagNumber(8)
  void clearMinThreshold() => $_clearField(8);

  /// Detailed batches/lots for this product in this store
  @$pb.TagNumber(9)
  $pb.PbList<Batch> get batches => $_getList(8);
}

class InventoryLevelWithProduct extends $pb.GeneratedMessage {
  factory InventoryLevelWithProduct({
    InventoryLevel? level,
    $1.StoreProduct? product,
    $1.GlobalProduct? globalProduct,
    $core.int? stockValue,
    StockStatus? stockStatus,
  }) {
    final result = create();
    if (level != null) result.level = level;
    if (product != null) result.product = product;
    if (globalProduct != null) result.globalProduct = globalProduct;
    if (stockValue != null) result.stockValue = stockValue;
    if (stockStatus != null) result.stockStatus = stockStatus;
    return result;
  }

  InventoryLevelWithProduct._();

  factory InventoryLevelWithProduct.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory InventoryLevelWithProduct.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'InventoryLevelWithProduct',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOM<InventoryLevel>(1, _omitFieldNames ? '' : 'level',
        subBuilder: InventoryLevel.create)
    ..aOM<$1.StoreProduct>(2, _omitFieldNames ? '' : 'product',
        subBuilder: $1.StoreProduct.create)
    ..aOM<$1.GlobalProduct>(3, _omitFieldNames ? '' : 'globalProduct',
        subBuilder: $1.GlobalProduct.create)
    ..a<$core.int>(4, _omitFieldNames ? '' : 'stockValue', $pb.PbFieldType.O3)
    ..e<StockStatus>(
        5, _omitFieldNames ? '' : 'stockStatus', $pb.PbFieldType.OE,
        defaultOrMaker: StockStatus.STOCK_STATUS_UNSPECIFIED,
        valueOf: StockStatus.valueOf,
        enumValues: StockStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryLevelWithProduct clone() =>
      InventoryLevelWithProduct()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryLevelWithProduct copyWith(
          void Function(InventoryLevelWithProduct) updates) =>
      super.copyWith((message) => updates(message as InventoryLevelWithProduct))
          as InventoryLevelWithProduct;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static InventoryLevelWithProduct create() => InventoryLevelWithProduct._();
  @$core.override
  InventoryLevelWithProduct createEmptyInstance() => create();
  static $pb.PbList<InventoryLevelWithProduct> createRepeated() =>
      $pb.PbList<InventoryLevelWithProduct>();
  @$core.pragma('dart2js:noInline')
  static InventoryLevelWithProduct getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<InventoryLevelWithProduct>(create);
  static InventoryLevelWithProduct? _defaultInstance;

  @$pb.TagNumber(1)
  InventoryLevel get level => $_getN(0);
  @$pb.TagNumber(1)
  set level(InventoryLevel value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasLevel() => $_has(0);
  @$pb.TagNumber(1)
  void clearLevel() => $_clearField(1);
  @$pb.TagNumber(1)
  InventoryLevel ensureLevel() => $_ensure(0);

  @$pb.TagNumber(2)
  $1.StoreProduct get product => $_getN(1);
  @$pb.TagNumber(2)
  set product($1.StoreProduct value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasProduct() => $_has(1);
  @$pb.TagNumber(2)
  void clearProduct() => $_clearField(2);
  @$pb.TagNumber(2)
  $1.StoreProduct ensureProduct() => $_ensure(1);

  @$pb.TagNumber(3)
  $1.GlobalProduct get globalProduct => $_getN(2);
  @$pb.TagNumber(3)
  set globalProduct($1.GlobalProduct value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasGlobalProduct() => $_has(2);
  @$pb.TagNumber(3)
  void clearGlobalProduct() => $_clearField(3);
  @$pb.TagNumber(3)
  $1.GlobalProduct ensureGlobalProduct() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.int get stockValue => $_getIZ(3);
  @$pb.TagNumber(4)
  set stockValue($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasStockValue() => $_has(3);
  @$pb.TagNumber(4)
  void clearStockValue() => $_clearField(4);

  @$pb.TagNumber(5)
  StockStatus get stockStatus => $_getN(4);
  @$pb.TagNumber(5)
  set stockStatus(StockStatus value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasStockStatus() => $_has(4);
  @$pb.TagNumber(5)
  void clearStockStatus() => $_clearField(5);
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
