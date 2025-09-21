import 'package:get_it/get_it.dart';
import 'package:isar_community/isar.dart';
import 'package:sabitou_rpc/models.dart';

import '../../entities/global_product_isar.dart';
import '../../entities/product_category_isar.dart';
import '../../entities/store_product_isar.dart';
import '../../services/isar_database/isar_database.dart';
import '../../utils/logger.dart';

/// The local products repository.
class LocalProductsRepository {
  final _logger = LoggerApp('LocalProductsRepository');

  /// The isar box.
  final isarBox = GetIt.I.get<IsarDatabase>();

  /// Constructs a new [LocalProductsRepository].
  LocalProductsRepository();

  /// Gets all products base on store Id.
  Future<List<StoreProduct>> getProductsByStoreId(String storeId) async {
    try {
      final response = await isarBox.storeProductIsars
          .filter()
          .storeIdEqualTo(storeId)
          .findAll();

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
      final response = await isarBox.globalProductIsars
          .filter()
          .refIdEqualTo(request.refId)
          .findAll();

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
      final response = await isarBox.storeProductIsars
          .filter()
          .globalProductIdEqualTo(request.refId)
          .findAll();

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
      final response = await isarBox.productCategoryIsars
          .filter()
          .nameContains(request.query, caseSensitive: false)
          .findAll();

      return response.map((e) => e.toProto()).toList();
    } on Exception catch (e) {
      _logger.severe('findCategories Error: $e');

      return [];
    }
  }

  /// Adds a new product to a business.
  Future<bool> addProduct(AddStoreProductRequest request) async {
    try {
      await isarBox.writeTxn(() async {
        await isarBox.storeProductIsars.put(
          StoreProductIsar.fromProto(request.storeProduct),
        );
      });

      return true;
    } on Exception catch (e) {
      _logger.severe('addProduct Error: $e');

      return false;
    }
  }

  /// Gets a business product by its ID.
  Future<StoreProduct?> getProduct(GetStoreProductRequest request) async {
    try {
      final response = await isarBox.storeProductIsars
          .filter()
          .refIdEqualTo(request.storeProductId)
          .findAll();

      return response.isNotEmpty ? response.first.toProto() : null;
    } on Exception catch (e) {
      _logger.severe('getProduct Error: $e');

      return null;
    }
  }

  /// Updates a business product.
  Future<bool> updateProduct(UpdateStoreProductRequest request) async {
    try {
      final storeProductObx = await isarBox.storeProductIsars
          .filter()
          .refIdEqualTo(request.storeProduct.refId)
          .findAll();

      if (storeProductObx.isEmpty) {
        return false;
      }

      storeProductObx.first
        ..price = request.storeProduct.price
        ..minStockThreshold = request.storeProduct.minStockThreshold
        ..imagesLinksIds = request.storeProduct.imagesLinksIds
        ..globalProductId = request.storeProduct.globalProductId
        ..storeId = request.storeProduct.storeId
        ..inboundDate = request.storeProduct.inboundDate.toDateTime()
        ..expirationDate = request.storeProduct.expirationDate.toDateTime()
        ..createdAt = request.storeProduct.createdAt.toDateTime()
        ..updatedAt = request.storeProduct.updatedAt.toDateTime()
        ..stockQuantity = request.storeProduct.stockQuantity
        ..supplierId = request.storeProduct.supplierId;

      await isarBox.writeTxn(() async {
        await isarBox.storeProductIsars.put(storeProductObx.first);
      });

      return true;
    } on Exception catch (e) {
      _logger.severe('updateProduct Error: $e');

      return false;
    }
  }

  /// Deletes a business product.
  Future<bool> deleteProduct(DeleteStoreProductRequest request) async {
    try {
      final storeProductObx = await isarBox.storeProductIsars
          .filter()
          .refIdEqualTo(request.storeProductId)
          .findAll();

      if (storeProductObx.isEmpty) {
        return false;
      }

      await isarBox.writeTxn(() async {
        await isarBox.storeProductIsars.delete(storeProductObx.first.id);
      });

      return true;
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
      return isarBox.storeProductIsars
          .filter()
          .storeIdEqualTo(request.storeId)
          .watch()
          .map((response) => response.map((e) => e.toProto()).toList())
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
