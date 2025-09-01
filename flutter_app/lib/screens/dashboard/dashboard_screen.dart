import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/app_constants.dart';
import '../../utils/formatters.dart';
import '../../utils/responsive_utils.dart';
import 'components/dashboard_stats.dart';
import 'components/expiry_alert.dart';
import 'components/low_stock_alert.dart';
import 'components/recent_activity.dart';
import 'dashboard_controller.dart';

/// Main dashboard widget that combines all dashboard components.
class Dashboard extends StatelessWidget {
  /// Creates a new dashboard instance.
  const Dashboard({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    Get.put(DashboardController());

    return Builder(
      builder: (context) {
        return SingleChildScrollView(
          padding: const EdgeInsets.all(AppConstants.contentPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flex(
                direction: !ResponsiveUtils.isDesktop(context)
                    ? Axis.vertical
                    : Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Intls.to.dashboard, style: theme.textTheme.h4),
                  Obx(
                    () => Text(
                      '${Intls.to.lastUpdated}: ${Formatters.formatDate(clock.now())} ${Formatters.formatTime(clock.now())}',
                      style: theme.textTheme.muted,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: AppConstants.largePadding),
              const DashboardStats(),
              const SizedBox(height: AppConstants.largePadding),
              LayoutBuilder(
                builder: (context, constraints) {
                  if (!ResponsiveUtils.isTablet(context) &&
                      constraints.maxWidth > 800) {
                    return const Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(child: RecentActivity()),
                        SizedBox(width: AppConstants.largePadding),
                        Expanded(
                          child: Column(
                            children: [
                              LowStockAlert(),
                              SizedBox(height: AppConstants.largePadding),
                              ExpiryAlert(),
                            ],
                          ),
                        ),
                      ],
                    );
                  }

                  return const Column(
                    children: [
                      RecentActivity(),
                      SizedBox(height: AppConstants.largePadding),
                      LowStockAlert(),
                      SizedBox(height: AppConstants.largePadding),
                      ExpiryAlert(),
                    ],
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
