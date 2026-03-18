import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../dashboard_controller.dart';
import 'alert_card.dart';
import 'empty_state.dart';
import 'product_item_card.dart';

/// Widget that displays products with low stock levels.
class LowStockAlert extends StatelessWidget {
  const LowStockAlert({super.key});

  ({Color bg, Color text}) _criticality(double qty, double threshold) {
    final ratio = qty / threshold.clamp(1, double.infinity);
    if (ratio <= 0.5) {
      return (bg: SabitouColors.dangerSoft, text: SabitouColors.dangerText);
    }
    if (ratio <= 0.8) {
      return (bg: SabitouColors.orangeSoft, text: SabitouColors.orangeText);
    }

    return (
      bg: SabitouColors.warningSoft,
      text: SabitouColors.warningForeground,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, _) {
        final lowStock = controller.stats.lowStockAlerts;

        return AlertCard(
          title: Intls.to.lowStockAlert,
          icon: LucideIcons.triangleAlert,
          iconColor: SabitouColors.dangerText,
          iconBg: SabitouColors.dangerSoft,
          count: lowStock.isNotEmpty ? lowStock.length : null,
          child: lowStock.isEmpty
              ? EmptyState(
                  icon: LucideIcons.packageCheck,
                  message: Intls.to.allProductsAreWellStocked,
                )
              : Column(
                  children: [
                    for (var i = 0; i < lowStock.length; i++) ...[
                      Builder(
                        builder: (context) {
                          final product = lowStock[i];
                          final c = _criticality(
                            product.level.quantityAvailable.toDouble(),
                            product.level.minThreshold.toDouble(),
                          );

                          return ProductItemCard(
                            productName: product.globalProduct.label,
                            subtitle:
                                '${Intls.to.reorderThreshold}: ${product.level.minThreshold.toInt()} unités',
                            badgeText:
                                '${product.level.quantityAvailable.toInt()} ${Intls.to.remaining}',
                            badgeColor: c.bg,
                            badgeForeground: c.text,
                            additionalInfo: Formatters.formatCurrency(
                              (product.product.salePrice.toInt() / 100)
                                  .toDouble(),
                            ),
                          );
                        },
                      ),
                      if (i < lowStock.length - 1) const SizedBox(height: 10),
                    ],
                  ],
                ),
        );
      },
    );
  }
}
