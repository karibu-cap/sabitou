/// Interface for routes with parameters.
abstract class PagesRoutesWithParams<T> {
  /// Returns the pattern URL associated with the route.
  String get pattern;

  /// Creates the route URL.
  String create(T parameters);
}

/// Interface for routes without parameters.
abstract class PagesRoutesWithNoParams {
  /// Returns the pattern URL associated with the route.
  String get pattern;

  /// The name of the route.
  String get name;

  /// Creates the route URL.
  String create() => pattern;
}

/// The pages routes.
abstract class PagesRoutes {
  /// The home route, for example, http:localhost:8080.
  static final home = _HomeRoute();

  /// The dashboard route, for example, http:localhost:8080/dashboard.
  static final dashboard = _DashboardRoute();

  /// The login route, for example, http:localhost:8080/auth/login.
  static final login = _LoginRoute();

  /// The registration route, for example, http:localhost:8080/auth/registration.
  static final registration = _RegistrationRoute();

  /// The forgot password route, for example, http:localhost:8080/auth/forgot-password.
  static final forgotPassword = _ForgotPasswordRoute();

  /// The inventory route, for example, http:localhost:8080/inventory.
  static final inventory = _InventoryRoute();

  /// The sales route, for example, http:localhost:8080/sales.
  static final sales = _SalesRoute();

  /// The new order route, for example, http:localhost:8080/sales/pos.
  static final pos = _PosRoute();

  /// The reports route, for example, http:localhost:8080/reports.
  static final reports = _ReportsRoute();

  /// The reports route, for example, http:localhost:8080/sales/cash-receipts.
  static final cashReceipts = _CashReceiptsRoute();

  /// The audits route, for example, http:localhost:8080/audits.
  static final audits = _AuditsRoute();

  /// The users route, for example, http:localhost:8080/users.
  static final users = _UsersRoute();

  /// The suppliers route, for example, http:localhost:8080/suppliers.
  static final suppliers = _SuppliersRoute();

  /// The categories route, for example, http:localhost:8080/categories.
  static final categories = _CategoriesRoute();

  /// The global products route, for example, http:localhost:8080/global-products.
  static final globalProducts = _GlobalProductsRoute();

  /// The settings route, for example, http:localhost:8080/settings.
  static final settings = _SettingsRoute();

  /// The vouchers invoices route, for example, http:localhost:8080/vouchers-invoices.
  static final vouchersInvoices = _VouchersInvoicesRoute();

  /// The purchase orders route, for example, http:localhost:8080/purchase-orders.
  static final purchaseOrders = _PurchaseOrdersRoute();

  /// The sales orders route, for example, http:localhost:8080/sales-orders.
  static final salesOrders = _SalesOrdersRoute();

  /// The sales orders route, for example, http:localhost:8080/products-list.
  static final productsList = _ProductsListRoute();
}

class _ProductsListRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/products-list';

  @override
  String get name => 'products-list';
}

class _PurchaseOrdersRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/purchase-orders';

  @override
  String get name => 'purchase-orders';
}

class _CashReceiptsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/sales/cash-receipts';

  @override
  String get name => 'sales/cash-receipts';
}

class _SalesOrdersRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/sales-orders';

  @override
  String get name => 'sales-orders';
}

class _InventoryRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/inventory';

  @override
  String get name => 'inventory';
}

class _SalesRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/sales';

  @override
  String get name => 'sales';
}

class _PosRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/sales/pos';

  @override
  String get name => 'sales/pos';
}

class _ReportsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/reports';

  @override
  String get name => 'reports';
}

class _AuditsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/audits';

  @override
  String get name => 'audits';
}

class _UsersRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/users';

  @override
  String get name => 'users';
}

class _SuppliersRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/suppliers';

  @override
  String get name => 'suppliers';
}

class _CategoriesRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/categories';

  @override
  String get name => 'categories';
}

class _GlobalProductsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/global-products';

  @override
  String get name => 'global-products';
}

class _SettingsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/settings';

  @override
  String get name => 'settings';
}

/// The vouchers invoices route, for example, http:localhost:8080/vouchers-invoices.
final vouchersInvoices = _VouchersInvoicesRoute();

class _VouchersInvoicesRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/vouchers-invoices';

  @override
  String get name => 'vouchers-invoices';
}

class _LoginRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/auth/login';

  @override
  String get name => 'login';
}

class _RegistrationRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/auth/registration';

  @override
  String get name => 'registration';
}

class _ForgotPasswordRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/auth/forgot-password';

  @override
  String get name => 'forgot-password';
}

class _HomeRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/';

  @override
  String get name => 'home';
}

class _DashboardRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/dashboard';

  @override
  String get name => 'dashboard';
}

/// The dashboard parameters.
class DashboardParameters {
  /// The key of the item.
  static const String keyItem = 'item';

  /// The item label.
  final String? itemLabel;

  /// Constructors of new [DashboardParameters].
  DashboardParameters({this.itemLabel});
}

/// The dashboard items.
enum DashboardLabelPage {
  /// The dashboard store.
  dashboard,

  /// The dashboard store.
  stores,

  /// The dashboard settings.
  settings,

  /// The user profile.
  profile,
}
