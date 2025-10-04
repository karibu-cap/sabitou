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
import '../../../widgets/app_table.dart';
import '../../../widgets/loading.dart';
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
    return AppTable(
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
          DataColumn(label: Text(Intls.to.sku)),
          DataColumn(label: Text(Intls.to.category)),
          DataColumn(label: Text(Intls.to.description)),
          DataColumn(label: Text(Intls.to.price)),
          DataColumn(label: Text(Intls.to.status)),
        ],
        rows: products.map((product) {
          return DataRow(
            cells: [
              DataCell(_ProductNameCell(product: product.globalProduct)),
              DataCell(
                Text(
                  product.globalProduct.barCodeValue,
                  style: ShadTheme.of(context).textTheme.list,
                ),
              ),
              DataCell(
                Text(
                  product.storeProduct.hasSku()
                      ? product.storeProduct.sku
                      : 'N/A',
                  style: ShadTheme.of(context).textTheme.list,
                ),
              ),
              DataCell(
                ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 200),
                  child: Wrap(
                    children:
                        product.globalProduct.categories
                            .map(
                              (c) => Text(
                                c.label,
                                style: ShadTheme.of(context).textTheme.muted,
                              ),
                            )
                            .expand((c) => [c, const Text(', ')])
                            .toList()
                          ..removeLast(),
                  ),
                ),
              ),
              DataCell(
                Text(
                  product.globalProduct.descriptionIntl,
                  style: ShadTheme.of(context).textTheme.muted,
                ),
              ),
              DataCell(
                Text(
                  Formatters.formatCurrency(
                    product.storeProduct.salePrice.toDouble(),
                  ),
                  style: ShadTheme.of(
                    context,
                  ).textTheme.list.copyWith(fontWeight: FontWeight.bold),
                ),
              ),
              DataCell(_StatusCell(status: product.storeProduct.status)),
            ],
          );
        }).toList(),
      ),
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

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.status});

  final ProductStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadBadge(
      backgroundColor: status.color.withValues(alpha: 0.1),
      hoverBackgroundColor: status.color.withValues(alpha: 0.1),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Text(
        status.label.toUpperCase(),
        style: theme.textTheme.muted.copyWith(
          color: status.color,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
