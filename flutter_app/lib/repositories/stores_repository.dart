import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The stores repository.
class StoresRepository {
  final _logger = LoggerApp('StoresRepository');

  /// The store service client.
  final StoreServiceClient storeServiceClient;

  /// The instance of [StoresRepository].
  static final instance = GetIt.I.get<StoresRepository>();

  /// Constructs a new [StoresRepository].
  StoresRepository()
    : storeServiceClient = StoreServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets all stores base on business Id.
  Future<List<Store>> getStoresByBusinessId(String businessId) async {
    try {
      final response = await storeServiceClient.getBusinessStores(
        GetBusinessStoresRequest(businessId: businessId),
      );

      return response.stores;
    } on Exception catch (e) {
      _logger.severe('getStoresByBusinessId Error: $e');

      return [];
    }
  }

  /// Get the store by ref.
  Future<Store?> getStoreByRefId(String refId) async {
    try {
      final response = await storeServiceClient.getStore(
        GetStoreRequest(storeId: refId),
      );

      return response.store;
    } on Exception catch (e) {
      _logger.severe('getStoreByRefId Error: $e');

      return null;
    }
  }
}
