import 'dart:async';

import 'package:collection/collection.dart';
import 'package:get_it/get_it.dart';
import 'package:hive_ce_flutter/adapters.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:uuid/uuid.dart';

import '../../services/hive_database/hive_database.dart';
import '../../utils/logger.dart';

/// The local products repository.
class LocalProductsRepository {
  final _logger = LoggerApp('LocalProductsRepository');

  /// The hive database.
  final hiveDb = GetIt.I.get<HiveDatabase>();

  /// Constructs a new [LocalProductsRepository].
  LocalProductsRepository();

  /// Gets all products base on store Id.
  Future<List<StoreProduct>> getProductsByStoreId(String storeId) async {
    try {
      final response = hiveDb.storeProducts.values
          .where((product) => product.storeId == storeId)
          .toList();

      return response;
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
      final box = hiveDb.globalProducts;
      final response = box.values
          .where((product) => product.refId == request.refId)
          .toList();

      return response;
    } on Exception catch (e) {
      _logger.severe('findGlobalProduct Error: $e');

      return [];
    }
  }

  /// Gets all products base on business Id.
  Future<List<StoreProductWithGlobalProduct>?> findStoreProducts(
    FindProductsRequest request,
  ) async {
    try {
      final storeProducts = hiveDb.storeProducts.values
          .where((bp) => bp.storeId == request.storeId)
          .toList();
      final globalProductIds = storeProducts
          .map((bp) => bp.globalProductId)
          .toList();

      final globalProducts = hiveDb.globalProducts.values
          .where((gp) => globalProductIds.contains(gp.refId))
          .toList();

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

      return null;
    }
  }

  /// Adds a new product to a business.
  Future<bool> addProduct(AddStoreProductRequest request) async {
    try {
      final box = hiveDb.storeProducts;
      request.storeProduct..refId = const Uuid().v4();
      await box.put(request.storeProduct.refId, request.storeProduct);

      return true;
    } on Exception catch (e) {
      _logger.severe('addProduct Error: $e');

      return false;
    }
  }

  /// Gets a business product by its ID.
  Future<StoreProduct?> getStoreProduct(GetStoreProductRequest request) async {
    try {
      final box = hiveDb.storeProducts;
      final hiveProduct = box.values
          .where((product) => product.refId == request.storeProductId)
          .firstOrNull;

      return hiveProduct;
    } on Exception catch (e) {
      _logger.severe('getProduct Error: $e');

      return null;
    }
  }

  /// Updates a business product.
  Future<bool> updateStoreProduct(UpdateStoreProductRequest request) async {
    try {
      final storeProduct = hiveDb.storeProducts.values
          .where((product) => product.refId == request.storeProduct.refId)
          .firstOrNull;

      if (storeProduct == null) {
        return false;
      }

      request.storeProduct..refId = storeProduct.refId;

      await hiveDb.storeProducts.put(
        request.storeProduct.refId,
        request.storeProduct,
      );

      return true;
    } on Exception catch (e) {
      _logger.severe('updateProduct Error: $e');

      return false;
    }
  }

  /// Deletes a business product.
  Future<bool> deleteStoreProduct(DeleteStoreProductRequest request) async {
    try {
      final box = hiveDb.storeProducts;
      await box.delete(request.storeProductId);

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
      final listenable = hiveDb.storeProducts.listenable();

      return Stream<List<StoreProduct>>.multi((controller) {
        void listener() {
          final products = hiveDb.storeProducts.values
              .where((p) => p.storeId == request.storeId)
              .toList();

          controller.add(products);
        }

        listener();

        listenable.addListener(listener);

        controller.onCancel = () {
          listenable.removeListener(listener);
        };
      }).handleError((error) {
        _logger.severe('streamStoreProducts Error: $error');
      });
    } on Exception catch (e) {
      _logger.severe('streamStoreProducts Error: $e');

      return const Stream.empty();
    }
  }
}
