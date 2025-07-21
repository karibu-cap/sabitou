import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
/*import 'package:flutter_web_plugins/flutter_web_plugins.dart';*/
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'router/app_router.dart' as app_router;
import 'services/internationalization/app_translations.dart';
import 'services/internationalization/internationalization.dart';
import 'services/rpc/connect_rpc.dart';
import 'services/storage/app_storate.dart';
import 'services/themes/app_themes.dart';
import 'services/user_service_client.dart';
import 'themes/themes.dart';
import 'utils/constants.dart';
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
  Get.put<AppStorageService>(
    appStorage,
    permanent: true,
  );

  // Initialize the services and repositories.
  final languageCode =
      AppStorageService.to.read<String>(PreferencesKey.language);

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
  Get.put<AppThemeService>(themeService, permanent: true);
  await themeService.init();

  /// Register the grpc service.
  final connectRPC =
      Get.put<ConnectRPCService>(ConnectRPCService(), permanent: true);

  /// Register of userService.
  final userServiceClient =
      UserClientService(clientChannel: connectRPC.clientChannel);
  Get.lazyPut<UserClientService>(
    () => userServiceClient,
  );

  await Get.putAsync(
    () async => UserPreferences(),
    permanent: true,
  );
}

/// The main application widget.
class MyApp extends StatelessWidget {
  /// The main application constructor.
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      translations: AppTranslations(),
      supportedLocales: AppInternationalizationService.supportedLocales,
      locale: Get.deviceLocale,
      fallbackLocale: const Locale('en'),
      routeInformationParser: BeamerParser(),
      routerDelegate: BeamerDelegate(
        initialPath: app_router.defaultRoutePath,
        locationBuilder: RoutesLocationBuilder(
          routes: app_router.routes,
        ).call,
        guards: app_router.routeGuards,
      ),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      darkTheme: Themes.darkTheme.toTheme,
      theme: Themes.lightTheme.toTheme,
      themeMode: AppThemeService.to.themeMode,
    );
  }
}
