import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/pop_up/add_supplier/add_supplier_view.dart';
import 'components/list_components/supplier_search_filters.dart';
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
    final storeId = UserPreferences.instance.store?.refId;

    if (storeId == null) {
      return Center(
        child: Text(AppInternationalizationService.to.noStoreSelected),
      );
    }

    return ChangeNotifierProvider<SuppliersController>(
      create: (_) => SuppliersController(
        SuppliersViewModel(storeId: storeId),
        AppInternationalizationService.to,
      ),
      child: const SuppliersContent(),
    );
  }
}

/// Suppliers content.
class SuppliersContent extends StatelessWidget {
  /// Constructs the suppliers content.
  const SuppliersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      child: Column(
        spacing: 32,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SuppliersHeader(),
          SuppliersStatsGrid(),
          SuppliersSearchFilters(),
          SuppliersList(),
        ],
      ),
    );
  }
}

/// Header widget for suppliers view.
class SuppliersHeader extends StatelessWidget {
  /// Constructs a new SuppliersHeader.
  const SuppliersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context);
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return StreamBuilder<List<Supplier>>(
      stream: controller.suppliersStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SupplierShimmerWidgets.buildHeaderShimmer(isMobile);
        }

        return Flex(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          spacing: 12,
          crossAxisAlignment: CrossAxisAlignment.start,
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
              onPressed: () => showAddSupplierDialog(context),
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
