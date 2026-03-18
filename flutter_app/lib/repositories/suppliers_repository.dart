import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';

/// The suppliers repository.
final class SuppliersRepository extends BaseRepository<Supplier> {
  final _logger = LoggerApp('SuppliersRepository');

  /// The supplier service client.
  final SupplierServiceClient supplierServiceClient;

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.suppliers;

  /// The instance of [SuppliersRepository].
  static SuppliersRepository get instance => GetIt.I.get<SuppliersRepository>();

  @override
  Supplier fromRow(RawRow row) => fromRowToSupplier(row);

  @override
  RawRow toRow(Supplier entity) => fromSupplierToRaw(entity);

  /// Constructs a new [SuppliersRepository].
  SuppliersRepository({required this.dataSource})
    : supplierServiceClient = SupplierServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all suppliers based on store Id.
  Future<List<Supplier>> getSuppliersByStore(String storeId) async {
    try {
      final rows = await dataSource.executeRaw(
        'SELECT * FROM $tableName WHERE ${SuppliersFields.storeIds} LIKE ?',
        ['%$storeId%'],
      );

      return rows.map(fromRowToSupplier).toList();
    } on Exception catch (e) {
      _logger.severe('getSuppliersByStore Error: $e');

      return [];
    }
  }

  /// Gets a supplier by ref.
  Future<Supplier?> getSupplierBySupplierId(String supplierId) async {
    return findById(supplierId);
  }

  /// Creates a new supplier.
  Future<String?> createSupplier(CreateSupplierRequest request) async {
    try {
      final supplier = request.supplier;
      if (supplier.refId.isEmpty) {
        supplier.refId = AppUtils.generateSmartDatabaseId('SUP');
      }

      await save(supplier);

      return supplier.refId;
    } on Exception catch (e) {
      _logger.severe('createSupplier Error: $e');

      return null;
    }
  }

  /// Updates an existing supplier.
  Future<bool> updateSupplier(UpdateSupplierRequest request) async {
    try {
      await save(request.supplier);

      return true;
    } on Exception catch (e) {
      _logger.severe('updateSupplier Error: $e');

      return false;
    }
  }

  /// Deletes a supplier by ID.
  Future<bool> deleteSupplier(DeleteSupplierRequest request) async {
    try {
      await delete(request.supplierId);

      return true;
    } on Exception catch (e) {
      _logger.severe('deleteSupplier Error: $e');

      return false;
    }
  }

  /// Stream suppliers for a specific store.
  Stream<List<Supplier>> streamStoreSuppliers(
    StreamStoreSuppliersRequest request,
  ) {
    // Note: storeIds is a JSON array in SQLite, so we use LIKE for streaming.
    // It's better to use watchRaw if filters are complex.
    return dataSource
        .watchRaw(
          'SELECT * FROM $tableName WHERE ${SuppliersFields.storeIds} LIKE ?',
          ['%${request.storeId}%'],
        )
        .map((rows) => rows.map(fromRowToSupplier).toList());
  }

  /// Gets products for a specific supplier.
  Future<List<ProductBySupplier>> getProductsForSupplier(
    String supplierRefId,
    String? storeId,
  ) async {
    try {
      final rows = await dataSource.executeRaw(
        'SELECT DISTINCT sp.*, gp.* '
        'FROM ${CollectionName.storeProducts} sp '
        'JOIN ${CollectionName.globalProducts} gp ON sp.${StoreProductsFields.globalProductId} = gp.${GlobalProductsFields.refId} '
        'JOIN ${CollectionName.inventoryLevels} il ON sp.${StoreProductsFields.refId} = il.${InventoryLevelsFields.storeProductId} '
        'JOIN json_each(il.${InventoryLevelsFields.batches}) b ON json_extract(b.value, "\$.supplier_id") = ? '
        'WHERE il.${InventoryLevelsFields.storeId} = ?',
        [supplierRefId, storeId ?? ''],
      );

      return rows.map((row) {
        return ProductBySupplier(
          storeProduct: fromRowToStoreProduct(row),
          globalProduct: fromRowToGlobalProduct(row),
        );
      }).toList();
    } catch (e) {
      _logger.severe('getProductsForSupplier Error: $e');

      return [];
    }
  }
}
