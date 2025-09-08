import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../themes/app_colors.dart';
import '../utils/app_constants.dart';

/// The trend type.
enum TrendType {
  /// The trend is up.
  up,

  /// The trend is down.
  down,

  /// The trend is neutral.
  neutral,
}

/// A reusable stat card widget for displaying statistics.
class StatCard extends StatelessWidget {
  /// Constructor of new [StatCard].
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.icon,
    required this.color,
    this.change,
    this.trend,
  });

  /// The title of the stat card.
  final String title;

  /// The value of the stat card.
  final String value;

  /// The icon of the stat card.
  final IconData icon;

  /// The color of the stat card.
  final Color color;

  /// The change of the stat card.
  final String? change;

  /// The trend of the stat card.
  final TrendType? trend;

  @override
  Widget build(BuildContext context) {
    Color getTrendColor(BuildContext context) {
      switch (trend) {
        case TrendType.up:
          return AppColors.lightGreen;
        case TrendType.down:
          return AppColors.red;
        case TrendType.neutral:
        default:
          return ShadTheme.of(context).colorScheme.primary;
      }
    }

    return ShadCard(
      padding: const EdgeInsets.all(AppConstants.contentPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  style: ShadTheme.of(
                    context,
                  ).textTheme.muted.copyWith(fontWeight: FontWeight.bold),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                AutoSizeText(
                  value,
                  style: ShadTheme.of(context).textTheme.p.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                if (change != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    change ?? '',
                    style: ShadTheme.of(
                      context,
                    ).textTheme.muted.copyWith(color: getTrendColor(context)),
                  ),
                ],
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: const BorderRadius.all(Radius.circular(100)),
            ),
            child: Icon(icon, color: color, size: AppConstants.largePadding),
          ),
        ],
      ),
    );
  }
}
