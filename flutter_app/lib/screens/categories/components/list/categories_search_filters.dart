import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../utils/responsive_utils.dart';
import '../../categories_controller.dart';

/// Widget for search and filtering functionality in the categories list.
class CategoriesSearchFilters extends StatelessWidget {
  /// Constructs a new [CategoriesSearchFilters].
  const CategoriesSearchFilters({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoriesController>(context);
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    final communStyle = theme.textTheme.muted.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 12,
    );

    String getStatusLabel(CategoryStatus status) {
      switch (status) {
        case CategoryStatus.CATEGORY_STATUS_ACTIVE:
          return AppInternationalizationService.to.active;
        case CategoryStatus.CATEGORY_STATUS_INACTIVE:
          return AppInternationalizationService.to.inactive;
        default:
          return AppInternationalizationService.to.allStatus;
      }
    }

    String getTypeLabel(CategoryType type) {
      switch (type) {
        case CategoryType.CATEGORY_TYPE_BUSINESS:
          return AppInternationalizationService.to.business;
        case CategoryType.CATEGORY_TYPE_PRODUCT:
          return AppInternationalizationService.to.product;
        case CategoryType.CATEGORY_TYPE_STORE:
          return AppInternationalizationService.to.store;
        default:
          return AppInternationalizationService.to.allTypes;
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
                AppInternationalizationService.to.searchCategories,
              ),
              trailing: const Icon(LucideIcons.search, size: 16),
              onChanged: (value) => controller.searchQuery.add(value),
            ),
          ),

          // Status filter dropdown
          ShadSelect<CategoryStatus>(
            controller: controller.statusFilterController,
            placeholder: Text(
              AppInternationalizationService.to.allStatus,
              style: communStyle,
            ),
            options: [
              ShadOption(
                value: CategoryStatus.CATEGORY_STATUS_ACTIVE,
                child: Text(
                  AppInternationalizationService.to.active,
                  style: communStyle,
                ),
              ),
              ShadOption(
                value: CategoryStatus.CATEGORY_STATUS_INACTIVE,
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
          // Type filter dropdown
          if (!isMobile)
            ShadSelect<CategoryType>(
              controller: controller.typeFilterController,
              placeholder: Text(
                AppInternationalizationService.to.allTypes,
                style: communStyle,
              ),
              options: [
                ShadOption(
                  value: CategoryType.CATEGORY_TYPE_PRODUCT,
                  child: Text(
                    AppInternationalizationService.to.product,
                    style: communStyle,
                  ),
                ),
                ShadOption(
                  value: CategoryType.CATEGORY_TYPE_BUSINESS,
                  child: Text(
                    AppInternationalizationService.to.business,
                    style: communStyle,
                  ),
                ),
                ShadOption(
                  value: CategoryType.CATEGORY_TYPE_STORE,
                  child: Text(
                    AppInternationalizationService.to.store,
                    style: communStyle,
                  ),
                ),
              ],
              selectedOptionBuilder: (context, value) => Row(
                mainAxisSize: MainAxisSize.min,
                children: [Text(getTypeLabel(value), style: communStyle)],
              ),
              allowDeselection: true,
              onChanged: (value) {
                controller.selectedType.add(value);
              },
            ),
        ],
      ),
    );
  }
}
