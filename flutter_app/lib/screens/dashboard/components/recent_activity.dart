import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../dashboard_controller.dart';
import 'alert_card.dart';
import 'empty_state.dart';

/// Widget that displays recent transaction activities.
class RecentActivity extends StatelessWidget {
  const RecentActivity({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, _) {
        final transactions = controller.stats.recentActivities
            .take(10)
            .toList();

        return AlertCard(
          title: Intls.to.recentActivity,
          icon: LucideIcons.activity,
          iconColor: const Color(0xFF1E40AF),
          iconBg: const Color(0xFFEFF6FF),
          count: transactions.isNotEmpty ? transactions.length : null,
          child: transactions.isEmpty
              ? EmptyState(
                  icon: LucideIcons.clipboardList,
                  message: Intls.to.noRecentActivity,
                )
              : Column(
                  children: [
                    for (var i = 0; i < transactions.length; i++) ...[
                      _TransactionItem(transaction: transactions[i]),
                      if (i < transactions.length - 1)
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 6),
                          child: ShadSeparator.horizontal(),
                        ),
                    ],
                  ],
                ),
        );
      },
    );
  }
}

class _TransactionItem extends StatelessWidget {
  final InventoryTransaction transaction;
  const _TransactionItem({required this.transaction});

  _TxnStyle _styleFor(TransactionType type) {
    switch (type) {
      case TransactionType.TXN_TYPE_SALE:
        return _TxnStyle(
          bg: SabitouColors.dangerSoft,
          color: SabitouColors.dangerForeground,
          icon: LucideIcons.shoppingCart,
          accentBar: SabitouColors.danger,
          label: Intls.to.sale,
        );
      case TransactionType.TXN_TYPE_PURCHASE:
        return _TxnStyle(
          bg: SabitouColors.successSoft,
          color: SabitouColors.successForeground,
          icon: LucideIcons.packagePlus,
          accentBar: SabitouColors.success,
          label: Intls.to.buy,
        );
      case TransactionType.TXN_TYPE_EXPIRATION:
        return _TxnStyle(
          bg: SabitouColors.warningSoft,
          color: SabitouColors.warningForeground,
          icon: LucideIcons.calendarX2,
          accentBar: SabitouColors.warning,
          label: Intls.to.expiration,
        );
      default:
        return _TxnStyle(
          bg: const Color(0xFFF1EFE8),
          color: const Color(0xFF44444),
          icon: LucideIcons.arrowLeftRight,
          accentBar: const Color(0xFFADB2C0),
          label: Intls.to.movement,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final style = _styleFor(transaction.transactionType);
    final isPositive = transaction.quantityChange >= 0;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              width: 3,
              height: 44,
              decoration: BoxDecoration(
                color: style.accentBar,
                borderRadius: const BorderRadius.all(Radius.circular(3)),
              ),
            ),
            const SizedBox(width: 10),
            Container(
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: style.bg,
                borderRadius: const BorderRadius.all(Radius.circular(9)),
              ),
              child: Icon(style.icon, size: 15, color: style.color),
            ),
          ],
        ),
        const SizedBox(width: 12),

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 7,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: style.bg,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      style.label,
                      style: TextStyle(
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        color: style.color,
                        letterSpacing: 0.3,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6),
                  Flexible(
                    child: AutoSizeText(
                      '#${transaction.refId}',
                      style: theme.textTheme.muted.copyWith(fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 8,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              AutoSizeText(
                transaction.notes.isEmpty
                    ? '${Intls.to.transaction} ${transaction.refId}'
                    : transaction.notes,
                style: theme.textTheme.small.copyWith(
                  color: cs.foreground,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                minFontSize: 8,
              ),
              const SizedBox(height: 3),
              Row(
                children: [
                  Icon(LucideIcons.clock, size: 11, color: cs.mutedForeground),
                  const SizedBox(width: 4),
                  Flexible(
                    child: AutoSizeText(
                      Formatters.formatDistanceToNow(
                        transaction.transactionTime.toDateTime(),
                      ),
                      style: theme.textTheme.muted.copyWith(fontSize: 11),
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
        const SizedBox(width: 12),

        // ── Right: amount + qty ──────────────────────────────────────
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (transaction.quantityChange > 0)
              Text(
                Formatters.formatCurrency(
                  transaction.quantityChange.toDouble(),
                ),
                style: theme.textTheme.small.copyWith(
                  fontWeight: FontWeight.w700,
                  color: cs.foreground,
                ),
              ),
            const SizedBox(height: 2),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 2),
              decoration: BoxDecoration(
                color: isPositive
                    ? SabitouColors.successSoft
                    : SabitouColors.dangerSoft,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                '${isPositive ? '+' : ''}${transaction.quantityChange} u.',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: isPositive
                      ? SabitouColors.successForeground
                      : SabitouColors.dangerForeground,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class _TxnStyle {
  final Color bg;
  final Color color;
  final IconData icon;
  final Color accentBar;
  final String label;

  const _TxnStyle({
    required this.bg,
    required this.color,
    required this.icon,
    required this.accentBar,
    required this.label,
  });
}
