import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The stores repository.
class StoresRepository {
  final _logger = LoggerApp('StoresRepository');

  /// The store service client.
  final StoreServiceClient storeServiceClient;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The instance of [StoresRepository].
  static final instance = GetIt.I.get<StoresRepository>();

  /// Constructs a new [StoresRepository].
  StoresRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : storeServiceClient = StoreServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

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

  /// Updates an user from a store.
  Future<bool> updateStoreMember(UpdateStoreMemberRequest request) async {
    try {
      final response = await storeServiceClient.updateStoreMember(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('updateStoreMember Error: $e');

      return false;
    }
  }

  /// Adds an user to a store.
  Future<bool> addUserToStore(AddUserToStoreRequest request) async {
    try {
      final response = await storeServiceClient.addUserToStore(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('addUserToStore Error: $e');

      return false;
    }
  }

  /// Adds an user to a store.
  Future<bool> setStoreMemberStatus(SetStoreMemberStatusRequest request) async {
    try {
      final response = await storeServiceClient.setStoreMemberStatus(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('setStoreMemberStatus Error: $e');

      return false;
    }
  }

  /// Removes an user from a business.
  Future<bool> removeUserFromStore(RemoveUserFromStoreRequest request) async {
    try {
      final response = await storeServiceClient.removeUserFromStore(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('removeUserFromStore Error: $e');

      return false;
    }
  }

  /// Gets the members of a store.
  Future<List<StoreMember>> getStoreMembers(
    GetStoreMembersRequest request,
  ) async {
    try {
      final response = await storeServiceClient.getStoreMembers(request);

      return response.storeMembers;
    } on Exception catch (e) {
      _logger.severe('getStoreMembers Error: $e');

      return [];
    }
  }

  /// Gets the member of a store.
  Future<StoreMember?> getStoreMember(GetStoreMemberRequest request) async {
    try {
      final response = await storeServiceClient.getStoreMember(request);

      return response.storeMember;
    } on Exception catch (e) {
      _logger.severe('getStoreMember Error: $e');

      return null;
    }
  }

  /// Stream store members.
  Stream<List<StoreMember>> streamStoreMembers(
    StreamStoreMembersRequest request,
  ) {
    try {
      // Use the native gRPC streaming service
      final grpcStream = storeServiceClient.streamStoreMembers(request);

      // Transform the gRPC stream to return List<User>
      return grpcStream.map((response) => response.storeMembers);
    } on Exception catch (e) {
      _logger.severe('streamStoreMembers Error: $e');

      // Return null stream on error
      return Stream.value([]);
    }
  }

  /// Updates a store.
  Future<bool> updateStore(Store store) async {
    try {
      final response = await storeServiceClient.updateStore(
        UpdateStoreRequest()..store = store,
      );

      return response.hasStore();
    } on Exception catch (e) {
      _logger.severe('updateStore Error: $e');

      return false;
    }
  }
}
