import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A reusable section card used by RecentActivity, LowStockAlert, ExpiryAlert.
class AlertCard extends StatelessWidget {
  const AlertCard({
    super.key,
    required this.title,
    required this.icon,
    required this.iconColor,
    required this.iconBg,
    required this.child,
    this.trailing,
    this.count,
  });

  final String title;
  final IconData icon;
  final Color iconColor;
  final Color iconBg;
  final Widget child;

  /// Optional widget on the right of the header (e.g. a "See all" button).
  final Widget? trailing;

  /// Optional count badge shown next to the title.
  final int? count;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 18, right: 18, top: 18),
            child: Row(
              children: [
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: iconBg,
                    borderRadius: const BorderRadius.all(Radius.circular(9)),
                  ),
                  child: Icon(icon, size: 15, color: iconColor),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: AutoSizeText(
                    title,
                    style: theme.textTheme.h3.copyWith(fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    minFontSize: 10,
                  ),
                ),
                if (count != null && (count ?? 0) > 0) ...[
                  const SizedBox(width: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: cs.muted,
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      '$count',
                      style: theme.textTheme.muted.copyWith(
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                        color: cs.foreground,
                      ),
                    ),
                  ),
                ],
                if (trailing != null) ...[
                  const SizedBox(width: 8),
                  trailing ?? const SizedBox.shrink(),
                ],
              ],
            ),
          ),

          const SizedBox(height: 14),
          const ShadSeparator.horizontal(),
          const SizedBox(height: 4),

          Padding(
            padding: const EdgeInsets.fromLTRB(18, 4, 18, 18),
            child: child,
          ),
        ],
      ),
    );
  }
}
