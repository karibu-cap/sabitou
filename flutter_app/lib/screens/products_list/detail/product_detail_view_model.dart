import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../../repositories/store_products_repository.dart';
import '../../../utils/logger.dart';

/// ViewModel for [ProductDetailScreen].
/// Loads and mutates a single [StoreProductWithGlobalProduct].
final class ProductDetailViewModel {
  final LoggerApp _logger = LoggerApp('ProductDetailViewModel');

  final String _productId;

  StoreProductWithGlobalProduct? _product;
  bool _isLoading = false;

  String? _error;

  /// Constructs a new [ProductDetailViewModel].
  ProductDetailViewModel({required String productId}) : _productId = productId;

  /// The loaded product (null while loading or on error).
  StoreProductWithGlobalProduct? get product => _product;

  /// Whether the product is loading.
  bool get isLoading => _isLoading;

  /// The last error message, if any.
  String? get error => _error;

  /// Loads the product from the repository.
  Future<void> loadProduct() async {
    _isLoading = true;
    _error = null;

    try {
      _product = await StoreProductsRepository.instance.getStoreProduct(
        GetStoreProductRequest(storeProductId: _productId),
      );
    } on Exception catch (e) {
      _logger.severe('Error loading product: $e');
      _error = e.toString();
    } finally {
      _isLoading = false;
    }
  }

  /// Toggles the active/inactive status of the current product.
  /// Returns `true` on success.
  Future<bool> toggleStatus() async {
    final _product = this._product;
    if (_product == null) return false;
    _error = null;

    try {
      final current = _product.storeProduct.status;
      final newStatus = current == ProductStatus.PRODUCT_STATUS_ACTIVE
          ? ProductStatus.PRODUCT_STATUS_INACTIVE
          : ProductStatus.PRODUCT_STATUS_ACTIVE;

      final updated = _product.storeProduct.deepCopy()..status = newStatus;

      final success = await StoreProductsRepository.instance.updateProduct(
        UpdateStoreProductRequest(
          storeProduct: updated,
          globalProduct: _product.globalProduct,
        ),
      );

      if (success) {
        await loadProduct();
      }

      return success;
    } on Exception catch (e) {
      _logger.severe('Error toggling product status: $e');
      _error = e.toString();

      return false;
    }
  }

  /// Updates the product after an edit form save (called by the controller
  /// after the form completes).
  Future<bool> deleteProduct() async {
    _error = null;

    try {
      final current = _product?.storeProduct;
      current?.status = ProductStatus.PRODUCT_STATUS_DELETE;

      if (current == null) return false;

      final success = await StoreProductsRepository.instance.updateProduct(
        UpdateStoreProductRequest(storeProduct: current),
      );

      return success;
    } on Exception catch (e) {
      _logger.severe('Error updating product: $e');
      _error = e.toString();

      return false;
    }
  }
}
