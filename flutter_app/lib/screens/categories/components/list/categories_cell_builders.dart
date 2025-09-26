import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utils/extensions/category_extension.dart';

/// Utility class for building supplier table cells.
///
/// Contains static methods to build various types of cells used in the
/// supplier data table, promoting code reuse and consistency.
class CategoryCellBuilders {
  /// Builds supplier cell with name and address.
  static Widget buildCategoryLabelCell(Category category, ShadThemeData theme) {
    return Text(
      category.label,
      style: theme.textTheme.p.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14,
      ),
    );
  }

  /// Builds supplier ID cell.
  static Widget buildCategoryIdCell(Category category, ShadThemeData theme) {
    return Text(
      category.refId.substring(0, 10),
      style: theme.textTheme.muted.copyWith(fontSize: 12),
    );
  }

  /// Builds status cell with colored badge.
  static Widget buildStatusCell(Category category) {
    final intl = AppInternationalizationService.to;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: category.status == CategoryStatus.CATEGORY_STATUS_ACTIVE
            ? AppColors.dartGreen.withValues(alpha: 0.1)
            : AppColors.red.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        category.status == CategoryStatus.CATEGORY_STATUS_ACTIVE
            ? intl.activeText
            : intl.inactiveText,
        style: TextStyle(
          fontSize: 12,
          color: category.status == CategoryStatus.CATEGORY_STATUS_ACTIVE
              ? AppColors.dartGreen
              : AppColors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Builds type cell with colored badge.
  static Widget buildTypeCell(Category category, ShadThemeData theme) {
    return Text(
      category.typeLabel,
      style: theme.textTheme.p.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 14,
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
