import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utils/formatters.dart';
import '../../suppliers_controller.dart';

/// Utility class for building supplier table cells.
///
/// Contains static methods to build various types of cells used in the
/// supplier data table, promoting code reuse and consistency.
class SupplierCellBuilders {
  /// Builds supplier cell with name and address.
  static Widget buildSupplierCell(Supplier supplier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          supplier.name,
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        if (supplier.contactAddress.isNotEmpty)
          Row(
            children: [
              const Icon(LucideIcons.mapPin400, size: 12),
              const SizedBox(width: 4),
              Flexible(
                child: Text(
                  supplier.contactAddress,
                  style: TextStyle(fontSize: 12, color: Colors.grey[600]),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ],
          ),
      ],
    );
  }

  /// Builds supplier ID cell.
  static Widget buildSupplierIdCell(Supplier supplier) {
    return Text(
      supplier.refId.substring(0, 10),
      style: const TextStyle(fontFamily: 'monospace', fontSize: 12),
    );
  }

  /// Builds contact info cell with phone and email.
  static Widget buildContactCell(Supplier supplier) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (supplier.contactPhone.isNotEmpty)
          Text(
            supplier.contactPhone,
            style: TextStyle(fontSize: 12, color: Colors.grey[600]),
          ),
        if (supplier.contactEmail.isNotEmpty)
          Row(
            children: [
              const Icon(LucideIcons.mail400, size: 12),
              const SizedBox(width: 4),
              Text(
                supplier.contactEmail,
                style: TextStyle(fontSize: 12, color: Colors.grey[600]),
              ),
            ],
          ),
      ],
    );
  }

  /// Builds products count cell with badge style.
  static Widget buildProductsCell(int productCount) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.blue.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        '$productCount products',
        style: const TextStyle(
          fontSize: 12,
          color: Colors.blue,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Builds total value cell with formatted currency.
  static Widget buildTotalValueCell(
    List<BusinessProduct> supplierProducts,
    SuppliersController controller,
  ) {
    final totalValue = controller.calculateSupplierTotalValue(supplierProducts);

    return Text(
      Formatters.formatCurrency(totalValue),
      style: const TextStyle(fontWeight: FontWeight.w600),
    );
  }

  /// Builds status cell with colored badge.
  static Widget buildStatusCell(Supplier supplier) {
    final intl = AppInternationalizationService.to;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: supplier.isActive
            ? AppColors.dartGreen.withValues(alpha: 0.1)
            : AppColors.red.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        supplier.isActive ? intl.activeText : intl.inactiveText,
        style: TextStyle(
          fontSize: 12,
          color: supplier.isActive ? AppColors.dartGreen : AppColors.red,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  /// Builds notes cell.
  static Widget buildNotesCell(Supplier supplier) {
    return Text(
      supplier.description.isNotEmpty ? supplier.description : '/',
      style: TextStyle(fontSize: 12, color: Colors.grey[600]),
    );
  }

  /// Builds actions cell with edit and delete buttons.
  static Widget buildActionsCell({
    required VoidCallback onEdit,
    required VoidCallback onDelete,
  }) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: const Icon(LucideIcons.squarePen400, size: 16),
          onPressed: onEdit,
        ),
        IconButton(
          icon: const Icon(LucideIcons.trash2400, size: 16),
          onPressed: onDelete,
        ),
      ],
    );
  }
}
