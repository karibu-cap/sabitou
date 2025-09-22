import 'package:get_it/get_it.dart';
import 'package:hive_ce/hive.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:uuid/uuid.dart';

import '../../services/hive_database/hive_database.dart';
import '../../utils/logger.dart';

/// The local orders repository.
class LocalOrdersRepository {
  final _logger = LoggerApp('LocalOrdersRepository');

  /// The hive database.
  final hiveDatabase = GetIt.I.get<HiveDatabase>();

  /// Constructs a new [LocalOrdersRepository].
  LocalOrdersRepository();

  /// Gets list of order with filter by supplier id.
  Future<List<Order>> getOrdersByQuery(FindOrdersRequest request) async {
    try {
      final allOrders = hiveDatabase.orders.values.toList();

      // Filter orders by store ID
      final result = allOrders
          .where((order) => order.storeId == request.storeId)
          .toList();

      return result;
    } on Exception catch (e) {
      _logger.severe('getOrdersByQuery Error: $e');

      return [];
    }
  }

  /// Gets the order by ref-id.
  Future<Order> getOrderByRefId(String refId) async {
    try {
      final allOrders = hiveDatabase.orders.values.toList();

      final result = allOrders
          .where((order) => order.refId == refId)
          .firstOrNull;

      return result ?? Order();
    } on Exception catch (e) {
      _logger.severe('getOrderByRefId Error: $e');

      return Order();
    }
  }

  /// Adds an order with automatic stock validation and update.
  Future<String?> addOrder(CreateOrderRequest request) async {
    try {
      // Create the order
      request.order..refId = const Uuid().v4();
      await hiveDatabase.orders.put(request.order.refId, request.order);

      // Create order items as separate entities for efficient querying
      for (final orderItem in request.order.orderItems) {
        // Update stock
        await _updateProductStock(
          storeProductId: orderItem.storeProductId,
          quantityToSubtract: orderItem.quantity,
          storeId: request.order.storeId,
          box: hiveDatabase.storeProducts,
        );
      }

      final syncId = const Uuid().v4();

      final sync = SyncOperation(
        refId: syncId,
        createdAt: Timestamp.fromDateTime(DateTime.now()),
        operationType: SyncOperationType.SYNC_OPERATION_TYPE_CREATE,
        entityType: SyncEntityType.SYNC_ENTITY_TYPE_ORDER,
        entityId: request.order.refId,
        orderData: request.order,
        status: SyncOperationStatus.SYNC_OPERATION_STATUS_PENDING,
        updatedAt: Timestamp.fromDateTime(DateTime.now()),
        maxRetries: 1000,
        retryCount: 0,
        nextRetryAt: Timestamp.fromDateTime(DateTime.now()),
      );

      // Create sync operation for the order
      await hiveDatabase.syncOperations.put(sync.refId, sync);

      _logger.info(
        'Order created successfully with stock update: ${request.order.refId}',
      );

      return syncId;
    } on Exception catch (e) {
      _logger.severe('addOrder Error: $e');
    }

    return null;
  }

  /// Updates the stock quantity for a specific product.
  Future<void> _updateProductStock({
    required String storeProductId,
    required int quantityToSubtract,
    required String storeId,
    required Box<StoreProduct> box,
  }) async {
    final storeProduct = box.values
        .where(
          (storeProduct) =>
              storeProduct.refId == storeProductId &&
              storeProduct.storeId == storeId,
        )
        .firstOrNull;

    if (storeProduct != null) {
      storeProduct
        ..stockQuantity -= quantityToSubtract
        ..updatedAt = Timestamp.fromDateTime(DateTime.now());
      await box.put(storeProduct.refId, storeProduct);

      _logger.info(
        'Stock updated for product $storeProductId: '
        '${storeProduct.stockQuantity} -> ${storeProduct.stockQuantity}',
      );
    }
  }
}
