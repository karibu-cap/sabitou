import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repositories/resource_link_repository.dart';
import '../../../repositories/stores_repository.dart';
import '../../../router/app_router.dart';
import '../../../router/page_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/extensions/store_extenxion.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../../../widgets/shad_scaffold.dart';
import '../components/form/create_edit_product_form_view.dart';
import 'product_detail_controller.dart';

/// Screen displaying the product details with edit, status update, and delete.
class ProductDetailScreen extends StatelessWidget {
  /// The product ID.
  final String productId;

  /// Constructs a new [ProductDetailScreen].
  const ProductDetailScreen({required this.productId, super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ProductDetailController(productId: productId),
      child: const _ProductDetailView(),
    );
  }
}

class _ProductDetailView extends StatelessWidget {
  const _ProductDetailView();

  Future<void> _handleToggleStatus(
    BuildContext context,
    ProductDetailController ctrl,
  ) async {
    final success = await ctrl.toggleStatus();
    if (!context.mounted) return;
    if (!success && ctrl.error != null) {
      ShadToaster.of(
        context,
      ).show(ShadToast.destructive(description: Text(ctrl.error ?? '')));
    }
  }

  Future<void> _handleDelete(
    BuildContext context,
    ProductDetailController ctrl,
  ) async {
    final confirmed = await showShadDialog<bool>(
      context: context,
      builder: (ctx) => ShadDialog.alert(
        title: Text(Intls.to.confirmDelete),
        description: Text(
          Intls.to.areYouSureYouWantToDelete.trParams({
            'name': ctrl.product?.globalProduct.label ?? '',
          }),
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.of(ctx).pop(false),
            child: Text(Intls.to.cancel),
          ),
          ShadButton.destructive(
            onPressed: () => Navigator.of(ctx).pop(true),
            child: Text(Intls.to.delete),
          ),
        ],
      ),
    );

    if (confirmed != true || !context.mounted) return;
    final success = await ctrl.deleteProduct();
    if (!context.mounted) return;
    if (success) {
      Navigator.of(context).pop(true);
    } else if (ctrl.error != null) {
      ShadToaster.of(
        context,
      ).show(ShadToast.destructive(description: Text(ctrl.error ?? '')));
    }
  }

  Future<void> _handleEdit(
    BuildContext context,
    ProductDetailController ctrl,
    bool isDesktop,
  ) async {
    final product = ctrl.product;
    if (product == null) return;

    if (isDesktop) {
      await showShadDialog<bool?>(
        context: context,
        builder: (context) => CreateEditProductFormView(
          product: product,
          onProductSaved: () async {
            if (context.mounted) await ctrl.reload();
          },
        ),
      );
    } else {
      await AppRouter.push(
        context,
        PagesRoutes.productEdit.create(
          ProductDetailParameters(productId: product.storeProduct.refId),
        ),
      );
      if (context.mounted) await ctrl.reload();
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<ProductDetailController>();

    if (ctrl.isLoading) {
      return ShadScaffold(
        title: Text(Intls.to.product),
        body: const Center(child: Loading()),
      );
    }

    final product = ctrl.product;
    if (product == null) {
      return ShadScaffold(
        title: Text(Intls.to.product),
        body: const _EmptyState(),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= 768;

        return ShadScaffold(
          title: Text(product.globalProduct.label),
          actions: [
            ShadButton.ghost(
              size: ShadButtonSize.sm,
              leading: ctrl.isUpdatingStatus
                  ? const Loading.button(size: 14)
                  : const Icon(LucideIcons.refreshCw, size: 14),
              onPressed: ctrl.isUpdatingStatus
                  ? null
                  : () => _handleToggleStatus(context, ctrl),
              child: Text(Intls.to.status),
            ),
            ShadButton.ghost(
              size: ShadButtonSize.sm,
              leading: const Icon(LucideIcons.pencil, size: 14),
              onPressed: () => _handleEdit(context, ctrl, isDesktop),
              child: Text(Intls.to.edit),
            ),
            ShadButton.destructive(
              size: ShadButtonSize.sm,
              leading: ctrl.isDeleting
                  ? const Loading.button(size: 14)
                  : const Icon(LucideIcons.trash2, size: 14),
              onPressed: ctrl.isDeleting
                  ? null
                  : () => _handleDelete(context, ctrl),
              child: Text(Intls.to.delete),
            ),
          ],
          body: isDesktop
              ? _DesktopLayout(
                  product: product,
                  isDeleting: ctrl.isDeleting,
                  isUpdatingStatus: ctrl.isUpdatingStatus,
                  onEdit: () => _handleEdit(context, ctrl, isDesktop),
                  onToggleStatus: () => _handleToggleStatus(context, ctrl),
                  onDelete: () => _handleDelete(context, ctrl),
                )
              : _MobileLayout(
                  product: product,
                  isDeleting: ctrl.isDeleting,
                  isUpdatingStatus: ctrl.isUpdatingStatus,
                  onEdit: () => _handleEdit(context, ctrl, isDesktop),
                  onToggleStatus: () => _handleToggleStatus(context, ctrl),
                  onDelete: () => _handleDelete(context, ctrl),
                ),
        );
      },
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  DESKTOP LAYOUT
// ──────────────────────────────────────────────────────────────

class _DesktopLayout extends StatelessWidget {
  final StoreProductWithGlobalProduct product;
  final bool isDeleting;
  final bool isUpdatingStatus;
  final VoidCallback onEdit;
  final VoidCallback onToggleStatus;
  final VoidCallback onDelete;

  const _DesktopLayout({
    required this.product,
    required this.isDeleting,
    required this.isUpdatingStatus,
    required this.onEdit,
    required this.onToggleStatus,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(32),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 300,
            child: Column(
              children: [
                _ProductImageCard(product: product, size: 100),
                const SizedBox(height: 16),
                _QuickStatsCard(product: product),
                const SizedBox(height: 16),
                _ActionCard(
                  product: product,
                  isDeleting: isDeleting,
                  isUpdatingStatus: isUpdatingStatus,
                  onEdit: onEdit,
                  onToggleStatus: onToggleStatus,
                  onDelete: onDelete,
                ),
              ],
            ),
          ),
          const SizedBox(width: 24),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _ProductHeaderCard(product: product),
                const SizedBox(height: 16),
                _InventoryDetailsCard(product: product),
                const SizedBox(height: 16),
                _DescriptionCard(product: product),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  MOBILE LAYOUT
// ──────────────────────────────────────────────────────────────

class _MobileLayout extends StatelessWidget {
  final StoreProductWithGlobalProduct product;
  final bool isDeleting;
  final bool isUpdatingStatus;
  final VoidCallback onEdit;
  final VoidCallback onToggleStatus;
  final VoidCallback onDelete;

  const _MobileLayout({
    required this.product,
    required this.isDeleting,
    required this.isUpdatingStatus,
    required this.onEdit,
    required this.onToggleStatus,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        _MobileHeroBanner(product: product),
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
          child: Column(
            children: [
              _ProductHeaderCard(product: product),
              const SizedBox(height: 12),
              _QuickStatsCard(product: product),
              const SizedBox(height: 12),
              _InventoryDetailsCard(product: product),
              const SizedBox(height: 12),
              _DescriptionCard(product: product),
              const SizedBox(height: 12),
              _ActionCard(
                product: product,
                isDeleting: isDeleting,
                isUpdatingStatus: isUpdatingStatus,
                onEdit: onEdit,
                onToggleStatus: onToggleStatus,
                onDelete: onDelete,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _MobileHeroBanner extends StatelessWidget {
  final StoreProductWithGlobalProduct product;

  const _MobileHeroBanner({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final imageUrl = product.storeProduct.imagesLinksIds.isNotEmpty
        ? product.storeProduct.imagesLinksIds.first
        : product.globalProduct.imagesLinksIds.firstOrNull;

    return Stack(
      children: [
        SizedBox(
          height: 240,
          width: double.infinity,
          child: FutureBuilder<ResourceLink?>(
            future: imageUrl == null
                ? Future.value()
                : ResourceLinkRepository.instance.getResourceLink(imageUrl),
            builder: (context, snapshot) {
              final data = snapshot.data?.targetUri;
              if (snapshot.connectionState == ConnectionState.done &&
                  snapshot.hasData &&
                  data != null) {
                return ClipRRect(
                  borderRadius: theme.radius,
                  child: FadeInImage.assetNetwork(
                    placeholder: StaticImages.placeholder,
                    placeholderFit: BoxFit.none,
                    image: data,
                    fit: BoxFit.cover,
                    imageErrorBuilder: (_, __, ___) => Container(
                      color: theme.colorScheme.muted,
                      child: Icon(
                        LucideIcons.package,
                        size: 64,
                        color: theme.colorScheme.mutedForeground,
                      ),
                    ),
                    placeholderErrorBuilder: (_, __, ___) =>
                        const _ImagePlaceholder(),
                  ),
                );
              }

              return Container(
                color: theme.colorScheme.muted,
                child: Icon(
                  LucideIcons.package,
                  size: 64,
                  color: theme.colorScheme.mutedForeground,
                ),
              );
            },
          ),
        ),
        // Gradient overlay bottom
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          height: 100,
          child: DecoratedBox(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  AppColors.transparent,
                  theme.colorScheme.background.withValues(alpha: 0.95),
                ],
              ),
            ),
          ),
        ),
        // Status badge top-right
        Positioned(
          top: 16,
          right: 16,
          child: _StatusBadge(storeProduct: product.storeProduct),
        ),
      ],
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  PRODUCT IMAGE CARD (desktop)
// ──────────────────────────────────────────────────────────────

class _ProductImageCard extends StatelessWidget {
  final StoreProductWithGlobalProduct product;
  final double size;

  const _ProductImageCard({required this.product, required this.size});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final imageUrl = product.storeProduct.imagesLinksIds.isNotEmpty
        ? product.storeProduct.imagesLinksIds.first
        : product.globalProduct.imagesLinksIds.firstOrNull;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: FutureBuilder<ResourceLink?>(
        future: imageUrl == null
            ? Future.value()
            : ResourceLinkRepository.instance.getResourceLink(imageUrl),
        builder: (context, snapshot) {
          final data = snapshot.data?.targetUri;
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot.hasData &&
              data != null) {
            return ClipRRect(
              borderRadius: theme.radius,
              child: AspectRatio(
                aspectRatio: 1.5,
                child: FadeInImage.assetNetwork(
                  placeholder: StaticImages.placeholder,
                  placeholderFit: BoxFit.none,
                  image: data,
                  fit: BoxFit.cover,
                  imageErrorBuilder: (_, __, ___) => const _ImagePlaceholder(),
                  placeholderErrorBuilder: (_, __, ___) =>
                      const _ImagePlaceholder(),
                ),
              ),
            );
          }

          return const _ImagePlaceholder();
        },
      ),
    );
  }
}

class _ImagePlaceholder extends StatelessWidget {
  const _ImagePlaceholder();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      color: theme.colorScheme.muted,
      child: Center(
        child: Icon(
          LucideIcons.package,
          size: 56,
          color: theme.colorScheme.mutedForeground,
        ),
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  PRODUCT HEADER CARD
// ──────────────────────────────────────────────────────────────

class _ProductHeaderCard extends StatelessWidget {
  final StoreProductWithGlobalProduct product;

  const _ProductHeaderCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final gp = product.globalProduct;
    final sp = product.storeProduct;
    final categories = gp.categories.map((c) => c.label).join(', ');

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(child: Text(gp.label, style: theme.textTheme.h3)),
              _StatusBadge(storeProduct: sp),
            ],
          ),
          if (categories.isNotEmpty) ...[
            const SizedBox(height: 6),
            Row(
              children: [
                Icon(
                  LucideIcons.tag,
                  size: 12,
                  color: theme.colorScheme.mutedForeground,
                ),
                const SizedBox(width: 4),
                Text(
                  categories,
                  style: theme.textTheme.small.copyWith(
                    color: theme.colorScheme.mutedForeground,
                  ),
                ),
              ],
            ),
          ],
          const SizedBox(height: 16),
          ShadCard(
            child: Row(
              children: [
                Icon(
                  LucideIcons.circleArrowUp,
                  size: 18,
                  color: theme.colorScheme.primary,
                ),
                const SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Intls.to.salePrice,
                      style: theme.textTheme.muted.copyWith(fontSize: 11),
                    ),
                    Text(
                      Formatters.formatCurrency(sp.salePrice.toDouble()),
                      style: theme.textTheme.large.copyWith(
                        fontWeight: FontWeight.w700,
                        color: theme.colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  QUICK STATS CARD
// ──────────────────────────────────────────────────────────────

class _QuickStatsCard extends StatelessWidget {
  final StoreProductWithGlobalProduct product;

  const _QuickStatsCard({required this.product});

  String _expirationLabel(ExpirationType type) {
    switch (type) {
      case ExpirationType.EXPIRATION_TYPE_NONE:
        return Intls.to.nonPerishable;
      case ExpirationType.EXPIRATION_TYPE_PRODUCT_LEVEL:
        return Intls.to.productLevel;
      case ExpirationType.EXPIRATION_TYPE_LOT_LEVEL:
        return Intls.to.lotLevel;
      default:
        return '—';
    }
  }

  @override
  Widget build(BuildContext context) {
    final sp = product.storeProduct;

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: LucideIcons.chartBar300,
            label: Intls.to.overview,
          ),
          const SizedBox(height: 14),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  icon: LucideIcons.scanBarcode,
                  label: Intls.to.barcode,
                  value: product.globalProduct.barCodeValue.isNotEmpty
                      ? product.globalProduct.barCodeValue
                      : '—',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MiniStat(
                  icon: LucideIcons.hash,
                  label: Intls.to.sku,
                  value: sp.hasSku() && sp.sku.isNotEmpty ? sp.sku : '—',
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Row(
            children: [
              Expanded(
                child: _MiniStat(
                  icon: LucideIcons.triangleAlert300,
                  label: Intls.to.reorderPoint,
                  value: sp.hasReorderPoint()
                      ? sp.reorderPoint.toString()
                      : '—',
                ),
              ),
              const SizedBox(width: 8),
              Expanded(
                child: _MiniStat(
                  icon: LucideIcons.clock,
                  label: Intls.to.expires,
                  value: _expirationLabel(sp.expirationType),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  INVENTORY DETAILS CARD
// ──────────────────────────────────────────────────────────────

class _InventoryDetailsCard extends StatelessWidget {
  final StoreProductWithGlobalProduct product;

  const _InventoryDetailsCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final sp = product.storeProduct;

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: LucideIcons.clipboardList,
            label: Intls.to.inventoryDetails,
          ),
          const SizedBox(height: 14),
          FutureBuilder(
            future: StoresRepository.instance.getStoreByRefId(sp.storeId),
            builder: (context, asyncSnapshot) {
              final store = asyncSnapshot.data;
              if (store == null) return const SizedBox.shrink();

              return _InfoRow(
                icon: LucideIcons.store,
                label: Intls.to.store,
                value: store.name,
              );
            },
          ),
          _InfoRow(
            icon: LucideIcons.fingerprint,
            label: Intls.to.productId,
            value: sp.hasRefId() ? sp.refId : '—',
            monospace: true,
          ),
          _InfoRow(
            icon: LucideIcons.calendarPlus,
            label: Intls.to.created,
            value: sp.hasCreatedAt()
                ? Formatters.formatDate(sp.createdAt.toDateTime())
                : '—',
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  DESCRIPTION CARD
// ──────────────────────────────────────────────────────────────

class _DescriptionCard extends StatelessWidget {
  final StoreProductWithGlobalProduct product;

  const _DescriptionCard({required this.product});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final desc = product.globalProduct.descriptionIntl;

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _SectionTitle(
            icon: LucideIcons.fileText,
            label: Intls.to.description,
          ),
          const SizedBox(height: 10),
          Text(
            desc.isNotEmpty ? desc : 'N/A',
            style: theme.textTheme.p.copyWith(
              color: desc.isNotEmpty
                  ? theme.colorScheme.foreground
                  : theme.colorScheme.mutedForeground,
              height: 1.6,
            ),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  ACTION CARD
// ──────────────────────────────────────────────────────────────

class _ActionCard extends StatelessWidget {
  final StoreProductWithGlobalProduct product;
  final bool isDeleting;
  final bool isUpdatingStatus;
  final VoidCallback onEdit;
  final VoidCallback onToggleStatus;
  final VoidCallback onDelete;

  const _ActionCard({
    required this.product,
    required this.isDeleting,
    required this.isUpdatingStatus,
    required this.onEdit,
    required this.onToggleStatus,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isActive =
        product.storeProduct.status == ProductStatus.PRODUCT_STATUS_ACTIVE;

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _SectionTitle(icon: LucideIcons.zap, label: Intls.to.actions),
          const SizedBox(height: 14),
          ShadButton(
            leading: const Icon(LucideIcons.pencil, size: 16),
            onPressed: onEdit,
            child: Text(Intls.to.editProduct),
          ),
          const SizedBox(height: 8),
          ShadButton.outline(
            leading: isUpdatingStatus
                ? const Loading.button(size: 14)
                : Icon(
                    isActive ? LucideIcons.eyeOff : LucideIcons.eye,
                    size: 16,
                  ),
            onPressed: isUpdatingStatus ? null : onToggleStatus,
            child: Text(
              isActive ? Intls.to.markAsInactiveReason : Intls.to.activeText,
            ),
          ),
          const SizedBox(height: 8),
          ShadButton.destructive(
            leading: isDeleting
                ? const Loading.button(size: 14)
                : const Icon(LucideIcons.trash2, size: 16),
            onPressed: isDeleting ? null : onDelete,
            child: Text(Intls.to.deleteProduct),
          ),
        ],
      ),
    );
  }
}

// ──────────────────────────────────────────────────────────────
//  SHARED SMALL WIDGETS
// ──────────────────────────────────────────────────────────────

class _StatusBadge extends StatelessWidget {
  final StoreProduct storeProduct;

  const _StatusBadge({required this.storeProduct});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: storeProduct.status.color.withValues(alpha: 0.1),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
        border: Border.all(
          color: storeProduct.status.color.withValues(alpha: 0.3),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: storeProduct.status.color,
            ),
          ),
          const SizedBox(width: 5),
          Text(
            storeProduct.status.label,
            style: TextStyle(
              color: storeProduct.status.color,
              fontSize: 11,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.3,
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  final IconData icon;
  final String label;

  const _SectionTitle({required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        Icon(icon, size: 14, color: theme.colorScheme.mutedForeground),
        const SizedBox(width: 6),
        Text(
          label.toUpperCase(),
          style: theme.textTheme.small.copyWith(
            color: theme.colorScheme.mutedForeground,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.8,
            fontSize: 11,
          ),
        ),
      ],
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  final bool monospace;

  const _InfoRow({
    required this.icon,
    required this.label,
    required this.value,
    this.monospace = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.mutedForeground),
          const SizedBox(width: 10),
          SizedBox(
            width: 130,
            child: Text(
              label,
              style: theme.textTheme.small.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
            ),
          ),
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w500,
                fontFamily: monospace ? 'monospace' : null,
                fontSize: monospace ? 11 : null,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _MiniStat extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;

  const _MiniStat({
    required this.icon,
    required this.label,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.muted.withValues(alpha: 0.5),
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 14, color: theme.colorScheme.mutedForeground),
          const SizedBox(height: 6),
          Text(
            label,
            style: theme.textTheme.muted.copyWith(fontSize: 10),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 2),
          Text(
            value,
            style: theme.textTheme.small.copyWith(fontWeight: FontWeight.w600),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            LucideIcons.packageSearch,
            size: 56,
            color: theme.colorScheme.mutedForeground,
          ),
          const SizedBox(height: 16),
          Text(Intls.to.productNotFound, style: theme.textTheme.large),
          const SizedBox(height: 8),
          Text(
            Intls.to.noProductsFound,
            style: theme.textTheme.muted,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
