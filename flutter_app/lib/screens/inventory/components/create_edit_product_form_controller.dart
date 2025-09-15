import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repositories/products_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/user_preference.dart';

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
  final Product _product;
  bool _onSaveProduct = false;

  /// Gets the error type.
  ValueNotifier<Map<ErrorType, String?>?> errors = ValueNotifier(null);

  /// Gets the product form type.
  final ProductFormType productFormType;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The name controller.
  final TextEditingController nameController;

  /// The category controller.
  ShadSelectController<String?> categoryController;

  /// The supplier controller.
  ShadSelectController<String?> supplierController;

  /// The barcode controller.
  final TextEditingController barcodeController;

  /// The price controller.
  final TextEditingController priceController;

  /// The quantity controller.
  final TextEditingController quantityController;

  /// The reorder threshold controller.
  final TextEditingController minStockThresholdController;

  /// The expiry controller.
  final TextEditingController expiryController;

  /// The inbound date controller.
  final TextEditingController inboundDateController;

  /// Gets the loading state.
  bool get onSaveProduct => _onSaveProduct;

  /// Gets the product.
  Product get product => _product;

  /// Constructs of new [CreateEditProductFormController].
  CreateEditProductFormController({Product? product})
    : _product =
          product ??
          Product(storeProduct: StoreProduct(), globalProduct: GlobalProduct()),
      productFormType = product == null
          ? ProductFormType.create
          : ProductFormType.edit,
      nameController = TextEditingController(text: product?.globalProduct.name),
      barcodeController = TextEditingController(
        text: product?.globalProduct.barCodeValue,
      ),
      priceController = TextEditingController(
        text: product?.storeProduct.price.toString(),
      ),
      quantityController = TextEditingController(
        text: product?.storeProduct.stockQuantity.toString(),
      ),
      minStockThresholdController = TextEditingController(
        text: product?.storeProduct.minStockThreshold.toString(),
      ),
      inboundDateController = TextEditingController(
        text: product?.storeProduct.inboundDate.toDateTime().toIso8601String(),
      ),
      expiryController = TextEditingController(
        text: product?.storeProduct.expirationDate
            .toDateTime()
            .toIso8601String(),
      ),
      categoryController = ShadSelectController<String?>(
        initialValue: product?.globalProduct.categories
            .map((e) => e.refId)
            .toSet(),
      ),
      supplierController = ShadSelectController<String?>(
        initialValue: product?.storeProduct.supplierId != null
            ? {product?.storeProduct.supplierId}
            : null,
      );

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
  Future<List<GlobalProduct>> filterGlobalProduct(String name) async {
    return await ProductsRepository.instance.findGlobalProduct(
      FindGlobalProductsRequest(name: name),
    );
  }

  /// Sets the new product.
  void setNewProduct(GlobalProduct globalProduct) {
    nameController.text = globalProduct.name;
    barcodeController.text = globalProduct.barCodeValue;
    categoryController.value = globalProduct.categories
        .map((e) => e.refId)
        .toSet();
    _product.globalProduct = globalProduct;
    notifyListeners();
  }

  /// Saves the product.
  Future<void> saveProduct(BuildContext context) async {
    if (!validateForm()) {
      return;
    }
    _onSaveProduct = true;
    notifyListeners();

    try {
      final storeId = UserPreferences.instance.store?.refId;
      if (storeId == null) {
        throw Exception(Intls.to.error);
      }

      final result = productFormType == ProductFormType.create
          ? await ProductsRepository.instance.addProduct(
              AddStoreProductRequest(
                globalProduct: product.globalProduct,
                storeProduct: product.storeProduct
                  ..storeId = storeId
                  ..createdAt = Timestamp.fromDateTime(clock.now())
                  ..updatedAt = Timestamp.fromDateTime(clock.now()),
              ),
            )
          : await ProductsRepository.instance.updateProduct(
              UpdateStoreProductRequest(
                globalProduct: product.globalProduct,
                storeProduct: product.storeProduct
                  ..updatedAt = Timestamp.fromDateTime(clock.now()),
              ),
            );

      if (result) {
        if (!context.mounted) {
          return;
        }
        Navigator.of(context).pop(true);
        showSuccessToast(
          context: context,
          message: Intls.to.productSavedSuccessfully,
        );
      }
    } on Exception catch (e) {
      if (!context.mounted) {
        return;
      }
      showErrorToast(context: context, message: e.toString());
    } finally {
      _onSaveProduct = false;
      notifyListeners();
    }
  }
}
