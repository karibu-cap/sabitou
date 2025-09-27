import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../repositories/products_repository.dart';
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../utils/user_preference.dart';

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
  bool _onSaveProduct = false;

  /// Gets the error type.
  ValueNotifier<Map<ErrorType, String?>?> errors = ValueNotifier(null);

  /// Gets the product form type.
  final ProductFormType productFormType;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The name controller.
  final TextEditingController nameController;

  /// The description controller.
  final TextEditingController descriptionController;

  /// The category controller.
  ShadSelectController<String?> categoryController;

  /// The barcode controller.
  final TextEditingController barcodeController;

  /// Gets the loading state.
  bool get onSaveProduct => _onSaveProduct;

  /// Gets the product.
  GlobalProduct get product => _product;

  /// Constructs of new [CreateEditProductFormController].
  CreateEditProductFormController({GlobalProduct? product})
    : _product = product ?? GlobalProduct(),
      productFormType = product == null
          ? ProductFormType.create
          : ProductFormType.edit,
      nameController = TextEditingController(text: product?.label),
      descriptionController = TextEditingController(
        text: product?.descriptionIntl,
      ),
      barcodeController = TextEditingController(text: product?.barCodeValue),
      categoryController = ShadSelectController<String?>(
        initialValue: product?.categories.map((e) => e.refId).toSet(),
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
    print(' name $name');

    return await ProductsRepository.instance.findGlobalProduct(
      FindGlobalProductsRequest(name: name),
    );
  }

  /// Sets the new product.
  void setNewProduct(GlobalProduct globalProduct) {
    nameController.text = globalProduct.label;
    barcodeController.text = globalProduct.barCodeValue;
    descriptionController.text = globalProduct.descriptionIntl;
    categoryController.value = globalProduct.categories
        .map((e) => e.refId)
        .toSet();
    _product = globalProduct;
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
          ? await ProductsRepository.instance.createGlobalProduct(
              CreateGlobalProductRequest(globalProduct: product),
            )
          : await ProductsRepository.instance.updateGlobalProduct(
              UpdateGlobalProductRequest(globalProduct: product),
            );

      if (!context.mounted) {
        return;
      }
      if (result) {
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
