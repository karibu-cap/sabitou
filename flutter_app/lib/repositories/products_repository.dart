import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'locales/local_products_repository.dart';
import 'remotes/remote_products_repository.dart';

/// The products repository.
class ProductsRepository {
  final _logger = LoggerApp('ProductsRepository');

  /// The instance of [ProductsRepository].
  static final instance = GetIt.I.get<ProductsRepository>();

  /// The network status provider.
  final NetworkStatusProvider _network;

  /// The local products repository.
  final LocalProductsRepository localProductsRepository =
      LocalProductsRepository();

  /// The remote products repository.
  final RemoteProductsRepository remoteProductsRepository;

  /// Constructs a new [ProductsRepository].
  ProductsRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : _network = networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>(),
       remoteProductsRepository = RemoteProductsRepository(
         transport: transport ?? ConnectRPCService.to.clientChannel,
       );

  /// Gets all products base on store Id.
  Future<List<StoreProduct>> getProductsByStoreId(String storeId) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        return await remoteProductsRepository.getProductsByStoreId(storeId);
      }

      return localProductsRepository.getProductsByStoreId(storeId);
    } on Exception catch (e) {
      _logger.severe('getProductsByStoreId Error: $e');

      return [];
    }
  }

  /// Finds global products.
  Future<List<GlobalProduct>> findGlobalProducts(
    FindGlobalProductsRequest request,
  ) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        return await remoteProductsRepository.findGlobalProducts(request);
      }

      return localProductsRepository.findGlobalProducts(request);
    } on Exception catch (e) {
      _logger.severe('findGlobalProducts Error: $e');

      return [];
    }
  }

  /// Gets all products base on business Id.
  Future<List<StoreProduct>> findStoreProducts(
    FindStoreProductsRequest request,
  ) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        return await remoteProductsRepository.findStoreProducts(request);
      }

      return localProductsRepository.findStoreProducts(request);
    } on Exception catch (e) {
      _logger.severe('findStoreProducts Error: $e');

      return [];
    }
  }

  /// Adds a new product to a business.
  Future<bool> addProduct(AddStoreProductRequest request) async {
    try {
      return await remoteProductsRepository.addProduct(request);
    } on Exception catch (e) {
      _logger.severe('addProduct Error: $e');

      return false;
    }
  }

  /// Gets a business product by its ID.
  Future<StoreProduct?> getStoreProduct(GetStoreProductRequest request) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        return await remoteProductsRepository.getStoreProduct(request);
      }

      return localProductsRepository.getStoreProduct(request);
    } on Exception catch (e) {
      _logger.severe('getProduct Error: $e');

      return null;
    }
  }

  /// Updates a business product.
  Future<bool> updateStoreProduct(UpdateStoreProductRequest request) async {
    try {
      return await remoteProductsRepository.updateStoreProduct(request);
    } on Exception catch (e) {
      _logger.severe('updateProduct Error: $e');

      return false;
    }
  }

  /// Deletes a business product.
  Future<bool> deleteStoreProduct(DeleteStoreProductRequest request) async {
    try {
      return await remoteProductsRepository.deleteStoreProduct(request);
    } on Exception catch (e) {
      _logger.severe('deleteProduct Error: $e');

      return false;
    }
  }

  /// Adds a new global product.
  Future<bool> createGlobalProduct(CreateGlobalProductRequest request) async {
    return await remoteProductsRepository.createGlobalProduct(request);
  }

  /// Updates a global product.
  Future<bool> updateGlobalProduct(UpdateGlobalProductRequest request) async {
    return await remoteProductsRepository.updateGlobalProduct(request);
  }

  /// Deletes a global product.
  Future<bool> deleteGlobalProduct(DeleteGlobalProductRequest request) async {
    return await remoteProductsRepository.deleteGlobalProduct(request);
  }

  /// Streams all products for a business for real-time updates.
  Stream<List<StoreProduct>> streamStoreProducts(
    StreamStoreProductsRequest request,
  ) async* {
    try {
      yield* remoteProductsRepository.streamStoreProducts(request);
    } on Exception catch (e) {
      _logger.severe('streamStoreProducts Error: $e');
      // Return empty stream on error

      yield* const Stream.empty();
    }
  }

  /// Streams global products based on store Id for real-time updates.
  Stream<List<GlobalProduct>> streamGlobalProducts(
    StreamGlobalProductsRequest request,
  ) async* {
    try {
      yield* remoteProductsRepository.streamGlobalProducts(request);
    } on Exception catch (e) {
      _logger.severe('streamGlobalProducts Error: $e');
      // Return empty stream on error

      yield* const Stream.empty();
    }
  }
}
