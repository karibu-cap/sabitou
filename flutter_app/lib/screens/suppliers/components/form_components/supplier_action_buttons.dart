import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../suppliers_controller.dart';

/// Action buttons widget for supplier form.
class SupplierActionButtons extends StatelessWidget {
  /// The supplier being edited, null for new supplier creation.
  final Supplier? supplier;

  /// Callback function executed when the save button is pressed.
  final VoidCallback onSave;

  /// Callback function executed when the cancel button is pressed.
  final VoidCallback onCancel;

  /// Creates a new [SupplierActionButtons] widget.
  const SupplierActionButtons({
    super.key,
    required this.supplier,
    required this.onSave,
    required this.onCancel,
  });

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<SuppliersController>(context);

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ShadButton.outline(onPressed: onCancel, child: Text(intl.cancel)),

        const SizedBox(width: 12),
        ShadButton(
          onPressed: controller.isFormLoading ? null : onSave,

          child: controller.isFormLoading
              ? const SizedBox(
                  width: 16,
                  height: 16,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                  ),
                )
              : Text(
                  supplier == null ? intl.addNewSupplier : intl.updateSupplier,
                ),
        ),
      ],
    );
  }
}
