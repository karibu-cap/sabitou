import 'package:clock/clock.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/repositories/business_repository.dart';
import 'package:sabitou_clients/repositories/orders_repository.dart';
import 'package:sabitou_clients/repositories/products_repository.dart';
import 'package:sabitou_clients/repositories/stores_repository.dart';
import 'package:sabitou_clients/repositories/suppliers_repository.dart';
import 'package:sabitou_clients/repositories/transactions_repository.dart';
import 'package:sabitou_clients/screens/home/home.dart';
import 'package:sabitou_clients/services/storage/app_storate.dart';
import 'package:sabitou_clients/tmp/fake_data.dart';
import 'package:sabitou_clients/utils/app_constants.dart';
import 'package:sabitou_clients/utils/user_preference.dart';
import 'package:sabitou_rpc/models.dart';

import '../goldens.dart';

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
      Get.put(storage);
    });

    setUp(() {
      Get
        ..put<UserPreferences>(UserPreferences())
        ..lazyPut<OrdersRepository>(OrdersRepository.new)
        ..lazyPut<ProductsRepository>(ProductsRepository.new)
        ..lazyPut<SuppliersRepository>(SuppliersRepository.new)
        ..lazyPut<TransactionsRepository>(TransactionsRepository.new)
        ..lazyPut<BusinessRepository>(BusinessRepository.new)
        ..lazyPut<StoresRepository>(StoresRepository.new);
    });
    testGoldens('Dashboard view', (tester) async {
      return withClock(
        Clock.fixed(DateTime.parse('2025-09-21 15:30:00Z').toUtc()),
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
