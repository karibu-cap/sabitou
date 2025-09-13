import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extends_models.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/loading.dart';
import '../inventory_controller.dart';
import 'create_edit_product_form_view.dart';
import 'search_and_filter.dart';

/// The products table view.
class ProductsTable extends StatelessWidget {
  /// Constructs of new [ProductsTable].
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);
    final controller = context.read<InventoryController>();

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchAndFilterCard(),
          StreamBuilder<List<Product>>(
            stream: controller.filteredProductsStream,
            builder: (context, snapshot) {
              final products = snapshot.data;
              if (!snapshot.hasData || products == null) {
                return const Loading();
              }

              return Padding(
                padding: const EdgeInsets.all(20),
                child: products.isEmpty
                    ? Center(child: Text(Intls.to.noProductsFoundAddNewProduct))
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (!isMobile)
                            _ProductsDataTable(products: products)
                          else
                            _ProductsCardList(products: products),
                        ],
                      ),
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
        return ConstrainedBox(
          constraints: BoxConstraints(minWidth: constraints.maxWidth),
          child: Scrollbar(
            controller: scrollController,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              controller: scrollController,
              child: DataTable(
                horizontalMargin: 12,
                dataRowMaxHeight: 80,
                headingTextStyle: ShadTheme.of(
                  context,
                ).textTheme.p.copyWith(fontWeight: FontWeight.w600),
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
                      DataCell(Text(product.globalProduct.barCodeValue)),
                      DataCell(
                        Text(
                          Formatters.formatCurrency(
                            product.storeProduct.price.toDouble(),
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
                      product.storeProduct.price.toDouble(),
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
            border: const Border.fromBorderSide(
              BorderSide(color: AppColors.grey200),
            ),
            color: ShadTheme.of(context).colorScheme.muted,
          ),
          child: product.globalProduct.imagesLinksIds.isNotEmpty
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
              Text(product.globalProduct.name, style: theme.textTheme.large),
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

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          '${product.storeProduct.stockQuantity} units',
          style: theme.textTheme.p,
        ),
        Text(
          'Min: ${product.storeProduct.minStockThreshold}',
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

    if (!product.storeProduct.hasExpirationDate()) {
      return const Text('/');
    }

    return Text(
      Formatters.formatDate(product.storeProduct.expirationDate.toDateTime()),
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: theme.textTheme.muted.copyWith(
        fontSize: 12,
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
        builder: (context) => CreateEditProductFormView(
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
              icon: Icon(
                LucideIcons.squarePen400,
                color: ShadTheme.of(context).colorScheme.primary,
              ),
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
              return const SizedBox.shrink();
            }

            return IconButton(
              icon: Icon(
                LucideIcons.trash2400,
                color: ShadTheme.of(context).colorScheme.destructive,
              ),
              onPressed: () => _showDeleteDialog(context, product),
            );
          },
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
            'name': product.globalProduct.name,
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
                  'name': product.globalProduct.name,
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
