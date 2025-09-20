import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../transactions_controller.dart';

/// The transactions stats.
class TransactionsStats extends StatelessWidget {
  /// Constructor of [TransactionsStats].
  const TransactionsStats({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<TransactionsController>();

    return CustomGrid(
      minItemWidth: 250,
      mainAxisExtent: 100,
      crossSpacing: 20,
      children: [
        StatCard(
          title: Intls.to.totalSales,
          value: Formatters.formatCurrency(
            controller.calculateTransactionMetrics().totalSales,
          ),
          icon: LucideIcons.trendingUp,
          color: AppColors.dartGreen,
        ),
        StatCard(
          title: Intls.to.totalRefunds,
          value: Formatters.formatCurrency(
            controller.calculateTransactionMetrics().totalRefunds,
          ),
          icon: LucideIcons.trendingDown,
          color: AppColors.error500,
        ),
        StatCard(
          title: Intls.to.netRevenue,
          value: Formatters.formatCurrency(
            controller.calculateTransactionMetrics().netRevenue,
          ),
          icon: LucideIcons.dollarSign,
          color: AppColors.darkRing,
        ),
        StatCard(
          title: Intls.to.pendingTransactions,
          value: controller
              .calculateTransactionMetrics()
              .pendingTransactions
              .toString(),
          icon: LucideIcons.receipt400,
          color: AppColors.warning500,
        ),
      ],
    );
  }
}
