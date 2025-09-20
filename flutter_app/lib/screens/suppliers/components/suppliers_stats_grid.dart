import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/stat_card.dart';
import '../suppliers_controller.dart';
import 'list_components/supplier_shimmer_widgets.dart';

/// Grid component for displaying supplier statistics.
class SuppliersStatsGrid extends StatelessWidget {
  /// Constructs a new SuppliersStatsGrid.
  const SuppliersStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context, listen: false);
    final appIntl = AppInternationalizationService.to;

    return StreamBuilder<List<Supplier>>(
      stream: controller.suppliersStream,
      builder: (context, suppliersSnapshot) {
        if (suppliersSnapshot.connectionState == ConnectionState.waiting) {
          return SupplierShimmerWidgets.buildStatsShimmer();
        }

        final suppliers = suppliersSnapshot.data ?? [];
        final totalSuppliers = suppliers.length;
        final activeSuppliers = suppliers.where((s) => s.isActive).length;

        return StreamBuilder<List<StoreProduct>>(
          stream: controller.productsStream,
          builder: (context, productsSnapshot) {
            if (productsSnapshot.connectionState == ConnectionState.waiting) {
              return SupplierShimmerWidgets.buildStatsShimmer();
            }
            final products = productsSnapshot.data ?? [];
            final totalProducts = controller.calculateTotalProducts(products);
            final avgProductsPerSupplier = controller
                .calculateAverageProductsPerSupplier(
                  totalProducts,
                  totalSuppliers,
                );
            final totalInventoryValue = controller.calculateTotalValue(
              products,
            );

            final statsCards = [
              StatCard(
                title: appIntl.totalSuppliersCount,
                value: totalSuppliers.toString(),
                change:
                    '$activeSuppliers ${appIntl.activeSuppliersText.toLowerCase()}',
                icon: LucideIcons.building400,
                color: AppColors.cobalt,
              ),
              StatCard(
                title: appIntl.totalProductsCount,
                value: totalProducts.toString(),
                change: appIntl.fromAllSuppliersText,
                icon: LucideIcons.package400,
                color: AppColors.dartGreen,
              ),
              StatCard(
                title: appIntl.avgProductsText,
                value: avgProductsPerSupplier,
                change: appIntl.perSupplierText,
                icon: LucideIcons.trendingUp400,
                color: AppColors.purple,
              ),
              StatCard(
                title: appIntl.totalValueText,
                value: Formatters.formatCurrency(totalInventoryValue),
                change: appIntl.totalValueText,
                icon: LucideIcons.check400,
                color: AppColors.orange500,
              ),
            ];

            return CustomGrid(
              children: statsCards,
              minItemWidth: 250,
              mainAxisExtent: 100,
              crossSpacing: 20,
            );
          },
        );
      },
    );
  }
}
