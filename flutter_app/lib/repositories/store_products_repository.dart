import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The stores repository.
class StoreProductsRepository {
  final _logger = LoggerApp('StoreProductsRepository');

  /// The store service client.
  final StoreProductServiceClient storeProductsServiceClient;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The instance of [StoreProductsRepository].
  static final instance = GetIt.I.get<StoreProductsRepository>();

  /// Constructs a new [StoreProductsRepository].
  StoreProductsRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : storeProductsServiceClient = StoreProductServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Get total products count for a store.
  Future<List<StoreProduct>> getStoreProductByStoreId(String storeId) async {
    try {
      final request = FindStoreProductsRequest(storeId: storeId);
      final response = await storeProductsServiceClient.findStoreProducts(
        request,
      );

      return response.products;
    } catch (e) {
      _logger.severe('Error getting total products: $e');
      rethrow;
    }
  }

  /// Lists products with pagination and filters.
  Future<ListStoreProductsResponse> listStoreProducts(
    ListStoreProductsRequest request,
  ) async {
    try {
      return await storeProductsServiceClient.listStoreProducts(request);
    } on Exception catch (e) {
      _logger.severe('listProducts Error: $e');

      return ListStoreProductsResponse();
    }
  }
}
