import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../categories_controller.dart';
import 'list/categories_shimmer_widgets.dart';

/// Grid component for displaying category statistics.
class CategoriesStatsGrid extends StatelessWidget {
  /// Constructs a new CategoriesStatsGrid.
  const CategoriesStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<CategoriesController>(
      context,
      listen: false,
    );
    final intl = AppInternationalizationService.to;

    return StreamBuilder<List<Category>>(
      stream: controller.categoriesStream,
      builder: (context, categoriesSnapshot) {
        if (categoriesSnapshot.connectionState == ConnectionState.waiting) {
          return CategorieShimmerWidgets.buildStatsShimmer();
        }

        final categories = categoriesSnapshot.data ?? [];

        final stats = controller.calculateCategoryStats(categories);

        final statsCards = [
          StatCard(
            title: intl.totalCategories,
            value: stats.total.toString(),
            icon: LucideIcons.building400,
            color: AppColors.cobalt,
          ),
          StatCard(
            title: intl.inactiveCategories,
            value: stats.inactive.toString(),
            icon: LucideIcons.trendingUp400,
            color: AppColors.purple,
          ),
          StatCard(
            title: intl.activeCategories,
            value: stats.active.toString(),
            icon: LucideIcons.package400,
            color: AppColors.dartGreen,
          ),
        ];

        return CustomGrid(
          children: statsCards,
          minItemWidth: 250,
          mainAxisExtent: 100,
          crossSpacing: 20,
        );
      },
    );
  }
}
