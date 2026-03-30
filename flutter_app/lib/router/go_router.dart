// ignore_for_file: long-method
import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:go_router/go_router.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../providers/auth/auth_provider.dart';
import '../screens/audits/audits_screen.dart';
import '../screens/auth/forgot_password/forgot_password_view.dart';
import '../screens/auth/login/login_view.dart';
import '../screens/auth/registration/registration_view.dart';
import '../screens/bills/bills_screen.dart';
import '../screens/bills/detail/bill_screen.dart';
import '../screens/cash_recipe/cash_recipe_screen.dart';
import '../screens/categories/categories_view.dart';
import '../screens/dashboard/dashboard_screen.dart';
import '../screens/global_products/global_products_view.dart';
import '../screens/home/home.dart';
import '../screens/inventory/ajustment/inventory_ajustement_screen.dart';
import '../screens/inventory/detail/inventory_detail_screen.dart';
import '../screens/inventory/inventory_screen.dart';
import '../screens/payments/detail/payment_screen.dart';
import '../screens/payments/payments_screen.dart';
import '../screens/point_of_sale/point_of_sale_screen.dart';
import '../screens/products_list/components/form/screen/create_edit_product_screen.dart';
import '../screens/products_list/detail/product_detail_screen.dart';
import '../screens/products_list/products_list_screen.dart';
import '../screens/purchase_orders/detail/purchase_order_detail_screen.dart';
import '../screens/purchase_orders/purchase_orders_view.dart';
import '../screens/purchase_receives/detail/receiving_note_detail_screen.dart';
import '../screens/purchase_receives/purchase_receives_view.dart';
import '../screens/reports/reports_screen.dart';
import '../screens/settings/settings_screen.dart';
import '../screens/suppliers/suppliers_view.dart';
import '../screens/users/users_view.dart';
import '../screens/welcome/welcome.dart';
import '../widgets/error/error_page_builder.dart';
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
          pageBuilder: (_, __) => const MaterialPage(child: DashboardScreen()),
        ),
        GoRoute(
          name: PagesRoutes.home.name,
          path: PagesRoutes.home.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: DashboardScreen()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.audits.name,
          path: PagesRoutes.audits.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: AuditsScreen()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.inventory.name,
          path: PagesRoutes.inventory.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: InventoryScreen()),
        ),
        GoRoute(
          name: PagesRoutes.productsList.name,
          path: PagesRoutes.productsList.pattern,
          pageBuilder: (_, __) =>
              const MaterialPage(child: ProductsListScreen()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.cashReceipts.name,
          path: PagesRoutes.cashReceipts.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: CashRecipeScreen()),
        ),
        GoRoute(
          name: PagesRoutes.pos.name,
          path: PagesRoutes.pos.pattern,
          pageBuilder: (_, __) =>
              const MaterialPage(child: PointOfSaleScreen()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.reports.name,
          path: PagesRoutes.reports.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: ReportsScreen()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.suppliers.name,
          path: PagesRoutes.suppliers.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: SuppliersView()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.users.name,
          path: PagesRoutes.users.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: UsersView()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.categories.name,
          path: PagesRoutes.categories.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: CategoriesView()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.globalProducts.name,
          path: PagesRoutes.globalProducts.pattern,
          pageBuilder: (_, __) =>
              const MaterialPage(child: GlobalProductsView()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.settings.name,
          path: PagesRoutes.settings.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: SettingsScreen()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.purchaseOrders.name,
          path: PagesRoutes.purchaseOrders.pattern,
          pageBuilder: (_, __) =>
              const MaterialPage(child: PurchaseOrdersView()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.purchaseReceives.name,
          path: PagesRoutes.purchaseReceives.pattern,
          pageBuilder: (_, __) =>
              const MaterialPage(child: PurchaseReceivesView()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.bills.name,
          path: PagesRoutes.bills.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: BillsScreen()),
        ),
      ],
    ),
    StatefulShellBranch(
      routes: [
        GoRoute(
          name: PagesRoutes.payments.name,
          path: PagesRoutes.payments.pattern,
          pageBuilder: (_, __) => const MaterialPage(child: PaymentsScreen()),
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
      // GoRouter re-evaluates redirect whenever AuthProvider notifies.
      refreshListenable: auth,
      redirect: (context, state) {
        final authStatus = auth.status;
        final path = state.uri.path;

        // While initialising, show a blank screen / splash — do not redirect.
        if (authStatus == AuthStatus.initializing) return null;

        final isOnAuthPage =
            path == PagesRoutes.welcome.pattern ||
            path == PagesRoutes.login.pattern ||
            path == PagesRoutes.registration.pattern ||
            path == PagesRoutes.forgotPassword.pattern ||
            path == '/';

        if (!auth.isAuthenticated && !isOnAuthPage) {
          return PagesRoutes.login.pattern;
        }

        if (auth.isAuthenticated && isOnAuthPage) {
          return PagesRoutes.dashboard.pattern;
        }

        return null;
      },
      routes: _getAllRoutes(),
      errorPageBuilder: (context, state) =>
          const MaterialPage(child: ErrorPageBuilder.notFound()),
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
      GoRoute(
        name: PagesRoutes.productNew.name,
        path: PagesRoutes.productNew.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          return const MaterialPage(child: CreateEditProductScreen());
        },
      ),
      GoRoute(
        name: PagesRoutes.productEdit.name,
        path: PagesRoutes.productEdit.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final productId =
              state.pathParameters[ProductDetailParameters.keyProductId];

          return MaterialPage(
            child: CreateEditProductScreen(productId: productId),
          );
        },
      ),
      GoRoute(
        name: PagesRoutes.productDetail.name,
        path: PagesRoutes.productDetail.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final productId =
              state.pathParameters[ProductDetailParameters.keyProductId];

          return MaterialPage(
            child: ProductDetailScreen(productId: productId ?? ''),
          );
        },
      ),
      GoRoute(
        name: PagesRoutes.purchaseOrderDetail.name,
        path: PagesRoutes.purchaseOrderDetail.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final purchaseOrderId = state
              .pathParameters[PurchaseOrderDetailParameters.keyPurchaseOrderId];

          if (purchaseOrderId == null ||
              !purchaseOrderId.toLowerCase().startsWith('po')) {
            return MaterialPage(
              child: ErrorPageBuilder.notFound(
                title: 'Invalid Purchase Order',
                onPrimaryAction: () =>
                    AppRouter.go(context, PagesRoutes.home.pattern),
                primaryActionText: 'Back to Home',
                onSecondaryAction: () =>
                    AppRouter.go(context, PagesRoutes.purchaseOrders.pattern),
                secondaryActionText: 'View Purchase Orders',
                showBackgroundGradient: false,
                customIcon: const Icon(LucideIcons.clipboardList400),
              ),
            );
          }

          return MaterialPage(
            child: PurchaseOrderDetailScreen(purchaseOrderId: purchaseOrderId),
          );
        },
      ),
      GoRoute(
        name: PagesRoutes.paymentDetail.name,
        path: PagesRoutes.paymentDetail.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final paymentId =
              state.pathParameters[PaymentDetailParameters.keyPaymentId];

          if (paymentId == null || !paymentId.toLowerCase().startsWith('pay')) {
            return MaterialPage(
              child: ErrorPageBuilder.notFound(
                title: 'Invalid Payment',
                onPrimaryAction: () =>
                    AppRouter.go(context, PagesRoutes.home.pattern),
                primaryActionText: 'Back to Home',
                onSecondaryAction: () =>
                    AppRouter.go(context, PagesRoutes.payments.pattern),
                secondaryActionText: 'View Payments',
                showBackgroundGradient: false,
                customIcon: const Icon(LucideIcons.clipboardList400),
              ),
            );
          }

          return MaterialPage(
            child: PaymentDetailScreen(paymentRefId: paymentId),
          );
        },
      ),
      GoRoute(
        name: PagesRoutes.receivingNoteDetail.name,
        path: PagesRoutes.receivingNoteDetail.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final receivingNoteId = state
              .pathParameters[ReceivingNoteDetailParameters.keyReceivingNoteId];

          if (receivingNoteId == null ||
              !receivingNoteId.toLowerCase().startsWith('rn')) {
            return MaterialPage(
              child: ErrorPageBuilder.notFound(
                title: 'Invalid Receiving Note',
                onPrimaryAction: () =>
                    AppRouter.go(context, PagesRoutes.home.pattern),
                primaryActionText: 'Back to Home',
                onSecondaryAction: () =>
                    AppRouter.go(context, PagesRoutes.purchaseReceives.pattern),
                secondaryActionText: 'View Purchase Receives',
                showBackgroundGradient: false,
                customIcon: const Icon(LucideIcons.packageSearch),
              ),
            );
          }

          return MaterialPage(
            child: ReceivingNoteDetailScreen(receivingNoteId: receivingNoteId),
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
      GoRoute(
        name: PagesRoutes.billDetail.name,
        path: PagesRoutes.billDetail.pattern,
        parentNavigatorKey: rootNavigatorKey,
        pageBuilder: (context, state) {
          final billId = state.pathParameters[BillDetailParameters.keyBillId];

          if (billId == null || !billId.toLowerCase().startsWith('bill')) {
            return MaterialPage(
              child: ErrorPageBuilder.notFound(
                title: 'Invalid Bill',
                onPrimaryAction: () =>
                    AppRouter.go(context, PagesRoutes.home.pattern),
                primaryActionText: 'Back to Home',
                onSecondaryAction: () =>
                    AppRouter.go(context, PagesRoutes.purchaseOrders.pattern),
                secondaryActionText: 'View Bills',
                showBackgroundGradient: false,
                customIcon: const Icon(LucideIcons.clipboardList400),
              ),
            );
          }

          return MaterialPage(
            child: BillDetailScreen(billRefId: billId, canSplitTheScreen: true),
          );
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
  Future<void> init() => GoRouterRoutesProvider.init();
  @override
  Future<T?> push<T>(BuildContext context, String uri, {Object? extra}) async {
    return await context.push<T>(uri, extra: extra);
  }

  @override
  void pushReplacement(BuildContext context, String uri, {Object? extra}) =>
      context.pushReplacement(uri, extra: extra);
  @override
  void go(BuildContext context, String uri, {Object? extra}) =>
      context.go(uri, extra: extra);
  @override
  void pushReplacementNamed(
    BuildContext context,
    String uri, {
    Object? extra,
  }) => context.pushReplacementNamed(uri, extra: extra);
  @override
  String getCurrentLocation(BuildContext context) {
    return GoRouterState.of(context).uri.path;
  }

  @override
  void refresh(BuildContext context) {
    return GoRouter.of(context).refresh();
  }

  @override
  void updateRouteInformation(
    BuildContext context,
    String uri, {
    Object? extra,
  }) => context.replace(uri, extra: extra);
  @override
  bool canPop(BuildContext context) => GoRouter.of(context).canPop();
  @override
  void onPop(BuildContext context) => GoRouter.of(context).pop();
}
