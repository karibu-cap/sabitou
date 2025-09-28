import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../suppliers_controller.dart';

/// Widget for search and filtering functionality in the categories list.
class SuppliersSearchFilters extends StatelessWidget {
  /// Constructs a new [SuppliersSearchFilters].
  const SuppliersSearchFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context);
    final theme = ShadTheme.of(context);

    final communStyle = theme.textTheme.muted.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String getStatusLabel(SupplierStatus status) {
      switch (status) {
        case SupplierStatus.SUPPLIER_STATUS_ACTIVE:
          return AppInternationalizationService.to.active;
        case SupplierStatus.SUPPLIER_STATUS_INACTIVE:
          return AppInternationalizationService.to.inactive;
        default:
          return AppInternationalizationService.to.allStatus;
      }
    }

    return ShadCard(
      child: Row(
        spacing: 16,
        children: [
          // Search input
          Flexible(
            child: ShadInput(
              controller: controller.searchController,
              placeholder: Text(
                AppInternationalizationService.to.searchSuppliers,
              ),
              trailing: const Icon(LucideIcons.search, size: 16),
              onChanged: (value) => controller.searchQuery.add(value),
            ),
          ),

          // Status filter dropdown
          ShadSelect<SupplierStatus>(
            controller: controller.statusFilterController,
            placeholder: Text(
              AppInternationalizationService.to.allStatus,
              style: communStyle,
            ),
            options: [
              ShadOption(
                value: SupplierStatus.SUPPLIER_STATUS_ACTIVE,
                child: Text(
                  AppInternationalizationService.to.active,
                  style: communStyle,
                ),
              ),
              ShadOption(
                value: SupplierStatus.SUPPLIER_STATUS_INACTIVE,
                child: Text(
                  AppInternationalizationService.to.inactive,
                  style: communStyle,
                ),
              ),
            ],
            selectedOptionBuilder: (context, value) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text(getStatusLabel(value), style: communStyle)],
            ),
            allowDeselection: true,
            onChanged: (value) {
              controller.selectedStatus.add(value);
            },
          ),
        ],
      ),
    );
  }
}
