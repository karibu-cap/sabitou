import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/audits_repository.dart';
import '../../services/internationalization/internationalization.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// The [AuditsViewModel].
final class AuditsViewModel {
  final LoggerApp _logger = LoggerApp('AuditsViewModel');

  /// Subject for loading state
  final _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  /// Subject for error state
  final _errorSubject = BehaviorSubject<String?>.seeded(null);

  /// Subject for inventory transactions
  final _inventoryTransactionsSubject =
      BehaviorSubject<List<InventoryTransaction>>.seeded([]);

  /// Subject for voucher transactions
  final _voucherTransactionsSubject =
      BehaviorSubject<List<VoucherTransaction>>.seeded([]);

  /// Subject for filtered inventory transactions
  final _filteredInventoryTransactionsSubject =
      BehaviorSubject<List<InventoryTransaction>>.seeded([]);

  /// Subject for filtered voucher transactions
  final _filteredVoucherTransactionsSubject =
      BehaviorSubject<List<VoucherTransaction>>.seeded([]);

  /// Subject for search query
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Subject for active tab (inventory or voucher)
  final _activeTabSubject = BehaviorSubject<TransactionTab>.seeded(
    TransactionTab.inventory,
  );

  /// Subject for date filter
  final _dateFilterSubject = BehaviorSubject<String>.seeded('');

  /// Stream for loading state
  Stream<bool> get isLoadingStream => _isLoadingSubject.stream;

  /// Stream for error state
  Stream<String?> get errorStream => _errorSubject.stream;

  /// Stream for inventory transactions
  Stream<List<InventoryTransaction>> get inventoryTransactionsStream =>
      _inventoryTransactionsSubject.stream;

  /// Stream for voucher transactions
  Stream<List<VoucherTransaction>> get voucherTransactionsStream =>
      _voucherTransactionsSubject.stream;

  /// Stream for filtered inventory transactions
  Stream<List<InventoryTransaction>> get filteredInventoryTransactionsStream =>
      _filteredInventoryTransactionsSubject.stream;

  /// Stream for filtered voucher transactions
  Stream<List<VoucherTransaction>> get filteredVoucherTransactionsStream =>
      _filteredVoucherTransactionsSubject.stream;

  /// Stream for search query
  Stream<String> get searchQueryStream => _searchQuerySubject.stream;

  /// Stream for active tab
  Stream<TransactionTab> get activeTabStream => _activeTabSubject.stream;

  /// Stream for date filter
  Stream<String> get dateFilterStream => _dateFilterSubject.stream;

  /// Current loading state
  bool get isLoading => _isLoadingSubject.value;

  /// Current error state
  String? get error => _errorSubject.value;

  /// Current inventory transactions
  List<InventoryTransaction> get inventoryTransactions =>
      _inventoryTransactionsSubject.value;

  /// Current voucher transactions
  List<VoucherTransaction> get voucherTransactions =>
      _voucherTransactionsSubject.value;

  /// Current filtered inventory transactions
  List<InventoryTransaction> get filteredInventoryTransactions =>
      _filteredInventoryTransactionsSubject.value;

  /// Current filtered voucher transactions
  List<VoucherTransaction> get filteredVoucherTransactions =>
      _filteredVoucherTransactionsSubject.value;

  /// Current search query
  String get searchQuery => _searchQuerySubject.value;

  /// Current active tab
  TransactionTab get activeTab => _activeTabSubject.value;

  /// Constructor for TransactionsViewModel
  AuditsViewModel() {
    _initialize();
  }

  /// Initialize the view model
  Future<void> _initialize() async {
    // Listen to search query and date filter changes to filter transactions
    _searchQuerySubject.stream.listen(_filterTransactions);
    _dateFilterSubject.stream.listen(_filterTransactions);

    // Load initial data
    await loadTransactions();
  }

  /// Load all transactions
  Future<void> loadTransactions() async {
    try {
      _setLoading(true);
      _clearError();

      await Future.wait([
        _loadInventoryTransactions(),
        _loadVoucherTransactions(),
      ]);
    } on Exception catch (e) {
      _logger.severe('Error loading transactions: $e');
      _setError(AppInternationalizationService.to.error);
    } finally {
      _setLoading(false);
    }
  }

  /// Load inventory transactions
  Future<void> _loadInventoryTransactions() async {
    try {
      final store = UserPreferences.instance.store;
      if (store == null) {
        _logger.severe('Store not found');

        return;
      }

      final response = await AuditsRepository.instance
          .getInventoryTransactionAuditLogs(
            GetInventoryTransactionAuditLogsRequest(storeId: store.refId),
          );
      final transactions = response;

      _inventoryTransactionsSubject.add(transactions);
      _filteredInventoryTransactionsSubject.add(transactions);
    } on Exception catch (e) {
      _logger.severe('Error loading inventory transactions: $e');
      _inventoryTransactionsSubject.add([]);
      _filteredInventoryTransactionsSubject.add([]);
    }
  }

  /// Load voucher transactions
  Future<void> _loadVoucherTransactions() async {
    try {
      final store = UserPreferences.instance.store;
      if (store == null) {
        _logger.severe('Store not found');

        return;
      }

      final response = await AuditsRepository.instance.getVoucherTransactions(
        GetVoucherTransactionAuditLogsRequest(storeId: store.refId),
      );

      final transactions = response;

      _voucherTransactionsSubject.add(transactions);
      _filteredVoucherTransactionsSubject.add(transactions);
    } on Exception catch (e) {
      _logger.severe('Error loading voucher transactions: $e');
      _voucherTransactionsSubject.add([]);
      _filteredVoucherTransactionsSubject.add([]);
    }
  }

  /// Refresh all transactions
  Future<void> refreshTransactions() async {
    await loadTransactions();
  }

  /// Update search query
  void updateSearchQuery(String query) {
    _searchQuerySubject.add(query);
  }

  /// Filter transactions based on search query, date filter and active tab
  void _filterTransactions(String change) {
    final query = _searchQuerySubject.value;
    final dateFilter = _dateFilterSubject.value;

    if (activeTab == TransactionTab.inventory) {
      _filterInventoryTransactions(query, dateFilter);
    } else {
      _filterVoucherTransactions(query, dateFilter);
    }
  }

  /// Filter inventory transactions
  void _filterInventoryTransactions(String query, String dateFilter) {
    final allTransactions = _inventoryTransactionsSubject.value;

    var filtered = allTransactions;

    // Apply search query filter
    if (query.isNotEmpty) {
      filtered = filtered.where((transaction) {
        final searchQuery = query.toLowerCase();

        // Search through document_id
        if (transaction.documentId.toLowerCase().contains(searchQuery) ==
            true) {
          return true;
        }

        // Search through product_id
        if (transaction.productId.toLowerCase().contains(searchQuery)) {
          return true;
        }

        // Search through related_document_id
        if (transaction.relatedDocumentId.toLowerCase().contains(searchQuery) ==
            true) {
          return true;
        }

        // Search through performed_by_user_id
        if (transaction.performedByUserId.toLowerCase().contains(searchQuery)) {
          return true;
        }

        // Search through notes
        if (transaction.notes.toLowerCase().contains(searchQuery) == true) {
          return true;
        }

        // Search through batch_id
        if (transaction.batchId.toLowerCase().contains(searchQuery) == true) {
          return true;
        }

        // Search through related_document_type
        if (transaction.relatedDocumentType.toLowerCase().contains(
              searchQuery,
            ) ==
            true) {
          return true;
        }

        // Search through transaction_type (convert enum to string)
        final transactionTypeString = _getTransactionTypeString(
          transaction.transactionType,
        );
        if (transactionTypeString.toLowerCase().contains(searchQuery)) {
          return true;
        }

        return false;
      }).toList();
    }

    // Apply date filter
    if (dateFilter.isNotEmpty) {
      filtered = _applyInventoryDateFilter(filtered, dateFilter);
    }

    _filteredInventoryTransactionsSubject.add(filtered);
  }

  /// Filter voucher transactions
  void _filterVoucherTransactions(String query, String dateFilter) {
    final allTransactions = _voucherTransactionsSubject.value;

    var filtered = allTransactions;

    // Apply search query filter
    if (query.isNotEmpty) {
      filtered = filtered.where((transaction) {
        final searchQuery = query.toLowerCase();

        // Search through document_id
        if (transaction.documentId.toLowerCase().contains(searchQuery) ==
            true) {
          return true;
        }

        // Search through voucher_id
        if (transaction.voucherId.toLowerCase().contains(searchQuery)) {
          return true;
        }

        // Search through related_invoice_id
        if (transaction.relatedInvoiceId.toLowerCase().contains(searchQuery) ==
            true) {
          return true;
        }

        // Search through related_receipt_id
        if (transaction.relatedReceiptId.toLowerCase().contains(searchQuery) ==
            true) {
          return true;
        }

        // Search through used_by_user_id
        if (transaction.usedByUserId.toLowerCase().contains(searchQuery)) {
          return true;
        }

        return false;
      }).toList();
    }

    // Apply date filter
    if (dateFilter.isNotEmpty) {
      filtered = _applyVoucherDateFilter(filtered, dateFilter);
    }

    _filteredVoucherTransactionsSubject.add(filtered);
  }

  /// Helper method to convert TransactionType enum to readable string
  String _getTransactionTypeString(TransactionType type) {
    switch (type) {
      case TransactionType.TXN_TYPE_PURCHASE:
        return 'Purchase';
      case TransactionType.TXN_TYPE_SALE:
        return 'Sale';
      case TransactionType.TXN_TYPE_RETURN_IN:
        return 'Return In';
      case TransactionType.TXN_TYPE_RETURN_OUT:
        return 'Return Out';
      case TransactionType.TXN_TYPE_TRANSFER_OUT:
        return 'Transfer Out';
      case TransactionType.TXN_TYPE_TRANSFER_IN:
        return 'Transfer In';
      case TransactionType.TXN_TYPE_ADJUSTMENT:
        return 'Adjustment';
      case TransactionType.TXN_TYPE_DAMAGE:
        return 'Damage';
      case TransactionType.TXN_TYPE_THEFT:
        return 'Theft';
      case TransactionType.TXN_TYPE_INITIAL:
        return 'Initial';
      case TransactionType.TXN_TYPE_EXPIRATION:
        return 'Expiration';
      case TransactionType.TXN_TYPE_UNSPECIFIED:
      default:
        return 'Unspecified';
    }
  }

  /// Switch to inventory tab
  void switchToInventoryTab() {
    _activeTabSubject.add(TransactionTab.inventory);
  }

  /// Switch to voucher tab
  void switchToVoucherTab() {
    _activeTabSubject.add(TransactionTab.voucher);
  }

  /// Clear search
  void clearSearch() {
    _searchQuerySubject.add('');
  }

  /// Update date filter
  void updateDateFilter(String dateFilter) {
    _dateFilterSubject.add(dateFilter);
  }

  /// Current date filter
  String get dateFilter => _dateFilterSubject.value;

  /// Apply date filter to inventory transactions
  List<InventoryTransaction> _applyInventoryDateFilter(
    List<InventoryTransaction> transactions,
    String dateFilter,
  ) {
    final now = DateTime.now();

    switch (dateFilter) {
      case 'today':
        return transactions.where((transaction) {
          final transactionDate = DateTime.parse(
            transaction.transactionTime.toString().split(' ')[0],
          );

          return transactionDate.year == now.year &&
              transactionDate.month == now.month &&
              transactionDate.day == now.day;
        }).toList();

      case 'week':
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        return transactions.where((transaction) {
          final transactionDate = DateTime.parse(
            transaction.transactionTime.toString().split(' ')[0],
          );

          return transactionDate.isAfter(
                weekStart.subtract(const Duration(days: 1)),
              ) &&
              transactionDate.isBefore(now.add(const Duration(days: 1)));
        }).toList();

      case 'month':
        return transactions.where((transaction) {
          final transactionDate = DateTime.parse(
            transaction.transactionTime.toString().split(' ')[0],
          );

          return transactionDate.year == now.year &&
              transactionDate.month == now.month;
        }).toList();

      default:
        return transactions;
    }
  }

  /// Apply date filter to voucher transactions
  List<VoucherTransaction> _applyVoucherDateFilter(
    List<VoucherTransaction> transactions,
    String dateFilter,
  ) {
    final now = DateTime.now();

    switch (dateFilter) {
      case 'today':
        return transactions.where((transaction) {
          final transactionDate = DateTime.parse(
            transaction.usedAt.toString().split(' ')[0],
          );

          return transactionDate.year == now.year &&
              transactionDate.month == now.month &&
              transactionDate.day == now.day;
        }).toList();

      case 'week':
        final weekStart = now.subtract(Duration(days: now.weekday - 1));
        return transactions.where((transaction) {
          final transactionDate = DateTime.parse(
            transaction.usedAt.toString().split(' ')[0],
          );

          return transactionDate.isAfter(
                weekStart.subtract(const Duration(days: 1)),
              ) &&
              transactionDate.isBefore(now.add(const Duration(days: 1)));
        }).toList();

      case 'month':
        return transactions.where((transaction) {
          final transactionDate = DateTime.parse(
            transaction.usedAt.toString().split(' ')[0],
          );

          return transactionDate.year == now.year &&
              transactionDate.month == now.month;
        }).toList();

      default:
        return transactions;
    }
  }

  /// Set loading state
  void _setLoading(bool loading) {
    _isLoadingSubject.add(loading);
  }

  /// Set error state
  void _setError(String error) {
    _errorSubject.add(error);
  }

  /// Clear error state
  void _clearError() {
    _errorSubject.add(null);
  }

  /// Dispose of the view model
  void dispose() {
    _isLoadingSubject.close();
    _errorSubject.close();
    _inventoryTransactionsSubject.close();
    _voucherTransactionsSubject.close();
    _filteredInventoryTransactionsSubject.close();
    _filteredVoucherTransactionsSubject.close();
    _searchQuerySubject.close();
    _activeTabSubject.close();
    _dateFilterSubject.close();
  }
}

/// Transaction tab enum
enum TransactionTab {
  /// Inventory transactions tab
  inventory,

  /// Voucher transactions tab
  voucher,
}
