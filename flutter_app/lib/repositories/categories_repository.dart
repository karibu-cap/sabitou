import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';

/// The categories repository.
class CategoriesRepository extends BaseRepository<Category> {
  final _logger = LoggerApp('CategoriesRepository');

  /// The category service client.
  final CategoryServiceClient categoryServiceClient;

  /// The instance of [CategoriesRepository].
  static final instance = GetIt.I.get<CategoriesRepository>();

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.categories;

  @override
  Category fromRow(RawRow row) => fromRowToCategory(row);

  @override
  RawRow toRow(Category entity) => fromCategoryToRaw(entity);

  /// Constructs a new [CategoriesRepository].
  CategoriesRepository({required this.dataSource})
    : categoryServiceClient = CategoryServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all categories base on business Id.
  Future<List<Category>> getCategoriesByBusinessId(String businessId) async {
    try {
      final response = await findWhere([
        SqlQuery.equals(CategoriesFields.businessId, businessId),
      ]);

      return response;
    } on Exception catch (e) {
      _logger.severe('getCategoriesByBusinessId Error: $e');

      return [];
    }
  }

  /// Gets all categories.
  Future<List<Category>> getCategories({
    String? businessId,
    String? refId,
    String? name,
    String? parentCategoryId,
    CategoryStatus? status,
    CategoryType? type,
  }) async {
    try {
      final response = await findWhere([
        if (businessId != null)
          SqlQuery.equals(CategoriesFields.businessId, businessId),
        if (refId != null) SqlQuery.equals(CategoriesFields.refId, refId),
        if (name != null) SqlQuery.equals(CategoriesFields.name, name),
        if (parentCategoryId != null)
          SqlQuery.equals(CategoriesFields.parentCategoryId, parentCategoryId),
        if (status != null)
          SqlQuery.equals(CategoriesFields.status, status.name),
        if (type != null) SqlQuery.equals(CategoriesFields.type, type.name),
      ]);

      return response;
    } on Exception catch (e) {
      _logger.severe('getCategories Error: $e');

      return [];
    }
  }

  /// Gets all categories.
  Future<List<Category>> findCategories(String query, String businessId) async {
    try {
      final response = await findWhere([
        SqlQuery.equals(CategoriesFields.businessId, businessId),
        if (query.isNotEmpty) SqlQuery.like(CategoriesFields.name, '%$query%'),
        SqlQuery.equals(
          CategoriesFields.status,
          CategoryStatus.CATEGORY_STATUS_ACTIVE.name,
        ),
      ]);

      return response;
    } on Exception catch (e) {
      _logger.severe('getCategories Error: $e');

      return [];
    }
  }

  /// Gets a category by ref.
  Future<Category?> getCategoryByRefId(String refId) async {
    try {
      final response = await findById(refId);

      return response;
    } on Exception catch (e) {
      _logger.severe('getCategoryByRefId Error: $e');

      return null;
    }
  }

  /// Adds a new product category.
  Future<bool> createCategory(Category category) async {
    try {
      if (category.refId.isEmpty) {
        category.refId = AppUtils.generateSmartDatabaseId('CTG');
      }

      await create(category);

      return true;
    } on Exception catch (e) {
      _logger.severe('CreateCategoryRequest Error: $e');

      return false;
    }
  }

  /// Updates a product category.
  Future<bool> updateCategory(Category category) async {
    try {
      await updateWhere(
        fields: fromCategoryToRaw(category),
        filters: [SqlQuery.equals(CategoriesFields.refId, category.refId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateProductCategory Error: $e');

      return false;
    }
  }

  /// Deletes a product category.
  Future<bool> deleteProductCategory(String categoryId) async {
    try {
      await dataSource.deleteWhere(
        table: CollectionName.categories,
        filters: [SqlQuery.equals(CategoriesFields.refId, categoryId)],
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('deleteProductCategory Error: $e');

      return false;
    }
  }
}
