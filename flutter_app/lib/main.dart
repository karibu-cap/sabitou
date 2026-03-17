import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'providers/auth/auth_provider.dart';
import 'providers/cart_provider.dart';
import 'repositories/audits_repository.dart';
import 'repositories/auth_repository.dart';
import 'repositories/business_repository.dart';
import 'repositories/categories_repository.dart';
import 'repositories/gift_voucher_repository.dart';
import 'repositories/inventory_repository.dart';
import 'repositories/permissions_repository.dart';
import 'repositories/pos_repository.dart';
import 'repositories/purchase_order_repository.dart';
import 'repositories/reports_repository.dart';
import 'repositories/resource_link_repository.dart';
import 'repositories/store_products_repository.dart';
import 'repositories/stores_repository.dart';
import 'repositories/suppliers_repository.dart';
import 'repositories/users_repository.dart';
import 'router/app_router.dart';
import 'services/app_theme_service.dart';
import 'services/auth/auth_api_client.dart';
import 'services/auth/token_service.dart';
import 'services/data_sync/data_sync_service.dart';
import 'services/internationalization/internationalization.dart';
import 'services/network_status_provider/network_status_provider.dart';
import 'services/powersync/powersync_service.dart';
import 'services/rpc/connect_rpc.dart';
import 'services/rpc/fake_transport/data_sync.dart';
import 'services/storage/app_storage.dart';
import 'services/storage/hive_ce/hive_adapters.dart';
import 'themes/app_colors.dart';
import 'utils/app_constants.dart';
import 'utils/user_preference.dart';

/// The logger configuration.
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppStorage.initialize(AppStorageType.hiveStorage);
  initStorageBoxes();
  await _initServices();
  runApp(const MyApp());
}

Future<void> _initServices() async {
  final networkStatusProvider = NetworkStatusProvider.create(
    type: NetworkProviderType.real,
  );
  GetIt.I.registerSingleton<ConnectRPCService>(ConnectRPCService());

  final authApiClient = GetIt.I.registerSingleton<AuthApiClient>(
    AuthApiClient(),
  );
  final languageCode = await AppStorage.of<Locale>().read(
    PreferencesKey.language,
  );
  GetIt.I
    ..registerLazySingleton<NetworkStatusProvider>(() => networkStatusProvider)
    ..registerLazySingleton<AppInternationalizationService>(
      () => AppInternationalizationService(
        languageCode != null
            ? Locale(languageCode.languageCode)
            : const Locale('en'),
      ),
    )
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepository(
        apiClient: authApiClient,
        tokenService: TokenService.instance,
      ),
    )
    ..registerLazySingleton<StoreProductsRepository>(
      StoreProductsRepository.new,
    )
    ..registerLazySingleton<UserPreferences>(() => UserPreferences(null))
    ..registerLazySingleton<ReportsRepository>(ReportsRepository.new)
    ..registerLazySingleton<SuppliersRepository>(SuppliersRepository.new)
    ..registerLazySingleton<ResourceLinkRepository>(ResourceLinkRepository.new)
    ..registerLazySingleton<PermissionsRepository>(PermissionsRepository.new)
    ..registerLazySingleton<BusinessRepository>(BusinessRepository.new)
    ..registerLazySingleton<StoresRepository>(StoresRepository.new)
    ..registerLazySingleton<UserRepository>(UserRepository.new)
    ..registerLazySingleton<InventoryRepository>(InventoryRepository.new)
    ..registerLazySingleton<GiftVoucherRepository>(GiftVoucherRepository.new)
    ..registerLazySingleton<PosRepository>(PosRepository.new)
    ..registerLazySingleton<AuditsRepository>(AuditsRepository.new)
    ..registerLazySingleton<PurchaseOrderRepository>(
      PurchaseOrderRepository.new,
    )
    ..registerLazySingleton<CategoriesRepository>(CategoriesRepository.new)
    ..registerLazySingleton<DataSyncService>(
      () => DataSyncService(transport: syncFakeTransport),
    )
    ..registerLazySingleton<CartManager>(CartManager.new);

  // Wait for AuthProvider to initialize from storage
  GetIt.I.registerSingleton<AuthProvider>(
    AuthProvider(
      authRepository: GetIt.I.get<AuthRepository>(),
      tokenService: TokenService.instance,
      powerSync: PowerSyncService.instance,
      authApiClient: GetIt.I.get<AuthApiClient>(),
    ),
  );

  /// Initialize the get storage service.
  await AppRouter.init(AppRouterType.gorouter);

  // Wire the Dio logout callback now that AuthProvider is in the container.
  // When a 401 is received and token refresh also fails, Dio will call this
  // to force the user back to the login screen.
  GetIt.I.get<AuthApiClient>().onUnauthorized = () {
    GetIt.I.get<AuthProvider>().logout();
  };
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// The main application constructor.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<AuthProvider>(),
        ),
        ChangeNotifierProvider(
          create: (context) => GetIt.I.get<AppInternationalizationService>(),
        ),
        ChangeNotifierProvider(create: (context) => AppThemeService()),
        ChangeNotifierProvider<UserPreferences>(
          create: (context) => GetIt.I.get<UserPreferences>(),
        ),
      ],
      child:
          Consumer4<
            AppThemeService,
            AppInternationalizationService,
            AuthProvider,
            UserPreferences
          >(
            builder:
                (
                  context,
                  themeService,
                  intls,
                  authProvider,
                  userPreferences,
                  child,
                ) {
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
                        theme: ThemeData(
                          iconTheme: IconThemeData(
                            color: themeService.isDarkMode
                                ? AppColors.grey0
                                : AppColors.darkBorder,
                          ),
                          textTheme: TextTheme(
                            bodyMedium: TextStyle(
                              color: themeService.isDarkMode
                                  ? AppColors.grey100
                                  : AppColors.black,
                            ),
                          ),
                        ),
                        routerConfig: AppRouter.getRouterConfig(),
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
