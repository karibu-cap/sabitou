import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/common_functions.dart';
import '../../suppliers_controller.dart';

/// Delete confirmation dialog for suppliers.
class SupplierDeleteDialog extends StatelessWidget {
  /// The supplier to be deleted.
  final Supplier supplier;

  /// Creates a new [SupplierDeleteDialog].
  const SupplierDeleteDialog({super.key, required this.supplier});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<SuppliersController>(context, listen: false);

    return ShadDialog(
      title: Text(intl.deleteSupplierBtn),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(intl.deleteSupplierConfirm),

          // Action buttons
          _DialogActions(supplier: supplier, controller: controller),
        ],
      ),
    );
  }
}

/// Dialog action buttons for delete confirmation.
class _DialogActions extends StatelessWidget {
  /// The supplier to be deleted.
  final Supplier supplier;

  /// The suppliers controller.
  final SuppliersController controller;

  const _DialogActions({required this.supplier, required this.controller});

  /// Performs the supplier deletion.
  Future<void> _deleteSupplier(BuildContext context) async {
    final intl = AppInternationalizationService.to;
    final success = await controller.deleteSupplier(supplier.refId);

    if (context.mounted) {
      Navigator.of(context).pop();

      if (success) {
        showSuccessToast(
          context: context,
          title: intl.successText,
          message: intl.supplierDeletedSuccessfully,
        );
      } else {
        showErrorToast(
          context: context,
          title: intl.errorText,
          message: controller.errorMessage,
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Cancel button
        ShadButton.outline(
          onPressed: () => Navigator.of(context).pop(),
          child: Text(intl.cancel),
        ),

        const SizedBox(width: 12),

        // Delete button (disabled if supplier has products)
        ShadButton.destructive(
          onPressed: () => _deleteSupplier(context),
          child: Text(intl.deleteSupplierBtn),
        ),
      ],
    );
  }
}
