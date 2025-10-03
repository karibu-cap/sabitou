import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/responsive_utils.dart';

/// The inventory header
class InventoryHeader extends StatelessWidget {
  /// Constructs of new [InventoryHeader].
  const InventoryHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = ResponsiveUtils.isDesktop(context);
    final theme = ShadTheme.of(context);

    // Future<void> _showAdjustmentDialog(BuildContext context) async {
    //   final controller = context.read<InventoryController>();
    //   if (context.mounted) {
    //     final result = await showShadDialog<bool?>(
    //       context: context,
    //       builder: (context) => AdjustmentStockForm(
    //         inventoryController: controller,
    //         product: null,
    //       ),
    //     );
    //     if (result == true) {
    //       await controller.refreshProducts();
    //     }
    //   }
    // }

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
              // onPressed: () => _showAdjustmentDialog(context),
              leading: const Icon(LucideIcons.pencil400, size: 16),
              child: Text(Intls.to.adjustStock),
            ),
          ],
        ),
      ],
    );
  }
}
