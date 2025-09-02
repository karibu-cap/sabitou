import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/rpc/connect_rpc.dart';

/// The products repository.
final class ProductsRepository extends GetxService {
  /// The product service client.
  final ProductServiceClient productServiceClient;

  /// The instance of [ProductsRepository].
  static final instance = Get.find<ProductsRepository>();

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
    } catch (e) {
      debugPrint(e.toString());
      print(e);

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
    } catch (e) {
      debugPrint(e.toString());
      print(e);

      return null;
    }
  }
}
