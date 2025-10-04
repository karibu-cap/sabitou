import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/user_preference.dart';
import '../purchase_orders_controller.dart';

/// Controller for managing receiving note form.
class ReceiveNoteFormController extends ChangeNotifier {
  /// The purchase order to receive.
  final PurchaseOrder purchaseOrder;

  /// Form key for validation
  final formKey = GlobalKey<ShadFormState>();

  /// Receiving note.
  ReceivingNote receivingNote = ReceivingNote();

  /// Related purchase order ID.
  String? relatedPurchaseOrderId;

  /// Selected supplier ID.
  String? selectedSupplierId;

  /// Buyer (warehouse/store) ID.
  String? buyerId;

  /// Received by user ID.
  String? receivedByUserId;

  /// Received at timestamp.
  DateTime? receivedAt;

  /// List of receiving line items.
  final List<ReceivingLineItem> lineItems;

  /// Notes text controller.
  final TextEditingController notesController = TextEditingController();

  /// Loading state for form submission.
  bool _isSubmitting = false;

  /// Gets submission state.
  bool get isSubmitting => _isSubmitting;

  /// Constructors of new [ReceiveNoteFormController].
  ReceiveNoteFormController({required this.purchaseOrder})
    : relatedPurchaseOrderId = purchaseOrder.documentId,
      buyerId = purchaseOrder.buyerId,
      selectedSupplierId = purchaseOrder.supplierId,
      receivedAt = clock.now(),
      lineItems = purchaseOrder.items
          .map(
            (item) => ReceivingLineItem()
              ..productId = item.productId
              ..purchasePrice = item.unitPrice.toInt()
              ..quantityExpected = item.quantity.toDouble()
              ..quantityReceived = item.quantity.toDouble(),
          )
          .toList();

  /// Gets total amount of all line items.
  double get totalAmount {
    return lineItems.fold(
      0.0,
      (sum, item) => sum + (item.purchasePrice * item.quantityReceived),
    );
  }

  /// Check if form can be submitted.
  bool get canSubmit {
    return relatedPurchaseOrderId != null &&
        selectedSupplierId != null &&
        lineItems.isNotEmpty &&
        !_isSubmitting;
  }

  /// Disposes resources.
  @override
  void dispose() {
    notesController.dispose();
    super.dispose();
  }

  /// Validates form before submission.
  bool _validateForm(BuildContext context) {
    if (relatedPurchaseOrderId?.isEmpty ?? true) {
      showErrorToast(
        context: context,
        message: Intls.to.pleaseSelectAPurchaseOrder,
      );

      return false;
    }

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
      if (item.quantityExpected <= 0) {
        showErrorToast(
          context: context,
          message: Intls.to.expectedQuantityMustBeGreaterThanZeroForItem
              .trParams({'item': (i + 1).toString()}),
        );

        return false;
      }
      if (item.quantityReceived < 0) {
        showErrorToast(
          context: context,
          message: Intls.to.receivedQuantityCannotBeNegativeForItem.trParams({
            'item': (i + 1).toString(),
          }),
        );

        return false;
      }
      if (item.purchasePrice <= 0) {
        showErrorToast(
          context: context,
          message: Intls.to.purchasePriceMustBeGreaterThanZeroForItem.trParams({
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

    final request = CreateReceivingNoteRequest(
      purchaseOrderId: relatedPurchaseOrderId,
      supplierId: selectedSupplierId,
      buyerId: store.refId,
      receivedByUserId: user.refId,
      notes: notesController.text.isNotEmpty ? notesController.text : null,
      items: lineItems,
    );

    final success = await purchaseOrdersController.createReceivingNote(request);

    print('success: $success');

    if (success) {
      showSuccessToast(
        context: context,
        message: Intls.to.receivingNoteCreatedSuccessfully,
      );
      resetForm();
      _isSubmitting = false;
      notifyListeners();

      return true;
    }
    showErrorToast(
      context: context,
      message: Intls.to.failedToCreateReceivingNote,
    );
    _isSubmitting = false;
    notifyListeners();

    return false;
  }

  /// Adds a new line item.
  void addLineItem() {
    lineItems.add(ReceivingLineItem());
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
  void updateLineItem(int index, ReceivingLineItem item) {
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

  /// Sets order item selection with product details.
  void setOrderItem(int index, StoreProductWithGlobalProduct item) {
    if (index >= 0 && index < lineItems.length) {
      lineItems[index] = ReceivingLineItem(productId: item.storeProduct.refId);
      notifyListeners();
    }
  }

  /// Sets received date.
  void setReceivedDate(DateTime? date) {
    receivedAt = date ?? clock.now();
    notifyListeners();
  }

  /// Reset form to initial state
  void resetForm() {
    selectedSupplierId = null;
    lineItems.clear();
    notesController.clear();
    _isSubmitting = false;
    notifyListeners();
  }
}
