import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../inventory_controller.dart';

/// Inventory stats widget.
final class InventoryStats extends StatelessWidget {
  /// Constructs of new [InventoryStats].
  const InventoryStats({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<InventoryController>();

    return StreamBuilder<List<Product>>(
      stream: controller.productsStream,
      builder: (context, snapshot) {
        final products = snapshot.data;

        final stats = [
          StatCard(
            title: Intls.to.totalProducts,
            value: products?.length.toString() ?? '0',
            icon: LucideIcons.package400,
            color: AppColors.cobalt,
            trend: TrendType.neutral,
          ),
          StatCard(
            title: Intls.to.totalValue,
            value: Formatters.formatCurrency(
              products?.fold(
                    0,
                    (sum, p) => (sum ?? 0) + p.storeProduct.price,
                  ) ??
                  0,
            ),
            icon: LucideIcons.package400,
            color: AppColors.lightGreen,
            trend: TrendType.neutral,
          ),
          StatCard(
            title: Intls.to.lowStock,
            value:
                products
                    ?.where((p) => isLowStock(p.storeProduct))
                    .length
                    .toString() ??
                '0',
            icon: LucideIcons.triangleAlert,
            color: AppColors.warningColor,
            trend: TrendType.neutral,
          ),
          StatCard(
            title: Intls.to.outOfStock,
            value:
                products
                    ?.where((p) => p.storeProduct.stockQuantity <= 0)
                    .length
                    .toString() ??
                '0',
            icon: LucideIcons.triangleAlert,
            color: AppColors.red,
            trend: TrendType.down,
          ),
        ];

        return Shimmer(
          interval: const Duration(seconds: 5),
          enabled: !snapshot.hasData || products == null,
          child: CustomGrid(children: stats, minItemWidth: 250),
        );
      },
    );
  }
}
