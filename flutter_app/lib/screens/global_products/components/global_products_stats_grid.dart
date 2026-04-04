import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_theme.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../global_products_controller.dart';

/// Grid component for displaying global products statistics.
class GlobalProductsStatsGrid extends StatelessWidget {
  /// List of global products to display stats for.
  final List<GlobalProduct> globalProducts;

  /// Constructs a new GlobalProductsStatsGrid.
  const GlobalProductsStatsGrid({super.key, required this.globalProducts});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );
    final intl = AppInternationalizationService.to;

    final stats = controller.calculateGlobalProductStats(globalProducts);

    final statsCards = [
      StatCard(
        title: intl.totalGlobalProducts,
        value: stats.total.toString(),
        icon: LucideIcons.building400,
        color: SabitouColors.accent,
      ),
      StatCard(
        title: intl.inactiveGlobalProducts,
        value: stats.inactive.toString(),
        icon: LucideIcons.trendingUp400,
        color: SabitouColors.orange,
      ),
      StatCard(
        title: intl.activeGlobalProducts,
        value: stats.active.toString(),
        icon: LucideIcons.package400,
        color: SabitouColors.success,
      ),
    ];

    return CustomGrid(
      children: statsCards,
      minItemWidth: 250,
      mainAxisExtent: 100,
      crossSpacing: 20,
    );
  }
}
