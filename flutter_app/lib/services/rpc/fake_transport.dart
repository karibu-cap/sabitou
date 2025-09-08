import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../tmp/fake_data.dart';
import '../../utils/app_constants.dart';

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
      orders: fakeData[CollectionName.orders]
          ?.map(
            (e) => Order()..mergeFromProto3Json(e, ignoreUnknownFields: true),
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
                Supplier()..mergeFromProto3Json(e, ignoreUnknownFields: true),
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
                Supplier()..mergeFromProto3Json(e, ignoreUnknownFields: true),
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
      categories: fakeData[CollectionName.categories]
          ?.map(
            (e) =>
                Category()..mergeFromProto3Json(e, ignoreUnknownFields: true),
          )
          .where((c) => c.businessId == req.businessId)
          .toList(),
    );
  });

final fakeTransport = _fakeTransport.build();

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
