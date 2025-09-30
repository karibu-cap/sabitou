import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The sales profile trend.
class SalesProfileTrend extends StatelessWidget {
  /// Constructor of new [SalesProfileTrend].
  const SalesProfileTrend({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    // Create monthly data from supplier performances
    final List<ChartData<String>> chartDatas = List.generate(12, (index) {
      final month = index + 1;
      final monthName = getMonthName(month);

      return ChartData<String>(
        x: monthName,
        y: controller.salesAndProfitData
            .where((data) => data.date.toDateTime().month == month)
            .fold<double>(
              0,
              (previousValue, element) => previousValue + element.salesValue,
            ),
      );
    });

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
                dataSource: chartDatas,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y,
                markerSettings: const MarkerSettings(isVisible: true),
                color: AppColors.darkPrimary,
              ),
              SplineSeries<ChartData<String>, String>(
                dataSource: chartDatas,
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
