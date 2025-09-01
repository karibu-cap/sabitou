import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../dashboard_controller.dart';
import 'alert_card.dart';

/// Widget that displays recent transaction activities.
class RecentActivity extends GetView<DashboardController> {
  /// Constructors of new [RecentActivity].
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Loading();
      }
      if (controller.error.value.isNotEmpty) {
        return const SizedBox.shrink();
      }

      final limitedTransactions = controller.stats.value.transactions
          .take(10)
          .toList();

      return AlertCard(
        title: Intls.to.recentActivity,
        icon: LucideIcons.activity400,
        iconColor: AppColors.cobalt,
        child: limitedTransactions.isEmpty
            ? Center(
                child: Padding(
                  padding: const EdgeInsets.all(32),
                  child: Text(
                    Intls.to.noRecentActivity,
                    style: ShadTheme.of(context).textTheme.muted,
                  ),
                ),
              )
            : Column(
                children: limitedTransactions.map((transaction) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 16),
                    child: _TransactionItem(transaction: transaction),
                  );
                }).toList(),
              ),
      );
    });
  }
}

/// Individual transaction item widget.
class _TransactionItem extends StatelessWidget {
  const _TransactionItem({required this.transaction});

  final Transaction transaction;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppConstants.contentPadding),
      decoration: BoxDecoration(
        color: AppColors.cobalt.withValues(alpha: 0.02),
        borderRadius: const BorderRadius.all(
          Radius.circular(AppConstants.borderRadius),
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              color: transaction.type.color,
              borderRadius: const BorderRadius.all(Radius.circular(20)),
            ),
            child: Icon(
              transaction.type.icon,
              size: 20,
              color: AppColors.grey0,
            ),
          ),
          const SizedBox(width: 16),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Wrap(
                  children: [
                    ShadBadge(child: Text(transaction.type.label)),
                    const SizedBox(width: 8),
                    Text(
                      '#${transaction.refId}',
                      style: ShadTheme.of(context).textTheme.muted,
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                AutoSizeText(
                  transaction.description,
                  style: ShadTheme.of(context).textTheme.small,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
                const SizedBox(height: 4),

                Row(
                  children: [
                    Icon(
                      LucideIcons.calendar,
                      size: 12,
                      color: ShadTheme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: AutoSizeText(
                        Formatters.formatDistanceToNow(
                          DateTime.parse(transaction.createdAt),
                        ),
                        style: ShadTheme.of(context).textTheme.muted,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 8,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                if (transaction.amountInCents > 0)
                  AutoSizeText(
                    Formatters.formatCurrency(
                      transaction.amountInCents.toDouble(),
                    ),
                    style: ShadTheme.of(
                      context,
                    ).textTheme.small.copyWith(fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 8,
                  ),
                const SizedBox(height: 4),

                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      LucideIcons.package,
                      size: 12,
                      color: Theme.of(
                        context,
                      ).colorScheme.onSurface.withValues(alpha: 0.6),
                    ),
                    const SizedBox(width: 4),
                    Flexible(
                      child: AutoSizeText(
                        '${transaction.quantity >= 0 ? '+' : ''}${transaction.quantity} unités',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        minFontSize: 8,
                        style: TextStyle(
                          fontSize: 14,
                          color: transaction.quantity >= 0
                              ? AppColors.dartGreen
                              : AppColors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
