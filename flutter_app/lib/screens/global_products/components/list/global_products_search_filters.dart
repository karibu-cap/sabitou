import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../global_products_controller.dart';

/// Widget for search and filtering functionality in the global products list.
class GlobalProductsSearchFilters extends StatelessWidget {
  /// Constructs a new [GlobalProductsSearchFilters].
  const GlobalProductsSearchFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GlobalProductsController>(context);
    final theme = ShadTheme.of(context);

    final commonStyle = theme.textTheme.muted.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String getStatusLabel(GlobalProductStatus status) {
      switch (status) {
        case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE:
          return AppInternationalizationService.to.active;
        case GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE:
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
                AppInternationalizationService.to.searchProducts,
              ),
              trailing: const Icon(LucideIcons.search, size: 16),
              onChanged: (value) => controller.searchQuery.add(value),
            ),
          ),

          // Status filter dropdown
          ShadSelect<GlobalProductStatus>(
            controller: controller.statusFilterController,
            placeholder: Text(
              AppInternationalizationService.to.allStatus,
              style: commonStyle,
            ),
            options: [
              ShadOption(
                value: GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE,
                child: Text(
                  AppInternationalizationService.to.active,
                  style: commonStyle,
                ),
              ),
              ShadOption(
                value: GlobalProductStatus.GLOBAL_PRODUCT_STATUS_INACTIVE,
                child: Text(
                  AppInternationalizationService.to.inactive,
                  style: commonStyle,
                ),
              ),
            ],
            selectedOptionBuilder: (context, value) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [Text(getStatusLabel(value), style: commonStyle)],
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
