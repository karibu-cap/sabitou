import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../dashboard_controller.dart';
import 'alert_card.dart';
import 'empty_state.dart';
import 'product_item_card.dart';

/// Widget that displays products expiring within the next 30 days.
class ExpiryAlert extends GetView<DashboardController> {
  /// Constructs a new [ExpiryAlert].
  const ExpiryAlert({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.isLoading.value) {
        return const Loading();
      }
      if (controller.error.value.isNotEmpty) {
        return const SizedBox.shrink();
      }

      final expiring = controller.expiringProducts;

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
                children: expiring.map((businessProduct) {
                  final expiredDate = DateTime.tryParse(
                    businessProduct.expirationDate,
                  );
                  if (expiredDate == null) {
                    return const SizedBox.shrink();
                  }

                  final globalProduct = controller
                      .globalProducts[businessProduct.globalProductId];

                  final daysUntilExpiry = Formatters.formatDurationToNow(
                    expiredDate,
                  );
                  final urgencyColor = daysUntilExpiry == null
                      ? AppColors.red
                      : AppColors.warningColor;

                  if (globalProduct == null) {
                    return const SizedBox.shrink();
                  }

                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: ProductItemCard(
                      productName: globalProduct.name,
                      subtitle:
                          '${Intls.to.expires}: ${Formatters.formatDate(expiredDate)}',
                      badgeText: daysUntilExpiry ?? Intls.to.expired,
                      badgeColor: urgencyColor,
                      additionalInfo: Intls.to.inStock.trParams({
                        'quantity': businessProduct.stockQuantity.toString(),
                      }),
                    ),
                  );
                }).toList(),
              ),
      );
    });
  }
}
