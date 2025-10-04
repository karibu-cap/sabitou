import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/pos_repository.dart';
import '../../services/internationalization/internationalization.dart';
import '../../utils/extensions/global_product_extension.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';

/// View model for cash recipe screen
final class CashRecipeViewModel {
  final LoggerApp _logger = LoggerApp('CashRecipeViewModel');

  /// Subject for loading state
  final _isLoadingSubject = BehaviorSubject<bool>.seeded(false);

  /// Subject for error state
  final _errorSubject = BehaviorSubject<String?>.seeded(null);

  /// Subject for cash receipts list
  final _cashReceiptsSubject = BehaviorSubject<List<CashReceipt>>.seeded([]);

  /// Subject for filtered cash receipts
  final _filteredCashReceiptsSubject =
      BehaviorSubject<List<CashReceipt>>.seeded([]);

  /// Subject for search query
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Stream for loading state
  Stream<bool> get isLoadingStream => _isLoadingSubject.stream;

  /// Stream for error state
  Stream<String?> get errorStream => _errorSubject.stream;

  /// Stream for cash receipts list
  Stream<List<CashReceipt>> get cashReceiptsStream =>
      _cashReceiptsSubject.stream;

  /// Stream for filtered cash receipts
  Stream<List<CashReceipt>> get filteredCashReceiptsStream =>
      _filteredCashReceiptsSubject.stream;

  /// Stream for search query
  Stream<String> get searchQueryStream => _searchQuerySubject.stream;

  /// Current loading state
  bool get isLoading => _isLoadingSubject.value;

  /// Current error state
  String? get error => _errorSubject.value;

  /// Current cash receipts list
  List<CashReceipt> get cashReceipts => _cashReceiptsSubject.value;

  /// Current filtered cash receipts list
  List<CashReceipt> get filteredCashReceipts =>
      _filteredCashReceiptsSubject.value;

  /// Current search query
  String get searchQuery => _searchQuerySubject.value;

  /// Constructor for CashRecipeViewModel
  CashRecipeViewModel() {
    _initialize();
  }

  /// Initialize the view model
  Future<void> _initialize() async {
    // Listen to search query changes to filter receipts
    _searchQuerySubject.stream.listen(_filterCashReceipts);

    // Load initial data
    await loadCashReceipts();
  }

  /// Load cash receipts from repository
  Future<void> loadCashReceipts() async {
    try {
      _setLoading(true);
      _clearError();

      final store = UserPreferences.instance.store;
      if (store == null) {
        _logger.severe('Store not found');

        return;
      }

      final response = await PosRepository.instance.findCashReceipt(
        FindCashReceiptRequest(storeId: store.refId),
      );
      _logger.info('Cash receipts response: $response');

      if (response != null && response.isNotEmpty) {
        final receipts = response;

        // Sort receipts by date (most recent first)
        receipts.sort((a, b) {
          if (a.hasTransactionTime() && b.hasTransactionTime()) {
            return b.transactionTime.toDateTime().compareTo(
              a.transactionTime.toDateTime(),
            );
          }

          return 0;
        });

        _cashReceiptsSubject.add(receipts);
        _filteredCashReceiptsSubject.add(receipts);
      } else {
        _cashReceiptsSubject.add([]);
        _filteredCashReceiptsSubject.add([]);
      }
    } on Exception catch (e) {
      _logger.severe('Error loading cash receipts: $e');
      _setError(AppInternationalizationService.to.error);
    } finally {
      _setLoading(false);
    }
  }

  /// Refresh cash receipts
  Future<void> refreshCashReceipts() async {
    await loadCashReceipts();
  }

  /// Update search query
  void updateSearchQuery(String query) {
    _searchQuerySubject.add(query);
  }

  /// Filter cash receipts based on search query
  void _filterCashReceipts(String query) {
    final allReceipts = _cashReceiptsSubject.value;

    if (query.isEmpty) {
      _filteredCashReceiptsSubject.add(allReceipts);

      return;
    }

    final filtered = allReceipts.where((receipt) {
      // Search in document ID
      if (receipt.hasDocumentId() &&
          receipt.documentId.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }

      // Search in cashier user ID
      if (receipt.hasCashierUserId() &&
          receipt.cashierUserId.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }

      // Search in customer ID
      if (receipt.hasCustomerId() &&
          receipt.customerId.toLowerCase().contains(query.toLowerCase())) {
        return true;
      }

      // Search in items
      for (final item in receipt.items) {
        if (item.label.toLowerCase().contains(query.toLowerCase())) {
          return true;
        }
      }

      return false;
    }).toList();

    _filteredCashReceiptsSubject.add(filtered);
  }

  /// Clear search and show all receipts
  void clearSearch() {
    _searchQuerySubject.add('');
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
    _cashReceiptsSubject.close();
    _filteredCashReceiptsSubject.close();
    _searchQuerySubject.close();
  }
}
