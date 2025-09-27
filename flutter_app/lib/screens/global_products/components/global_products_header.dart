import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/responsive_utils.dart';
import '../global_products_controller.dart';
import 'dialogs/add_global_product/add_global_product_view.dart';

/// Header widget for categories view.
class GlobalProductsHeader extends StatelessWidget {
  /// Construts a new CategoriesHeader.
  const GlobalProductsHeader({super.key});

  /// Show category dialog for adding or editing
  void _showCategoryDialog(
    BuildContext context,
    GlobalProductsController controller,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) =>
          ChangeNotifierProvider<GlobalProductsController>(
            create: (_) => controller,
            child: ShadDialog(
              child: GlobalProductFormDialog(
                globalProductsController: controller,
              ),
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    final controller = Provider.of<GlobalProductsController>(context);

    return Flex(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppInternationalizationService.to.globalProductsManagement,
              style: theme.textTheme.h4,
            ),
            const SizedBox(height: 4),
            Text(
              AppInternationalizationService.to.manageGlobalProducts,
              style: theme.textTheme.muted,
            ),
          ],
        ),
        ShadButton(
          onPressed: () => _showCategoryDialog(context, controller),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.add, size: 16),
              const SizedBox(width: 8),
              Text(AppInternationalizationService.to.addProduct),
            ],
          ),
        ),
      ],
    );
  }
}
