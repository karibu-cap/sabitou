import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../widgets/pop_up/add_category/add_category_view.dart';
import '../../suppliers_controller.dart';

/// Widget displayed when there are no supplier to show.
///
/// Provides different messages for empty state vs filtered results,
/// with appropriate actions for each scenario.
class SuppliersEmptyState extends StatelessWidget {
  /// Creates a new [SuppliersEmptyState].
  const SuppliersEmptyState({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Icon(
            controller.isFiltered ? LucideIcons.truck400 : Icons.category,
            size: 64,
            color: Colors.grey[400],
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            controller.isFiltered
                ? AppInternationalizationService.to.noSuppliersMatchFilters
                : AppInternationalizationService.to.noSuppliersYet,
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
                : AppInternationalizationService.to.addFirstSupplier,
            style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Action button
          if (!controller.isFiltered) ...[
            ShadButton(
              onPressed: () => showAddCategoryDialog(context),
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
