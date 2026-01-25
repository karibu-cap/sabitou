import 'package:clock/clock.dart';
import 'package:flutter/src/widgets/basic.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/point_of_sale/point_of_sale_screen.dart';
import 'package:sabitou_clients/services/rpc/connect_rpc.dart';
import 'package:sabitou_clients/services/rpc/fake_transport.dart';
import 'package:sabitou_clients/services/storage/app_storage.dart';

import '../goldens.dart';

void main() {
  group('Goldens', () {
    setUpAll(() async {
      await AppStorage.initialize(AppStorageType.fake, fakeStorage);
    });

    setUp(() {
      GetIt.I.registerSingletonIfAbsent<ConnectRPCService>(
        () => ConnectRPCService.new(clientChannel: fakeTransport),
      );
    });
    testGoldens('POS view', (tester) async {
      return withClock(
        Clock.fixed(DateTime.parse('2025-09-01 15:30:00Z').toUtc()),
        () async {
          await multiScreenMultiLocaleGolden(
            tester,
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: PointOfSaleScreen(),
            ),
            'pos_view',
          );
        },
      );
    });
  });
}
