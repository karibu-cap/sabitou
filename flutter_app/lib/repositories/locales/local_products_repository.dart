import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../../entities/global_product_obx.dart';
import '../../entities/product_category_obx.dart';
import '../../entities/store_product_obx.dart';
import '../../objectbox.g.dart' as obx;
import '../../utils/logger.dart';

/// The local products repository.
class LocalProductsRepository {
  final _logger = LoggerApp('LocalProductsRepository');

  /// The store product box.
  final storeProductBox = GetIt.I.get<obx.Store>().box<StoreProductObx>();

  /// The global product box.
  final globalProductBox = GetIt.I.get<obx.Store>().box<GlobalProductObx>();

  /// The product category box.
  final productCategoryBox = GetIt.I.get<obx.Store>().box<ProductCategoryObx>();

  /// Constructs a new [LocalProductsRepository].
  LocalProductsRepository();

  /// Gets all products base on store Id.
  Future<List<StoreProduct>> getProductsByStoreId(String storeId) async {
    try {
      final response = storeProductBox
          .query(obx.StoreProductObx_.storeId.equals(storeId))
          .build()
          .find();

      return response.map((e) => e.toProto()).toList();
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
      final response = globalProductBox
          .query(obx.GlobalProductObx_.refId.equals(request.refId))
          .build()
          .find();

      return response.map((e) => e.toProto()).toList();
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
      final response = storeProductBox
          .query(obx.StoreProductObx_.globalProductId.equals(request.refId))
          .build()
          .find();

      return response.map((e) => e.toProto()).toList();
    } on Exception catch (e) {
      _logger.severe('findStoreProducts Error: $e');

      return [];
    }
  }

  /// Finds product categories by query.
  Future<List<ProductCategory>> findCategories(
    FindCategoryRequest request,
  ) async {
    try {
      final response = productCategoryBox
          .query(obx.ProductCategoryObx_.name.contains(request.query))
          .build()
          .find();

      return response.map((e) => e.toProto()).toList();
    } on Exception catch (e) {
      _logger.severe('findCategories Error: $e');

      return [];
    }
  }

  /// Adds a new product to a business.
  Future<bool> addProduct(AddStoreProductRequest request) async {
    try {
      final response = storeProductBox.put(
        StoreProductObx.fromProto(request.storeProduct),
      );

      return response > 0;
    } on Exception catch (e) {
      _logger.severe('addProduct Error: $e');

      return false;
    }
  }

  /// Gets a business product by its ID.
  Future<StoreProduct?> getProduct(GetStoreProductRequest request) async {
    try {
      final response = storeProductBox
          .query(obx.StoreProductObx_.refId.equals(request.storeProductId))
          .build()
          .find();

      return response.isNotEmpty ? response.first.toProto() : null;
    } on Exception catch (e) {
      _logger.severe('getProduct Error: $e');

      return null;
    }
  }

  /// Updates a business product.
  Future<bool> updateProduct(UpdateStoreProductRequest request) async {
    try {
      final storeProductObx = storeProductBox
          .query(obx.StoreProductObx_.refId.equals(request.storeProduct.refId))
          .build()
          .find();

      if (storeProductObx.isEmpty) {
        return false;
      }

      storeProductObx.first
        ..price = request.storeProduct.price
        ..minStockThreshold = request.storeProduct.minStockThreshold
        ..imagesLinksIds = request.storeProduct.imagesLinksIds
        ..globalProductId = request.storeProduct.globalProductId
        ..storeId = request.storeProduct.storeId
        ..inboundDate = request.storeProduct.inboundDate
        ..expirationDate = request.storeProduct.expirationDate
        ..createdAt = request.storeProduct.createdAt
        ..updatedAt = request.storeProduct.updatedAt
        ..stockQuantity = request.storeProduct.stockQuantity
        ..supplierId = request.storeProduct.supplierId;

      final response = storeProductBox.put(storeProductObx.first);

      return response > 0;
    } on Exception catch (e) {
      _logger.severe('updateProduct Error: $e');

      return false;
    }
  }

  /// Deletes a business product.
  Future<bool> deleteProduct(DeleteStoreProductRequest request) async {
    try {
      final storeProductObx = storeProductBox
          .query(obx.StoreProductObx_.refId.equals(request.storeProductId))
          .build()
          .find();

      if (storeProductObx.isEmpty) {
        return false;
      }

      final response = storeProductBox.remove(storeProductObx.first.id);

      return response;
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
      return storeProductBox
          .query(obx.StoreProductObx_.storeId.equals(request.storeId))
          .watch(triggerImmediately: true)
          .map((response) => response.find().map((e) => e.toProto()).toList())
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
