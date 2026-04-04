// import 'package:flutter/material.dart';
// import 'package:sabitou_rpc/sabitou_rpc.dart';

// import '../../../../../repositories/categories_repository.dart';
// import '../../../../../utils/extensions/category_extension.dart';
// import '../../../../../utils/utils.dart';
// import '../../add_global_product_controller.dart';

// /// Controller dedicated to the category selection sheet.
// class SelectCategoriesController extends ChangeNotifier {
//   /// Constructs a new SelectCategoriesController.
//   SelectCategoriesController({required this.addGlobalProductController}) {
//     _initialize();
//   }

//   /// The controller used by the global product form.
//   final AddGlobalProductController addGlobalProductController;

//   /// The categories repository.
//   final CategoriesRepository _categoriesRepository =
//       CategoriesRepository.instance;

//   /// Search controller for the text field.
//   final TextEditingController searchController = TextEditingController();

//   /// Quick add English name controller.
//   final TextEditingController quickAddEnController = TextEditingController();

//   /// Quick add French name controller.
//   final TextEditingController quickAddFrController = TextEditingController();

//   String _searchQuery = '';
//   bool _isLoading = false;
//   bool _isQuickAddExpanded = false;
//   bool _isQuickAddLoading = false;

//   /// Current search query entered by the user.
//   String get searchQuery => _searchQuery;

//   /// Whether categories are loading.
//   bool get isLoading => _isLoading;

//   /// Whether quick add section is expanded.
//   bool get isQuickAddExpanded => _isQuickAddExpanded;

//   /// Whether quick add is in progress.
//   bool get isQuickAddLoading => _isQuickAddLoading;

//   /// Number of currently selected categories.
//   int get selectedCount => addGlobalProductController.selectedCategories.length;

//   /// Whether quick add form can be submitted.
//   bool get canQuickAdd =>
//       quickAddEnController.text.trim().isNotEmpty &&
//       quickAddFrController.text.trim().isNotEmpty;

//   /// List of categories filtered by the current search query.
//   List<Category> get filteredCategories {
//     final query = _searchQuery.trim().toLowerCase();
//     final categories = addGlobalProductController.availableCategories;

//     if (query.isEmpty) {
//       return categories;
//     }

//     return categories
//         .where(
//           (category) =>
//               category.label.toLowerCase().contains(query) &&
//               category.type == CategoryType.CATEGORY_TYPE_PRODUCT,
//         )
//         .toList();
//   }

//   /// Whether the provided category is currently selected.
//   bool isCategorySelected(Category category) {
//     return addGlobalProductController.isCategorySelected(category);
//   }

//   /// Toggles the selection of the provided category.
//   void toggleCategory(Category category) {
//     addGlobalProductController.toggleCategory(category);
//     notifyListeners();
//   }

//   /// Toggles the quick add section.
//   void toggleQuickAdd() {
//     _isQuickAddExpanded = !_isQuickAddExpanded;
//     notifyListeners();
//   }

//   /// Creates a new category from the quick add form and auto-selects it.
//   Future<void> quickAddCategory(BuildContext context) async {
//     if (!canQuickAdd) return;

//     _isQuickAddLoading = true;
//     notifyListeners();

//     final name = Internationalized(
//       en: quickAddEnController.text.trim(),
//       fr: quickAddFrController.text.trim(),
//     );

//     final category = Category(
//       refId: AppUtils.generateSmartDatabaseId('CTG'),
//       name: name,
//       status: CategoryStatus.CATEGORY_STATUS_ACTIVE,
//       type: CategoryType.CATEGORY_TYPE_PRODUCT,
//       createdAt: Timestamp.fromDateTime(DateTime.now()),
//     );

//     try {
//       final success = await _categoriesRepository.createCategory(category);

//       if (success) {
//         // Refresh categories from parent controller
//         await addGlobalProductController.refreshCategories();

//         // Auto-select the newly created category
//         addGlobalProductController.toggleCategory(category);

//         // Clear quick add form
//         quickAddEnController.clear();
//         quickAddFrController.clear();
//         _isQuickAddExpanded = false;

//         notifyListeners();
//       }
//     } finally {
//       _isQuickAddLoading = false;
//       notifyListeners();
//     }
//   }

//   /// Initialize the controller by loading categories.
//   Future<void> _initialize() async {
//     _isLoading = true;
//     notifyListeners();

//     await addGlobalProductController.refreshCategories();

//     _isLoading = false;
//     notifyListeners();
//   }

//   @override
//   void dispose() {
//     searchController.dispose();
//     quickAddEnController.dispose();
//     quickAddFrController.dispose();
//     super.dispose();
//   }
// }
