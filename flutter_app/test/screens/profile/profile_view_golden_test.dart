import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/screens/profile/profile_view.dart';
import 'package:sabitou_clients/services/storage/app_storate.dart';
import 'package:sabitou_clients/utils/user_preference.dart';

import '../../../test/goldens.dart';

void main() {
  group('Goldens', () {
    setUpAll(() {
      final storage = AppStorageService(AppStorageType.fake);
      Get.put(storage);
    });

    setUp(() {
      Get.put<UserPreferences>(UserPreferences());
    });
    testGoldens('Profile view', (tester) async {
      await multiScreenMultiLocaleGolden(
        tester,
        const ProfileView(),
        'profile_view',
      );
    });
  });
}
