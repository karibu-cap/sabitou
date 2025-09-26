import 'dart:math';

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
            ..supplier.isActive = true;
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
                ..isActive = true,
              Supplier()
                ..refId = 'supplier_2'
                ..name = 'Fournisseur Beta'
                ..contactEmail = 'beta@example.com'
                ..contactPhone = '696789012'
                ..contactAddress = 'Douala, Cameroun'
                ..isActive = true,
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
                ..isActive = true,
              Supplier()
                ..refId = 'supplier_2'
                ..name = 'Fournisseur Beta'
                ..contactEmail = 'beta@example.com'
                ..contactPhone = '696789012'
                ..contactAddress = 'Douala, Cameroun'
                ..isActive = true,
              Supplier()
                ..refId = 'supplier_3'
                ..name = 'Nouveau Fournisseur'
                ..contactEmail = 'nouveau@example.com'
                ..contactPhone = '696999999'
                ..contactAddress = 'Bamenda, Cameroun'
                ..isActive = true,
            ]);
        })
        // Product Service fakes
        .unary(ProductService.findStoreProducts, (req, _) async {
          final request = req;

          return FindStoreProductsResponse(
            products: [
              StoreProduct()
                ..refId = 'product_1'
                ..globalProductId = 'global_product_1'
                ..storeId = request.storeId,
              StoreProduct()
                ..refId = 'product_2'
                ..globalProductId = 'global_product_2'
                ..storeId = request.storeId,
              StoreProduct()
                ..refId = 'product_3'
                ..globalProductId = 'global_product_3'
                ..storeId = request.storeId,
            ],
          );
        })
        .unary(ProductService.getProduct, (req, _) async {
          final storeProduct =
              (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
                  .firstWhere((gp) => gp.refId == req.storeProductId);

          return GetStoreProductResponse(storeProduct: storeProduct);
        })
        .server(ProductService.streamStoreProducts, (req, _) async* {
          final request = req;

          // Simulate initial products data
          yield StreamStoreProductsResponse()
            ..products.addAll([
              StoreProduct(
                refId: 'product_1',
                globalProductId: 'global_product_1',
                storeId: request.storeId,
                minStockThreshold: 10,
                salePrice: 10000,
                stockQuantity: 20,
                imagesLinksIds: ['image_1', 'image_2'],
              ),
              StoreProduct(
                refId: 'product_2',
                globalProductId: 'global_product_2',
                storeId: request.storeId,
                minStockThreshold: 10,
                salePrice: 20000,
                stockQuantity: 50,
                imagesLinksIds: ['image_1', 'image_2'],
              ),
              StoreProduct(
                refId: 'product_3',
                globalProductId: 'global_product_3',
                storeId: request.storeId,
                minStockThreshold: 5,
                salePrice: 5000,
                stockQuantity: 5,
                imagesLinksIds: ['image_1', 'image_2'],
              ),
            ]);

          // Simulate periodic updates every 15 seconds
          await Future.delayed(const Duration(seconds: 15));

          yield StreamStoreProductsResponse()
            ..products.addAll([
              StoreProduct(
                refId: 'product_1',
                globalProductId: 'global_product_1',
                storeId: request.storeId,
                minStockThreshold: 10,
                salePrice: 10000,
                stockQuantity: 20,
                imagesLinksIds: ['image_1', 'image_2'],
              ),
              StoreProduct(
                refId: 'product_2',
                globalProductId: 'global_product_2',
                storeId: request.storeId,
                minStockThreshold: 10,
                salePrice: 15000,
                stockQuantity: 10,
                imagesLinksIds: ['image_1', 'image_2'],
              ),
              StoreProduct(
                refId: 'product_3',
                globalProductId: 'global_product_3',
                storeId: request.storeId,
                minStockThreshold: 10,
                salePrice: 2000,
                stockQuantity: 200,
                imagesLinksIds: ['image_1', 'image_2'],
              ),
              StoreProduct(
                refId: 'product_4',
                globalProductId: 'global_product_4',
                storeId: request.storeId,
                minStockThreshold: 10,
                salePrice: 400,
                stockQuantity: 500,
                imagesLinksIds: ['image_1', 'image_2'],
              ),
            ]);
        })
      ..unary(OrderService.findOrders, (req, __) async {
        return FindOrdersResponse(
          orders: (_fakeData[CollectionName.orders] as List<Order>)
              .where((o) => o.storeId == req.storeId)
              .toList(),
        );
      })
      ..unary(OrderService.createOrder, (req, __) async {
        final orderId = 'order-${Random().nextInt(1000000)}';
        _fakeData[CollectionName.orders]?.add({
          'ref_id': orderId,
          ...req.order.toProto3Json() as Map<String, dynamic>,
        });

        return CreateOrderResponse(orderId: orderId);
      })
      ..unary(StoreService.getBusinessStores, (req, __) async {
        return GetBusinessStoresResponse(
          stores: (_fakeData[CollectionName.stores] as List<Store>)
              .where((s) => s.businessId == req.businessId)
              .toList(),
        );
      })
      ..unary(StoreService.updateStore, (req, __) async {
        final store = req.store;
        final stores = _fakeData[CollectionName.stores]
            ?.map(
              (e) => Store()..mergeFromProto3Json(e, ignoreUnknownFields: true),
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
      ..unary(BusinessService.getMyBusinesses, (req, __) async {
        return GetMyBusinessesResponse(
          businesses: (_fakeData[CollectionName.businesses] as List<Business>)
              .where((bm) => bm.ownerId == req.ownerId)
              .toList(),
        );
      })
      ..unary(UserService.getUser, (req, __) async {
        return GetUserResponse(
          user: (_fakeData[CollectionName.users] as List<User>)
              .firstWhereOrNull((bm) => bm.refId == req.userId),
        );
      })
      ..unary(BusinessService.updateBusiness, (req, __) async {
        final business = req.business;
        final businesses = _fakeData[CollectionName.businesses]
            ?.map(
              (e) =>
                  Business()..mergeFromProto3Json(e, ignoreUnknownFields: true),
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
      ..unary(BusinessService.getBusinessMembers, (req, __) async {
        return GetBusinessMembersResponse(
          businessMembers:
              (_fakeData[CollectionName.businessMembers]
                      as List<BusinessMember>)
                  .where((bm) => bm.businessId == req.businessId)
                  .toList(),
        );
      })
      ..unary(BusinessService.getBusinessMember, (req, __) async {
        return GetBusinessMemberResponse(
          businessMember:
              (_fakeData[CollectionName.businessMembers]
                      as List<BusinessMember>)
                  .firstWhereOrNull((bm) => bm.user.refId == req.userId),
        );
      })
      ..unary(StoreService.getStoreMember, (req, __) async {
        return GetStoreMemberResponse(
          storeMember:
              (_fakeData[CollectionName.storeMembers] as List<StoreMember>)
                  .firstWhereOrNull((bm) => bm.user.refId == req.userId),
        );
      })
      ..unary(ProductService.findStoreProducts, (req, __) async {
        return FindStoreProductsResponse(
          products:
              (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
                  .where((bp) => bp.storeId == req.storeId)
                  .toList(),
        );
      })
      ..unary(ProductService.findGlobalProducts, (req, __) async {
        return FindGlobalProductsResponse(
          products:
              (_fakeData[CollectionName.globalProducts] as List<GlobalProduct>)
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
      ..unary(SupplierService.getStoreSuppliers, (req, __) async {
        return GetStoreSuppliersResponse(
          suppliers: (_fakeData[CollectionName.suppliers] as List<Supplier>)
              .where((gp) => gp.storeIds.contains(req.storeId))
              .toList(),
        );
      })
      ..unary(SupplierService.getSupplier, (req, __) async {
        return GetSupplierResponse(
          supplier: (_fakeData[CollectionName.suppliers] as List<Supplier>)
              .firstWhereOrNull((gp) => gp.refId == req.supplierId),
        );
      })
      ..unary(TransactionService.findTransactions, (req, __) async {
        return FindTransactionsResponse(transactions: []);
      })
      ..unary(CategoryService.findCategories, (req, __) async {
        return FindCategoriesResponse(
          categories: (_fakeData[CollectionName.categories] as List<Category>)
              .where((c) => c.businessId == req.businessId)
              .toList(),
        );
      })
      ..unary(ProductService.addProduct, (req, __) async {
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
      ..unary(ProductService.updateProduct, (req, __) async {
        final newGlobalProduct = req.globalProduct;
        final businessProduct = req.storeProduct;
        String? globalProductId = newGlobalProduct.refId;

        final GlobalProduct? globalProduct = GlobalProduct()
          ..mergeFromProto3Json(
            _fakeData[CollectionName.globalProducts]?.firstWhereOrNull(
              (gp) => gp['ref_id'] == businessProduct.globalProductId,
            ),
            ignoreUnknownFields: true,
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
          final otherBusinessWithTheGlobalProduct =
              _fakeData[CollectionName.storeProducts]?.firstWhereOrNull(
                (gp) =>
                    gp['global_product_id'] == globalProductId &&
                    gp['store_id'] != businessProduct.storeId,
              );
          if (otherBusinessWithTheGlobalProduct != null) {
            globalProductId = 'global-product-${Random().nextInt(1000000)}';
            _fakeData[CollectionName.globalProducts]?.add({
              'ref_id': globalProductId,
              'name': newGlobalProduct.name,
              'bar_code_value': newGlobalProduct.barCodeValue,
              'categories': newGlobalProduct.categories
                  .map((e) => e.toProto3Json())
                  .toList(),
            });
          } else {
            _fakeData[CollectionName.globalProducts]?.removeWhere(
              (gp) => gp['ref_id'] == globalProductId,
            );
            _fakeData[CollectionName.globalProducts]?.add({
              'ref_id': globalProductId,
              'name': newGlobalProduct.name,
              'bar_code_value': newGlobalProduct.barCodeValue,
              'categories': newGlobalProduct.categories
                  .map((e) => e.toProto3Json())
                  .toList(),
            });
          }
        }

        _fakeData[CollectionName.storeProducts]?.removeWhere(
          (gp) => gp['ref_id'] == businessProduct.refId,
        );
        _fakeData[CollectionName.storeProducts]?.add({
          'ref_id': businessProduct.refId,
          'store_id': businessProduct.storeId,
          'global_product_id': globalProductId,
          'min_stock_threshold': businessProduct.minStockThreshold,
          'sale_price': businessProduct.salePrice,
          'stock_quantity': businessProduct.stockQuantity,
          'expiration_date': businessProduct.hasExpirationDate()
              ? businessProduct.expirationDate.toDateTime().toIso8601String()
              : null,
          'images_link_ids': businessProduct.imagesLinksIds,
        });

        return UpdateStoreProductResponse()..success = true;
      })
      ..unary(ProductService.deleteProduct, (req, _) async {
        _fakeData[CollectionName.storeProducts]?.removeWhere(
          (gp) => gp['ref_id'] == req.storeProductId,
        );

        return DeleteStoreProductResponse()..success = true;
      });

final fakeTransport = _fakeTransport.build();

final Map<String, dynamic> fakeStorage = {
  CollectionName.users: (_fakeData[CollectionName.users] as List<User>).first,
  CollectionName.businesses:
      (_fakeData[CollectionName.businesses] as List<Business>).first,
  CollectionName.stores:
      (_fakeData[CollectionName.stores] as List<Store>).first,
};
