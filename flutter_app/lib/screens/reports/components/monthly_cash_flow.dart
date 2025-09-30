import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The monthly cash flow.
class MonthlyCashFlow extends StatelessWidget {
  /// Constructor of new [MonthlyCashFlow].
  const MonthlyCashFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();
    // Create monthly data from supplier performances
    final List<ChartData<String>> chartDatas = List.generate(12, (index) {
      final month = index + 1;
      final monthName = getMonthName(month);

      return ChartData<String>(
        x: monthName,
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == month)
            .fold<double>(
              0,
              (previousValue, element) => previousValue + element.cashFlow,
            ),
      );
    });

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.monthlyCashFlow,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          SfCartesianChart(
            tooltipBehavior: TooltipBehavior(
              enable: true,
              shouldAlwaysShow: true,
            ),
            legend: const Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
            ),
            primaryXAxis: const CategoryAxis(arrangeByIndex: true),
            series: <CartesianSeries<ChartData<String>, String>>[
              ColumnSeries<ChartData<String>, String>(
                dataSource: chartDatas,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
