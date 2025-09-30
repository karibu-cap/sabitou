import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/responsive_utils.dart';
import '../inventory_controller.dart';

/// The inventory header
class InventoryHeader extends StatelessWidget {
  /// Constructs of new [InventoryHeader].
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);

    void _showProductDialog(BuildContext context, Product? product) async {
      final controller = context.read<InventoryController>();

      // showShadDialog<bool?>(
      //   context: context,
      //   builder: (context) => CreateEditProductFormView(
      //     product: product?.globalProduct,
      //     inventoryController: controller,
      //   ),
      // );
    }

    Future<void> _showRestockDialog(BuildContext context) async {
      final controller = context.read<InventoryController>();
      if (context.mounted) {
        // final result = await showShadDialog<bool?>(
        //   context: context,
        //   builder: (context) =>
        //       RestockProductForm(inventoryController: controller),
        // );

        // if (result == true) {
        //   await controller.refreshProducts();
        // }
      }
    }

    Future<void> _showAdjustmentDialog(BuildContext context) async {
      final controller = context.read<InventoryController>();
      if (context.mounted) {
        // final result = await showShadDialog<bool?>(
        //   context: context,
        //   builder: (context) => AdjustmentStockForm(
        //     inventoryController: controller,
        //     product: null,
        //   ),
        // );
        // if (result == true) {
        //   await controller.refreshProducts();
        // }
      }
    }

    return Flex(
      direction: isDesktop ? Axis.horizontal : Axis.vertical,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: isDesktop
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(Intls.to.inventoryManagement, style: theme.textTheme.h4),
            const SizedBox(height: 4),
            Text(
              Intls.to.inventoryManagementDescription,
              style: theme.textTheme.muted,
            ),
          ],
        ),
        if (!isDesktop) const SizedBox(height: 16),
        Wrap(
          runSpacing: 8,
          children: [
            ShadButton(
              onPressed: () => _showProductDialog(context, null),
              leading: const Icon(LucideIcons.plus, size: 16),
              child: Text(Intls.to.addProduct),
            ),
            const SizedBox(width: 8),
            ShadButton.outline(
              onPressed: () => _showRestockDialog(context),
              leading: const Icon(LucideIcons.packagePlus400, size: 16),
              child: Text(Intls.to.restock),
            ),
            const SizedBox(width: 8),
            ShadButton.outline(
              onPressed: () => _showAdjustmentDialog(context),
              leading: const Icon(LucideIcons.pencil400, size: 16),
              child: Text(Intls.to.adjustStock),
            ),
          ],
        ),
      ],
    );
  }
}
