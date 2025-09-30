import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../dashboard_controller.dart';
import 'alert_card.dart';
import 'empty_state.dart';
import 'product_item_card.dart';

/// Widget that displays products with low stock levels.
class LowStockAlert extends StatelessWidget {
  /// Constructor of new [LowStockAlert].
  const LowStockAlert({super.key});

  Color _getCriticalityColor(double quantity, double threshold) {
    final ratio = quantity / threshold;
    if (ratio <= 0.5) return AppColors.red;
    if (ratio <= 0.8) return AppColors.orange500;

    return AppColors.warningColor;
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, child) {
        if (controller.error.isNotEmpty) {
          return const SizedBox.shrink();
        }

        final lowStock = controller.stats.lowStockAlerts;

        return AlertCard(
          title: Intls.to.lowStockAlert,
          icon: LucideIcons.triangleAlert400,
          iconColor: AppColors.red,
          child: lowStock.isEmpty
              ? EmptyState(
                  icon: LucideIcons.package,
                  message: Intls.to.allProductsAreWellStocked,
                )
              : Column(
                  children: lowStock.map((product) {
                    final criticalityColor = _getCriticalityColor(
                      product.level.quantityAvailable,
                      product.level.minThreshold,
                    );

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ProductItemCard(
                        productName: product.globalProduct.label,
                        subtitle:
                            'Reorder threshold: ${product.level.minThreshold.toInt()}',
                        badgeText:
                            '${product.level.quantityAvailable.toInt()} left',
                        badgeColor: criticalityColor,
                        additionalInfo:
                            '\$${(product.product.salePrice.toInt() / 100).toStringAsFixed(2)}/unit',
                      ),
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}
