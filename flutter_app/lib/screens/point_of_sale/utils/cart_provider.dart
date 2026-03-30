import 'dart:async';

import 'package:clock/clock.dart';
import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:uuid/uuid.dart';

import '../../../repositories/pos_repository.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/logger.dart';
import '../../../utils/pos_exceptions.dart';
import 'inventory_cache.dart';

/// Cart state manager for the POS system.
///
/// ### Performance contract
/// Every method that a cashier triggers during scanning — [addItem],
/// [updateQuantity], [removeItem] — is **synchronous** and returns in < 1 ms.
/// Stock validation uses [InventoryCache] (in-memory Map lookup).
///
/// SQLite writes ([saveCurrentCashReceipt]) are always fire-and-forget
/// (`unawaited`). The cart lives in memory; persistence is a background concern.
///
/// ### Important: call [InventoryCache.warmUp] before using this class
/// The POS screen is responsible for warming up the cache at startup.
class CartProvider extends ChangeNotifier {
  final Uuid _uuid = const Uuid();
  final LoggerApp _log = LoggerApp('CartProvider');

  /// The active store for this POS session.
  final Store store;

  /// The cashier for this POS session.
  final User user;

  CashReceipt? _currentCashReceipt;
  final List<Payment> _payments = [];

  /// Saved DRAFT receipts (hold orders) loaded from SQLite at startup.
  final List<CashReceipt> saveCashReceipts = [];

  /// GetIt singleton accessor.
  static CartProvider get instance => GetIt.I<CartProvider>();

  /// The receipt currently being built by the cashier.
  CashReceipt? get currentCashReceipt => _currentCashReceipt;

  /// Payments already added for the current receipt.
  List<Payment> get payments => _payments;

  /// True when the receipt is ready to be completed.
  bool get canComplete {
    final r = _currentCashReceipt;
    if (r == null || r.items.isEmpty) return false;

    return (r.totalAmount - r.amountPaid) <= 0 && r.owedToCustomer <= 0;
  }

  /// Creates a [CartProvider] and starts loading hold orders in the background.
  CartProvider({required this.store, required this.user}) {
    _currentCashReceipt = _freshReceipt();
    unawaited(_loadDrafts());
  }

  /// Adds [item] to the cart.
  ///
  /// **Synchronous** — validates stock via [InventoryCache] (O(1) map lookup).
  ///
  /// - When the same product+batch already exists the quantities are merged.
  /// - Calls [InventoryCache.reserve] to immediately reflect the reduced
  ///   availability for subsequent scans.
  ///
  /// Throws [InsufficientStockException] when the available quantity is known
  /// and insufficient. When the product is not yet in the cache (`null`),
  /// the add is allowed (fail-open strategy for offline resilience).
  ///
  /// Returns `true` on success.
  bool addItem(InvoiceLineItem item) {
    if (item.quantity <= 0) return false;
    final cart = _currentCashReceipt;
    if (cart == null) return false;

    final available = InventoryCache.instance.getAvailable(item.productId);
    final alreadyInCart = _cartQuantity(item.productId, item.batchId);
    final totalWanted = alreadyInCart + item.quantity;

    if (available != null && available < totalWanted) {
      throw InsufficientStockException(
        productId: item.productId,
        productLabel: item.label,
        requested: totalWanted,
        available: available,
      );
    }

    final idx = _findIndex(item.productId, item.batchId);
    if (idx >= 0) {
      cart.items[idx]
        ..quantity = totalWanted
        ..subtotal = totalWanted * item.unitPrice
        ..total = totalWanted * item.unitPrice + item.taxAmount;
    } else {
      cart.items.add(item);
    }

    InventoryCache.instance.reserve(item.productId, item.quantity);

    _recalculate();
    notifyListeners();
    return true;
  }

  /// Updates the quantity of [productId]/[batchId] in the cart.
  ///
  /// **Synchronous** — same stock validation as [addItem].
  ///
  /// Returns `false` when [newQty] ≤ 0 or the item is not in the cart.
  bool updateQuantity(String productId, int newQty, {String? batchId}) {
    if (newQty <= 0) return false;
    final cart = _currentCashReceipt;
    if (cart == null) return false;

    final idx = _findIndex(productId, batchId);
    if (idx < 0) return false;

    final delta = newQty - cart.items[idx].quantity;

    if (delta > 0) {
      final available = InventoryCache.instance.getAvailable(productId);
      if (available != null && available < delta) {
        throw InsufficientStockException(
          productId: productId,
          productLabel: cart.items[idx].label,
          requested: newQty,
          available: cart.items[idx].quantity + available,
        );
      }
      InventoryCache.instance.reserve(productId, delta);
    } else if (delta < 0) {
      InventoryCache.instance.release(productId, -delta);
    }

    cart.items[idx]
      ..quantity = newQty
      ..subtotal = newQty * cart.items[idx].unitPrice
      ..total = newQty * cart.items[idx].unitPrice + cart.items[idx].taxAmount;

    cart.changeGiven = 0;
    _recalculate();
    notifyListeners();
    return true;
  }

  /// Removes the item matching [productId]/[batchId] from the cart.
  ///
  /// **Synchronous.** Releases the inventory reservation immediately.
  bool removeItem(String productId, {String? batchId}) {
    final cart = _currentCashReceipt;
    if (cart == null) return false;

    final idx = _findIndex(productId, batchId);
    if (idx < 0) return false;

    final removed = cart.items.removeAt(idx);
    InventoryCache.instance.release(productId, removed.quantity);

    _recalculate();
    notifyListeners();
    return true;
  }

  /// Clears the cart and releases all inventory reservations.
  void clearCart() {
    final cart = _currentCashReceipt;

    // Release all reservations before wiping the item list.
    if (cart != null) {
      InventoryCache.instance.releaseAll(
        cart.items.map((i) => (productId: i.productId, quantity: i.quantity)),
      );
    }

    _currentCashReceipt = _freshReceipt(storeId: cart?.storeId);
    _payments.clear();
    notifyListeners();
  }

  /// Adds a payment entry and recalculates totals. Synchronous.
  void addPayment(Payment payment) {
    _payments.add(payment);
    _recalculate();
    notifyListeners();
  }

  /// Removes the payment at [index] and recalculates. Synchronous.
  void removePayment(int index) {
    if (index < 0 || index >= _payments.length) return;
    _payments.removeAt(index);
    _recalculate();
    notifyListeners();
  }

  /// Records how much cash change was physically handed back. Synchronous.
  void setChangeGiven(double changeGiven) {
    _currentCashReceipt?.changeGiven = changeGiven;
    _recalculate();
    // No extra notifyListeners — _recalculate does NOT call it.
    // The caller is responsible for triggering the rebuild if needed.
    notifyListeners();
  }

  /// Persists the current cart as a DRAFT receipt (hold order).
  ///
  /// **Fire-and-forget** — returns immediately; SQLite write happens in
  /// the background. The in-memory [saveCashReceipts] list is updated
  /// synchronously so the UI reflects the change instantly.
  Future<bool> saveCurrentCashReceipt() async {
    final current = _currentCashReceipt;
    if (current == null || current.items.isEmpty) return false;

    // ── Update in-memory list immediately ──────────────────────────────────
    final idx = saveCashReceipts.indexWhere((r) => r.refId == current.refId);
    final snapshot = CashReceipt()..mergeFromMessage(current);
    if (idx >= 0) {
      saveCashReceipts[idx] = snapshot;
    } else {
      saveCashReceipts.add(snapshot);
    }
    notifyListeners();

    unawaited(
      PosRepository.instance
          .saveDraftReceipt(current)
          .catchError((Object e) => _log.severe('saveDraftReceipt failed: $e')),
    );

    return true;
  }

  /// Resumes a previously held [cashReceipt].
  ///
  /// Saves the current cart first if it has items, then swaps it.
  Future<void> resumeCashReceipt(CashReceipt cashReceipt) async {
    if (_currentCashReceipt?.items.isNotEmpty == true) {
      await saveCurrentCashReceipt();
    }

    // Release reservations for the old cart.
    final old = _currentCashReceipt;
    if (old != null) {
      InventoryCache.instance.releaseAll(
        old.items.map((i) => (productId: i.productId, quantity: i.quantity)),
      );
    }

    _currentCashReceipt = CashReceipt()..mergeFromMessage(cashReceipt);
    _payments.clear();

    // Re-apply reservations for the resumed cart.
    for (final item in (_currentCashReceipt?.items ?? <InvoiceLineItem>[])) {
      InventoryCache.instance.reserve(item.productId, item.quantity);
    }

    unawaited(removeCurrentCashReceipt(cashReceipt: cashReceipt));
    notifyListeners();
  }

  /// Deletes [cashReceipt] from SQLite and the in-memory list.
  Future<void> removeCurrentCashReceipt({CashReceipt? cashReceipt}) async {
    final target = cashReceipt ?? _currentCashReceipt;
    if (target == null) return;

    saveCashReceipts.removeWhere((r) => r.refId == target.refId);
    notifyListeners();

    unawaited(
      PosRepository.instance
          .deleteDraftReceipt(target.refId)
          .catchError((Object e) => _log.severe('deleteDraftReceipt: $e')),
    );
  }

  /// Returns the current list of cart items (live reference).
  List<InvoiceLineItem> getCartItems() =>
      _currentCashReceipt?.items ?? const [];

  CashReceipt _freshReceipt({String? storeId}) => CashReceipt(
    refId: _uuid.v4(),
    storeId: storeId ?? store.refId,
    cashierUserId: user.refId,
    items: [],
    currency: 'XAF',
    transactionTime: Timestamp.fromDateTime(clock.now()),
  );

  /// Recomputes financial totals. **Pure calculation — never calls
  /// [notifyListeners].** The calling method owns that responsibility.
  void _recalculate() {
    final r = _currentCashReceipt;
    if (r == null) return;

    final total = r.items.fold(0.0, (s, i) => s + i.total);
    final paid = _payments.fold(0.0, (s, p) => s + p.amount.toDouble());

    r.totalAmount = total;
    r.amountPaid = paid;

    final overpay = paid - total;
    final owed = overpay > 0 ? overpay : 0.0;
    final change = r.changeGiven;
    r.owedToCustomer = owed > change ? owed - change : 0.0;
  }

  int _findIndex(String productId, String? batchId) =>
      _currentCashReceipt?.items.indexWhere(
        (i) => i.productId == productId && i.batchId == batchId,
      ) ??
      -1;

  int _cartQuantity(String productId, String? batchId) {
    final idx = _findIndex(productId, batchId);
    if (idx < 0) {
      return 0;
    }

    return _currentCashReceipt?.items[idx].quantity ?? 0;
  }

  Future<void> _loadDrafts() async {
    try {
      final drafts = await PosRepository.instance.getDraftReceipts(store.refId);
      saveCashReceipts
        ..clear()
        ..addAll(drafts);
      notifyListeners();
    } on Exception catch (e) {
      _log.severe('_loadDrafts failed: $e');
    }
  }
}
