import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';

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
              Icon(
                LucideIcons.mapPin,
                size: 12,
                color: theme.colorScheme.mutedForeground,
              ),
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
              Icon(
                LucideIcons.phone,
                size: 12,
                color: theme.colorScheme.mutedForeground,
              ),
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
              Icon(
                LucideIcons.mail,
                size: 12,
                color: theme.colorScheme.mutedForeground,
              ),
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
  static Widget buildStatusCell(Supplier supplier, ShadThemeData theme) {
    final intl = AppInternationalizationService.to;

    final isActive = supplier.status == SupplierStatus.SUPPLIER_STATUS_ACTIVE;

    return ShadBadge(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      backgroundColor: isActive
          ? theme.colorScheme.primary.withValues(alpha: 0.1)
          : theme.colorScheme.destructive.withValues(alpha: 0.1),
      foregroundColor: isActive
          ? theme.colorScheme.primary
          : theme.colorScheme.destructive,
      child: Text(isActive ? intl.activeText : intl.inactiveText),
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
        ShadIconButton.ghost(
          icon: Icon(
            LucideIcons.pencil,
            size: 16,
            color: theme.colorScheme.foreground,
          ),
          onPressed: onEdit,
        ),
        ShadIconButton.ghost(
          icon: Icon(
            LucideIcons.trash2,
            size: 16,
            color: theme.colorScheme.destructive,
          ),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
