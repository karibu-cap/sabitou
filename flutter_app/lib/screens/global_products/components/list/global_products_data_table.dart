import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../global_products_controller.dart';
import '../dialogs/add_global_product/add_global_product_view.dart';
import '../dialogs/delete_global_product/delete_global_product_view.dart';
import 'global_products_cell_builders.dart';

/// Data table widget for displaying global products.
class GlobalProductDataTable extends StatelessWidget {
  /// List of global products to display.
  final List<GlobalProduct> globalProducts;

  /// Creates a new [GlobalProductDataTable].
  GlobalProductDataTable({super.key, required this.globalProducts});

  /// Shows product form dialog for editing.
  void _showGlobalProductDialog(
    BuildContext context,
    GlobalProduct globalProduct,
  ) {
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );

    showDialog<bool>(
      context: context,
      builder: (context) => ChangeNotifierProvider.value(
        value: controller,
        child: ShadDialog(
          child: GlobalProductFormDialog(
            globalProductsController: controller,
            globalProduct: globalProduct,
          ),
        ),
      ),
    );
  }

  /// Shows delete confirmation dialog.
  void _showDeleteDialog(BuildContext context, GlobalProduct globalProduct) {
    final controller = Provider.of<GlobalProductsController>(
      context,
      listen: false,
    );

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
                rows: globalProducts.map((globalProduct) {
                  return DataRow(
                    cells: [
                      DataCell(
                        GlobalProductCellBuilders.buildGlobalProductIdCell(
                          globalProduct,
                          theme,
                        ),
                      ),
                      DataCell(
                        GlobalProductCellBuilders.buildGlobalProductLabelCell(
                          globalProduct,
                          theme,
                        ),
                      ),
                      DataCell(
                        GlobalProductCellBuilders.buildCategoryCell(
                          globalProduct,
                          theme,
                        ),
                      ),
                      DataCell(
                        GlobalProductCellBuilders.buildStatusCell(
                          globalProduct,
                        ),
                      ),
                      DataCell(
                        GlobalProductCellBuilders.buildActionsCell(
                          onEdit: () =>
                              _showGlobalProductDialog(context, globalProduct),
                          onDelete: () =>
                              _showDeleteDialog(context, globalProduct),
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
