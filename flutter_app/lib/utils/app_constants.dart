/// The preferences keys.
final class PreferencesKey {
  /// Whether the user has opened the app for the first time.
  static const String isFirstOpenTime = 'isFirstOpenTime';

  /// Whether the app is in dark mode.
  static const String isDartMode = 'isDarkMode';

  /// The language of the app.
  static const String language = 'language';
}

/// The app collection names.
final class CollectionName {
  /// The store collection.
  static const String stores = 'stores';

  /// The business collection.
  static const String businesses = 'businesses';

  /// The business member collection.
  static const String businessMembers = 'business_members';

  /// The business client collection.
  static const String businessClients = 'business_clients';

  /// The link collection.
  static const String links = 'links';

  /// The supplier collection.
  static const String suppliers = 'suppliers';

  /// The permission collection.
  static const String permissions = 'permissions';

  /// The permission group collection.
  static const String permissionsGroups = 'permissions_groups';

  /// The user collection.
  static const String users = 'users';

  /// The product category collection.
  static const String productCategories = 'product_categories';

  /// The global product collection.
  static const String globalProducts = 'global_products';

  /// The store product collection.
  static const String storeProducts = 'store_products';

  /// The resource link collection.
  static const String resourceLinks = 'resource_links';

  /// The order collection.
  static const String orders = 'orders';

  /// The order receipt item collection.
  static const String orderReceiptItems = 'order_receipt_items';

  /// The order receipt collection.
  static const String orderReceipts = 'order_receipts';

  /// The transaction collection.
  static const String transactions = 'transactions';

  /// The category collection.
  static const String categories = 'categories';
}

/// The static images.
final class StaticImages {
  /// The logo image.
  static const String logo = 'assets/images/logo.png';

  /// The large logo image.
  static const String largeLogo = 'assets/images/large-logo.png';

  /// The placeholder image.
  static const String placeholder = 'assets/images/placeholder.png';
}

/// The app constants.
class AppConstants {
  /// The UI constants.
  static const double maxWidth = 1200.0;
  static const double headerPadding = 50.0;
  static const double contentPadding = 16.0;
  static const double cardRadius = 28.0;
  static const double iconSize = 25.0;
  static const double headerIconSize = 64.0;
  static const double cardIconSize = 80.0;
  static const double smallIconSize = 48.0;

  static const double smallPadding = 8.0;
  static const double largePadding = 24.0;
  static const double borderRadius = 8.0;
  static const double largeIconSize = 48.0;
  static const int expiryDaysThreshold = 30;

  /// The spacing constants.
  static const double spacingXS = 4.0;
  static const double spacingS = 8.0;
  static const double spacingM = 12.0;
  static const double spacingL = 16.0;
  static const double spacingXL = 24.0;
  static const double spacingXXL = 32.0;
  static const double spacingLarge = 40.0;

  /// The breakpoints.
  static const double mobileBreakpoint = 600.0;
  static const double tabletBreakpoint = 800.0;
  static const double desktopBreakpoint = 1200.0;

  /// The animation duration.
  static const Duration animationDuration = Duration(milliseconds: 200);

  static const double sidebarWidth = 256.0;
  static const double headerHeight = 64.0;
}

/// The dashboard items.
enum DashboardItem {
  /// The dashboard item.
  dashboard,

  /// The inventory item.
  inventory,

  /// The products item.
  products,

  /// The sales item.
  salesReports,

  /// Add sales.
  salesOrders,

  /// The great sale item.
  sales,

  /// The reports item.
  reports,

  /// The suppliers item.
  suppliers,

  /// The members item.
  members,

  /// The settings item.
  settings,
}
