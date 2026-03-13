import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../router/app_router.dart';
import '../../../router/page_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/custom_grid.dart';
import '../ajustment/inventory_adjustment_dialog.dart';
import '../inventory_controller.dart';

/// The products table view.
class ProductsTable extends StatelessWidget {
  /// Constructs of new [ProductsTable].
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<InventoryController>();
    final invLevels = controller.filteredProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (invLevels.isEmpty)
          Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    const Icon(LucideIcons.box),
                    Text(
                      Intls.to.noDataFound,
                      style: ShadTheme.of(context).textTheme.muted,
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ],
          )
        else
          _InventoryGridView(inv: invLevels),
      ],
    );
  }
}

class _InventoryGridView extends StatelessWidget {
  const _InventoryGridView({required this.inv});

  final List<InventoryLevelWithProduct> inv;

  @override
  Widget build(BuildContext context) {
    final controller = context.read<InventoryController>();
    final isMobile = ResponsiveUtils.isMobile(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            CustomGrid(
              minItemWidth: 270,
              mainAxisExtent: 250,
              crossSpacing: 20,
              children: inv.map((inv) {
                return _InventoryCard(
                  product: inv,
                  onTap: () {
                    if (isMobile) {
                      AppRouter.push(
                        context,
                        PagesRoutes.inventoryDetail.create(
                          InventoryDetailParameters(
                            productId: inv.product.refId,
                          ),
                        ),
                      );

                      return;
                    }
                    controller.selectItem(inv);
                  },
                  onEdit: () {
                    if (isMobile) {
                      AppRouter.push(
                        context,
                        PagesRoutes.inventoryAjustment.create(
                          InventoryDetailParameters(
                            productId: inv.product.refId,
                          ),
                        ),
                      );

                      return;
                    }
                    showShadDialog(
                      context: context,
                      builder: (context) => InventoryAdjustmentDialog(
                        productId: inv.product.refId,
                      ),
                    );
                  },
                );
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard({
    required this.product,
    required this.onTap,
    required this.onEdit,
  });

  final InventoryLevelWithProduct product;
  final VoidCallback onTap;
  final VoidCallback onEdit;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return InkWell(
      onTap: onTap,
      borderRadius: const BorderRadius.all(Radius.circular(8)),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: theme.colorScheme.border),
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          color: theme.colorScheme.background,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header with product name and edit button
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _ProductNameCell(product: product.globalProduct),
                  ),
                  ShadIconButton.ghost(
                    icon: const Icon(LucideIcons.pencil, size: 16),
                    onPressed: onEdit,
                  ),
                ],
              ),
            ),

            const Divider(height: 1),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // Barcode
                    _InfoRow(
                      label: Intls.to.barcode,
                      child: Text(
                        product.globalProduct.hasBarCodeValue() &&
                                product.globalProduct.barCodeValue.isNotEmpty
                            ? product.globalProduct.barCodeValue
                            : 'N/A',
                        style: theme.textTheme.small,
                      ),
                    ),

                    // Status
                    _InfoRow(
                      label: Intls.to.status,
                      expandedChild: false,
                      child: _StatusCell(inventory: product),
                    ),

                    // Price
                    _InfoRow(
                      label: Intls.to.price,
                      child: Text(
                        Formatters.formatCurrency(
                          product.product.salePrice.toDouble(),
                        ),
                        style: theme.textTheme.small.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // Stock
                    _InfoRow(
                      label: Intls.to.stock,
                      child: _StockCell(inventoryLevel: product.level),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow({
    required this.label,
    required this.child,
    this.expandedChild = true,
  });

  final String label;
  final Widget child;
  final bool expandedChild;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          width: 80,
          child: Text(
            label,
            style: theme.textTheme.small.copyWith(
              color: theme.colorScheme.mutedForeground,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(width: 12),
        expandedChild ? Expanded(child: child) : child,
      ],
    );
  }
}

class _ProductNameCell extends StatelessWidget {
  const _ProductNameCell({required this.product});

  final GlobalProduct product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      spacing: 5,
      children: [
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(8)),
            color: ShadTheme.of(context).colorScheme.accent,
          ),
          child: FutureBuilder<String?>(
            future: product.getPrimaryImageUrl(),
            builder: (context, snapshot) {
              final data = snapshot.data;
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  data != null) {
                return ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: FadeInImage.assetNetwork(
                    placeholder: StaticImages.placeholder,
                    image: data,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (context, error, stackTrace) {
                      return const Icon(LucideIcons.package, size: 20);
                    },
                    placeholderErrorBuilder: (context, error, stackTrace) {
                      return const Icon(LucideIcons.package, size: 20);
                    },
                  ),
                );
              }

              return const Icon(LucideIcons.package, size: 20);
            },
          ),
        ),
        const SizedBox(width: 8),
        Flexible(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                product.label,
                style: theme.textTheme.small.copyWith(
                  fontWeight: FontWeight.w600,
                  color: theme.colorScheme.foreground,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 2),
              Text(
                product.categories.map((c) => c.name).take(2).join(' > '),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.small.copyWith(
                  color: theme.colorScheme.mutedForeground,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _StockCell extends StatelessWidget {
  const _StockCell({required this.inventoryLevel});

  final InventoryLevel inventoryLevel;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Text(
      '${inventoryLevel.quantityOnHand} ${Intls.to.units}',
      style: theme.textTheme.list,
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.inventory});

  final InventoryLevelWithProduct inventory;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: inventory.stockStatus.color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        inventory.stockStatus.label?.toUpperCase() ?? '',
        style: theme.textTheme.muted.copyWith(
          color: AppColors.grey0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
