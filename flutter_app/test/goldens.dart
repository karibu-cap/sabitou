import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:sabitou_clients/services/internationalization/app_translations.dart';
import 'package:sabitou_clients/services/internationalization/internationalization.dart';
import 'package:sabitou_clients/services/storage/app_storate.dart';
import 'package:sabitou_clients/services/themes/app_themes.dart';

Future<void> multiScreenMultiLocaleGolden(
  WidgetTester tester,
  Widget widget,
  String name,
) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = AppStorageService(AppStorageType.fake);
  Get.put(storage);

  final AppInternationalizationService appInternationalization =
      AppInternationalizationService(const Locale('en'), storage);
  Get.put<AppInternationalizationService>(appInternationalization);
  final themeService = AppThemeService(storage);
  Get.put<AppThemeService>(themeService, permanent: true);
  await tester.pumpAndSettle();

  await tester.pumpWidgetBuilder(
    GetMaterialApp(
      supportedLocales: AppInternationalizationService.supportedLocales,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      translations: AppTranslations(),
      darkTheme: AppThemeService.darkTheme,
      theme: AppThemeService.lightTheme,
      themeMode: Get.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      home: widget,
    ),
  );
  // Screenshot the widget in each supported locale.
  for (final locale in AppInternationalizationService.supportedLocales) {
    appInternationalization.changeLocale(locale);
    themeService.switchTheme();

    await tester.pumpAndSettle();
    await multiScreenGolden(
      tester,
      '$name.${locale.languageCode}.${AppThemeService.to.themeMode.name}',
      devices: [
        const Device(
          name: '1080p',
          size: Size(1920, 1080),
        ),
        const Device(name: '480p', size: Size(720, 480)),
        const Device(
          name: 'standard',
          size: Size(375, 740),
        ),
      ],
    );
  }
}
