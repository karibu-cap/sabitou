import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'categories_view_model.dart';

/// The categories controller.
///
/// Manages the state and business logic for the categories module.
/// Uses ChangeNotifier for state management with Provider pattern.
class CategoriesController extends ChangeNotifier {
  /// The view model that handles data operations for categories
  final CategoriesViewModel _viewModel;

  /// Constructs a new CategoriesController.
  CategoriesController(CategoriesViewModel viewModel) : _viewModel = viewModel;

  /// Text controller for search input field.
  final TextEditingController searchController = TextEditingController();

  /// Text controller for status filter input field.
  final ShadSelectController<CategoryStatus>? statusFilterController =
      ShadSelectController<CategoryStatus>();

  /// Text controller for type filter input field.
  final ShadSelectController<CategoryType>? typeFilterController =
      ShadSelectController<CategoryType>();

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets the selected category status.
  BehaviorSubject<CategoryStatus?> get selectedStatus =>
      _viewModel.selectedStatus;

  /// Gets the selected category type.
  BehaviorSubject<CategoryType?> get selectedType => _viewModel.selectedType;

  /// Wether if list is filtered.
  bool get isFiltered => _viewModel.isFiltered;

  /// Gets categories stream for reactive UI updates
  Stream<List<Category>> get categoriesStream => _viewModel.categoriesStream;

  /// Gets filtered categories stream for reactive UI updates
  Stream<List<Category>> get filteredCategoriesStream =>
      _viewModel.filteredCategoriesStream;

  /// Deletes a category from the system.
  Future<bool> deleteCategory(String categoryId) async {
    final request = DeleteCategoryRequest(categoryId: categoryId);

    return await _viewModel.deleteCategory(request);
  }

  /// Creates a category in the system.
  Future<bool> createCategory(CreateCategoryRequest request) async {
    return await _viewModel.createCategory(request);
  }

  /// Updates a category in the system.
  Future<bool> updateCategory(UpdateCategoryRequest request) async {
    return await _viewModel.updateCategory(request);
  }

  /// Calculates total categories count
  int calculateTotalCategories(List<Category> categories) {
    return categories.length;
  }

  /// Calculates active categories count
  int calculateActiveCategories(List<Category> categories) {
    return categories
        .where((c) => c.status == CategoryStatus.CATEGORY_STATUS_ACTIVE)
        .length;
  }

  /// Calculates inactive categories count
  int calculateInactiveCategories(List<Category> categories) {
    return categories
        .where((c) => c.status == CategoryStatus.CATEGORY_STATUS_INACTIVE)
        .length;
  }

  /// Clears filters.
  void clearFilters() {
    searchQuery.add('');
    selectedStatus.add(null);
    selectedType.add(null);
    searchController.clear();
  }

  /// Calculates category statistics.
  CategoriesStatsData calculateCategoryStats(List<Category> categories) {
    return (
      total: calculateTotalCategories(categories),
      active: calculateActiveCategories(categories),
      inactive: calculateInactiveCategories(categories),
    );
  }
}

/// The categories stats data.
typedef CategoriesStatsData = ({int total, int active, int inactive});
