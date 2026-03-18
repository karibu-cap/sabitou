import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

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

/// The products repository.
final class StoreProductsRepository extends BaseRepository<StoreProduct> {
  final _logger = LoggerApp('StoreProductsRepository');

  /// The product service client.
  final StoreProductServiceClient storeProductServiceClient;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.storeProducts;

  /// The instance of [StoreProductsRepository].
  static StoreProductsRepository get instance =>
      GetIt.I.get<StoreProductsRepository>();

  @override
  StoreProduct fromRow(RawRow row) => fromRowToStoreProduct(row);

  @override
  RawRow toRow(StoreProduct entity) => fromStoreProductToRaw(entity);

  /// Constructs a new [StoreProductsRepository].
  StoreProductsRepository({required this.dataSource})
    : storeProductServiceClient = StoreProductServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all products based on store Id.
  Future<List<StoreProductWithGlobalProduct>> findStoreProducts(
    FindStoreProductsRequest request,
  ) async {
    try {
      final rows = await dataSource.getJoinedCollection(
        table: CollectionName.storeProducts,
        tableAlias: 'sp',
        joins: [
          const SqlJoin(
            type: JoinType.inner,
            table: CollectionName.globalProducts,
            alias: 'gp',
            on: 'sp.${StoreProductsFields.globalProductId} = gp.${GlobalProductsFields.refId}',
            selectColumns: ['*'],
          ),
        ],
        filters: [
          if (request.hasStoreId())
            SqlQuery.equals(
              StoreProductsFields.storeId,
              request.storeId,
            ),
        ],
      );

      return rows.map((row) {
        return StoreProductWithGlobalProduct(
          storeProduct: fromRowToStoreProduct(row),
          globalProduct: fromRowToGlobalProduct(row),
        );
      }).toList();
    } on Exception catch (e) {
      _logger.severe('findStoreProducts Error: $e');

      return [];
    }
  }

  /// Finds global products.
  Future<List<GlobalProduct>> findGlobalProducts(
    FindGlobalProductsRequest request,
  ) async {
    try {
      final rows = await dataSource.getCollection(
        CollectionName.globalProducts,
        filters: [
          if (request.hasRefId())
            SqlQuery.equals(GlobalProductsFields.refId, request.refId),
          if (request.hasBarCodeValue())
            SqlQuery.equals(
              GlobalProductsFields.barCodeValue,
              request.barCodeValue,
            ),
        ],
      );

      return rows.map(fromRowToGlobalProduct).toList();
    } on Exception catch (e) {
      _logger.severe('findGlobalProducts Error: $e');

      return [];
    }
  }

  /// Adds a new product to a store.
  Future<bool> addProduct(AddStoreProductRequest request) async {
    try {
      final product = request.storeProduct;
      if (product.refId.isEmpty) {
        product.refId = AppUtils.generateSmartDatabaseId('SP');
      }

      await save(product);

      return true;
    } on Exception catch (e) {
      _logger.severe('addProduct Error: $e');

      return false;
    }
  }

  /// Gets a store product by its ID with its global product.
  Future<StoreProductWithGlobalProduct?> getStoreProduct(
    GetStoreProductRequest request,
  ) async {
    try {
      final rows = await dataSource.getJoinedCollection(
        table: CollectionName.storeProducts,
        tableAlias: 'sp',
        joins: [
          const SqlJoin(
            type: JoinType.inner,
            table: CollectionName.globalProducts,
            alias: 'gp',
            on: 'sp.${StoreProductsFields.globalProductId} = gp.${GlobalProductsFields.refId}',
            selectColumns: ['*'],
          ),
        ],
        filters: [
          SqlQuery.equals(
            StoreProductsFields.refId,
            request.storeProductId,
          ),
        ],
        limit: 1,
      );

      if (rows.isEmpty) return null;

      final row = rows.first;

      return StoreProductWithGlobalProduct(
        storeProduct: fromRowToStoreProduct(row),
        globalProduct: fromRowToGlobalProduct(row),
      );
    } on Exception catch (e) {
      _logger.severe('getStoreProduct Error: $e');

      return null;
    }
  }

  /// Updates a store product.
  Future<bool> updateProduct(UpdateStoreProductRequest request) async {
    try {
      await save(request.storeProduct);

      return true;
    } on Exception catch (e) {
      _logger.severe('updateProduct Error: $e');

      return false;
    }
  }

  /// Deletes a store product.
  Future<bool> deleteProduct(DeleteStoreProductRequest request) async {
    try {
      await delete(request.storeProductId);

      return true;
    } on Exception catch (e) {
      _logger.severe('deleteProduct Error: $e');

      return false;
    }
  }

  /// Adds a new global product.
  Future<bool> createGlobalProduct(CreateGlobalProductRequest request) async {
    try {
      final product = request.globalProduct;
      if (product.refId.isEmpty) {
        product.refId = AppUtils.generateSmartDatabaseId('GP');
      }

      await dataSource.setRecord(
        table: CollectionName.globalProducts,
        record: fromGlobalProductToRaw(product),
        conflictColumns: [GlobalProductsFields.refId],
      );

      return true;
    } catch (e) {
      _logger.severe('createGlobalProduct Error: $e');

      return false;
    }
  }

  /// Updates a global product.
  Future<bool> updateGlobalProduct(UpdateGlobalProductRequest request) async {
    try {
      await dataSource.setRecord(
        table: CollectionName.globalProducts,
        record: fromGlobalProductToRaw(request.globalProduct),
        conflictColumns: [GlobalProductsFields.refId],
      );

      return true;
    } catch (e) {
      _logger.severe('updateGlobalProduct Error: $e');

      return false;
    }
  }

  /// Deletes a global product.
  Future<bool> deleteGlobalProduct(DeleteGlobalProductRequest request) async {
    try {
      await dataSource.deleteRecord(
        table: CollectionName.globalProducts,
        id: request.globalProductId,
        primaryKey: GlobalProductsFields.refId,
      );

      return true;
    } catch (e) {
      _logger.severe('deleteGlobalProduct Error: $e');

      return false;
    }
  }

  /// Streams products for a store for real-time updates.
  Stream<List<StoreProductWithGlobalProduct>> streamStoreProducts(
    StreamStoreProductsRequest request,
  ) {
    return dataSource
        .watchJoinedCollection(
          table: CollectionName.storeProducts,
          tableAlias: 'sp',
          joins: [
            const SqlJoin(
              type: JoinType.inner,
              table: CollectionName.globalProducts,
              alias: 'gp',
              on: 'sp.${StoreProductsFields.globalProductId} = gp.${GlobalProductsFields.refId}',
              selectColumns: ['*'],
            ),
          ],
          filters: [
            SqlQuery.equals(
              StoreProductsFields.storeId,
              request.storeId,
            ),
          ],
        )
        .map((rows) {
          return rows.map((row) {
            return StoreProductWithGlobalProduct(
              storeProduct: fromRowToStoreProduct(row),
              globalProduct: fromRowToGlobalProduct(row),
            );
          }).toList();
        });
  }

  /// Searches products locally with joins.
  Future<SearchStoreProductsResponse> searchProducts(
    SearchStoreProductsRequest request,
  ) async {
    try {
      final query = '%${request.searchQuery}%';
      final rows = await dataSource.getJoinedCollection(
        table: CollectionName.storeProducts,
        tableAlias: 'sp',
        joins: [
          const SqlJoin(
            type: JoinType.inner,
            table: CollectionName.globalProducts,
            alias: 'gp',
            on: 'sp.${StoreProductsFields.globalProductId} = gp.${GlobalProductsFields.refId}',
            selectColumns: ['*'],
          ),
        ],
        filters: [
          SqlQuery.equals(StoreProductsFields.storeId, request.storeId),
          SqlOrGroup([
            SqlQuery(
              GlobalProductsFields.name,
              query,
              SqlCondition.like,
              tableAlias: 'gp',
            ),
            SqlQuery(
              GlobalProductsFields.barCodeValue,
              query,
              SqlCondition.like,
              tableAlias: 'gp',
            ),
            SqlQuery(
              StoreProductsFields.sku,
              query,
              SqlCondition.like,
              tableAlias: 'sp',
            ),
          ]),
        ],
      );

      final products = rows.map((row) {
        return StoreProductWithGlobalProduct(
          storeProduct: fromRowToStoreProduct(row),
          globalProduct: fromRowToGlobalProduct(row),
        );
      }).toList();

      return SearchStoreProductsResponse(products: products);
    } on Exception catch (e) {
      _logger.severe('searchProducts Error: $e');

      return SearchStoreProductsResponse();
    }
  }
}
