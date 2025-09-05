import 'package:collection/collection.dart';
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

  /// Gets the global product by ref.
  Future<GlobalProduct?> getGlobalProductByRefId(String refId) async {
    try {
      final response = await productServiceClient.findGlobalProducts(
        FindGlobalProductsRequest(refId: refId),
      );

      return response.products.firstWhereOrNull((gp) => gp.refId == refId);
    } on Exception catch (e) {
      _logger.severe('getGlobalProductByRefId Error: $e');

      return null;
    }
  }
}
