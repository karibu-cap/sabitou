import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/responsive_utils.dart';
import '../inventory_controller.dart';
import 'create_edit_product_form_view.dart';

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

      final result = await showShadDialog<bool?>(
        context: context,
        builder: (context) => CreateEditProductFormView(
          product: product,
          inventoryController: controller,
        ),
      );
      if (result == true) {
        await controller.refreshProducts();
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
        FutureBuilder(
          future: hasPermission(
            ResourceType.RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_ADD,
          ),
          builder: (context, snapshot) {
            final canAdd = snapshot.data ?? false;
            if (!canAdd) {
              return const SizedBox.shrink();
            }

            return ShadButton(
              onPressed: () => _showProductDialog(context, null),
              leading: const Icon(LucideIcons.plus, size: 16),
              child: Text(Intls.to.addProduct),
            );
          },
        ),
      ],
    );
  }
}
