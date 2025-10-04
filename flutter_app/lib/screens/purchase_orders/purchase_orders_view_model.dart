import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/purchase_order_repository.dart';
import '../../repositories/store_products_repository.dart';
import '../../repositories/suppliers_repository.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for purchase orders screen
class PurchaseOrdersViewModel {
  final LoggerApp _logger = LoggerApp('PurchaseOrdersViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the purchase orders subject.
  final _purchaseOrdersSubject =
      BehaviorSubject<UnmodifiableListView<PurchaseOrder>>.seeded(
        UnmodifiableListView([]),
      );

  /// Gets the suppliers subject.
  final _suppliersSubject =
      BehaviorSubject<UnmodifiableListView<Supplier>>.seeded(
        UnmodifiableListView([]),
      );

  /// Gets the store products.
  var _storeProducts = UnmodifiableListView<StoreProductWithGlobalProduct>([]);

  /// Gets the error subject.
  final _errorSubject = BehaviorSubject<String>.seeded('');

  /// Gets the loading subject.
  final _loadingSubject = BehaviorSubject<bool>.seeded(false);

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected supplier filter subject.
  final _selectedSupplierFilterSubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected status filter subject.
  final _selectedStatusFilterSubject =
      BehaviorSubject<PurchaseOrderStatus?>.seeded(null);

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Purchase orders data.
  PurchaseOrdersData purchaseOrdersData = PurchaseOrdersData(
    totalOrders: 0,
    pendingOrders: 0,
    totalValue: 0,
  );

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected supplier filter.
  BehaviorSubject<String> get selectedSupplierFilter =>
      _selectedSupplierFilterSubject;

  /// Gets the selected status filter.
  BehaviorSubject<PurchaseOrderStatus?> get selectedStatusFilter =>
      _selectedStatusFilterSubject;

  /// Gets the purchase orders stream.
  BehaviorSubject<UnmodifiableListView<PurchaseOrder>>
  get purchaseOrdersSubject => _purchaseOrdersSubject;

  /// Gets the suppliers stream.
  BehaviorSubject<UnmodifiableListView<Supplier>> get suppliersSubject =>
      _suppliersSubject;

  /// Gets the store products stream.
  UnmodifiableListView<StoreProductWithGlobalProduct> get storeProducts =>
      _storeProducts;

  /// Gets the error stream.
  Stream<String> get errorStream => _errorSubject.stream;

  /// Gets the loading stream.
  Stream<bool> get loadingStream => _loadingSubject.stream;

  /// Gets the filtered purchase orders stream.
  Stream<List<PurchaseOrder>> get filteredPurchaseOrdersStream =>
      Rx.combineLatest5(
        _purchaseOrdersSubject.stream,
        _searchQuerySubject.stream,
        _selectedSupplierFilterSubject.stream,
        _selectedStatusFilterSubject.stream,
        _suppliersSubject.stream,
        (orders, searchQuery, supplierFilter, statusFilter, suppliers) {
          var filtered = orders.toList();

          if (searchQuery.isNotEmpty) {
            filtered = filtered.where((order) {
              return order.documentId.toLowerCase().contains(
                searchQuery.toLowerCase(),
              );
            }).toList();
          }

          if (supplierFilter.isNotEmpty) {
            filtered = filtered
                .where((order) => order.supplierId == supplierFilter)
                .toList();
          }

          if (statusFilter != null) {
            filtered = filtered
                .where((order) => order.status == statusFilter)
                .toList();
          }

          filtered.sort(
            (a, b) =>
                b.createdAt.toDateTime().compareTo(a.createdAt.toDateTime()),
          );

          return filtered;
        },
      );

  /// Constructor of [PurchaseOrdersViewModel].
  PurchaseOrdersViewModel() {
    initData();
  }

  /// Initiates the data.
  Future<void> initData() async {
    _logger.info('initData is called');
    try {
      await Future.wait([
        _loadPurchaseOrders(),
        _loadSuppliers(),
        _loadCurrentStoreProducts(),
      ]);

      if (!completer.isCompleted) {
        completer.complete(true);
      }
    } on Exception catch (e) {
      _logger.severe('Error initializing data: $e');
      _errorSubject.add('Failed to load purchase orders data');
      if (!completer.isCompleted) {
        completer.complete(false);
      }
    }
  }

  /// Loads purchase orders.
  Future<void> _loadPurchaseOrders() async {
    try {
      final store = userPreferences.store;
      if (store == null) {
        _logger.warning('Store not found');

        return;
      }

      final response = await PurchaseOrderRepository.instance
          .listPurchaseOrders(ListPurchaseOrdersRequest(buyerId: store.refId));

      if (response != null) {
        _purchaseOrdersSubject.add(
          UnmodifiableListView(response.purchaseOrders),
        );

        // Calculate stats
        final orders = response.purchaseOrders;
        final totalValue = orders.fold<double>(
          0.0,
          (sum, order) => sum + (order.totalAmount),
        );
        final pendingOrders = orders
            .where(
              (order) =>
                  order.status == PurchaseOrderStatus.PO_STATUS_PENDING ||
                  order.status ==
                      PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED,
            )
            .length;

        purchaseOrdersData = PurchaseOrdersData(
          totalOrders: orders.length,
          pendingOrders: pendingOrders,
          totalValue: totalValue,
        );
      }
    } on Exception catch (e) {
      _logger.severe('Error loading purchase orders: $e');
      _errorSubject.add('Failed to load purchase orders');
    }
  }

  /// Loads suppliers.
  Future<void> _loadSuppliers() async {
    try {
      final store = userPreferences.store;
      if (store == null) {
        _logger.warning('Store not found');

        return;
      }

      final suppliers = await SuppliersRepository.instance.getSuppliersByStore(
        store.refId,
      );
      _suppliersSubject.add(UnmodifiableListView(suppliers));
    } on Exception catch (e) {
      _logger.severe('Error loading suppliers: $e');
    }
  }

  /// Loads stores.
  Future<void> _loadCurrentStoreProducts() async {
    try {
      final store = userPreferences.store;
      if (store == null) {
        _logger.warning('Store not found');

        return;
      }

      final storeProducts = await StoreProductsRepository.instance
          .findStoreProducts(FindStoreProductsRequest(storeId: store.refId));
      _storeProducts = UnmodifiableListView(storeProducts?.toList() ?? []);
    } on Exception catch (e) {
      _logger.severe('Error loading stores: $e');
    }
  }

  /// Creates a new purchase order.
  Future<bool> createPurchaseOrder(CreatePurchaseOrderRequest request) async {
    try {
      _loadingSubject.add(true);
      _errorSubject.add('');

      final response = await PurchaseOrderRepository.instance
          .createPurchaseOrder(request);

      if (response != null && response.purchaseOrderId.isNotEmpty) {
        // Refresh the purchase orders list
        await _loadPurchaseOrders();

        return true;
      } else {
        _errorSubject.add('Failed to create purchase order');

        return false;
      }
    } on Exception catch (e) {
      _logger.severe('Error creating purchase order: $e');
      _errorSubject.add('Failed to create purchase order');

      return false;
    } finally {
      _loadingSubject.add(false);
    }
  }

  /// Updates purchase order status.
  Future<bool> updatePurchaseOrderStatus(
    String purchaseOrderId,
    PurchaseOrderStatus newStatus,
  ) async {
    try {
      _loadingSubject.add(true);
      _errorSubject.add('');

      final response = await PurchaseOrderRepository.instance
          .updatePurchaseOrderStatus(
            UpdatePurchaseOrderStatusRequest(
              purchaseOrderId: purchaseOrderId,
              newStatus: newStatus,
              updatedByUserId: userPreferences.user?.refId ?? '',
            ),
          );

      if (response != null) {
        // Refresh the purchase orders list
        await _loadPurchaseOrders();

        return true;
      } else {
        _errorSubject.add('Failed to update purchase order status');

        return false;
      }
    } on Exception catch (e) {
      _logger.severe('Error updating purchase order status: $e');
      _errorSubject.add('Failed to update purchase order status');

      return false;
    } finally {
      _loadingSubject.add(false);
    }
  }

  /// Cancels a purchase order.
  Future<bool> cancelPurchaseOrder(
    String purchaseOrderId,
    String reason,
  ) async {
    try {
      _loadingSubject.add(true);
      _errorSubject.add('');

      final response = await PurchaseOrderRepository.instance
          .cancelPurchaseOrder(
            CancelPurchaseOrderRequest(
              purchaseOrderId: purchaseOrderId,
              reason: reason,
              cancelledByUserId: userPreferences.user?.refId ?? '',
            ),
          );

      if (response != null) {
        // Refresh the purchase orders list
        await _loadPurchaseOrders();

        return true;
      } else {
        _errorSubject.add('Failed to cancel purchase order');

        return false;
      }
    } on Exception catch (e) {
      _logger.severe('Error cancelling purchase order: $e');
      _errorSubject.add('Failed to cancel purchase order');

      return false;
    } finally {
      _loadingSubject.add(false);
    }
  }

  /// Creates a receiving note.
  Future<bool> createReceivingNote(CreateReceivingNoteRequest request) async {
    try {
      _loadingSubject.add(true);
      _errorSubject.add('');

      final response = await PurchaseOrderRepository.instance
          .createReceivingNote(request);

      if (response != null && response.rnId.isNotEmpty) {
        // Refresh the purchase orders list
        await _loadPurchaseOrders();

        return true;
      } else {
        _errorSubject.add('Failed to create receiving note');

        return false;
      }
    } on Exception catch (e) {
      _logger.severe('Error creating receiving note: $e');
      _errorSubject.add('Failed to create receiving note');

      return false;
    } finally {
      _loadingSubject.add(false);
    }
  }

  /// Updates the search query.
  void updateSearchQuery(String query) {
    _searchQuerySubject.add(query);
  }

  /// Updates the selected supplier filter.
  void updateSelectedSupplierFilter(String supplierId) {
    _selectedSupplierFilterSubject.add(supplierId);
  }

  /// Updates the selected status filter.
  void updateSelectedStatusFilter(PurchaseOrderStatus? status) {
    _selectedStatusFilterSubject.add(status);
  }

  /// Refreshes the purchase orders.
  Future<void> refreshPurchaseOrders() async {
    await _loadPurchaseOrders();
  }

  /// Disposes the view model.
  void dispose() {
    _purchaseOrdersSubject.close();
    _suppliersSubject.close();
    _errorSubject.close();
    _loadingSubject.close();
    _searchQuerySubject.close();
    _selectedSupplierFilterSubject.close();
    _selectedStatusFilterSubject.close();
  }
}

/// The purchase orders data model.
class PurchaseOrdersData {
  /// The total orders.
  final int totalOrders;

  /// The pending orders.
  final int pendingOrders;

  /// The total value.
  final double totalValue;

  /// Constructs a new [PurchaseOrdersData].
  PurchaseOrdersData({
    required this.totalOrders,
    required this.pendingOrders,
    required this.totalValue,
  });
}
