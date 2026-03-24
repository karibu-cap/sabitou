import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../widgets/pop_up/add_supplier/add_supplier_view.dart';
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
    final theme = ShadTheme.of(context);

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(48),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Icon
          Icon(
            controller.isFiltered ? LucideIcons.truck : LucideIcons.store,
            size: 48,
            color: theme.colorScheme.mutedForeground,
          ),

          const SizedBox(height: 16),

          // Title
          Text(
            controller.isFiltered
                ? AppInternationalizationService.to.noSuppliersMatchFilters
                : AppInternationalizationService.to.noSuppliersYet,
            style: theme.textTheme.h4,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Description
          Text(
            controller.isFiltered
                ? AppInternationalizationService.to.tryAdjustingFilters
                : AppInternationalizationService.to.addFirstSupplier,
            style: theme.textTheme.muted,
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 24),

          // Action button
          if (!controller.isFiltered) ...[
            ShadButton(
              onPressed: () => showAddSupplierDialog(context),
              leading: const Icon(LucideIcons.userPlus, size: 16),
              child: Text(AppInternationalizationService.to.addSupplier),
            ),
          ] else ...[
            ShadButton.outline(
              onPressed: controller.clearFilters,
              leading: const Icon(LucideIcons.x, size: 16),
              child: Text(AppInternationalizationService.to.clearFilters),
            ),
          ],
        ],
      ),
    );
  }
}
