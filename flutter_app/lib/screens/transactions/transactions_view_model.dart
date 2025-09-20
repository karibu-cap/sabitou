import 'dart:async';
import 'dart:collection';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../repositories/transactions_repository.dart';
import '../../repositories/users_repository.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// The [TransactionsViewModel].
class TransactionsViewModel {
  final LoggerApp _logger = LoggerApp('TransactionsViewModel');

  /// Gets the user preferences.
  final UserPreferences userPreferences = UserPreferences.instance;

  /// Gets the transaction subject.
  final _transactionSubject =
      BehaviorSubject<UnmodifiableListView<Transaction>>.seeded(
        UnmodifiableListView([]),
      );

  /// Gets the selected date range subject.
  final _selectedDateRangeSubject = BehaviorSubject<ShadDateTimeRange?>.seeded(
    null,
  );

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected type subject.
  final _selectedTypeSubject = BehaviorSubject<TransactionType?>.seeded(null);

  /// Gets the selected status subject.
  final _selectedStatusSubject = BehaviorSubject<TransactionStatus?>.seeded(
    null,
  );

  /// Gets the completer.
  final Completer<bool> completer = Completer<bool>();

  /// Gets the transactions stream.
  BehaviorSubject<UnmodifiableListView<Transaction>> get transactionStream =>
      _transactionSubject;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected type.
  BehaviorSubject<TransactionType?> get selectedType => _selectedTypeSubject;

  /// Gets the selected status.
  BehaviorSubject<TransactionStatus?> get selectedStatus =>
      _selectedStatusSubject;

  /// Gets the selected date range stream.
  BehaviorSubject<ShadDateTimeRange?> get selectedDateRange =>
      _selectedDateRangeSubject;

  /// Gets the filtered transactions stream.
  Stream<List<Transaction>> get filteredTransactionsStream => Rx.combineLatest5(
    _transactionSubject.stream,
    _searchQuerySubject.stream,
    _selectedTypeSubject.stream,
    _selectedStatusSubject.stream,
    _selectedDateRangeSubject.stream,
    (products, searchQuery, type, status, dateRange) {
      var filtered = products.toList();
      if (searchQuery.isNotEmpty) {
        filtered = filtered
            .where(
              (p) =>
                  p.refId.toLowerCase().contains(searchQuery.toLowerCase()) ||
                  p.orderId.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();
      }
      if (type != null) {
        filtered = filtered.where((p) => p.type == type).toList();
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

      filtered.sort(
        (a, b) => b.createdAt.toDateTime().compareTo(a.createdAt.toDateTime()),
      );

      return filtered;
    },
  );

  /// Constructor of [TransactionsViewModel].
  TransactionsViewModel() {
    initTheData();
  }

  /// Fetches global products.
  Future<void> initTheData() async {
    try {
      final store = userPreferences.store;
      if (store == null) {
        throw Exception('Store not found');
      }

      final storeProducts = await TransactionsRepository.instance
          .getCompleteTransactionsByStoreId(storeId: store.refId);
      _transactionSubject.add(UnmodifiableListView(storeProducts));
    } on Exception catch (e) {
      _logger.severe('initTheData failed: $e');
    } finally {
      _logger.info('initTheData is done');
      if (!completer.isCompleted) completer.complete(true);
    }
  }

  /// Refreshes the transactions.
  Future<void> refreshTransactions() async {
    await initTheData();
  }

  /// Gets the current user.
  Future<User?> getCurrentUser(String userId) {
    return UserRepository.instance.getUser(GetUserRequest(userId: userId));
  }

  /// Disposes the view model.
  void dispose() {
    _searchQuerySubject.close();
    _selectedTypeSubject.close();
    _selectedStatusSubject.close();
    _selectedDateRangeSubject.close();
  }
}
