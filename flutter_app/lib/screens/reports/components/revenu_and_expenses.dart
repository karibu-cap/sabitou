import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The revenue vs expenses.
class RevenueAndExpenses extends StatelessWidget {
  /// Constructor of new [RevenueAndExpenses].
  const RevenueAndExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    final List<ChartData<String>> chartData = [
      ChartData(
        x: 'Jan',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Feb',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 2)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Mar',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 3)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Apr',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 4)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'May',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 5)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Jun',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 6)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Jul',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 7)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Aug',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 8)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Sep',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 9)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Oct',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 10)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Nov',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 11)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
      ChartData(
        x: 'Dec',
        y: controller.revenueVsExpensesData
            .where((data) => data.date.month == 12)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.revenue,
            ),
        y1: controller.revenueVsExpensesData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.expenses,
            ),
      ),
    ];

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.revenueAndExpenses,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SfCartesianChart(
            primaryXAxis: const CategoryAxis(),
            tooltipBehavior: TooltipBehavior(enable: true),
            series: [
              SplineSeries<ChartData<String>, String>(
                dataSource: chartData,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y,
                markerSettings: const MarkerSettings(isVisible: true),
                color: AppColors.darkPrimary,
              ),
              SplineSeries<ChartData<String>, String>(
                dataSource: chartData,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y1,
                color: AppColors.dartGreen,
                markerSettings: const MarkerSettings(isVisible: true),
              ),
            ],
          ),
          Row(
            children: [
              Container(color: AppColors.darkPrimary, width: 10, height: 5),
              Text(
                Intls.to.expenses,
                style: ShadTheme.of(context).textTheme.muted,
              ),
              const SizedBox(width: 16),
              Container(color: AppColors.dartGreen, width: 10, height: 5),
              Text(
                Intls.to.revenue,
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
