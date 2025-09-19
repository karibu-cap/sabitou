import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/formatters.dart';
import '../reports_controller.dart';

/// The top performing product.
class TopPerformingProductView extends StatelessWidget {
  /// Constructor of new [TopPerformingProductView].
  const TopPerformingProductView({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.topPerformingProducts,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
          ),
          Text(
            Intls.to.byQuantitySold,
            style: ShadTheme.of(context).textTheme.muted,
          ),
          const SizedBox(height: 16),
          controller.topPerformingProducts.isEmpty
              ? Center(child: Text(Intls.to.noData))
              : Column(
                  children: controller.topPerformingProducts.take(5).map((e) {
                    final index =
                        controller.topPerformingProducts.indexOf(e) + 1;

                    return ShadCard(
                      child: ListTile(
                        leading: Container(
                          width: 30,
                          height: 30,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ShadTheme.of(
                              context,
                            ).colorScheme.primary.withValues(alpha: 0.1),
                          ),
                          child: Center(
                            child: Text(
                              index.toString(),
                              style: ShadTheme.of(context).textTheme.list
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        title: Text(
                          e.productName,
                          style: ShadTheme.of(context).textTheme.list.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        subtitle: Text(
                          '${e.quantity.toString()} ${Intls.to.unitsSold}',
                          style: ShadTheme.of(context).textTheme.muted,
                        ),
                        trailing: Text(
                          Formatters.formatCurrency(e.salesValue),
                          style: ShadTheme.of(context).textTheme.list.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ),
        ],
      ),
    );
  }
}
