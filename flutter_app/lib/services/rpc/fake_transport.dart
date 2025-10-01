import 'dart:math';

import 'package:clock/clock.dart';
import 'package:collection/collection.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../tmp/fake_data.dart';
import '../../utils/app_constants.dart';
import '../../utils/user_preference.dart';

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
        .unary(UserService.getCurrentUser, (req, _) async {
          return GetCurrentUserResponse()
            ..me = User()
            ..me.accountStatus = AccountStatusType.ACCOUNT_STATUS_TYPE_ACTIVE
            ..me.refId = 'mock_id'
            ..me.firstName = 'mock_first_name'
            ..me.lastName = 'mock_last_name'
            ..me.email = 'mock_email@gmail.com'
            ..me.phoneNumber = '696526541'
            ..me.profileLink = ResourceLink()
            ..me.profileLink.targetUri = 'src/poror.jpg'
            ..me.profileLink.iconUri = 'src/icon_uri.jpg'
            ..me.profileLink.label = 'mock_label'
            ..me.profileLink.info = 'mock_info'
            ..me.profileLink.refId = 'mock_id'
            ..me.userName = 'mock_user_name';
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
        .unary(StoreProductService.getProduct, (req, _) async {
          final storeProduct =
              (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
                  .firstWhere((gp) => gp.refId == req.storeProductId);

          return GetStoreProductResponse(storeProduct: storeProduct);
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
          await UserPreferences.instance.saveStorePreferences(newStore: store);

          return UpdateStoreResponse(store: store);
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

          await UserPreferences.instance.saveBusinessPreferences(
            newBusiness: business,
          );

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
        .unary(BusinessService.getBusinessMember, (req, __) async {
          return GetBusinessMemberResponse(
            businessMember:
                (_fakeData[CollectionName.businessMembers]
                        as List<BusinessMember>)
                    .firstWhereOrNull((bm) => bm.user.refId == req.userId),
          );
        })
        .unary(StoreService.getStoreMember, (req, __) async {
          return GetStoreMemberResponse(
            storeMember:
                (_fakeData[CollectionName.storeMembers] as List<StoreMember>)
                    .firstWhereOrNull((bm) => bm.user.refId == req.userId),
          );
        })
        .unary(StoreProductService.findProducts, (req, __) async {
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

          return FindProductsResponse(products: storeProductWithGlobalProducts);
        })
        .unary(StoreProductService.searchProducts, (req, __) async {
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
                (bp) => StoreProductWithGlobalProduct()
                  ..storeProduct = bp
                  ..globalProduct = globalProducts.firstWhere(
                    (gp) => gp.refId == bp.globalProductId,
                  ),
              )
              .toList();

          return SearchProductsResponse(
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
          // verify is the global product with the name and qrcode exit if not create one.
          final globalProduct = _fakeData[CollectionName.globalProducts]
              ?.firstWhereOrNull(
                (gp) =>
                    gp['name'] == req.globalProduct.name &&
                    gp['bar_code_value'] == req.globalProduct.barCodeValue,
              );
          final globalProductRefId =
              globalProduct?['ref_id'] as String? ??
              'global-product-${Random().nextInt(1000000)}';
          if (globalProduct == null) {
            _fakeData[CollectionName.globalProducts]?.add({
              'ref_id': globalProductRefId,
              'name': req.globalProduct.name,
              ...req.globalProduct.toProto3Json() as Map<String, dynamic>,
            });
          }

          _fakeData[CollectionName.storeProducts]?.add({
            'ref_id': 'store-product-${Random().nextInt(1000000)}',
            'global_product_id': globalProductRefId,
            ...req.storeProduct.toProto3Json() as Map<String, dynamic>,
          });

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
                GlobalProduct(
                  refId: globalProductId,
                  name: newGlobalProduct.name,
                  barCodeValue: newGlobalProduct.barCodeValue,
                  categories: newGlobalProduct.categories,
                ),
              );
            } else {
              listOfGlobalProduct
                ..removeWhere((gp) => gp.refId == globalProductId)
                ..add(
                  GlobalProduct(
                    refId: globalProductId,
                    name: newGlobalProduct.name,
                    barCodeValue: newGlobalProduct.barCodeValue,
                    categories: newGlobalProduct.categories,
                  ),
                );
            }
          }

          listOfStoreProduct
            ..removeWhere((gp) => gp.refId == businessProduct.refId)
            ..add(
              StoreProduct(
                refId: businessProduct.refId,
                storeId: businessProduct.storeId,
                globalProductId: globalProductId,
                salePrice: businessProduct.salePrice,
              ),
            );

          return UpdateStoreProductResponse()..success = true;
        })
        .unary(StoreProductService.deleteStoreProduct, (req, _) async {
          (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
              .removeWhere((gp) => gp.refId == req.storeProductId);

          return DeleteStoreProductResponse()..success = true;
        })
      ..unary(StoreProductService.getProduct, (req, _) async {
        final request = req;

        return GetStoreProductResponse(
          storeProduct: StoreProduct()
            ..refId = request.storeProductId
            ..storeId = 'store_1'
            ..globalProductId = 'gp_${request.storeProductId.substring(3)}'
            ..salePrice =
                10000 + int.parse(request.storeProductId.substring(3)) * 5000
            ..status = ProductStatus.PRODUCT_STATUS_ACTIVE,
        );
      })
      ..unary(InventoryService.getLowStockItems, (req, _) async {
        final request = req;

        return GetLowStockItemsResponse(
          lowStockItems: [
            InventoryLevel()
              ..storeProductId = 'sp_1'
              ..storeId = request.storeId
              ..quantityAvailable = 5
              ..quantityReserved = 0
              ..minThreshold = 10
              ..lastUpdated = Timestamp.fromDateTime(clock.now()),
            InventoryLevel()
              ..storeProductId = 'sp_2'
              ..storeId = request.storeId
              ..quantityAvailable = 8
              ..quantityReserved = 2
              ..minThreshold = 15
              ..lastUpdated = Timestamp.fromDateTime(clock.now()),
          ],
          totalCount: 2,
        );
      })
      ..unary(InventoryService.getResourceInventory, (req, _) async {
        final request = req;

        return GetResourceInventoryResponse(
          items: [
            InventoryLevel()
              ..storeProductId = 'sp_3'
              ..storeId = request.storeId
              ..quantityAvailable = 20
              ..quantityReserved = 0
              ..batches.add(
                Batch()
                  ..documentId = 'batch_1'
                  ..productId = 'sp_3'
                  ..warehouseId = request.storeId
                  ..quantity = 20
                  ..expirationDate = Timestamp.fromDateTime(
                    clock.now().add(const Duration(days: 45)),
                  )
                  ..receivedAt = Timestamp.fromDateTime(
                    clock.now().subtract(const Duration(days: 30)),
                  ),
              )
              ..batches.add(
                Batch()
                  ..documentId = 'batch_2'
                  ..productId = 'sp_3'
                  ..warehouseId = request.storeId
                  ..quantity = 0
                  ..expirationDate = Timestamp.fromDateTime(
                    clock.now().subtract(const Duration(days: 1)),
                  )
                  ..status = BatchStatus.BATCH_STATUS_EXPIRED,
              )
              ..lastUpdated = Timestamp.fromDateTime(clock.now()),
          ],
          totalQuantity: 20,
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
              ..documentId = 'inv_1'
              ..issueDate = Timestamp.fromDateTime(clock.now())
              ..totalAmount = 100000,
            Invoice()
              ..documentId = 'inv_2'
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
      ..unary(InventoryService.getRecentInventoryTransactions, (req, _) async {
        final request = req;

        return GetInventoryTransactionHistoryResponse(
          transactions: [
            InventoryTransaction()
              ..documentId = 'txn_1'
              ..storeId = request.storeId
              ..productId = 'sp_1'
              ..transactionType = TransactionType.TXN_TYPE_PURCHASE
              ..quantityChange = 10
              ..quantityBefore = 0
              ..quantityAfter = 10
              ..relatedDocumentType = 'Purchase Order'
              ..relatedDocumentId = 'po_1'
              ..performedByUserId = 'user_1'
              ..transactionTime = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(hours: 2)),
              )
              ..notes = 'Initial stock',
            InventoryTransaction()
              ..documentId = 'txn_2'
              ..storeId = request.storeId
              ..productId = 'sp_2'
              ..transactionType = TransactionType.TXN_TYPE_SALE
              ..quantityChange = -5
              ..quantityBefore = 15
              ..quantityAfter = 10
              ..relatedDocumentType = 'Sales Order'
              ..relatedDocumentId = 'so_1'
              ..performedByUserId = 'user_2'
              ..transactionTime = Timestamp.fromDateTime(
                clock.now().subtract(const Duration(hours: 1)),
              )
              ..notes = 'Customer sale',
          ],
          totalCount: 2,
          totalQuantityIn: 10.0,
          totalQuantityOut: 5.0,
        );
      })
      ..unary(StoreProductService.findGlobalProducts, (req, _) async {
        return FindGlobalProductsResponse(
          products: [
            GlobalProduct()
              ..refId = 'gp_1'
              ..name = (Internationalized()
                ..en = 'Product One'
                ..fr = 'Produit Un')
              ..description = (Internationalized()
                ..en = 'Description One'
                ..fr = 'Description Un')
              ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
            GlobalProduct()
              ..refId = 'gp_2'
              ..name = (Internationalized()
                ..en = 'Product Two'
                ..fr = 'Produit Deux')
              ..description = (Internationalized()
                ..en = 'Description Two'
                ..fr = 'Description Deux')
              ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
            GlobalProduct()
              ..refId = 'gp_3'
              ..name = (Internationalized()
                ..en = 'Product Three'
                ..fr = 'Produit Trois')
              ..description = (Internationalized()
                ..en = 'Description Three'
                ..fr = 'Description Trois')
              ..status = GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
          ],
        );
      })
      // Moc CategoryService.findCategories for product categories
      ..unary(CategoryService.findCategories, (req, _) async {
        return FindCategoriesResponse(
          categories: [
            Category()
              ..refId = 'cat_1'
              ..name = (Internationalized()
                ..en = 'Electronics'
                ..fr = 'Électronique')
              ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE
              ..businessId = 'business_1',
            Category()
              ..refId = 'cat_2'
              ..name = (Internationalized()
                ..en = 'Clothing'
                ..fr = 'Vêtements')
              ..status = CategoryStatus.CATEGORY_STATUS_ACTIVE
              ..businessId = 'business_1',
          ],
          // totalCount: 2,
        );
      })
      ..unary(DashboardReportingService.getDashboardReport, (req, _) async {
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
      // Point of Sale Service mocks for testing
      ..unary(CashReceiptService.createCashReceipt, (req, _) async {
        final request = req;
        GiftVoucher voucher;
        final receiptId = 'CR-${Random().nextInt(1000000)}';
        // Create a mock cash receipt
        final cashReceipt = request.receipt
          ..transactionTime = Timestamp.fromDateTime(clock.now())
          ..documentId = receiptId
          ..currency = 'XAF';

        final paymentRef = <String>[];

        // create the payment and add the id to receipt.
        for (var payment in request.payments) {
          final paymentId = 'PAY-${Random().nextInt(1000000)}';
          paymentRef.add(paymentId);
          (_fakeData[CollectionName.payments] as List<Payment>).add(
            payment..documentId = paymentId,
          );
        }

        cashReceipt.paymentIds.addAll(paymentRef);

        // if issue_voucher_on_change is true, create a voucher
        if (request.issueVoucherOnChange) {
          final voucherId = 'GV-${Random().nextInt(1000000)}';

          voucher = GiftVoucher(
            documentId: voucherId,
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
          cashReceipt.voucherIssued = voucherId;
        }

        /// Gets the inventory level for each item in the receipt and update the quantity.
        for (var item in request.receipt.items) {
          for (var inventoryLevel
              in (_fakeData[CollectionName.inventoryLevels]
                  as List<InventoryLevel>)) {
            if (inventoryLevel.storeProductId == item.productId &&
                inventoryLevel.storeId == request.receipt.storeId) {
              inventoryLevel
                ..quantityAvailable -= item.quantity
                ..lastUpdated = Timestamp.fromDateTime(clock.now())
                ..lastUpdatedByUserId = request.receipt.cashierUserId;
            }
          }
        }

        // Create a inventory transaction for each item in the receipt.
        for (var item in request.receipt.items) {
          (_fakeData[CollectionName.inventoryLevels]
                  as List<InventoryTransaction>)
              .add(
                InventoryTransaction()
                  ..documentId = receiptId
                  ..storeId = request.receipt.storeId
                  ..productId = item.productId
                  ..transactionType = TransactionType.TXN_TYPE_SALE
                  ..quantityChange = -item.quantity
                  ..quantityBefore =
                      (_fakeData[CollectionName.inventoryLevels]
                              as List<InventoryLevel>)
                          .firstWhere(
                            (level) =>
                                level.storeProductId == item.productId &&
                                level.storeId == request.receipt.storeId,
                          )
                          .quantityAvailable +
                      item.quantity
                  ..quantityAfter =
                      (_fakeData[CollectionName.inventoryLevels]
                              as List<InventoryLevel>)
                          .firstWhere(
                            (level) =>
                                level.storeProductId == item.productId &&
                                level.storeId == request.receipt.storeId,
                          )
                          .quantityAvailable
                  ..relatedDocumentType = 'CashReceipt'
                  ..relatedDocumentId = receiptId
                  ..performedByUserId = request.receipt.cashierUserId
                  ..transactionTime = Timestamp.fromDateTime(clock.now())
                  ..notes = 'Sale of products'
                  ..batchId =
                      (_fakeData[CollectionName.inventoryLevels]
                              as List<InventoryLevel>)
                          .firstWhere(
                            (level) =>
                                level.storeProductId == item.productId &&
                                level.storeId == request.receipt.storeId,
                          )
                          .batches
                          .firstWhere(
                            (e) =>
                                e.documentId == item.batchId ||
                                e.productId == item.productId,
                          )
                          .documentId,
              );
        }

        return CreateCashReceiptResponse();
      }).build();

final fakeTransport = _fakeTransport.build();

final Map<String, dynamic> fakeStorage = {
  CollectionName.users: (_fakeData[CollectionName.users] as List<User>).first,
  CollectionName.businesses:
      (_fakeData[CollectionName.businesses] as List<Business>).first,
  CollectionName.stores:
      (_fakeData[CollectionName.stores] as List<Store>).first,
};
