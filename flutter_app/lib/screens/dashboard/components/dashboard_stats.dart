import 'package:fixnum/fixnum.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../dashboard_controller.dart';

enum TrendType { up, down, neutral }

/// Dashboard statistics grid.
class DashboardStats extends StatelessWidget {
  const DashboardStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, _) {
        final stats = controller.stats;
        final pctSales = controller.calculatePercentChange(
          stats.todaySales.toInt(),
          Int64.ZERO.toInt(),
        );
        final pctTxn = controller.calculatePercentChange(
          stats.todayTransactions,
          0,
        );

        final cards = [
          _StatCardData(
            label: Intls.to.totalProducts,
            value: stats.totalProducts.toString(),
            icon: LucideIcons.package,
            iconBg: SabitouColors.infoSoft,
            iconColor: SabitouColors.infoText,
            trend: TrendType.neutral,
          ),
          _StatCardData(
            label: Intls.to.lowStockItems,
            value: stats.lowStockItemsCount.toString(),
            icon: LucideIcons.triangleAlert,
            iconBg: stats.lowStockItemsCount > 0
                ? SabitouColors.dangerSoft
                : SabitouColors.successSoft,
            iconColor: stats.lowStockItemsCount > 0
                ? SabitouColors.dangerText
                : SabitouColors.successForeground,
            badge: stats.lowStockItemsCount > 0
                ? Intls.to.requiresAttention
                : Intls.to.allGood,
            badgeIsGood: stats.lowStockItemsCount == 0,
            trend: stats.lowStockItemsCount > 0
                ? TrendType.down
                : TrendType.neutral,
          ),
          _StatCardData(
            label: Intls.to.expiringSoon,
            value: stats.expiringItemsCount.toString(),
            icon: LucideIcons.calendarClock,
            iconBg: SabitouColors.accentSoft,
            iconColor: SabitouColors.accentForeground,
            badge: stats.expiringTimeframe,
            badgeIsGood: stats.expiringItemsCount == 0,
            trend: TrendType.neutral,
          ),
          _StatCardData(
            label: Intls.to.todaySales,
            value: Formatters.formatCurrency(stats.todaySales.toDouble()),
            icon: LucideIcons.circleDollarSign,
            iconBg: SabitouColors.successSoft,
            iconColor: SabitouColors.successForeground,
            badge: pctSales != 0
                ? '${pctSales > 0 ? '+' : ''}${pctSales.toStringAsFixed(1)}%'
                : null,
            badgeIsGood: pctSales >= 0,
            trend: pctSales > 0
                ? TrendType.up
                : pctSales < 0
                ? TrendType.down
                : TrendType.neutral,
          ),
          _StatCardData(
            label: Intls.to.todayTransactions,
            value: stats.todayTransactions.toString(),
            icon: LucideIcons.shoppingCart,
            iconBg: SabitouColors.purpleSoft,
            iconColor: SabitouColors.purpleText,
            badge: pctTxn != 0
                ? '${pctTxn > 0 ? '+' : ''}${pctTxn.toStringAsFixed(1)}%'
                : null,
            badgeIsGood: pctTxn >= 0,
            trend: pctTxn > 0
                ? TrendType.up
                : pctTxn < 0
                ? TrendType.down
                : TrendType.neutral,
          ),
        ];

        return LayoutBuilder(
          builder: (context, constraints) {
            final w = constraints.maxWidth;
            final cols = w < 480
                ? 1
                : w < 760
                ? 2
                : w < 1100
                ? 3
                : 5;

            return _StatGrid(cards: cards, columns: cols);
          },
        );
      },
    );
  }
}

class _StatGrid extends StatelessWidget {
  final List<_StatCardData> cards;
  final int columns;
  const _StatGrid({required this.cards, required this.columns});

  @override
  Widget build(BuildContext context) {
    final rows = <Widget>[];
    for (var i = 0; i < cards.length; i += columns) {
      final slice = cards.sublist(i, (i + columns).clamp(0, cards.length));
      rows.add(
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              for (var j = 0; j < slice.length; j++) ...[
                Expanded(child: _StatCard(data: slice[j])),
                if (j < slice.length - 1) const SizedBox(width: 14),
                if (j == slice.length - 1)
                  for (var k = slice.length; k < columns; k++) ...[
                    const SizedBox(width: 14),
                    const Expanded(child: SizedBox()),
                  ],
              ],
            ],
          ),
        ),
      );
      if (i + columns < cards.length) rows.add(const SizedBox(height: 14));
    }

    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: rows);
  }
}

class _StatCardData {
  final String label;
  final String value;
  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String? badge;
  final bool badgeIsGood;
  final TrendType trend;

  const _StatCardData({
    required this.label,
    required this.value,
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    this.badge,
    this.badgeIsGood = true,
    required this.trend,
  });
}

class _StatCard extends StatelessWidget {
  final _StatCardData data;
  const _StatCard({required this.data});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 38,
                height: 38,
                decoration: BoxDecoration(
                  color: data.iconBg,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                ),
                child: Icon(data.icon, size: 17, color: data.iconColor),
              ),
              if (data.trend != TrendType.neutral)
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 7,
                    vertical: 3,
                  ),
                  decoration: BoxDecoration(
                    color: data.trend == TrendType.up
                        ? SabitouColors.successSoft
                        : SabitouColors.dangerSoft,
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        data.trend == TrendType.up
                            ? LucideIcons.trendingUp
                            : LucideIcons.trendingDown,
                        size: 11,
                        color: data.trend == TrendType.up
                            ? SabitouColors.successForeground
                            : SabitouColors.dangerText,
                      ),
                    ],
                  ),
                ),
            ],
          ),

          const SizedBox(height: 14),

          Text(
            data.value,
            style: theme.textTheme.h1.copyWith(
              fontSize: 26,
              letterSpacing: -0.8,
              height: 1,
              color: cs.foreground,
            ),
          ),

          const SizedBox(height: 4),

          Text(data.label, style: theme.textTheme.muted.copyWith(fontSize: 12)),
          if (data.badge != null) ...[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
              decoration: BoxDecoration(
                color: data.badgeIsGood
                    ? SabitouColors.successSoft
                    : SabitouColors.dangerSoft,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              child: Text(
                data.badge ?? '',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: data.badgeIsGood
                      ? SabitouColors.successForeground
                      : SabitouColors.dangerText,
                  letterSpacing: 0.2,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
