import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../repositories/orders_repository.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for inventory screen
class SalesViewModel {
  final LoggerApp _logger = LoggerApp('SalesViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the orders subject.
  final _ordersSubject = BehaviorSubject<UnmodifiableListView<Order>>.seeded(
    UnmodifiableListView([]),
  );

  /// Gets the selected date range subject.
  final _selectedDateRangeSubject = BehaviorSubject<ShadDateTimeRange?>.seeded(
    null,
  );

  /// Gets the search query subject.
  /// User can search orders by order refId, order item name.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected status subject.
  final _selectedStatusSubject = BehaviorSubject<OrderStatus?>.seeded(
    OrderStatus.ORDER_STATUS_COMPLETED,
  );

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected status.
  BehaviorSubject<OrderStatus?> get selectedStatus => _selectedStatusSubject;

  /// Gets the orders stream.
  BehaviorSubject<UnmodifiableListView<Order>> get ordersStream =>
      _ordersSubject;

  /// Gets the selected date range stream.
  BehaviorSubject<ShadDateTimeRange?> get selectedDateRange =>
      _selectedDateRangeSubject;

  /// Gets the filtered orders stream.
  Stream<List<Order>> get filteredOrdersStream => Rx.combineLatest4(
    _ordersSubject.stream,
    _searchQuerySubject.stream,
    _selectedStatusSubject.stream,
    _selectedDateRangeSubject.stream,
    (orders, searchQuery, status, dateRange) {
      var filtered = orders.toList();
      if (searchQuery.isNotEmpty) {
        filtered = filtered
            .where(
              (p) =>
                  p.orderItems.any(
                    (item) => item.itemName.toLowerCase().contains(
                      searchQuery.toLowerCase(),
                    ),
                  ) ||
                  p.refId.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();
      }

      if (status != null) {
        filtered = filtered.where((p) => p.status == status).toList();
      }
      if (dateRange != null) {
        filtered = filtered.where((p) {
          final start = dateRange.start;
          final end = dateRange.end;
          if (start == null && end == null) {
            return true;
          }

          if (start != null && end == null) {
            return p.createdAt.toDateTime().isSameDay(start);
          }

          if (start != null && end != null) {
            return p.createdAt.toDateTime().isAfter(start) &&
                p.createdAt.toDateTime().isBefore(end);
          }

          return false;
        }).toList();
      }

      // sort by date
      filtered..sort(
        (a, b) => b.createdAt.toDateTime().compareTo(a.createdAt.toDateTime()),
      );

      return filtered;
    },
  );

  /// Constructor of [SalesViewModel].
  SalesViewModel() {
    initTheData();
  }

  /// Fetches global products.
  Future<void> initTheData() async {
    try {
      final storeId = userPreferences.store?.refId;
      if (storeId == null) {
        throw Exception('Store not found');
      }

      final orders = await OrdersRepository.instance.getOrdersByQuery(
        FindOrdersRequest(storeId: storeId),
      );
      _ordersSubject.add(UnmodifiableListView(orders));
    } on Exception catch (e) {
      _logger.severe('initTheData failed: $e');
    } finally {
      _logger.info('initTheData is done');
      if (!completer.isCompleted) completer.complete(true);
    }
  }

  /// Refreshes the orders.
  Future<void> refreshOrders() async {
    await initTheData();
  }

  /// Disposes the view model.
  void dispose() {
    _ordersSubject.close();
    _searchQuerySubject.close();
    _selectedStatusSubject.close();
    _selectedDateRangeSubject.close();
  }
}
