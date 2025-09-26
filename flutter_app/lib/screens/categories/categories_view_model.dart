import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/categories_repository.dart';
import '../../services/rpc/fake_transport/category.dart';
import '../../utils/extensions/category_extension.dart';

/// ViewModel for categories management.
class CategoriesViewModel {
  /// The   categories repository instance.
  final CategoriesRepository _categoriesRepository = CategoriesRepository(
    transport: categoryFakeTransport,
  );

  /// Subject for categories stream.
  final _categoriesSubject = BehaviorSubject<List<Category>>.seeded([]);

  /// Gets the search query subject.
  final _searchQuerySubject = BehaviorSubject<String>.seeded('');

  /// Gets the selected status subject.
  final _selectedStatusSubject = BehaviorSubject<CategoryStatus?>.seeded(null);

  /// Gets the selected type subject.
  final _selectedTypeSubject = BehaviorSubject<CategoryType?>.seeded(null);

  /// Gets the filtered status.
  bool isFiltered = false;

  /// Stream of categories for reactive UI updates.
  Stream<List<Category>> get categoriesStream => _categoriesSubject.stream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _searchQuerySubject;

  /// Gets the selected status.
  BehaviorSubject<CategoryStatus?> get selectedStatus => _selectedStatusSubject;

  /// Gets the selected type.
  BehaviorSubject<CategoryType?> get selectedType => _selectedTypeSubject;

  /// Gets the filtered categories stream.
  Stream<List<Category>> get filteredCategoriesStream => Rx.combineLatest4(
    _categoriesSubject.stream,
    _searchQuerySubject.stream,
    _selectedStatusSubject.stream,
    _selectedTypeSubject.stream,
    (categories, searchQuery, status, type) {
      var filtered = categories.toList();
      if (searchQuery.isNotEmpty) {
        isFiltered = true;
        filtered = filtered
            .where(
              (c) => c.label.toLowerCase().contains(searchQuery.toLowerCase()),
            )
            .toList();
      }
      if (status != null) {
        isFiltered = true;
        filtered = filtered.where((c) => c.status == status).toList();
      }
      if (type != null) {
        isFiltered = true;
        filtered = filtered.where((c) => c.type == type).toList();
      }
      if (status == null && type == null && searchQuery.isEmpty) {
        isFiltered = false;
      }

      return filtered;
    },
  );

  /// Constructor.
  CategoriesViewModel() {
    _loadCategories();
  }

  /// Loads categories from repository.
  Future<void> _loadCategories() async {
    final categories = await _categoriesRepository.getCategories();
    _categoriesSubject.add(categories);
  }

  /// Creates a new category.
  Future<bool> createCategory(CreateCategoryRequest request) async {
    final success = await _categoriesRepository.createCategory(request);
    if (success) {
      await _loadCategories();
    }

    return success;
  }

  /// Updates an existing category.
  Future<bool> updateCategory(UpdateCategoryRequest request) async {
    final success = await _categoriesRepository.updateCategory(request);
    if (success) {
      await _loadCategories();
    }

    return success;
  }

  /// Deletes a category by ID.
  Future<bool> deleteCategory(DeleteCategoryRequest request) async {
    final success = await _categoriesRepository.deleteProductCategory(request);
    if (success) {
      await _loadCategories();
    }

    return success;
  }

  /// Disposes the view model.
  void dispose() {
    _categoriesSubject.close();
    _searchQuerySubject.close();
    _selectedStatusSubject.close();
    _selectedTypeSubject.close();
  }
}
