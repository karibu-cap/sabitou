import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/store_products_repository.dart';
import '../../utils/extensions/global_product_extension.dart';

/// ViewModel for global products management.
class GlobalProductsViewModel {
  /// Private constructor for singleton pattern.
  GlobalProductsViewModel._internal() {
    loadGlobalProducts();
  }

  /// Singleton instance.
  static final GlobalProductsViewModel _instance =
      GlobalProductsViewModel._internal();

  /// Factory constructor that returns the singleton instance.
  factory GlobalProductsViewModel() => _instance;

  /// The products repository instance.
  final StoreProductsRepository _productsRepository =
      StoreProductsRepository.instance;

  /// Subject for products stream.
  final _globalProductsSubject = BehaviorSubject<List<GlobalProduct>>.seeded(
    [],
  );

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected category subject.
  final _selectedCategorySubject = BehaviorSubject<Category?>.seeded(null);

  /// Gets the selected status subject.
  final _selectedStatusSubject = BehaviorSubject<GlobalProductStatus?>.seeded(
    null,
  );

  /// Gets the filtered status.
  bool isFiltered = false;

  /// Stream of global products for reactive UI updates.
  Stream<List<GlobalProduct>> get globalProductsStream =>
      _globalProductsSubject.stream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected category.
  BehaviorSubject<Category?> get selectedCategory => _selectedCategorySubject;

  /// Gets the selected status.
  BehaviorSubject<GlobalProductStatus?> get selectedStatus =>
      _selectedStatusSubject;

  /// Gets the filtered categories stream.
  Stream<List<GlobalProduct>> get filteredGlobalProductsStream =>
      Rx.combineLatest4(
        _globalProductsSubject.stream,
        _searchQuerySubject.stream,
        _selectedCategorySubject.stream,
        _selectedStatusSubject.stream,
        (products, searchQuery, category, status) {
          var filtered = products.toList();
          if (searchQuery.isNotEmpty) {
            isFiltered = true;
            filtered = filtered
                .where(
                  (p) =>
                      p.label.toLowerCase().contains(searchQuery.toLowerCase()),
                )
                .toList();
          }

          if (category != null) {
            isFiltered = true;
            filtered = filtered
                .where(
                  (p) => p.categories.any((cat) => cat.refId == category.refId),
                )
                .toList();
          }
          if (status != null) {
            isFiltered = true;
            filtered = filtered.where((p) => p.status == status).toList();
          }
          if (searchQuery.isEmpty && category == null && status == null) {
            isFiltered = false;
          }

          return filtered;
        },
      );

  /// Loads global products from repository.
  Future<void> loadGlobalProducts() async {
    final globalProducts = await _productsRepository.findGlobalProducts();
    _globalProductsSubject.add(globalProducts);
  }

  /// Deletes a global product by ID.
  Future<bool> deleteGlobalProduct(String globalProductId) async {
    final success = await _productsRepository.deleteGlobalProduct(
      globalProductId,
    );
    if (success) {
      await loadGlobalProducts();
    }

    return success;
  }

  /// Disposes the view model.
  void dispose() {
    _globalProductsSubject.close();
    _searchQuerySubject.close();
    _selectedCategorySubject.close();
    _selectedStatusSubject.close();
  }
}
