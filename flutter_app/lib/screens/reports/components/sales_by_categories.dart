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

    final List<ChartData<String>> chartDatas = controller.categorySalesData
        .map((e) => e.categoryName)
        .toSet()
        .map(
          (e) => ChartData(
            x: e,
            y: controller.categorySalesData
                .where((element) => element.categoryName == e)
                .map((e) => e.itemQuantity)
                .reduce((value, element) => value + element),
            pointColor: controller.stringToColor(e),
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
