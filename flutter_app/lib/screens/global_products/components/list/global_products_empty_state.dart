import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../global_products_controller.dart';
import '../dialogs/add_global_product/add_global_product_view.dart';

/// Widget displayed when there are no products to show.
///
/// Provides different messages for empty state vs filtered results,
/// with appropriate actions for each scenario.
class GlobalProductsEmptyState extends StatelessWidget {
  /// Creates a new [GlobalProductsEmptyState].
  const GlobalProductsEmptyState({super.key});

  void _showAddGlobalProductDialog(
    BuildContext context,
    GlobalProductsController controller,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) => ChangeNotifierProvider.value(
        value: controller,
        child: ShadDialog(
          child: GlobalProductFormDialog(globalProductsController: controller),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GlobalProductsController>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Icon(
            controller.isFiltered ? LucideIcons.searchX : LucideIcons.package,
            size: 64,
            color: Colors.grey[400],
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            controller.isFiltered
                ? AppInternationalizationService.to.noProductsMatchFilters
                : AppInternationalizationService.to.noProductsYet,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            controller.isFiltered
                ? AppInternationalizationService.to.tryAdjustingFilters
                : AppInternationalizationService.to.addFirstProduct,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Action button
          if (!controller.isFiltered) ...[
            ShadButton(
              onPressed: () => _showAddGlobalProductDialog(context, controller),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(LucideIcons.userPlus, size: 16),
                  const SizedBox(width: 8),
                  Text(AppInternationalizationService.to.addCategory),
                ],
              ),
            ),
          ] else ...[
            ShadButton.outline(
              onPressed: controller.clearFilters,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(LucideIcons.x, size: 16),
                  const SizedBox(width: 8),
                  Text(AppInternationalizationService.to.clearFilters),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}
