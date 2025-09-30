// import 'package:clock/clock.dart';
// import 'package:flutter/material.dart';
// import 'package:sabitou_rpc/models.dart';
// import 'package:sabitou_rpc/sabitou_rpc.dart';
// import 'package:shadcn_ui/shadcn_ui.dart';

// import '../../../../repositories/products_repository.dart';
// import '../../../../repositories/stock_inbound_repository.dart';
// import '../../../../services/internationalization/internationalization.dart';
// import '../../../../utils/common_functions.dart';
// import '../../../../utils/extends_models.dart';
// import '../../../../utils/user_preference.dart';

// /// Product form provider.
// class RestockProductFormController extends ChangeNotifier {
//   final Product _tmpProduct;
//   bool _onSaveProduct = false;

//   /// The form key.
//   final formKey = GlobalKey<ShadFormState>();

//   /// The supplier controller.
//   ShadSelectController<String?> supplierController;

//   /// The global product controller.
//   ShadSelectController<GlobalProduct?> globalProductController;

//   /// The barcode controller.
//   final TextEditingController barcodeController;

//   /// The price controller.
//   final TextEditingController salePriceController;

//   /// The price controller.
//   final TextEditingController unitCostController;

//   /// The quantity controller.
//   final TextEditingController quantityController;

//   /// The reorder threshold controller.
//   final TextEditingController minStockThresholdController;

//   /// The expiry controller.
//   final TextEditingController expiryController;

//   /// Gets the loading state.
//   bool get onSaveProduct => _onSaveProduct;

//   /// Gets the product.
//   Product get tmpProduct => _tmpProduct;

//   /// Constructs of new [RestockProductFormController].
//   RestockProductFormController()
//     : _tmpProduct = Product(
//         storeProduct: StoreProduct(),
//         globalProduct: GlobalProduct(),
//       ),
//       barcodeController = TextEditingController(),
//       salePriceController = TextEditingController(),
//       unitCostController = TextEditingController(),
//       quantityController = TextEditingController(),
//       minStockThresholdController = TextEditingController(),
//       expiryController = TextEditingController(),
//       supplierController = ShadSelectController<String?>(),
//       globalProductController = ShadSelectController<GlobalProduct?>();

//   /// Validates the form.
//   bool validateForm() {
//     final isValid = formKey.currentState?.saveAndValidate() == true;

//     return isValid;
//   }

//   /// Filters global products.
//   Future<List<GlobalProduct>> filterGlobalProduct(String name) async {
//     return await ProductsRepository.instance.findGlobalProducts(
//       FindGlobalProductsRequest(name: name),
//     );
//   }

//   /// Sets the new product.
//   void setNewProduct(GlobalProduct globalProduct) {
//     globalProductController.value = {globalProduct};
//     barcodeController.text = globalProduct.barCodeValue;
//     _tmpProduct.globalProduct = globalProduct;
//     notifyListeners();
//   }

//   /// Saves the product.
//   Future<void> saveProduct(BuildContext context) async {
//     if (!validateForm()) {
//       return;
//     }
//     _onSaveProduct = true;
//     notifyListeners();

//     try {
//       final storeId = UserPreferences.instance.store?.refId;
//       final userId = UserPreferences.instance.user?.refId;
//       if (storeId == null || userId == null) {
//         throw Exception(Intls.to.error);
//       }

//       final initialQuantityStr = quantityController.text;
//       final initialQuantity = int.tryParse(initialQuantityStr) ?? 0;

//       final stocking = StockInbound(
//         refId: '',
//         globalProductId: _tmpProduct.globalProduct.refId,
//         inboundType: InboundType.INBOUND_TYPE_STOCK_IN,
//         quantity: initialQuantity,
//         unitCost: _tmpProduct.storeProduct.costPrice,
//         supplierId: supplierController.value.first,
//         batchExpiryDate: _tmpProduct.storeProduct.expirationDate,
//         performedBy: userId,
//         createdAt: Timestamp.fromDateTime(clock.now()),
//       );

//       final stockingResult = await StockInboundRepository.instance
//           .createStockInbound(
//             CreateStockInboundRequest(stockInbound: stocking),
//           );

//       if (!stockingResult) {
//         throw Exception(Intls.to.failedToCreateStockInbound);
//       }

//       final getStoreProduct =
//           (await ProductsRepository.instance.findStoreProducts(
//             FindStoreProductsRequest(
//               globalProductId: _tmpProduct.globalProduct.refId,
//               storeId: storeId,
//             ),
//           )).firstOrNull;

//       final result = getStoreProduct == null
//           ? await ProductsRepository.instance.addProduct(
//               AddStoreProductRequest(
//                 globalProduct: _tmpProduct.globalProduct,
//                 storeProduct: _tmpProduct.storeProduct
//                   ..storeId = storeId
//                   ..stockQuantity = initialQuantity
//                   ..createdAt = Timestamp.fromDateTime(clock.now())
//                   ..updatedAt = Timestamp.fromDateTime(clock.now()),
//               ),
//             )
//           : await ProductsRepository.instance.updateProduct(
//               UpdateStoreProductRequest(
//                 globalProduct: _tmpProduct.globalProduct,
//                 storeProduct: getStoreProduct
//                   ..stockQuantity += initialQuantity
//                   ..salePrice = _tmpProduct.storeProduct.salePrice
//                   ..costPrice = _tmpProduct.storeProduct.costPrice
//                   ..minStockThreshold =
//                       _tmpProduct.storeProduct.minStockThreshold
//                   ..updatedAt = Timestamp.fromDateTime(clock.now()),
//               ),
//             );

//       if (result) {
//         if (!context.mounted) {
//           return;
//         }
//         Navigator.of(context).pop(true);
//         showSuccessToast(
//           context: context,
//           message: Intls.to.stockInboundSavedSuccessfully,
//         );
//       }
//     } on Exception catch (e) {
//       if (!context.mounted) {
//         return;
//       }
//       showErrorToast(context: context, message: e.toString());
//     } finally {
//       _onSaveProduct = false;
//       notifyListeners();
//     }
//   }
// }
