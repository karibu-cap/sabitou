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
  Future<List<Category>> getCategories(FindCategoriesRequest request) async {
    try {
      final response = await findWhere([
        if (request.businessId.isNotEmpty)
          SqlQuery.equals(CategoriesFields.businessId, request.businessId),
        if (request.refId.isNotEmpty)
          SqlQuery.equals(CategoriesFields.refId, request.refId),
        if (request.name.isNotEmpty)
          SqlQuery.equals(CategoriesFields.name, request.name),
        if (request.parentCategoryId.isNotEmpty)
          SqlQuery.equals(
            CategoriesFields.parentCategoryId,
            request.parentCategoryId,
          ),
        if (request.hasStatus())
          SqlQuery.equals(CategoriesFields.status, request.status.name),
        if (request.hasType())
          SqlQuery.equals(CategoriesFields.type, request.type.name),
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
  Future<bool> updateCategory(UpdateCategoryRequest request) async {
    try {
      final response = await categoryServiceClient.updateCategory(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('updateProductCategory Error: $e');

      return false;
    }
  }

  /// Deletes a product category.
  Future<bool> deleteProductCategory(DeleteCategoryRequest request) async {
    try {
      await delete(request.categoryId);

      return true;
    } on Exception catch (e) {
      _logger.severe('deleteProductCategory Error: $e');

      return false;
    }
  }
}
