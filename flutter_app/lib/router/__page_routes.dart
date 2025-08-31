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

  /// Creates the route URL.
  String create() => pattern;
}

/// The pages routes.
abstract class PagesRoutes {
  /// The home route, for example, http:localhost:8080.
  static final home = _HomeRoute();

  /// The dashboard route, for example, http:localhost:8080/stores.
  static final stores = _StoresRoute();

  /// The dashboard route, for example, http:localhost:8080/dashboard.
  static final dashboard = _DashboardRoute();

  /// The login route, for example, http:localhost:8080/auth/login.
  static final login = _LoginRoute();

  /// The registration route, for example, http:localhost:8080/auth/registration.
  static final registration = _RegistrationRoute();

  /// The forgot password route, for example, http:localhost:8080/auth/forgot-password.
  static final forgotPassword = _ForgotPasswordRoute();

  /// The profile route, for example, http:localhost:8080/profile.
  static final profile = _ProfileRoute();
}

class _LoginRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/auth/login';
}

class _RegistrationRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/auth/registration';
}

class _ForgotPasswordRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/auth/forgot-password';
}

class _HomeRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/';
}

class _StoresRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/stocks';
}

class _DashboardRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/dashboard';
}

class _ProfileRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/profile';
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
