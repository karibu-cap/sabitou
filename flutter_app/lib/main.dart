import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'providers/auth/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'repositories/auth_repository.dart';
import 'repositories/business_repository.dart';
import 'repositories/categories_repository.dart';
import 'repositories/orders_repository.dart';
import 'repositories/permissions_repository.dart';
import 'repositories/products_repository.dart';
import 'repositories/stores_repository.dart';
import 'repositories/suppliers_repository.dart';
import 'repositories/transactions_repository.dart';
import 'repositories/users_repository.dart';
import 'router/app_router.dart' as app_router;
import 'services/app_theme_service.dart';
import 'services/internationalization/internationalization.dart';
import 'services/isar/isar_database.dart';
import 'services/network_status_provider/network_status_provider.dart';
import 'services/rpc/connect_rpc.dart';
import 'services/rpc/fake_transport.dart';
import 'services/storage/app_storage.dart';
import 'utils/app_constants.dart';
import 'utils/user_preference.dart';

/// The logger configuration.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await _initServices();
  runApp(const MyApp());
}

Future<void> _initServices() async {
  final isarDatabase = await IsarDatabase.create(IsarDatabaseType.real);
  await GetStorage.init();
  final appStorage = AppStorageService(AppStorageType.fake, fakeStorage);
  final networkStatusProvider = NetworkStatusProvider.create(
    type: NetworkProviderType.real,
  );
  final languageCode = appStorage.read<String>(PreferencesKey.language);
  GetIt.I
    ..registerLazySingleton<AppStorageService>(() => appStorage)
    ..registerLazySingleton<ConnectRPCService>(
      () => ConnectRPCService(clientChannel: fakeTransport),
    )
    ..registerLazySingleton<NetworkStatusProvider>(() => networkStatusProvider)
    ..registerLazySingleton<IsarDatabase>(() => isarDatabase)
    ..registerLazySingleton<AppInternationalizationService>(
      () => AppInternationalizationService(
        languageCode != null ? Locale(languageCode) : const Locale('en'),
        appStorage,
      ),
    )
    ..registerLazySingleton<UserPreferences>(UserPreferences.new)
    ..registerLazySingleton<AuthRepository>(AuthRepository.new)
    ..registerLazySingleton<AuthProvider>(AuthProvider.new)
    ..registerLazySingleton<OrdersRepository>(OrdersRepository.new)
    ..registerLazySingleton<ProductsRepository>(ProductsRepository.new)
    ..registerLazySingleton<SuppliersRepository>(SuppliersRepository.new)
    ..registerLazySingleton<PermissionsRepository>(PermissionsRepository.new)
    ..registerLazySingleton<TransactionsRepository>(TransactionsRepository.new)
    ..registerLazySingleton<BusinessRepository>(BusinessRepository.new)
    ..registerLazySingleton<StoresRepository>(StoresRepository.new)
    ..registerLazySingleton<UserRepository>(UserRepository.new)
    ..registerLazySingleton<CategoriesRepository>(CategoriesRepository.new)
    ..registerLazySingleton<CartManager>(CartManager.new);

  /// Initialize the get storage service.
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// The main application constructor.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final appStorage = GetIt.I.get<AppStorageService>();

    /// Register theme service.
    final routerDelegate = BeamerDelegate(
      initialPath: app_router.defaultRoutePath,
      locationBuilder: RoutesLocationBuilder(routes: app_router.routes).call,
      guards: app_router.routeGuards,
    );

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<AppInternationalizationService>(),
        ),
        ChangeNotifierProvider(
          create: (context) => AppThemeService(appStorage),
        ),
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<UserPreferences>(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<AuthProvider>(),
        ),
      ],
      child: Consumer2<AppThemeService, AppInternationalizationService>(
        builder: (context, themeService, intls, child) {
          return ShadApp.custom(
            themeMode: themeService.isDarkMode
                ? ThemeMode.dark
                : ThemeMode.light,
            theme: AppThemeService.lightTheme,
            darkTheme: AppThemeService.darkTheme,
            appBuilder: (context) {
              return MaterialApp.router(
                supportedLocales:
                    AppInternationalizationService.supportedLocales,
                locale: intls.locale,
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
        },
      ),
    );
  }
}
