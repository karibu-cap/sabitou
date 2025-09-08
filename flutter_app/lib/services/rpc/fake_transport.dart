import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../tmp/fake_data.dart';
import '../../utils/app_constants.dart';

/// The mock of connect rpc transport.
final fakeTransport =
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
      ..unary(OrderService.findOrders, (req, __) async {
        return FindOrdersResponse(
          orders: fakeData[CollectionName.orders]
              ?.map(
                (e) =>
                    Order()..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .where((o) => o.fromId == req.fromId)
              .toList(),
        );
      })
      ..unary(BusinessService.getBusinessMembers, (req, __) async {
        return GetBusinessMembersResponse(
          businessMembers: fakeData[CollectionName.businessMembers]
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
          products: fakeData[CollectionName.businessProducts]
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
          products: fakeData[CollectionName.globalProducts]
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
          suppliers: fakeData[CollectionName.suppliers]
              ?.map(
                (e) =>
                    Supplier()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .where((gp) => gp.businessIds.contains(req.businessId))
              .toList(),
        );
      })
      ..unary(SupplierService.getSupplier, (req, __) async {
        return GetSupplierResponse(
          supplier: fakeData[CollectionName.suppliers]
              ?.map(
                (e) =>
                    Supplier()
                      ..mergeFromProto3Json(e, ignoreUnknownFields: true),
              )
              .firstWhere((gp) => gp.refId == req.supplierId),
        );
      })
      ..unary(TransactionService.findTransactions, (req, __) async {
        List<Transaction> response =
            fakeData[CollectionName.transactions]
                ?.map(
                  (e) =>
                      Transaction()
                        ..mergeFromProto3Json(e, ignoreUnknownFields: true),
                )
                .where(
                  (t) =>
                      t.status ==
                      TransactionStatus.TRANSACTION_STATUS_COMPLETED,
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
                    t.createdAt.toDateTime().isAfter(
                      req.startDate.toDateTime(),
                    ) &&
                    t.createdAt.toDateTime().isBefore(req.endDate.toDateTime()),
              )
              .toList();
        }

        return FindTransactionsResponse(transactions: response);
      })
      ..unary(CategoryService.findCategories, (req, __) async {
            return FindCategoriesResponse(
              categories: fakeData[CollectionName.categories]
                  ?.map(
                    (e) =>
                        Category()
                          ..mergeFromProto3Json(e, ignoreUnknownFields: true),
                  )
                  .where((c) => c.businessId == req.businessId)
                  .toList(),
            );
          })
          .unary(SupplierService.getBusinessSuppliers, (req, _) async {
            return GetBusinessSuppliersResponse(
              suppliers: [
                (Supplier()
                  ..refId = 'supplier_1'
                  ..name = 'Fournisseur Alpha'
                  ..contactEmail = 'alpha@example.com'
                  ..contactPhone = '696123456'
                  ..contactAddress = 'Yaoundé, Cameroun'
                  ..isActive = true),
                Supplier()
                  ..refId = 'supplier_2'
                  ..name = 'Fournisseur Beta'
                  ..contactEmail = 'beta@example.com'
                  ..contactPhone = '696789012'
                  ..contactAddress = 'Douala, Cameroun'
                  ..isActive = true,
                Supplier()
                  ..refId = 'supplier_3'
                  ..name = 'Fournisseur Gamma'
                  ..contactEmail = 'gamma@example.com'
                  ..contactPhone = '696345678'
                  ..contactAddress = 'Bafoussam, Cameroun'
                  ..isActive = false,
              ],
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
            return CreateSupplierResponse()
              ..supplierId =
                  'new_supplier_${DateTime.now().millisecondsSinceEpoch}';
          })
          .unary(SupplierService.updateSupplier, (req, _) async {
            final request = req;

            return UpdateSupplierResponse()..supplier = request.supplier;
          })
          .unary(SupplierService.deleteSupplier, (req, _) async {
            return DeleteSupplierResponse()..success = true;
          })
          .server(SupplierService.streamBusinessSuppliers, (req, _) async* {
            // Simulate initial data
            yield GetBusinessSuppliersResponse()
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

            yield GetBusinessSuppliersResponse()
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
          .unary(ProductService.findBusinessProducts, (req, _) async {
            final request = req;

            return FindBusinessProductsResponse(
              products: [
                BusinessProduct()
                  ..refId = 'product_1'
                  ..globalProductId = 'global_product_1'
                  ..supplierId = 'supplier_1'
                  ..businessId = request.businessId,
                BusinessProduct()
                  ..refId = 'product_2'
                  ..globalProductId = 'global_product_2'
                  ..supplierId = 'supplier_1'
                  ..businessId = request.businessId,
                BusinessProduct()
                  ..refId = 'product_3'
                  ..globalProductId = 'global_product_3'
                  ..supplierId = 'supplier_2'
                  ..businessId = request.businessId,
              ],
            );
          })
          .server(ProductService.streamBusinessProducts, (req, _) async* {
            final request = req;

            // Simulate initial products data
            yield StreamBusinessProductsResponse()
              ..products.addAll([
                BusinessProduct(
                  refId: 'product_1',
                  globalProductId: 'global_product_1',
                  supplierId: 'supplier_1',
                  businessId: request.businessId,
                ),
                BusinessProduct(
                  refId: 'product_2',
                  globalProductId: 'global_product_2',
                  supplierId: 'supplier_1',
                  businessId: request.businessId,
                ),
                BusinessProduct(
                  refId: 'product_3',
                  globalProductId: 'global_product_3',
                  supplierId: 'supplier_2',
                  businessId: request.businessId,
                ),
              ]);

            // Simulate periodic updates every 15 seconds
            await Future.delayed(const Duration(seconds: 15));

            yield StreamBusinessProductsResponse()
              ..products.addAll([
                BusinessProduct(
                  refId: 'product_1',
                  globalProductId: 'global_product_1',
                  supplierId: 'supplier_1',
                  businessId: request.businessId,
                ),
                BusinessProduct(
                  refId: 'product_2',
                  globalProductId: 'global_product_2',
                  supplierId: 'supplier_1',
                  businessId: request.businessId,
                ),
                BusinessProduct(
                  refId: 'product_3',
                  globalProductId: 'global_product_3',
                  supplierId: 'supplier_2',
                  businessId: request.businessId,
                ),
                BusinessProduct(
                  refId: 'product_4',
                  globalProductId: 'global_product_4',
                  supplierId: 'supplier_3',
                  businessId: request.businessId,
                ),
              ]);
          });

final fakeStorage = {
  CollectionName.users: fakeData[CollectionName.users]
      ?.map((e) => User()..mergeFromProto3Json(e, ignoreUnknownFields: true))
      .toList()
      .first,
  CollectionName.businesses: fakeData[CollectionName.businesses]
      ?.map(
        (e) => Business()..mergeFromProto3Json(e, ignoreUnknownFields: true),
      )
      .toList()
      .first,
  CollectionName.stores: fakeData[CollectionName.stores]
      ?.map((e) => Store()..mergeFromProto3Json(e, ignoreUnknownFields: true))
      .toList()
      .first,
};
