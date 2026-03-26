import 'dart:math';

import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../tmp/fake_data.dart';
import '../../utils/app_constants.dart';

final _fakeData = fakeData;

/// The mock of connect rpc transport.
final _fakeTransport =
    FakeTransportBuilder()
        .unary(AuthService.register, (req, _) async {
          return RegisterResponse()
            ..token = 'mock_token'
            ..refreshToken = 'mock_refresh_token';
        })
        .unary(AuthService.login, (req, _) async {
          return LoginResponse()
            ..token = 'mock_token'
            ..refreshToken = 'mock_refresh_token';
        })
        // Fake refresh token handler.
        // The access token in mock_token never truly expires (FakeTransport has
        // no JWT clock), but PowerSync may still call invalidateCredentials()
        // which triggers fetchCredentials() → refreshTokens().
        // Without this handler FakeTransport returns null, causing:
        //   JSNoSuchMethodError: tried to call a non-function, such as null: 'T[_eval]'
        .unary(AuthService.refreshToken, (req, _) async {
          return RefreshTokenResponse()
            ..token = 'mock_token'
            ..refreshToken = 'mock_refresh_token';
        })
        .unary(UserService.getCurrentUser, (req, _) async {
          return GetCurrentUserResponse(
            me: (_fakeData[CollectionName.users] as List<User>).first,
          );
        })
        .unary(SupplierService.getStoreSuppliers, (req, _) async {
          return GetStoreSuppliersResponse(
            suppliers: (_fakeData[CollectionName.suppliers] as List<Supplier>)
                .where((gp) => gp.storeIds.contains(req.storeId))
                .toList(),
          );
        })
        .unary(SupplierService.getSupplier, (req, _) async {
          return GetSupplierResponse()
            ..supplier.refId = 'supplier_2'
            ..supplier.name = 'Fournisseur Beta'
            ..supplier.contactEmail = 'beta@example.com'
            ..supplier.contactPhone = '696789012'
            ..supplier.contactAddress = 'Douala, Cameroun'
            ..supplier.status = SupplierStatus.SUPPLIER_STATUS_ACTIVE;
        })
        .unary(SupplierService.createSupplier, (req, _) async {
          final refId = 'supplier-${Random().nextInt(1000000)}';
          _fakeData[CollectionName.suppliers]?.add({
            'ref_id': refId,
            ...req.supplier.toProto3Json() as Map<String, dynamic>,
          });

          return CreateSupplierResponse(supplierId: refId);
        })
        .unary(SupplierService.updateSupplier, (req, _) async {
          final request = req;

          return UpdateSupplierResponse()..supplier = request.supplier;
        })
        .unary(SupplierService.deleteSupplier, (req, _) async {
          return DeleteSupplierResponse()..success = true;
        })
        .server(SupplierService.streamStoreSuppliers, (req, _) async* {
          // Simulate initial data
          yield StreamStoreSuppliersResponse()
            ..suppliers.addAll([
              Supplier()
                ..refId = 'supplier_1'
                ..name = 'Fournisseur Alpha'
                ..contactEmail = 'alpha@example.com'
                ..contactPhone = '696123456'
                ..contactAddress = 'Yaoundé, Cameroun'
                ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
              Supplier()
                ..refId = 'supplier_2'
                ..name = 'Fournisseur Beta'
                ..contactEmail = 'beta@example.com'
                ..contactPhone = '696789012'
                ..contactAddress = 'Douala, Cameroun'
                ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
            ]);

          // Simulate periodic updates every 10 seconds
          await Future.delayed(const Duration(seconds: 10));

          yield StreamStoreSuppliersResponse()
            ..suppliers.addAll([
              Supplier()
                ..refId = 'supplier_1'
                ..name = 'Fournisseur Alpha (Mis à jour)'
                ..contactEmail = 'alpha@example.com'
                ..contactPhone = '696123456'
                ..contactAddress = 'Yaoundé, Cameroun'
                ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
              Supplier()
                ..refId = 'supplier_2'
                ..name = 'Fournisseur Beta'
                ..contactEmail = 'beta@example.com'
                ..contactPhone = '696789012'
                ..contactAddress = 'Douala, Cameroun'
                ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
              Supplier()
                ..refId = 'supplier_3'
                ..name = 'Nouveau Fournisseur'
                ..contactEmail = 'nouveau@example.com'
                ..contactPhone = '696999999'
                ..contactAddress = 'Bamenda, Cameroun'
                ..status = SupplierStatus.SUPPLIER_STATUS_ACTIVE,
            ]);
        })
        .server(StoreProductService.streamStoreProducts, (req, _) async* {
          final request = req;

          // Simulate initial products data
          yield StreamStoreProductsResponse()
            ..products.addAll([
              StoreProduct()
                ..refId = 'product_1'
                ..globalProductId = 'global_product_1'
                ..storeId = request.storeId
                ..salePrice = 10000,
              StoreProduct()
                ..refId = 'product_2'
                ..globalProductId = 'global_product_2'
                ..storeId = request.storeId
                ..salePrice = 20000,
              StoreProduct()
                ..refId = 'product_3'
                ..globalProductId = 'global_product_3'
                ..storeId = request.storeId
                ..salePrice = 5000,
            ]);

          // Simulate periodic updates every 15 seconds
          await Future.delayed(const Duration(seconds: 15));

          yield StreamStoreProductsResponse()
            ..products.addAll([
              StoreProduct()
                ..refId = 'product_1'
                ..globalProductId = 'global_product_1'
                ..storeId = request.storeId
                ..salePrice = 10000,
              StoreProduct()
                ..refId = 'product_2'
                ..globalProductId = 'global_product_2'
                ..storeId = request.storeId
                ..salePrice = 15000,
              StoreProduct()
                ..refId = 'product_3'
                ..globalProductId = 'global_product_3'
                ..storeId = request.storeId
                ..salePrice = 2000,
              StoreProduct()
                ..refId = 'product_4'
                ..globalProductId = 'global_product_4'
                ..storeId = request.storeId
                ..salePrice = 400,
            ]);
        })
        .unary(StoreService.getBusinessStores, (req, __) async {
          return GetBusinessStoresResponse(
            stores: (_fakeData[CollectionName.stores] as List<Store>)
                .where((s) => s.businessId == req.businessId)
                .toList(),
          );
        })
        .unary(StoreService.updateStore, (req, __) async {
          final store = req.store;
          final stores = _fakeData[CollectionName.stores]
              ?.map(
                (e) =>
                    Store()..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList();

          final getStore = stores?.firstWhereOrNull(
            (s) => s.refId == store.refId,
          );

          if (getStore == null && store.refId.isEmpty) {
            return UpdateStoreResponse();
          }
          _fakeData[CollectionName.stores]?.removeWhere(
            (gp) => gp.refId == store.refId,
          );
          _fakeData[CollectionName.stores]?.add({
            'ref_id': store.refId,
            ...store.toProto3Json() as Map<String, dynamic>,
          });
          // await UserPreferences.instance.saveStorePreferences(newStore: store);

          return UpdateStoreResponse(store: store);
        })
        .unary(StoreService.getStore, (req, _) async {
          final store = (_fakeData[CollectionName.stores] as List<Store>?)
              ?.firstWhereOrNull((e) => e.refId == req.storeId);

          return GetStoreResponse(store: store);
        })
        .unary(BusinessService.getMyBusinesses, (req, __) async {
          return GetMyBusinessesResponse(
            businesses: (_fakeData[CollectionName.businesses] as List<Business>)
                .where((bm) => bm.ownerId == req.ownerId)
                .toList(),
          );
        })
        .unary(UserService.getUser, (req, __) async {
          return GetUserResponse(
            user: (_fakeData[CollectionName.users] as List<User>)
                .firstWhereOrNull((bm) => bm.refId == req.userId),
          );
        })
        .unary(BusinessService.updateBusiness, (req, __) async {
          final business = req.business;
          final businesses = _fakeData[CollectionName.businesses]
              ?.map(
                (e) =>
                    Business()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .toList();

          final getBusiness = businesses?.firstWhereOrNull(
            (s) => s.refId == business.refId,
          );

          if (getBusiness == null && business.refId.isEmpty) {
            return UpdateBusinessResponse(success: false);
          }

          _fakeData[CollectionName.businesses]?.removeWhere(
            (gp) => gp['ref_id'] == business.refId,
          );
          _fakeData[CollectionName.businesses]?.add({
            'ref_id': business.refId,
            ...business.toProto3Json() as Map<String, dynamic>,
          });

          // await UserPreferences.instance.saveBusinessPreferences(
          //   newBusiness: business,
          // );

          return UpdateBusinessResponse(success: true);
        })
        .unary(BusinessService.getBusinessMembers, (req, __) async {
          return GetBusinessMembersResponse(
            businessMembers:
                (_fakeData[CollectionName.businessMembers]
                        as List<BusinessMember>)
                    .where((bm) => bm.businessId == req.businessId)
                    .toList(),
          );
        })
        // .unary(BusinessService.getBusinessMember, (req, __) async {
        //   return GetBusinessMemberResponse(
        //     businessMember:
        //         (_fakeData[CollectionName.businessMembers]
        //                 as List<BusinessMember>)
        //             .firstWhereOrNull((bm) => bm.user.refId == req.userId),
        //   );
        // })
        // .unary(StoreService.getStoreMember, (req, __) async {
        //   return GetStoreMemberResponse(
        //     storeMember:
        //         (_fakeData[CollectionName.storeMembers] as List<StoreMember>)
        //             .firstWhereOrNull((bm) => bm.user.refId == req.userId),
        //   );
        // })
        .unary(StoreProductService.findStoreProducts, (req, __) async {
          final storeProducts =
              (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
                  .where((bp) => bp.storeId == req.storeId)
                  .toList();
          final globalProductIds = storeProducts
              .map((bp) => bp.globalProductId)
              .toList();

          final globalProducts =
              (_fakeData[CollectionName.globalProducts] as List<GlobalProduct>)
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

          return FindStoreProductsResponse(
            products: storeProductWithGlobalProducts,
          );
        })
        .unary(StoreProductService.searchStoreProducts, (req, __) async {
          final storeProducts =
              (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
                  .where((bp) => bp.storeId == req.storeId)
                  .toList();
          final globalProductIds = storeProducts
              .map((bp) => bp.globalProductId)
              .toList();

          final globalProducts =
              (_fakeData[CollectionName.globalProducts] as List<GlobalProduct>)
                  .where((gp) => globalProductIds.contains(gp.refId))
                  .where((gp) {
                    if (req.searchQuery.isNotEmpty) {
                      return (gp.name.en.toLowerCase().contains(
                            req.searchQuery.toLowerCase(),
                          ) ||
                          gp.name.fr.toLowerCase().contains(
                            req.searchQuery.toLowerCase(),
                          ) ||
                          gp.refId.toLowerCase().contains(
                            req.searchQuery.toLowerCase(),
                          ));
                    }

                    return true;
                  })
                  .toList();

          final storeProductWithGlobalProducts = storeProducts
              .where(
                (sp) =>
                    globalProducts.any((gp) => gp.refId == sp.globalProductId),
              )
              .map(
                (bp) => StoreProductWithGlobalProduct(
                  storeProduct: bp,
                  globalProduct: globalProducts.firstWhereOrNull(
                    (gp) => gp.refId == bp.globalProductId,
                  ),
                ),
              )
              .toList();

          return SearchStoreProductsResponse(
            products: storeProductWithGlobalProducts,
            totalCount: storeProductWithGlobalProducts.length,
          );
        })
        .unary(StoreProductService.findGlobalProducts, (req, __) async {
          return FindGlobalProductsResponse(
            products:
                (_fakeData[CollectionName.globalProducts]
                        as List<GlobalProduct>)
                    .where((gp) {
                      if (req.refId.isNotEmpty && req.name.isNotEmpty) {
                        return gp.refId == req.refId &&
                            (gp.name.en.toLowerCase().contains(
                                  req.name.toLowerCase(),
                                ) ||
                                gp.name.fr.toLowerCase().contains(
                                  req.name.toLowerCase(),
                                ));
                      } else if (req.refId.isNotEmpty) {
                        return gp.refId == req.refId;
                      } else if (req.barCodeValue.isNotEmpty) {
                        return gp.barCodeValue.toLowerCase().contains(
                          req.barCodeValue.toLowerCase(),
                        );
                      } else if (req.name.isNotEmpty) {
                        return (gp.name.en.toLowerCase().contains(
                              req.name.toLowerCase(),
                            ) ||
                            gp.name.fr.toLowerCase().contains(
                              req.name.toLowerCase(),
                            ));
                      }

                      return false;
                    })
                    .toList(),
          );
        })
        .unary(SupplierService.getStoreSuppliers, (req, __) async {
          return GetStoreSuppliersResponse(
            suppliers: (_fakeData[CollectionName.suppliers] as List<Supplier>)
                .where((gp) => gp.storeIds.contains(req.storeId))
                .toList(),
          );
        })
        .unary(SupplierService.getSupplier, (req, __) async {
          return GetSupplierResponse(
            supplier: (_fakeData[CollectionName.suppliers] as List<Supplier>)
                .firstWhereOrNull((gp) => gp.refId == req.supplierId),
          );
        })
        .unary(CategoryService.findCategories, (req, __) async {
          return FindCategoriesResponse(
            categories: (_fakeData[CollectionName.categories] as List<Category>)
                .where((c) => c.businessId == req.businessId)
                .toList(),
          );
        })
        .unary(StoreProductService.createGlobalProduct, (req, __) async {
          final listOfGlobalProduct =
              (_fakeData[CollectionName.globalProducts] as List<GlobalProduct>);
          // verify is the global product with the name and qrcode exit if not create one.
          final globalProduct = listOfGlobalProduct.firstWhereOrNull(
            (gp) =>
                gp.name == req.globalProduct.name &&
                gp.barCodeValue == req.globalProduct.barCodeValue,
          );
          final globalProductRefId =
              globalProduct?.refId ??
              'global-product-${Random().nextInt(1000000)}';
          if (globalProduct == null) {
            listOfGlobalProduct.add(
              req.globalProduct
                ..refId = globalProductRefId
                ..name = req.globalProduct.name,
            );
          }

          return CreateGlobalProductResponse()..success = true;
        })
        .unary(StoreProductService.addProduct, (req, __) async {
          final globalProduct =
              (_fakeData[CollectionName.globalProducts] as List<GlobalProduct>)
                  .firstWhereOrNull(
                    (gp) => gp.refId == req.globalProduct.refId,
                  );
          final globalProductRefId =
              globalProduct?.refId ??
              'global-product-${Random().nextInt(1000000)}';
          if (globalProduct == null) {
            (_fakeData[CollectionName.globalProducts] as List<GlobalProduct>)
                .add(req.globalProduct..refId = globalProductRefId);
          }

          final storeProductRefId =
              'store-product-${Random().nextInt(1000000)}';

          (_fakeData[CollectionName.storeProducts] as List<StoreProduct>).add(
            StoreProduct(
              refId: storeProductRefId,
              globalProductId: globalProductRefId,
              storeId: req.storeProduct.storeId,
              salePrice: req.storeProduct.salePrice,
              createdAt: Timestamp.fromDateTime(clock.now()),
              sku: req.storeProduct.sku,
              status: ProductStatus.PRODUCT_STATUS_ACTIVE,
              reorderPoint: req.storeProduct.reorderPoint,
            ),
          );

          if (req.initialStock > 0) {
            (_fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>)
                .add(
                  InventoryLevel(
                    storeProductId: storeProductRefId,
                    quantityAvailable: req.initialStock,
                    quantityOnHand: req.initialStock,
                    quantityCommitted: 0,
                    storeId: req.storeProduct.storeId,
                    batches: [],
                    lastUpdated: Timestamp.fromDateTime(clock.now()),
                  ),
                );
          }

          return AddStoreProductResponse()..success = true;
        })
        .unary(StoreProductService.updateStoreProduct, (req, __) async {
          final newGlobalProduct = req.globalProduct;
          final businessProduct = req.storeProduct;
          String? globalProductId = newGlobalProduct.refId;
          final listOfGlobalProduct =
              _fakeData[CollectionName.globalProducts] as List<GlobalProduct>;
          final listOfStoreProduct =
              _fakeData[CollectionName.storeProducts] as List<StoreProduct>;

          final GlobalProduct? globalProduct = listOfGlobalProduct
              .firstWhereOrNull(
                (gp) => gp.refId == businessProduct.globalProductId,
              );

          // If the use want to update the global product data, first verify if the product is not link to
          // any other store, if yes create a new global product else update the global product info.
          if (globalProduct?.refId != newGlobalProduct.refId ||
              globalProduct?.name != newGlobalProduct.name ||
              globalProduct?.barCodeValue != newGlobalProduct.barCodeValue ||
              !(newGlobalProduct.categories
                      .map((e) => e.refId)
                      .toSet()
                      .containsAll(
                        globalProduct?.categories.map((e) => e.refId).toSet() ??
                            const {},
                      ) &&
                  newGlobalProduct.categories.length ==
                      globalProduct?.categories.length)) {
            final otherBusinessWithTheGlobalProduct = listOfStoreProduct
                .firstWhereOrNull(
                  (gp) =>
                      gp.refId == globalProductId &&
                      gp.storeId != businessProduct.storeId,
                );
            if (otherBusinessWithTheGlobalProduct != null) {
              globalProductId = 'global-product-${Random().nextInt(1000000)}';
              listOfGlobalProduct.add(
                newGlobalProduct.deepCopy()..refId = globalProductId,
              );
            } else {
              listOfGlobalProduct
                ..removeWhere((gp) => gp.refId == globalProductId)
                ..add(
                  newGlobalProduct.deepCopy()..refId = globalProductId ?? '',
                );
            }
          }

          listOfStoreProduct
            ..removeWhere((gp) => gp.refId == businessProduct.refId)
            ..add(businessProduct..globalProductId = globalProductId ?? '');

          return UpdateStoreProductResponse()..success = true;
        })
        .unary(StoreProductService.deleteStoreProduct, (req, _) async {
          (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
              .removeWhere((gp) => gp.refId == req.storeProductId);

          /// Also delete all the transaction link to the product.
          (_fakeData[CollectionName.inventoryTransactions]
                  as List<InventoryTransaction>)
              .removeWhere((it) => it.productId == req.storeProductId);

          /// Also remove the inventory level.
          (_fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>)
              .removeWhere((it) => it.storeProductId == req.storeProductId);

          return DeleteStoreProductResponse()..success = true;
        })
      ..unary(StoreProductService.getStoreProduct, (req, _) async {
        final request = req;

        final storeProduct =
            (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
                .firstWhereOrNull((sp) => sp.refId == request.storeProductId);

        final res = GetStoreProductResponse(
          product: StoreProductWithGlobalProduct(
            storeProduct: storeProduct,
            globalProduct:
                (_fakeData[CollectionName.globalProducts]
                        as List<GlobalProduct>)
                    .firstWhereOrNull(
                      (gp) => gp.refId == storeProduct?.globalProductId,
                    ),
          ),
        );

        return res;
      })
      ..unary(InventoryService.adjustInventory, (req, _) async {
        final levels =
            _fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>;
        final level = levels.firstWhereOrNull(
          (l) => l.storeProductId == req.productId,
        );

        if (level != null) {
          // Optionally add transaction
          (_fakeData[CollectionName.inventoryTransactions]
                  as List<InventoryTransaction>)
              .add(
                InventoryTransaction()
                  ..refId = 'txn_${Random().nextInt(100000)}'
                  ..storeId = req.storeId
                  ..productId = req.productId
                  ..transactionType = TransactionType.TXN_TYPE_ADJUSTMENT
                  ..quantityChange = req.newQuantity - level.quantityAvailable
                  ..quantityAfter = req.newQuantity
                  ..quantityBefore = level.quantityAvailable
                  ..transactionTime = Timestamp.fromDateTime(clock.now())
                  ..notes = req.reason,
              );

          level.quantityOnHand = req.newQuantity;
          level.quantityAvailable = req.newQuantity - level.quantityCommitted;
          level.lastUpdated = Timestamp.fromDateTime(clock.now());

          return AdjustInventoryResponse(success: true, updatedLevel: level);
        }

        return AdjustInventoryResponse(success: false);
      })
      ..unary(InventoryService.getLowStockItems, (req, _) async {
        final levels =
            _fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>;

        return GetLowStockItemsResponse(
          lowStockItems: levels
              .where(
                (l) =>
                    l.quantityAvailable <= l.minThreshold &&
                    l.quantityAvailable > 0,
              )
              .toList(),
          totalCount: levels
              .where((l) => l.quantityAvailable <= l.minThreshold)
              .length,
        );
      })
      ..unary(InventoryService.getResourceInventory, (req, _) async {
        final levels =
            _fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>;

        return GetResourceInventoryResponse(
          items: levels,
          totalQuantity: levels.fold(
            0,
            (sum, l) => (sum ?? 0) + l.quantityAvailable,
          ),
          snapshotDate: Timestamp.fromDateTime(clock.now()),
        );
      })
      ..unary(ReportingService.getSalesReport, (req, _) async {
        return GetSalesReportResponse(
          summaries: [
            SalesSummary()
              ..periodStart = Timestamp.fromDateTime(clock.now())
              ..periodEnd = Timestamp.fromDateTime(
                clock.now().add(const Duration(days: 1)),
              )
              ..salesAmount = 250000
              ..transactionCount = 8
              ..unitsSold = 50,
          ],
          totalSalesAmount: 500000,
          totalTransactions: 15,
          totalUnitsSold: 100,
          averageTransactionValue: 33333,
        );
      })
      ..unary(ReportingService.getPurchaseReport, (req, _) async {
        return GetPurchaseReportResponse(
          summaries: [
            PurchaseSummary()
              ..periodStart = Timestamp.fromDateTime(clock.now())
              ..periodEnd = Timestamp.fromDateTime(
                clock.now().add(const Duration(days: 1)),
              )
              ..purchaseAmount = 300000
              ..purchaseOrderCount = 5
              ..unitsPurchased = 15,
          ],
          totalPurchaseAmount: 600000,
          totalPurchaseOrders: 12,
          totalUnitsPurchased: 50,
        );
      })
      ..unary(ReportingService.getInventoryMovementReport, (req, _) async {
        return GetInventoryMovementReportResponse(
          product: StoreProduct()
            ..refId = req.productId
            ..globalProductId = 'gp_1'
            ..salePrice = 10000,
          openingBalance: 100.0,
          totalIn: 150.0,
          totalOut: 90.0,
          closingBalance: 160.0,
          transactions: [],
        );
      })
      ..unary(ReportingService.getBestSellingProducts, (req, _) async {
        return GetBestSellingProductsResponse(
          products: [
            BestSellingProduct()
              ..product = (StoreProduct()
                ..refId = 'sp_1'
                ..globalProductId = 'gp_1'
                ..salePrice = 10000)
              ..productName = 'Product One'
              ..totalRevenue = 50000
              ..transactionCount = 5
              ..unitsSold = 10,
            BestSellingProduct()
              ..product = (StoreProduct()
                ..refId = 'sp_2'
                ..globalProductId = 'gp_2'
                ..salePrice = 15000)
              ..productName = 'Product Two'
              ..totalRevenue = 75000
              ..transactionCount = 7
              ..unitsSold = 15,
          ],
        );
      })
      ..unary(ReportingService.getStorePurchaseHistory, (req, _) async {
        return GetStorePurchaseHistoryResponse(
          store: Store()
            ..refId = req.storeId
            ..name = 'Test Store',
          invoices: [
            Invoice()
              ..refId = 'inv_1'
              ..issueDate = Timestamp.fromDateTime(clock.now())
              ..totalAmount = 100000,
            Invoice()
              ..refId = 'inv_2'
              ..issueDate = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 1)),
              )
              ..totalAmount = 150000,
          ],
          totalPurchases: 250000,
          totalPaid: 200000,
          outstandingBalance: 50000,
          transactionCount: 2,
          lastPurchaseDate: Timestamp.fromDateTime(clock.now()),
        );
      })
      ..unary(ReportingService.getSupplierPerformanceReport, (req, _) async {
        return GetSupplierPerformanceReportResponse(
          supplier: Supplier()
            ..refId = req.supplierId
            ..name = 'Test Supplier',
          totalPurchaseOrders: 8,
          totalPurchaseValue: 250000,
          onTimeDeliveries: 6,
          lateDeliveries: 2,
          onTimePercentage: 75.0,
          qualityIssues: 1,
          averageDeliveryTimeDays: 3.5,
        );
      })
      ..unary(ReportingService.getProfitLossReport, (req, _) async {
        return GetProfitLossReportResponse(
          totalRevenue: 500000,
          costOfGoodsSold: 300000,
          grossProfit: 200000,
          grossProfitMargin: 0.4,
          returnsValue: 10000,
          adjustmentsValue: 5000,
          netProfit: 175000,
        );
      })
      ..unary(ReportingService.getStockAgingReport, (req, _) async {
        return GetStockAgingReportResponse(
          items: [
            StockAgingItem()
              ..product = (StoreProduct()
                ..refId = 'sp_1'
                ..globalProductId = 'gp_1'
                ..salePrice = 10000)
              ..quantity = 10.0
              ..stockValue = 100000
              ..lastMovementDate = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 15)),
              )
              ..daysSinceLastMovement = 15
              ..movementCategory =
                  StockMovementCategory.STOCK_MOVEMENT_CATEGORY_FAST,
            StockAgingItem()
              ..product = (StoreProduct()
                ..refId = 'sp_2'
                ..globalProductId = 'gp_2'
                ..salePrice = 15000)
              ..quantity = 5.0
              ..stockValue = 75000
              ..lastMovementDate = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 30)),
              )
              ..daysSinceLastMovement = 30
              ..movementCategory =
                  StockMovementCategory.STOCK_MOVEMENT_CATEGORY_MEDIUM,
          ],
          totalStockValue: 175000,
          slowMovingStockValue: 75000,
        );
      })
      ..unary(ResourceLinkService.getResourceLinks, (req, _) async {
        final requestedIds = req.ids;
        final links = <String, ResourceLink>{};

        for (final id in requestedIds) {
          final link =
              (_fakeData[CollectionName.resourceLinks] as List<ResourceLink>)
                  .firstWhereOrNull((link) => link.refId == id);

          if (link != null) {
            links[id] = link;
          }
        }

        return GetResourceLinksResponse()..link.addAll(links);
      })
      ..unary(InventoryService.getRecentInventoryTransactions, (req, _) async {
        final request = req;

        // If product_id is specified, return transactions for that product
        final transactions =
            (_fakeData[CollectionName.inventoryTransactions]
                    as List<InventoryTransaction>)
                .where(
                  (t) =>
                      t.productId == request.productId &&
                      t.storeId == request.storeId,
                );

        return GetInventoryTransactionHistoryResponse(
          transactions: transactions,
          totalCount: transactions.length,
          totalQuantityIn: transactions
              .where((t) => t.quantityChange > 0)
              .fold<double>(0.0, (sum, t) => sum + t.quantityChange),
          totalQuantityOut: transactions
              .where((t) => t.quantityChange < 0)
              .fold<double>(0.0, (sum, t) => sum + t.quantityChange.abs()),
        );
      }) // Moc CategoryService.findCategories for product categories
      ..unary(InventoryService.getProductInventoryLevels, (req, _) async {
        final level =
            (_fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>)
                .firstWhereOrNull(
                  (po) =>
                      po.storeProductId == req.productId &&
                      po.storeId == req.storeId,
                );

        return GetProductInventoryLevelsResponse(level: level);
      })
      ..unary(ReportsService.getDashboardReport, (req, _) async {
        return GetDashboardReportResponse(
          totalSalesAmount: 500000,
          totalTransactions: 15,
          averageTransactionValue: 33333.33,
          totalUnitsSold: 100,
          totalRevenue: 450000,
          netProfit: 150000,
          grossProfitMargin: 0.333,
          totalPurchases: 300000,
          totalProducts: 50,
          totalInventoryValue: 750000,
          lowStockCount: 5,
          salesAndProfitTrend: [
            TrendDataPoint()
              ..date = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 30)),
              )
              ..salesValue = 10000.0
              ..profitValue = 3000.0,
            TrendDataPoint()
              ..date = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 25)),
              )
              ..salesValue = 15000.0
              ..profitValue = 4500.0,
          ],
          categorySalesBreakdown: [
            CategorySalesData()
              ..categoryName = 'Electronics'
              ..totalSalesAmount = 250000.0
              ..totalUnitsSold = 45
              ..transactionCount = 8
              ..percentageOfTotal = 50.0,
          ],
          revenueVsExpenses: [
            RevenueExpenseDataPoint()
              ..periodStart = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 30)),
              )
              ..periodEnd = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 25)),
              )
              ..revenue = 10000.0
              ..expenses = 7000.0
              ..netAmount = 3000.0,
          ],
          inventoryMovement: [
            StockMovementDataPoint()
              ..date = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 30)),
              )
              ..stockLevel = 100.0
              ..movementQuantity = 10.0
              ..movementType = 'IN',
          ],
          salesComparison: SalesComparisonData()
            ..previousYearTotalSales = 400000
            ..previousYearTotalTransactions = 12
            ..previousYearAverageTransactionValue = 33333.33,
          financialComparison: FinancialComparisonData()
            ..previousYearTotalRevenue = 380000
            ..previousYearNetProfit = 120000
            ..previousYearGrossProfitMargin = 0.316
            ..previousYearTotalPurchases = 260000,
          topPerformingProducts: [
            BestSellingProduct()
              ..product = (StoreProduct()
                ..refId = 'sp_1'
                ..globalProductId = 'gp_1'
                ..salePrice = 10000)
              ..productName = 'Product One'
              ..totalRevenue = 50000
              ..transactionCount = 5
              ..unitsSold = 10,
          ],
          supplierPerformances: [
            SupplierPerformanceSummary()
              ..supplierId = 'supplier_1'
              ..supplierName = 'Supplier One'
              ..totalPurchaseValue = 150000
              ..onTimePercentage = 85.0
              ..totalOrders = 6,
          ],
          stockAgingItems: [
            StockAgingItem()
              ..product = (StoreProduct()
                ..refId = 'sp_1'
                ..globalProductId = 'gp_1'
                ..salePrice = 10000)
              ..quantity = 10.0
              ..stockValue = 100000
              ..lastMovementDate = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(days: 15)),
              )
              ..daysSinceLastMovement = 15
              ..movementCategory =
                  StockMovementCategory.STOCK_MOVEMENT_CATEGORY_FAST,
          ],
        );
      })
      ..unary(InventoryService.checkProductAvailability, (req, _) async {
        return CheckProductAvailabilityResponse(
          isAvailable: true,
          quantityAvailable: 10,
        );
      })
      // Purchase Order Service mocks
      ..unary(PurchaseOrderService.createPurchaseOrder, (req, _) async {
        final purchaseOrderId =
            'PO-${clock.now().year}-${Random().nextInt(1000000)}';
        final purchaseOrder = PurchaseOrder()
          ..refId = purchaseOrderId
          ..supplierId = req.supplierId
          ..storeId = req.buyerId
          ..expectedDeliveryDate = req.expectedDeliveryDate
          ..status = PurchaseOrderStatus.PO_STATUS_PENDING
          ..totalAmount = req.items.fold<double>(
            0.0,
            (sum, item) => sum + (item.total),
          )
          ..createdAt = Timestamp.fromDateTime(clock.now())
          ..createdByUserId = req.createdByUserId
          ..notes = req.notes;

        // Add to fake data for persistence
        (_fakeData[CollectionName.purchaseOrders] as List<PurchaseOrder>).add(
          purchaseOrder,
        );

        return CreatePurchaseOrderResponse()..purchaseOrderId = purchaseOrderId;
      })
      ..unary(PurchaseOrderService.getPurchaseOrder, (req, _) async {
        final purchaseOrder =
            (_fakeData[CollectionName.purchaseOrders] as List<PurchaseOrder>)
                .firstWhereOrNull((po) => po.refId == req.purchaseOrderId);

        return GetPurchaseOrderResponse(purchaseOrder: purchaseOrder);
      })
      ..unary(PurchaseOrderService.listPurchaseOrders, (req, _) async {
        final purchaseOrders =
            (_fakeData[CollectionName.purchaseOrders] as List<PurchaseOrder>)
                .where((po) => po.storeId == req.buyerId)
                .toList();

        return ListPurchaseOrdersResponse()
          ..purchaseOrders.addAll(purchaseOrders);
      })
      ..unary(PurchaseOrderService.updatePurchaseOrderStatus, (req, _) async {
        final purchaseOrders =
            _fakeData[CollectionName.purchaseOrders] as List<PurchaseOrder>;
        final index = purchaseOrders.indexWhere(
          (po) => po.refId == req.purchaseOrderId,
        );

        if (index != -1) {
          purchaseOrders[index] = purchaseOrders[index]..status = req.newStatus;
        }

        return UpdatePurchaseOrderStatusResponse();
      })
      ..unary(PurchaseOrderService.cancelPurchaseOrder, (req, _) async {
        final purchaseOrders =
            _fakeData[CollectionName.purchaseOrders] as List<PurchaseOrder>;
        final index = purchaseOrders.indexWhere(
          (po) => po.refId == req.purchaseOrderId,
        );

        if (index != -1) {
          purchaseOrders[index] = purchaseOrders[index]
            ..status = PurchaseOrderStatus.PO_STATUS_CANCELLED;
        }

        return CancelPurchaseOrderResponse();
      })
      ..unary(PurchaseOrderService.createReceivingNote, (req, _) async {
        final receivingNoteId =
            'RN-${clock.now().year}-${Random().nextInt(1000000)}';

        final receivingNote = ReceivingNote()
          ..refId = receivingNoteId
          ..supplierId = req.supplierId
          ..storeId = req.buyerId
          ..receivedByUserId = req.receivedByUserId
          ..relatedPurchaseOrderId = req.purchaseOrderId
          ..items.addAll(req.items)
          ..receivedAt = req.hasReceivedAt()
              ? req.receivedAt
              : Timestamp.fromDateTime(clock.now())
          ..notes = req.notes;

        // Add to fake data for persistence
        if (!_fakeData.containsKey(CollectionName.receivingNotes)) {
          _fakeData[CollectionName.receivingNotes] = <ReceivingNote>[];
        }
        (_fakeData[CollectionName.receivingNotes] as List<ReceivingNote>).add(
          receivingNote,
        );

        // Process inventory updates for each item
        for (var item in req.items) {
          // Ensure inventory levels collection exists
          if (!_fakeData.containsKey(CollectionName.inventoryLevels)) {
            _fakeData[CollectionName.inventoryLevels] = <InventoryLevel>[];
          }

          final inventoryLevels =
              _fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>;

          InventoryLevel? inventoryLevel;

          // Find existing inventory level or create new one
          inventoryLevel = inventoryLevels.firstWhereOrNull(
            (il) =>
                il.storeProductId == item.productId &&
                il.storeId == req.buyerId,
          );

          inventoryLevel ??= InventoryLevel()
            ..storeProductId = item.productId
            ..storeId = req.buyerId
            ..lastUpdated = Timestamp.fromDateTime(DateTime.now())
            ..lastUpdatedByUserId = receivingNote.receivedByUserId;

          final String batchId = item.batchId.isNotEmpty
              ? item.batchId
              : 'BATCH-${clock.now().year}-${Random().nextInt(999).toString().padLeft(3, '0')}';
          Batch? existingBatch =
              (_fakeData[CollectionName.batches] as List<Batch>)
                  .firstWhereOrNull((b) => b.refId == batchId);

          if (existingBatch == null) {
            existingBatch = Batch()
              ..refId = batchId
              ..productId = item.productId
              ..warehouseId = receivingNote.storeId
              ..quantity = item.quantityReceived.toInt()
              ..expirationDate = item.expirationDate
              ..receivedAt = receivingNote.receivedAt
              ..supplierId = receivingNote.supplierId
              ..status = BatchStatus.BATCH_STATUS_ACTIVE;
            (_fakeData[CollectionName.batches] as List<Batch>).add(
              existingBatch,
            );
          } else {
            final originalQuantity = existingBatch.quantity.toInt();
            final newQuantity =
                originalQuantity + item.quantityReceived.toInt();
            existingBatch..quantity = newQuantity;
            (_fakeData[CollectionName.batches] as List<Batch>).removeWhere(
              (b) => b.refId == batchId,
            );
            (_fakeData[CollectionName.batches] as List<Batch>).add(
              existingBatch,
            );
          }

          // 2.3 - Update InventoryLeveL.
          inventoryLevel = inventoryLevel
            ..quantityOnHand += item.quantityReceived.toInt()
            ..lastUpdated = Timestamp.fromDateTime(clock.now())
            ..lastUpdatedByUserId = req.receivedByUserId;
          inventoryLevel.quantityAvailable =
              inventoryLevel.quantityOnHand - inventoryLevel.quantityCommitted;

          inventoryLevel.batches.removeWhere((b) => b.refId == batchId);
          inventoryLevel.batches.add(existingBatch);

          (_fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>)
              .removeWhere(
                (il) =>
                    il.storeProductId == item.productId &&
                    il.storeId == req.buyerId,
              );
          (_fakeData[CollectionName.inventoryLevels] as List<InventoryLevel>)
              .add(inventoryLevel);

          // 2.4 - Record InventoryTransaction

          final transaction = InventoryTransaction()
            ..refId = 'TXN-${Random().nextInt(1000000)}'
            ..storeId = req.buyerId
            ..productId = item.productId
            ..transactionType = TransactionType.TXN_TYPE_PURCHASE
            ..quantityChange = item.quantityReceived.toInt()
            ..unitPrice = item.purchasePrice.toDouble()
            ..totalAmount =
                item.purchasePrice.toDouble() * item.quantityReceived
            ..currency = 'XAF'
            ..quantityBefore = inventoryLevel.quantityAvailable
            ..quantityAfter =
                inventoryLevel.quantityAvailable + item.quantityReceived.toInt()
            ..relatedDocumentType = 'ReceivingNote'
            ..relatedDocumentId = receivingNoteId
            ..performedByUserId = req.receivedByUserId
            ..transactionTime = Timestamp.fromDateTime(clock.now())
            ..notes =
                'Received items from purchase order ${req.purchaseOrderId}'
            ..batchId = existingBatch.refId;

          (_fakeData[CollectionName.inventoryTransactions]
                  as List<InventoryTransaction>)
              .add(transaction);
        }

        // Update the parent PurchaseOrder
        final po =
            (_fakeData[CollectionName.purchaseOrders] as List<PurchaseOrder>?)
                ?.firstWhereOrNull((p) => p.refId == req.purchaseOrderId);
        if (po != null) {
          for (var item in req.items) {
            final poItem = po.items.firstWhereOrNull(
              (i) => i.productId == item.productId,
            );
            if (poItem != null) {
              poItem.quantityReceived += 0;
            }
          }
          final allReceived = po.items.every(
            (i) => i.quantityReceived >= i.quantityOrdered,
          );
          final completelyUnreceived = po.items.every(
            (i) => i.quantityReceived == 0,
          );
          if (allReceived) {
            po.status = PurchaseOrderStatus.PO_STATUS_ISSUED;
          } else if (!completelyUnreceived) {
            po.status = PurchaseOrderStatus.PO_STATUS_ISSUED;
          }
        }

        return CreateReceivingNoteResponse()
          ..rnId = receivingNoteId
          ..receivingNote = receivingNote;
      })
      // Point of Sale Service mocks for testing
      ..unary(CashReceiptService.findCashReceipt, (req, _) async {
        final request = req;

        final results =
            (_fakeData[CollectionName.cashReceipts] as List<CashReceipt>).where(
              (cr) {
                if (request.hasStoreId()) {
                  return cr.storeId == request.storeId;
                }
                if (request.hasReceiptId()) {
                  return cr.refId == request.receiptId;
                }

                return true;
              },
            ).toList();

        return FindCashReceiptResponse(receipts: results);
      })
      ..unary(AuditsService.getInventoryTransactionAuditLogs, (req, _) async {
        return GetInventoryTransactionAuditLogsResponse(
          inventoryTransactions:
              (_fakeData[CollectionName.inventoryTransactions]
                  as List<InventoryTransaction>),
        );
      })
      ..unary(AuditsService.getVoucherTransactionAuditLogs, (req, _) async {
        return GetVoucherTransactionAuditLogsResponse(
          voucherTransactions:
              (_fakeData[CollectionName.voucherTransactions]
                  as List<VoucherTransaction>),
        );
      })
      ..unary(CashReceiptService.createCashReceipt, (req, _) async {
        final request = req;
        GiftVoucher voucher;
        final receiptId = 'CR-${Random().nextInt(1000000)}';
        // Create a mock cash receipt
        final cashReceipt = request.receipt
          ..transactionTime = Timestamp.fromDateTime(clock.now())
          ..refId = receiptId
          ..currency = 'XAF';

        final paymentRef = <String>[];

        // create the payment and add the id to receipt.
        for (var payment in request.payments) {
          final paymentId = 'PAY-${Random().nextInt(1000000)}';
          paymentRef.add(paymentId);
          (_fakeData[CollectionName.payments] as List<Payment>).add(
            payment..refId = paymentId,
          );
        }

        cashReceipt.paymentIds.addAll(paymentRef);

        // if issue_voucher_on_change is true, create a voucher
        if (request.issueVoucherOnChange) {
          final voucherId = 'GV-${Random().nextInt(1000000)}';

          voucher = GiftVoucher(
            refId: voucherId,
            voucherCode: voucherId,
            initialValue: request.receipt.owedToCustomer,
            remainingValue: request.receipt.owedToCustomer,
            issuedToCustomerId: request.receipt.customerId,
            validUntil: Timestamp.fromDateTime(
              clock.now().add(const Duration(days: 30)),
            ),
            status: VoucherStatus.VOUCHER_STATUS_ACTIVE,
            issuedAt: Timestamp.fromDateTime(clock.now()),
            issuedByUserId: request.receipt.cashierUserId,
          );
          _fakeData[CollectionName.giftVouchers]?.add(voucher);
          cashReceipt.voucherIssuedCode = voucherId;
        }

        (_fakeData[CollectionName.cashReceipts] as List<CashReceipt>).add(
          cashReceipt,
        );

        /// Gets the inventory level for each item in the receipt and update the quantity.
        for (var item in request.receipt.items) {
          for (var inventoryLevel
              in (_fakeData[CollectionName.inventoryLevels]
                  as List<InventoryLevel>)) {
            if (inventoryLevel.storeProductId == item.productId &&
                inventoryLevel.storeId == request.receipt.storeId) {
              inventoryLevel
                ..quantityAvailable =
                    inventoryLevel.quantityOnHand -
                    inventoryLevel.quantityCommitted +
                    item.quantity
                ..quantityCommitted += item.quantity
                ..lastUpdated = Timestamp.fromDateTime(clock.now())
                ..lastUpdatedByUserId = request.receipt.cashierUserId;
            }
          }
        }

        // Create a inventory transaction for each item in the receipt.
        for (var item in request.receipt.items) {
          (_fakeData[CollectionName.inventoryTransactions]
                  as List<InventoryTransaction>)
              .add(
                InventoryTransaction()
                  ..refId = receiptId
                  ..storeId = request.receipt.storeId
                  ..productId = item.productId
                  ..transactionType = TransactionType.TXN_TYPE_SALE
                  ..quantityChange = -item.quantity
                  ..unitPrice = item.unitPrice
                  ..totalAmount = item.total
                  ..currency = request.receipt.currency
                  ..quantityBefore =
                      (_fakeData[CollectionName.inventoryLevels]
                              as List<InventoryLevel>)
                          .firstWhereOrNull(
                            (level) =>
                                level.storeProductId == item.productId &&
                                level.storeId == request.receipt.storeId,
                          )
                          ?.quantityAvailable ??
                      0 + item.quantity
                  ..quantityAfter =
                      (_fakeData[CollectionName.inventoryLevels]
                              as List<InventoryLevel>)
                          .firstWhereOrNull(
                            (level) =>
                                level.storeProductId == item.productId &&
                                level.storeId == request.receipt.storeId,
                          )
                          ?.quantityAvailable ??
                      0
                  ..relatedDocumentType = 'CashReceipt'
                  ..relatedDocumentId = receiptId
                  ..performedByUserId = request.receipt.cashierUserId
                  ..transactionTime = Timestamp.fromDateTime(clock.now())
                  ..notes = 'Sale of products'
                  ..batchId =
                      (_fakeData[CollectionName.inventoryLevels]
                              as List<InventoryLevel>)
                          .firstWhereOrNull(
                            (level) =>
                                level.storeProductId == item.productId &&
                                level.storeId == request.receipt.storeId,
                          )
                          ?.batches
                          .firstWhereOrNull(
                            (e) =>
                                e.refId == item.batchId ||
                                e.productId == item.productId,
                          )
                          ?.refId ??
                      '',
              );
        }

        return CreateCashReceiptResponse(success: true);
      }).build();

final fakeTransport = _fakeTransport.build();

final Map<String, dynamic> fakeStorage = {
  CollectionName.users: (_fakeData[CollectionName.users] as List<User>).first,
  CollectionName.businesses:
      (_fakeData[CollectionName.businesses] as List<Business>).first,
  CollectionName.stores:
      (_fakeData[CollectionName.stores] as List<Store>).first,
};
