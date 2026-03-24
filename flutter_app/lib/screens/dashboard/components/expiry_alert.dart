import 'package:collection/collection.dart';
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

/// Widget that displays products expiring within the next 30 days.
class ExpiryAlert extends StatelessWidget {
  const ExpiryAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, _) {
        final expiring = controller.stats.expirationAlerts;

        return AlertCard(
          title: Intls.to.expiryAlert,
          icon: LucideIcons.calendarClock,
          iconColor: SabitouColors.warningForeground,
          iconBg: SabitouColors.warningSoft,
          count: expiring.isNotEmpty ? expiring.length : null,
          child: expiring.isEmpty
              ? EmptyState(
                  icon: LucideIcons.calendarCheck,
                  message: Intls.to.noProductsExpiringSoon,
                )
              : Column(
                  children: [
                    for (var i = 0; i < expiring.length; i++) ...[
                      Builder(
                        builder: (context) {
                          final product = expiring[i];
                          final expiringBatch = product.level.batches
                              .where((b) => b.hasExpirationDate())
                              .firstWhereOrNull(
                                (b) => b.productId == product.product.refId,
                              );

                          if (expiringBatch == null)
                            return const SizedBox.shrink();

                          final expDate = expiringBatch.expirationDate
                              .toDateTime();
                          final daysLabel = Formatters.formatDurationToNow(
                            expDate,
                          );
                          final isExpired = daysLabel == null;

                          return ProductItemCard(
                            productName: product.globalProduct.label,
                            subtitle:
                                '${Intls.to.expires}: ${Formatters.formatDate(expDate)}',
                            badgeText: daysLabel ?? Intls.to.expired,
                            badgeColor: isExpired
                                ? SabitouColors.dangerSoft
                                : SabitouColors.warningSoft,
                            badgeForeground: isExpired
                                ? SabitouColors.dangerForeground
                                : SabitouColors.warningForeground,
                            additionalInfo: Intls.to.inStock.trParams({
                              'quantity': product.level.quantityAvailable
                                  .toString(),
                            }),
                          );
                        },
                      ),
                      if (i < expiring.length - 1) const SizedBox(height: 10),
                    ],
                  ],
                ),
        );
      },
    );
  }
}
