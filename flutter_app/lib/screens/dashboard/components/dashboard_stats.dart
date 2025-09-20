import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../dashboard_controller.dart';

/// Dashboard statistics widget that displays key metrics in a grid layout.
class DashboardStats extends StatelessWidget {
  /// Constructor of new [DashboardStats].
  const DashboardStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, child) {
        if (controller.error.isNotEmpty) {
          return Text('Error: ${controller.error}');
        }

        final statsData = controller.stats;
        final yesterdayTransactions = statsData.yesterdayTransactions;
        final yesterdaySales = statsData.yesterdaySales;
        final todayTransactions = statsData.transactions;
        final todaySales = statsData.todaySales;
        final percentChangeSales = controller.calculatePercentChange(
          todaySales,
          yesterdaySales,
        );
        final percentChangeTransactions = controller.calculatePercentChange(
          todayTransactions.length,
          yesterdayTransactions.length,
        );

        final statsCard = [
          StatCard(
            title: Intls.to.totalProducts,
            value: statsData.totalProducts.toString(),
            icon: LucideIcons.package400,
            color: AppColors.cobalt,
            trend: TrendType.neutral,
          ),
          StatCard(
            title: Intls.to.lowStockItems,
            value: statsData.lowStockItems.toString(),
            icon: LucideIcons.triangleAlert400,
            color: AppColors.red,
            change: statsData.lowStockItems > 0
                ? Intls.to.requiresAttention
                : Intls.to.allGood,
            trend: statsData.lowStockItems > 0
                ? TrendType.down
                : TrendType.neutral,
          ),
          StatCard(
            title: Intls.to.expiringSoon,
            value: statsData.expiringItems.toString(),
            icon: LucideIcons.calendar400,
            color: AppColors.warningColor,
            change: Intls.to.next2months,
            trend: TrendType.neutral,
          ),
          StatCard(
            title: Intls.to.todaySales,
            value: Formatters.formatCurrency(statsData.todaySales),
            icon: LucideIcons.wallet400,
            color: AppColors.lightGreen,
            change: switch (percentChangeSales) {
              0 => null,
              _ =>
                '${percentChangeSales > 0 ? '+' : '-'}$percentChangeSales% ${Intls.to.fromYesterday}',
            },
            trend: switch (percentChangeSales) {
              0 => TrendType.neutral,
              _ => percentChangeSales > 0 ? TrendType.up : TrendType.down,
            },
          ),
          StatCard(
            title: Intls.to.todayTransactions,
            value: statsData.todayTransactions.toString(),
            icon: LucideIcons.shoppingCart400,
            color: AppColors.purple,
            change: switch (percentChangeTransactions) {
              0 => null,
              _ =>
                '${percentChangeTransactions > 0 ? '+' : '-'}$percentChangeTransactions% ${Intls.to.fromYesterday}',
            },
            trend: switch (percentChangeTransactions) {
              0 => TrendType.neutral,
              _ =>
                percentChangeTransactions > 0 ? TrendType.up : TrendType.down,
            },
          ),
        ];

        return CustomGrid(
          children: statsCard,
          minItemWidth: 250,
          mainAxisExtent: 100,
          crossSpacing: 20,
        );
      },
    );
  }
}
