import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../utils/extensions/category_extension.dart';
import '../../add_global_product_controller.dart';

/// Controller dedicated to the category selection sheet.
class SelectCategoriesController extends ChangeNotifier {
  /// Constructs a new SelectCategoriesController.
  SelectCategoriesController({required this.addGlobalProductController});

  /// The controller used by the global product form.
  final AddGlobalProductController addGlobalProductController;

  String _searchQuery = '';

  /// Current search query entered by the user.
  String get searchQuery => _searchQuery;

  /// List of categories filtered by the current search query.
  List<Category> get filteredCategories {
    final query = _searchQuery.trim().toLowerCase();
    final categories = addGlobalProductController.availableCategories;

    if (query.isEmpty) {
      return categories;
    }

    return categories
        .where(
          (category) =>
              category.label.toLowerCase().contains(query) &&
              category.type == CategoryType.CATEGORY_TYPE_PRODUCT,
        )
        .toList();
  }

  /// Whether the provided category is currently selected.
  bool isCategorySelected(Category category) {
    return addGlobalProductController.isCategorySelected(category);
  }

  /// Toggles the selection of the provided category.
  void toggleCategory(Category category) {
    addGlobalProductController.toggleCategory(category);
    notifyListeners();
  }

  /// Updates the current search query.
  void updateSearchQuery(String value) {
    if (_searchQuery == value) {
      return;
    }
    _searchQuery = value;
    notifyListeners();
  }
}
