import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';

/// The suppliers repository.
final class SuppliersRepository extends BaseRepository<Supplier> {
  final _logger = LoggerApp('SuppliersRepository');

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
  SuppliersRepository({required this.dataSource});

  /// Gets all suppliers based on store Id.
  Future<List<Supplier>> getSuppliersByStore(String storeId) async {
    try {
      final rows = await findWhere([
        SqlQuery.like(SuppliersFields.storeIds, '%"$storeId"%'),
      ]);

      return rows;
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
  Future<String?> createSupplier(Supplier supplier) async {
    try {
      if (supplier.refId.isEmpty) {
        supplier.refId = AppUtils.generateSmartDatabaseId('SUP');
      }

      await create(supplier);

      return supplier.refId;
    } on Exception catch (e) {
      _logger.severe('createSupplier Error: $e');

      return null;
    }
  }

  /// Updates an existing supplier.
  Future<bool> updateSupplier(Supplier supplier) async {
    try {
      await updateWhere(
        fields: fromSupplierToRaw(supplier),
        filters: [SqlQuery.equals(SuppliersFields.refId, supplier.refId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateSupplier Error: $e');

      return false;
    }
  }

  /// Deletes a supplier by ID.
  Future<bool> deleteSupplier(String supplierId) async {
    try {
      await delete(supplierId);

      return true;
    } on Exception catch (e) {
      _logger.severe('deleteSupplier Error: $e');

      return false;
    }
  }

  /// Find the supllier by query.
  Future<List<Supplier>> searchSuppliers({
    required String query,
    required String storeId,
  }) async {
    try {
      final rows = await findWhere([
        SqlQuery.like(SuppliersFields.storeIds, '%"$storeId"%'),
        if (query.isNotEmpty) ...[
          SqlQuery.like(SuppliersFields.name, '%$query%'),
        ],
      ]);

      return rows;
    } on Exception catch (e) {
      _logger.severe('searchSupplier Error: $e');

      return [];
    }
  }

  /// Stream suppliers for a specific store.
  Stream<List<Supplier>> streamStoreSuppliers(String storeId) {
    return watchWhere([
      SqlQuery.like(SuppliersFields.storeIds, '%"$storeId"%'),
    ]);
  }
}
