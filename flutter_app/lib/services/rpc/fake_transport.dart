import 'dart:math';

import 'package:collection/collection.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../tmp/fake_data.dart';
import '../../utils/app_constants.dart';
import '../../utils/user_preference.dart';

final _fakeData = fakeData;

/// The mock of connect rpc transport.
final _fakeTransport = FakeTransportBuilder()
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
    // StoreProductService fakes (replaced ProductService)
    .unary(StoreProductService.findStoreProducts, (req, _) async {
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
            (e) => Store()..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .toList();

      final getStore = stores?.firstWhereOrNull((s) => s.refId == store.refId);

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
        user: (_fakeData[CollectionName.users] as List<User>).firstWhereOrNull(
          (bm) => bm.refId == req.userId,
        ),
      );
    })
    .unary(BusinessService.updateBusiness, (req, __) async {
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
    .unary(BusinessService.getBusinessMembers, (req, __) async {
      return GetBusinessMembersResponse(
        businessMembers:
            (_fakeData[CollectionName.businessMembers] as List<BusinessMember>)
                .where((bm) => bm.businessId == req.businessId)
                .toList(),
      );
    })
    .unary(BusinessService.getBusinessMember, (req, __) async {
      return GetBusinessMemberResponse(
        businessMember:
            (_fakeData[CollectionName.businessMembers] as List<BusinessMember>)
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
    .unary(StoreProductService.findStoreProducts, (req, __) async {
      return FindStoreProductsResponse(
        products:
            (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
                .where((bp) => bp.storeId == req.storeId)
                .toList(),
      );
    })
    .unary(StoreProductService.findGlobalProducts, (req, __) async {
      print(req);

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
          globalProduct?.refId ?? 'global-product-${Random().nextInt(1000000)}';
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
    .unary(StoreProductService.updateProduct, (req, __) async {
      final newGlobalProduct = req.globalProduct;
      final businessProduct = req.storeProduct;
      String? globalProductId = newGlobalProduct.refId;
      final listOfGlobalProduct =
          _fakeData[CollectionName.globalProducts] as List<GlobalProduct>;
      final listOfStoreProduct =
          _fakeData[CollectionName.storeProducts] as List<StoreProduct>;

      final GlobalProduct? globalProduct = listOfGlobalProduct.firstWhereOrNull(
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
    .unary(StoreProductService.deleteProduct, (req, _) async {
      (_fakeData[CollectionName.storeProducts] as List<StoreProduct>)
          .removeWhere((gp) => gp.refId == req.storeProductId);

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
