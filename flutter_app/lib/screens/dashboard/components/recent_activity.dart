import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/formatters.dart';
import '../dashboard_controller.dart';
import 'alert_card.dart';

/// Widget that displays recent transaction activities.
class RecentActivity extends StatelessWidget {
  /// Constructors of new [RecentActivity].
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, child) {
        if (controller.error.isNotEmpty) {
          return const SizedBox.shrink();
        }

        final limitedTransactions = controller.stats.recentActivities
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
      },
    );
  }
}

/// Individual transaction item widget.
class _TransactionItem extends StatelessWidget {
  final InventoryTransaction transaction;

  const _TransactionItem({Key? key, required this.transaction})
    : super(key: key);

  Color _getTransactionColor(TransactionType type) {
    switch (type) {
      case TransactionType.TXN_TYPE_SALE:
        return AppColors.red;
      case TransactionType.TXN_TYPE_PURCHASE:
        return AppColors.dartGreen;
      case TransactionType.TXN_TYPE_EXPIRATION:
        return AppColors.warningColor;
      default:
        return AppColors.grey500;
    }
  }

  IconData _getTransactionIcon(TransactionType type) {
    switch (type) {
      case TransactionType.TXN_TYPE_SALE:
        return Icons.shopping_cart;
      case TransactionType.TXN_TYPE_PURCHASE:
        return Icons.inventory;
      case TransactionType.TXN_TYPE_EXPIRATION:
        return Icons.warning;
      default:
        return Icons.swap_horiz;
    }
  }

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
      child: Column(
        children: [
          Row(
            children: [
              const SizedBox(width: 42),
              ShadBadge(child: Text(transaction.transactionType.toString())),
              const SizedBox(width: 8),
              Flexible(
                child: AutoSizeText(
                  '#${transaction.documentId}',
                  style: ShadTheme.of(context).textTheme.muted,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 6,
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: _getTransactionColor(transaction.transactionType),
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Icon(
                  _getTransactionIcon(transaction.transactionType),
                  size: 20,
                  color: AppColors.grey0,
                ),
              ),
              const SizedBox(width: 16),

              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 4),

                    AutoSizeText(
                      transaction.notes.isEmpty
                          ? 'Transaction ${transaction.documentId}'
                          : transaction.notes,
                      style: ShadTheme.of(context).textTheme.small,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 8,
                    ),
                    const SizedBox(height: 4),

                    Row(
                      children: [
                        const Icon(LucideIcons.calendar400, size: 12),
                        const SizedBox(width: 4),
                        Flexible(
                          child: AutoSizeText(
                            Formatters.formatDistanceToNow(
                              transaction.transactionTime.toDateTime(),
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
                    if (transaction.quantityChange > 0)
                      AutoSizeText(
                        Formatters.formatCurrency(transaction.quantityChange),
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
                        const Icon(Icons.inventory, size: 12),
                        const SizedBox(width: 4),
                        Flexible(
                          child: AutoSizeText(
                            '${transaction.quantityChange >= 0 ? '+' : ''}${transaction.quantityChange} unités',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            minFontSize: 8,
                            style: ShadTheme.of(context).textTheme.small
                                .copyWith(
                                  fontSize: 14,
                                  color: transaction.quantityChange >= 0
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
        ],
      ),
    );
  }
}
