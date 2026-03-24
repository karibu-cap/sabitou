import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../widgets/custom_grid.dart';
import '../suppliers_controller.dart';
import 'list_components/supplier_shimmer_widgets.dart';

/// Stats grid — 2-column on mobile, 4-column on wider screens.
class SuppliersStatsGrid extends StatelessWidget {
  const SuppliersStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context, listen: false);

    return StreamBuilder<List<Supplier>>(
      stream: controller.suppliersStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SupplierShimmerWidgets.buildStatsShimmer();
        }

        final suppliers = snapshot.data ?? [];
        final total = suppliers.length;
        final active = suppliers
            .where((s) => s.status == SupplierStatus.SUPPLIER_STATUS_ACTIVE)
            .length;
        final inactive = total - active;
        final withEmail = suppliers
            .where((s) => s.contactEmail.isNotEmpty)
            .length;

        final cards = [
          _StatData(
            icon: LucideIcons.building2,
            iconBg: SabitouColors.accentSoft,
            iconColor: SabitouColors.accentForeground,
            value: '$total',
            label: AppInternationalizationService.to.totalSuppliersCount,
            trendLabel:
                '$active ${AppInternationalizationService.to.activeText.toLowerCase()}',
            trendType: _TrendType.neutral,
            topBarColor: SabitouColors.accent,
          ),
          _StatData(
            icon: LucideIcons.circleCheck,
            iconBg: SabitouColors.successSoft,
            iconColor: SabitouColors.success,
            value: '$active',
            label: AppInternationalizationService.to.activeSuppliersText,
            trendLabel: total > 0
                ? '${((active / total) * 100).round()}%'
                : '0%',
            trendType: _TrendType.up,
            topBarColor: SabitouColors.success,
          ),
          if (inactive > 0)
            _StatData(
              icon: LucideIcons.circleX,
              iconBg: SabitouColors.dangerSoft,
              iconColor: SabitouColors.danger,
              value: '$inactive',
              label: AppInternationalizationService.to.inactiveText,
              trendLabel: total > 0
                  ? '${((inactive / total) * 100).round()}%'
                  : '0%',
              trendType: _TrendType.down,
              topBarColor: SabitouColors.danger,
            ),
        ];

        return CustomGrid(
          children: cards.map((d) => _StatCard(data: d)).toList(),
          minItemWidth: 250,
          mainAxisExtent: 120,
          crossSpacing: 20,
        );
      },
    );
  }
}

enum _TrendType { up, down, neutral }

class _StatData {
  const _StatData({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.value,
    required this.label,
    required this.trendLabel,
    required this.trendType,
    required this.topBarColor,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String value;
  final String label;
  final String trendLabel;
  final _TrendType trendType;
  final Color topBarColor;
}

class _StatCard extends StatelessWidget {
  const _StatCard({required this.data});
  final _StatData data;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: ClipRRect(
        borderRadius: const BorderRadius.all(Radius.circular(12)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(height: 3, color: data.topBarColor),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
              child: Row(
                spacing: 10,
                children: [
                  Container(
                    width: 36,
                    height: 36,
                    decoration: BoxDecoration(
                      color: data.iconBg,
                      borderRadius: const BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Icon(data.icon, size: 17, color: data.iconColor),
                  ),
                  const SizedBox(height: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.value,
                        style: theme.textTheme.h3.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.5,
                          color: cs.foreground,
                        ),
                      ),
                      const SizedBox(height: 2),

                      // Label
                      Text(
                        data.label,
                        style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 7),

                      // Trend badge
                      _TrendBadge(label: data.trendLabel, type: data.trendType),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _TrendBadge extends StatelessWidget {
  const _TrendBadge({required this.label, required this.type});
  final String label;
  final _TrendType type;

  @override
  Widget build(BuildContext context) {
    final (bg, fg, prefix) = switch (type) {
      _TrendType.up => (SabitouColors.successSoft, SabitouColors.success, '▲ '),
      _TrendType.down => (SabitouColors.dangerSoft, SabitouColors.danger, '▼ '),
      _TrendType.neutral => (
        SabitouColors.accentSoft,
        SabitouColors.accent,
        '',
      ),
    };

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        '$prefix$label',
        style: TextStyle(fontSize: 11, fontWeight: FontWeight.w500, color: fg),
      ),
    );
  }
}
