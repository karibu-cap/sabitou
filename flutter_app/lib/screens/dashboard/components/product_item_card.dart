import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

/// A single product row inside LowStockAlert or ExpiryAlert.
class ProductItemCard extends StatelessWidget {
  final String productName;
  final String subtitle;
  final String badgeText;

  /// Semantic color of the badge background (pass a "soft" tint color).
  final Color badgeColor;

  /// Foreground text color for the badge.
  final Color badgeForeground;

  final String additionalInfo;

  /// Convenience constructor — derives foreground from background automatically.
  const ProductItemCard({
    super.key,
    required this.productName,
    required this.subtitle,
    required this.badgeText,
    required this.badgeColor,
    this.badgeForeground = const Color(0xFF374151),
    required this.additionalInfo,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: cs.background,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.fromBorderSide(BorderSide(color: cs.border)),
      ),
      child: Row(
        children: [
          Container(
            width: 34,
            height: 34,
            decoration: BoxDecoration(
              color: cs.muted,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
            ),
            child: Icon(
              LucideIcons.package,
              size: 15,
              color: cs.mutedForeground,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  productName,
                  style: theme.textTheme.small.copyWith(
                    fontWeight: FontWeight.w600,
                    color: cs.foreground,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
                const SizedBox(height: 2),
                AutoSizeText(
                  subtitle,
                  style: theme.textTheme.muted.copyWith(fontSize: 11),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
              ],
            ),
          ),
          const SizedBox(width: 10),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: const BorderRadius.all(Radius.circular(20)),
                ),
                child: Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w700,
                    color: badgeForeground,
                    letterSpacing: 0.2,
                  ),
                ),
              ),
              const SizedBox(height: 3),
              Text(
                additionalInfo,
                style: theme.textTheme.muted.copyWith(fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
