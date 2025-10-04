import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../widgets/custom_shad_button.dart';
import '../purchase_orders_controller.dart';

/// CancelOrderForm is a form to cancel a purchase order.
final class CancelOrderForm extends StatelessWidget {
  /// The purchase order to cancel.
  final PurchaseOrder order;

  /// The purchase orders controller.
  final PurchaseOrdersController controller;

  /// Constructs a new [CancelOrderForm].
  const CancelOrderForm({
    super.key,
    required this.order,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final TextEditingController _reasonController = TextEditingController();
    final _formKey = GlobalKey<ShadFormState>();

    Future<void> _cancelOrder() async {
      if (!(_formKey.currentState?.saveAndValidate() ?? false)) {
        return;
      }

      final success = await controller.cancelPurchaseOrder(
        order.documentId,
        _reasonController.text.trim(),
      );

      if (success) {
        showSuccessToast(
          context: context,
          message: Intls.to.purchaseOrderCancelledSuccessfully,
        );
        Navigator.of(context).pop();
      } else {
        showErrorToast(
          context: context,
          message: Intls.to.failedToCancelPurchaseOrder,
        );
      }
    }

    return ShadDialog(
      title: Text(Intls.to.cancelPurchaseOrder),
      child: ShadForm(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              Intls.to.cancelOrderConfirmation.trParams({
                'order': order.documentId,
              }),
            ),
            const SizedBox(height: 16),
            ShadTextareaFormField(
              id: 'reason',
              controller: _reasonController,
              label: Text(Intls.to.reasonForCancellation),
              validator: (value) {
                if (value.isEmpty) {
                  return Intls.to.reasonForCancellation;
                }

                return null;
              },
            ),
            const SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                ShadButton.outline(
                  onPressed: () => Navigator.of(context).pop(),
                  child: Text(Intls.to.noKeepOrder),
                ),
                const SizedBox(width: 12),
                CustomShadButton(
                  buttonType: ShadButtonVariant.destructive,
                  onPressed: _cancelOrder,
                  text: Intls.to.clearOrder,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
