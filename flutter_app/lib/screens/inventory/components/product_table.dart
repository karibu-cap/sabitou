import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../inventory_controller.dart';
import 'create_edit_product_form_view.dart';

/// The products table view.
class ProductsTable extends StatelessWidget {
  /// Constructs of new [ProductsTable].
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final controller = context.watch<InventoryController>();

    return ShadCard(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: controller.products.isEmpty
            ? Center(child: Text(Intls.to.noProductsFoundAddNewProduct))
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ProductsTableHeader(
                    productCount: controller.products.length,
                  ),
                  const SizedBox(height: 20),
                  if (!isMobile)
                    _ProductsDataTable(products: controller.filteredProducts)
                  else
                    _ProductsCardList(products: controller.filteredProducts),
                ],
              ),
      ),
    );
  }
}

class _ProductsTableHeader extends StatelessWidget {
  const _ProductsTableHeader({required this.productCount});

  final int productCount;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(LucideIcons.package, size: 20),
            const SizedBox(width: 8),
            Text(
              '${Intls.to.products} ($productCount)',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          Intls.to.manageYourProducts,
          style: ShadTheme.of(context).textTheme.muted,
        ),
      ],
    );
  }
}

class _ProductsDataTable extends StatelessWidget {
  const _ProductsDataTable({required this.products});

  final List<Product> products;

  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();

    return Scrollbar(
      controller: scrollController,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        controller: scrollController,
        child: DataTable(
          horizontalMargin: 12,
          dataRowMaxHeight: 80,
          columns: [
            DataColumn(label: Text(Intls.to.product)),
            DataColumn(label: Text(Intls.to.category)),
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
                  _CategoryCell(
                    categories: product.globalProduct.categories
                        .map((c) => c.name)
                        .toList(),
                  ),
                ),
                DataCell(
                  Text(
                    Formatters.formatCurrency(
                      product.businessProduct.priceInCents.toDouble(),
                    ),
                    style: ShadTheme.of(context).textTheme.p,
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
        .map((c) => c.name)
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
                        product.globalProduct.name,
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
                      product.businessProduct.priceInCents.toDouble(),
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
                  value: '${product.businessProduct.stockQuantity} units',
                  color: isLowStock(product.businessProduct)
                      ? AppColors.warningColor
                      : AppColors.dartGreen,
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(Intls.to.expiry, style: theme.textTheme.p),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(product.globalProduct.name, style: theme.textTheme.large),
        Text(
          switch (product.globalProduct.barCodeValue.length) {
            > 0 && > 5 =>
              '#${product.globalProduct.barCodeValue.substring(0, 5)}',
            > 0 && < 5 => '#${product.globalProduct.barCodeValue}',
            _ => '',
          },
          style: theme.textTheme.muted.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}

class _CategoryCell extends StatelessWidget {
  const _CategoryCell({required this.categories});

  final List<String> categories;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 4,
      runSpacing: 4,
      children: categories.map((category) {
        return ShadBadge(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Text(category),
        );
      }).toList(),
    );
  }
}

class _StockCell extends StatelessWidget {
  const _StockCell({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${product.businessProduct.stockQuantity} units',
          style: theme.textTheme.p,
        ),
        Text(
          'Min: ${product.businessProduct.minStockThreshold}',
          style: theme.textTheme.muted,
        ),
      ],
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
      if (product.businessProduct.stockQuantity <= 0) {
        return (text: Intls.to.outOfStock, color: AppColors.red);
      } else if (isLowStock(product.businessProduct)) {
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
        color: status.color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
      child: Text(
        status.text,
        style: theme.textTheme.muted.copyWith(
          color: status.color,
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

    if (!product.businessProduct.hasExpirationDate()) {
      return const SizedBox.shrink();
    }

    return Text(
      Formatters.formatDate(
        product.businessProduct.expirationDate.toDateTime(),
      ),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.muted.copyWith(
        fontSize: 12,
        color: isExpiringSoon(product.businessProduct, 60)
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
    void _showProductDialog(BuildContext context, Product product) {
      final controller = context.read<InventoryController>();
      showShadDialog(
        context: context,
        builder: (context) => CreateEditProductFormView(
          product: product,
          inventoryController: controller,
        ),
      );
    }

    void _showDeleteDialog(BuildContext context, Product product) {
      showShadDialog(
        context: context,
        builder: (context) => _DeleteProductDialog(product: product),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        FutureBuilder(
          future: hasPermission(
            ResourceType.RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_UPDATE,
          ),
          builder: (context, snapshot) {
            final canUpdate = snapshot.data ?? false;
            if (!canUpdate) {
              return const Text('N/A');
            }

            return IconButton(
              icon: const Icon(LucideIcons.squarePen400),
              onPressed: () => _showProductDialog(context, product),
            );
          },
        ),
        FutureBuilder(
          future: hasPermission(
            ResourceType.RESOURCE_TYPE_PRODUCT,
            ResourceActionType.RESOURCE_ACTION_TYPE_REMOVE,
          ),
          builder: (context, snapshot) {
            final canDelete = snapshot.data ?? false;
            if (!canDelete) {
              return const Text('N/A');
            }

            return IconButton(
              icon: const Icon(LucideIcons.trash2400),
              onPressed: () => _showDeleteDialog(context, product),
            );
          },
        ),
      ],
    );
  }
}

class _DeleteProductDialog extends StatelessWidget {
  const _DeleteProductDialog({required this.product});

  final Product product;

  @override
  Widget build(BuildContext context) {
    Future<void> _deleteProduct(BuildContext context) async {
      final result = await context.read<InventoryController>().deleteProduct(
        product.businessProduct.businessId,
      );
      if (result) {
        Navigator.of(context).pop();
        ShadToaster.of(context).show(
          ShadToast(
            title: Text(Intls.to.success),
            description: Text(Intls.to.productDeletedSuccessfully),
          ),
        );
      } else {
        ShadToaster.of(context).show(
          ShadToast.destructive(
            description: Text(
              Intls.to.failedToDeleteProduct.trParams({
                'name': product.globalProduct.name,
              }),
            ),
          ),
        );
      }
    }

    return ShadDialog(
      title: Text(Intls.to.deleteProduct),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            Intls.to.areYouSureYouWantToDelete.trParams({
              'name': product.globalProduct.name,
            }),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ShadButton.raw(
                variant: ShadButtonVariant.outline,
                onPressed: () => Navigator.of(context).pop(),
                child: Text(Intls.to.cancel),
              ),
              const SizedBox(width: 12),
              ShadButton(
                onPressed: () => _deleteProduct(context),
                child: Text(Intls.to.delete),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
