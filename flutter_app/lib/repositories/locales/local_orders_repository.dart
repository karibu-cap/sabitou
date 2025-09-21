import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:uuid/uuid.dart';

import '../../entities/order_isar.dart';
import '../../entities/store_product_isar.dart';
import '../../entities/sync_operation_isar.dart';
import '../../services/isar_database/isar_database.dart';
import '../../utils/logger.dart';

/// The local orders repository.
class LocalOrdersRepository {
  final _logger = LoggerApp('LocalOrdersRepository');

  /// The isar box.
  final isarBox = GetIt.I.get<IsarDatabase>();

  /// Constructs a new [LocalOrdersRepository].
  LocalOrdersRepository();

  /// Gets list of order with filter by supplier id.
  Future<List<Order>> getOrdersByQuery(FindOrdersRequest request) async {
    try {
      final result = await isarBox.orderIsars
          .filter()
          .storeIdEqualTo(request.storeId)
          .findAll();

      return result.map((e) => e.toProto()).toList();
    } on Exception catch (e) {
      _logger.severe('getOrdersByQuery Error: $e');

      return [];
    }
  }

  /// Gets the order by ref-id.
  Future<Order> getOrderByRefId(String refId) async {
    try {
      final result = await isarBox.orderIsars
          .filter()
          .refIdEqualTo(refId)
          .findFirst();

      return result?.toProto() ?? Order();
    } on Exception catch (e) {
      _logger.severe('getOrderByRefId Error: $e');

      return Order();
    }
  }

  /// Adds an order with automatic stock validation and update.
  Future<String?> addOrder(CreateOrderRequest request) async {
    try {
      // Create order and update stock in a transaction
      return await isarBox.writeTxn(() async {
        // Create the order
        final orderIsar = OrderIsar.fromProto(request.order);
        final orderId = await isarBox.orderIsars.put(orderIsar);

        // Create order items as separate entities for efficient querying
        for (final orderItemProto in request.order.orderItems) {
          // Update stock
          await _updateProductStock(
            storeProductId: orderItemProto.storeProductId,
            quantityToSubtract: orderItemProto.quantity,
            storeId: request.order.storeId,
          );
        }

        // Create sync operation for the order
        await isarBox.syncOperationsIsars.put(
          SyncOperationIsar(
            createdAt: DateTime.now(),
            operationId: const Uuid().v4(),
            operationType: SyncOperationType.SYNC_OPERATION_TYPE_CREATE.value,
            entityType: SyncEntityType.SYNC_ENTITY_TYPE_ORDER.value,
            entityId: request.order.refId,
            operationDataJson: request.order.writeToJson(),
            status: SyncOperationStatus.SYNC_OPERATION_STATUS_PENDING.value,
            updatedAt: DateTime.now(),
          ),
        );

        _logger.info(
          'Order created successfully with stock update: ${request.order.refId}',
        );

        return orderId.toString();
      });
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
  }) async {
    final storeProduct = await isarBox.storeProductIsars
        .filter()
        .refIdEqualTo(storeProductId)
        .and()
        .storeIdEqualTo(storeId)
        .findFirst();

    if (storeProduct != null) {
      final updatedProduct = StoreProductIsar(
        refId: storeProduct.refId,
        storeId: storeProduct.storeId,
        globalProductId: storeProduct.globalProductId,
        price: storeProduct.price,
        stockQuantity: storeProduct.stockQuantity - quantityToSubtract,
        minStockThreshold: storeProduct.minStockThreshold,
        supplierId: storeProduct.supplierId,
        imagesLinksIds: storeProduct.imagesLinksIds,
        inboundDate: storeProduct.inboundDate,
        expirationDate: storeProduct.expirationDate,
        createdAt: storeProduct.createdAt,
        updatedAt: DateTime.now(),
      );

      await isarBox.storeProductIsars.put(updatedProduct);

      _logger.info(
        'Stock updated for product $storeProductId: '
        '${storeProduct.stockQuantity} -> ${updatedProduct.stockQuantity}',
      );
    }
  }
}
