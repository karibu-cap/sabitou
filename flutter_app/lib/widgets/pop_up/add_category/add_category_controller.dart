import 'package:flutter/material.dart';

import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';

import 'add_category_view_model.dart';

/// Controller for category add/edit dialog.
class CategoryAddController extends ChangeNotifier {
  bool _isLoading = false;
  String _errorMessage = '';

  /// The categories Controller.
  final AddCategoryViewModel viewModel;

  /// The category.
  final Category? category;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The internationalization.
  final Intls intl;

  /// The controller of english version name.
  final TextEditingController enController = TextEditingController();

  /// The controller of french version name.
  final TextEditingController frController = TextEditingController();

  /// Text controller for type input field.
  final ShadSelectController<CategoryType>? typeController =
      ShadSelectController<CategoryType>();

  /// The status.
  CategoryStatus? status;

  /// The type.
  CategoryType? type;

  /// The type.
  bool isActive = false;

  /// Whether the modal is currently loading
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String get errorMessage => _errorMessage;

  /// Whether the form can be submitted
  bool get canSubmit =>
      enController.text.trim().isNotEmpty &&
      frController.text.trim().isNotEmpty &&
      type != null &&
      !_isLoading;

  /// Constructs a new
  CategoryAddController({
    required this.viewModel,
    required this.intl,
    this.category,
  }) {
    final category = this.category;
    if (category != null) {
      enController.text = category.name.en;
      frController.text = category.name.fr;
      status = category.status;
      type = category.type;
      typeController?.value.add(category.type);
      isActive = category.status == CategoryStatus.CATEGORY_STATUS_ACTIVE;
    } else {
      _clearForm();
    }
  }

  /// Set the type.
  void setType(CategoryType? type) {
    this.type = type;
    notifyListeners();
  }

  /// Set the active status.
  void setIsActive() {
    isActive = !isActive;
    status = isActive
        ? CategoryStatus.CATEGORY_STATUS_ACTIVE
        : CategoryStatus.CATEGORY_STATUS_INACTIVE;
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
      en: enController.text,
      fr: frController.text,
    );

    final category = Category(
      refId: this.category?.refId,
      name: name,
      status: status ?? CategoryStatus.CATEGORY_STATUS_ACTIVE,
      type: type ?? CategoryType.CATEGORY_TYPE_PRODUCT,
    );

    var result;
    if (this.category == null) {
      final request = CreateCategoryRequest(category: category);

      result = await viewModel.createCategory(request);
    } else {
      final request = UpdateCategoryRequest(category: category);

      result = await viewModel.updateCategory(request);
    }
    if (result == false) {
      _errorMessage = intl.failedToSaveCategory;
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
    enController.dispose();
    frController.dispose();
    super.dispose();
  }

  /// Clears all form controllers and reset form state.
  void _clearForm() {
    enController.clear();
    frController.clear();
    status = null;
    type = null;
    _isLoading = false;
    isActive = false;
  }
}
