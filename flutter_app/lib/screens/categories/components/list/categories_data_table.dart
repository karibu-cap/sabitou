import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../themes/app_colors.dart';
import '../../../../utils/extensions/category_extension.dart';
import '../../../../widgets/pop_up/add_category/add_category_view.dart';
import '../../../../widgets/shad_data_grid.dart';
import '../../categories_controller.dart';
import '../dialogs/delete_category/delete_category_view.dart';

/// Data table widget for displaying suppliers.
class CategoriesDataTable extends StatelessWidget {
  /// List of suppliers to display.
  final List<Category> categories;

  /// Creates a new [CategoriesDataTable].
  CategoriesDataTable({super.key, required this.categories});

  /// Shows supplier form dialog for editing.
  void _showSupplierDialog(BuildContext context, Category category) {
    final controller = Provider.of<CategoriesController>(
      context,
      listen: false,
    );

    showDialog<bool>(
      context: context,
      builder: (context) => ChangeNotifierProvider.value(
        value: controller,
        child: ShadDialog(child: CategoryFormDialog(category: category)),
      ),
    );
  }

  /// Shows delete confirmation dialog.
  void _showDeleteDialog(BuildContext context, Category category) {
    final controller = Provider.of<CategoriesController>(
      context,
      listen: false,
    );

    showDialog(
      context: context,
      builder: (dialogContext) => ShadDialog(
        child: DeleteCategoryDialog(
          category: category,
          categoriesController: controller,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadDataGrid<Category>(
      data: categories,
      footerFrozenColumnsCount: 1,
      columns: [
        const ShadDataGridColumn(label: '', width: 180),
        ShadDataGridColumn(label: Intls.to.name, width: 200),
        ShadDataGridColumn(label: Intls.to.type, width: 200),
        ShadDataGridColumn(label: Intls.to.statusText, width: 180),
        ShadDataGridColumn(label: Intls.to.actions, width: 120),
      ],
      rowBuilder: (category) {
        return [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              category.refId.substring(0, 10),
              style: theme.textTheme.muted,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(category.label, style: theme.textTheme.small),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(category.typeLabel, style: theme.textTheme.small),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: ShadBadge(
              backgroundColor:
                  category.status == CategoryStatus.CATEGORY_STATUS_ACTIVE
                  ? AppColors.success100
                  : AppColors.error100,
              hoverBackgroundColor:
                  category.status == CategoryStatus.CATEGORY_STATUS_ACTIVE
                  ? AppColors.success100
                  : AppColors.error100,
              foregroundColor:
                  category.status == CategoryStatus.CATEGORY_STATUS_ACTIVE
                  ? AppColors.success500
                  : AppColors.error500,
              child: Text(category.label.toUpperCase()),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Row(
              mainAxisSize: MainAxisSize.min,
              spacing: 8,
              children: [
                Expanded(
                  child: ShadIconButton.ghost(
                    icon: const Icon(LucideIcons.squarePen400, size: 16),
                    onPressed: () => _showSupplierDialog(context, category),
                  ),
                ),
                Expanded(
                  child: ShadIconButton.ghost(
                    icon: Icon(
                      LucideIcons.trash2400,
                      size: 16,
                      color: theme.colorScheme.destructive,
                    ),
                    onPressed: () => _showDeleteDialog(context, category),
                  ),
                ),
              ],
            ),
          ),
        ];
      },
    );
  }
}
