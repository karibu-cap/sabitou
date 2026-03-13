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
import '../../../utils/extensions/store_extenxion.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/custom_grid.dart';
import '../products_list_controller.dart';
import 'form/create_edit_product_form_view.dart';

/// The products table view.
class ProductsTable extends StatelessWidget {
  /// Constructs of new [ProductsTable].
  const ProductsTable({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.watch<ProductsListController>();
    final products = controller.filteredProducts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (products.isEmpty)
          Row(
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
        else
          _ProductsGridView(products: products),
      ],
    );
  }
}

class _ProductsGridView extends StatelessWidget {
  const _ProductsGridView({required this.products});

  final List<StoreProductWithGlobalProduct> products;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return LayoutBuilder(
      builder: (context, constraints) {
        return Column(
          children: [
            CustomGrid(
              minItemWidth: 270,
              mainAxisExtent: 250,
              crossSpacing: 20,
              children: products.map((product) {
                return _ProductCard(product: product, isMobile: isMobile);
              }).toList(),
            ),
          ],
        );
      },
    );
  }
}

class _ProductCard extends StatelessWidget {
  _ProductCard({required this.product, required this.isMobile});

  final StoreProductWithGlobalProduct product;
  final bool isMobile;

  /// The popover controller.
  final popoverController = ShadPopoverController();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final controller = context.read<ProductsListController>();

    void navigateToDetail() async {
      final bool? shouldRefresh = await AppRouter.push<bool>(
        context,
        PagesRoutes.productDetail.create(
          ProductDetailParameters(productId: product.storeProduct.refId),
        ),
      );
      if (shouldRefresh == true) {
        await controller.refreshProducts();
      }
    }

    void handleEdit() async {
      popoverController.hide();
      if (isMobile) {
        AppRouter.push(
          context,
          PagesRoutes.productEdit.create(
            ProductDetailParameters(productId: product.storeProduct.refId),
          ),
        );
      } else {
        await showShadDialog<bool?>(
          context: context,
          builder: (context) => CreateEditProductFormView(
            product: product,
            onProductSaved: controller.refreshProducts,
          ),
        );
      }
    }

    void handleDelete() {
      popoverController.hide();
      showShadDialog(
        context: context,
        builder: (context) => ShadDialog.alert(
          title: Text(Intls.to.confirmDelete),
          description: Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              Intls.to.areYouSureYouWantToDelete.trParams({
                'name': product.globalProduct.label,
              }),
            ),
          ),
          actions: [
            ShadButton.outline(
              child: Text(Intls.to.cancel),
              onPressed: () => Navigator.of(context).pop(false),
            ),
            ShadButton.destructive(
              child: Text(Intls.to.delete),
              onPressed: () {
                Navigator.of(context).pop(true);
                controller.deleteProduct(product.storeProduct.refId);
              },
            ),
          ],
        ),
      );
    }

    void handleToggleStatus() {
      popoverController.hide();
      final isCurrentlyActive =
          product.storeProduct.status == ProductStatus.PRODUCT_STATUS_ACTIVE;
      final newStatus = isCurrentlyActive
          ? ProductStatus.PRODUCT_STATUS_INACTIVE
          : ProductStatus.PRODUCT_STATUS_ACTIVE;
      controller.updateProductStatus(product.storeProduct.refId, newStatus);
    }

    return InkWell(
      onTap: navigateToDetail,
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
            // Header with product name and edit menu
            Padding(
              padding: const EdgeInsets.all(16),
              child: Row(
                children: [
                  Expanded(
                    child: _ProductNameCell(product: product.globalProduct),
                  ),
                  ShadPopover(
                    controller: popoverController,
                    child: ShadButton.ghost(
                      child: const Icon(LucideIcons.ellipsisVertical300),
                      onPressed: popoverController.toggle,
                      hoverBackgroundColor: theme.colorScheme.primary
                          .withValues(alpha: 0.3),
                    ),
                    popover: (context) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ShadButton.ghost(
                          child: Text(Intls.to.edit),
                          leading: const Icon(LucideIcons.pencil, size: 16),
                          onPressed: handleEdit,
                        ),
                        ShadButton.ghost(
                          child: Text(
                            product.storeProduct.status ==
                                    ProductStatus.PRODUCT_STATUS_ACTIVE
                                ? Intls.to.markAsInactiveReason
                                : Intls.to.activeText,
                          ),
                          leading: Icon(
                            product.storeProduct.status ==
                                    ProductStatus.PRODUCT_STATUS_ACTIVE
                                ? LucideIcons.circleSlash400
                                : LucideIcons.circleCheck400,
                            size: 16,
                          ),
                          onPressed: handleToggleStatus,
                        ),
                        ShadButton.ghost(
                          child: Text(
                            Intls.to.delete,
                            style: const TextStyle(color: AppColors.error500),
                          ),
                          leading: const Icon(
                            LucideIcons.trash2,
                            size: 16,
                            color: AppColors.error500,
                          ),
                          onPressed: handleDelete,
                        ),
                      ],
                    ),
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
                      child: _StatusCell(status: product.storeProduct.status),
                    ),

                    // Price
                    _InfoRow(
                      label: Intls.to.price,
                      child: Text(
                        Formatters.formatCurrency(
                          product.storeProduct.salePrice.toDouble(),
                        ),
                        style: theme.textTheme.small.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),

                    // SKU / Category
                    _InfoRow(
                      label: Intls.to.sku,
                      child: Text(
                        product.storeProduct.hasSku() &&
                                product.storeProduct.sku.isNotEmpty
                            ? product.storeProduct.sku
                            : 'N/A',
                        style: theme.textTheme.small,
                      ),
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

class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.status});

  final ProductStatus status;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: status.color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
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
