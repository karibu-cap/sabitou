import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../global_products_controller.dart';
import 'list/global_products_shimmer_widgets.dart';

/// Grid component for displaying global products statistics.
class GlobalProductsStatsGrid extends StatelessWidget {
  /// Constructs a new GlobalProductsStatsGrid.
  const GlobalProductsStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );
    final intl = AppInternationalizationService.to;

    return StreamBuilder<List<GlobalProduct>>(
      stream: controller.globalProductsStream,
      builder: (context, globalProductsSnapshot) {
        if (globalProductsSnapshot.connectionState == ConnectionState.waiting) {
          return GlobalProductsShimmerWidgets.buildStatsShimmer();
        }

        final globalProducts = globalProductsSnapshot.data ?? [];

        final stats = controller.calculateGlobalProductStats(globalProducts);

        final statsCards = [
          StatCard(
            title: intl.totalGlobalProducts,
            value: stats.total.toString(),
            icon: LucideIcons.building400,
            color: AppColors.cobalt,
          ),
          StatCard(
            title: intl.inactiveGlobalProducts,
            value: stats.inactive.toString(),
            icon: LucideIcons.trendingUp400,
            color: AppColors.purple,
          ),
          StatCard(
            title: intl.activeGlobalProducts,
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
