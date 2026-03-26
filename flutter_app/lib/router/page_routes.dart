/// Interface for routes with parameters.
abstract class PagesRoutesWithParams<T> {
  /// Returns the pattern URL associated with the route.
  String get pattern;

  /// The name of the route.
  String get name;

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

  /// The inventory detail route, for example, http:localhost:8080/inventory?product=product_id.
  static final inventoryDetail = _InventoryDetailRoute();

  /// The inventory ajustment
  static final inventoryAjustment = _InventoryAjustmentRoute();

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

  /// The purchase order detail route, for example, http:localhost:8080/purchase-orders/:id.
  static final purchaseOrderDetail = _PurchaseOrderDetailRoute();

  /// The purchase receives route, for example, http:localhost:8080/purchase-receives.
  static final purchaseReceives = _PurchaseReceivesRoute();

  /// The receiving note detail route, for example, http:localhost:8080/purchase-receives/:id.
  static final receivingNoteDetail = _ReceivingNoteDetailRoute();

  /// The bills route, for example, http:localhost:8080/bills.
  static final bills = _BillsRoute();

  /// The sales orders route, for example, http:localhost:8080/sales-orders.
  static final salesOrders = _SalesOrdersRoute();

  /// The sales orders route, for example, http:localhost:8080/products-list.
  static final productsList = _ProductsListRoute();

  /// The product new route
  static final productNew = _ProductNewRoute();

  /// The product detail route
  static final productDetail = _ProductDetailRoute();

  /// The bill detail route
  static final billDetail = _BillDetailRoute();

  /// The product edit route
  static final productEdit = _ProductEditRoute();

  /// The payments made route, for example, http:localhost:8080/payments.
  static final payments = _PaymentsRoute();

  /// The welcome route, for example, http:localhost:8080.
  static final welcome = _WelcomeRoute();
}

class _PaymentsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/payments';

  @override
  String get name => 'payments';
}

class _WelcomeRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/welcome';

  @override
  String get name => 'welcome';
}

class _ProductsListRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/products-list';

  @override
  String get name => 'products-list';
}

class _ProductNewRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/products-list/new';

  @override
  String get name => 'product-new';
}

/// The bill detail parameters.
class BillDetailParameters {
  /// The bill ID parameter key.
  static const String keyBillId = 'billId';

  /// The bill ID.
  final String billId;

  /// Constructs a new [BillDetailParameters].
  BillDetailParameters({required this.billId});
}

/// The product detail parameters.
class ProductDetailParameters {
  /// The product ID parameter key.
  static const String keyProductId = 'productId';

  /// The product ID.
  final String productId;

  /// Constructs a new [ProductDetailParameters].
  ProductDetailParameters({required this.productId});
}

class _BillDetailRoute extends PagesRoutesWithParams<BillDetailParameters> {
  @override
  String get pattern => '/bills/:${BillDetailParameters.keyBillId}';

  @override
  String get name => 'bill-detail';

  @override
  String create(BillDetailParameters parameters) {
    return '/bills/${parameters.billId}';
  }
}

class _ProductDetailRoute
    extends PagesRoutesWithParams<ProductDetailParameters> {
  @override
  String get pattern =>
      '/products-list/:${ProductDetailParameters.keyProductId}';

  @override
  String get name => 'product-detail';

  @override
  String create(ProductDetailParameters parameters) {
    return '/products-list/${parameters.productId}';
  }
}

class _ProductEditRoute extends PagesRoutesWithParams<ProductDetailParameters> {
  @override
  String get pattern =>
      '/products-list/:${ProductDetailParameters.keyProductId}/edit';

  @override
  String get name => 'product-edit';

  @override
  String create(ProductDetailParameters parameters) {
    return '/products-list/${parameters.productId}/edit';
  }
}

class _PurchaseOrdersRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/purchase-orders';

  @override
  String get name => 'purchase-orders';
}

/// The purchase order detail parameters.
class PurchaseOrderDetailParameters {
  /// The purchase order ID parameter key.
  static const String keyPurchaseOrderId = 'purchaseOrderId';

  /// The purchase order ID.
  final String purchaseOrderId;

  /// Constructs a new [PurchaseOrderDetailParameters].
  PurchaseOrderDetailParameters({required this.purchaseOrderId});
}

class _PurchaseOrderDetailRoute
    extends PagesRoutesWithParams<PurchaseOrderDetailParameters> {
  @override
  String get pattern =>
      '/purchase-orders/:${PurchaseOrderDetailParameters.keyPurchaseOrderId}';

  @override
  String get name => 'purchase-order-detail';

  @override
  String create(PurchaseOrderDetailParameters parameters) {
    return '/purchase-orders/${parameters.purchaseOrderId}';
  }
}

class _PurchaseReceivesRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/purchase-receives';

  @override
  String get name => 'purchase-receives';
}

/// The receiving note detail parameters.
class ReceivingNoteDetailParameters {
  /// The receiving note ID parameter key.
  static const String keyReceivingNoteId = 'receivingNoteId';

  /// The receiving note ID.
  final String receivingNoteId;

  /// Constructs a new [ReceivingNoteDetailParameters].
  ReceivingNoteDetailParameters({required this.receivingNoteId});
}

class _ReceivingNoteDetailRoute
    extends PagesRoutesWithParams<ReceivingNoteDetailParameters> {
  @override
  String get pattern =>
      '/purchase-receives/:${ReceivingNoteDetailParameters.keyReceivingNoteId}';

  @override
  String get name => 'receiving-note-detail';

  @override
  String create(ReceivingNoteDetailParameters parameters) {
    return '/purchase-receives/${parameters.receivingNoteId}';
  }
}

class _BillsRoute extends PagesRoutesWithNoParams {
  @override
  String get pattern => '/bills';

  @override
  String get name => 'bills';
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

class _InventoryAjustmentRoute
    extends PagesRoutesWithParams<InventoryDetailParameters> {
  @override
  String get pattern =>
      '/inventory/:${InventoryDetailParameters.keyProductId}/ajustment';

  @override
  String get name => 'inventory-ajustment';

  @override
  String create(InventoryDetailParameters parameters) {
    return '/inventory/${parameters.productId}/ajustment';
  }
}

class _InventoryDetailRoute
    extends PagesRoutesWithParams<InventoryDetailParameters> {
  @override
  String get pattern => '/inventory/:${InventoryDetailParameters.keyProductId}';

  @override
  String get name => 'inventory-detail';

  @override
  String create(InventoryDetailParameters parameters) {
    return '/inventory/${parameters.productId}';
  }
}

/// The inventory detail parameters.
class InventoryDetailParameters {
  /// The product ID parameter key.
  static const String keyProductId = 'productId';

  /// The product ID.
  final String productId;

  /// Constructs a new [InventoryDetailParameters].
  InventoryDetailParameters({required this.productId});
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
