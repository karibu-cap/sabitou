import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import 'suppliers_view_model.dart';

/// The suppliers controller.
///
/// Manages the state and business logic for the suppliers module.
/// Uses ChangeNotifier for state management with Provider pattern.
class SuppliersController extends ChangeNotifier {
  /// The view model that handles data operations for suppliers
  final SuppliersViewModel _viewModel;
  final AppInternationalizationService _intl;

  /// Constructs a new SuppliersController.
  SuppliersController(
    SuppliersViewModel viewModel,
    AppInternationalizationService intl,
  ) : _viewModel = viewModel,
      _intl = intl;

  /// Loading state for general suppliers operations.
  bool _isLoading = false;

  /// Currently selected supplier for editing operations.
  Supplier? _selectedSupplier;

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
  bool isActive = false;

  /// Loading state specifically for form save operations.
  bool _isFormLoading = false;

  /// Loading state for suppliers operations.
  bool get isLoading => _isLoading;

  /// Returns the last error message from failed operations.
  String get errorMessage => _errorMessage;

  /// Selected supplier for editing.
  Supplier? get selectedSupplier => _selectedSupplier;

  /// Gets suppliers stream for reactive UI updates
  Stream<List<Supplier>> get suppliersStream => _viewModel.suppliersStream;

  /// Gets products stream for reactive UI updates
  Stream<List<BusinessProduct>> get productsStream => _viewModel.productsStream;

  /// Gets loading state specifically for form save operations.
  bool get isFormLoading => _isFormLoading;

  /// Sets the currently selected supplier for editing.
  void setSelectedSupplier(Supplier? supplier) {
    _selectedSupplier = supplier;
    _initializeFormWithSupplier(supplier);
    notifyListeners();
  }

  /// Set the active status of the supplier being edited.
  void setIsActive(bool value) {
    isActive = value;
    notifyListeners();
  }

  /// Initializes form controllers with supplier data.
  void _initializeFormWithSupplier(Supplier? supplier) {
    if (supplier != null) {
      nameController.text = supplier.name;
      phoneController.text = supplier.contactPhone;
      emailController.text = supplier.contactEmail;
      addressController.text = supplier.contactAddress;
      notesController.text = supplier.description;
      isActive = supplier.isActive;
    } else {
      _clearForm();
    }
  }

  /// Clears all form controllers and reset form state.
  void _clearForm() {
    nameController.clear();
    phoneController.clear();
    emailController.clear();
    addressController.clear();
    notesController.clear();
    isActive = false;
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
      refId: _selectedSupplier?.refId,
      name: nameController.text.trim(),
      contactPhone: phoneController.text.trim(),
      contactEmail: emailController.text.trim(),
      contactAddress: addressController.text.trim(),
      description: notesController.text.trim().isEmpty
          ? null
          : notesController.text.trim(),
      isActive: isActive,
    );
    var result;
    if (_selectedSupplier == null) {
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

  /// Deletes a supplier from the system.
  Future<bool> deleteSupplier(String supplierId) async {
    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final result = await _viewModel.deleteSupplier(supplierId);
    _errorMessage = _intl.failedToDeleteSupplier;
    notifyListeners();

    return result;
  }

  /// Clears error message.
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }

  /// Gets products for a specific supplier
  List<BusinessProduct> getProductsForSupplier(
    String supplierRefId,
    List<BusinessProduct> allProducts,
  ) {
    return allProducts.where((p) => p.supplierId == supplierRefId).toList();
  }

  /// Calculates total products count
  int calculateTotalProducts(List<BusinessProduct> products) {
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
  double calculateTotalValue(List<BusinessProduct> products) {
    return products.fold<double>(
      0.0,
      (sum, product) => sum + (product.priceInXaf * product.stockQuantity),
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
}
