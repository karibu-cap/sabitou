import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The categories repository.
class CategoriesRepository {
  final _logger = LoggerApp('CategoriesRepository');

  /// The category service client.
  final CategoryServiceClient categoryServiceClient;

  /// The instance of [CategoriesRepository].
  static final to = GetIt.I.get<CategoriesRepository>();

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// Constructs a new [CategoriesRepository].
  CategoriesRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : categoryServiceClient = CategoryServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

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
        GetCategoryRequest(categoryId: refId),
      );

      return response.category;
    } on Exception catch (e) {
      _logger.severe('getCategoryByRefId Error: $e');

      return null;
    }
  }

  /// Adds a new product category.
  Future<bool> createCategory(CreateCategoryRequest request) async {
    try {
      final response = await categoryServiceClient.createCategory(request);

      return response.success;
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
      final response = await categoryServiceClient.deleteCategory(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('deleteProductCategory Error: $e');

      return false;
    }
  }
}
