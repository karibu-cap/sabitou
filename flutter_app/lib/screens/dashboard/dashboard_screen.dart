import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/app_constants.dart';
import '../../utils/formatters.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/loading.dart';
import 'components/dashboard_stats.dart';
import 'components/expiry_alert.dart';
import 'components/low_stock_alert.dart';
import 'components/recent_activity.dart';
import 'dashboard_controller.dart';

/// Main dashboard widget that combines all dashboard components.
class DashboardScreen extends StatelessWidget {
  /// Creates a new dashboard instance.
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ChangeNotifierProvider(
      create: (context) => DashboardController(),
      child: Consumer<DashboardController>(
        builder: (context, controller, child) {
          return FutureBuilder(
            future: controller.completer.future,
            builder: (context, asyncSnapshot) {
              if (asyncSnapshot.connectionState == ConnectionState.waiting) {
                return const Loading();
              }
              if (asyncSnapshot.hasError) {
                return const SizedBox.shrink();
              }

              return SingleChildScrollView(
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
                        Text(
                          '${Intls.to.lastUpdated}: ${Formatters.formatDate(clock.now())} ${Formatters.formatTime(clock.now())}',
                          style: theme.textTheme.muted,
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
        },
      ),
    );
  }
}
