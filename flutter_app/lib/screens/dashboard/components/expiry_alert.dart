import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../dashboard_controller.dart';
import 'alert_card.dart';
import 'empty_state.dart';
import 'product_item_card.dart';

/// Widget that displays products expiring within the next 30 days.
class ExpiryAlert extends StatelessWidget {
  /// Constructs a new [ExpiryAlert].
  const ExpiryAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<DashboardController>(
      builder: (context, controller, child) {
        if (controller.error.isNotEmpty) {
          return const SizedBox.shrink();
        }

        final expiring = controller.stats.expirationAlerts;

        return AlertCard(
          title: Intls.to.expiryAlert,
          icon: LucideIcons.calendar400,
          iconColor: AppColors.warningColor,
          child: expiring.isEmpty
              ? EmptyState(
                  icon: LucideIcons.calendar,
                  message: Intls.to.noProductsExpiringSoon,
                )
              : Column(
                  children: expiring.map((product) {
                    final expiringBatches = product.level.batches
                        .where((b) => b.hasExpirationDate())
                        .toList();
                    if (expiringBatches.isEmpty) {
                      return const SizedBox.shrink();
                    }
                    final expiringBatch = expiringBatches.firstWhereOrNull(
                      (e) => e.productId == product.product.refId,
                    );
                    if (expiringBatch == null) {
                      return const SizedBox.shrink();
                    }
                    final expiredDate = expiringBatch.expirationDate
                        .toDateTime();

                    final daysUntilExpiry = Formatters.formatDurationToNow(
                      expiredDate,
                    );
                    final urgencyColor = daysUntilExpiry == null
                        ? AppColors.red
                        : AppColors.warningColor;

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: ProductItemCard(
                        productName: product.globalProduct.label,
                        subtitle:
                            '${Intls.to.expires}: ${Formatters.formatDate(expiredDate)}',
                        badgeText: daysUntilExpiry ?? Intls.to.expired,
                        badgeColor: urgencyColor,
                        additionalInfo: Intls.to.inStock.trParams({
                          'quantity': product.level.quantityAvailable
                              .toString(),
                        }),
                      ),
                    );
                  }).toList(),
                ),
        );
      },
    );
  }
}
