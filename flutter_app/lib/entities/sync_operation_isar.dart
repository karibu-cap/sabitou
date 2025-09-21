import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

part 'sync_operation_isar.g.dart';

@collection
/// SyncOperation Isar entity for offline synchronization operations.
class SyncOperationIsar {
  /// Auto increment id for Isar database
  Id id = Isar.autoIncrement;

  /// Unique identifier for the sync operation
  /// This ID is used to track the operation across client and server
  @Index(unique: true)
  String operationId;

  /// Type of operation (create, update, delete)
  /// Maps to SyncOperationType enum values:
  /// - 1: CREATE
  /// - 2: UPDATE
  /// - 3: DELETE
  int operationType;

  /// Type of entity being synchronized
  /// Maps to SyncEntityType enum values:
  /// - 1: ORDER
  int entityType;

  /// Unique identifier of the entity being operated on
  /// This is the business ID of the entity (e.g., order ID, product ID)
  @Index()
  String entityId;

  /// Store ID associated with this operation (if applicable)
  /// Used for filtering operations by store
  @Index()
  String? storeId;

  /// Business ID associated with this operation (if applicable)
  /// Used for multi-tenant scenarios
  @Index()
  String? businessId;

  /// User ID who performed the operation
  /// Used for audit trails and user-specific operations
  String? userId;

  /// Serialized operation data as JSON string
  /// Contains the actual entity data for the operation
  /// For create/update: contains the full entity data
  /// For delete: contains minimal identifying information
  String operationDataJson;

  /// Timestamp when the operation was created locally
  /// Used for ordering operations and conflict resolution
  DateTime createdAt;

  /// Timestamp when the operation was last updated
  /// Updated when retry attempts are made or status changes
  DateTime updatedAt;

  /// Current status of the sync operation
  /// Maps to SyncOperationStatus enum values:
  /// - 1: PENDING
  /// - 2: IN_PROGRESS
  /// - 3: SUCCESS
  /// - 4: FAILED
  /// - 5: RETRYING
  /// - 6: ABANDONED
  @Index()
  int status;

  /// Number of retry attempts made for this operation
  /// Used to implement exponential backoff and max retry limits
  int retryCount;

  /// Maximum number of retries allowed for this operation
  /// After this limit is reached, the operation is marked as ABANDONED
  int maxRetries;

  /// Next retry timestamp (if applicable)
  /// Used to schedule retry attempts with proper delays
  DateTime? nextRetryAt;

  /// Error message from the last failed attempt (if any)
  /// Helps with debugging and user feedback
  String? errorMessage;

  /// Additional metadata as JSON string
  /// Can store custom fields like device info, app version, etc.
  String? metadataJson;

  /// Constructs a new SyncOperationIsar
  SyncOperationIsar({
    required this.operationId,
    required this.operationType,
    required this.entityType,
    required this.entityId,
    this.storeId,
    this.businessId,
    this.userId,
    required this.operationDataJson,
    required this.createdAt,
    required this.updatedAt,
    required this.status,
    this.retryCount = 0,
    this.maxRetries = 3,
    this.nextRetryAt,
    this.errorMessage,
    this.metadataJson,
  });

  /// Checks if this operation is ready for retry
  ///
  /// Returns true if the operation has failed and the next retry time
  /// has passed (or no next retry time is set).
  bool get isReadyForRetry {
    final _nextRetryAt = nextRetryAt;
    if (status != 4 && status != 5) return false; // Not FAILED or RETRYING
    if (retryCount >= maxRetries) return false; // Exceeded max retries
    if (_nextRetryAt == null) return true; // No retry time set

    return DateTime.now().isAfter(_nextRetryAt); // Retry time has passed
  }

  /// Checks if this operation has exceeded maximum retries
  ///
  /// Returns true if the operation should be marked as ABANDONED.
  bool get hasExceededMaxRetries {
    return retryCount >= maxRetries;
  }

  /// Gets a human-readable description of the operation type
  String get operationTypeDescription {
    switch (operationType) {
      case 1:
        return 'Create';
      case 2:
        return 'Update';
      case 3:
        return 'Delete';
      default:
        return 'Unknown';
    }
  }

  /// Gets a human-readable description of the entity type
  String get entityTypeDescription {
    switch (entityType) {
      case 1:
        return 'Order';
      default:
        return 'Unknown';
    }
  }

  /// Gets a human-readable description of the operation status
  String get statusDescription {
    switch (status) {
      case 1:
        return 'Pending';
      case 2:
        return 'In Progress';
      case 3:
        return 'Success';
      case 4:
        return 'Failed';
      case 5:
        return 'Retrying';
      case 6:
        return 'Abandoned';
      default:
        return 'Unknown';
    }
  }

  /// Converts a proto SyncOperation to SyncOperationIsar object
  ///
  /// This factory method handles the conversion from the generated
  /// protobuf SyncOperation to the local Isar entity.
  factory SyncOperationIsar.fromProto(SyncOperation proto) {
    // Convert operation data to JSON based on entity type
    String operationDataJson = '';
    if (proto.hasStoreProductData()) {
      operationDataJson = proto.storeProductData.writeToJsonMap().toString();
    } else if (proto.hasGlobalProductData()) {
      operationDataJson = proto.globalProductData.writeToJsonMap().toString();
    } else if (proto.hasProductCategoryData()) {
      operationDataJson = proto.productCategoryData.writeToJsonMap().toString();
    } else if (proto.hasOrderData()) {
      operationDataJson = proto.orderData.writeToJsonMap().toString();
    } else if (proto.hasJsonData()) {
      operationDataJson = proto.jsonData;
    }

    // Convert metadata map to JSON string
    String? metadataJson;
    if (proto.metadata.isNotEmpty) {
      metadataJson = proto.metadata.toString();
    }

    return SyncOperationIsar(
      operationId: proto.operationId,
      operationType: proto.operationType.value,
      entityType: proto.entityType.value,
      entityId: proto.entityId,
      storeId: proto.hasStoreId() ? proto.storeId : null,
      businessId: proto.hasBusinessId() ? proto.businessId : null,
      userId: proto.hasUserId() ? proto.userId : null,
      operationDataJson: operationDataJson,
      createdAt: proto.hasCreatedAt()
          ? proto.createdAt.toDateTime()
          : DateTime.now(),
      updatedAt: proto.hasUpdatedAt()
          ? proto.updatedAt.toDateTime()
          : DateTime.now(),
      status: proto.status.value,
      retryCount: proto.retryCount,
      maxRetries: proto.maxRetries,
      nextRetryAt: proto.hasNextRetryAt()
          ? proto.nextRetryAt.toDateTime()
          : null,
      errorMessage: proto.hasErrorMessage() ? proto.errorMessage : null,
      metadataJson: metadataJson,
    );
  }

  /// Converts this Isar object to a proto SyncOperation.
  SyncOperation toProto() {
    final syncOp = SyncOperation()
      ..operationId = operationId
      ..operationType =
          SyncOperationType.valueOf(operationType) ??
          SyncOperationType.SYNC_OPERATION_TYPE_UNSPECIFIED
      ..entityType =
          SyncEntityType.valueOf(entityType) ??
          SyncEntityType.SYNC_ENTITY_TYPE_UNSPECIFIED
      ..entityId = entityId
      ..status =
          SyncOperationStatus.valueOf(status) ??
          SyncOperationStatus.SYNC_OPERATION_STATUS_UNSPECIFIED
      ..retryCount = retryCount
      ..maxRetries = maxRetries
      ..createdAt = Timestamp.fromDateTime(createdAt)
      ..updatedAt = Timestamp.fromDateTime(updatedAt);

    // Set optional fields
    final storeId = this.storeId;
    final businessId = this.businessId;
    final userId = this.userId;
    final nextRetryAt = this.nextRetryAt;
    final errorMessage = this.errorMessage;
    if (storeId != null) {
      syncOp.storeId = storeId;
    }
    if (businessId != null) {
      syncOp.businessId = businessId;
    }
    if (userId != null) {
      syncOp.userId = userId;
    }
    if (nextRetryAt != null) {
      syncOp.nextRetryAt = Timestamp.fromDateTime(nextRetryAt);
    }
    if (errorMessage != null) {
      syncOp.errorMessage = errorMessage;
    }

    // Set operation data based on entity type
    // Note: This is a simplified version. In practice, you'd need to
    // deserialize the JSON back to the appropriate proto message type
    if (operationDataJson.isNotEmpty) {
      syncOp.jsonData = operationDataJson;
    }

    return syncOp;
  }

  /// Creates a copy of this operation with updated retry information
  ///
  /// Used when an operation fails and needs to be retried with
  /// incremented retry count and updated next retry time.
  SyncOperationIsar copyWithRetry({
    String? newErrorMessage,
    DateTime? customNextRetryAt,
  }) {
    final nextRetry =
        customNextRetryAt ??
        DateTime.now().add(Duration(minutes: (retryCount + 1) * 2));

    return SyncOperationIsar(
      operationId: operationId,
      operationType: operationType,
      entityType: entityType,
      entityId: entityId,
      storeId: storeId,
      businessId: businessId,
      userId: userId,
      operationDataJson: operationDataJson,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      status: 5, // RETRYING
      retryCount: retryCount + 1,
      maxRetries: maxRetries,
      nextRetryAt: nextRetry,
      errorMessage: newErrorMessage ?? errorMessage,
      metadataJson: metadataJson,
    );
  }

  /// Creates a copy of this operation with updated status
  ///
  /// Used to update the operation status (e.g., from PENDING to SUCCESS)
  /// while preserving all other data.
  SyncOperationIsar copyWithStatus(int newStatus, {String? newErrorMessage}) {
    return SyncOperationIsar(
      operationId: operationId,
      operationType: operationType,
      entityType: entityType,
      entityId: entityId,
      storeId: storeId,
      businessId: businessId,
      userId: userId,
      operationDataJson: operationDataJson,
      createdAt: createdAt,
      updatedAt: DateTime.now(),
      status: newStatus,
      retryCount: retryCount,
      maxRetries: maxRetries,
      nextRetryAt: nextRetryAt,
      errorMessage: newErrorMessage ?? errorMessage,
      metadataJson: metadataJson,
    );
  }

  @override
  String toString() {
    return 'SyncOperationIsar('
        'id: $id, '
        'operationId: $operationId, '
        'type: $operationTypeDescription, '
        'entity: $entityTypeDescription, '
        'entityId: $entityId, '
        'status: $statusDescription, '
        'retryCount: $retryCount'
        ')';
  }
}
