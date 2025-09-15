import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The products repository.
class ProductsRepository {
  final _logger = LoggerApp('ProductsRepository');

  /// The product service client.
  final ProductServiceClient productServiceClient;

  /// The instance of [ProductsRepository].
  static final instance = GetIt.I.get<ProductsRepository>();

  /// Constructs a new [ProductsRepository].
  ProductsRepository([connect.Transport? transport])
    : productServiceClient = ProductServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Gets all products base on store Id.
  Future<List<StoreProduct>> getProductsByStoreId(String storeId) async {
    try {
      final response = await productServiceClient.findStoreProducts(
        FindStoreProductsRequest(storeId: storeId),
      );

      return response.products;
    } on Exception catch (e) {
      _logger.severe('getProductsByStoreId Error: $e');

      return [];
    }
  }

  /// Finds global products.
  Future<List<GlobalProduct>> findGlobalProduct(
    FindGlobalProductsRequest request,
  ) async {
    try {
      final response = await productServiceClient.findGlobalProducts(request);

      return response.products;
    } on Exception catch (e) {
      _logger.severe('findGlobalProduct Error: $e');

      return [];
    }
  }

  /// Gets all products base on business Id.
  Future<List<StoreProduct>> findStoreProducts(
    FindStoreProductsRequest request,
  ) async {
    try {
      final response = await productServiceClient.findStoreProducts(request);

      return response.products;
    } on Exception catch (e) {
      _logger.severe('findStoreProducts Error: $e');

      return [];
    }
  }

  /// Finds global products by categories.
  Future<List<GlobalProduct>> findGlobalProducts(
    FindGlobalProductsRequest request,
  ) async {
    try {
      final response = await productServiceClient.findGlobalProducts(request);

      return response.products;
    } on Exception catch (e) {
      _logger.severe('findGlobalProducts Error: $e');

      return [];
    }
  }

  /// Finds product categories by query.
  Future<List<ProductCategory>> findCategories(
    FindCategoryRequest request,
  ) async {
    try {
      final response = await productServiceClient.findCategory(request);

      return response.categories;
    } on Exception catch (e) {
      _logger.severe('findCategories Error: $e');

      return [];
    }
  }

  /// Adds a new product to a business.
  Future<bool> addProduct(AddStoreProductRequest request) async {
    try {
      final response = await productServiceClient.addProduct(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('addProduct Error: $e');

      return false;
    }
  }

  /// Gets a business product by its ID.
  Future<StoreProduct?> getProduct(GetStoreProductRequest request) async {
    try {
      final response = await productServiceClient.getProduct(request);

      return response.storeProduct;
    } on Exception catch (e) {
      _logger.severe('getProduct Error: $e');

      return null;
    }
  }

  /// Updates a business product.
  Future<bool> updateProduct(UpdateStoreProductRequest request) async {
    try {
      final response = await productServiceClient.updateProduct(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('updateProduct Error: $e');

      return false;
    }
  }

  /// Deletes a business product.
  Future<bool> deleteProduct(DeleteStoreProductRequest request) async {
    try {
      final response = await productServiceClient.deleteProduct(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('deleteProduct Error: $e');

      return false;
    }
  }

  /// Streams all products for a business for real-time updates.
  Stream<List<StoreProduct>> streamStoreProducts(
    StreamStoreProductsRequest request,
  ) {
    try {
      return productServiceClient
          .streamStoreProducts(request)
          .map((response) => response.products)
          .handleError((error) {
            _logger.severe('streamStoreProducts Error: $error');
          });
    } on Exception catch (e) {
      _logger.severe('streamStoreProducts Error: $e');
      // Return empty stream on error

      return const Stream.empty();
    }
  }
}
