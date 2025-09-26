import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/stat_card.dart';
import '../sales_controller.dart';

/// Inventory stats widget.
final class InventoryStats extends StatelessWidget {
  /// Constructs of new [InventoryStats].
  const InventoryStats({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<SalesController>();

    final orders = controller.ordersStream.valueOrNull;

    if (orders == null) {
      return const Loading();
    }

    final stats = [
      StatCard(
        title: Intls.to.totalSales,
        value: orders.length.toString(),
        icon: LucideIcons.trendingUp400,
        color: AppColors.lightGreen,
        change: Intls.to.transactionsCompleted,
        trend: TrendType.up,
      ),
      StatCard(
        title: Intls.to.totalRevenue,
        value: Formatters.formatCurrency(
          orders
                  .where((p) => p.status == OrderStatus.ORDER_STATUS_COMPLETED)
                  .fold(0, (sum, p) => (sum ?? 0) + p.orderPrices.grandTotal) ??
              0,
        ),
        icon: LucideIcons.dollarSign400,
        color: AppColors.cobalt,
        trend: TrendType.neutral,
        change: Intls.to.totalEarnings,
      ),
      StatCard(
        title: Intls.to.itemSold,
        value:
            '${orders.where((p) => p.status == OrderStatus.ORDER_STATUS_COMPLETED).fold(0, (sum, p) => sum + p.orderItems.map((e) => e.quantity).fold(0, (sum, p) => sum + p))}',
        icon: LucideIcons.package400,
        color: AppColors.red,
        trend: TrendType.down,
        change: Intls.to.totalQuantity,
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
