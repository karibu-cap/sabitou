import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'providers/auth/auth_provider.dart';
import 'repositories/business_repository.dart';
import 'repositories/orders_repository.dart';
import 'repositories/products_repository.dart';
import 'repositories/stores_repository.dart';
import 'repositories/suppliers_repository.dart';
import 'repositories/transactions_repository.dart';
import 'repositories/user_repository.dart';
import 'router/app_router.dart' as app_router;
import 'services/app_theme_service.dart';
import 'services/internationalization/app_translations.dart';
import 'services/internationalization/internationalization.dart';
import 'services/rpc/connect_rpc.dart';
import 'services/storage/app_storate.dart';
import 'utils/app_constants.dart';
import 'utils/user_preference.dart';

/// The logger configuration.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(const MyApp());
}

Future<void> _initServices() async {
  /*setUrlStrategy(PathUrlStrategy());*/

  /// Initialize the get storage service.
  await GetStorage.init();
  final appStorage = AppStorageService(AppStorageType.getStorage);
  Get.put<AppStorageService>(appStorage, permanent: true);

  // Initialize the services and repositories.
  final languageCode = AppStorageService.to.read<String>(
    PreferencesKey.language,
  );

  final AppInternationalizationService appInternationalization =
      AppInternationalizationService(
        languageCode != null
            ? Locale(languageCode)
            : Get.deviceLocale ?? const Locale('en'),
        appStorage,
      );

  // Register internationalization services.
  Get.put<AppInternationalizationService>(
    appInternationalization,
    permanent: true,
  );

  /// Register theme service.
  final themeService = AppThemeService(appStorage);
  await themeService.init();

  /// Register of userService.

  Get
    ..putAsync(() async => UserPreferences(), permanent: true)
    ..put<AppThemeService>(themeService, permanent: true)
    ..put<ConnectRPCService>(ConnectRPCService.new(), permanent: true)
    ..lazyPut<UserRepository>(UserRepository.new)
    ..put<AuthProvider>(AuthProvider())
    ..lazyPut<OrdersRepository>(OrdersRepository.new)
    ..lazyPut<ProductsRepository>(ProductsRepository.new)
    ..lazyPut<SuppliersRepository>(SuppliersRepository.new)
    ..lazyPut<TransactionsRepository>(TransactionsRepository.new)
    ..lazyPut<BusinessRepository>(BusinessRepository.new)
    ..lazyPut<StoresRepository>(StoresRepository.new);
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// The main application constructor.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final routerDelegate = BeamerDelegate(
      initialPath: app_router.defaultRoutePath,
      locationBuilder: RoutesLocationBuilder(routes: app_router.routes).call,
      guards: app_router.routeGuards,
    );

    return Obx(() {
      return ShadApp.custom(
        themeMode: AppThemeService.to.isDarkMode.value
            ? ThemeMode.dark
            : ThemeMode.light,
        theme: AppThemeService.lightTheme,
        darkTheme: AppThemeService.darkTheme,
        appBuilder: (context) {
          return GetMaterialApp.router(
            translations: AppTranslations(),
            supportedLocales: AppInternationalizationService.supportedLocales,
            locale: Get.deviceLocale,
            fallbackLocale: const Locale('en'),
            routeInformationParser: BeamerParser(),
            routerDelegate: routerDelegate,
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            builder: (context, child) {
              if (child == null) {
                return const SizedBox.shrink();
              }

              return ShadAppBuilder(child: child);
            },
          );
        },
      );
    });
  }
}
