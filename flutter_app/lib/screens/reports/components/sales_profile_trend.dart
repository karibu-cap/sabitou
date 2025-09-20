import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The sales profile trend.
class SalesProfileTrend extends StatelessWidget {
  /// Constructor of new [SalesProfileTrend].
  const SalesProfileTrend({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    final List<ChartData<String>> chartData = [
      ChartData(
        x: 'Jan',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Feb',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 2)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Mar',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 3)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Apr',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 4)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'May',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 5)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Jun',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 6)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Jul',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 7)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Aug',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 8)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Sep',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 9)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Oct',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 10)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Nov',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 11)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
      ChartData(
        x: 'Dec',
        y: controller.salesAndProfitData
            .where((data) => data.date.month == 12)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.salesValue,
            ),
        y1: controller.salesAndProfitData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.profitValue,
            ),
      ),
    ];

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.salesProfileTrend,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            Intls.to.performanceOverview,
            style: ShadTheme.of(context).textTheme.muted,
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
                Intls.to.sales,
                style: ShadTheme.of(context).textTheme.muted,
              ),
              const SizedBox(width: 16),
              Container(color: AppColors.dartGreen, width: 10, height: 5),
              Text(
                Intls.to.profit,
                style: ShadTheme.of(context).textTheme.muted,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
