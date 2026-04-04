import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../repositories/categories_repository.dart';
import '../../../../repositories/store_products_repository.dart';
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/extensions/global_product_extension.dart';

/// The type of the product form.
enum ProductFormType {
  /// The create product form type.
  create,

  /// The edit product form type.
  edit,
}

/// The error type.
enum ErrorType {
  /// The category error type.
  category,
}

/// Product form provider.
class CreateEditProductFormController extends ChangeNotifier {
  GlobalProduct _product;
  final StoreProduct _storeProduct;
  bool _onSaveProduct = false;
  final bool _isCreatingNewProduct;
  final String _storeId;

  /// Gets the selected global product.
  GlobalProduct? selectedGlobalProduct;

  /// Gets the error type.
  ValueNotifier<Map<ErrorType, String?>?> errors = ValueNotifier(null);

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// Gets the business categories for the current store.
  List<Category> businessCategories = [];

  /// The name controller.
  final TextEditingController nameController;

  /// The description controller.
  final TextEditingController descriptionController;

  /// The category controller.
  ShadSelectController<Category?> categoryController;

  /// The barcode controller.
  final TextEditingController barcodeController;

  /// The SKU controller.
  final TextEditingController skuController;

  /// The sale price controller.
  final TextEditingController salePriceController;

  /// The opening stock controller.
  final TextEditingController openingStockController;

  /// The opening stock per unit controller.
  final TextEditingController openingStockPerUnitController;

  /// The default purchase price controller.
  final TextEditingController defaultPurchasePriceController;

  /// The reorder point controller.
  final TextEditingController reorderPointController;

  /// Gets the loading state.
  bool get onSaveProduct => _onSaveProduct;

  /// Gets whether creating new product.
  bool get isCreatingNewProduct => _isCreatingNewProduct;

  /// Gets the product.
  GlobalProduct get product => _product;

  /// Gets the store product.
  StoreProduct get storeProduct => _storeProduct;

  /// Constructs of new [CreateEditProductFormController].
  CreateEditProductFormController({
    required String businessId,
    required String storeId,
    GlobalProduct? product,
    StoreProduct? storeProduct,
  }) : _product = product ?? GlobalProduct(),
       _storeId = storeId,
       _storeProduct = storeProduct ?? StoreProduct(),
       _isCreatingNewProduct = product == null,
       nameController = TextEditingController(text: product?.label),
       descriptionController = TextEditingController(
         text: product?.descriptionIntl,
       ),
       barcodeController = TextEditingController(text: product?.barCodeValue),
       skuController = TextEditingController(text: storeProduct?.sku ?? ''),
       salePriceController = TextEditingController(
         text: storeProduct?.salePrice.toString() ?? '',
       ),
       openingStockController = TextEditingController(
         text: storeProduct?.hasOpeningStock() == true
             ? storeProduct?.openingStock.toString()
             : '',
       ),
       openingStockPerUnitController = TextEditingController(
         text: storeProduct?.hasOpeningStockPerUnit() == true
             ? storeProduct?.openingStockPerUnit.toString()
             : '',
       ),
       defaultPurchasePriceController = TextEditingController(
         text: storeProduct?.hasDefaultPurchasePrice() == true
             ? storeProduct?.defaultPurchasePrice.toString()
             : '',
       ),
       reorderPointController = TextEditingController(
         text: storeProduct?.reorderPoint.toString() ?? '',
       ),
       categoryController = ShadSelectController<Category?>(
         initialValue: product?.categories.toSet(),
       ) {
    _loadCategories(businessId);
  }

  Future<void> _loadCategories(String businessId) async {
    businessCategories = await CategoriesRepository.instance
        .getCategoriesByBusinessId(businessId);
    notifyListeners();
  }

  /// Validates the form.
  bool validateForm() {
    final isValid = formKey.currentState?.saveAndValidate() == true;
    final isNotEmptyCategory = categoryController.value.isNotEmpty;

    if (!isNotEmptyCategory) {
      errors.value = {
        ErrorType.category: Intls.to.isRequiredField.trParams({
          'field': Intls.to.category,
        }),
      };
    }

    return isValid && isNotEmptyCategory;
  }

  /// Filters global products.
  Future<List<GlobalProduct>> filterGlobalProduct({
    String? name,
    String? barcode,
  }) async {
    return await StoreProductsRepository.instance.findGlobalProducts(
      name: name,
      barCodeValue: barcode,
    );
  }

  /// Sets the new product.
  void setNewProduct(GlobalProduct globalProduct) {
    nameController.text = globalProduct.label;
    barcodeController.text = globalProduct.barCodeValue;
    descriptionController.text = globalProduct.descriptionIntl;
    categoryController.value = globalProduct.categories.toSet();
    selectedGlobalProduct = GlobalProduct()..mergeFromMessage(globalProduct);
    _product = GlobalProduct()..mergeFromMessage(globalProduct);
    notifyListeners();
  }

  /// Saves the product.
  Future<bool> saveProduct(BuildContext context) async {
    if (!validateForm()) {
      return false;
    }
    _onSaveProduct = true;
    notifyListeners();

    try {
      // Update store product with form data
      _storeProduct
        ..storeId = _storeId
        ..sku = skuController.text
        ..salePrice = int.tryParse(salePriceController.text) ?? 0
        ..reorderPoint = int.tryParse(reorderPointController.text) ?? 0
        ..openingStock = int.tryParse(openingStockController.text) ?? 0
        ..openingStockPerUnit =
            double.tryParse(openingStockPerUnitController.text) ?? 0.0
        ..defaultPurchasePrice =
            double.tryParse(defaultPurchasePriceController.text) ?? 0.0;

      if (_isCreatingNewProduct) {
        _storeProduct.globalProductId = _product.refId;

        if (selectedGlobalProduct != _product) {
          _storeProduct.clearGlobalProductId();
          _product.clearRefId();
        }

        // Create both global product and store product
        final result = await StoreProductsRepository.instance.addProduct(
          _storeProduct,
        );

        if (!context.mounted) {
          return false;
        }
        if (result) {
          showSuccessToast(
            context: context,
            message: Intls.to.productSavedSuccessfully,
          );

          return true;
        } else {
          throw Exception(Intls.to.error);
        }
      } else {
        final result = await StoreProductsRepository.instance.updateProduct(
          globalProduct: _product,
          storeProduct: _storeProduct,
        );

        if (!context.mounted) {
          return false;
        }

        if (result) {
          showSuccessToast(
            context: context,
            message: Intls.to.productSavedSuccessfully,
          );

          return true;
        } else {
          throw Exception(Intls.to.error);
        }
      }
    } on Exception catch (e) {
      if (!context.mounted) {
        return false;
      }
      showErrorToast(context: context, message: e.toString());
      _onSaveProduct = false;

      return false;
    }
  }

  /// Force reload the product.
  void forceReload() {
    notifyListeners();
  }
}
