import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The revenue vs expenses.
class RevenueAndExpenses extends StatelessWidget {
  /// Constructor of new [RevenueAndExpenses].
  const RevenueAndExpenses({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    // Create monthly data from supplier performances
    final List<ChartData<String>> chartData = List.generate(12, (index) {
      final month = index + 1;
      final monthName = getMonthName(month);

      return ChartData<String>(
        x: monthName,
        y: controller.revenueVsExpensesData
            .where((data) => data.periodEnd.toDateTime().month == month)
            .fold<double>(
              0,
              (previousValue, element) => previousValue + element.revenue,
            ),
      );
    });

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
