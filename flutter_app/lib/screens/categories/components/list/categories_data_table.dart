import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../../../widgets/pop_up/add_category/add_category_view.dart';
import '../../categories_controller.dart';
import '../dialogs/delete_category/delete_category_view.dart';
import 'categories_cell_builders.dart';

/// Data table widget for displaying suppliers.
class CategoriesDataTable extends StatelessWidget {
  /// List of suppliers to display.
  final List<Category> categories;

  /// Creates a new [SupplierDataTable].
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
    final intl = AppInternationalizationService.to;
    final theme = ShadTheme.of(context);
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
                  const DataColumn(label: Text('')),
                  DataColumn(label: Text(intl.name)),
                  DataColumn(label: Text(intl.type)),
                  DataColumn(label: Text(intl.statusText)),
                  DataColumn(label: Text(intl.actions)),
                ],
                rows: categories.map((category) {
                  return DataRow(
                    cells: [
                      DataCell(
                        CategoryCellBuilders.buildCategoryIdCell(
                          category,
                          theme,
                        ),
                      ),
                      DataCell(
                        CategoryCellBuilders.buildCategoryLabelCell(
                          category,
                          theme,
                        ),
                      ),
                      DataCell(
                        CategoryCellBuilders.buildTypeCell(category, theme),
                      ),
                      DataCell(CategoryCellBuilders.buildStatusCell(category)),
                      DataCell(
                        CategoryCellBuilders.buildActionsCell(
                          onEdit: () => _showSupplierDialog(context, category),
                          onDelete: () => _showDeleteDialog(context, category),
                          theme: theme,
                        ),
                      ),
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
