import 'dart:math';

import 'package:collection/collection.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../tmp/fake_data.dart';
import '../../utils/app_constants.dart';

final _fakeData = fakeData;

/// The mock of connect rpc transport.
final _fakeTransport = FakeTransportBuilder()
  ..unary(AuthService.register, (req, _) async {
    return RegisterResponse()
      ..token = 'mock_token'
      ..refreshToken = 'mock_refresh_token';
  })
  ..unary(AuthService.login, (req, _) async {
    return LoginResponse()
      ..token = 'mock_token'
      ..refreshToken = 'mock_refresh_token';
  })
  ..unary(UserService.getCurrentUser, (req, _) async {
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
  ..unary(OrderService.findOrders, (req, __) async {
    return FindOrdersResponse(
      orders: _fakeData[CollectionName.orders]!
          .map(
            (e) => Order()..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .where((o) => o.fromId == req.fromId)
          .toList(),
    );
  })
  ..unary(BusinessService.getBusinessMembers, (req, __) async {
    return GetBusinessMembersResponse(
      businessMembers: _fakeData[CollectionName.businessMembers]
          ?.map(
            (e) =>
                BusinessMember()
                  ..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .where((bm) => bm.businessId == req.businessId)
          .toList(),
    );
  })
  ..unary(ProductService.findBusinessProducts, (req, __) async {
    return FindBusinessProductsResponse(
      products: _fakeData[CollectionName.businessProducts]
          ?.map(
            (e) =>
                BusinessProduct()
                  ..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .where((bp) => bp.businessId == req.businessId)
          .toList(),
    );
  })
  ..unary(ProductService.findGlobalProducts, (req, __) async {
    return FindGlobalProductsResponse(
      products: _fakeData[CollectionName.globalProducts]
          ?.map(
            (e) =>
                GlobalProduct()
                  ..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .where((gp) {
            if (req.refId.isNotEmpty && req.name.isNotEmpty) {
              return gp.refId == req.refId &&
                  gp.name.toLowerCase().contains(req.name.toLowerCase());
            } else if (req.refId.isNotEmpty) {
              return gp.refId == req.refId;
            } else if (req.name.isNotEmpty) {
              return gp.name.toLowerCase().contains(req.name.toLowerCase());
            }

            return false;
          })
          .toList(),
    );
  })
  ..unary(SupplierService.getBusinessSuppliers, (req, __) async {
    return GetBusinessSuppliersResponse(
      suppliers: _fakeData[CollectionName.suppliers]
          ?.map(
            (e) =>
                Supplier()..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .where((gp) => gp.businessIds.contains(req.businessId))
          .toList(),
    );
  })
  ..unary(SupplierService.getSupplier, (req, __) async {
    return GetSupplierResponse(
      supplier: _fakeData[CollectionName.suppliers]
          ?.map(
            (e) =>
                Supplier()..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .firstWhere((gp) => gp.refId == req.supplierId),
    );
  })
  ..unary(TransactionService.findTransactions, (req, __) async {
    List<Transaction> response =
        _fakeData[CollectionName.transactions]
            ?.map(
              (e) =>
                  Transaction()
                    ..mergeFromProto3Json(e, ignoreUnknownFields: true),
            )
            .where(
              (t) => t.status == TransactionStatus.TRANSACTION_STATUS_COMPLETED,
            )
            .toList() ??
        [];

    if (req.hasOrderId() && req.orderId.isNotEmpty) {
      response = response.where((t) => t.orderId == req.orderId).toList();
    }

    if (req.hasStoreId() && req.storeId.isNotEmpty) {
      response = response.where((t) => t.storeId == req.storeId).toList();
    }

    if (req.hasOrderId() && req.orderId.isNotEmpty) {
      response = response.where((t) => t.orderId == req.orderId).toList();
    }

    if (req.hasStartDate() && req.hasEndDate()) {
      response = response
          .where(
            (t) =>
                t.createdAt.toDateTime().isAfter(req.startDate.toDateTime()) &&
                t.createdAt.toDateTime().isBefore(req.endDate.toDateTime()),
          )
          .toList();
    }

    return FindTransactionsResponse(transactions: response);
  })
  ..unary(CategoryService.findCategories, (req, __) async {
    return FindCategoriesResponse(
      categories: _fakeData[CollectionName.categories]
          ?.map(
            (e) =>
                Category()..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
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
        'bar_code_value': req.globalProduct.barCodeValue,
        'categories': req.globalProduct.categories
            .map((e) => e.toProto3Json())
            .toList(),
      });
    }

    _fakeData[CollectionName.businessProducts]?.add({
      'ref_id': 'business-product-${Random().nextInt(1000000)}',
      'business_id': req.businessId,
      'global_product_id': globalProductRefId,
      'min_stock_threshold': req.minStockThreshold,
      'price_in_cents': req.priceInCents,
      'stock_quantity': req.stockQuantity,
      'expiration_date': req.hasExpirationDate()
          ? req.expirationDate.toDateTime().toIso8601String()
          : null,
      'images_link_ids': [],
    });

    return AddProductResponse()..success = true;
  })
  ..unary(ProductService.updateProduct, (req, __) async {
    final newGlobalProduct = req.globalProduct;
    final businessProduct = req.product;
    String? globalProductId = newGlobalProduct.refId;

    final GlobalProduct? globalProduct = GlobalProduct()
      ..mergeFromProto3Json(
        _fakeData[CollectionName.globalProducts]?.firstWhereOrNull(
          (gp) => gp['ref_id'] == businessProduct.globalProductId,
        ),
        ignoreUnknownFields: true,
      );
    // If the use want to update the global product data, first verify if the product is not link to
    // any other business, if yes create a new global product else update the global product info.
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
      print('the old and new product are diffent $globalProductId');
      final otherBusinessWithTheGlobalProduct =
          _fakeData[CollectionName.businessProducts]?.firstWhereOrNull(
            (gp) =>
                gp['global_product_id'] == globalProductId &&
                gp['business_id'] != businessProduct.businessId,
          );
      if (otherBusinessWithTheGlobalProduct != null) {
        print('The global product is link to another business ');
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

    _fakeData[CollectionName.businessProducts]?.removeWhere(
      (gp) => gp['ref_id'] == businessProduct.refId,
    );
    _fakeData[CollectionName.businessProducts]?.add({
      'ref_id': businessProduct.refId,
      'business_id': businessProduct.businessId,
      'global_product_id': globalProductId,
      'min_stock_threshold': businessProduct.minStockThreshold,
      'price_in_cents': businessProduct.priceInCents,
      'stock_quantity': businessProduct.stockQuantity,
      'expiration_date': businessProduct.hasExpirationDate()
          ? businessProduct.expirationDate.toDateTime().toIso8601String()
          : null,
      'images_link_ids': businessProduct.imagesLinkIds,
    });

    return UpdateProductResponse()..success = true;
  })
  ..unary(ProductService.deleteProduct, (req, _) async {
    _fakeData[CollectionName.businessProducts]?.removeWhere(
      (gp) => gp['ref_id'] == req.businessProductId,
    );

    return DeleteProductResponse()..success = true;
  });

final fakeTransport = _fakeTransport.build();

final fakeStorage = {
  CollectionName.users: _fakeData[CollectionName.users]
      ?.map((e) => User()..mergeFromProto3Json(e, ignoreUnknownFields: true))
      .toList()
      .first,
  CollectionName.businesses: _fakeData[CollectionName.businesses]
      ?.map(
        (e) => Business()..mergeFromProto3Json(e, ignoreUnknownFields: true),
      )
      .toList()
      .first,
  CollectionName.stores: _fakeData[CollectionName.stores]
      ?.map((e) => Store()..mergeFromProto3Json(e, ignoreUnknownFields: true))
      .toList()
      .first,
};
