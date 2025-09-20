import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_colors.dart';
import '../../utils/formatters.dart';
import '../../utils/responsive_utils.dart';
import '../../widgets/custom_grid.dart';
import '../../widgets/loading.dart';
import '../../widgets/stat_card.dart';
import 'components/export_data_report.dart';
import 'components/header.dart';
import 'components/inventory_in_stock.dart';
import 'components/monthly_cash_flow.dart';
import 'components/reports_tabs_view.dart';
import 'components/revenu_and_expenses.dart';
import 'components/sales_by_categories.dart';
import 'components/sales_profile_trend.dart';
import 'components/stock_movement.dart';
import 'components/top_perfoming_product_view.dart';
import 'reports_controller.dart';
import 'reports_view_model.dart';

/// Reports screen.
class ReportsScreen extends StatelessWidget {
  /// Constructs of new [ReportsScreen].
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = GetIt.I.registerSingletonIfAbsent<ReportsViewModel>(
      ReportsViewModel.new,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = ResponsiveUtils.isDesktop(context);

        return ChangeNotifierProvider(
          create: (context) => ReportsController(viewModel),
          child: Consumer<ReportsController>(
            builder: (context, controller, child) {
              return FutureBuilder<bool>(
                future: controller.completer.future,
                builder: (context, snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Loading();
                  }

                  return SingleChildScrollView(
                    padding: EdgeInsets.all(isDesktop ? 24 : 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      spacing: 16,
                      children: [
                        const Header(),
                        const SizedBox(height: 20),
                        const ReportsTabsView(),
                        const _ReportsStats(),
                        if (controller.selectedTab ==
                            ReportsTab.inventoryReport)
                          const InventoryInStock(),
                        if (controller.selectedTab ==
                            ReportsTab.inventoryReport)
                          const StockMovement(),

                        if (controller.selectedTab == ReportsTab.salesAnalytics)
                          Flex(
                            direction: isDesktop
                                ? Axis.horizontal
                                : Axis.vertical,
                            spacing: 16,
                            children: [
                              Expanded(
                                flex: isDesktop ? 1 : 0,
                                child: const SalesProfileTrend(),
                              ),
                              Expanded(
                                flex: isDesktop ? 1 : 0,
                                child: const SalesByCategories(),
                              ),
                            ],
                          ),
                        if (controller.selectedTab ==
                            ReportsTab.financialSummary)
                          Flex(
                            direction: isDesktop
                                ? Axis.horizontal
                                : Axis.vertical,
                            spacing: 16,
                            children: [
                              Expanded(
                                flex: isDesktop ? 1 : 0,
                                child: const RevenueAndExpenses(),
                              ),
                              Expanded(
                                flex: isDesktop ? 1 : 0,
                                child: const MonthlyCashFlow(),
                              ),
                            ],
                          ),
                        if (controller.selectedTab == ReportsTab.salesAnalytics)
                          const TopPerformingProductView(),
                        const ExportDataReport(),
                      ],
                    ),
                  );
                },
              );
            },
          ),
        );
      },
    );
  }
}

class _ReportsStats extends StatelessWidget {
  const _ReportsStats();

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    return CustomGrid(
      minItemWidth: 255,
      mainAxisExtent: 120,
      children: [
        StatCard(
          title: Intls.to.totalRevenue,
          value: Formatters.formatCurrency(controller.totalRevenue),
          changeWidget: Builder(
            builder: (context) {
              final isUp =
                  controller.totalRevenue >
                  controller.previousYearsTotalRevenue;

              return Row(
                spacing: 8,
                children: [
                  Icon(
                    isUp
                        ? LucideIcons.trendingUp400
                        : LucideIcons.trendingDown400,
                    color: isUp ? AppColors.lightGreen : AppColors.red,
                  ),
                  Text(
                    '${isUp ? "+" : "-"} ${controller.differentInPercentage(controller.previousYearsTotalRevenue, controller.totalRevenue)}%',
                    style: ShadTheme.of(context).textTheme.small.copyWith(
                      color: isUp ? AppColors.lightGreen : AppColors.red,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        StatCard(
          title: Intls.to.netProfit,
          value: Formatters.formatCurrency(controller.netProfit),
          changeWidget: Builder(
            builder: (context) {
              final isUp =
                  controller.netProfit > controller.previousYearsNetProfit;

              return Row(
                spacing: 8,
                children: [
                  Icon(
                    isUp
                        ? LucideIcons.trendingUp400
                        : LucideIcons.trendingDown400,
                    color: isUp ? AppColors.lightGreen : AppColors.red,
                  ),
                  Text(
                    '${isUp ? "+" : "-"} ${controller.differentInPercentage(controller.previousYearsNetProfit, controller.netProfit)}%',
                    style: ShadTheme.of(context).textTheme.small.copyWith(
                      color: isUp ? AppColors.lightGreen : AppColors.red,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        StatCard(
          title: Intls.to.orders,
          value: controller.numberOfOrders.toString(),
          changeWidget: Builder(
            builder: (context) {
              final isUp =
                  controller.numberOfOrders >
                  controller.previousYearsNumberOfOrders;

              return Row(
                spacing: 8,
                children: [
                  Icon(
                    isUp
                        ? LucideIcons.trendingUp400
                        : LucideIcons.trendingDown400,
                    color: isUp ? AppColors.lightGreen : AppColors.red,
                  ),
                  Text(
                    '${isUp ? "+" : "-"} ${controller.differentInPercentage(controller.previousYearsNumberOfOrders.toDouble(), controller.numberOfOrders.toDouble())}%',
                    style: ShadTheme.of(context).textTheme.small.copyWith(
                      color: isUp ? AppColors.lightGreen : AppColors.red,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
        StatCard(
          title: Intls.to.averageOrderValue,
          value: controller.averageOrderValue.toString(),
          changeWidget: Builder(
            builder: (context) {
              final isUp =
                  controller.averageOrderValue >
                  controller.previousYearsAverageOrderValue;

              return Row(
                spacing: 8,
                children: [
                  Icon(
                    isUp
                        ? LucideIcons.trendingUp400
                        : LucideIcons.trendingDown400,
                    color: isUp ? AppColors.lightGreen : AppColors.red,
                  ),
                  Text(
                    '${isUp ? "+" : "-"} ${controller.differentInPercentage(controller.previousYearsAverageOrderValue, controller.averageOrderValue)}%',
                    style: ShadTheme.of(context).textTheme.small.copyWith(
                      color: isUp ? AppColors.lightGreen : AppColors.red,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }
}
