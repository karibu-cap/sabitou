import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utils/extensions/category_extension.dart';
import '../../../../utils/extensions/global_product_extension.dart';
import '../../../../widgets/pop_up/add_global_product/add_global_product_view.dart';
import '../../../../widgets/shad_data_grid.dart';
import '../../global_products_controller.dart';
import '../dialogs/delete_global_product/delete_global_product_view.dart';

/// Data table widget for displaying global products using ShadDataGrid.
class GlobalProductDataTable extends StatelessWidget {
  /// List of global products to display.
  final List<GlobalProduct> globalProducts;

  /// Creates a new [GlobalProductDataTable].
  const GlobalProductDataTable({super.key, required this.globalProducts});

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );

    return ShadDataGrid<GlobalProduct>(
      data: globalProducts,
      footerFrozenColumnsCount: 1,
      rowHeight: 80,
      columns: [
        ShadDataGridColumn(label: intl.name, width: 250),
        ShadDataGridColumn(label: intl.type, width: 300),
        ShadDataGridColumn(label: intl.statusText, width: 150),
        ShadDataGridColumn(
          label: intl.actions,
          width: 120,
          alignment: Alignment.center,
        ),
      ],
      rowBuilder: (globalProduct) {
        return [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _GlobalProductNameCell(globalProduct: globalProduct),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _CategoryCell(globalProduct: globalProduct),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _StatusCell(globalProduct: globalProduct),
          ),

          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: _ActionsCell(
              globalProduct: globalProduct,
              controller: controller,
            ),
          ),
        ];
      },
    );
  }
}

/// Name cell widget with label and about
class _GlobalProductNameCell extends StatelessWidget {
  const _GlobalProductNameCell({required this.globalProduct});

  final GlobalProduct globalProduct;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      alignment: Alignment.centerLeft,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            globalProduct.label,
            style: theme.textTheme.small.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 14,
              color: theme.colorScheme.foreground,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          if (globalProduct.about.isNotEmpty) ...[
            const SizedBox(height: 4),
            Text(
              globalProduct.about,
              style: theme.textTheme.muted,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ],
      ),
    );
  }
}

/// Category cell widget with chips
class _CategoryCell extends StatelessWidget {
  const _CategoryCell({required this.globalProduct});

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

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      alignment: Alignment.centerLeft,
      child: categoryLabels.isEmpty
          ? Text(
              intl.noCategoriesYet,
              style: theme.textTheme.small.copyWith(
                fontStyle: FontStyle.italic,
                color: theme.colorScheme.mutedForeground,
                fontSize: 12,
              ),
            )
          : Wrap(
              spacing: 6,
              runSpacing: 6,
              children:
                  categoryLabels.take(3).map((label) {
                    return ShadBadge(
                      backgroundColor: AppColors.grey500,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      child: Text(
                        label,
                        style: theme.textTheme.small.copyWith(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    );
                  }).toList()..addAll(
                    categoryLabels.length > 3
                        ? [
                            ShadBadge(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              backgroundColor: AppColors.grey0,

                              child: Text(
                                '+${categoryLabels.length - 3}',
                                style: theme.textTheme.small.copyWith(
                                  fontSize: 11,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.mutedForeground,
                                ),
                              ),
                            ),
                          ]
                        : [],
                  ),
            ),
    );
  }
}

/// Status cell widget with professional badge
class _StatusCell extends StatelessWidget {
  const _StatusCell({required this.globalProduct});

  final GlobalProduct globalProduct;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final intl = AppInternationalizationService.to;

    final isActive =
        globalProduct.status ==
        GlobalProductStatus.GLOBAL_PRODUCT_STATUS_ACTIVE;

    return ShadBadge(
      backgroundColor: isActive ? AppColors.success100 : AppColors.error100,
      hoverBackgroundColor: isActive
          ? AppColors.success100
          : AppColors.error100,
      foregroundColor: isActive ? AppColors.success500 : AppColors.error500,
      child: Text(
        isActive ? intl.activeText : intl.inactiveText,
        style: theme.textTheme.small.copyWith(
          fontSize: 12,
          color: isActive ? AppColors.success500 : AppColors.error500,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

/// Actions cell widget with edit and delete buttons
class _ActionsCell extends StatelessWidget {
  const _ActionsCell({required this.globalProduct, required this.controller});

  final GlobalProduct globalProduct;
  final GlobalProductsController controller;

  void _showDeleteDialog(BuildContext context) {
    showDialog(
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

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 8,
      children: [
        Expanded(
          child: ShadIconButton.ghost(
            icon: const Icon(LucideIcons.squarePen400, size: 16),
            onPressed: () =>
                showGlobalProductDialog(context, globalProduct: globalProduct),
          ),
        ),
        Expanded(
          child: ShadIconButton.ghost(
            icon: Icon(
              LucideIcons.trash2400,
              size: 16,
              color: theme.colorScheme.destructive,
            ),
            onPressed: () => _showDeleteDialog(context),
          ),
        ),
      ],
    );
  }
}
