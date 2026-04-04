import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extensions/category_extension.dart';
import 'add_global_product_view_model.dart';

/// Controller for global product add/edit dialog.
class AddGlobalProductController extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';
  final AddGlobalProductViewModel _viewModel;

  /// The original product for comparison during updates.
  GlobalProduct? _originalProduct;

  /// The current/updating product state (notified on changes).
  final ValueNotifier<GlobalProduct> updatingProduct;

  /// Gets the original product being edited (null for creation).
  GlobalProduct? get globalProduct => _originalProduct;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The internationalization.
  final Intls intl;

  /// The selected categories for the product.
  final List<Category> _selectedCategories = [];

  /// The status.
  GlobalProductStatus? get status => updatingProduct.value.status;

  /// The type.
  bool get isActive =>
      updatingProduct.value.status ==
      GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE;

  /// Currently selected categories (immutable view).
  List<Category> get selectedCategories =>
      List.unmodifiable(_selectedCategories);

  /// Whether the modal is currently loading
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String get errorMessage => _errorMessage;

  /// Whether the form can be submitted
  /// For updates: any change from original enables button
  /// For creation: requires name and at least one category
  bool get canSubmit {
    if (_isLoading) return false;

    final product = updatingProduct.value;

    // For creation: minimal fields required
    if (_originalProduct == null) {
      return product.name.en.trim().isNotEmpty && product.categories.isNotEmpty;
    }

    // For updates: any change enables button
    return _hasChanges;
  }

  /// Checks if current state differs from original product.
  bool get _hasChanges {
    if (_originalProduct == null) {
      return false;
    }

    final current = updatingProduct.value;

    return _originalProduct.toString() != current.toString();
  }

  /// Constructs a new
  AddGlobalProductController({
    required this.intl,
    required AddGlobalProductViewModel viewModel,
    GlobalProduct? product,
  }) : _viewModel = viewModel,
       updatingProduct = ValueNotifier(
         product == null
               ? GlobalProduct(
                   status: GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
                 )
               : GlobalProduct()
           ..mergeFromMessage(product ?? GlobalProduct()),
       ) {
    if (product != null) {
      _originalProduct = GlobalProduct()..mergeFromMessage(product);
      _selectedCategories
        ..clear()
        ..addAll(product.categories);
    } else {
      _clearForm();
    }
    // Listen to updatingProduct and notify listeners
    updatingProduct.addListener(notifyListeners);
  }

  /// Whether a category is already selected.
  bool isCategorySelected(Category category) {
    return _selectedCategories.any((c) => c.refId == category.refId);
  }

  /// Toggles a category selection.
  void toggleCategory(Category category) {
    if (isCategorySelected(category)) {
      _selectedCategories.removeWhere((c) => c.refId == category.refId);
    } else {
      _selectedCategories.add(category);
    }

    _selectedCategories.sort(
      (a, b) => a.label.toLowerCase().compareTo(b.label.toLowerCase()),
    );

    // Update the ValueNotifier with new categories
    setSelectedCategories(_selectedCategories);
  }

  /// Removes a selected category.
  void removeSelectedCategory(Category category) {
    _selectedCategories.removeWhere((c) => c.refId == category.refId);
    setSelectedCategories(_selectedCategories);
  }

  /// Validates all registration form fields.
  bool validateForm() {
    final validate = formKey.currentState?.validate();

    return validate == true;
  }

  /// Submits the form.
  Future<bool> submit() async {
    // Validate the form before proceeding
    if (!(formKey.currentState?.saveAndValidate() ?? false)) {
      return false;
    }

    // Set loading state and notify listeners
    _errorMessage = '';
    _isLoading = true;
    notifyListeners();

    final globalProduct = GlobalProduct(
      refId: this.globalProduct?.refId,
      name: updatingProduct.value.name,
      description: updatingProduct.value.description,
      status: updatingProduct.value.status,
      categories: updatingProduct.value.categories,
      barCodeValue: updatingProduct.value.barCodeValue,
      imagesLinksIds: updatingProduct.value.imagesLinksIds,
    );

    var result;
    result = this.globalProduct == null
        ? await _viewModel.createGlobalProduct(globalProduct)
        : await _viewModel.updateGlobalProduct(globalProduct);
    if (result == false) {
      _errorMessage = intl.failedToSaveProduct;
      _isLoading = false;
      notifyListeners();

      return false;
    }

    _isLoading = false;
    notifyListeners();

    return true;
  }

  @override
  void dispose() {
    updatingProduct.removeListener(notifyListeners);
    updatingProduct.dispose();
    super.dispose();
  }

  /// Clears all form state.
  void _clearForm() {
    _selectedCategories.clear();
    _isLoading = false;
    updatingProduct.value = GlobalProduct(
      status: GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
    );
    notifyListeners();
  }

  /// Gets categories.
  Future<List<Category>> findCategories(String query, String businessId) async {
    return _viewModel.findCategories(query, businessId);
  }

  /// Refreshes categories and notifies listeners.
  Future<void> refreshCategories(String businessId) async {
    await _viewModel.getCategories(businessId);
    notifyListeners();
  }

  /// Sets the selected categories (used by AutoComplete multi-select).
  void setSelectedCategories(List<Category> categories) {
    _selectedCategories
      ..clear()
      ..addAll(categories);

    updatingProduct.value = updatingProduct.value.deepCopy()
      ..categories.clear();
    updatingProduct.value = updatingProduct.value.deepCopy()
      ..categories.addAll(_selectedCategories);
  }

  /// Creates a new category using the view model.
  Future<bool> createCategory(Category category) async {
    return await _viewModel.createCategory(category);
  }
}
