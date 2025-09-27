import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../utils/utils.dart';
import '../../../widgets/loading.dart';
import '../inventory_controller.dart';
import 'form/ajustment_stock_form.dart';

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
          StreamBuilder<List<Product>>(
            stream: controller.filteredProductsStream,
            builder: (context, snapshot) {
              final products = snapshot.data;
              if (!snapshot.hasData || products == null) {
                return const Loading();
              }

              return products.isEmpty
                  ? Center(child: Text(Intls.to.noProductsFoundAddNewProduct))
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (!isMobile)
                          _ProductsDataTable(products: products)
                        else
                          _ProductsCardList(products: products),
                      ],
                    );
            },
          ),
        ],
      ),
    );
  }
}

class _ProductsDataTable extends StatelessWidget {
  const _ProductsDataTable({required this.products});

  final List<Product> products;

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
                  DataColumn(label: Text(Intls.to.expiry)),
                  DataColumn(label: Text(Intls.to.actions)),
                ],
                rows: products.map((product) {
                  return DataRow(
                    cells: [
                      DataCell(_ProductNameCell(product: product)),
                      DataCell(
                        Text(
                          product.globalProduct.barCodeValue,
                          style: ShadTheme.of(context).textTheme.list,
                        ),
                      ),
                      DataCell(
                        Text(
                          Formatters.formatCurrency(
                            product.storeProduct.salePrice.toDouble(),
                          ),
                          style: ShadTheme.of(context).textTheme.list.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      DataCell(_StockCell(product: product)),
                      DataCell(_StatusCell(product: product)),
                      DataCell(_ExpiryCell(product: product)),
                      DataCell(_ActionsCell(product: product)),
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

class _ProductsCardList extends StatelessWidget {
  const _ProductsCardList({required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: products.length,
      separatorBuilder: (context, index) => const SizedBox(height: 12),
      itemBuilder: (context, index) {
        final product = products[index];

        return _ProductCard(product: product);
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  const _ProductCard({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final category = product.globalProduct.categories
        .map((c) => c.label)
        .toList();

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
                        product.globalProduct.label,
                        style: theme.textTheme.large,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        switch (product.globalProduct.barCodeValue.length) {
                          > 0 && > 5 =>
                            '#${product.globalProduct.barCodeValue.substring(0, 5)}',
                          > 0 && < 5 =>
                            '#${product.globalProduct.barCodeValue}',
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
                _ActionsCell(product: product),
              ],
            ),
            const SizedBox(height: 12),
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
                    Formatters.formatCurrency(
                      product.storeProduct.salePrice.toDouble(),
                    ),
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
                  value: '${product.storeProduct.stockQuantity} units',
                  color: isLowStock(product.storeProduct)
                      ? AppColors.warningColor
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
                _ExpiryCell(product: product),
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

  final Product product;

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
              product.globalProduct.imagesLinksIds.isNotEmpty &&
                  AppUtils.isURL(product.globalProduct.imagesLinksIds.first)
              ? FutureBuilder(
                  future: precacheImage(
                    NetworkImage(product.globalProduct.imagesLinksIds.first),
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
                        image: product.globalProduct.imagesLinksIds.first,
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
                product.globalProduct.label,
                style: theme.textTheme.large.copyWith(
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                product.globalProduct.categories
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
  const _StockCell({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Text(
      '${product.storeProduct.stockQuantity} ${Intls.to.units}',
      style: theme.textTheme.list,
    );
  }
}

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    ({String text, Color color}) getProductStatus(Product product) {
      if (product.storeProduct.stockQuantity <= 0) {
        return (text: Intls.to.outOfStock, color: AppColors.red);
      } else if (isLowStock(product.storeProduct)) {
        return (text: Intls.to.lowStock, color: AppColors.warningColor);
      } else {
        return (
          text: Intls.to.inStock.trParams({'quantity': ''}),
          color: AppColors.dartGreen,
        );
      }
    }

    final status = getProductStatus(product);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color,
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        status.text.toUpperCase(),
        style: theme.textTheme.muted.copyWith(
          color: AppColors.grey0,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _ExpiryCell extends StatelessWidget {
  const _ExpiryCell({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    if (!product.storeProduct.hasExpirationDate()) {
      return const Text('N/A');
    }

    return Text(
      Formatters.formatDate(product.storeProduct.expirationDate.toDateTime()),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.list.copyWith(
        color: isExpiringSoon(product.storeProduct, 60)
            ? AppColors.error600
            : null,
      ),
    );
  }
}

class _ActionsCell extends StatelessWidget {
  const _ActionsCell({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    void _showProductDialog(BuildContext context, Product product) async {
      final controller = context.read<InventoryController>();
      final result = await showShadDialog<bool?>(
        context: context,
        builder: (context) => AdjustmentStockForm(
          product: product,
          inventoryController: controller,
        ),
      );
      if (result == true) {
        await controller.refreshProducts();
      }
    }

    void _showDeleteDialog(BuildContext context, Product product) {
      final controller = context.read<InventoryController>();
      showShadDialog(
        context: context,
        builder: (context) =>
            _DeleteProductDialog(product: product, controller: controller),
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
          onPressed: () => _showProductDialog(context, product),
        ),
        ShadButton.ghost(
          child: Icon(
            LucideIcons.trash2400,
            color: ShadTheme.of(context).colorScheme.destructive,
            size: 15,
          ),
          onPressed: () => _showDeleteDialog(context, product),
        ),
      ],
    );
  }
}

class _DeleteProductDialog extends StatelessWidget {
  _DeleteProductDialog({required this.product, required this.controller});

  final Product product;
  final InventoryController controller;
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    Future<void> _deleteProduct() async {
      if (!context.mounted) {
        return;
      }
      isLoading.value = true;
      final result = await controller.deleteProduct(product.storeProduct.refId);
      if (result) {
        showSuccessToast(
          context: context,
          message: Intls.to.productDeletedSuccessfully,
        );
      } else {
        showErrorToast(
          context: context,
          message: Intls.to.failedToDeleteProduct.trParams({
            'name': product.globalProduct.label,
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
                  'name': product.globalProduct.label,
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
