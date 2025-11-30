import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../widgets/error/loading_failed.dart';
import '../../../widgets/pop_up/add_supplier/add_supplier_view.dart';
import '../../../widgets/shad_data_grid.dart';
import '../suppliers_controller.dart';
import 'list_components/supplier_cell_builders.dart';
import 'list_components/supplier_delete_dialog.dart';
import 'list_components/supplier_empty_state.dart';
import 'list_components/supplier_list_header.dart';
import 'list_components/supplier_shimmer_widgets.dart';

/// Widget for displaying the list of suppliers.
///
/// This is the main suppliers list widget that orchestrates the display
/// of suppliers using modular components for better maintainability.
class SuppliersList extends StatelessWidget {
  /// Creates a new [SuppliersList].
  const SuppliersList({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context, listen: false);

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: SupplierListHeader(),
          ),
          const SizedBox(height: 16),

          StreamBuilder<List<Supplier>>(
            stream: controller.filteredSuppliersStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SupplierShimmerWidgets.buildTableShimmer();
              }
              final error = snapshot.error;
              if (snapshot.hasError && error != null) {
                return LoadingFailedWidget(error: error);
              }
              final suppliers = snapshot.data ?? [];
              if (suppliers.isEmpty) {
                return const SuppliersEmptyState();
              }

              return _SupplierDataTable(suppliers: suppliers);
            },
          ),
        ],
      ),
    );
  }
}

class _SupplierDataTable extends StatelessWidget {
  const _SupplierDataTable({required this.suppliers});

  final List<Supplier> suppliers;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    /// Shows delete confirmation dialog.
    void _showDeleteDialog(BuildContext context, Supplier supplier) {
      // Get the controller from the current context before showing the dialog
      final controller = Provider.of<SuppliersController>(
        context,
        listen: false,
      );

      showDialog(
        context: context,
        builder: (dialogContext) => ChangeNotifierProvider.value(
          value: controller,
          child: SupplierDeleteDialog(supplier: supplier),
        ),
      );
    }

    return ShadDataGrid<Supplier>(
      data: suppliers,
      footerFrozenColumnsCount: 1,
      columns: [
        const ShadDataGridColumn(label: '', width: 180),
        ShadDataGridColumn(label: Intls.to.supplier, width: 200),
        ShadDataGridColumn(label: Intls.to.contactInfoText, width: 200),
        ShadDataGridColumn(label: Intls.to.status, width: 120),
        ShadDataGridColumn(label: Intls.to.notes, width: 180),
        ShadDataGridColumn(label: Intls.to.actions, width: 120),
      ],
      rowBuilder: (supplier) {
        return [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: Text(
              supplier.refId.substring(0, 10),
              style: theme.textTheme.muted,
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: SupplierCellBuilders.buildSupplierCell(supplier, theme),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: SupplierCellBuilders.buildContactCell(supplier, theme),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: SupplierCellBuilders.buildStatusCell(supplier),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: SupplierCellBuilders.buildNotesCell(supplier, theme),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            alignment: Alignment.centerLeft,
            child: SupplierCellBuilders.buildActionsCell(
              onEdit: () => showAddSupplierDialog(context, supplier: supplier),
              onDelete: () => _showDeleteDialog(context, supplier),
              theme: theme,
            ),
          ),
        ];
      },
    );
  }
}
