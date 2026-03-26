import '../services/internationalization/internationalization.dart';

/// The preferences keys.
final class PreferencesKey {
  /// Whether the user has opened the app for the first time.
  static const String isFirstOpenTime = 'isFirstOpenTime';

  /// Whether the app is in dark mode.
  static const String isDartMode = 'isDarkMode';

  /// The language of the app.
  static const String language = 'language';

  /// The prints list key.
  static const String printer = 'printer';

  /// Printer configuration key
  static const String printerConfiguration = 'printer_configuration';
}

/// The app collection names.
final class CollectionName {
  /// The store collection.
  static const String stores = 'stores';

  /// The business collection.
  static const String businesses = 'businesses';

  /// The business member collection.
  static const String businessMembers = 'business_members';

  /// The store member collection.
  static const String storeMembers = 'store_members';

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

  /// The invoice collection.
  static const String invoices = 'invoices';

  /// The bills collection.
  static const String bills = 'bills';

  /// The category collection.
  static const String categories = 'categories';

  /// The payments collection.
  static const String payments = 'payments';

  /// The gift vouchers collection.
  static const String giftVouchers = 'gift_vouchers';

  /// The voucher transactions collection.
  static const String voucherTransactions = 'voucher_transactions';

  /// The cash receipts collection.
  static const String cashReceipts = 'cash_receipts';

  /// The inventory level collection.
  static const String inventoryLevels = 'inventory_levels';

  /// The purchase orders collection.
  static const String purchaseOrders = 'purchase_orders';

  /// The receiving notes collection.
  static const String receivingNotes = 'receiving_notes';

  /// The inventory transactions collection.
  static const String inventoryTransactions = 'inventory_transactions';

  /// The batches collection.
  static const String batches = 'batches';

  /// The sales orders collection.
  static const String salesOrders = 'sales_orders';

  /// The sales orders itme collection.
  static const String salesOrdersItemss = 'sales_order_line_items';

  /// The purchase order items collection.
  static const String purchaseOrderItems = 'purchase_order_line_items';

  /// The delivery notes collection.
  static const String deliveryNotes = 'delivery_notes';

  /// The delivery notes items collection.
  static const String deliveryNotesItems = 'delivery_note_line_items';

  /// The receiving notes items collection.
  static const String receivingNoteLineItems = 'receiving_note_line_items';

  /// The return notes collection.
  static const String returnNotes = 'return_notes';

  /// The return notes items collection.
  static const String returnNoteLineItems = 'return_note_line_items';

  /// The invoice line items collection.
  static const String invoiceLineItems = 'invoice_line_items';

  /// The bill line items collection.
  static const String billLineItems = 'bill_line_items';

  /// The local auth collection.
  static const String localAuth = 'local_auth';
}

/// The static images.
final class StaticImages {
  /// The placeholder image.
  static const String placeholder = 'assets/images/placeholder.png';
}

final months = [
  '',
  Intls.to.january,
  Intls.to.february,
  Intls.to.march,
  Intls.to.april,
  Intls.to.may,
  Intls.to.june,
  Intls.to.july,
  Intls.to.august,
  Intls.to.september,
  Intls.to.october,
  Intls.to.november,
  Intls.to.december,
];

final days = [
  Intls.to.monday,
  Intls.to.tuesday,
  Intls.to.wednesday,
  Intls.to.thursday,
  Intls.to.friday,
  Intls.to.saturday,
  Intls.to.sunday,
];

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

  /// The inventory children item.
  inventoryChildren,

  /// The products item.
  products,

  /// The sales item.
  salesReports,

  /// The great sale item.
  sales,

  /// The reports item.
  reports,

  /// The suppliers item.
  suppliers,

  /// The members item.
  members,

  /// The categories item.
  categories,

  /// The global products item.
  globalProducts,

  /// The settings item.
  settings,

  /// The cash receipts item.
  cashReceipts,

  /// The pos item.
  pos,

  /// The purchase orders parent (expandable section).
  purchaseOrdersParent,

  /// The purchase orders item.
  purchaseOrders,

  /// The purchase receives item.
  purchaseReceives,

  /// The bills item.
  bills,

  /// The payments made item.
  paymentsMade,

  /// The products list item.
  productsList,

  /// The audits item.
  audits,
}
