import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../repositories/invoice_repository.dart';
import '../../../../repositories/products_repository.dart';
import '../../../../repositories/stock_inbound_repository.dart';
import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/common_functions.dart';
import '../../../../utils/extends_models.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../utils/user_preference.dart';

/// The adjustment stock form controller.
final class AdjustmentStockFormController extends ChangeNotifier {
  bool _onSaveProduct = false;

  /// Whether the form is customer return.
  ValueNotifier<bool> isCustomerReturn = ValueNotifier<bool>(false);

  /// Whether we should create a refund.
  ValueNotifier<bool> isRefund = ValueNotifier<bool>(false);

  /// The product to adjust.
  final Product? product;

  /// The form key.
  final formKey = GlobalKey<ShadFormState>();

  /// The reason controller.
  final TextEditingController reasonController;

  /// The adjustment quantity controller.
  final TextEditingController adjustmentQuantityController;

  /// The global product controller.
  ShadSelectController<GlobalProduct?> globalProductController;

  /// Gets the loading state.
  bool get onSaveProduct => _onSaveProduct;

  /// Constructs of new [AdjustmentStockFormController].
  AdjustmentStockFormController({this.product})
    : globalProductController = ShadSelectController<GlobalProduct?>(
        initialValue: {product?.globalProduct},
      ),
      reasonController = TextEditingController(),
      adjustmentQuantityController = TextEditingController();

  /// Validates the form.
  bool validateForm() {
    final isValid = formKey.currentState?.saveAndValidate() == true;

    return isValid;
  }

  /// Filters global products.
  Future<List<GlobalProduct>> filterGlobalProduct(String name) async {
    return await ProductsRepository.instance.findGlobalProducts(
      FindGlobalProductsRequest(name: name),
    );
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
      final userId = UserPreferences.instance.user?.refId;
      if (storeId == null || userId == null) {
        throw Exception(Intls.to.error);
      }

      if (product == null) {
        throw Exception(Intls.to.productNotFound);
      }

      final initialQuantityStr = adjustmentQuantityController.text;
      final initialQuantity = int.tryParse(initialQuantityStr) ?? 0;

      /// return a error toast whether the is return and the quantity is negative
      if (isCustomerReturn.value && initialQuantity < 0) {
        showErrorToast(
          context: context,
          message: Intls.to.quantityMustBePositiveWhenCustomerReturn,
        );

        return;
      }

      if (!isCustomerReturn.value &&
          (product?.storeProduct.stockQuantity ?? 0) + initialQuantity < 0) {
        showErrorToast(
          context: context,
          message: Intls.to.weCannotAdjustTheStockToANegativeValue,
        );

        return;
      }

      final stocking = StockInbound(
        refId: '',
        globalProductId: product?.globalProduct.refId,
        inboundType: switch (isCustomerReturn.value) {
          true => InboundType.INBOUND_TYPE_CUSTOMER_RETURN,
          false => InboundType.INBOUND_TYPE_ADJUSTMENT,
        },
        quantity: initialQuantity,
        supplierId: product?.storeProduct.supplierId,
        batchExpiryDate: product?.storeProduct.expirationDate,
        reason: reasonController.text,
        unitCost: product?.storeProduct.costPrice,
        quantityAfter:
            (product?.storeProduct.stockQuantity ?? 0) + initialQuantity,
        quantityBefore: product?.storeProduct.stockQuantity ?? 0,
        performedBy: userId,
        createdAt: Timestamp.fromDateTime(clock.now()),
      );

      final result = await StockInboundRepository.instance.createStockInbound(
        CreateStockInboundRequest(stockInbound: stocking),
      );

      if (result && context.mounted) {
        showSuccessToast(
          context: context,
          message: Intls.to.stockAdjustedSuccessfully,
        );
        if (isRefund.value && isCustomerReturn.value) {
          await _createInvoice(
            initialQuantity: initialQuantity,
            context: context,
          );
        }
      }
      if (!context.mounted) {
        return;
      }
      Navigator.of(context).pop(true);
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

  Future<void> _createInvoice({
    required int initialQuantity,
    required BuildContext context,
  }) async {
    final result = await InvoiceRepository.instance.createInvoice(
      CreateInvoiceRequest(
        invoice: Invoice(
          status: InvoiceStatus.INVOICE_STATUS_REFUNDED,
          orderItems: [
            OrderItem(
              quantity: initialQuantity,
              itemName: product?.globalProduct.label,
              storeProductId: product?.storeProduct.refId,
              unitPrice: product?.storeProduct.costPrice,
            ),
          ],
          subtotal:
              (product?.storeProduct.costPrice ?? 0) *
              initialQuantity.toDouble(),
          total:
              (product?.storeProduct.costPrice ?? 0) *
              initialQuantity.toDouble(),
          deliveryDate: Timestamp.fromDateTime(clock.now()),
          createdAt: Timestamp.fromDateTime(clock.now()),
        ),
      ),
    );
    if (result && context.mounted) {
      showSuccessToast(
        context: context,
        message: Intls.to.invoiceCreatedSuccessfully,
      );
    }
  }
}
