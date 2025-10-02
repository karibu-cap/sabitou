import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/store_products_repository.dart';
import '../../services/rpc/fake_transport/global_product.dart';
import '../../utils/extensions/global_product_extension.dart';

/// ViewModel for global products management.
class GlobalProductsViewModel {
  /// The products repository instance.
  final StoreProductsRepository _productsRepository = StoreProductsRepository(
    transport: globalProductFakeTransport,
  );

  /// The categories set.
  final Set<Category?> _categories = <Category?>{};

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

  /// Gets the categories.
  Set<Category?> get categories => _categories;

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
        (categories, searchQuery, category, status) {
          var filtered = categories.toList();
          if (searchQuery.isNotEmpty) {
            isFiltered = true;
            filtered = filtered
                .where(
                  (c) =>
                      c.label.toLowerCase().contains(searchQuery.toLowerCase()),
                )
                .toList();
          }

          if (category != null) {
            isFiltered = true;
            filtered = filtered
                .where(
                  (c) => c.categories.any((cat) => cat.refId == category.refId),
                )
                .toList();
          }
          if (status != null) {
            isFiltered = true;
            filtered = filtered.where((c) => c.status == status).toList();
          }
          if (searchQuery.isEmpty && category == null && status == null) {
            isFiltered = false;
          }

          return filtered;
        },
      );

  /// Constructor.
  GlobalProductsViewModel() {
    _loadGlobalProducts();
  }

  /// Loads global products from repository.
  Future<void> _loadGlobalProducts() async {
    final globalProducts = await _productsRepository.findGlobalProducts(
      FindGlobalProductsRequest(),
    );
    for (var gp in globalProducts) {
      _categories.addAll(gp.categories);
    }
    _globalProductsSubject.add(globalProducts);
  }

  /// Creates a new global product.
  Future<bool> createGlobalProduct(CreateGlobalProductRequest request) async {
    final success = await _productsRepository.createGlobalProduct(request);
    if (success) {
      await _loadGlobalProducts();
    }

    return success;
  }

  /// Updates an existing global product.
  Future<bool> updateGlobalProduct(UpdateGlobalProductRequest request) async {
    final success = await _productsRepository.updateGlobalProduct(request);
    if (success) {
      await _loadGlobalProducts();
    }

    return success;
  }

  /// Deletes a global product by ID.
  Future<bool> deleteGlobalProduct(DeleteGlobalProductRequest request) async {
    final success = await _productsRepository.deleteGlobalProduct(request);
    if (success) {
      await _loadGlobalProducts();
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
