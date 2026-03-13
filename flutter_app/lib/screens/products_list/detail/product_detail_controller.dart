import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import 'product_detail_view_model.dart';

/// Controller for [ProductDetailController].
/// Wraps [ProductDetailController] and exposes notifiable state to the View.
final class ProductDetailController extends ChangeNotifier {
  final ProductDetailViewModel _viewModel;
  bool _isDeleting = false;
  bool _isUpdatingStatus = false;

  /// The loaded product.
  StoreProductWithGlobalProduct? get product => _viewModel.product;

  /// Whether the product is loading for the first time.
  bool get isLoading => _viewModel.isLoading;

  /// Whether a deletion is in progress.
  bool get isDeleting => _isDeleting;

  /// Whether a status-update is in progress.
  bool get isUpdatingStatus => _isUpdatingStatus;

  /// The last error message, if any.
  String? get error => _viewModel.error;

  /// Constructs a new [ProductDetailController].
  ProductDetailController({required String productId})
    : _viewModel = ProductDetailViewModel(productId: productId) {
    _init();
  }

  Future<void> _init() async {
    await _viewModel.loadProduct();
    notifyListeners();
  }

  /// Toggles the active/inactive status of the current product.
  /// Returns `true` on success.
  Future<bool> toggleStatus() async {
    _isUpdatingStatus = true;
    notifyListeners();
    final result = await _viewModel.toggleStatus();
    _isUpdatingStatus = false;
    notifyListeners();

    return result;
  }

  /// Deletes the current product.
  /// Returns `true` on success.
  Future<bool> deleteProduct() async {
    _isDeleting = true;
    notifyListeners();
    final result = await _viewModel.deleteProduct();
    _isDeleting = false;
    notifyListeners();

    return result;
  }

  /// Reloads the product from the backend.
  Future<void> reload() async {
    await _viewModel.loadProduct();
    notifyListeners();
  }
}
