import 'dart:async';
import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../repositories/inventory_repository.dart';
import '../../../utils/logger.dart';

/// In-memory inventory level cache for the POS system.
///
/// ## Why this exists
/// A POS cashier scans products at 1–2 items per second. Every stock check
/// **must be synchronous and instant** — an `await` before adding an item to
/// the cart creates a visible delay that breaks the scanning flow.
///
/// [InventoryCache] solves this by:
/// 1. Loading all `inventory_levels` for the active store into a
///    `Map<productId, int>` once at POS startup ([warmUp]).
/// 2. Returning availability via [getAvailable] — a plain `Map` lookup, O(1).
/// 3. Applying optimistic reservations instantly in memory ([reserve]).
/// 4. Listening to PowerSync's `watch()` stream so the map stays in sync
///    whenever the server pushes updated inventory levels.
///
/// ## Lifecycle
/// ```
/// PointOfSaleScreen.initState()
///   → InventoryCache.instance.warmUp(storeId)   // one-time load
///   → PowerSync watch starts automatically
///
/// CartProvider.addItem()
///   → cache.getAvailable(productId)             // sync, ~0 ms
///   → cache.reserve(productId, qty)             // optimistic
///
/// CartProvider.removeItem()
///   → cache.release(productId, qty)             // undo reservation
/// ```
///
/// Access via `InventoryCache.instance` (GetIt singleton).
class InventoryCache extends ChangeNotifier {
  final LoggerApp _log = LoggerApp('InventoryCache');

  /// `storeProductId → quantity_available` (after optimistic reservations).
  final Map<String, int> _available = {};

  /// Raw `quantity_on_hand` before reservations (used to restore on release).
  final Map<String, int> _onHand = {};

  /// True once [warmUp] has completed at least one full load.
  bool _ready = false;

  /// The store for which inventory is currently cached.
  String _storeId;

  static InventoryCache get instance => GetIt.I<InventoryCache>();

  StreamSubscription<List<InventoryLevel>>? _watchSub;

  /// Constructor of new [InventoryCache] for the given [storeId].
  InventoryCache(this._storeId);

  /// Whether the cache has been populated and is ready for synchronous reads.
  bool get isReady => _ready;

  /// Loads all inventory levels for [storeId] into memory and starts
  /// listening for live updates via PowerSync.
  ///
  /// Must be called once when the POS screen opens. Subsequent calls with
  /// the same [storeId] are no-ops.
  Future<void> warmUp(String storeId) async {
    if (_storeId == storeId && _ready) return;

    _storeId = storeId;
    await _load(storeId);
    _startWatch(storeId);
  }

  /// Returns how many units of [productId] are available for sale.
  ///
  /// This is a **synchronous O(1)** map lookup. Safe to call on every
  /// keypress or scanner beep without any UI jank.
  ///
  /// Returns `null` when the product is not in the cache (not yet synced).
  /// Callers should treat `null` as "unknown" and allow the add.
  int? getAvailable(String productId) => _available[productId];

  /// Optimistically decrements the in-memory availability for [productId]
  /// by [qty].
  ///
  /// Called immediately when an item is added to the cart so that subsequent
  /// scans of the same product see the reduced availability.
  void reserve(String productId, int qty) {
    final current = _available[productId];
    if (current == null) return;
    _available[productId] = max(0, current - qty);
    notifyListeners();
  }

  /// Releases a previously [reserve]d quantity back into the cache.
  ///
  /// Called when an item is removed from the cart or the cart is cleared.
  void release(String productId, int qty) {
    final current = _available[productId] ?? 0;
    final ceiling = _onHand[productId] ?? current;
    _available[productId] = min(ceiling, current + qty);
    notifyListeners();
  }

  /// Releases all reservations for the products in [items].
  ///
  /// Convenience method for [CartProvider.clearCart].
  void releaseAll(Iterable<({String productId, int quantity})> items) {
    for (final item in items) {
      release(item.productId, item.quantity);
    }
  }

  /// Forces a full reload from SQLite.
  ///
  /// Use after completing a sale to ensure the cache reflects the real
  /// post-sale inventory before the next transaction.
  Future<void> refresh() async {
    await _load(_storeId);
  }

  Future<void> _load(String storeId) async {
    try {
      final rows = await InventoryRepository.instance
          .getStoreInventoryWhithoutProduct(storeId);

      _available.clear();
      _onHand.clear();

      for (final row in rows) {
        final id = row.storeProductId;
        if (id.isEmpty) continue;
        final avail = row.quantityAvailable;
        final onHand = row.quantityOnHand;
        _available[id] = avail;
        _onHand[id] = onHand;
      }

      _ready = true;
      _log.info('InventoryCache loaded: ${_available.length} products');
      notifyListeners();
    } on Exception catch (e) {
      _log.severe('InventoryCache._load failed: $e');
    }
  }

  /// Subscribes to PowerSync live query so the cache auto-updates whenever
  /// inventory levels are pushed from the server.
  void _startWatch(String storeId) {
    _watchSub?.cancel();
    _watchSub = InventoryRepository.instance
        .watchStoreInventory(storeId)
        .listen(
          (rows) {
            // Merge server values — do NOT clobber optimistic reservations
            // that are below the server value (those are active cart items).
            for (final row in rows) {
              final id = row.storeProductId;
              if (id.isEmpty) continue;
              final serverAvail = row.quantityAvailable;
              final serverOnHand = row.quantityOnHand;

              // Update the ceiling.
              _onHand[id] = serverOnHand;

              // Only push up if server has more than our current optimistic
              // value (don't undo a local reservation).
              final current = _available[id] ?? 0;
              if (serverAvail > current) {
                _available[id] = serverAvail;
              }
            }
            notifyListeners();
          },
          onError: (Object e) => _log.warning('InventoryCache watch error: $e'),
        );
  }

  @override
  void dispose() {
    _watchSub?.cancel();
    super.dispose();
  }
}
