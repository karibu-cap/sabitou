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

  /// The sign in route, for example, http:localhost:8080/signin.
  static final signIn = _SignInRoute();

  /// The sign up route, for example, http:localhost:8080/signup.
  static final signUp = _SignUpRoute();

  /// The profile route, for example, http:localhost:8080/profile.
  static final profile = _ProfileRoute();
}

class _SignInRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/signin';
}

class _SignUpRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/signup';
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
