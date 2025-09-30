import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../../../utils/common_functions.dart';
import '../../../utils/formatters.dart';
import '../reports_controller.dart';
import '../reports_view_model.dart';

/// The inventory value trend.
class InventoryValueTrend extends StatelessWidget {
  /// Constructor of new [InventoryValueTrend].
  const InventoryValueTrend({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    // Create monthly data for inventory value trend
    final List<ChartData<String>> chartData = List.generate(12, (index) {
      final month = index + 1;
      final monthName = getMonthName(month);

      // For demo purposes, we'll create sample inventory value data
      // In a real app, this would come from historical inventory data
      final baseValue = controller.totalInventoryValue;
      final monthlyVariation = (month - 6) * 0.1; // Simulate seasonal variation

      return ChartData<String>(
        x: monthName,
        y: (baseValue * (1 + monthlyVariation)).toDouble(),
      );
    });

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Inventory Value Trend',
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            'Monthly inventory value changes over time',
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Current Value: ${Formatters.formatCurrency(controller.totalInventoryValue)}',
                style: ShadTheme.of(context).textTheme.small,
              ),
              Text(
                'Total Products: ${controller.totalProducts}',
                style: ShadTheme.of(context).textTheme.small,
              ),
            ],
          ),
          const SizedBox(height: 16),
          SizedBox(
            height: 200,
            child: SfCartesianChart(
              primaryXAxis: const CategoryAxis(),
              tooltipBehavior: TooltipBehavior(enable: true),
              series: [
                SplineAreaSeries<ChartData<String>, String>(
                  dataSource: chartData,
                  xValueMapper: (data, _) => data.x,
                  yValueMapper: (data, _) => data.y,
                  gradient: LinearGradient(
                    colors: [
                      ShadTheme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.3),
                      ShadTheme.of(
                        context,
                      ).colorScheme.primary.withValues(alpha: 0.1),
                    ],
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                  ),
                  borderColor: ShadTheme.of(context).colorScheme.primary,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
