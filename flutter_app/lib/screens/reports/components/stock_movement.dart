import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The stock movement.
class StockMovement extends StatelessWidget {
  /// Constructor of new [StockMovement].
  const StockMovement({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    // Get inventory data from the InventoryReportViewModel through the controller
    final inventoryData = controller.agingItems;

    // Create monthly data from aging items
    final List<ChartData<String>> chartDatas = List.generate(12, (index) {
      final month = index + 1;
      final monthName = getMonthName(month);

      return ChartData<String>(
        x: monthName,
        y: inventoryData
            .where((item) => item.lastMovementDate.toDateTime().month == month)
            .fold(
              0.0,
              (previousValue, element) =>
                  (previousValue ?? 0.0) +
                  element.daysSinceLastMovement.toDouble(),
            ),
      );
    });

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
