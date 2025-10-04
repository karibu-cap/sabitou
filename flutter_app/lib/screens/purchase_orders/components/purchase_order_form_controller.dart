import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/user_preference.dart';
import '../purchase_orders_controller.dart';

/// Controller for managing purchase order form.
class PurchaseOrderFormController extends ChangeNotifier {
  /// Form key for validation
  final formKey = GlobalKey<ShadFormState>();

  /// Purchase order.
  PurchaseOrder purchaseOrder = PurchaseOrder();

  /// Selected supplier ID.
  String? selectedSupplierId;

  /// Expected delivery date.
  DateTime? expectedDeliveryDate;

  /// List of order line items.
  final List<OrderLineItem> lineItems = [];

  /// Notes text controller.
  final TextEditingController notesController = TextEditingController();

  /// Loading state for form submission.
  bool _isSubmitting = false;

  /// Gets submission state.
  bool get isSubmitting => _isSubmitting;

  /// Gets total amount of all line items.
  double get totalAmount {
    return lineItems.fold(0.0, (sum, item) => sum + (item.total));
  }

  /// Check if form can be submitted.
  bool get canSubmit {
    return selectedSupplierId != null && lineItems.isNotEmpty && !_isSubmitting;
  }

  /// Dispose resources
  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  /// Validates form before submission
  bool _validateForm(BuildContext context) {
    if (lineItems.isEmpty) {
      showErrorToast(
        context: context,
        message: Intls.to.pleaseAddAtLeastOneItem,
      );

      return false;
    }

    /// Validates all line items have products.
    for (var i = 0; i < lineItems.length; i++) {
      final item = lineItems[i];
      if (item.productId.isEmpty) {
        showErrorToast(
          context: context,
          message: Intls.to.pleaseSelectAProductForItem.trParams({
            'item': (i + 1).toString(),
          }),
        );

        return false;
      }
      if (item.quantity <= 0) {
        showErrorToast(
          context: context,
          message: Intls.to.quantityMustBeGreaterThanZeroForItem.trParams({
            'item': (i + 1).toString(),
          }),
        );

        return false;
      }
      if (item.unitPrice <= 0) {
        showErrorToast(
          context: context,
          message: Intls.to.amountMustBeGreaterThanZeroForItem.trParams({
            'item': (i + 1).toString(),
          }),
        );

        return false;
      }
    }

    return true;
  }

  /// Submit the form.
  Future<bool> submitForm(
    BuildContext context,
    PurchaseOrdersController purchaseOrdersController,
  ) async {
    if (!(formKey.currentState?.saveAndValidate() ?? false)) {
      return false;
    }
    if (!_validateForm(context)) {
      return false;
    }

    _isSubmitting = true;
    notifyListeners();

    final user = UserPreferences.instance.user;
    final store = UserPreferences.instance.store;
    if (user == null || store == null) {
      showErrorToast(context: context, message: 'User/Store not found');

      return false;
    }

    final request = CreatePurchaseOrderRequest(
      supplierId: selectedSupplierId,
      buyerId: store.refId,
      items: lineItems,
      createdByUserId: user.refId,
      notes: notesController.text.isNotEmpty ? notesController.text : null,
      expectedDeliveryDate: expectedDeliveryDate != null
          ? Timestamp.fromDateTime(expectedDeliveryDate ?? DateTime.now())
          : null,
    );

    final success = await purchaseOrdersController.createPurchaseOrder(request);

    if (success) {
      showSuccessToast(
        context: context,
        message: Intls.to.purchaseOrderCreatedSuccessfully,
      );
      resetForm();
      _isSubmitting = false;
      notifyListeners();

      return true;
    }
    showErrorToast(
      context: context,
      message: Intls.to.failedToCreatePurchaseOrder,
    );
    _isSubmitting = false;
    notifyListeners();

    return false;
  }

  /// Adds a new line item.
  void addLineItem() {
    lineItems.add(OrderLineItem());
    notifyListeners();
  }

  /// Removes a line item.
  void removeLineItem(int index) {
    if (index >= 0 && index < lineItems.length) {
      lineItems.removeAt(index);
      notifyListeners();
    }
  }

  /// Updates a line item.
  void updateLineItem(int index, OrderLineItem item) {
    if (index >= 0 && index < lineItems.length) {
      lineItems[index] = item;
      notifyListeners();
    }
  }

  /// Sets supplier selection.
  void setSupplier(String? supplierId) {
    selectedSupplierId = supplierId;
    notifyListeners();
  }

  /// Sets expected delivery date.
  void setExpectedDeliveryDate(DateTime? date) {
    expectedDeliveryDate = date;
    notifyListeners();
  }

  /// Sets order item selection with product details.
  void setOrderItem(int index, StoreProductWithGlobalProduct item) {
    if (index >= 0 && index < lineItems.length) {
      lineItems[index] = OrderLineItem(
        productId: item.storeProduct.refId,
        productName: item.globalProduct.name,
      );
      notifyListeners();
    }
  }

  /// Reset form to initial state
  void resetForm() {
    selectedSupplierId = null;
    expectedDeliveryDate = null;
    lineItems.clear();
    notesController.clear();
    _isSubmitting = false;
    notifyListeners();
  }
}
