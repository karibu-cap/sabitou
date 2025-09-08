import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../widgets/toast/toast.dart';
import '../../suppliers_controller.dart';

/// Delete confirmation dialog for suppliers.
class SupplierDeleteDialog extends StatelessWidget {
  /// The supplier to be deleted.
  final Supplier supplier;

  /// Number of products associated with this supplier.
  final int productCount;

  /// Creates a new [SupplierDeleteDialog].
  const SupplierDeleteDialog({
    super.key,
    required this.supplier,
    required this.productCount,
  });

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

          // Show warning if supplier has products
          if (productCount > 0) ...[
            const SizedBox(height: 12),
            _WarningContainer(productCount: productCount),
            const SizedBox(height: 16),
          ] else ...[
            const SizedBox(height: 16),
          ],

          // Action buttons
          _DialogActions(
            supplier: supplier,
            productCount: productCount,
            controller: controller,
          ),
        ],
      ),
    );
  }
}

/// Warning container for suppliers with products.
class _WarningContainer extends StatelessWidget {
  /// Number of products associated with the supplier.
  final int productCount;

  const _WarningContainer({required this.productCount});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.orange.withValues(alpha: 0.1),
        border: Border.all(color: Colors.orange.withValues(alpha: 0.3)),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          const Icon(
            LucideIcons.triangleAlert400,
            color: Colors.orange,
            size: 16,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              intl.warningSupplierHasProducts.replaceAll(
                '@count',
                productCount.toString(),
              ),
              style: const TextStyle(fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}

/// Dialog action buttons for delete confirmation.
class _DialogActions extends StatelessWidget {
  /// The supplier to be deleted.
  final Supplier supplier;

  /// Number of products associated with this supplier.
  final int productCount;

  /// The suppliers controller.
  final SuppliersController controller;

  const _DialogActions({
    required this.supplier,
    required this.productCount,
    required this.controller,
  });

  /// Performs the supplier deletion.
  Future<void> _deleteSupplier(BuildContext context) async {
    final intl = AppInternationalizationService.to;
    final success = await controller.deleteSupplier(supplier.refId);

    if (context.mounted) {
      Navigator.of(context).pop();

      if (success) {
        Toast.showSuccessToast(
          context,
          intl.successText,
          intl.supplierDeletedSuccessfully,
        );
      } else {
        Toast.showErrorToast(context, intl.errorText, controller.errorMessage);
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
          onPressed: productCount > 0 ? null : () => _deleteSupplier(context),
          child: Text(intl.deleteSupplierBtn),
        ),
      ],
    );
  }
}
