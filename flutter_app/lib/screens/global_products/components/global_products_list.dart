import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../repositories/resource_link_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/extensions/category_extension.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../widgets/custom_grid.dart';
import '../../../widgets/error/loading_failed.dart';
import '../../../widgets/pop_up/add_global_product/add_global_product_view.dart';
import '../global_products_controller.dart';
import 'dialogs/delete_global_product/delete_global_product_view.dart';
import 'list/global_products_empty_state.dart';
import 'list/global_products_shimmer_widgets.dart';

/// Widget for displaying the list of global products.
class GlobalProductsList extends StatelessWidget {
  /// Creates a new [GlobalProductsList].
  const GlobalProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );
    final theme = ShadTheme.of(context);
    final intl = AppInternationalizationService.to;

    Future<bool?> showDeleteDialog(
      BuildContext context,
      GlobalProduct globalProduct,
    ) async {
      return showDialog<bool?>(
        context: context,
        builder: (dialogContext) => ChangeNotifierProvider.value(
          value: controller,
          child: ShadDialog(
            child: DeleteGlobalProductDialog(
              globalProductsController: controller,
              globalProduct: globalProduct,
            ),
          ),
        ),
      );
    }

    return StreamBuilder<List<GlobalProduct>>(
      stream: controller.filteredGlobalProductsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return GlobalProductsShimmerWidgets.buildTableShimmer();
        }
        final error = snapshot.error;
        if (snapshot.hasError && error != null) {
          return LoadingFailedWidget(error: error);
        }
        final globalProducts = snapshot.data ?? [];
        if (globalProducts.isEmpty) {
          return const GlobalProductsEmptyState();
        }

        return Column(
          spacing: 8,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  intl.products,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13.5,
                  ),
                ),
                Text(
                  '${globalProducts.length} ${intl.result}',
                  style: theme.textTheme.muted,
                ),
              ],
            ),
            CustomGrid(
              minItemWidth: 300,
              mainAxisExtent: 180,
              crossSpacing: 20,
              children: globalProducts
                  .map(
                    (e) => _GlobalProductCard(
                      globalProduct: e,
                      onEdit: () async {
                        final result = await showGlobalProductDialog(
                          context,
                          globalProduct: e,
                        );
                        if (result == true) {
                          await controller.refreshGlobalProducts();
                        }
                      },

                      onDelete: () async {
                        final result = await showDeleteDialog(context, e);
                        if (result == true) {
                          await controller.refreshGlobalProducts();
                        }
                      },
                    ),
                  )
                  .toList(),
            ),
          ],
        );
      },
    );
  }
}

class _GlobalProductCard extends StatelessWidget {
  const _GlobalProductCard({
    required this.globalProduct,
    required this.onEdit,
    required this.onDelete,
  });

  final GlobalProduct globalProduct;
  final VoidCallback onEdit;
  final VoidCallback onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      padding: const EdgeInsets.all(16),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                _ProductImage(
                  imageUrl: globalProduct.imagesLinksIds.firstOrNull,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        globalProduct.label,
                        style: theme.textTheme.p.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 14,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (globalProduct.about.isNotEmpty) ...[
                        const SizedBox(height: 2),
                        Text(
                          globalProduct.about,
                          style: theme.textTheme.muted.copyWith(fontSize: 12),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ],
                  ),
                ),
                const SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    _StatusPill(status: globalProduct.status),
                    const SizedBox(height: 8),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _CardIconButton(
                          icon: LucideIcons.pencil,
                          onPressed: onEdit,
                        ),
                        const SizedBox(width: 5),
                        _CardIconButton(
                          icon: LucideIcons.trash2,
                          onPressed: onDelete,
                          isDanger: true,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: ShadSeparator.horizontal(),
            ),
            _CategoriesWrap(globalProduct: globalProduct),
          ],
        ),
      ),
    );
  }
}

class _ProductImage extends StatelessWidget {
  const _ProductImage({this.imageUrl});
  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final imageUrl = this.imageUrl;

    return Container(
      width: 42,
      height: 42,
      decoration: BoxDecoration(
        color: theme.colorScheme.accent,
        borderRadius: const BorderRadius.all(Radius.circular(11)),
      ),
      alignment: Alignment.center,
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
              borderRadius: const BorderRadius.all(Radius.circular(11)),
              child: FadeInImage.assetNetwork(
                placeholder: StaticImages.placeholder,
                placeholderFit: BoxFit.cover,
                image: data,
                fit: BoxFit.cover,
                imageErrorBuilder: (context, error, stackTrace) {
                  return const Icon(LucideIcons.package, size: 18);
                },
                placeholderErrorBuilder: (context, error, stackTrace) {
                  return const Icon(LucideIcons.package, size: 18);
                },
              ),
            );
          }

          return const Icon(LucideIcons.package, size: 18);
        },
      ),
    );
  }
}

class _CategoriesWrap extends StatelessWidget {
  const _CategoriesWrap({required this.globalProduct});
  final GlobalProduct globalProduct;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final intl = AppInternationalizationService.to;

    final categoryLabels = globalProduct.categories
        .map((category) => category.label.trim())
        .where((label) => label.isNotEmpty)
        .toSet()
        .toList();

    if (categoryLabels.isEmpty) {
      return Text(
        intl.noCategoriesYet,
        style: theme.textTheme.small.copyWith(
          fontStyle: FontStyle.italic,
          color: theme.colorScheme.mutedForeground,
          fontSize: 12,
        ),
      );
    }

    return Wrap(
      spacing: 6,
      runSpacing: 6,
      children:
          categoryLabels.take(3).map((label) {
            return Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
              decoration: const BoxDecoration(
                color: SabitouColors.neutral,
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              child: Text(
                label,
                style: theme.textTheme.small.copyWith(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                ),
              ),
            );
          }).toList()..addAll(
            categoryLabels.length > 3
                ? [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: const BoxDecoration(
                        color: SabitouColors.neutralSoft,
                        borderRadius: BorderRadius.all(Radius.circular(6)),
                      ),
                      child: Text(
                        '+${categoryLabels.length - 3}',
                        style: theme.textTheme.small.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w500,
                          color: theme.colorScheme.mutedForeground,
                        ),
                      ),
                    ),
                  ]
                : [],
          ),
    );
  }
}

class _StatusPill extends StatelessWidget {
  const _StatusPill({required this.status});
  final GlobalProductStatus status;

  bool get _isActive =>
      status == GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE;

  @override
  Widget build(BuildContext context) {
    const successSoft = SabitouColors.infoSoft;
    const successText = SabitouColors.successForeground;
    const successDot = SabitouColors.success;
    const inactiveBg = SabitouColors.accentSoft;
    const inactiveText = SabitouColors.accentForeground;
    const inactiveDot = SabitouColors.accentSoft;

    final bg = _isActive ? successSoft : inactiveBg;
    final fg = _isActive ? successText : inactiveText;
    final dot = _isActive ? successDot : inactiveDot;
    final label = _isActive
        ? AppInternationalizationService.to.activeText
        : AppInternationalizationService.to.inactiveText;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
      decoration: BoxDecoration(
        color: bg,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6,
            height: 6,
            decoration: BoxDecoration(color: dot, shape: BoxShape.circle),
          ),
          const SizedBox(width: 5),
          Text(
            label,
            style: TextStyle(
              color: fg,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class _CardIconButton extends StatelessWidget {
  const _CardIconButton({
    required this.icon,
    required this.onPressed,
    this.isDanger = false,
  });

  final IconData icon;
  final VoidCallback onPressed;
  final bool isDanger;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadButton.ghost(
      width: 30,
      height: 30,
      padding: EdgeInsets.zero,
      onPressed: onPressed,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          color: cs.border,
          width: 1,
          radius: const BorderRadius.all(Radius.circular(7)),
        ),
      ),
      child: Icon(
        icon,
        size: 13,
        color: isDanger ? cs.destructive : cs.mutedForeground,
      ),
    );
  }
}
