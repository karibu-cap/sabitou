import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/dashboard/dashboard_screen.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_clients/services/storage/app_storage.dart';
import 'package:sabitou_clients/tmp/fake_data.dart';
import 'package:sabitou_clients/utils/app_constants.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../goldens.dart';

final fakeTransportBuilder = FakeTransportBuilder()
  ..unary(OrderService.findOrders, (req, __) async {
    return FindOrdersResponse(
      orders: (fakeData[CollectionName.orders] as List<Order>)
          .where((o) => o.saleOrder.clientId == req.fromId)
          .toList(),
    );
  })
  ..unary(BusinessService.getBusinessMembers, (req, __) async {
    return GetBusinessMembersResponse(businessMembers: []);
  })
  ..unary(ProductService.findStoreProducts, (req, __) async {
    return FindStoreProductsResponse(
      products: (fakeData[CollectionName.storeProducts] as List<StoreProduct>)
          .where((bp) => bp.storeId == req.storeId)
          .toList(),
    );
  })
  ..unary(ProductService.findGlobalProducts, (req, __) async {
    return FindGlobalProductsResponse(
      products: (fakeData[CollectionName.globalProducts] as List<GlobalProduct>)
          .where((gp) => gp.refId == req.refId)
          .toList(),
    );
  })
  ..unary(TransactionService.findTransactions, (req, __) async {
    return FindTransactionsResponse(transactions: []);
  });

final fakeTransport = fakeTransportBuilder.build();

void main() {
  group('Goldens', () {
    setUpAll(() {
      final storage = AppStorageService(AppStorageType.fake, {
        CollectionName.users:
            (fakeData[CollectionName.users] as List<User>).first,
        CollectionName.businesses:
            (fakeData[CollectionName.businesses] as List<Business>).first,
        CollectionName.stores:
            (fakeData[CollectionName.stores] as List<Store>).first,
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
            const DashboardScreen(),
            'dashboard_view',
          );
        },
      );
    });
  });
}
