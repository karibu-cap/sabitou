import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/extensions/inventory_extenxions.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/loading.dart';
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
                  ? Column(
                      children: [
                        Icon(
                          LucideIcons.box,
                          size: 48,
                          color: ShadTheme.of(context).colorScheme.muted,
                        ),
                        Text(
                          Intls.to.noProductsFoundAddNewProduct,
                          style: ShadTheme.of(context).textTheme.muted,
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
    final ScrollController scrollController = ScrollController();

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scrollbar(
          controller: scrollController,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            controller: scrollController,
            child: Container(
              constraints: BoxConstraints(minWidth: constraints.maxWidth),
              child: DataTable(
                horizontalMargin: 12,
                dataRowMaxHeight: 80,
                headingTextStyle: ShadTheme.of(
                  context,
                ).textTheme.lead.copyWith(fontWeight: FontWeight.w500),
                headingRowColor: WidgetStateProperty.all(
                  ShadTheme.of(context).colorScheme.secondary,
                ),
                columns: [
                  DataColumn(label: Text(Intls.to.product)),
                  DataColumn(label: Text(Intls.to.barcode)),
                  DataColumn(label: Text(Intls.to.price)),
                  DataColumn(label: Text(Intls.to.stock)),
                  DataColumn(label: Text(Intls.to.status)),
                  DataColumn(label: Text(Intls.to.actions)),
                ],
                rows: inv.map((inv) {
                  return DataRow(
                    cells: [
                      DataCell(_ProductNameCell(product: inv.globalProduct)),
                      DataCell(
                        Text(
                          inv.globalProduct.barCodeValue,
                          style: ShadTheme.of(context).textTheme.list,
                        ),
                      ),
                      DataCell(
                        Text(
                          Formatters.formatCurrency(
                            inv.product.salePrice.toDouble(),
                          ),
                          style: ShadTheme.of(context).textTheme.list.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(_StockCell(inventoryLevel: inv.level)),
                      DataCell(_StatusCell(inventory: inv)),
                      DataCell(_ActionsCell(inventory: inv)),
                    ],
                  );
                }).toList(),
              ),
            ),
          ),
        );
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
                _ActionsCell(inventory: inv),
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
            color: ShadTheme.of(
              context,
            ).colorScheme.accent.withValues(alpha: 0.05),
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
                          return Icon(
                            LucideIcons.package,
                            size: 20,
                            color: ShadTheme.of(context).colorScheme.accent,
                          );
                        },
                        placeholderErrorBuilder: (context, error, stackTrace) {
                          return Icon(
                            LucideIcons.package,
                            size: 20,
                            color: ShadTheme.of(context).colorScheme.accent,
                          );
                        },
                      );
                    }

                    return Icon(
                      LucideIcons.package,
                      size: 20,
                      color: ShadTheme.of(context).colorScheme.accent,
                    );
                  },
                )
              : Icon(
                  LucideIcons.package,
                  size: 20,
                  color: ShadTheme.of(context).colorScheme.accent,
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
                style: theme.textTheme.large.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                product.categories
                    .map((c) => c.name)
                    .take(2)
                    .join(' > ')
                    .toString(),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.muted,
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

class _ActionsCell extends StatelessWidget {
  const _ActionsCell({required this.inventory});

  final InventoryLevelWithProduct inventory;

  @override
  Widget build(BuildContext context) {
    void _showProductDialog(BuildContext context) async {
      final controller = context.read<InventoryController>();
      // final result = await showShadDialog<bool?>(
      //   context: context,
      //   builder: (context) => AdjustmentStockForm(
      //     product: product,
      //     inventoryController: controller,
      //   ),
      // );
      // if (result == true) {
      //   await controller.refreshProducts();
      // }
    }

    void _showDeleteDialog(BuildContext context) {
      final controller = context.read<InventoryController>();
      showShadDialog(
        context: context,
        builder: (context) =>
            _DeleteProductDialog(inventory: inventory, controller: controller),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        ShadButton.ghost(
          child: Icon(
            LucideIcons.squarePen400,
            color: ShadTheme.of(context).colorScheme.primary,
            size: 15,
          ),
          onPressed: () => _showProductDialog(context),
        ),
        ShadButton.ghost(
          child: Icon(
            LucideIcons.trash2400,
            color: ShadTheme.of(context).colorScheme.destructive,
            size: 15,
          ),
          onPressed: () => _showDeleteDialog(context),
        ),
      ],
    );
  }
}

class _DeleteProductDialog extends StatelessWidget {
  _DeleteProductDialog({required this.inventory, required this.controller});

  final InventoryLevelWithProduct inventory;
  final InventoryController controller;
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Future<void> _deleteProduct() async {
      if (!context.mounted) {
        return;
      }
      isLoading.value = true;
      final result = await controller.deleteProduct(inventory.product.refId);
      if (result) {
        showSuccessToast(
          context: context,
          message: Intls.to.productDeletedSuccessfully,
        );
      } else {
        showErrorToast(
          context: context,
          message: Intls.to.failedToDeleteProduct.trParams({
            'name': inventory.globalProduct.label,
          }),
        );
      }
      isLoading.value = false;

      Navigator.of(context).pop();
    }

    return ShadDialog(
      title: Text(Intls.to.deleteProduct),
      child: ValueListenableBuilder(
        valueListenable: isLoading,
        builder: (context, value, child) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                Intls.to.areYouSureYouWantToDelete.trParams({
                  'name': inventory.globalProduct.label,
                }),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ShadButton.raw(
                    variant: ShadButtonVariant.outline,
                    enabled: !value,
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text(Intls.to.cancel),
                  ),
                  const SizedBox(width: 12),
                  ShadButton.destructive(
                    enabled: !value,
                    trailing: value ? const Loading.button() : null,
                    onPressed: _deleteProduct,
                    child: Text(Intls.to.delete),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
