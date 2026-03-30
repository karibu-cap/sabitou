# Sabitou Clients — Complete Application Specification

> **Version:** 1.0.0 | **Target:** Production in 1 week  
> **Platform:** Flutter Web + Android + iOS + Desktop  
> **Market:** Cameroon (XAF, FR/EN bilingual)

---

## 1. Application Overview

Sabitou is a **multi-platform store management ERP + POS** application for small and medium businesses in Cameroon. It covers the full commercial cycle: product catalog → inventory → purchasing → point of sale → reporting.

---

## 2. User Roles & Access

| Role | Access |
|---|---|
| Business Owner | Full access to all stores, settings, reports |
| Store Manager | Single store: all features except business settings |
| Cashier | POS only + receipt history |
| Inventory Staff | Inventory + products + purchase orders |

Authentication: JWT token + refresh token (stored in Hive via `UserPreferences`).

---

## 3. App Architecture

```
lib/
├── core/
│   ├── di/
│   │   └── injection.dart          ← get_it service locator
│   ├── router/
│   │   └── app_router.dart         ← GoRouter with StatefulShellRoute
│   └── providers/
│       └── app_provider.dart       ← top-level app state (auth, store selection)
├── features/
│   ├── auth/                       ← login, register, onboarding
│   ├── pos/                        ← point of sale
│   ├── products/                   ← product catalog management
│   ├── inventory/                  ← stock levels, adjustments, transactions
│   ├── suppliers/                  ← supplier CRUD + stream
│   ├── purchase_orders/            ← PO lifecycle + receiving notes
│   ├── reports/                    ← dashboard + all report screens
│   ├── settings/                   ← business/store settings
│   └── audit/                      ← inventory & voucher audit logs
├── shared/
│   ├── extensions/                 ← proto message extensions
│   ├── utils/
│   │   ├── currency_formatter.dart
│   │   └── date_formatter.dart
│   ├── widgets/                    ← reusable UI components
│   └── i18n/                       ← ARB files + Intls service
└── tmp/
    ├── fake_data.dart              ← seed data for FakeTransport
    └── (fake_transport.dart lives in transport layer)
```

---

## 4. Feature Inventory

### 4.1 Authentication
- **Login:** email/password → AuthService.login → store token in Hive
- **Register:** name + email + password → AuthService.register
- **Auto-login:** on app start, check Hive token → load currentUser
- **Business/Store selection:** after login, pick from getMyBusinesses → getBusinessStores
- **Logout:** clear Hive tokens, redirect to login

### 4.2 Point of Sale (POS)
- **Product search:** text search or barcode scan → `searchStoreProducts`
- **Barcode lookup:** `mobile_scanner` → `findGlobalProducts(barCodeValue)`
- **Cart management:** add/remove/update qty, line totals, grand total
- **Stock check:** `checkProductAvailability` before confirming each item
- **Payment methods:** Cash / MTN Mobile Money / Orange Money / Gift Voucher
- **Multi-tender:** sum all payments, validate ≥ total
- **Overpayment handling:** compute change → offer cash or GiftVoucher
- **GiftVoucher issuance:** `createCashReceipt(issueVoucherOnChange: true)` if owedToCustomer > 0
- **GiftVoucher redemption:** applies voucher value as payment, tracks remaining
- **Receipt creation:** `CashReceiptService.createCashReceipt` → auto inventory deduction
- **Thermal print:** Sunmi built-in or Bluetooth ESC/POS
- **PDF receipt:** via `printing` + `pdf` as fallback
- **Receipt history:** `findCashReceipt(storeId)` with date filter

### 4.3 Products Catalog
- **Product list:** `findStoreProducts` + `searchStoreProducts` with text/barcode search
- **Product detail:** `getStoreProduct` → shows GlobalProduct info + StoreProduct pricing
- **Add product:** `createGlobalProduct` + `addProduct` (with initial stock, salePrice, SKU, reorderPoint)
- **Update product:** `updateStoreProduct` (handles global product fork if shared across stores)
- **Delete product:** `deleteStoreProduct` (soft delete via status)
- **Category filter:** `findCategories` → filter product list by category
- **Barcode display:** `barcode_widget` on product detail
- **Image:** `image_picker` to attach product photo

### 4.4 Inventory Management
- **Inventory overview:** `getResourceInventory` → all levels for store
- **Single product level:** `getProductInventoryLevels`
- **Low stock alerts:** `getLowStockItems` → badge count in nav + dedicated alert screen
- **Stock adjustment:** `adjustInventory(productId, newQty, reason)` → logs TXN_ADJUSTMENT
- **Transaction history:** `getRecentInventoryTransactions` (store-level or product-level)
- **Batch management:** view batches per product, FIFO order, expiration dates
- **Out-of-stock detection:** `quantityAvailable <= 0`

### 4.5 Suppliers
- **Supplier list (reactive):** `streamStoreSuppliers` → `BehaviorSubject`, re-emits every 10s
- **Supplier detail:** `getSupplier`
- **Create supplier:** `createSupplier` (name, email, phone, address, status)
- **Update supplier:** `updateSupplier`
- **Delete supplier:** `deleteSupplier`
- **Purchase history:** `getStorePurchaseHistory(storeId)` → invoices, outstanding balance

### 4.6 Purchase Orders
- **PO list:** `listPurchaseOrders(buyerId=storeId)` with status filter
- **Create PO:** select supplier + add items (product, qty, purchasePrice XAF) + expectedDeliveryDate
- **PO detail:** `getPurchaseOrder` → items, status, amounts
- **Status update:** `updatePurchaseOrderStatus` (PENDING → APPROVED → SHIPPED)
- **Cancel PO:** `cancelPurchaseOrder`
- **Receive goods:** `createReceivingNote` → per-item qty received, batchId, expiration → auto inventory update
- **Partial delivery:** multiple receiving notes per PO supported

### 4.7 Reports & Dashboard
- **Dashboard:** `getDashboardReport` → KPI cards + trend charts + top products + supplier performance
- **Sales report:** `getSalesReport(storeId, startDate, endDate)` → summaries table + total
- **Purchase report:** `getPurchaseReport` → summaries + totals
- **P&L report:** `getProfitLossReport` → revenue, COGS, gross/net profit, margins
- **Inventory movement:** `getInventoryMovementReport(productId)` → opening/closing + transactions
- **Best sellers:** `getBestSellingProducts` → ranked by revenue + units sold
- **Stock aging:** `getStockAgingReport` → FAST/MEDIUM/SLOW categories with color coding
- **Supplier performance:** `getSupplierPerformanceReport` → on-time %, quality issues
- **Date range filter:** Today / This Week / This Month / Custom picker (all reports)
- **PDF export:** every report screen has an export button

### 4.8 Audit Logs
- **Inventory transactions:** `getInventoryTransactionAuditLogs` → full chronological log
- **Voucher transactions:** `getVoucherTransactionAuditLogs` → voucher usage history
- Filter by: date range, transaction type, product, user

### 4.9 Settings
- **Business settings:** name, logo, contact → `updateBusiness`
- **Store settings:** name, address → `updateStore`
- **Member management:** `getBusinessMembers`, `getBusinessMember`
- **Store members:** `getStoreMember`
- **Language toggle:** FR ↔ EN (persisted in Hive)
- **Theme toggle:** light/dark (shadcn_ui ShadTheme)
- **Printer setup:** detect/configure thermal printer

---

## 5. Navigation Structure (GoRouter)

```
/ (shell: StatefulShellRoute with bottom nav)
├── /pos                    ← POS screen
├── /inventory              ← Inventory overview
│   └── /inventory/:productId    ← Product inventory detail
├── /products               ← Product catalog
│   ├── /products/new       ← Add product
│   └── /products/:id       ← Product detail + edit
├── /suppliers              ← Supplier list
│   ├── /suppliers/new      ← Create supplier
│   └── /suppliers/:id      ← Supplier detail + edit
├── /purchase-orders        ← PO list
│   ├── /purchase-orders/new     ← Create PO
│   └── /purchase-orders/:id     ← PO detail
│       └── /purchase-orders/:id/receive  ← Receiving note
├── /reports                ← Reports hub
│   ├── /reports/dashboard
│   ├── /reports/sales
│   ├── /reports/purchases
│   ├── /reports/pl
│   ├── /reports/inventory-movement
│   ├── /reports/best-sellers
│   ├── /reports/stock-aging
│   ├── /reports/supplier-performance
│   └── /reports/audit
└── /settings               ← Settings hub
    ├── /settings/business
    ├── /settings/store
    ├── /settings/members
    └── /settings/printer

/login                      ← outside shell
/register                   ← outside shell
/onboarding                 ← business/store selection, outside shell
```

---

## 6. State Management Tree (Provider)

```dart
MultiProvider(providers: [
  // Core
  ChangeNotifierProvider(create: (_) => sl<AppProvider>()),
  
  // Features
  ChangeNotifierProvider(create: (_) => sl<AuthProvider>()),
  ChangeNotifierProvider(create: (_) => sl<PosProvider>()),
  ChangeNotifierProvider(create: (_) => sl<ProductsProvider>()),
  ChangeNotifierProvider(create: (_) => sl<InventoryProvider>()),
  ChangeNotifierProvider(create: (_) => sl<SuppliersProvider>()),  // streaming
  ChangeNotifierProvider(create: (_) => sl<PurchaseOrderProvider>()),
  ChangeNotifierProvider(create: (_) => sl<ReportsProvider>()),
  ChangeNotifierProvider(create: (_) => sl<SettingsProvider>()),
  ChangeNotifierProvider(create: (_) => sl<AuditProvider>()),
])
```

---

## 7. FakeTransport — All Covered RPCs

| Service | Methods | Type |
|---|---|---|
| AuthService | register, login | unary |
| UserService | getCurrentUser, getUser | unary |
| BusinessService | getMyBusinesses, updateBusiness, getBusinessMembers, getBusinessMember | unary |
| StoreService | getBusinessStores, updateStore, getStoreMember | unary |
| SupplierService | getStoreSuppliers, getSupplier, createSupplier, updateSupplier, deleteSupplier | unary |
| SupplierService | streamStoreSuppliers | server-stream |
| StoreProductService | findStoreProducts, searchStoreProducts, findGlobalProducts, getStoreProduct, createGlobalProduct, addProduct, updateStoreProduct, deleteStoreProduct | unary |
| StoreProductService | streamStoreProducts | server-stream |
| CategoryService | findCategories | unary |
| InventoryService | adjustInventory, getLowStockItems, getResourceInventory, getProductInventoryLevels, getRecentInventoryTransactions, checkProductAvailability | unary |
| PurchaseOrderService | createPurchaseOrder, getPurchaseOrder, listPurchaseOrders, updatePurchaseOrderStatus, cancelPurchaseOrder, createReceivingNote | unary |
| CashReceiptService | findCashReceipt, createCashReceipt | unary |
| ReportingService | getSalesReport, getPurchaseReport, getInventoryMovementReport, getBestSellingProducts, getStorePurchaseHistory, getSupplierPerformanceReport, getProfitLossReport, getStockAgingReport | unary |
| ReportsService | getDashboardReport | unary |
| AuditsService | getInventoryTransactionAuditLogs, getVoucherTransactionAuditLogs | unary |

---

## 8. Key Business Rules

1. **XAF always integer** — no decimal arithmetic for monetary values
2. **FIFO batches** — oldest batch consumed first on sale
3. **Gift Voucher** — issued automatically if `owedToCustomer > 0` and cashier opts in
4. **Inventory auto-deduction** — triggered by `createCashReceipt` (FakeTransport side effect)
5. **Inventory auto-increment** — triggered by `createReceivingNote`
6. **Global product fork** — if a product is linked to multiple stores, editing the global product creates a new fork for the current store only
7. **Bilingual** — all product names, categories stored as `Internationalized {en, fr}`
8. **Offline detection** — `connectivity_plus` gates all RPC calls; show cached data when offline
9. **Reorder point alert** — badge shown when `quantityAvailable <= minThreshold`
10. **Stream reconnect** — exponential backoff on stream error (5s → 10s → 30s max)

---

## 9. Testing Strategy

### Human-Owned Tests (QA Phase)
- **Golden tests** (visual snapshots): every screen + loading state + error state + empty state
- **Widget tests**: interaction flows (tap, scroll, form submit)
- **Integration tests**: full flows (login → POS → checkout → receipt)

### Agent-Created Scaffolds (Pre-QA)
- Empty `describe` blocks in `test/features/<domain>/`
- Mockito mocks for all Provider dependencies
- `loadFonts()` + `ShadApp` wrapper setup in `flutter_test_config.dart`

### Packages
- `golden_toolkit` → `GoldenBuilder`, `multiScreenGolden`
- `mockito` → mock all services
- `build_runner` → generate mocks

---

## 10. Deployment Targets

| Platform | Command | Notes |
|---|---|---|
| Android | `flutter build apk --release` | Sunmi POS + Bluetooth |
| iOS | `flutter build ipa` | Bluetooth printing |
| Web | `flutter build web` | Chrome-first, POS via web |
| Desktop (Windows) | `flutter build windows` | `flutter_blue_plus_windows` for BT |

---

## 11. Environment Configuration

```dart
// lib/utils/app_constants.dart
class AppConstants {
  static const bool useFakeTransport = true;  // flip to false for production
  static const String apiBaseUrl = 'https://api.sabitou.cm';
  static const String appName = 'Sabitou';
}
```

---

## 12. Week-1 Delivery Checklist

- [ ] DI + Router bootstrapped
- [ ] Auth flow (login → business selection → store selection)
- [ ] POS: product search, cart, payment, receipt creation
- [ ] POS: thermal print (Sunmi + BT fallback)
- [ ] Products: list, search, add, edit, delete
- [ ] Inventory: overview, low stock alert, adjustment, transaction history
- [ ] Suppliers: reactive list (stream), CRUD
- [ ] Purchase Orders: create, status lifecycle, receiving note
- [ ] Reports: dashboard KPIs + sales report + P&L
- [ ] Settings: business/store update
- [ ] All screens: i18n complete (FR + EN)
- [ ] All screens: shadcn_ui components (no raw Material)
- [ ] `flutter analyze` clean (0 warnings)
- [ ] Golden test scaffolds created for all screens
- [ ] Human UI testing: all flows validated
