import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get_it/get_it.dart';
import 'package:golden_toolkit/golden_toolkit.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_clients/providers/auth/auth_provider.dart';
import 'package:sabitou_clients/providers/cart_provider.dart';
import 'package:sabitou_clients/repositories/business_repository.dart';
import 'package:sabitou_clients/repositories/categories_repository.dart';
import 'package:sabitou_clients/repositories/inventory_repository.dart';
import 'package:sabitou_clients/repositories/reports_repository.dart';
import 'package:sabitou_clients/repositories/store_products_repository.dart';
import 'package:sabitou_clients/repositories/stores_repository.dart';
import 'package:sabitou_clients/repositories/suppliers_repository.dart';
import 'package:sabitou_clients/repositories/users_repository.dart';
import 'package:sabitou_clients/services/app_theme_service.dart';
import 'package:sabitou_clients/services/data_sync/data_sync_service.dart';
import 'package:sabitou_clients/services/hive_database/hive_database.dart';
import 'package:sabitou_clients/services/internationalization/internationalization.dart';
import 'package:sabitou_clients/services/network_status_provider/network_status_provider.dart';
import 'package:sabitou_clients/services/rpc/fake_transport.dart';
import 'package:sabitou_clients/services/storage/app_storage.dart';
import 'package:sabitou_clients/utils/user_preference.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

Future<void> multiScreenMultiLocaleGolden(
  WidgetTester tester,
  Widget widget,
  String name,
) async {
  TestWidgetsFlutterBinding.ensureInitialized();
  final storage = AppStorageService(AppStorageType.fake, fakeStorage);

  final AppInternationalizationService appInternationalization =
      AppInternationalizationService(const Locale('en'), storage);
  final themeService = AppThemeService(storage);
  await tester.pumpAndSettle();
  await _initGetIt(storage, appInternationalization, themeService);

  await tester.pumpWidgetBuilder(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<AppInternationalizationService>(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<AppThemeService>(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<UserPreferences>(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<AuthProvider>(),
        ),
      ],
      child:
          Consumer4<
            AppInternationalizationService,
            AppThemeService,
            UserPreferences,
            AuthProvider
          >(
            builder:
                (
                  context,
                  intls,
                  themeService,
                  userPreferences,
                  authProvider,
                  child,
                ) {
                  return ShadApp(
                    title: intls.locale.languageCode.toUpperCase(),
                    themeMode: themeService.isDarkMode
                        ? ThemeMode.dark
                        : ThemeMode.light,
                    theme: AppThemeService.lightTheme,
                    darkTheme: AppThemeService.darkTheme,
                    localizationsDelegates: const [
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate,
                    ],
                    supportedLocales:
                        AppInternationalizationService.supportedLocales,
                    home: widget,
                  );
                },
          ),
    ),
  );
  // Screenshot the widget in each supported locale.
  for (final locale in AppInternationalizationService.supportedLocales) {
    appInternationalization.changeLocale(locale);
    await themeService.switchTheme();

    await tester.pumpAndSettle();
    await multiScreenGolden(
      tester,
      '$name.${locale.languageCode}.${themeService.isDarkMode ? 'dark' : 'light'}',
      devices: [
        const Device(name: '1080p', size: Size(1920, 1080)),
        const Device(name: '480p', size: Size(720, 480)),
        const Device(name: 'standard', size: Size(375, 740)),
      ],
    );
  }
}

Future<void> _initGetIt(
  AppStorageService storage,
  AppInternationalizationService appInternationalization,
  AppThemeService themeService,
) async {
  final hiveDatabase = await HiveDatabase.create(HiveDatabaseType.fake);
  await hiveDatabase.initBoxes();
  GetIt.I
    ..registerSingletonIfAbsent<AppStorageService>(() => storage)
    ..registerSingletonIfAbsent<AppInternationalizationService>(
      () => appInternationalization,
    )
    ..registerLazySingleton<NetworkStatusProvider>(
      () => NetworkStatusProvider.create(type: NetworkProviderType.fake),
    )
    ..registerSingleton<HiveDatabase>(hiveDatabase)
    ..registerSingletonIfAbsent<AppThemeService>(() => themeService)
    ..registerSingletonIfAbsent<UserPreferences>(UserPreferences.new)
    ..registerSingletonIfAbsent<UserRepository>(UserRepository.new)
    ..registerSingletonIfAbsent<StoreProductsRepository>(
      StoreProductsRepository.new,
    )
    ..registerSingletonIfAbsent<SuppliersRepository>(SuppliersRepository.new)
    ..registerSingletonIfAbsent<CategoriesRepository>(CategoriesRepository.new)
    ..registerSingletonIfAbsent<BusinessRepository>(BusinessRepository.new)
    ..registerSingletonIfAbsent<ReportsRepository>(ReportsRepository.new)
    ..registerSingletonIfAbsent<InventoryRepository>(InventoryRepository.new)
    ..registerSingletonIfAbsent<StoreProductsRepository>(
      StoreProductsRepository.new,
    )
    ..registerSingletonIfAbsent<StoresRepository>(StoresRepository.new)
    ..registerSingletonIfAbsent<CartManager>(CartManager.new)
    ..registerLazySingleton<DataSyncService>(DataSyncService.new)
    ..registerSingletonIfAbsent<AuthProvider>(AuthProvider.new);
}
