import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../../services/internationalization/internationalization.dart';
import '../../suppliers_controller.dart';
import '../dialogs/suppliers_add/suppliers_add_view.dart';
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

  /// Shows supplier form dialog for editing.
  void _showSupplierDialog(BuildContext context, Supplier supplier) {
    final controller = Provider.of<SuppliersController>(context, listen: false);

    showDialog<bool>(
      context: context,
      builder: (context) => ChangeNotifierProvider.value(
        value: controller,
        child: SupplierFormDialog(
          suppliersController: controller,
          supplier: supplier,
        ),
      ),
    );
  }

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

    final headersStyle = theme.textTheme.h4.copyWith(
      fontWeight: FontWeight.bold,
      fontSize: 16,
    );

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        dataRowMinHeight: 60,
        dataRowMaxHeight: 80,
        columns: [
          DataColumn(label: Text('', style: headersStyle)),
          DataColumn(label: Text(intl.supplier, style: headersStyle)),
          DataColumn(label: Text(intl.contactInfoText, style: headersStyle)),
          DataColumn(label: Text(intl.productsText, style: headersStyle)),
          DataColumn(label: Text(intl.totalValueText, style: headersStyle)),
          DataColumn(label: Text(intl.statusText, style: headersStyle)),
          DataColumn(label: Text(intl.notes, style: headersStyle)),
          DataColumn(label: Text(intl.actions, style: headersStyle)),
        ],
        rows: suppliers.map((supplier) {
          final supplierProducts = products
              .where((product) => product.supplierId == supplier.refId)
              .toList();
          final productCount = supplierProducts.length;

          return DataRow(
            cells: [
              DataCell(
                SupplierCellBuilders.buildSupplierIdCell(supplier, theme),
              ),
              DataCell(SupplierCellBuilders.buildSupplierCell(supplier, theme)),
              DataCell(SupplierCellBuilders.buildContactCell(supplier, theme)),
              DataCell(SupplierCellBuilders.buildProductsCell(productCount)),
              DataCell(
                SupplierCellBuilders.buildTotalValueCell(
                  supplierProducts,
                  controller,
                  theme,
                ),
              ),
              DataCell(SupplierCellBuilders.buildStatusCell(supplier)),
              DataCell(SupplierCellBuilders.buildNotesCell(supplier, theme)),
              DataCell(
                SupplierCellBuilders.buildActionsCell(
                  onEdit: () => _showSupplierDialog(context, supplier),
                  onDelete: () =>
                      _showDeleteDialog(context, supplier, productCount),
                  theme: theme,
                ),
              ),
            ],
          );
        }).toList(),
      ),
    );
  }
}
