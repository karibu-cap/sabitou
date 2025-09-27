import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../../../services/internationalization/internationalization.dart';
import '../../../global_products_controller.dart';

/// Controller for managing product deletion confirmation modal state and operations.
class DeleteGlobalProductController extends ChangeNotifier {
  final GlobalProductsController _globalProductsController;
  final GlobalProduct _globalProduct;

  /// The intl
  final AppInternationalizationService intl;

  bool _isLoading = false;
  String _errorMessage = '';
  String _confirmationText = '';

  /// Constructs a new DeleteGlobalProductController.
  DeleteGlobalProductController({
    required GlobalProductsController globalProductsController,
    required GlobalProduct globalProduct,
    required this.intl,
  }) : _globalProductsController = globalProductsController,
       _globalProduct = globalProduct;

  /// Whether the modal is currently loading
  bool get isLoading => _isLoading;

  /// Current error message, if any
  String get errorMessage => _errorMessage;

  /// Global product to be deleted
  GlobalProduct get globalProduct => _globalProduct;

  /// Confirmation text entered by user
  String get confirmationText => _confirmationText;

  /// Expected confirmation text
  String get expectedConfirmationText =>
      AppInternationalizationService.to.delete.toUpperCase();

  /// Whether the confirmation text is correct
  bool get isConfirmationValid =>
      _confirmationText.trim().toUpperCase() == expectedConfirmationText;

  /// Whether the deletion can be performed
  bool get canDelete => isConfirmationValid && !_isLoading;

  /// Update confirmation text
  void updateConfirmationText(String value) {
    _confirmationText = value;
    notifyListeners();
  }

  /// Delete the user from the business
  Future<bool> deleteGlobalProduct() async {
    if (!canDelete) return false;

    _isLoading = true;
    _errorMessage = '';
    notifyListeners();

    final success = await _globalProductsController.deleteGlobalProduct(
      _globalProduct.refId,
    );

    if (!success) {
      _isLoading = false;
      notifyListeners();
      _errorMessage = intl.failedToDeleteProduct;

      return false;
    }

    _isLoading = false;
    _errorMessage = '';
    notifyListeners();

    return success;
  }

  /// Clear any error message
  void clearError() {
    _errorMessage = '';
    notifyListeners();
  }
}
