import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import 'add_supplier_view_model.dart';

/// The suppliers controller.
///
/// Manages the state and store logic for the suppliers module.
/// Uses ChangeNotifier for state management with Provider pattern.
class AddSupplierController extends ChangeNotifier {
  final AppInternationalizationService _intl;
  final Supplier? _supplier;
  final AddSupplierViewModel _viewModel;

  /// Constructs a new SuppliersAddController.
  AddSupplierController({
    required AppInternationalizationService intl,
    Supplier? supplier,
    required AddSupplierViewModel viewModel,
  }) : _intl = intl,
       _supplier = supplier,
       _viewModel = viewModel {
    if (supplier != null) {
      nameController.text = supplier.name;
      phoneController.text = supplier.contactPhone;
      emailController.text = supplier.contactEmail;
      addressController.text = supplier.contactAddress;
      notesController.text = supplier.description;
      supplierStatus = supplier.status;
    } else {
      _clearForm();
    }
  }

  /// Error message to display when operations fail.
  String _errorMessage = '';

  /// Form key for validation of the supplier form.
  final GlobalKey<ShadFormState> formKey = GlobalKey<ShadFormState>();

  /// Text controller for supplier name input field.
  final TextEditingController nameController = TextEditingController();

  /// Text controller for supplier phone number input field.
  final TextEditingController phoneController = TextEditingController();

  /// Text controller for supplier email address input field.
  final TextEditingController emailController = TextEditingController();

  /// Text controller for supplier address input field.
  final TextEditingController addressController = TextEditingController();

  /// Text controller for supplier notes/description input field.
  final TextEditingController notesController = TextEditingController();

  /// Active status of the supplier being edited.
  SupplierStatus? supplierStatus;

  /// Loading state specifically for form save operations.
  bool _isFormLoading = false;

  /// Returns the last error message from failed operations.
  String get errorMessage => _errorMessage;

  /// Selected supplier for editing.
  Supplier? get selectedSupplier => _supplier;

  /// Gets loading state specifically for form save operations.
  bool get isFormLoading => _isFormLoading;

  /// Clears all form controllers and reset form state.
  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
    notesController.clear();
    supplierStatus = null;
  }

  /// Validates all registration form fields.
  bool validateForm() {
    final validate = formKey.currentState?.validate();

    return validate == true;
  }

  /// Saves the current supplier form data.
  Future<bool> saveSupplier() async {
    // Validate the form before proceeding
    if (!(formKey.currentState?.saveAndValidate() ?? false)) {
      return false;
    }

    // Set loading state and notify listeners
    _errorMessage = '';
    _isFormLoading = true;
    notifyListeners();

    // Create a new supplier object with form data
    final newSupplier = Supplier(
      refId: _supplier?.refId,
      name: nameController.text.trim(),
      contactPhone: phoneController.text.trim(),
      contactEmail: emailController.text.trim(),
      contactAddress: addressController.text.trim(),
      description: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),
      status: supplierStatus,
    );
    var result;
    if (_supplier == null) {
      result = await _viewModel.addSupplier(newSupplier);
      debugPrint('Would add new supplier: ${newSupplier.name}');
    } else {
      result = await _viewModel.updateSupplier(newSupplier);
      debugPrint('Would update supplier: ${newSupplier.name}');
    }

    if (result == false) {
      _errorMessage = _intl.failedToSaveSupplier;
      _isFormLoading = false;
      notifyListeners();

      return false;
    }

    // Clear form after successful save
    _clearForm();
    _isFormLoading = false;
    notifyListeners();

    return true;
  }

  /// Clears error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Calculates total products count
  int calculateTotalProducts(List<StoreProduct> products) {
    return products.length;
  }

  /// Calculates average products per supplier
  String calculateAverageProductsPerSupplier(
    int totalProducts,
    int totalSuppliers,
  ) {
    return totalSuppliers > 0
        ? (totalProducts / totalSuppliers).toStringAsFixed(1)
        : '0.0';
  }

  /// Calculates total inventory value from all products
  double calculateTotalValue(List<StoreProduct> products) {
    return products.fold<double>(
      0.0,
      (sum, product) => sum + (product.salePrice * 0),
    );
  }

  /// Disposes the controller.
  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    notesController.dispose();
    super.dispose();
  }

  /// Sets the supplier status.
  void setSupplierStatus(bool value) {
    supplierStatus = value
        ? SupplierStatus.SUPPLIER_STATUS_ACTIVE
        : SupplierStatus.SUPPLIER_STATUS_INACTIVE;
    notifyListeners();
  }
}
