import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_theme.dart';
import '../../utils/responsive_utils.dart';
import '../../utils/user_preference.dart';
import '../../widgets/loading.dart';
import '../../widgets/no_business_view.dart';
import '../../widgets/pop_up/add_supplier/add_supplier_view.dart';
import 'components/list_components/supplier_empty_state.dart';
import 'components/list_components/supplier_search_filters.dart';
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

    if (currentStore == null || business == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
    }

    return ChangeNotifierProvider<SuppliersController>(
      create: (_) => SuppliersController(
        SuppliersViewModel(storeId: currentStore.refId),
        AppInternationalizationService.to,
      ),
      builder: (context, child) {
        final controller = context.read<SuppliersController>();

        return StreamBuilder(
          stream: controller.suppliersStream,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: Loading());
            }

            final data = snapshot.data ?? [];

            if (data.isEmpty) {
              return const SuppliersEmptyState();
            }

            return SuppliersContent(suppliers: data);
          },
        );
      },
    );
  }
}

/// Full page content.
class SuppliersContent extends StatelessWidget {
  /// Creates a new [SuppliersContent].
  const SuppliersContent({super.key, required this.suppliers});

  /// The suppliers list to display.
  final List<Supplier> suppliers;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.zero,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SuppliersHeader(suppliers: suppliers),
          const SizedBox(height: 24),
          SuppliersStatsGrid(suppliers: suppliers),
          const SizedBox(height: 20),
          const SuppliersSearchFilters(),
          const SizedBox(height: 20),
          const SuppliersList(),
          const SizedBox(height: 32),
        ],
      ),
    );
  }
}

/// Page header — title block + "New supplier" CTA.
class SuppliersHeader extends StatelessWidget {
  /// Creates a new [SuppliersHeader].
  const SuppliersHeader({super.key, required this.suppliers});

  /// The suppliers list to display.
  final List<Supplier> suppliers;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isMobile = ResponsiveUtils.isMobile(context);
    final count = suppliers.length;

    return Row(
      children: [
        Container(
          width: 3,
          height: 32,
          decoration: const BoxDecoration(
            color: SabitouColors.accent,
            borderRadius: BorderRadius.all(Radius.circular(2)),
          ),
        ),
        const SizedBox(width: 12),

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
                AppInternationalizationService.to.manageSupplierRelationships,
                style: theme.textTheme.muted.copyWith(fontSize: 12.5),
              ),
            ],
          ),
        ),

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
