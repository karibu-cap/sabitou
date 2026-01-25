import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/extensions/store_extenxion.dart';
import '../../../utils/formatters.dart';
import '../../../utils/utils.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/shad_data_grid.dart';
import '../products_list_controller.dart';

/// The products table view.
class ProductsTable extends StatelessWidget {
  /// Constructs of new [ProductsTable].
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
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
          StreamBuilder<List<StoreProductWithGlobalProduct>>(
            stream: context
                .read<ProductsListController>()
                .filteredProductsStream,
            builder: (context, snapshot) {
              final products = snapshot.data;
              if (!snapshot.hasData || products == null) {
                return const Loading();
              }

              return products.isEmpty
                  ? Row(
                      children: [
                        Expanded(
                          child: Column(
                            children: [
                              const Icon(LucideIcons.box),
                              Text(
                                Intls.to.productNotFound,
                                style: ShadTheme.of(context).textTheme.muted,
                              ),
                              const SizedBox(height: 16),
                            ],
                          ),
                        ),
                      ],
                    )
                  : _ProductsListDataTable(products: products);
            },
          ),
        ],
      ),
    );
  }
}

class _ProductsListDataTable extends StatelessWidget {
  const _ProductsListDataTable({required this.products});

  final List<StoreProductWithGlobalProduct> products;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadDataGrid<StoreProductWithGlobalProduct>(
      data: products,
      columns: [
        ShadDataGridColumn(label: Intls.to.product, width: 280),
        ShadDataGridColumn(label: Intls.to.barcode, width: 150),
        ShadDataGridColumn(label: Intls.to.price, width: 120),
        ShadDataGridColumn(label: Intls.to.category, width: 180),
        ShadDataGridColumn(label: Intls.to.status, width: 110),
        ShadDataGridColumn(label: Intls.to.sku, width: 100),
        ShadDataGridColumn(label: Intls.to.description, width: 180),
      ],
      rowBuilder: (product) {
        return [
          // Product Name Cell
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
            alignment: Alignment.centerLeft,
            child: _ProductNameCell(product: product.globalProduct),
          ),
          // Barcode Cell
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              product.globalProduct.barCodeValue,
              style: theme.textTheme.small,
            ),
          ),
          // Price Cell
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              Formatters.formatCurrency(
                product.storeProduct.salePrice.toDouble(),
              ),
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          // Category Cell
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Wrap(
              spacing: 2,
              children:
                  product.globalProduct.categories
                      .map(
                        (c) => Text(
                          c.label,
                          style: theme.textTheme.small.copyWith(
                            color: theme.colorScheme.mutedForeground,
                          ),
                        ),
                      )
                      .expand((c) => [c, const Text(', ')])
                      .toList()
                    ..removeLast(),
            ),
          ),
          // Status Cell
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _StatusCell(status: product.storeProduct.status),
          ),
          // SKU Cell
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              product.storeProduct.hasSku() &&
                      product.storeProduct.sku.isNotEmpty
                  ? product.storeProduct.sku
                  : 'N/A',
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
            ),
          ),
          // Description Cell
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              product.globalProduct.descriptionIntl,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
            ),
          ),
        ];
      },
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
      children: [
        Container(
          height: 48,
          width: 48,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(6)),
            color: theme.colorScheme.muted,
            border: Border.all(color: theme.colorScheme.border),
          ),
          clipBehavior: Clip.antiAlias,
          child:
              product.imagesLinksIds.isNotEmpty &&
                  AppUtils.isURL(product.imagesLinksIds.first)
              ? FutureBuilder(
                  future: precacheImage(
                    NetworkImage(product.imagesLinksIds.first),
                    context,
                    onError: (error, stackTrace) => null,
                  ),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done &&
                        snapshot.error == null) {
                      return FadeInImage.assetNetwork(
                        placeholder: StaticImages.placeholder,
                        image: product.imagesLinksIds.first,
                        fit: BoxFit.cover,
                        imageErrorBuilder: (context, error, stackTrace) {
                          return Icon(
                            LucideIcons.package,
                            size: 20,
                            color: theme.colorScheme.mutedForeground,
                          );
                        },
                        placeholderErrorBuilder: (context, error, stackTrace) {
                          return Icon(
                            LucideIcons.package,
                            size: 20,
                            color: theme.colorScheme.mutedForeground,
                          );
                        },
                      );
                    }

                    return Icon(
                      LucideIcons.package,
                      size: 20,
                      color: theme.colorScheme.mutedForeground,
                    );
                  },
                )
              : Icon(
                  LucideIcons.package,
                  size: 20,
                  color: theme.colorScheme.mutedForeground,
                ),
        ),
        const SizedBox(width: 12),
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

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.status});

  final ProductStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadBadge(
      backgroundColor: status.color.withValues(alpha: 0.1),
      hoverBackgroundColor: status.color.withValues(alpha: 0.15),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      shape: const StadiumBorder(),
      child: Text(
        status.label.toUpperCase(),
        style: theme.textTheme.small.copyWith(
          color: status.color,
          fontWeight: FontWeight.w600,
          fontSize: 11,
        ),
      ),
    );
  }
}
