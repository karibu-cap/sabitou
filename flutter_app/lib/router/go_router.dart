import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:logging/logging.dart';

import '../providers/auth/auth_provider.dart';
import '../screens/auth/forgot_password/forgot_password_view.dart';
import '../screens/auth/login/login_view.dart';
import '../screens/auth/registration/registration_view.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/home/home.dart';
import '../screens/inventory/inventory_screen.dart';
import '../screens/new_order/new_order_screen.dart';
import '../screens/reports/reports_screen.dart';
import '../screens/sales/sales_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/suppliers/suppliers_view.dart';
import '../screens/transactions/transactions_screen.dart';
import '../screens/users/users_view.dart';
import '../utils/user_preference.dart';
import 'app_router.dart';
import 'page_routes.dart';

/// The route navigation.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

/// The routes representation.
class GoRouterRoutesProvider {
  /// The routes provider.
  static final GoRouter routes = GoRouter(
    navigatorKey: rootNavigatorKey,
    initialLocation: PagesRoutes.login.pattern,
    onException: (context, state, router) {
      final _log = Logger('GoRouter');
      _log.severe('Unknown router path: ${state.fullPath}');
    },
    routes: [
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        redirect: (context, state) {
          final bool isUserRegistered = UserPreferences.instance.user != null;
          debugPrint('isUserRegistered: $isUserRegistered');

          return isUserRegistered ? null : PagesRoutes.login.pattern;
        },
        branches: [
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.dashboard.name,
                path: PagesRoutes.dashboard.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: DashboardScreen());
                },
              ),
              GoRoute(
                name: PagesRoutes.home.name,
                path: PagesRoutes.home.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: DashboardScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.inventory.name,
                path: PagesRoutes.inventory.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: InventoryScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.salesReport.name,
                path: PagesRoutes.salesReport.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: SalesScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.newOrder.name,
                path: PagesRoutes.newOrder.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: NewOrderScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.reports.name,
                path: PagesRoutes.reports.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: ReportsScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.transactions.name,
                path: PagesRoutes.transactions.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: TransactionsScreen());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.suppliers.name,
                path: PagesRoutes.suppliers.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: SuppliersView());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.users.name,
                path: PagesRoutes.users.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: UsersView());
                },
              ),
            ],
          ),
          StatefulShellBranch(
            routes: [
              GoRoute(
                name: PagesRoutes.settings.name,
                path: PagesRoutes.settings.pattern,
                pageBuilder: (context, state) {
                  return const MaterialPage(child: SettingsScreen());
                },
              ),
            ],
          ),
        ],
      ),
      GoRoute(
        name: PagesRoutes.login.name,
        path: PagesRoutes.login.pattern,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginView());
        },
        redirect: (context, state) async {
          final user = UserPreferences.instance.user;

          if (user == null) {
            debugPrint('isUserRegistered: false');

            return PagesRoutes.login.pattern;
          }

          final authProvider = AuthProvider.instance;
          await authProvider.saveBusinessAndStore(user);
          await authProvider.initializeDataSync();
          debugPrint('isUserRegistered: true');

          return PagesRoutes.dashboard.pattern;
        },
      ),
      GoRoute(
        name: PagesRoutes.registration.name,
        path: PagesRoutes.registration.pattern,
        pageBuilder: (context, state) {
          return const MaterialPage(child: RegistrationView());
        },
      ),
      GoRoute(
        name: PagesRoutes.forgotPassword.name,
        path: PagesRoutes.forgotPassword.pattern,
        pageBuilder: (context, state) {
          return const MaterialPage(child: ForgotPasswordView());
        },
      ),
    ],
  );

  /// Determines if the use opens the application for the first time.
  static Future<void> init() async {}
}

/// AppRouter implementation using GoRouter.
class AppRouterGoRouter extends AppRouterSubsystem {
  @override
  RouterConfig<Object>? get routerConfig => GoRouterRoutesProvider.routes;

  @override
  BackButtonDispatcher? get backButtonDispatcher =>
      GoRouterRoutesProvider.routes.backButtonDispatcher;

  @override
  RouteInformationParser<Object>? get routeInformationParser =>
      GoRouterRoutesProvider.routes.routeInformationParser;

  @override
  RouterDelegate<Object>? get routerDelegate =>
      GoRouterRoutesProvider.routes.routerDelegate;

  @override
  RouteInformationProvider? get routeInformationProvider =>
      GoRouterRoutesProvider.routes.routeInformationProvider;

  @override
  Future<void> init() {
    return GoRouterRoutesProvider.init();
  }

  @override
  void push(BuildContext context, String uri, {Object? extra}) {
    context.push(uri, extra: extra);
  }

  @override
  void pushReplacement(BuildContext context, String uri, {Object? extra}) {
    context.pushReplacement(uri, extra: extra);
  }

  @override
  void go(BuildContext context, String uri, {Object? extra}) {
    context.go(uri, extra: extra);
  }

  @override
  void pushReplacementNamed(BuildContext context, String uri, {Object? extra}) {
    context.pushReplacementNamed(uri, extra: extra);
  }

  @override
  String getCurrentLocation(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  @override
  void updateRouteInformation(
    BuildContext context,
    String uri, {
    Object? extra,
  }) => context.replace(uri, extra: extra);

  @override
  bool canPop(BuildContext context) {
    return GoRouter.of(context).canPop();
  }

  @override
  void onPop(BuildContext context) {
    GoRouter.of(context).pop();
  }
}
