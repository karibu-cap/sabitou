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

  /// The sales route, for example, http:localhost:8080/sales-report.
  static final salesReport = _SalesRoute();

  /// The new order route, for example, http:localhost:8080/sales/new-order.
  static final newOrder = _NewOrderRoute();

  /// The reports route, for example, http:localhost:8080/reports.
  static final reports = _ReportsRoute();

  /// The transactions route, for example, http:localhost:8080/transactions.
  static final transactions = _TransactionsRoute();

  /// The users route, for example, http:localhost:8080/users.
  static final users = _UsersRoute();

  /// The suppliers route, for example, http:localhost:8080/suppliers.
  static final suppliers = _SuppliersRoute();

  /// The settings route, for example, http:localhost:8080/settings.
  static final settings = _SettingsRoute();
}

class _InventoryRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/inventory';

  @override
  String get name => 'inventory';
}

class _SalesRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/sales-report';

  @override
  String get name => 'sales-report';
}

class _NewOrderRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/new-order';

  @override
  String get name => 'new-order';
}

class _ReportsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/reports';

  @override
  String get name => 'reports';
}

class _TransactionsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/transactions';

  @override
  String get name => 'transactions';
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

class _SettingsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/settings';

  @override
  String get name => 'settings';
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
