import 'package:flutter/material.dart';

import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../../../utils/extensions/category_extension.dart';

import '../../../global_products_controller.dart';

/// Controller for global product add/edit dialog.
class GlobalProductAddController extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  /// The global products Controller.
  final GlobalProductsController controller;

  /// The global product.
  final GlobalProduct? globalProduct;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The internationalization.
  final Intls intl;

  /// The controller of english version name.
  final TextEditingController enNameController = TextEditingController();

  /// The controller of french version name.
  final TextEditingController frNameController = TextEditingController();

  /// The controller of english version description.
  final TextEditingController enDescriptionController = TextEditingController();

  /// The controller of french version description.
  final TextEditingController frDescriptionController = TextEditingController();

  /// The selected categories for the product.
  final List<Category> _selectedCategories = [];

  /// The status.
  GlobalProductStatus? status;

  /// The type.
  bool isActive = false;

  /// Available categories to pick from.
  List<Category> get availableCategories {
    final seen = <String>{};
    final categories = <Category>[];

    for (final category
        in controller.viewModel.categories.whereType<Category>()) {
      final identifier = category.refId.isNotEmpty
          ? category.refId
          : '${category.name.en}_${category.name.fr}';

      if (!seen.add(identifier)) {
        continue;
      }

      categories.add(Category()..mergeFromMessage(category));
    }

    categories.sort(
      (a, b) => a.label.toLowerCase().compareTo(b.label.toLowerCase()),
    );

    return categories;
  }

  /// Currently selected categories (immutable view).
  List<Category> get selectedCategories =>
      List.unmodifiable(_selectedCategories);

  /// Whether the modal is currently loading
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String get errorMessage => _errorMessage;

  /// Whether the form can be submitted
  bool get canSubmit =>
      enNameController.text.trim().isNotEmpty &&
      frNameController.text.trim().isNotEmpty &&
      enDescriptionController.text.trim().isNotEmpty &&
      frDescriptionController.text.trim().isNotEmpty &&
      !_isLoading;

  /// Constructs a new
  GlobalProductAddController({
    required this.controller,
    required this.intl,
    this.globalProduct,
  }) {
    final globalProduct = this.globalProduct;
    if (globalProduct != null) {
      enNameController.text = globalProduct.name.en;
      frNameController.text = globalProduct.name.fr;
      enDescriptionController.text = globalProduct.description.en;
      frDescriptionController.text = globalProduct.description.fr;
      status = globalProduct.status;
      isActive =
          globalProduct.status ==
          GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE;
      _selectedCategories
        ..clear()
        ..addAll(
          globalProduct.categories.map(
            (category) => Category()..mergeFromMessage(category),
          ),
        );
    } else {
      _clearForm();
    }
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
      _selectedCategories.add(Category()..mergeFromMessage(category));
    }

    _selectedCategories.sort(
      (a, b) => a.label.toLowerCase().compareTo(b.label.toLowerCase()),
    );

    notifyListeners();
  }

  /// Removes a selected category.
  void removeSelectedCategory(Category category) {
    _selectedCategories.removeWhere((c) => c.refId == category.refId);
    notifyListeners();
  }

  /// Set the active status.
  void setIsActive() {
    isActive = !isActive;
    status = isActive
        ? GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE
        : GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE;
    notifyListeners();
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

    final name = Internationalized(
      en: enNameController.text,
      fr: frNameController.text,
    );

    final description = Internationalized(
      en: enDescriptionController.text,
      fr: frDescriptionController.text,
    );

    final globalProduct = GlobalProduct(
      refId: this.globalProduct?.refId,
      name: name,
      description: description,
      status: status ?? GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
    );

    globalProduct.categories.addAll(
      _selectedCategories.map(
        (category) => Category()..mergeFromMessage(category),
      ),
    );

    var result;
    if (this.globalProduct == null) {
      final request = CreateGlobalProductRequest(globalProduct: globalProduct);

      result = await controller.createGlobalProduct(request);
    } else {
      final request = UpdateGlobalProductRequest(globalProduct: globalProduct);

      result = await controller.updateGlobalProduct(request);
    }
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
    enNameController.dispose();
    frNameController.dispose();
    enDescriptionController.dispose();
    frDescriptionController.dispose();
    super.dispose();
  }

  /// Clears all form controllers and reset form state.
  void _clearForm() {
    enNameController.clear();
    frNameController.clear();
    enDescriptionController.clear();
    frDescriptionController.clear();
    _selectedCategories.clear();
    status = null;
    _isLoading = false;
    isActive = false;
    notifyListeners();
  }
}
