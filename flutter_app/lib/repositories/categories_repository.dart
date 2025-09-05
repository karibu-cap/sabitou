import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The categories repository.
class CategoriesRepository {
  final _logger = LoggerApp('CategoriesRepository');

  /// The category service client.
  final CategoryServiceClient categoryServiceClient;

  /// The instance of [CategoriesRepository].
  static final to = GetIt.I.get<CategoriesRepository>();

  /// Constructs a new [CategoriesRepository].
  CategoriesRepository()
    : categoryServiceClient = CategoryServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all categories base on business Id.
  Future<List<Category>> getCategoriesByBusinessId(String businessId) async {
    try {
      final response = await categoryServiceClient.findCategories(
        FindCategoriesRequest(businessId: businessId),
      );

      return response.categories;
    } on Exception catch (e) {
      _logger.severe('getCategoriesByBusinessId Error: $e');

      return [];
    }
  }

  /// Gets a category by ref.
  Future<Category?> getCategoryByRefId(String refId) async {
    try {
      final response = await categoryServiceClient.getCategory(
        GetCategoryRequest(refId: refId),
      );

      return response.category;
    } on Exception catch (e) {
      _logger.severe('getCategoryByRefId Error: $e');

      return null;
    }
  }
}
