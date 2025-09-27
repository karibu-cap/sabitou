import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utils/extensions/category_extension.dart';
import '../../../../utils/extensions/global_product_extension.dart';

/// Utility class for building global product table cells.
///
/// Contains static methods to build various types of cells used in the
/// global product data table, promoting code reuse and consistency.
class GlobalProductCellBuilders {
  /// Builds global product cell with label and about.
  static Widget buildGlobalProductLabelCell(
    GlobalProduct globalProduct,
    ShadThemeData theme,
  ) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Text(
          globalProduct.label,
          style: theme.textTheme.p.copyWith(
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
        Text(
          globalProduct.about,
          style: theme.textTheme.p.copyWith(fontSize: 12),
        ),
      ],
    );
  }

  /// Builds global product ID cell.
  static Widget buildGlobalProductIdCell(
    GlobalProduct globalProduct,
    ShadThemeData theme,
  ) {
    return Text(
      globalProduct.refId.substring(0, 10),
      style: theme.textTheme.muted.copyWith(fontSize: 12),
    );
  }

  /// Builds status cell with colored badge.
  static Widget buildStatusCell(GlobalProduct globalProduct) {
    final intl = AppInternationalizationService.to;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color:
            globalProduct.status ==
                GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE
            ? AppColors.dartGreen.withValues(alpha: 0.1)
            : AppColors.red.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        globalProduct.status == GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE
            ? intl.activeText
            : intl.inactiveText,
        style: TextStyle(
          fontSize: 12,
          color:
              globalProduct.status ==
                  GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE
              ? AppColors.dartGreen
              : AppColors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Builds a category cell listing all related categories.
  static Widget buildCategoryCell(
    GlobalProduct globalProduct,
    ShadThemeData theme,
  ) {
    final categoryLabels = globalProduct.categories
        .map((category) => category.label.trim())
        .where((label) => label.isNotEmpty)
        .toSet()
        .toList();

    if (categoryLabels.isEmpty) {
      return Text(
        AppInternationalizationService.to.noCategoriesYet,
        style: theme.textTheme.p.copyWith(
          fontStyle: FontStyle.italic,
          color: theme.colorScheme.muted,
        ),
      );
    }

    return ConstrainedBox(
      constraints: const BoxConstraints(maxWidth: 320),
      child: Wrap(
        spacing: 6,
        runSpacing: 6,
        children: categoryLabels
            .map(
              (label) => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary.withValues(alpha: 0.12),
                  borderRadius: const BorderRadius.all(Radius.circular(999)),
                  border: Border.all(
                    color: theme.colorScheme.primary.withValues(alpha: 0.2),
                  ),
                ),
                child: Text(
                  label,
                  style: theme.textTheme.p.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: theme.colorScheme.primary,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }

  /// Builds actions cell with edit and delete buttons.
  static Widget buildActionsCell({
    required VoidCallback onEdit,
    required VoidCallback onDelete,
    required ShadThemeData theme,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: Icon(
            LucideIcons.squarePen400,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          onPressed: onEdit,
        ),
        IconButton(
          icon: Icon(
            LucideIcons.trash2400,
            size: 16,
            color: theme.colorScheme.primary,
          ),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
