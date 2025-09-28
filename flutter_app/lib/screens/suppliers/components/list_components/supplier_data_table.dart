import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../suppliers_controller.dart';
import '../../../../widgets/pop_up/add_supplier/add_supplier_view.dart';
import 'supplier_cell_builders.dart';
import 'supplier_delete_dialog.dart';

/// Data table widget for displaying suppliers.
class SupplierDataTable extends StatelessWidget {
  /// List of suppliers to display.
  final List<Supplier> suppliers;

  /// List of all products for calculations.
  final List<StoreProduct> products;

  /// Creates a new [SupplierDataTable].
  const SupplierDataTable({
    super.key,
    required this.suppliers,
    required this.products,
  });

  /// Shows delete confirmation dialog.
  void _showDeleteDialog(
    BuildContext context,
    Supplier supplier,
    int productCount,
  ) {
    // Get the controller from the current context before showing the dialog
    final controller = Provider.of<SuppliersController>(context, listen: false);

    showDialog(
      context: context,
      builder: (dialogContext) => ChangeNotifierProvider.value(
        value: controller,
        child: SupplierDeleteDialog(
          supplier: supplier,
          productCount: productCount,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final intl = AppInternationalizationService.to;
    final controller = Provider.of<SuppliersController>(context, listen: false);
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
                  DataColumn(label: Text(intl.supplier)),
                  DataColumn(label: Text(intl.contactInfoText)),
                  DataColumn(label: Text(intl.productsText)),
                  DataColumn(label: Text(intl.totalValueText)),
                  DataColumn(label: Text(intl.statusText)),
                  DataColumn(label: Text(intl.notes)),
                  DataColumn(label: Text(intl.actions)),
                ],
                rows: suppliers.map((supplier) {
                  final supplierProducts = products
                      .where((product) => product.supplierId == supplier.refId)
                      .toList();
                  final productCount = supplierProducts.length;

                  return DataRow(
                    cells: [
                      DataCell(
                        SupplierCellBuilders.buildSupplierIdCell(
                          supplier,
                          theme,
                        ),
                      ),
                      DataCell(
                        SupplierCellBuilders.buildSupplierCell(supplier, theme),
                      ),
                      DataCell(
                        SupplierCellBuilders.buildContactCell(supplier, theme),
                      ),
                      DataCell(
                        SupplierCellBuilders.buildProductsCell(productCount),
                      ),
                      DataCell(
                        SupplierCellBuilders.buildTotalValueCell(
                          supplierProducts,
                          controller,
                          theme,
                        ),
                      ),
                      DataCell(SupplierCellBuilders.buildStatusCell(supplier)),
                      DataCell(
                        SupplierCellBuilders.buildNotesCell(supplier, theme),
                      ),
                      DataCell(
                        SupplierCellBuilders.buildActionsCell(
                          onEdit: () => showAddSupplierDialog(
                            context,
                            supplier: supplier,
                          ),
                          onDelete: () => _showDeleteDialog(
                            context,
                            supplier,
                            productCount,
                          ),
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
