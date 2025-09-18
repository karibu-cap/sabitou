import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/common_scaffold.dart';
import 'components/dialogs/suppliers_add/suppliers_add_view.dart';
import 'components/list_components/supplier_shimmer_widgets.dart';
import 'components/suppliers_list.dart';
import 'components/suppliers_stats_grid.dart';
import 'suppliers_controller.dart';
import 'suppliers_view_model.dart';

/// Suppliers view.
class SuppliersView extends StatelessWidget {
  /// Constructs the SuppliersView view.
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SuppliersController>(
      create: (_) => SuppliersController(
        SuppliersViewModel(storeId: 'store-id-placeholder'),
        AppInternationalizationService.to,
      ),
      child: const CommonScaffold(
        displayAppBar: false,
        child: SuppliersContent(),
      ),
    );
  }
}

/// Suppliers content.
class SuppliersContent extends StatelessWidget {
  /// Constructs the suppliers content.
  const SuppliersContent({super.key});

  /// Show supplier dialog for adding or editing
  void _showSupplierDialog(
    BuildContext context,
    SuppliersController controller,
    Supplier? supplier,
  ) {
    showDialog(
      context: context,
      builder: (dialogContext) =>
          ChangeNotifierProvider<SuppliersController>.value(
            value: controller,
            child: SupplierFormDialog(
              suppliersController: controller,
              supplier: supplier,
            ),
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(24),
      child: Column(
        spacing: 32,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SuppliersHeader(
            onAddSupplier: () => _showSupplierDialog(context, controller, null),
          ),
          const SuppliersStatsGrid(),
          const SuppliersList(),
        ],
      ),
    );
  }
}

/// Header widget for suppliers view.
class SuppliersHeader extends StatelessWidget {
  /// The add supplier callback.
  final VoidCallback onAddSupplier;

  /// Constructs a new SuppliersHeader.
  const SuppliersHeader({super.key, required this.onAddSupplier});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context);
    final theme = ShadTheme.of(context);

    return StreamBuilder<List<Supplier>>(
      stream: controller.suppliersStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SupplierShimmerWidgets.buildHeaderShimmer();
        }

        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  AppInternationalizationService.to.supplierManagement,
                  style: theme.textTheme.h4,
                ),
                const SizedBox(height: 4),
                Text(
                  AppInternationalizationService.to.manageSupplierRelationships,
                  style: theme.textTheme.muted,
                ),
              ],
            ),
            ShadButton(
              onPressed: onAddSupplier,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.add, size: 16),
                  const SizedBox(width: 8),
                  Text(AppInternationalizationService.to.addSupplierBtn),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
