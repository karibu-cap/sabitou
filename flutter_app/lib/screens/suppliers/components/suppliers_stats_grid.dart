import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../widgets/grid/responsitive_grid.dart';
import '../suppliers_controller.dart';
import 'list_components/supplier_shimmer_widgets.dart';

/// Grid component for displaying supplier statistics.
class SuppliersStatsGrid extends StatelessWidget {
  /// Contructs a new SuppliersStatsGrid.
  const SuppliersStatsGrid({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context);
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
                subtitle:
                    '$activeSuppliers ${appIntl.activeSuppliersText.toLowerCase()}',
                icon: LucideIcons.building400,
                color: Colors.blue,
              ),
              StatCard(
                title: appIntl.totalProductsCount,
                value: totalProducts.toString(),
                subtitle: appIntl.fromAllSuppliersText,
                icon: LucideIcons.package400,
                color: Colors.green,
              ),
              StatCard(
                title: appIntl.avgProductsText,
                value: avgProductsPerSupplier,
                subtitle: appIntl.perSupplierText,
                icon: LucideIcons.trendingUp400,
                color: Colors.purple,
              ),
              StatCard(
                title: appIntl.totalValueText,
                value: totalInventoryValue.toStringAsFixed(0),
                subtitle: appIntl.totalValueText,
                icon: LucideIcons.check400,
                color: Colors.orange,
              ),
            ];

            return LayoutBuilder(
              builder: (context, constraints) {
                final int columns = (constraints.maxWidth / 250).floor();

                return ResponsiveGrid(
                  mainAxisExtent: 150,
                  crossAxisCount: columns,
                  children: statsCards,
                );
              },
            );
          },
        );
      },
    );
  }
}

/// Individual stat card widget
class StatCard extends StatelessWidget {
  /// Contructs a new StatCard.

  /// The title of the stat card.
  final String title;

  /// The value of the stat card.
  final String value;

  /// The subtitle of the stat card.
  final String subtitle;

  /// The icon of the stat card.
  final IconData icon;

  /// The color of the stat card.
  final Color color;

  /// Contructs a new StatCard.
  const StatCard({
    super.key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.icon,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ShadCard(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AutoSizeText(
                title,
                style: ShadTheme.of(
                  context,
                ).textTheme.p.copyWith(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: color.withValues(alpha: 0.1),
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                ),
                child: Icon(icon, color: color, size: 20),
              ),
            ],
          ),
          const SizedBox(height: 6),
          AutoSizeText(
            value,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontSize: 24, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          AutoSizeText(
            subtitle,
            style: ShadTheme.of(
              context,
            ).textTheme.p.copyWith(fontSize: 12, color: Colors.grey[600]),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
