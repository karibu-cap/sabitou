import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../inventory_controller.dart';

/// Inventory stats widget.
final class InventoryStats extends StatelessWidget {
  /// Constructs of new [InventoryStats].
  const InventoryStats({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<InventoryController>();
    final statsData = controller.stats;

    final stats = [
      StatCard(
        title: Intls.to.totalProducts,
        value: statsData.totalProducts.toString(),
        icon: LucideIcons.package400,
        color: AppColors.cobalt,
        trend: TrendType.neutral,
      ),
      StatCard(
        title: Intls.to.totalValue,
        value: Formatters.formatCurrency(statsData.totalSales),
        icon: LucideIcons.package400,
        color: AppColors.lightGreen,
        trend: TrendType.neutral,
      ),
      StatCard(
        title: Intls.to.lowStock,
        value: statsData.lowStockItemsCount.toString(),
        icon: LucideIcons.triangleAlert,
        color: AppColors.warningColor,
        trend: TrendType.neutral,
      ),
      StatCard(
        title: Intls.to.outOfStock,
        value: statsData.inventoryLevels
            .where(
              (p) => p.stockStatus == StockStatus.STOCK_STATUS_OUT_OF_STOCK,
            )
            .length
            .toString(),
        icon: LucideIcons.triangleAlert,
        color: AppColors.red,
        trend: TrendType.down,
      ),
    ];

    return CustomGrid(
      children: stats,
      minItemWidth: 250,
      mainAxisExtent: 100,
      crossSpacing: 20,
    );
  }
}
