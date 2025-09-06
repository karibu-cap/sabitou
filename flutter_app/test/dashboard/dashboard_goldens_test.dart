import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/home/home.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_clients/services/storage/app_storage.dart';
import 'package:sabitou_clients/tmp/fake_data.dart';
import 'package:sabitou_clients/utils/app_constants.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

final fakeTransportBuilder = FakeTransportBuilder()
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
          .where((gp) => gp.refId == req.refId)
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
  });

final fakeTransport = fakeTransportBuilder.build();

void main() {
  group('Goldens', () {
    setUpAll(() {
      final storage = AppStorageService(AppStorageType.fake, {
        CollectionName.users: fakeData[CollectionName.users]
            ?.map(
              (e) => User()..mergeFromProto3Json(e, ignoreUnknownFields: true),
            )
            .toList()
            .first,
        CollectionName.businesses: fakeData[CollectionName.businesses]
            ?.map(
              (e) =>
                  Business()..mergeFromProto3Json(e, ignoreUnknownFields: true),
            )
            .toList()
            .first,
        CollectionName.stores: fakeData[CollectionName.stores]
            ?.map(
              (e) => Store()..mergeFromProto3Json(e, ignoreUnknownFields: true),
            )
            .toList()
            .first,
      });
      GetIt.I.registerSingletonIfAbsent<AppStorageService>(() => storage);
    });

    setUp(() {
      GetIt.I.registerSingletonIfAbsent<ConnectRPCService>(
        () => ConnectRPCService.new(clientChannel: fakeTransport),
      );
    });
    testGoldens('Dashboard view', (tester) async {
      return withClock(
        Clock.fixed(DateTime.parse('2025-09-01 15:30:00Z').toUtc()),
        () async {
          await multiScreenMultiLocaleGolden(
            tester,
            const HomeScreen(),
            'dashboard_view',
          );
        },
      );
    });
  });
}
