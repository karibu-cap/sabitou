import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../services/internationalization/internationalization.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The sales by categories.
class SalesByCategories extends StatelessWidget {
  /// Constructor of new [SalesByCategories].
  const SalesByCategories({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    // Use category sales data from the reports view model (pre-calculated by backend)
    final categorySalesData = controller.categorySalesData;

    if (categorySalesData.isEmpty) {
      return const SizedBox.shrink();
    }

    final List<ChartData<String>> chartDatas = categorySalesData
        .map(
          (category) => ChartData<String>(
            x: category.categoryName,
            y: category.totalSalesAmount,
            pointColor: controller.stringToColor(category.categoryName),
          ),
        )
        .toList();

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.salesByCategories,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            Intls.to.revenueDistribution,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 16),
          SfCircularChart(
            tooltipBehavior: TooltipBehavior(enable: true),
            legend: const Legend(
              isVisible: true,
              position: LegendPosition.bottom,
              overflowMode: LegendItemOverflowMode.wrap,
            ),
            series: [
              DoughnutSeries<ChartData<String>, String>(
                dataSource: chartDatas,
                xValueMapper: (data, _) => data.x,
                yValueMapper: (data, _) => data.y,
                pointColorMapper: (data, _) => data.pointColor,
                explode: true,
                explodeAll: true,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
