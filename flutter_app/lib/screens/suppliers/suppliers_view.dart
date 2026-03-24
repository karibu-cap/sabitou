import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_theme.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/pop_up/add_supplier/add_supplier_view.dart';
import 'components/list_components/supplier_search_filters.dart';
import 'components/list_components/supplier_shimmer_widgets.dart';
import 'components/suppliers_list.dart';
import 'components/suppliers_stats_grid.dart';
import 'suppliers_controller.dart';
import 'suppliers_view_model.dart';

/// Suppliers view — entry point.
class SuppliersView extends StatelessWidget {
  const SuppliersView({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final currentStore = userPreferences.store;
    final business = userPreferences.business;
    final theme = ShadTheme.of(context);

    if (currentStore == null || business == null) {
      return Center(
        child: Text(
          AppInternationalizationService.to.noStoreSelected,
          style: theme.textTheme.p,
          textAlign: TextAlign.center,
        ),
      );
    }

    return ChangeNotifierProvider<SuppliersController>(
      create: (_) => SuppliersController(
        SuppliersViewModel(storeId: currentStore.refId),
        AppInternationalizationService.to,
      ),
      child: const SuppliersContent(),
    );
  }
}

/// Full page content.
class SuppliersContent extends StatelessWidget {
  const SuppliersContent({super.key});

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SuppliersHeader(),
          SizedBox(height: 24),
          SuppliersStatsGrid(),
          SizedBox(height: 20),
          SuppliersSearchFilters(),
          SizedBox(height: 20),
          SuppliersList(),
          SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Page header — title block + "New supplier" CTA.
class SuppliersHeader extends StatelessWidget {
  const SuppliersHeader({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<SuppliersController>(context, listen: false);
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);

    return StreamBuilder<List<Supplier>>(
      stream: controller.suppliersStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SupplierShimmerWidgets.buildHeaderShimmer(isMobile);
        }

        final count = snapshot.data?.length ?? 0;

        return Row(
          children: [
            // Amber accent bar
            Container(
              width: 3,
              height: 32,
              decoration: const BoxDecoration(
                color: SabitouColors.accent,
                borderRadius: BorderRadius.all(Radius.circular(2)),
              ),
            ),
            const SizedBox(width: 12),

            // Title + subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        AppInternationalizationService.to.supplierManagement,
                        style: theme.textTheme.h4.copyWith(
                          fontSize: 19,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.3,
                        ),
                      ),
                      if (count > 0) ...[
                        const SizedBox(width: 8),
                        _CountBadge(count: count),
                      ],
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    AppInternationalizationService
                        .to
                        .manageSupplierRelationships,
                    style: theme.textTheme.muted.copyWith(fontSize: 12.5),
                  ),
                ],
              ),
            ),

            // CTA button
            ShadButton(
              onPressed: () => showAddSupplierDialog(context),
              leading: const Icon(LucideIcons.plus, size: 15),
              child: Text(
                isMobile
                    ? AppInternationalizationService.to.newText
                    : AppInternationalizationService.to.addNewSupplier,
              ),
            ),
          ],
        );
      },
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 2),
      decoration: const BoxDecoration(
        color: SabitouColors.accentSoft,
        borderRadius: BorderRadius.all(Radius.circular(20)),
        border: Border.fromBorderSide(BorderSide(color: SabitouColors.accent)),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w500,
          color: SabitouColors.accentForeground,
        ),
      ),
    );
  }
}
