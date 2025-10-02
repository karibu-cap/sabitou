// This is a generated file - do not edit.
//
// Generated from inventory/v1/inventory.proto.

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

import '../../audits/v1/inventory_transaction.pb.dart' as $2;
import '../../google/protobuf/timestamp.pb.dart' as $0;
import 'inventory.pbenum.dart';
import 'store_product.pb.dart' as $1;

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'inventory.pbenum.dart';

/// *
///  Batch represents a lot of products with specific attributes like expiration.
///
///  Fix: New message added for lot tracking. Each batch can have its own quantity, expiration date, and is linked to a product and warehouse.
///  InventoryLevel now aggregates from batches, but batches provide detailed quantity per lot.
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
    $core.String? documentId,
    $core.String? productId,
    $core.String? warehouseId,
    $core.double? quantity,
    $0.Timestamp? expirationDate,
    $0.Timestamp? receivedAt,
    $core.String? supplierBatchNumber,
    BatchStatus? status,
    $core.String? notes,
  }) {
    final result = create();
    if (documentId != null) result.documentId = documentId;
    if (productId != null) result.productId = productId;
    if (warehouseId != null) result.warehouseId = warehouseId;
    if (quantity != null) result.quantity = quantity;
    if (expirationDate != null) result.expirationDate = expirationDate;
    if (receivedAt != null) result.receivedAt = receivedAt;
    if (supplierBatchNumber != null)
      result.supplierBatchNumber = supplierBatchNumber;
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
    ..aOS(1, _omitFieldNames ? '' : 'documentId')
    ..aOS(2, _omitFieldNames ? '' : 'productId')
    ..aOS(3, _omitFieldNames ? '' : 'warehouseId')
    ..aD(4, _omitFieldNames ? '' : 'quantity')
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'expirationDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'receivedAt',
        subBuilder: $0.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'supplierBatchNumber')
    ..aE<BatchStatus>(8, _omitFieldNames ? '' : 'status',
        enumValues: BatchStatus.values)
    ..aOS(9, _omitFieldNames ? '' : 'notes')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  Batch clone() => deepCopy();
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
  $core.String get documentId => $_getSZ(0);
  @$pb.TagNumber(1)
  set documentId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasDocumentId() => $_has(0);
  @$pb.TagNumber(1)
  void clearDocumentId() => $_clearField(1);

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
  $core.double get quantity => $_getN(3);
  @$pb.TagNumber(4)
  set quantity($core.double value) => $_setDouble(3, value);
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
  BatchStatus get status => $_getN(7);
  @$pb.TagNumber(8)
  set status(BatchStatus value) => $_setField(8, value);
  @$pb.TagNumber(8)
  $core.bool hasStatus() => $_has(7);
  @$pb.TagNumber(8)
  void clearStatus() => $_clearField(8);

  @$pb.TagNumber(9)
  $core.String get notes => $_getSZ(8);
  @$pb.TagNumber(9)
  set notes($core.String value) => $_setString(8, value);
  @$pb.TagNumber(9)
  $core.bool hasNotes() => $_has(8);
  @$pb.TagNumber(9)
  void clearNotes() => $_clearField(9);
}

/// *
///  InventoryLevel tracks how much stock exists in each warehouse.
///  This is the current state, updated by various documents.
///
///  Fixes: Added repeated batches for lot-level details (quantity per lot, expiration).
///  The quantity_available is now the sum of batch quantities (computed).
///  Added min_threshold per warehouse for the product.
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
///  Note we can only have one InventoryLevel per (product_id, supplier_id).
///  Reason why we don't add it directly to Storeproduct is because the Storeproduct can be handler by multiple supplier.
///  Example: On product Coffee can be provide by 2 different supplier.
class InventoryLevel extends $pb.GeneratedMessage {
  factory InventoryLevel({
    $core.String? storeProductId,
    $core.String? storeId,
    $core.double? quantityAvailable,
    $core.double? quantityReserved,
    $core.double? quantityInTransit,
    $0.Timestamp? lastUpdated,
    $core.String? lastUpdatedByUserId,
    $core.double? minThreshold,
    $core.Iterable<Batch>? batches,
  }) {
    final result = create();
    if (storeProductId != null) result.storeProductId = storeProductId;
    if (storeId != null) result.storeId = storeId;
    if (quantityAvailable != null) result.quantityAvailable = quantityAvailable;
    if (quantityReserved != null) result.quantityReserved = quantityReserved;
    if (quantityInTransit != null) result.quantityInTransit = quantityInTransit;
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
    ..aD(3, _omitFieldNames ? '' : 'quantityAvailable')
    ..aD(4, _omitFieldNames ? '' : 'quantityReserved')
    ..aD(5, _omitFieldNames ? '' : 'quantityInTransit')
    ..aOM<$0.Timestamp>(6, _omitFieldNames ? '' : 'lastUpdated',
        subBuilder: $0.Timestamp.create)
    ..aOS(7, _omitFieldNames ? '' : 'lastUpdatedByUserId')
    ..aD(8, _omitFieldNames ? '' : 'minThreshold')
    ..pPM<Batch>(9, _omitFieldNames ? '' : 'batches', subBuilder: Batch.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryLevel clone() => deepCopy();
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
  $core.double get quantityAvailable => $_getN(2);
  @$pb.TagNumber(3)
  set quantityAvailable($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantityAvailable() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantityAvailable() => $_clearField(3);

  /// Allocated to orders not yet fulfilled
  @$pb.TagNumber(4)
  $core.double get quantityReserved => $_getN(3);
  @$pb.TagNumber(4)
  set quantityReserved($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasQuantityReserved() => $_has(3);
  @$pb.TagNumber(4)
  void clearQuantityReserved() => $_clearField(4);

  /// Being delivered here
  @$pb.TagNumber(5)
  $core.double get quantityInTransit => $_getN(4);
  @$pb.TagNumber(5)
  set quantityInTransit($core.double value) => $_setDouble(4, value);
  @$pb.TagNumber(5)
  $core.bool hasQuantityInTransit() => $_has(4);
  @$pb.TagNumber(5)
  void clearQuantityInTransit() => $_clearField(5);

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
  $core.double get minThreshold => $_getN(7);
  @$pb.TagNumber(8)
  set minThreshold($core.double value) => $_setDouble(7, value);
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
    $fixnum.Int64? stockValue,
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
        protoName: 'globalProduct', subBuilder: $1.GlobalProduct.create)
    ..aInt64(4, _omitFieldNames ? '' : 'stockValue')
    ..aE<StockStatus>(5, _omitFieldNames ? '' : 'stockStatus',
        protoName: 'stockStatus', enumValues: StockStatus.values)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  InventoryLevelWithProduct clone() => deepCopy();
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
  $fixnum.Int64 get stockValue => $_getI64(3);
  @$pb.TagNumber(4)
  set stockValue($fixnum.Int64 value) => $_setInt64(3, value);
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

class GetInventoryTransactionHistoryRequest extends $pb.GeneratedMessage {
  factory GetInventoryTransactionHistoryRequest({
    $core.String? storeId,
    $core.String? productId,
    $2.TransactionType? transactionType,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (productId != null) result.productId = productId;
    if (transactionType != null) result.transactionType = transactionType;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNumber != null) result.pageNumber = pageNumber;
    return result;
  }

  GetInventoryTransactionHistoryRequest._();

  factory GetInventoryTransactionHistoryRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryTransactionHistoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryTransactionHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'productId')
    ..aE<$2.TransactionType>(3, _omitFieldNames ? '' : 'transactionType',
        enumValues: $2.TransactionType.values)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(5, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aI(6, _omitFieldNames ? '' : 'pageSize')
    ..aI(7, _omitFieldNames ? '' : 'pageNumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionHistoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionHistoryRequest copyWith(
          void Function(GetInventoryTransactionHistoryRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetInventoryTransactionHistoryRequest))
          as GetInventoryTransactionHistoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionHistoryRequest create() =>
      GetInventoryTransactionHistoryRequest._();
  @$core.override
  GetInventoryTransactionHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetInventoryTransactionHistoryRequest> createRepeated() =>
      $pb.PbList<GetInventoryTransactionHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionHistoryRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetInventoryTransactionHistoryRequest>(create);
  static GetInventoryTransactionHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get productId => $_getSZ(1);
  @$pb.TagNumber(2)
  set productId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductId() => $_clearField(2);

  @$pb.TagNumber(3)
  $2.TransactionType get transactionType => $_getN(2);
  @$pb.TagNumber(3)
  set transactionType($2.TransactionType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasTransactionType() => $_has(2);
  @$pb.TagNumber(3)
  void clearTransactionType() => $_clearField(3);

  @$pb.TagNumber(4)
  $0.Timestamp get startDate => $_getN(3);
  @$pb.TagNumber(4)
  set startDate($0.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasStartDate() => $_has(3);
  @$pb.TagNumber(4)
  void clearStartDate() => $_clearField(4);
  @$pb.TagNumber(4)
  $0.Timestamp ensureStartDate() => $_ensure(3);

  @$pb.TagNumber(5)
  $0.Timestamp get endDate => $_getN(4);
  @$pb.TagNumber(5)
  set endDate($0.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasEndDate() => $_has(4);
  @$pb.TagNumber(5)
  void clearEndDate() => $_clearField(5);
  @$pb.TagNumber(5)
  $0.Timestamp ensureEndDate() => $_ensure(4);

  @$pb.TagNumber(6)
  $core.int get pageSize => $_getIZ(5);
  @$pb.TagNumber(6)
  set pageSize($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasPageSize() => $_has(5);
  @$pb.TagNumber(6)
  void clearPageSize() => $_clearField(6);

  @$pb.TagNumber(7)
  $core.int get pageNumber => $_getIZ(6);
  @$pb.TagNumber(7)
  set pageNumber($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasPageNumber() => $_has(6);
  @$pb.TagNumber(7)
  void clearPageNumber() => $_clearField(7);
}

class GetInventoryTransactionHistoryResponse extends $pb.GeneratedMessage {
  factory GetInventoryTransactionHistoryResponse({
    $core.Iterable<$2.InventoryTransaction>? transactions,
    $core.int? totalCount,
    $core.double? totalQuantityIn,
    $core.double? totalQuantityOut,
  }) {
    final result = create();
    if (transactions != null) result.transactions.addAll(transactions);
    if (totalCount != null) result.totalCount = totalCount;
    if (totalQuantityIn != null) result.totalQuantityIn = totalQuantityIn;
    if (totalQuantityOut != null) result.totalQuantityOut = totalQuantityOut;
    return result;
  }

  GetInventoryTransactionHistoryResponse._();

  factory GetInventoryTransactionHistoryResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetInventoryTransactionHistoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetInventoryTransactionHistoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pPM<$2.InventoryTransaction>(1, _omitFieldNames ? '' : 'transactions',
        subBuilder: $2.InventoryTransaction.create)
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..aD(3, _omitFieldNames ? '' : 'totalQuantityIn')
    ..aD(4, _omitFieldNames ? '' : 'totalQuantityOut')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionHistoryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetInventoryTransactionHistoryResponse copyWith(
          void Function(GetInventoryTransactionHistoryResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetInventoryTransactionHistoryResponse))
          as GetInventoryTransactionHistoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionHistoryResponse create() =>
      GetInventoryTransactionHistoryResponse._();
  @$core.override
  GetInventoryTransactionHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetInventoryTransactionHistoryResponse> createRepeated() =>
      $pb.PbList<GetInventoryTransactionHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetInventoryTransactionHistoryResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetInventoryTransactionHistoryResponse>(create);
  static GetInventoryTransactionHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.InventoryTransaction> get transactions => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get totalQuantityIn => $_getN(2);
  @$pb.TagNumber(3)
  set totalQuantityIn($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalQuantityIn() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalQuantityIn() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get totalQuantityOut => $_getN(3);
  @$pb.TagNumber(4)
  set totalQuantityOut($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalQuantityOut() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalQuantityOut() => $_clearField(4);
}

class GetProductInventoryLevelsRequest extends $pb.GeneratedMessage {
  factory GetProductInventoryLevelsRequest({
    $core.String? productId,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    return result;
  }

  GetProductInventoryLevelsRequest._();

  factory GetProductInventoryLevelsRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProductInventoryLevelsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProductInventoryLevelsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductInventoryLevelsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductInventoryLevelsRequest copyWith(
          void Function(GetProductInventoryLevelsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetProductInventoryLevelsRequest))
          as GetProductInventoryLevelsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductInventoryLevelsRequest create() =>
      GetProductInventoryLevelsRequest._();
  @$core.override
  GetProductInventoryLevelsRequest createEmptyInstance() => create();
  static $pb.PbList<GetProductInventoryLevelsRequest> createRepeated() =>
      $pb.PbList<GetProductInventoryLevelsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProductInventoryLevelsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProductInventoryLevelsRequest>(
          create);
  static GetProductInventoryLevelsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);
}

class GetProductInventoryLevelsResponse extends $pb.GeneratedMessage {
  factory GetProductInventoryLevelsResponse({
    $core.Iterable<InventoryLevel>? levels,
    $fixnum.Int64? totalAvailable,
    $fixnum.Int64? totalReserved,
    $fixnum.Int64? totalInTransit,
  }) {
    final result = create();
    if (levels != null) result.levels.addAll(levels);
    if (totalAvailable != null) result.totalAvailable = totalAvailable;
    if (totalReserved != null) result.totalReserved = totalReserved;
    if (totalInTransit != null) result.totalInTransit = totalInTransit;
    return result;
  }

  GetProductInventoryLevelsResponse._();

  factory GetProductInventoryLevelsResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProductInventoryLevelsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProductInventoryLevelsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pPM<InventoryLevel>(1, _omitFieldNames ? '' : 'levels',
        subBuilder: InventoryLevel.create)
    ..aInt64(2, _omitFieldNames ? '' : 'totalAvailable')
    ..aInt64(3, _omitFieldNames ? '' : 'totalReserved')
    ..aInt64(4, _omitFieldNames ? '' : 'totalInTransit')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductInventoryLevelsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductInventoryLevelsResponse copyWith(
          void Function(GetProductInventoryLevelsResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetProductInventoryLevelsResponse))
          as GetProductInventoryLevelsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductInventoryLevelsResponse create() =>
      GetProductInventoryLevelsResponse._();
  @$core.override
  GetProductInventoryLevelsResponse createEmptyInstance() => create();
  static $pb.PbList<GetProductInventoryLevelsResponse> createRepeated() =>
      $pb.PbList<GetProductInventoryLevelsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProductInventoryLevelsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetProductInventoryLevelsResponse>(
          create);
  static GetProductInventoryLevelsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InventoryLevel> get levels => $_getList(0);

  @$pb.TagNumber(2)
  $fixnum.Int64 get totalAvailable => $_getI64(1);
  @$pb.TagNumber(2)
  set totalAvailable($fixnum.Int64 value) => $_setInt64(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalAvailable() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalAvailable() => $_clearField(2);

  @$pb.TagNumber(3)
  $fixnum.Int64 get totalReserved => $_getI64(2);
  @$pb.TagNumber(3)
  set totalReserved($fixnum.Int64 value) => $_setInt64(2, value);
  @$pb.TagNumber(3)
  $core.bool hasTotalReserved() => $_has(2);
  @$pb.TagNumber(3)
  void clearTotalReserved() => $_clearField(3);

  @$pb.TagNumber(4)
  $fixnum.Int64 get totalInTransit => $_getI64(3);
  @$pb.TagNumber(4)
  set totalInTransit($fixnum.Int64 value) => $_setInt64(3, value);
  @$pb.TagNumber(4)
  $core.bool hasTotalInTransit() => $_has(3);
  @$pb.TagNumber(4)
  void clearTotalInTransit() => $_clearField(4);
}

class CheckProductAvailabilityRequest extends $pb.GeneratedMessage {
  factory CheckProductAvailabilityRequest({
    $core.String? productId,
    $core.String? storeId,
    $core.double? quantityNeeded,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (storeId != null) result.storeId = storeId;
    if (quantityNeeded != null) result.quantityNeeded = quantityNeeded;
    return result;
  }

  CheckProductAvailabilityRequest._();

  factory CheckProductAvailabilityRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckProductAvailabilityRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckProductAvailabilityRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aD(3, _omitFieldNames ? '' : 'quantityNeeded')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckProductAvailabilityRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckProductAvailabilityRequest copyWith(
          void Function(CheckProductAvailabilityRequest) updates) =>
      super.copyWith(
              (message) => updates(message as CheckProductAvailabilityRequest))
          as CheckProductAvailabilityRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckProductAvailabilityRequest create() =>
      CheckProductAvailabilityRequest._();
  @$core.override
  CheckProductAvailabilityRequest createEmptyInstance() => create();
  static $pb.PbList<CheckProductAvailabilityRequest> createRepeated() =>
      $pb.PbList<CheckProductAvailabilityRequest>();
  @$core.pragma('dart2js:noInline')
  static CheckProductAvailabilityRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckProductAvailabilityRequest>(
          create);
  static CheckProductAvailabilityRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get quantityNeeded => $_getN(2);
  @$pb.TagNumber(3)
  set quantityNeeded($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantityNeeded() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantityNeeded() => $_clearField(3);
}

class CheckProductAvailabilityResponse extends $pb.GeneratedMessage {
  factory CheckProductAvailabilityResponse({
    $core.bool? isAvailable,
    $core.double? quantityAvailable,
    $core.double? quantityNeeded,
    $core.double? shortage,
  }) {
    final result = create();
    if (isAvailable != null) result.isAvailable = isAvailable;
    if (quantityAvailable != null) result.quantityAvailable = quantityAvailable;
    if (quantityNeeded != null) result.quantityNeeded = quantityNeeded;
    if (shortage != null) result.shortage = shortage;
    return result;
  }

  CheckProductAvailabilityResponse._();

  factory CheckProductAvailabilityResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory CheckProductAvailabilityResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'CheckProductAvailabilityResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOB(1, _omitFieldNames ? '' : 'isAvailable')
    ..aD(2, _omitFieldNames ? '' : 'quantityAvailable')
    ..aD(3, _omitFieldNames ? '' : 'quantityNeeded')
    ..aD(4, _omitFieldNames ? '' : 'shortage')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckProductAvailabilityResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  CheckProductAvailabilityResponse copyWith(
          void Function(CheckProductAvailabilityResponse) updates) =>
      super.copyWith(
              (message) => updates(message as CheckProductAvailabilityResponse))
          as CheckProductAvailabilityResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static CheckProductAvailabilityResponse create() =>
      CheckProductAvailabilityResponse._();
  @$core.override
  CheckProductAvailabilityResponse createEmptyInstance() => create();
  static $pb.PbList<CheckProductAvailabilityResponse> createRepeated() =>
      $pb.PbList<CheckProductAvailabilityResponse>();
  @$core.pragma('dart2js:noInline')
  static CheckProductAvailabilityResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<CheckProductAvailabilityResponse>(
          create);
  static CheckProductAvailabilityResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get isAvailable => $_getBF(0);
  @$pb.TagNumber(1)
  set isAvailable($core.bool value) => $_setBool(0, value);
  @$pb.TagNumber(1)
  $core.bool hasIsAvailable() => $_has(0);
  @$pb.TagNumber(1)
  void clearIsAvailable() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.double get quantityAvailable => $_getN(1);
  @$pb.TagNumber(2)
  set quantityAvailable($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasQuantityAvailable() => $_has(1);
  @$pb.TagNumber(2)
  void clearQuantityAvailable() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.double get quantityNeeded => $_getN(2);
  @$pb.TagNumber(3)
  set quantityNeeded($core.double value) => $_setDouble(2, value);
  @$pb.TagNumber(3)
  $core.bool hasQuantityNeeded() => $_has(2);
  @$pb.TagNumber(3)
  void clearQuantityNeeded() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.double get shortage => $_getN(3);
  @$pb.TagNumber(4)
  set shortage($core.double value) => $_setDouble(3, value);
  @$pb.TagNumber(4)
  $core.bool hasShortage() => $_has(3);
  @$pb.TagNumber(4)
  void clearShortage() => $_clearField(4);
}

class GetLowStockItemsRequest extends $pb.GeneratedMessage {
  factory GetLowStockItemsRequest({
    $core.String? storeId,
    $core.int? threshold,
    $core.String? categoryId,
    $core.String? supplierId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (threshold != null) result.threshold = threshold;
    if (categoryId != null) result.categoryId = categoryId;
    if (supplierId != null) result.supplierId = supplierId;
    return result;
  }

  GetLowStockItemsRequest._();

  factory GetLowStockItemsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLowStockItemsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLowStockItemsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aI(2, _omitFieldNames ? '' : 'threshold')
    ..aOS(3, _omitFieldNames ? '' : 'categoryId')
    ..aOS(4, _omitFieldNames ? '' : 'supplierId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLowStockItemsRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLowStockItemsRequest copyWith(
          void Function(GetLowStockItemsRequest) updates) =>
      super.copyWith((message) => updates(message as GetLowStockItemsRequest))
          as GetLowStockItemsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLowStockItemsRequest create() => GetLowStockItemsRequest._();
  @$core.override
  GetLowStockItemsRequest createEmptyInstance() => create();
  static $pb.PbList<GetLowStockItemsRequest> createRepeated() =>
      $pb.PbList<GetLowStockItemsRequest>();
  @$core.pragma('dart2js:noInline')
  static GetLowStockItemsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLowStockItemsRequest>(create);
  static GetLowStockItemsRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// Min stock level to flag as low
  @$pb.TagNumber(2)
  $core.int get threshold => $_getIZ(1);
  @$pb.TagNumber(2)
  set threshold($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasThreshold() => $_has(1);
  @$pb.TagNumber(2)
  void clearThreshold() => $_clearField(2);

  @$pb.TagNumber(3)
  $core.String get categoryId => $_getSZ(2);
  @$pb.TagNumber(3)
  set categoryId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasCategoryId() => $_has(2);
  @$pb.TagNumber(3)
  void clearCategoryId() => $_clearField(3);

  @$pb.TagNumber(4)
  $core.String get supplierId => $_getSZ(3);
  @$pb.TagNumber(4)
  set supplierId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSupplierId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupplierId() => $_clearField(4);
}

class GetLowStockItemsResponse extends $pb.GeneratedMessage {
  factory GetLowStockItemsResponse({
    $core.Iterable<InventoryLevel>? lowStockItems,
    $core.int? totalCount,
  }) {
    final result = create();
    if (lowStockItems != null) result.lowStockItems.addAll(lowStockItems);
    if (totalCount != null) result.totalCount = totalCount;
    return result;
  }

  GetLowStockItemsResponse._();

  factory GetLowStockItemsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetLowStockItemsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetLowStockItemsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pPM<InventoryLevel>(1, _omitFieldNames ? '' : 'lowStockItems',
        subBuilder: InventoryLevel.create)
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLowStockItemsResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetLowStockItemsResponse copyWith(
          void Function(GetLowStockItemsResponse) updates) =>
      super.copyWith((message) => updates(message as GetLowStockItemsResponse))
          as GetLowStockItemsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetLowStockItemsResponse create() => GetLowStockItemsResponse._();
  @$core.override
  GetLowStockItemsResponse createEmptyInstance() => create();
  static $pb.PbList<GetLowStockItemsResponse> createRepeated() =>
      $pb.PbList<GetLowStockItemsResponse>();
  @$core.pragma('dart2js:noInline')
  static GetLowStockItemsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetLowStockItemsResponse>(create);
  static GetLowStockItemsResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InventoryLevel> get lowStockItems => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);
}

class GetResourceInventoryRequest extends $pb.GeneratedMessage {
  factory GetResourceInventoryRequest({
    $core.String? storeId,
    $core.String? productId,
    $0.Timestamp? asOfDate,
    $core.String? supplierId,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (productId != null) result.productId = productId;
    if (asOfDate != null) result.asOfDate = asOfDate;
    if (supplierId != null) result.supplierId = supplierId;
    return result;
  }

  GetResourceInventoryRequest._();

  factory GetResourceInventoryRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetResourceInventoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetResourceInventoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'productId')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'asOfDate',
        subBuilder: $0.Timestamp.create)
    ..aOS(4, _omitFieldNames ? '' : 'supplierId')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetResourceInventoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetResourceInventoryRequest copyWith(
          void Function(GetResourceInventoryRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetResourceInventoryRequest))
          as GetResourceInventoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetResourceInventoryRequest create() =>
      GetResourceInventoryRequest._();
  @$core.override
  GetResourceInventoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetResourceInventoryRequest> createRepeated() =>
      $pb.PbList<GetResourceInventoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetResourceInventoryRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetResourceInventoryRequest>(create);
  static GetResourceInventoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// Specific product, if omitted: full snapshot
  @$pb.TagNumber(2)
  $core.String get productId => $_getSZ(1);
  @$pb.TagNumber(2)
  set productId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasProductId() => $_has(1);
  @$pb.TagNumber(2)
  void clearProductId() => $_clearField(2);

  /// Historical snapshot
  @$pb.TagNumber(3)
  $0.Timestamp get asOfDate => $_getN(2);
  @$pb.TagNumber(3)
  set asOfDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasAsOfDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearAsOfDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureAsOfDate() => $_ensure(2);

  @$pb.TagNumber(4)
  $core.String get supplierId => $_getSZ(3);
  @$pb.TagNumber(4)
  set supplierId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSupplierId() => $_has(3);
  @$pb.TagNumber(4)
  void clearSupplierId() => $_clearField(4);
}

class GetResourceInventoryResponse extends $pb.GeneratedMessage {
  factory GetResourceInventoryResponse({
    $core.Iterable<InventoryLevel>? items,
    $core.double? totalQuantity,
    $0.Timestamp? snapshotDate,
  }) {
    final result = create();
    if (items != null) result.items.addAll(items);
    if (totalQuantity != null) result.totalQuantity = totalQuantity;
    if (snapshotDate != null) result.snapshotDate = snapshotDate;
    return result;
  }

  GetResourceInventoryResponse._();

  factory GetResourceInventoryResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetResourceInventoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetResourceInventoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pPM<InventoryLevel>(1, _omitFieldNames ? '' : 'items',
        subBuilder: InventoryLevel.create)
    ..aD(2, _omitFieldNames ? '' : 'totalQuantity')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'snapshotDate',
        subBuilder: $0.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetResourceInventoryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetResourceInventoryResponse copyWith(
          void Function(GetResourceInventoryResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetResourceInventoryResponse))
          as GetResourceInventoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetResourceInventoryResponse create() =>
      GetResourceInventoryResponse._();
  @$core.override
  GetResourceInventoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetResourceInventoryResponse> createRepeated() =>
      $pb.PbList<GetResourceInventoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetResourceInventoryResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetResourceInventoryResponse>(create);
  static GetResourceInventoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<InventoryLevel> get items => $_getList(0);

  @$pb.TagNumber(2)
  $core.double get totalQuantity => $_getN(1);
  @$pb.TagNumber(2)
  set totalQuantity($core.double value) => $_setDouble(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalQuantity() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalQuantity() => $_clearField(2);

  @$pb.TagNumber(3)
  $0.Timestamp get snapshotDate => $_getN(2);
  @$pb.TagNumber(3)
  set snapshotDate($0.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSnapshotDate() => $_has(2);
  @$pb.TagNumber(3)
  void clearSnapshotDate() => $_clearField(3);
  @$pb.TagNumber(3)
  $0.Timestamp ensureSnapshotDate() => $_ensure(2);
}

class GetProductTransactionHistoryRequest extends $pb.GeneratedMessage {
  factory GetProductTransactionHistoryRequest({
    $core.String? productId,
    $core.String? storeId,
    $0.Timestamp? startDate,
    $0.Timestamp? endDate,
    $core.int? pageSize,
    $core.int? pageNumber,
  }) {
    final result = create();
    if (productId != null) result.productId = productId;
    if (storeId != null) result.storeId = storeId;
    if (startDate != null) result.startDate = startDate;
    if (endDate != null) result.endDate = endDate;
    if (pageSize != null) result.pageSize = pageSize;
    if (pageNumber != null) result.pageNumber = pageNumber;
    return result;
  }

  GetProductTransactionHistoryRequest._();

  factory GetProductTransactionHistoryRequest.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProductTransactionHistoryRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProductTransactionHistoryRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'productId')
    ..aOS(2, _omitFieldNames ? '' : 'storeId')
    ..aOM<$0.Timestamp>(3, _omitFieldNames ? '' : 'startDate',
        subBuilder: $0.Timestamp.create)
    ..aOM<$0.Timestamp>(4, _omitFieldNames ? '' : 'endDate',
        subBuilder: $0.Timestamp.create)
    ..aI(5, _omitFieldNames ? '' : 'pageSize')
    ..aI(6, _omitFieldNames ? '' : 'pageNumber')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductTransactionHistoryRequest clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductTransactionHistoryRequest copyWith(
          void Function(GetProductTransactionHistoryRequest) updates) =>
      super.copyWith((message) =>
              updates(message as GetProductTransactionHistoryRequest))
          as GetProductTransactionHistoryRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductTransactionHistoryRequest create() =>
      GetProductTransactionHistoryRequest._();
  @$core.override
  GetProductTransactionHistoryRequest createEmptyInstance() => create();
  static $pb.PbList<GetProductTransactionHistoryRequest> createRepeated() =>
      $pb.PbList<GetProductTransactionHistoryRequest>();
  @$core.pragma('dart2js:noInline')
  static GetProductTransactionHistoryRequest getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetProductTransactionHistoryRequest>(create);
  static GetProductTransactionHistoryRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get productId => $_getSZ(0);
  @$pb.TagNumber(1)
  set productId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasProductId() => $_has(0);
  @$pb.TagNumber(1)
  void clearProductId() => $_clearField(1);

  @$pb.TagNumber(2)
  $core.String get storeId => $_getSZ(1);
  @$pb.TagNumber(2)
  set storeId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasStoreId() => $_has(1);
  @$pb.TagNumber(2)
  void clearStoreId() => $_clearField(2);

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

class GetProductTransactionHistoryResponse extends $pb.GeneratedMessage {
  factory GetProductTransactionHistoryResponse({
    $core.Iterable<$2.InventoryTransaction>? transactions,
    $core.int? totalCount,
  }) {
    final result = create();
    if (transactions != null) result.transactions.addAll(transactions);
    if (totalCount != null) result.totalCount = totalCount;
    return result;
  }

  GetProductTransactionHistoryResponse._();

  factory GetProductTransactionHistoryResponse.fromBuffer(
          $core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetProductTransactionHistoryResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetProductTransactionHistoryResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'inventory.v1'),
      createEmptyInstance: create)
    ..pPM<$2.InventoryTransaction>(1, _omitFieldNames ? '' : 'transactions',
        subBuilder: $2.InventoryTransaction.create)
    ..aI(2, _omitFieldNames ? '' : 'totalCount')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductTransactionHistoryResponse clone() => deepCopy();
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetProductTransactionHistoryResponse copyWith(
          void Function(GetProductTransactionHistoryResponse) updates) =>
      super.copyWith((message) =>
              updates(message as GetProductTransactionHistoryResponse))
          as GetProductTransactionHistoryResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetProductTransactionHistoryResponse create() =>
      GetProductTransactionHistoryResponse._();
  @$core.override
  GetProductTransactionHistoryResponse createEmptyInstance() => create();
  static $pb.PbList<GetProductTransactionHistoryResponse> createRepeated() =>
      $pb.PbList<GetProductTransactionHistoryResponse>();
  @$core.pragma('dart2js:noInline')
  static GetProductTransactionHistoryResponse getDefault() =>
      _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<
          GetProductTransactionHistoryResponse>(create);
  static GetProductTransactionHistoryResponse? _defaultInstance;

  @$pb.TagNumber(1)
  $pb.PbList<$2.InventoryTransaction> get transactions => $_getList(0);

  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);
}

class InventoryServiceApi {
  final $pb.RpcClient _client;

  InventoryServiceApi(this._client);

  /// Gets the inventory levels of a product.
  $async.Future<GetProductInventoryLevelsResponse> getProductInventoryLevels(
          $pb.ClientContext? ctx, GetProductInventoryLevelsRequest request) =>
      _client.invoke<GetProductInventoryLevelsResponse>(
          ctx,
          'InventoryService',
          'GetProductInventoryLevels',
          request,
          GetProductInventoryLevelsResponse());

  /// Checks if a product is available in a warehouse.
  $async.Future<CheckProductAvailabilityResponse> checkProductAvailability(
          $pb.ClientContext? ctx, CheckProductAvailabilityRequest request) =>
      _client.invoke<CheckProductAvailabilityResponse>(
          ctx,
          'InventoryService',
          'CheckProductAvailability',
          request,
          CheckProductAvailabilityResponse());

  /// Gets low stock items for a store.
  $async.Future<GetLowStockItemsResponse> getLowStockItems(
          $pb.ClientContext? ctx, GetLowStockItemsRequest request) =>
      _client.invoke<GetLowStockItemsResponse>(ctx, 'InventoryService',
          'GetLowStockItems', request, GetLowStockItemsResponse());

  /// Gets a snapshot of store inventory.
  $async.Future<GetResourceInventoryResponse> getResourceInventory(
          $pb.ClientContext? ctx, GetResourceInventoryRequest request) =>
      _client.invoke<GetResourceInventoryResponse>(ctx, 'InventoryService',
          'GetResourceInventory', request, GetResourceInventoryResponse());

  /// Gets recent inventory transactions for a store (for dashboard activity).
  $async.Future<GetInventoryTransactionHistoryResponse>
      getRecentInventoryTransactions($pb.ClientContext? ctx,
              GetInventoryTransactionHistoryRequest request) =>
          _client.invoke<GetInventoryTransactionHistoryResponse>(
              ctx,
              'InventoryService',
              'GetRecentInventoryTransactions',
              request,
              GetInventoryTransactionHistoryResponse());

  /// Gets the transaction history of a product.
  $async.Future<GetProductTransactionHistoryResponse>
      getProductTransactionHistory($pb.ClientContext? ctx,
              GetProductTransactionHistoryRequest request) =>
          _client.invoke<GetProductTransactionHistoryResponse>(
              ctx,
              'InventoryService',
              'GetProductTransactionHistory',
              request,
              GetProductTransactionHistoryResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
