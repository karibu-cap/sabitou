import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The stock movement.
class StockMovement extends StatelessWidget {
  /// Constructor of new [StockMovement].
  const StockMovement({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    final List<ChartData<String>> chartDatas = [
      ChartData(
        x: 'Jan',
        y: controller.stockMovementData
            .where((data) => data.date.month == 1)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Feb',
        y: controller.stockMovementData
            .where((data) => data.date.month == 2)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Mar',
        y: controller.stockMovementData
            .where((data) => data.date.month == 3)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Apr',
        y: controller.stockMovementData
            .where((data) => data.date.month == 4)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'May',
        y: controller.stockMovementData
            .where((data) => data.date.month == 5)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Jun',
        y: controller.stockMovementData
            .where((data) => data.date.month == 6)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Jul',
        y: controller.stockMovementData
            .where((data) => data.date.month == 7)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Aug',
        y: controller.stockMovementData
            .where((data) => data.date.month == 8)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Sep',
        y: controller.stockMovementData
            .where((data) => data.date.month == 9)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Oct',
        y: controller.stockMovementData
            .where((data) => data.date.month == 10)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Nov',
        y: controller.stockMovementData
            .where((data) => data.date.month == 11)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
      ChartData(
        x: 'Dec',
        y: controller.stockMovementData
            .where((data) => data.date.month == 12)
            .fold(
              0,
              (previousValue, element) =>
                  (previousValue ?? 0) + element.nbOfTransaction,
            ),
      ),
    ];

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.stockMovement,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            Intls.to.stockInOutMovement,
            style: ShadTheme.of(context).textTheme.muted,
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
