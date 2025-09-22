// This is a generated file - do not edit.
//
// Generated from sync/v1/sync.proto.

// @dart = 3.3

// ignore_for_file: annotate_overrides, camel_case_types, comment_references
// ignore_for_file: constant_identifier_names
// ignore_for_file: curly_braces_in_flow_control_structures
// ignore_for_file: deprecated_member_use_from_same_package, library_prefixes
// ignore_for_file: non_constant_identifier_names

import 'dart:async' as $async;
import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import '../../google/protobuf/timestamp.pb.dart' as $2;
import '../../inventory/v1/product.pb.dart' as $0;
import '../../order/v1/order.pb.dart' as $1;
import 'sync.pbenum.dart';

export 'package:protobuf/protobuf.dart' show GeneratedMessageGenericExtensions;

export 'sync.pbenum.dart';

enum SyncOperation_OperationData {
  storeProductData,
  globalProductData,
  productCategoryData,
  orderData,
  jsonData,
  notSet
}

/// A single sync operation
class SyncOperation extends $pb.GeneratedMessage {
  factory SyncOperation({
    $core.String? refId,
    SyncOperationType? operationType,
    SyncEntityType? entityType,
    $core.String? entityId,
    $core.String? storeId,
    $core.String? businessId,
    $core.String? userId,
    $0.StoreProduct? storeProductData,
    $0.GlobalProduct? globalProductData,
    $0.ProductCategory? productCategoryData,
    $1.Order? orderData,
    $core.String? jsonData,
    $2.Timestamp? createdAt,
    $2.Timestamp? updatedAt,
    SyncOperationStatus? status,
    $core.int? retryCount,
    $core.int? maxRetries,
    $2.Timestamp? nextRetryAt,
    $core.String? errorMessage,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
  }) {
    final result = create();
    if (refId != null) result.refId = refId;
    if (operationType != null) result.operationType = operationType;
    if (entityType != null) result.entityType = entityType;
    if (entityId != null) result.entityId = entityId;
    if (storeId != null) result.storeId = storeId;
    if (businessId != null) result.businessId = businessId;
    if (userId != null) result.userId = userId;
    if (storeProductData != null) result.storeProductData = storeProductData;
    if (globalProductData != null) result.globalProductData = globalProductData;
    if (productCategoryData != null)
      result.productCategoryData = productCategoryData;
    if (orderData != null) result.orderData = orderData;
    if (jsonData != null) result.jsonData = jsonData;
    if (createdAt != null) result.createdAt = createdAt;
    if (updatedAt != null) result.updatedAt = updatedAt;
    if (status != null) result.status = status;
    if (retryCount != null) result.retryCount = retryCount;
    if (maxRetries != null) result.maxRetries = maxRetries;
    if (nextRetryAt != null) result.nextRetryAt = nextRetryAt;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (metadata != null) result.metadata.addEntries(metadata);
    return result;
  }

  SyncOperation._();

  factory SyncOperation.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncOperation.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static const $core.Map<$core.int, SyncOperation_OperationData>
      _SyncOperation_OperationDataByTag = {
    10: SyncOperation_OperationData.storeProductData,
    11: SyncOperation_OperationData.globalProductData,
    12: SyncOperation_OperationData.productCategoryData,
    13: SyncOperation_OperationData.orderData,
    40: SyncOperation_OperationData.jsonData,
    0: SyncOperation_OperationData.notSet
  };
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncOperation',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..oo(0, [10, 11, 12, 13, 40])
    ..aOS(1, _omitFieldNames ? '' : 'refId')
    ..e<SyncOperationType>(
        2, _omitFieldNames ? '' : 'operationType', $pb.PbFieldType.OE,
        defaultOrMaker: SyncOperationType.SYNC_OPERATION_TYPE_UNSPECIFIED,
        valueOf: SyncOperationType.valueOf,
        enumValues: SyncOperationType.values)
    ..e<SyncEntityType>(
        3, _omitFieldNames ? '' : 'entityType', $pb.PbFieldType.OE,
        defaultOrMaker: SyncEntityType.SYNC_ENTITY_TYPE_UNSPECIFIED,
        valueOf: SyncEntityType.valueOf,
        enumValues: SyncEntityType.values)
    ..aOS(4, _omitFieldNames ? '' : 'entityId')
    ..aOS(5, _omitFieldNames ? '' : 'storeId')
    ..aOS(6, _omitFieldNames ? '' : 'businessId')
    ..aOS(7, _omitFieldNames ? '' : 'userId')
    ..aOM<$0.StoreProduct>(10, _omitFieldNames ? '' : 'storeProductData',
        subBuilder: $0.StoreProduct.create)
    ..aOM<$0.GlobalProduct>(11, _omitFieldNames ? '' : 'globalProductData',
        subBuilder: $0.GlobalProduct.create)
    ..aOM<$0.ProductCategory>(12, _omitFieldNames ? '' : 'productCategoryData',
        subBuilder: $0.ProductCategory.create)
    ..aOM<$1.Order>(13, _omitFieldNames ? '' : 'orderData',
        subBuilder: $1.Order.create)
    ..aOS(40, _omitFieldNames ? '' : 'jsonData')
    ..aOM<$2.Timestamp>(41, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $2.Timestamp.create)
    ..aOM<$2.Timestamp>(42, _omitFieldNames ? '' : 'updatedAt',
        subBuilder: $2.Timestamp.create)
    ..e<SyncOperationStatus>(
        43, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: SyncOperationStatus.SYNC_OPERATION_STATUS_UNSPECIFIED,
        valueOf: SyncOperationStatus.valueOf,
        enumValues: SyncOperationStatus.values)
    ..a<$core.int>(44, _omitFieldNames ? '' : 'retryCount', $pb.PbFieldType.O3)
    ..a<$core.int>(45, _omitFieldNames ? '' : 'maxRetries', $pb.PbFieldType.O3)
    ..aOM<$2.Timestamp>(46, _omitFieldNames ? '' : 'nextRetryAt',
        subBuilder: $2.Timestamp.create)
    ..aOS(47, _omitFieldNames ? '' : 'errorMessage')
    ..m<$core.String, $core.String>(48, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'SyncOperation.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('sync.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperation clone() => SyncOperation()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperation copyWith(void Function(SyncOperation) updates) =>
      super.copyWith((message) => updates(message as SyncOperation))
          as SyncOperation;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncOperation create() => SyncOperation._();
  @$core.override
  SyncOperation createEmptyInstance() => create();
  static $pb.PbList<SyncOperation> createRepeated() =>
      $pb.PbList<SyncOperation>();
  @$core.pragma('dart2js:noInline')
  static SyncOperation getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncOperation>(create);
  static SyncOperation? _defaultInstance;

  SyncOperation_OperationData whichOperationData() =>
      _SyncOperation_OperationDataByTag[$_whichOneof(0)]!;
  void clearOperationData() => $_clearField($_whichOneof(0));

  /// Unique identifier for the operation
  @$pb.TagNumber(1)
  $core.String get refId => $_getSZ(0);
  @$pb.TagNumber(1)
  set refId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasRefId() => $_has(0);
  @$pb.TagNumber(1)
  void clearRefId() => $_clearField(1);

  /// Type of operation (create, update, delete)
  @$pb.TagNumber(2)
  SyncOperationType get operationType => $_getN(1);
  @$pb.TagNumber(2)
  set operationType(SyncOperationType value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasOperationType() => $_has(1);
  @$pb.TagNumber(2)
  void clearOperationType() => $_clearField(2);

  /// Type of entity being synchronized
  @$pb.TagNumber(3)
  SyncEntityType get entityType => $_getN(2);
  @$pb.TagNumber(3)
  set entityType(SyncEntityType value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasEntityType() => $_has(2);
  @$pb.TagNumber(3)
  void clearEntityType() => $_clearField(3);

  /// Unique identifier of the entity
  @$pb.TagNumber(4)
  $core.String get entityId => $_getSZ(3);
  @$pb.TagNumber(4)
  set entityId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasEntityId() => $_has(3);
  @$pb.TagNumber(4)
  void clearEntityId() => $_clearField(4);

  /// Store ID (if applicable)
  @$pb.TagNumber(5)
  $core.String get storeId => $_getSZ(4);
  @$pb.TagNumber(5)
  set storeId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasStoreId() => $_has(4);
  @$pb.TagNumber(5)
  void clearStoreId() => $_clearField(5);

  /// Business ID (if applicable)
  @$pb.TagNumber(6)
  $core.String get businessId => $_getSZ(5);
  @$pb.TagNumber(6)
  set businessId($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasBusinessId() => $_has(5);
  @$pb.TagNumber(6)
  void clearBusinessId() => $_clearField(6);

  /// User ID who performed the operation
  @$pb.TagNumber(7)
  $core.String get userId => $_getSZ(6);
  @$pb.TagNumber(7)
  set userId($core.String value) => $_setString(6, value);
  @$pb.TagNumber(7)
  $core.bool hasUserId() => $_has(6);
  @$pb.TagNumber(7)
  void clearUserId() => $_clearField(7);

  /// Store product data
  @$pb.TagNumber(10)
  $0.StoreProduct get storeProductData => $_getN(7);
  @$pb.TagNumber(10)
  set storeProductData($0.StoreProduct value) => $_setField(10, value);
  @$pb.TagNumber(10)
  $core.bool hasStoreProductData() => $_has(7);
  @$pb.TagNumber(10)
  void clearStoreProductData() => $_clearField(10);
  @$pb.TagNumber(10)
  $0.StoreProduct ensureStoreProductData() => $_ensure(7);

  /// Global product data
  @$pb.TagNumber(11)
  $0.GlobalProduct get globalProductData => $_getN(8);
  @$pb.TagNumber(11)
  set globalProductData($0.GlobalProduct value) => $_setField(11, value);
  @$pb.TagNumber(11)
  $core.bool hasGlobalProductData() => $_has(8);
  @$pb.TagNumber(11)
  void clearGlobalProductData() => $_clearField(11);
  @$pb.TagNumber(11)
  $0.GlobalProduct ensureGlobalProductData() => $_ensure(8);

  /// Product category data
  @$pb.TagNumber(12)
  $0.ProductCategory get productCategoryData => $_getN(9);
  @$pb.TagNumber(12)
  set productCategoryData($0.ProductCategory value) => $_setField(12, value);
  @$pb.TagNumber(12)
  $core.bool hasProductCategoryData() => $_has(9);
  @$pb.TagNumber(12)
  void clearProductCategoryData() => $_clearField(12);
  @$pb.TagNumber(12)
  $0.ProductCategory ensureProductCategoryData() => $_ensure(9);

  /// Order data
  @$pb.TagNumber(13)
  $1.Order get orderData => $_getN(10);
  @$pb.TagNumber(13)
  set orderData($1.Order value) => $_setField(13, value);
  @$pb.TagNumber(13)
  $core.bool hasOrderData() => $_has(10);
  @$pb.TagNumber(13)
  void clearOrderData() => $_clearField(13);
  @$pb.TagNumber(13)
  $1.Order ensureOrderData() => $_ensure(10);

  /// Generic JSON data for other entities
  @$pb.TagNumber(40)
  $core.String get jsonData => $_getSZ(11);
  @$pb.TagNumber(40)
  set jsonData($core.String value) => $_setString(11, value);
  @$pb.TagNumber(40)
  $core.bool hasJsonData() => $_has(11);
  @$pb.TagNumber(40)
  void clearJsonData() => $_clearField(40);

  /// Timestamp when operation was created
  @$pb.TagNumber(41)
  $2.Timestamp get createdAt => $_getN(12);
  @$pb.TagNumber(41)
  set createdAt($2.Timestamp value) => $_setField(41, value);
  @$pb.TagNumber(41)
  $core.bool hasCreatedAt() => $_has(12);
  @$pb.TagNumber(41)
  void clearCreatedAt() => $_clearField(41);
  @$pb.TagNumber(41)
  $2.Timestamp ensureCreatedAt() => $_ensure(12);

  /// Timestamp when operation was last updated
  @$pb.TagNumber(42)
  $2.Timestamp get updatedAt => $_getN(13);
  @$pb.TagNumber(42)
  set updatedAt($2.Timestamp value) => $_setField(42, value);
  @$pb.TagNumber(42)
  $core.bool hasUpdatedAt() => $_has(13);
  @$pb.TagNumber(42)
  void clearUpdatedAt() => $_clearField(42);
  @$pb.TagNumber(42)
  $2.Timestamp ensureUpdatedAt() => $_ensure(13);

  /// Current status of the operation
  @$pb.TagNumber(43)
  SyncOperationStatus get status => $_getN(14);
  @$pb.TagNumber(43)
  set status(SyncOperationStatus value) => $_setField(43, value);
  @$pb.TagNumber(43)
  $core.bool hasStatus() => $_has(14);
  @$pb.TagNumber(43)
  void clearStatus() => $_clearField(43);

  /// Number of retry attempts
  @$pb.TagNumber(44)
  $core.int get retryCount => $_getIZ(15);
  @$pb.TagNumber(44)
  set retryCount($core.int value) => $_setSignedInt32(15, value);
  @$pb.TagNumber(44)
  $core.bool hasRetryCount() => $_has(15);
  @$pb.TagNumber(44)
  void clearRetryCount() => $_clearField(44);

  /// Maximum number of retries allowed
  @$pb.TagNumber(45)
  $core.int get maxRetries => $_getIZ(16);
  @$pb.TagNumber(45)
  set maxRetries($core.int value) => $_setSignedInt32(16, value);
  @$pb.TagNumber(45)
  $core.bool hasMaxRetries() => $_has(16);
  @$pb.TagNumber(45)
  void clearMaxRetries() => $_clearField(45);

  /// Next retry timestamp (if applicable)
  @$pb.TagNumber(46)
  $2.Timestamp get nextRetryAt => $_getN(17);
  @$pb.TagNumber(46)
  set nextRetryAt($2.Timestamp value) => $_setField(46, value);
  @$pb.TagNumber(46)
  $core.bool hasNextRetryAt() => $_has(17);
  @$pb.TagNumber(46)
  void clearNextRetryAt() => $_clearField(46);
  @$pb.TagNumber(46)
  $2.Timestamp ensureNextRetryAt() => $_ensure(17);

  /// Error message (if operation failed)
  @$pb.TagNumber(47)
  $core.String get errorMessage => $_getSZ(18);
  @$pb.TagNumber(47)
  set errorMessage($core.String value) => $_setString(18, value);
  @$pb.TagNumber(47)
  $core.bool hasErrorMessage() => $_has(18);
  @$pb.TagNumber(47)
  void clearErrorMessage() => $_clearField(47);

  /// Additional metadata
  @$pb.TagNumber(48)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(19);
}

/// Batch of sync operations
class SyncOperationBatch extends $pb.GeneratedMessage {
  factory SyncOperationBatch({
    $core.String? batchId,
    $core.Iterable<SyncOperation>? operations,
    $core.String? storeId,
    $core.String? businessId,
    $core.String? userId,
    $2.Timestamp? createdAt,
    $core.int? totalOperations,
    $core.int? successfulOperations,
    $core.int? failedOperations,
    $core.Iterable<$core.MapEntry<$core.String, $core.String>>? metadata,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    if (operations != null) result.operations.addAll(operations);
    if (storeId != null) result.storeId = storeId;
    if (businessId != null) result.businessId = businessId;
    if (userId != null) result.userId = userId;
    if (createdAt != null) result.createdAt = createdAt;
    if (totalOperations != null) result.totalOperations = totalOperations;
    if (successfulOperations != null)
      result.successfulOperations = successfulOperations;
    if (failedOperations != null) result.failedOperations = failedOperations;
    if (metadata != null) result.metadata.addEntries(metadata);
    return result;
  }

  SyncOperationBatch._();

  factory SyncOperationBatch.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncOperationBatch.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncOperationBatch',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..pc<SyncOperation>(
        2, _omitFieldNames ? '' : 'operations', $pb.PbFieldType.PM,
        subBuilder: SyncOperation.create)
    ..aOS(3, _omitFieldNames ? '' : 'storeId')
    ..aOS(4, _omitFieldNames ? '' : 'businessId')
    ..aOS(5, _omitFieldNames ? '' : 'userId')
    ..aOM<$2.Timestamp>(6, _omitFieldNames ? '' : 'createdAt',
        subBuilder: $2.Timestamp.create)
    ..a<$core.int>(
        7, _omitFieldNames ? '' : 'totalOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        8, _omitFieldNames ? '' : 'successfulOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        9, _omitFieldNames ? '' : 'failedOperations', $pb.PbFieldType.O3)
    ..m<$core.String, $core.String>(10, _omitFieldNames ? '' : 'metadata',
        entryClassName: 'SyncOperationBatch.MetadataEntry',
        keyFieldType: $pb.PbFieldType.OS,
        valueFieldType: $pb.PbFieldType.OS,
        packageName: const $pb.PackageName('sync.v1'))
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperationBatch clone() => SyncOperationBatch()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperationBatch copyWith(void Function(SyncOperationBatch) updates) =>
      super.copyWith((message) => updates(message as SyncOperationBatch))
          as SyncOperationBatch;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncOperationBatch create() => SyncOperationBatch._();
  @$core.override
  SyncOperationBatch createEmptyInstance() => create();
  static $pb.PbList<SyncOperationBatch> createRepeated() =>
      $pb.PbList<SyncOperationBatch>();
  @$core.pragma('dart2js:noInline')
  static SyncOperationBatch getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncOperationBatch>(create);
  static SyncOperationBatch? _defaultInstance;

  /// Unique identifier for the batch
  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);

  /// List of operations in this batch
  @$pb.TagNumber(2)
  $pb.PbList<SyncOperation> get operations => $_getList(1);

  /// Store ID for all operations in this batch
  @$pb.TagNumber(3)
  $core.String get storeId => $_getSZ(2);
  @$pb.TagNumber(3)
  set storeId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasStoreId() => $_has(2);
  @$pb.TagNumber(3)
  void clearStoreId() => $_clearField(3);

  /// Business ID for all operations in this batch
  @$pb.TagNumber(4)
  $core.String get businessId => $_getSZ(3);
  @$pb.TagNumber(4)
  set businessId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBusinessId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBusinessId() => $_clearField(4);

  /// User ID who created this batch
  @$pb.TagNumber(5)
  $core.String get userId => $_getSZ(4);
  @$pb.TagNumber(5)
  set userId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasUserId() => $_has(4);
  @$pb.TagNumber(5)
  void clearUserId() => $_clearField(5);

  /// Timestamp when batch was created
  @$pb.TagNumber(6)
  $2.Timestamp get createdAt => $_getN(5);
  @$pb.TagNumber(6)
  set createdAt($2.Timestamp value) => $_setField(6, value);
  @$pb.TagNumber(6)
  $core.bool hasCreatedAt() => $_has(5);
  @$pb.TagNumber(6)
  void clearCreatedAt() => $_clearField(6);
  @$pb.TagNumber(6)
  $2.Timestamp ensureCreatedAt() => $_ensure(5);

  /// Total number of operations in batch
  @$pb.TagNumber(7)
  $core.int get totalOperations => $_getIZ(6);
  @$pb.TagNumber(7)
  set totalOperations($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasTotalOperations() => $_has(6);
  @$pb.TagNumber(7)
  void clearTotalOperations() => $_clearField(7);

  /// Number of successful operations
  @$pb.TagNumber(8)
  $core.int get successfulOperations => $_getIZ(7);
  @$pb.TagNumber(8)
  set successfulOperations($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasSuccessfulOperations() => $_has(7);
  @$pb.TagNumber(8)
  void clearSuccessfulOperations() => $_clearField(8);

  /// Number of failed operations
  @$pb.TagNumber(9)
  $core.int get failedOperations => $_getIZ(8);
  @$pb.TagNumber(9)
  set failedOperations($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasFailedOperations() => $_has(8);
  @$pb.TagNumber(9)
  void clearFailedOperations() => $_clearField(9);

  /// Batch metadata
  @$pb.TagNumber(10)
  $pb.PbMap<$core.String, $core.String> get metadata => $_getMap(9);
}

/// Request to submit sync operations
class SubmitSyncOperationsRequest extends $pb.GeneratedMessage {
  factory SubmitSyncOperationsRequest({
    $core.String? storeId,
    $core.String? businessId,
    $core.String? userId,
    $core.Iterable<SyncOperation>? operations,
    $core.String? deviceId,
    $core.String? appVersion,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (businessId != null) result.businessId = businessId;
    if (userId != null) result.userId = userId;
    if (operations != null) result.operations.addAll(operations);
    if (deviceId != null) result.deviceId = deviceId;
    if (appVersion != null) result.appVersion = appVersion;
    return result;
  }

  SubmitSyncOperationsRequest._();

  factory SubmitSyncOperationsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitSyncOperationsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitSyncOperationsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..pc<SyncOperation>(
        4, _omitFieldNames ? '' : 'operations', $pb.PbFieldType.PM,
        subBuilder: SyncOperation.create)
    ..aOS(5, _omitFieldNames ? '' : 'deviceId')
    ..aOS(6, _omitFieldNames ? '' : 'appVersion')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSyncOperationsRequest clone() =>
      SubmitSyncOperationsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSyncOperationsRequest copyWith(
          void Function(SubmitSyncOperationsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitSyncOperationsRequest))
          as SubmitSyncOperationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitSyncOperationsRequest create() =>
      SubmitSyncOperationsRequest._();
  @$core.override
  SubmitSyncOperationsRequest createEmptyInstance() => create();
  static $pb.PbList<SubmitSyncOperationsRequest> createRepeated() =>
      $pb.PbList<SubmitSyncOperationsRequest>();
  @$core.pragma('dart2js:noInline')
  static SubmitSyncOperationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitSyncOperationsRequest>(create);
  static SubmitSyncOperationsRequest? _defaultInstance;

  /// Store ID
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// Business ID
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// User ID
  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  /// List of operations to submit
  @$pb.TagNumber(4)
  $pb.PbList<SyncOperation> get operations => $_getList(3);

  /// Client device identifier
  @$pb.TagNumber(5)
  $core.String get deviceId => $_getSZ(4);
  @$pb.TagNumber(5)
  set deviceId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasDeviceId() => $_has(4);
  @$pb.TagNumber(5)
  void clearDeviceId() => $_clearField(5);

  /// Client application version
  @$pb.TagNumber(6)
  $core.String get appVersion => $_getSZ(5);
  @$pb.TagNumber(6)
  set appVersion($core.String value) => $_setString(5, value);
  @$pb.TagNumber(6)
  $core.bool hasAppVersion() => $_has(5);
  @$pb.TagNumber(6)
  void clearAppVersion() => $_clearField(6);
}

/// Response to submit sync operations
class SubmitSyncOperationsResponse extends $pb.GeneratedMessage {
  factory SubmitSyncOperationsResponse({
    $core.String? batchId,
    $core.Iterable<SyncOperationResult>? operationResults,
    SyncOperationStatus? batchStatus,
    $2.Timestamp? processedAt,
  }) {
    final result = create();
    if (batchId != null) result.batchId = batchId;
    if (operationResults != null)
      result.operationResults.addAll(operationResults);
    if (batchStatus != null) result.batchStatus = batchStatus;
    if (processedAt != null) result.processedAt = processedAt;
    return result;
  }

  SubmitSyncOperationsResponse._();

  factory SubmitSyncOperationsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SubmitSyncOperationsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SubmitSyncOperationsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'batchId')
    ..pc<SyncOperationResult>(
        2, _omitFieldNames ? '' : 'operationResults', $pb.PbFieldType.PM,
        subBuilder: SyncOperationResult.create)
    ..e<SyncOperationStatus>(
        3, _omitFieldNames ? '' : 'batchStatus', $pb.PbFieldType.OE,
        defaultOrMaker: SyncOperationStatus.SYNC_OPERATION_STATUS_UNSPECIFIED,
        valueOf: SyncOperationStatus.valueOf,
        enumValues: SyncOperationStatus.values)
    ..aOM<$2.Timestamp>(4, _omitFieldNames ? '' : 'processedAt',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSyncOperationsResponse clone() =>
      SubmitSyncOperationsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SubmitSyncOperationsResponse copyWith(
          void Function(SubmitSyncOperationsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as SubmitSyncOperationsResponse))
          as SubmitSyncOperationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SubmitSyncOperationsResponse create() =>
      SubmitSyncOperationsResponse._();
  @$core.override
  SubmitSyncOperationsResponse createEmptyInstance() => create();
  static $pb.PbList<SubmitSyncOperationsResponse> createRepeated() =>
      $pb.PbList<SubmitSyncOperationsResponse>();
  @$core.pragma('dart2js:noInline')
  static SubmitSyncOperationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SubmitSyncOperationsResponse>(create);
  static SubmitSyncOperationsResponse? _defaultInstance;

  /// Batch ID for submitted operations
  @$pb.TagNumber(1)
  $core.String get batchId => $_getSZ(0);
  @$pb.TagNumber(1)
  set batchId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasBatchId() => $_has(0);
  @$pb.TagNumber(1)
  void clearBatchId() => $_clearField(1);

  /// List of operation results
  @$pb.TagNumber(2)
  $pb.PbList<SyncOperationResult> get operationResults => $_getList(1);

  /// Overall batch status
  @$pb.TagNumber(3)
  SyncOperationStatus get batchStatus => $_getN(2);
  @$pb.TagNumber(3)
  set batchStatus(SyncOperationStatus value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasBatchStatus() => $_has(2);
  @$pb.TagNumber(3)
  void clearBatchStatus() => $_clearField(3);

  /// Timestamp when batch was processed
  @$pb.TagNumber(4)
  $2.Timestamp get processedAt => $_getN(3);
  @$pb.TagNumber(4)
  set processedAt($2.Timestamp value) => $_setField(4, value);
  @$pb.TagNumber(4)
  $core.bool hasProcessedAt() => $_has(3);
  @$pb.TagNumber(4)
  void clearProcessedAt() => $_clearField(4);
  @$pb.TagNumber(4)
  $2.Timestamp ensureProcessedAt() => $_ensure(3);
}

/// Result of a single sync operation
class SyncOperationResult extends $pb.GeneratedMessage {
  factory SyncOperationResult({
    $core.String? operationId,
    SyncOperationStatus? status,
    $core.String? errorMessage,
    $core.String? serverEntityId,
    $2.Timestamp? processedAt,
  }) {
    final result = create();
    if (operationId != null) result.operationId = operationId;
    if (status != null) result.status = status;
    if (errorMessage != null) result.errorMessage = errorMessage;
    if (serverEntityId != null) result.serverEntityId = serverEntityId;
    if (processedAt != null) result.processedAt = processedAt;
    return result;
  }

  SyncOperationResult._();

  factory SyncOperationResult.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncOperationResult.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncOperationResult',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'operationId')
    ..e<SyncOperationStatus>(
        2, _omitFieldNames ? '' : 'status', $pb.PbFieldType.OE,
        defaultOrMaker: SyncOperationStatus.SYNC_OPERATION_STATUS_UNSPECIFIED,
        valueOf: SyncOperationStatus.valueOf,
        enumValues: SyncOperationStatus.values)
    ..aOS(3, _omitFieldNames ? '' : 'errorMessage')
    ..aOS(4, _omitFieldNames ? '' : 'serverEntityId')
    ..aOM<$2.Timestamp>(5, _omitFieldNames ? '' : 'processedAt',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperationResult clone() => SyncOperationResult()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperationResult copyWith(void Function(SyncOperationResult) updates) =>
      super.copyWith((message) => updates(message as SyncOperationResult))
          as SyncOperationResult;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncOperationResult create() => SyncOperationResult._();
  @$core.override
  SyncOperationResult createEmptyInstance() => create();
  static $pb.PbList<SyncOperationResult> createRepeated() =>
      $pb.PbList<SyncOperationResult>();
  @$core.pragma('dart2js:noInline')
  static SyncOperationResult getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncOperationResult>(create);
  static SyncOperationResult? _defaultInstance;

  /// Operation ID
  @$pb.TagNumber(1)
  $core.String get operationId => $_getSZ(0);
  @$pb.TagNumber(1)
  set operationId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOperationId() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperationId() => $_clearField(1);

  /// Result status
  @$pb.TagNumber(2)
  SyncOperationStatus get status => $_getN(1);
  @$pb.TagNumber(2)
  set status(SyncOperationStatus value) => $_setField(2, value);
  @$pb.TagNumber(2)
  $core.bool hasStatus() => $_has(1);
  @$pb.TagNumber(2)
  void clearStatus() => $_clearField(2);

  /// Error message (if failed)
  @$pb.TagNumber(3)
  $core.String get errorMessage => $_getSZ(2);
  @$pb.TagNumber(3)
  set errorMessage($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasErrorMessage() => $_has(2);
  @$pb.TagNumber(3)
  void clearErrorMessage() => $_clearField(3);

  /// Server-side entity ID (if different from client)
  @$pb.TagNumber(4)
  $core.String get serverEntityId => $_getSZ(3);
  @$pb.TagNumber(4)
  set serverEntityId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasServerEntityId() => $_has(3);
  @$pb.TagNumber(4)
  void clearServerEntityId() => $_clearField(4);

  /// Timestamp when operation was processed
  @$pb.TagNumber(5)
  $2.Timestamp get processedAt => $_getN(4);
  @$pb.TagNumber(5)
  set processedAt($2.Timestamp value) => $_setField(5, value);
  @$pb.TagNumber(5)
  $core.bool hasProcessedAt() => $_has(4);
  @$pb.TagNumber(5)
  void clearProcessedAt() => $_clearField(5);
  @$pb.TagNumber(5)
  $2.Timestamp ensureProcessedAt() => $_ensure(4);
}

/// Request to get sync operations status
class GetSyncOperationsStatusRequest extends $pb.GeneratedMessage {
  factory GetSyncOperationsStatusRequest({
    $core.String? storeId,
    $core.String? businessId,
    $core.String? userId,
    $core.String? batchId,
    $core.Iterable<$core.String>? operationIds,
    $core.Iterable<SyncOperationStatus>? statusFilter,
    $core.Iterable<SyncEntityType>? entityTypeFilter,
    $core.int? limit,
    $core.int? offset,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (businessId != null) result.businessId = businessId;
    if (userId != null) result.userId = userId;
    if (batchId != null) result.batchId = batchId;
    if (operationIds != null) result.operationIds.addAll(operationIds);
    if (statusFilter != null) result.statusFilter.addAll(statusFilter);
    if (entityTypeFilter != null)
      result.entityTypeFilter.addAll(entityTypeFilter);
    if (limit != null) result.limit = limit;
    if (offset != null) result.offset = offset;
    return result;
  }

  GetSyncOperationsStatusRequest._();

  factory GetSyncOperationsStatusRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSyncOperationsStatusRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSyncOperationsStatusRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..aOS(4, _omitFieldNames ? '' : 'batchId')
    ..pPS(5, _omitFieldNames ? '' : 'operationIds')
    ..pc<SyncOperationStatus>(
        6, _omitFieldNames ? '' : 'statusFilter', $pb.PbFieldType.KE,
        valueOf: SyncOperationStatus.valueOf,
        enumValues: SyncOperationStatus.values,
        defaultEnumValue: SyncOperationStatus.SYNC_OPERATION_STATUS_UNSPECIFIED)
    ..pc<SyncEntityType>(
        7, _omitFieldNames ? '' : 'entityTypeFilter', $pb.PbFieldType.KE,
        valueOf: SyncEntityType.valueOf,
        enumValues: SyncEntityType.values,
        defaultEnumValue: SyncEntityType.SYNC_ENTITY_TYPE_UNSPECIFIED)
    ..a<$core.int>(8, _omitFieldNames ? '' : 'limit', $pb.PbFieldType.O3)
    ..a<$core.int>(9, _omitFieldNames ? '' : 'offset', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncOperationsStatusRequest clone() =>
      GetSyncOperationsStatusRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncOperationsStatusRequest copyWith(
          void Function(GetSyncOperationsStatusRequest) updates) =>
      super.copyWith(
              (message) => updates(message as GetSyncOperationsStatusRequest))
          as GetSyncOperationsStatusRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSyncOperationsStatusRequest create() =>
      GetSyncOperationsStatusRequest._();
  @$core.override
  GetSyncOperationsStatusRequest createEmptyInstance() => create();
  static $pb.PbList<GetSyncOperationsStatusRequest> createRepeated() =>
      $pb.PbList<GetSyncOperationsStatusRequest>();
  @$core.pragma('dart2js:noInline')
  static GetSyncOperationsStatusRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSyncOperationsStatusRequest>(create);
  static GetSyncOperationsStatusRequest? _defaultInstance;

  /// Store ID
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// Business ID
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// User ID
  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  /// Batch ID to check status for
  @$pb.TagNumber(4)
  $core.String get batchId => $_getSZ(3);
  @$pb.TagNumber(4)
  set batchId($core.String value) => $_setString(3, value);
  @$pb.TagNumber(4)
  $core.bool hasBatchId() => $_has(3);
  @$pb.TagNumber(4)
  void clearBatchId() => $_clearField(4);

  /// List of operation IDs to check
  @$pb.TagNumber(5)
  $pb.PbList<$core.String> get operationIds => $_getList(4);

  /// Filter by status
  @$pb.TagNumber(6)
  $pb.PbList<SyncOperationStatus> get statusFilter => $_getList(5);

  /// Filter by entity type
  @$pb.TagNumber(7)
  $pb.PbList<SyncEntityType> get entityTypeFilter => $_getList(6);

  /// Maximum number of results
  @$pb.TagNumber(8)
  $core.int get limit => $_getIZ(7);
  @$pb.TagNumber(8)
  set limit($core.int value) => $_setSignedInt32(7, value);
  @$pb.TagNumber(8)
  $core.bool hasLimit() => $_has(7);
  @$pb.TagNumber(8)
  void clearLimit() => $_clearField(8);

  /// Offset for pagination
  @$pb.TagNumber(9)
  $core.int get offset => $_getIZ(8);
  @$pb.TagNumber(9)
  set offset($core.int value) => $_setSignedInt32(8, value);
  @$pb.TagNumber(9)
  $core.bool hasOffset() => $_has(8);
  @$pb.TagNumber(9)
  void clearOffset() => $_clearField(9);
}

/// Response with sync operations status
class GetSyncOperationsStatusResponse extends $pb.GeneratedMessage {
  factory GetSyncOperationsStatusResponse({
    $core.Iterable<SyncOperation>? operations,
    $core.int? totalCount,
    SyncOperationsSummary? summary,
  }) {
    final result = create();
    if (operations != null) result.operations.addAll(operations);
    if (totalCount != null) result.totalCount = totalCount;
    if (summary != null) result.summary = summary;
    return result;
  }

  GetSyncOperationsStatusResponse._();

  factory GetSyncOperationsStatusResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory GetSyncOperationsStatusResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'GetSyncOperationsStatusResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..pc<SyncOperation>(
        1, _omitFieldNames ? '' : 'operations', $pb.PbFieldType.PM,
        subBuilder: SyncOperation.create)
    ..a<$core.int>(2, _omitFieldNames ? '' : 'totalCount', $pb.PbFieldType.O3)
    ..aOM<SyncOperationsSummary>(3, _omitFieldNames ? '' : 'summary',
        subBuilder: SyncOperationsSummary.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncOperationsStatusResponse clone() =>
      GetSyncOperationsStatusResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  GetSyncOperationsStatusResponse copyWith(
          void Function(GetSyncOperationsStatusResponse) updates) =>
      super.copyWith(
              (message) => updates(message as GetSyncOperationsStatusResponse))
          as GetSyncOperationsStatusResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static GetSyncOperationsStatusResponse create() =>
      GetSyncOperationsStatusResponse._();
  @$core.override
  GetSyncOperationsStatusResponse createEmptyInstance() => create();
  static $pb.PbList<GetSyncOperationsStatusResponse> createRepeated() =>
      $pb.PbList<GetSyncOperationsStatusResponse>();
  @$core.pragma('dart2js:noInline')
  static GetSyncOperationsStatusResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<GetSyncOperationsStatusResponse>(
          create);
  static GetSyncOperationsStatusResponse? _defaultInstance;

  /// List of operations with their current status
  @$pb.TagNumber(1)
  $pb.PbList<SyncOperation> get operations => $_getList(0);

  /// Total number of operations matching the filter
  @$pb.TagNumber(2)
  $core.int get totalCount => $_getIZ(1);
  @$pb.TagNumber(2)
  set totalCount($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasTotalCount() => $_has(1);
  @$pb.TagNumber(2)
  void clearTotalCount() => $_clearField(2);

  /// Summary statistics
  @$pb.TagNumber(3)
  SyncOperationsSummary get summary => $_getN(2);
  @$pb.TagNumber(3)
  set summary(SyncOperationsSummary value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasSummary() => $_has(2);
  @$pb.TagNumber(3)
  void clearSummary() => $_clearField(3);
  @$pb.TagNumber(3)
  SyncOperationsSummary ensureSummary() => $_ensure(2);
}

/// Summary of sync operations
class SyncOperationsSummary extends $pb.GeneratedMessage {
  factory SyncOperationsSummary({
    $core.int? totalOperations,
    $core.int? pendingOperations,
    $core.int? inProgressOperations,
    $core.int? successfulOperations,
    $core.int? failedOperations,
    $core.int? retryingOperations,
    $core.int? abandonedOperations,
  }) {
    final result = create();
    if (totalOperations != null) result.totalOperations = totalOperations;
    if (pendingOperations != null) result.pendingOperations = pendingOperations;
    if (inProgressOperations != null)
      result.inProgressOperations = inProgressOperations;
    if (successfulOperations != null)
      result.successfulOperations = successfulOperations;
    if (failedOperations != null) result.failedOperations = failedOperations;
    if (retryingOperations != null)
      result.retryingOperations = retryingOperations;
    if (abandonedOperations != null)
      result.abandonedOperations = abandonedOperations;
    return result;
  }

  SyncOperationsSummary._();

  factory SyncOperationsSummary.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory SyncOperationsSummary.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'SyncOperationsSummary',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'totalOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        2, _omitFieldNames ? '' : 'pendingOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        3, _omitFieldNames ? '' : 'inProgressOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        4, _omitFieldNames ? '' : 'successfulOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        5, _omitFieldNames ? '' : 'failedOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        6, _omitFieldNames ? '' : 'retryingOperations', $pb.PbFieldType.O3)
    ..a<$core.int>(
        7, _omitFieldNames ? '' : 'abandonedOperations', $pb.PbFieldType.O3)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperationsSummary clone() =>
      SyncOperationsSummary()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  SyncOperationsSummary copyWith(
          void Function(SyncOperationsSummary) updates) =>
      super.copyWith((message) => updates(message as SyncOperationsSummary))
          as SyncOperationsSummary;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static SyncOperationsSummary create() => SyncOperationsSummary._();
  @$core.override
  SyncOperationsSummary createEmptyInstance() => create();
  static $pb.PbList<SyncOperationsSummary> createRepeated() =>
      $pb.PbList<SyncOperationsSummary>();
  @$core.pragma('dart2js:noInline')
  static SyncOperationsSummary getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<SyncOperationsSummary>(create);
  static SyncOperationsSummary? _defaultInstance;

  /// Total operations
  @$pb.TagNumber(1)
  $core.int get totalOperations => $_getIZ(0);
  @$pb.TagNumber(1)
  set totalOperations($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasTotalOperations() => $_has(0);
  @$pb.TagNumber(1)
  void clearTotalOperations() => $_clearField(1);

  /// Pending operations
  @$pb.TagNumber(2)
  $core.int get pendingOperations => $_getIZ(1);
  @$pb.TagNumber(2)
  set pendingOperations($core.int value) => $_setSignedInt32(1, value);
  @$pb.TagNumber(2)
  $core.bool hasPendingOperations() => $_has(1);
  @$pb.TagNumber(2)
  void clearPendingOperations() => $_clearField(2);

  /// In progress operations
  @$pb.TagNumber(3)
  $core.int get inProgressOperations => $_getIZ(2);
  @$pb.TagNumber(3)
  set inProgressOperations($core.int value) => $_setSignedInt32(2, value);
  @$pb.TagNumber(3)
  $core.bool hasInProgressOperations() => $_has(2);
  @$pb.TagNumber(3)
  void clearInProgressOperations() => $_clearField(3);

  /// Successful operations
  @$pb.TagNumber(4)
  $core.int get successfulOperations => $_getIZ(3);
  @$pb.TagNumber(4)
  set successfulOperations($core.int value) => $_setSignedInt32(3, value);
  @$pb.TagNumber(4)
  $core.bool hasSuccessfulOperations() => $_has(3);
  @$pb.TagNumber(4)
  void clearSuccessfulOperations() => $_clearField(4);

  /// Failed operations
  @$pb.TagNumber(5)
  $core.int get failedOperations => $_getIZ(4);
  @$pb.TagNumber(5)
  set failedOperations($core.int value) => $_setSignedInt32(4, value);
  @$pb.TagNumber(5)
  $core.bool hasFailedOperations() => $_has(4);
  @$pb.TagNumber(5)
  void clearFailedOperations() => $_clearField(5);

  /// Retrying operations
  @$pb.TagNumber(6)
  $core.int get retryingOperations => $_getIZ(5);
  @$pb.TagNumber(6)
  set retryingOperations($core.int value) => $_setSignedInt32(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRetryingOperations() => $_has(5);
  @$pb.TagNumber(6)
  void clearRetryingOperations() => $_clearField(6);

  /// Abandoned operations
  @$pb.TagNumber(7)
  $core.int get abandonedOperations => $_getIZ(6);
  @$pb.TagNumber(7)
  set abandonedOperations($core.int value) => $_setSignedInt32(6, value);
  @$pb.TagNumber(7)
  $core.bool hasAbandonedOperations() => $_has(6);
  @$pb.TagNumber(7)
  void clearAbandonedOperations() => $_clearField(7);
}

/// Request to stream sync operations in real-time
class StreamSyncOperationsRequest extends $pb.GeneratedMessage {
  factory StreamSyncOperationsRequest({
    $core.String? storeId,
    $core.String? businessId,
    $core.String? userId,
    $core.Iterable<SyncEntityType>? entityTypeFilter,
    $core.Iterable<SyncOperationType>? operationTypeFilter,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (businessId != null) result.businessId = businessId;
    if (userId != null) result.userId = userId;
    if (entityTypeFilter != null)
      result.entityTypeFilter.addAll(entityTypeFilter);
    if (operationTypeFilter != null)
      result.operationTypeFilter.addAll(operationTypeFilter);
    return result;
  }

  StreamSyncOperationsRequest._();

  factory StreamSyncOperationsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamSyncOperationsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamSyncOperationsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..pc<SyncEntityType>(
        4, _omitFieldNames ? '' : 'entityTypeFilter', $pb.PbFieldType.KE,
        valueOf: SyncEntityType.valueOf,
        enumValues: SyncEntityType.values,
        defaultEnumValue: SyncEntityType.SYNC_ENTITY_TYPE_UNSPECIFIED)
    ..pc<SyncOperationType>(
        5, _omitFieldNames ? '' : 'operationTypeFilter', $pb.PbFieldType.KE,
        valueOf: SyncOperationType.valueOf,
        enumValues: SyncOperationType.values,
        defaultEnumValue: SyncOperationType.SYNC_OPERATION_TYPE_UNSPECIFIED)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamSyncOperationsRequest clone() =>
      StreamSyncOperationsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamSyncOperationsRequest copyWith(
          void Function(StreamSyncOperationsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as StreamSyncOperationsRequest))
          as StreamSyncOperationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamSyncOperationsRequest create() =>
      StreamSyncOperationsRequest._();
  @$core.override
  StreamSyncOperationsRequest createEmptyInstance() => create();
  static $pb.PbList<StreamSyncOperationsRequest> createRepeated() =>
      $pb.PbList<StreamSyncOperationsRequest>();
  @$core.pragma('dart2js:noInline')
  static StreamSyncOperationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamSyncOperationsRequest>(create);
  static StreamSyncOperationsRequest? _defaultInstance;

  /// Store ID
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// Business ID
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// User ID
  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  /// Filter by entity types
  @$pb.TagNumber(4)
  $pb.PbList<SyncEntityType> get entityTypeFilter => $_getList(3);

  /// Filter by operation types
  @$pb.TagNumber(5)
  $pb.PbList<SyncOperationType> get operationTypeFilter => $_getList(4);
}

/// Response for streaming sync operations
class StreamSyncOperationsResponse extends $pb.GeneratedMessage {
  factory StreamSyncOperationsResponse({
    SyncOperation? operation,
    $core.String? updateType,
    $2.Timestamp? updateTimestamp,
  }) {
    final result = create();
    if (operation != null) result.operation = operation;
    if (updateType != null) result.updateType = updateType;
    if (updateTimestamp != null) result.updateTimestamp = updateTimestamp;
    return result;
  }

  StreamSyncOperationsResponse._();

  factory StreamSyncOperationsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory StreamSyncOperationsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'StreamSyncOperationsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOM<SyncOperation>(1, _omitFieldNames ? '' : 'operation',
        subBuilder: SyncOperation.create)
    ..aOS(2, _omitFieldNames ? '' : 'updateType')
    ..aOM<$2.Timestamp>(3, _omitFieldNames ? '' : 'updateTimestamp',
        subBuilder: $2.Timestamp.create)
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamSyncOperationsResponse clone() =>
      StreamSyncOperationsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  StreamSyncOperationsResponse copyWith(
          void Function(StreamSyncOperationsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as StreamSyncOperationsResponse))
          as StreamSyncOperationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static StreamSyncOperationsResponse create() =>
      StreamSyncOperationsResponse._();
  @$core.override
  StreamSyncOperationsResponse createEmptyInstance() => create();
  static $pb.PbList<StreamSyncOperationsResponse> createRepeated() =>
      $pb.PbList<StreamSyncOperationsResponse>();
  @$core.pragma('dart2js:noInline')
  static StreamSyncOperationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<StreamSyncOperationsResponse>(create);
  static StreamSyncOperationsResponse? _defaultInstance;

  /// The sync operation that was updated
  @$pb.TagNumber(1)
  SyncOperation get operation => $_getN(0);
  @$pb.TagNumber(1)
  set operation(SyncOperation value) => $_setField(1, value);
  @$pb.TagNumber(1)
  $core.bool hasOperation() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperation() => $_clearField(1);
  @$pb.TagNumber(1)
  SyncOperation ensureOperation() => $_ensure(0);

  /// Type of update (created, updated, deleted)
  @$pb.TagNumber(2)
  $core.String get updateType => $_getSZ(1);
  @$pb.TagNumber(2)
  set updateType($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasUpdateType() => $_has(1);
  @$pb.TagNumber(2)
  void clearUpdateType() => $_clearField(2);

  /// Timestamp of the update
  @$pb.TagNumber(3)
  $2.Timestamp get updateTimestamp => $_getN(2);
  @$pb.TagNumber(3)
  set updateTimestamp($2.Timestamp value) => $_setField(3, value);
  @$pb.TagNumber(3)
  $core.bool hasUpdateTimestamp() => $_has(2);
  @$pb.TagNumber(3)
  void clearUpdateTimestamp() => $_clearField(3);
  @$pb.TagNumber(3)
  $2.Timestamp ensureUpdateTimestamp() => $_ensure(2);
}

/// Request to retry failed sync operations
class RetrySyncOperationsRequest extends $pb.GeneratedMessage {
  factory RetrySyncOperationsRequest({
    $core.String? storeId,
    $core.String? businessId,
    $core.String? userId,
    $core.Iterable<$core.String>? operationIds,
    $core.String? batchId,
    $core.bool? retryAllFailed,
  }) {
    final result = create();
    if (storeId != null) result.storeId = storeId;
    if (businessId != null) result.businessId = businessId;
    if (userId != null) result.userId = userId;
    if (operationIds != null) result.operationIds.addAll(operationIds);
    if (batchId != null) result.batchId = batchId;
    if (retryAllFailed != null) result.retryAllFailed = retryAllFailed;
    return result;
  }

  RetrySyncOperationsRequest._();

  factory RetrySyncOperationsRequest.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RetrySyncOperationsRequest.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RetrySyncOperationsRequest',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..aOS(1, _omitFieldNames ? '' : 'storeId')
    ..aOS(2, _omitFieldNames ? '' : 'businessId')
    ..aOS(3, _omitFieldNames ? '' : 'userId')
    ..pPS(4, _omitFieldNames ? '' : 'operationIds')
    ..aOS(5, _omitFieldNames ? '' : 'batchId')
    ..aOB(6, _omitFieldNames ? '' : 'retryAllFailed')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetrySyncOperationsRequest clone() =>
      RetrySyncOperationsRequest()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetrySyncOperationsRequest copyWith(
          void Function(RetrySyncOperationsRequest) updates) =>
      super.copyWith(
              (message) => updates(message as RetrySyncOperationsRequest))
          as RetrySyncOperationsRequest;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetrySyncOperationsRequest create() => RetrySyncOperationsRequest._();
  @$core.override
  RetrySyncOperationsRequest createEmptyInstance() => create();
  static $pb.PbList<RetrySyncOperationsRequest> createRepeated() =>
      $pb.PbList<RetrySyncOperationsRequest>();
  @$core.pragma('dart2js:noInline')
  static RetrySyncOperationsRequest getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RetrySyncOperationsRequest>(create);
  static RetrySyncOperationsRequest? _defaultInstance;

  /// Store ID
  @$pb.TagNumber(1)
  $core.String get storeId => $_getSZ(0);
  @$pb.TagNumber(1)
  set storeId($core.String value) => $_setString(0, value);
  @$pb.TagNumber(1)
  $core.bool hasStoreId() => $_has(0);
  @$pb.TagNumber(1)
  void clearStoreId() => $_clearField(1);

  /// Business ID
  @$pb.TagNumber(2)
  $core.String get businessId => $_getSZ(1);
  @$pb.TagNumber(2)
  set businessId($core.String value) => $_setString(1, value);
  @$pb.TagNumber(2)
  $core.bool hasBusinessId() => $_has(1);
  @$pb.TagNumber(2)
  void clearBusinessId() => $_clearField(2);

  /// User ID
  @$pb.TagNumber(3)
  $core.String get userId => $_getSZ(2);
  @$pb.TagNumber(3)
  set userId($core.String value) => $_setString(2, value);
  @$pb.TagNumber(3)
  $core.bool hasUserId() => $_has(2);
  @$pb.TagNumber(3)
  void clearUserId() => $_clearField(3);

  /// Specific operation IDs to retry
  @$pb.TagNumber(4)
  $pb.PbList<$core.String> get operationIds => $_getList(3);

  /// Batch ID to retry all operations in batch
  @$pb.TagNumber(5)
  $core.String get batchId => $_getSZ(4);
  @$pb.TagNumber(5)
  set batchId($core.String value) => $_setString(4, value);
  @$pb.TagNumber(5)
  $core.bool hasBatchId() => $_has(4);
  @$pb.TagNumber(5)
  void clearBatchId() => $_clearField(5);

  /// Retry all failed operations (if no specific IDs provided)
  @$pb.TagNumber(6)
  $core.bool get retryAllFailed => $_getBF(5);
  @$pb.TagNumber(6)
  set retryAllFailed($core.bool value) => $_setBool(5, value);
  @$pb.TagNumber(6)
  $core.bool hasRetryAllFailed() => $_has(5);
  @$pb.TagNumber(6)
  void clearRetryAllFailed() => $_clearField(6);
}

/// Response to retry sync operations
class RetrySyncOperationsResponse extends $pb.GeneratedMessage {
  factory RetrySyncOperationsResponse({
    $core.int? operationsQueued,
    $core.Iterable<$core.String>? queuedOperationIds,
    $core.Iterable<$core.String>? failedToQueueIds,
  }) {
    final result = create();
    if (operationsQueued != null) result.operationsQueued = operationsQueued;
    if (queuedOperationIds != null)
      result.queuedOperationIds.addAll(queuedOperationIds);
    if (failedToQueueIds != null)
      result.failedToQueueIds.addAll(failedToQueueIds);
    return result;
  }

  RetrySyncOperationsResponse._();

  factory RetrySyncOperationsResponse.fromBuffer($core.List<$core.int> data,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromBuffer(data, registry);
  factory RetrySyncOperationsResponse.fromJson($core.String json,
          [$pb.ExtensionRegistry registry = $pb.ExtensionRegistry.EMPTY]) =>
      create()..mergeFromJson(json, registry);

  static final $pb.BuilderInfo _i = $pb.BuilderInfo(
      _omitMessageNames ? '' : 'RetrySyncOperationsResponse',
      package: const $pb.PackageName(_omitMessageNames ? '' : 'sync.v1'),
      createEmptyInstance: create)
    ..a<$core.int>(
        1, _omitFieldNames ? '' : 'operationsQueued', $pb.PbFieldType.O3)
    ..pPS(2, _omitFieldNames ? '' : 'queuedOperationIds')
    ..pPS(3, _omitFieldNames ? '' : 'failedToQueueIds')
    ..hasRequiredFields = false;

  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetrySyncOperationsResponse clone() =>
      RetrySyncOperationsResponse()..mergeFromMessage(this);
  @$core.Deprecated('See https://github.com/google/protobuf.dart/issues/998.')
  RetrySyncOperationsResponse copyWith(
          void Function(RetrySyncOperationsResponse) updates) =>
      super.copyWith(
              (message) => updates(message as RetrySyncOperationsResponse))
          as RetrySyncOperationsResponse;

  @$core.override
  $pb.BuilderInfo get info_ => _i;

  @$core.pragma('dart2js:noInline')
  static RetrySyncOperationsResponse create() =>
      RetrySyncOperationsResponse._();
  @$core.override
  RetrySyncOperationsResponse createEmptyInstance() => create();
  static $pb.PbList<RetrySyncOperationsResponse> createRepeated() =>
      $pb.PbList<RetrySyncOperationsResponse>();
  @$core.pragma('dart2js:noInline')
  static RetrySyncOperationsResponse getDefault() => _defaultInstance ??=
      $pb.GeneratedMessage.$_defaultFor<RetrySyncOperationsResponse>(create);
  static RetrySyncOperationsResponse? _defaultInstance;

  /// Number of operations queued for retry
  @$pb.TagNumber(1)
  $core.int get operationsQueued => $_getIZ(0);
  @$pb.TagNumber(1)
  set operationsQueued($core.int value) => $_setSignedInt32(0, value);
  @$pb.TagNumber(1)
  $core.bool hasOperationsQueued() => $_has(0);
  @$pb.TagNumber(1)
  void clearOperationsQueued() => $_clearField(1);

  /// List of operation IDs that were queued for retry
  @$pb.TagNumber(2)
  $pb.PbList<$core.String> get queuedOperationIds => $_getList(1);

  /// List of operation IDs that could not be retried
  @$pb.TagNumber(3)
  $pb.PbList<$core.String> get failedToQueueIds => $_getList(2);
}

/// Sync service definition
class SyncServiceApi {
  final $pb.RpcClient _client;

  SyncServiceApi(this._client);

  /// Submit sync operations for processing
  $async.Future<SubmitSyncOperationsResponse> submitSyncOperations(
          $pb.ClientContext? ctx, SubmitSyncOperationsRequest request) =>
      _client.invoke<SubmitSyncOperationsResponse>(ctx, 'SyncService',
          'SubmitSyncOperations', request, SubmitSyncOperationsResponse());

  /// Get status of sync operations
  $async.Future<GetSyncOperationsStatusResponse> getSyncOperationsStatus(
          $pb.ClientContext? ctx, GetSyncOperationsStatusRequest request) =>
      _client.invoke<GetSyncOperationsStatusResponse>(
          ctx,
          'SyncService',
          'GetSyncOperationsStatus',
          request,
          GetSyncOperationsStatusResponse());

  /// Stream sync operations updates in real-time
  $async.Future<StreamSyncOperationsResponse> streamSyncOperations(
          $pb.ClientContext? ctx, StreamSyncOperationsRequest request) =>
      _client.invoke<StreamSyncOperationsResponse>(ctx, 'SyncService',
          'StreamSyncOperations', request, StreamSyncOperationsResponse());

  /// Retry failed sync operations
  $async.Future<RetrySyncOperationsResponse> retrySyncOperations(
          $pb.ClientContext? ctx, RetrySyncOperationsRequest request) =>
      _client.invoke<RetrySyncOperationsResponse>(ctx, 'SyncService',
          'RetrySyncOperations', request, RetrySyncOperationsResponse());
}

const $core.bool _omitFieldNames =
    $core.bool.fromEnvironment('protobuf.omit_field_names');
const $core.bool _omitMessageNames =
    $core.bool.fromEnvironment('protobuf.omit_message_names');
