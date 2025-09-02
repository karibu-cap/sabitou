import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';

/// The stores repository.
final class StoresRepository extends GetxService {
  /// The store service client.
  final StoreServiceClient storeServiceClient;

  /// The instance of [StoresRepository].
  static final instance = Get.find<StoresRepository>();

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
    } catch (e) {
      debugPrint(e.toString());

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
    } catch (e) {
      debugPrint(e.toString());

      return null;
    }
  }
}
