import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../../../widgets/custom_grid.dart';
import '../reports_controller.dart';

/// The [InventoryInStock] widget.
class InventoryInStock extends StatelessWidget {
  /// Constructs of new [InventoryInStock].
  const InventoryInStock({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ReportsController>();

    return CustomGrid(
      minItemWidth: 300,
      mainAxisExtent: 100,
      children: [
        ShadCard(
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          columnMainAxisAlignment: MainAxisAlignment.center,
          rowMainAxisAlignment: MainAxisAlignment.center,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.storeProducts
                    .fold(
                      0,
                      (previousValue, element) =>
                          previousValue +
                          (element.stockQuantity > 0 && !isLowStock(element)
                              ? 1
                              : 0),
                    )
                    .toString(),
                style: ShadTheme.of(
                  context,
                ).textTheme.h4.copyWith(color: AppColors.success700),
              ),
              Text(
                Intls.to.totalItemsInStock,
                style: ShadTheme.of(context).textTheme.small,
              ),
            ],
          ),
        ),
        ShadCard(
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          columnMainAxisAlignment: MainAxisAlignment.center,
          rowMainAxisAlignment: MainAxisAlignment.center,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.storeProducts
                    .fold(
                      0,
                      (previousValue, element) =>
                          previousValue + (isLowStock(element) ? 1 : 0),
                    )
                    .toString(),
                style: ShadTheme.of(
                  context,
                ).textTheme.h4.copyWith(color: AppColors.orange500),
              ),
              Text(
                Intls.to.lowStockItems,
                style: ShadTheme.of(context).textTheme.small,
              ),
            ],
          ),
        ),
        ShadCard(
          columnCrossAxisAlignment: CrossAxisAlignment.center,
          columnMainAxisAlignment: MainAxisAlignment.center,
          rowMainAxisAlignment: MainAxisAlignment.center,
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                controller.storeProducts
                    .fold(
                      0,
                      (previousValue, element) =>
                          previousValue + (element.stockQuantity <= 0 ? 1 : 0),
                    )
                    .toString(),
                style: ShadTheme.of(
                  context,
                ).textTheme.h4.copyWith(color: AppColors.error500),
              ),
              Text(
                Intls.to.outOfStockItems,
                style: ShadTheme.of(context).textTheme.small,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
