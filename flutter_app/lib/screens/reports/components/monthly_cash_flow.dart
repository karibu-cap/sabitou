import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The monthly cash flow.
class MonthlyCashFlow extends StatelessWidget {
  /// Constructor of new [MonthlyCashFlow].
  const MonthlyCashFlow({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    final List<ChartData<String>> chartDatas = [
      ChartData(
        x: 'Jan',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Feb',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 2)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Mar',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 3)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Apr',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 4)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'May',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 5)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Jun',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 6)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Jul',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 7)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Aug',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 8)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Sep',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 9)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Oct',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 10)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Nov',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 11)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
      ChartData(
        x: 'Dec',
        y: controller.monthlyCashFlowData
            .where((data) => data.month.month == 12)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.cashFlow,
            ),
      ),
    ];

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
