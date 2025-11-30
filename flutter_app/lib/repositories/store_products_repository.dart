import 'package:collection/collection.dart';
import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../services/storage/app_storage.dart';
import '../utils/logger.dart';

/// The products repository.
class StoreProductsRepository {
  final _logger = LoggerApp('StoreProductsRepository');

  /// The instance of [StoreProductsRepository].
  static final instance = GetIt.I.get<StoreProductsRepository>();

  /// The product service client.
  final StoreProductServiceClient storeProductServiceClient;

  /// The network status provider.
  final NetworkStatusProvider _network;

  /// Constructs a new [StoreProductsRepository].
  StoreProductsRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : _network = networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>(),
       storeProductServiceClient = StoreProductServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       );

  /// Gets all products base on store Id.
  Future<List<StoreProductWithGlobalProduct>?> findStoreProducts(
    FindStoreProductsRequest request,
  ) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        final result = await storeProductServiceClient.findStoreProducts(
          request,
        );

        return result.products;
      }

      final storeProducts = (await AppStorage.of<StoreProduct>().getAll())
          .where((bp) => bp.storeId == request.storeId);

      final globalProductIds = storeProducts
          .map((bp) => bp.globalProductId)
          .toList();

      final globalProducts = (await AppStorage.of<GlobalProduct>().getAll())
          .where((gp) => globalProductIds.contains(gp.refId));

      final storeProductWithGlobalProducts = storeProducts
          .map(
            (bp) => StoreProductWithGlobalProduct()
              ..storeProduct = bp
              ..globalProduct =
                  globalProducts.firstWhereOrNull(
                    (gp) => gp.refId == bp.globalProductId,
                  ) ??
                  GlobalProduct(),
          )
          .toSet();

      return storeProductWithGlobalProducts.toList();
    } on Exception catch (e) {
      _logger.severe('findStoreProducts Error: $e');

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
        final result = await storeProductServiceClient.findGlobalProducts(
          request,
        );

        return result.products;
      }

      final values = await AppStorage.of<GlobalProduct>().getAll();
      final response = values
          .where((product) => product.refId == request.refId)
          .toList();

      return response;
    } on Exception catch (e) {
      _logger.severe('findGlobalProducts Error: $e');

      return [];
    }
  }

  /// Adds a new product to a business.
  Future<bool> addProduct(AddStoreProductRequest request) async {
    try {
      final result = await storeProductServiceClient.addProduct(request);

      return result.success;
    } on Exception catch (e) {
      _logger.severe('addProduct Error: $e');

      return false;
    }
  }

  /// Gets a business product by its ID.
  Future<StoreProductWithGlobalProduct?> getStoreProduct(
    GetStoreProductRequest request,
  ) async {
    try {
      final connection = await _network.checkConnectivity();

      if (connection) {
        final result = await storeProductServiceClient.getStoreProduct(request);

        return result.product;
      }

      final values = await AppStorage.of<StoreProduct>().getAll();
      final hiveProduct = values
          .where((product) => product.refId == request.storeProductId)
          .firstOrNull;
      if (hiveProduct == null) {
        return null;
      }

      final globalProductIds = hiveProduct.globalProductId;
      final globalProducts = (await AppStorage.of<GlobalProduct>().getAll())
          .firstWhereOrNull((gp) => gp.refId == globalProductIds);

      final storeProductWithGlobalProducts = StoreProductWithGlobalProduct()
        ..storeProduct = hiveProduct
        ..globalProduct = globalProducts ?? GlobalProduct();

      return storeProductWithGlobalProducts;
    } on Exception catch (e) {
      _logger.severe('getProduct Error: $e');

      return null;
    }
  }

  /// Updates a business product.
  Future<bool> updateProduct(UpdateStoreProductRequest request) async {
    try {
      final result = await storeProductServiceClient.updateStoreProduct(
        request,
      );

      return result.success;
    } on Exception catch (e) {
      _logger.severe('updateProduct Error: $e');

      return false;
    }
  }

  /// Deletes a business product.
  Future<bool> deleteProduct(DeleteStoreProductRequest request) async {
    try {
      final result = await storeProductServiceClient.deleteStoreProduct(
        request,
      );

      return result.success;
    } on Exception catch (e) {
      _logger.severe('deleteProduct Error: $e');

      return false;
    }
  }

  /// Adds a new global product.
  Future<bool> createGlobalProduct(CreateGlobalProductRequest request) async {
    final result = await storeProductServiceClient.createGlobalProduct(request);

    return result.success;
  }

  /// Updates a global product.
  Future<bool> updateGlobalProduct(UpdateGlobalProductRequest request) async {
    final result = await storeProductServiceClient.updateGlobalProduct(request);

    return result.success;
  }

  /// Deletes a global product.
  Future<bool> deleteGlobalProduct(DeleteGlobalProductRequest request) async {
    final result = await storeProductServiceClient.deleteGlobalProduct(request);

    return result.success;
  }

  /// Streams all products for a business for real-time updates.
  Stream<List<StoreProduct>> streamStoreProducts(
    StreamStoreProductsRequest request,
  ) async* {
    try {
      yield* storeProductServiceClient
          .streamStoreProducts(request)
          .map((response) => response.products);
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
      yield* storeProductServiceClient
          .streamGlobalProducts(request)
          .map((response) => response.products);
    } on Exception catch (e) {
      _logger.severe('streamGlobalProducts Error: $e');
      // Return empty stream on error

      yield* const Stream.empty();
    }
  }

  /// Searches product .
  Future<SearchStoreProductsResponse> searchProducts(
    SearchStoreProductsRequest request,
  ) async {
    try {
      return await storeProductServiceClient.searchStoreProducts(request);
    } on Exception catch (e) {
      _logger.severe('searchProducts Error: $e');

      return SearchStoreProductsResponse();
    }
  }
}
