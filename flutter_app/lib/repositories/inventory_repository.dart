import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/query/sql_join.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';

/// Repository for inventory management
final class InventoryRepository extends BaseRepository<InventoryLevel> {
  final _logger = LoggerApp('InventoryRepository');

  /// The inventory service client.
  final InventoryServiceClient inventoryServiceClient;

  /// The Store product service client for product-related operations.
  final StoreProductServiceClient storeProductService;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.inventoryLevels;

  @override
  String get primaryKey => InventoryLevelsFields.storeProductId;

  /// The instance of [InventoryRepository].
  static InventoryRepository get instance => GetIt.I.get<InventoryRepository>();

  @override
  InventoryLevel fromRow(RawRow row) => fromRowToInventoryLevel(row);

  @override
  RawRow toRow(InventoryLevel entity) => fromInventoryLevelToRaw(entity);

  /// Constructs an [InventoryRepository].
  InventoryRepository({required this.dataSource})
    : inventoryServiceClient = InventoryServiceClient(
        ConnectRPCService.to.clientChannel,
      ),
      storeProductService = StoreProductServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets the inventory levels of a product.
  Future<InventoryLevel?> getProductInventoryLevels(
    String productId,
    String storeId,
  ) async {
    try {
      final results = await findWhere(limit: 1, [
        SqlQuery.equals(InventoryLevelsFields.storeProductId, productId),
        SqlQuery.equals(InventoryLevelsFields.storeId, storeId),
      ]);

      return results.isNotEmpty ? results.first : null;
    } on Exception catch (e) {
      _logger.severe('getProductInventoryLevels Error: $e');

      return null;
    }
  }

  /// Watchs specific product inventory.
  Stream<InventoryLevel?> watchProductInventory(
    String productId,
    String storeId,
  ) {
    return watchWhere([
      SqlQuery.equals(InventoryLevelsFields.storeProductId, productId),
      SqlQuery.equals(InventoryLevelsFields.storeId, storeId),
    ]).map((items) => items.isNotEmpty ? items.first : null);
  }

  /// Gets the store inventory.
  Future<List<InventoryLevelWithProduct>> getStoreInventory(
    String storeId,
  ) async {
    try {
      return await _getJoinedInventory(storeId);
    } catch (e) {
      _logger.severe('Error getting store inventory: $e');
      rethrow;
    }
  }

  /// Checks if the product is available in the store.
  Future<({bool isAvailable, int quantityAvailable})> checkProductAvailability(
    CheckProductAvailabilityRequest request,
  ) async {
    try {
      final level = await getProductInventoryLevels(
        request.productId,
        request.storeId,
      );

      return (
        isAvailable:
            level != null &&
            level.quantityAvailable > 0 &&
            level.quantityAvailable > request.quantityNeeded,
        quantityAvailable: level?.quantityAvailable ?? 0,
      );
    } on Exception catch (e) {
      _logger.severe('Error checking product availability: $e');

      return (isAvailable: false, quantityAvailable: 0);
    }
  }

  Future<List<InventoryLevelWithProduct>> _getJoinedInventory(
    String storeId, {
    List<SqlQuery> filters = const [],
  }) async {
    final rows = await dataSource.getJoinedCollection(
      table: CollectionName.inventoryLevels,
      tableAlias: 'il',
      joins: [
        const SqlJoin(
          type: JoinType.inner,
          table: CollectionName.storeProducts,
          alias: 'sp',
          on: 'il.${InventoryLevelsFields.storeProductId} = sp.${StoreProductsFields.refId}',
          selectColumns: [
            StoreProductsFields.refId,
            StoreProductsFields.salePrice,
            StoreProductsFields.sku,
            StoreProductsFields.status,
            StoreProductsFields.storeId,
            StoreProductsFields.imagesLinksIds,
            StoreProductsFields.globalProductId,
            StoreProductsFields.expirationType,
          ],
        ),
        const SqlJoin(
          type: JoinType.inner,
          table: CollectionName.globalProducts,
          alias: 'gp',
          on: 'sp.${StoreProductsFields.globalProductId} = gp.${GlobalProductsFields.refId}',
          selectColumns: [
            GlobalProductsFields.refId,
            GlobalProductsFields.barCodeValue,
            GlobalProductsFields.name,
            GlobalProductsFields.status,
            GlobalProductsFields.categories,
          ],
        ),
      ],
      filters: [
        SqlQuery.equals(InventoryLevelsFields.storeId, storeId),
        ...filters,
      ],
    );

    return rows.map((row) {
      final level = fromRowToInventoryLevel(row);
      final product = fromRowToStoreProduct(extractTable(row, 'sp'));
      final globalProduct = fromRowToGlobalProduct(extractTable(row, 'gp'));

      return InventoryLevelWithProduct(
        level: level,
        product: product,
        globalProduct: globalProduct,
        stockStatus: level.quantityAvailable == 0
            ? StockStatus.STOCK_STATUS_OUT_OF_STOCK
            : level.quantityAvailable >
                  (product.reorderPoint > 0
                      ? product.reorderPoint
                      : level.minThreshold)
            ? StockStatus.STOCK_STATUS_OK
            : StockStatus.STOCK_STATUS_LOW,
        stockValue: (level.quantityAvailable * product.salePrice).truncate(),
      );
    }).toList();
  }

  /// Gets recent inventory transactions history.
  Future<List<InventoryTransaction>> getInventoryTransactionHistory(
    GetInventoryTransactionHistoryRequest request,
  ) async {
    try {
      final rows = await dataSource.getCollection(
        CollectionName.inventoryTransactions,
        filters: [
          SqlQuery.equals(InventoryTransactionsFields.storeId, request.storeId),
          SqlQuery.equals(
            InventoryTransactionsFields.productId,
            request.productId,
          ),
        ],
      );

      return rows.map(fromRowToInventoryTransaction).toList();
    } on Exception catch (e) {
      _logger.severe('getInventoryTransactionHistory Error: $e');

      return [];
    }
  }

  /// Gets the inventory levels for a product.

  /// Adjusts the inventory.
  Future<bool> adjustInventory(
    AdjustInventoryRequest request,
    String permformBy,
  ) async {
    try {
      // 1. Get current level
      final level = await getProductInventoryLevels(
        request.productId,
        request.storeId,
      );
      if (level == null) return false;

      final now = DateTime.now();
      final quantityChange = request.newQuantity - level.quantityOnHand;

      // 2. Create transaction record
      final transaction = InventoryTransaction(
        refId: AppUtils.generateSmartDatabaseId('TXN'),
        storeId: request.storeId,
        productId: request.productId,
        transactionType: TransactionType.TXN_TYPE_ADJUSTMENT,
        quantityChange: quantityChange,
        quantityBefore: level.quantityOnHand,
        quantityAfter: request.newQuantity,
        transactionTime: Timestamp.fromDateTime(now),
        notes: request.reason,
        performedByUserId: permformBy,
      );

      // 3. Update level record locally
      level
        ..quantityOnHand = request.newQuantity
        ..quantityAvailable = request.newQuantity - level.quantityCommitted
        ..lastUpdated = Timestamp.fromDateTime(now)
        ..lastUpdatedByUserId = permformBy;

      await dataSource.runTransaction((tx) async {
        await tx.createRecord(
          table: CollectionName.inventoryTransactions,
          record: fromInventoryTransactionToRaw(transaction),
        );

        await tx.updateWhere(
          table: CollectionName.inventoryLevels,
          fields: fromInventoryLevelToRaw(level),
          filters: [
            SqlQuery.equals(
              InventoryLevelsFields.storeProductId,
              level.storeProductId,
            ),
            SqlQuery.equals(InventoryLevelsFields.storeId, level.storeId),
          ],
        );
      });

      return true;
    } on Exception catch (e) {
      _logger.severe('adjustInventory Error: $e');

      return false;
    }
  }
}
