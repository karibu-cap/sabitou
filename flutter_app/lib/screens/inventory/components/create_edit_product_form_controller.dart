import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repositories/products_repository.dart';
import '../../../utils/extends_models.dart';

/// The type of the product form.
enum ProductFormType {
  /// The create product form type.
  create,

  /// The edit product form type.
  edit,
}

/// Product form provider.
class CreateEditProductFormController extends ChangeNotifier {
  final Product _product;
  final bool _isLoading = false;
  List<String>? _selectedCategoryId;

  /// Whether the form is saving.
  final ValueNotifier<bool> isSaving = ValueNotifier(false);

  /// Gets the product form type.
  final ProductFormType productFormType;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The name controller.
  final TextEditingController nameController;

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

  /// Gets the selected category id.
  List<String>? get selectedCategoryId => _selectedCategoryId;

  /// Gets the loading state.
  bool get isLoading => _isLoading;

  /// Gets the product.
  Product get product => _product;

  /// Constructs of new [CreateEditProductFormController].
  CreateEditProductFormController({Product? product})
    : _product =
          product ??
          Product(
            businessProduct: BusinessProduct(),
            globalProduct: GlobalProduct(),
          ),
      productFormType = product == null
          ? ProductFormType.create
          : ProductFormType.edit,
      nameController = TextEditingController(text: product?.globalProduct.name),
      barcodeController = TextEditingController(
        text: product?.globalProduct.barCodeValue,
      ),
      priceController = TextEditingController(
        text: product?.businessProduct.priceInCents.toString(),
      ),
      quantityController = TextEditingController(
        text: product?.businessProduct.stockQuantity.toString(),
      ),
      minStockThresholdController = TextEditingController(
        text: product?.businessProduct.minStockThreshold.toString(),
      ),
      expiryController = TextEditingController(
        text: product?.businessProduct.expirationDate
            .toDateTime()
            .toIso8601String()
            .split('T')
            .first,
      ),
      _selectedCategoryId = product?.globalProduct.categories
          .map((e) => e.refId)
          .toList();

  /// Validates the form.
  bool validateForm() {
    return formKey.currentState?.saveAndValidate() ?? false;
  }

  /// Validates the selections.
  bool validateSelections() {
    return _selectedCategoryId != null;
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
    _selectedCategoryId = globalProduct.categories.map((e) => e.refId).toList();
    _product.globalProduct = globalProduct;
    print("[[[[[]]]]]");
    notifyListeners();
  }
}
