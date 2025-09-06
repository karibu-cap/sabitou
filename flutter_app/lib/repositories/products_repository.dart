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
  ProductsRepository()
    : productServiceClient = ProductServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all products base on business Id.
  Future<List<BusinessProduct>> getProductsByBusinessId(
    String businessId,
  ) async {
    try {
      final response = await productServiceClient.findBusinessProducts(
        FindBusinessProductsRequest(businessId: businessId),
      );

      return response.products;
    } on Exception catch (e) {
      _logger.severe('getProductsByBusinessId Error: $e');

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
}
