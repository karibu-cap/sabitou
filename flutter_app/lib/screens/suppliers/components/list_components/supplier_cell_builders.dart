import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';

/// Utility class for building supplier table cells.
///
/// Contains static methods to build various types of cells used in the
/// supplier data table, promoting code reuse and consistency.
class SupplierCellBuilders {
  /// Builds supplier cell with name and address.
  static Widget buildSupplierCell(Supplier supplier, ShadThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          supplier.name,
          style: theme.textTheme.small.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.foreground,
          ),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (supplier.contactAddress.isNotEmpty)
          Row(
            children: [
              const Icon(LucideIcons.mapPin400, size: 12),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  supplier.contactAddress,
                  overflow: TextOverflow.ellipsis,
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
              ),
            ],
          ),
      ],
    );
  }

  /// Builds supplier ID cell.
  static Widget buildSupplierIdCell(Supplier supplier, ShadThemeData theme) {
    return Text(
      supplier.refId.substring(0, 10),
      style: theme.textTheme.muted.copyWith(fontSize: 12),
    );
  }

  /// Builds contact info cell with phone and email.
  static Widget buildContactCell(Supplier supplier, ShadThemeData theme) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (supplier.contactPhone.isNotEmpty)
          Row(
            children: [
              const Icon(LucideIcons.phone400, size: 12),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  supplier.contactPhone,
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
        if (supplier.contactEmail.isNotEmpty)
          Row(
            children: [
              const Icon(LucideIcons.mail400, size: 12),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  supplier.contactEmail,
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
      ],
    );
  }

  /// Builds status cell with colored badge.
  static Widget buildStatusCell(Supplier supplier) {
    final intl = AppInternationalizationService.to;

    return ShadBadge(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      backgroundColor: supplier.status == SupplierStatus.SUPPLIER_STATUS_ACTIVE
          ? AppColors.dartGreen.withValues(alpha: 0.1)
          : AppColors.red.withValues(alpha: 0.1),
      foregroundColor: supplier.status == SupplierStatus.SUPPLIER_STATUS_ACTIVE
          ? AppColors.dartGreen
          : AppColors.red,

      child: Text(
        supplier.status == SupplierStatus.SUPPLIER_STATUS_ACTIVE
            ? intl.activeText
            : intl.inactiveText,
      ),
    );
  }

  /// Builds notes cell.
  static Widget buildNotesCell(Supplier supplier, ShadThemeData theme) {
    return Text(
      supplier.description.isNotEmpty ? supplier.description : '/',
      style: theme.textTheme.muted.copyWith(fontSize: 12),
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
      spacing: 8,
      children: [
        Expanded(
          child: ShadIconButton.ghost(
            icon: Icon(
              LucideIcons.squarePen400,
              size: 16,
              color: theme.colorScheme.primary,
            ),
            onPressed: onEdit,
          ),
        ),
        Expanded(
          child: ShadIconButton.ghost(
            icon: Icon(
              LucideIcons.trash2400,
              size: 16,
              color: theme.colorScheme.destructive,
            ),
            onPressed: onDelete,
          ),
        ),
      ],
    );
  }
}
