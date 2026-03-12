import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';

import '../providers/auth/auth_provider.dart';
import '../screens/audits/audits_screen.dart';
import '../screens/auth/forgot_password/forgot_password_view.dart';
import '../screens/auth/login/login_view.dart';
import '../screens/auth/registration/registration_view.dart';
import '../screens/cash_recipe/cash_recipe_screen.dart';
import '../screens/categories/categories_view.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/global_products/global_products_view.dart';
import '../screens/home/home.dart';
import '../screens/inventory/ajustment/inventory_ajustement_screen.dart';
import '../screens/inventory/detail/inventory_detail_screen.dart'; // Added import
import '../screens/inventory/inventory_screen.dart';
import '../screens/point_of_sale/point_of_sale_screen.dart';
import '../screens/products_list/products_list_screen.dart';
import '../screens/purchase_orders/purchase_orders_screen.dart';
import '../screens/reports/reports_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/suppliers/suppliers_view.dart';
import '../screens/users/users_view.dart';
import '../screens/welcome/welcome.dart';
import 'app_router.dart';
import 'page_routes.dart';

/// The route navigation.
final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>(
  debugLabel: 'root',
);

/// The routes representation.
class GoRouterRoutesProvider {
  /// The routes provider.
  static late final GoRouter routes;

  static bool _urlStrategyInitialized = false;

  /// The list of [StatefulShellBranch] for the logged in shell.
  static final loggedInShellBranches = <StatefulShellBranch>[
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
          name: PagesRoutes.audits.name,
          path: PagesRoutes.audits.pattern,
          pageBuilder: (context, state) {
            return const MaterialPage(child: AuditsScreen());
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
        GoRoute(
          name: PagesRoutes.productsList.name,
          path: PagesRoutes.productsList.pattern,
          pageBuilder: (context, state) {
            return const MaterialPage(child: ProductsListScreen());
          },
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.cashReceipts.name,
          path: PagesRoutes.cashReceipts.pattern,
          pageBuilder: (context, state) {
            return const MaterialPage(child: CashRecipeScreen());
          },
        ),
        GoRoute(
          name: PagesRoutes.pos.name,
          path: PagesRoutes.pos.pattern,
          pageBuilder: (context, state) {
            return const MaterialPage(child: PointOfSaleScreen());
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
          name: PagesRoutes.categories.name,
          path: PagesRoutes.categories.pattern,
          pageBuilder: (context, state) {
            return const MaterialPage(child: CategoriesView());
          },
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.globalProducts.name,
          path: PagesRoutes.globalProducts.pattern,
          pageBuilder: (context, state) {
            return const MaterialPage(child: GlobalProductsView());
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
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.purchaseOrders.name,
          path: PagesRoutes.purchaseOrders.pattern,
          pageBuilder: (context, state) {
            return const MaterialPage(child: PurchaseOrdersScreen());
          },
        ),
      ],
    ),
  ];

  /// Determines if the use opens the application for the first time.
  static Future<void> init() async {
    if (!_urlStrategyInitialized) {
      usePathUrlStrategy();
      GoRouter.optionURLReflectsImperativeAPIs = true;
      _urlStrategyInitialized = true;
    }

    final auth = AuthProvider.instance;

    // Initialize router with auth listener
    routes = GoRouter(
      navigatorKey: rootNavigatorKey,
      debugLogDiagnostics: true,
      initialLocation: PagesRoutes.welcome.pattern,
      refreshListenable: auth, // Listen to auth changes
      redirect: (context, state) {
        final isLoggedIn = auth.isAuthenticated;
        final currentPath = state.uri.path;

        // Define auth pages
        final isOnAuthPage =
            currentPath == PagesRoutes.welcome.pattern ||
            currentPath == PagesRoutes.login.pattern ||
            currentPath == PagesRoutes.registration.pattern ||
            currentPath == PagesRoutes.forgotPassword.pattern ||
            currentPath == '/';

        // Redirect logic
        if (!isLoggedIn && !isOnAuthPage) {
          // Not logged in, trying to access protected route
          return PagesRoutes.login.pattern;
        }

        if (isLoggedIn && isOnAuthPage) {
          // Logged in, on auth page
          return PagesRoutes.dashboard.pattern;
        }

        // No redirect needed
        return null;
      },
      routes: _getAllRoutes(),
      onException: (context, state, router) {
        debugPrint('Unknown router path: ${state.fullPath} ');
      },
    );
  }

  /// Returns all application routes.
  static List<RouteBase> _getAllRoutes() {
    return [
      // Logged-in shell routes (protected by global redirect)
      StatefulShellRoute.indexedStack(
        builder: (context, state, navigationShell) {
          return HomeScreen(navigationShell: navigationShell);
        },
        branches: loggedInShellBranches,
      ),
      // Standalone protected routes
      GoRoute(
        name: PagesRoutes.inventoryDetail.name,
        path: PagesRoutes.inventoryDetail.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final productId =
              state.pathParameters[InventoryDetailParameters.keyProductId];

          return MaterialPage(
            child: InventoryDetailScreen(productId: productId ?? ''),
          );
        },
      ),
      GoRoute(
        name: PagesRoutes.inventoryAjustment.name,
        path: PagesRoutes.inventoryAjustment.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final productId =
              state.pathParameters[InventoryDetailParameters.keyProductId];

          return MaterialPage(
            child: InventoryAjustmentScreen(productId: productId ?? ''),
          );
        },
      ),
      // Auth routes (public)
      GoRoute(
        name: PagesRoutes.welcome.name,
        path: PagesRoutes.welcome.pattern,
        pageBuilder: (context, state) {
          return const MaterialPage(child: WelcomeScreen());
        },
      ),
      GoRoute(
        name: PagesRoutes.login.name,
        path: PagesRoutes.login.pattern,
        pageBuilder: (context, state) {
          return const MaterialPage(child: LoginView());
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
    ];
  }
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
