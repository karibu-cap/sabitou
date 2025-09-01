import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';

/// A reusable product item card widget for displaying product information.
class ProductItemCard extends StatelessWidget {
  /// Constructor of new [ProductItemCard].
  const ProductItemCard({
    super.key,
    required this.productName,
    required this.subtitle,
    required this.badgeText,
    required this.badgeColor,
    required this.additionalInfo,
  });

  /// The product name.
  final String productName;

  /// The subtitle.
  final String subtitle;

  /// The badge text.
  final String badgeText;

  /// The badge color.
  final Color badgeColor;

  /// The additional info.
  final String additionalInfo;

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
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(productName, style: ShadTheme.of(context).textTheme.large),
                const SizedBox(height: 2),
                Text(subtitle, style: ShadTheme.of(context).textTheme.muted),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: badgeColor,
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                ),
                child: Text(
                  badgeText,
                  style: ShadTheme.of(
                    context,
                  ).textTheme.small.copyWith(color: AppColors.grey0),
                ),
              ),
              const SizedBox(height: 4),
              Text(
                additionalInfo,
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
