import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/shad_data_grid.dart';
import '../dialogs/inventory_adjustment_dialog.dart';
import '../inventory_controller.dart';

/// The products table view.
class ProductsTable extends StatelessWidget {
  /// Constructs of new [ProductsTable].
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final controller = context.read<InventoryController>();

    return ShadCard(
      padding: EdgeInsets.zero,
      radius: const BorderRadius.only(
        topLeft: Radius.circular(12),
        topRight: Radius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Intls.to.product,
                  style: ShadTheme.of(context).textTheme.h4,
                ),
                Text(
                  Intls.to.productManagementDescription,
                  style: ShadTheme.of(context).textTheme.muted,
                ),
              ],
            ),
          ),
          const SizedBox(height: 16),
          StreamBuilder<List<InventoryLevelWithProduct>>(
            stream: controller.filteredProductsStream,
            builder: (context, snapshot) {
              final invLevels = snapshot.data;
              if (!snapshot.hasData || invLevels == null) {
                return const Loading();
              }

              return invLevels.isEmpty
                  ? Row(
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
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isMobile)
                          _InventoryDataTable(inv: invLevels)
                        else
                          _InventoryCardList(inv: invLevels),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}

class _InventoryDataTable extends StatelessWidget {
  const _InventoryDataTable({required this.inv});

  final List<InventoryLevelWithProduct> inv;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = context.read<InventoryController>();

    return ShadDataGrid<InventoryLevelWithProduct>(
      data: inv,
      columns: [
        ShadDataGridColumn(label: Intls.to.product, width: 280),
        ShadDataGridColumn(label: Intls.to.barcode, width: 180),
        ShadDataGridColumn(label: Intls.to.status, width: 120),
        ShadDataGridColumn(label: Intls.to.price, width: 120),
        ShadDataGridColumn(label: Intls.to.stock, width: 120),
        const ShadDataGridColumn(label: '', width: 80),
      ],
      rowBuilder: (product) {
        return [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _ProductNameCell(product: product.globalProduct),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              product.globalProduct.hasBarCodeValue() &&
                      product.globalProduct.barCodeValue.isNotEmpty
                  ? product.globalProduct.barCodeValue
                  : 'N/A',
              style: theme.textTheme.small,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _StatusCell(inventory: product),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              Formatters.formatCurrency(product.product.salePrice.toDouble()),
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _StockCell(inventoryLevel: product.level),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.center,
            child: ShadIconButton.ghost(
              icon: const Icon(LucideIcons.pencil, size: 16),
              onPressed: () {
                showShadDialog(
                  context: context,
                  builder: (context) => InventoryAdjustmentDialog(
                    inventory: product,
                    inventoryController: controller,
                  ),
                );
              },
            ),
          ),
        ];
      },
    );
  }
}

class _InventoryCardList extends StatelessWidget {
  const _InventoryCardList({required this.inv});

  final List<InventoryLevelWithProduct> inv;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: inv.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final invLevel = inv[index];

        return _InventoryCard(inv: invLevel);
      },
    );
  }
}

class _InventoryCard extends StatelessWidget {
  const _InventoryCard({required this.inv});

  final InventoryLevelWithProduct inv;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final category = inv.globalProduct.categories.map((c) => c.label).toList();
    final controller = context.read<InventoryController>();

    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        inv.globalProduct.label,
                        style: theme.textTheme.large,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        switch (inv.globalProduct.barCodeValue.length) {
                          > 0 && > 5 =>
                            '#${inv.globalProduct.barCodeValue.substring(0, 5)}',
                          > 0 && < 5 => '#${inv.globalProduct.barCodeValue}',
                          _ => '',
                        },
                        style: theme.textTheme.muted.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            if (category.isNotEmpty)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(Intls.to.category, style: theme.textTheme.p),
                  Flexible(
                    child: Wrap(
                      children:
                          category
                              .map((c) => Text(c, style: theme.textTheme.muted))
                              .expand((c) => [c, const Text(', ')])
                              .toList()
                            ..removeLast(),
                    ),
                  ),
                ],
              ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Intls.to.price, style: theme.textTheme.p),
                Flexible(
                  child: Text(
                    Formatters.formatCurrency(inv.product.salePrice.toDouble()),
                    style: theme.textTheme.muted,
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Intls.to.stock, style: theme.textTheme.p),
                _InfoChip(
                  value: '${inv.level.quantityAvailable} units',
                  color: inv.stockStatus == StockStatus.STOCK_STATUS_LOW
                      ? AppColors.orange500
                      : AppColors.dartGreen,
                ),
              ],
            ),
            const SizedBox(height: 12),
            ShadButton.outline(
              child: const Text('Adjust Stock'),
              onPressed: () {
                showShadDialog(
                  context: context,
                  builder: (context) => InventoryAdjustmentDialog(
                    inventory: inv,
                    inventoryController: controller,
                  ),
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(Intls.to.expiry, style: theme.textTheme.p),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({required this.value, required this.color});

  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return ShadBadge(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      backgroundColor: color,
      hoverBackgroundColor: color.withValues(alpha: 0.8),
      foregroundColor: AppColors.grey0,
      child: Text(value),
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
          child:
              product.imagesLinksIds.isNotEmpty &&
                  AppUtils.isURL(product.imagesLinksIds.first)
              ? FutureBuilder(
                  future: precacheImage(
                    NetworkImage(product.imagesLinksIds.first),
                    context,
                    onError: (error, stackTrace) {
                      return null;
                    },
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.error == null) {
                      return FadeInImage.assetNetwork(
                        placeholder: StaticImages.placeholder,
                        image: product.imagesLinksIds.first,
                        fit: BoxFit.contain,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return const Icon(LucideIcons.package, size: 20);
                        },
                        placeholderErrorBuilder: (context, error, stackTrace) {
                          return const Icon(LucideIcons.package, size: 20);
                        },
                      );
                    }

                    return const Icon(LucideIcons.package, size: 20);
                  },
                )
              : const Icon(LucideIcons.package, size: 20),
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
      '${inventoryLevel.quantityAvailable} ${Intls.to.units}',
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
