import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/error/loading_failed.dart';
import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../themes/app_theme.dart';
import '../../utils/responsive_utils.dart';
import '../bills/bills_controller.dart';
import '../bills/bills_view_model.dart';
import 'components/po_utils.dart';
import 'components/purchase_order_card.dart';
import 'detail/purchase_order_detail_screen.dart';
import 'purchase_orders_controller.dart';
import 'purchase_orders_view_model.dart';

/// The [PurchaseOrdersView].
class PurchaseOrdersView extends StatelessWidget {
  /// Construct of new [PurchaseOrdersView].
  const PurchaseOrdersView({super.key});

  @override
  Widget build(BuildContext context) {
    final prefs = context.watch<UserPreferences>();
    final store = prefs.store;
    final theme = ShadTheme.of(context);

    if (store == null) {
      return Center(
        child: Text(
          AppInternationalizationService.to.noStoreSelected,
          style: theme.textTheme.p,
        ),
      );
    }

    // BillsController is needed for bill creation inside PO detail.
    // We reuse the one already in context (provided higher up) or create one.
    final billsController = BillsController(
      BillsViewModel(storeId: store.refId),
      Intls.to,
    );

    return ChangeNotifierProvider<PurchaseOrdersController>(
      create: (_) => PurchaseOrdersController(
        PurchaseOrdersViewModel(storeId: store.refId),
        AppInternationalizationService.to,
        billsController,
      ),
      child: const _PurchaseOrdersAdaptiveLayout(),
    );
  }
}

class _PurchaseOrdersAdaptiveLayout extends StatelessWidget {
  const _PurchaseOrdersAdaptiveLayout();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = ResponsiveUtils.isMobile(context);

        return !isMobile ? const _DesktopSplitView() : const _MobileListView();
      },
    );
  }
}

class _DesktopSplitView extends StatelessWidget {
  const _DesktopSplitView();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PurchaseOrdersController>(context);
    final cs = ShadTheme.of(context).colorScheme;
    final selectedPo = controller.selectedPo;

    return Row(
      children: [
        Container(
          width: 380,
          decoration: BoxDecoration(
            color: cs.card,
            border: Border(right: BorderSide(color: cs.border)),
          ),
          child: const Column(
            children: [
              _PoListHeader(showNewButton: true),
              _StatusFilterChips(),
              _SearchInput(),
              Expanded(child: _PoList(isDesktop: true)),
            ],
          ),
        ),

        Expanded(
          child: selectedPo != null
              ? PurchaseOrderDetailScreen(purchaseOrderId: selectedPo)
              : _EmptyDetailState(),
        ),
      ],
    );
  }
}

class _MobileListView extends StatelessWidget {
  const _MobileListView();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        _PoListHeader(showNewButton: true),
        _StatusFilterChips(),
        _SearchInput(),
        Expanded(child: _PoList(isDesktop: false)),
      ],
    );
  }
}

class _PoListHeader extends StatelessWidget {
  const _PoListHeader({required this.showNewButton});
  final bool showNewButton;

  void _openCreateDialog(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    if (isMobile) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => ChangeNotifierProvider.value(
            value: Provider.of<PurchaseOrdersController>(
              context,
              listen: false,
            ),
            child: const _PurchaseOrderFormPage(),
          ),
        ),
      );
    } else {
      showShadDialog(
        context: context,
        builder: (_) => ChangeNotifierProvider.value(
          value: Provider.of<PurchaseOrdersController>(context, listen: false),
          child: const _PurchaseOrderFormDialog(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PurchaseOrdersController>(
      context,
      listen: false,
    );
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 18, 16, 10),
      child: StreamBuilder<List<PurchaseOrder>>(
        stream: controller.purchaseOrdersStream,
        builder: (context, snapshot) {
          final count = snapshot.data?.length ?? 0;

          return Row(
            children: [
              Container(
                width: 3,
                height: 28,
                decoration: const BoxDecoration(
                  color: SabitouColors.accent,
                  borderRadius: BorderRadius.all(Radius.circular(2)),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Row(
                  children: [
                    Text(
                      Intls.to.purchaseOrders,
                      style: theme.textTheme.h4.copyWith(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        letterSpacing: -0.2,
                      ),
                    ),
                    if (count > 0) ...[
                      const SizedBox(width: 8),
                      _CountBadge(count: count),
                    ],
                  ],
                ),
              ),
              if (showNewButton)
                ShadButton(
                  size: ShadButtonSize.sm,
                  onPressed: () => _openCreateDialog(context),
                  leading: const Icon(LucideIcons.plus, size: 14),
                  child: Text(Intls.to.newText),
                ),
            ],
          );
        },
      ),
    );
  }
}

class _StatusFilterChips extends StatelessWidget {
  const _StatusFilterChips();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PurchaseOrdersController>(
      context,
      listen: false,
    );

    return StreamBuilder<PurchaseOrderStatus?>(
      stream: controller.statusFilter.stream,
      builder: (context, snapshot) {
        final selected = snapshot.data;

        return SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.only(left: 12, right: 12, bottom: 8),
          child: Row(
            children: [
              _StatusChip(
                label: Intls.to.all,
                isSelected: selected == null,
                onTap: () => controller.statusFilter.add(null),
              ),
              const SizedBox(width: 6),
              _StatusChip(
                label: Intls.to.draft,
                isSelected: selected == PurchaseOrderStatus.PO_STATUS_DRAFT,
                onTap: () => controller.statusFilter.add(
                  PurchaseOrderStatus.PO_STATUS_DRAFT,
                ),
              ),
              const SizedBox(width: 6),
              _StatusChip(
                label: Intls.to.pending,
                isSelected: selected == PurchaseOrderStatus.PO_STATUS_PENDING,
                onTap: () => controller.statusFilter.add(
                  PurchaseOrderStatus.PO_STATUS_PENDING,
                ),
                activeStyle: PoStatusUtils.styleFor(
                  PurchaseOrderStatus.PO_STATUS_PENDING,
                ),
              ),
              const SizedBox(width: 6),
              _StatusChip(
                label: Intls.to.partial,
                isSelected:
                    selected ==
                    PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED,
                onTap: () => controller.statusFilter.add(
                  PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED,
                ),
                activeStyle: PoStatusUtils.styleFor(
                  PurchaseOrderStatus.PO_STATUS_PARTIALLY_RECEIVED,
                ),
              ),
              const SizedBox(width: 6),
              _StatusChip(
                label: Intls.to.received,
                isSelected: selected == PurchaseOrderStatus.PO_STATUS_RECEIVED,
                onTap: () => controller.statusFilter.add(
                  PurchaseOrderStatus.PO_STATUS_RECEIVED,
                ),
                activeStyle: PoStatusUtils.styleFor(
                  PurchaseOrderStatus.PO_STATUS_RECEIVED,
                ),
              ),
              const SizedBox(width: 6),
              _StatusChip(
                label: Intls.to.cancelled,
                isSelected: selected == PurchaseOrderStatus.PO_STATUS_CANCELLED,
                onTap: () => controller.statusFilter.add(
                  PurchaseOrderStatus.PO_STATUS_CANCELLED,
                ),
                activeStyle: PoStatusUtils.styleFor(
                  PurchaseOrderStatus.PO_STATUS_CANCELLED,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.isSelected,
    required this.onTap,
    this.activeStyle,
  });

  final String label;
  final bool isSelected;
  final VoidCallback onTap;
  final PoStatusStyle? activeStyle;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    final bg = isSelected
        ? (activeStyle?.bg ?? SabitouColors.accentSoft)
        : cs.card;
    final border = isSelected
        ? (activeStyle?.dot.withOpacity(.5) ?? SabitouColors.accentBorder)
        : cs.border;
    final fg = isSelected
        ? (activeStyle?.fg ?? SabitouColors.accentForeground)
        : cs.mutedForeground;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 130),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(color: border),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: fg,
          ),
        ),
      ),
    );
  }
}

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PurchaseOrdersController>(
      context,
      listen: false,
    );
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadInput(
      controller: controller.searchController,
      placeholder: Text(Intls.to.searchPurchaseOrder),
      leading: const Icon(LucideIcons.search, size: 16),
      onChanged: (v) => controller.searchQuery.add(v),
    );
    ;
  }
}

class _PoList extends StatelessWidget {
  const _PoList({required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PurchaseOrdersController>(context);

    return StreamBuilder<List<PurchaseOrder>>(
      stream: controller.filteredPurchaseOrdersStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _PoListShimmer();
        }
        if (snapshot.hasError) {
          return LoadingFailedWidget(error: snapshot.error);
        }
        final orders = snapshot.data ?? [];
        if (orders.isEmpty) {
          return _PoEmptyState(hasFilters: controller.isFiltered);
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
          itemCount: orders.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final po = orders[i];
            final isSelected = isDesktop && controller.selectedPo == po.refId;

            return PurchaseOrderCard(
              po: po,
              isSelected: isSelected,
              onTap: () {
                if (isDesktop) {
                  controller.selectPurchaseOrder(po.refId);
                } else {
                  AppRouter.push(
                    context,
                    PagesRoutes.purchaseOrderDetail.create(
                      PurchaseOrderDetailParameters(purchaseOrderId: po.refId),
                    ),
                  );
                }
              },
            );
          },
        );
      },
    );
  }
}

class _EmptyDetailState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: const BoxDecoration(
              color: SabitouColors.accentSoft,
              borderRadius: BorderRadius.all(Radius.circular(16)),
            ),
            child: const Icon(
              LucideIcons.clipboardList,
              size: 26,
              color: SabitouColors.accentForeground,
            ),
          ),
          const SizedBox(height: 16),
          Text(
            Intls.to.selectPurchaseOrder,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w600,
              fontSize: 15,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            Intls.to.clickPurchaseOrderToSeeDetails,
            style: theme.textTheme.muted.copyWith(fontSize: 13),
          ),
        ],
      ),
    );
  }
}

class _PoListShimmer extends StatelessWidget {
  const _PoListShimmer();

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, __) => Container(
        height: 90,
        decoration: BoxDecoration(
          color: cs.card,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(color: cs.border)),
        ),
      ),
    );
  }
}

class _PoEmptyState extends StatelessWidget {
  const _PoEmptyState({required this.hasFilters});
  final bool hasFilters;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              LucideIcons.clipboardList,
              size: 40,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(height: 14),
            Text(
              hasFilters ? Intls.to.noResults : Intls.to.noPurchaseOrders,
              style: theme.textTheme.p.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              hasFilters
                  ? Intls.to.modifyFilters
                  : Intls.to.createFirstPurchaseOrder,
              style: theme.textTheme.muted.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _CountBadge extends StatelessWidget {
  const _CountBadge({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: const BoxDecoration(
        color: SabitouColors.accentSoft,
        border: Border.fromBorderSide(
          BorderSide(color: SabitouColors.accentBorder),
        ),
        borderRadius: BorderRadius.all(Radius.circular(20)),
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

class _PurchaseOrderFormDialog extends StatelessWidget {
  const _PurchaseOrderFormDialog();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      constraints: const BoxConstraints(maxWidth: 560),
      title: Text(Intls.to.newPurchaseOrder),
      child: const _PurchaseOrderFormContent(),
      actions: [
        ShadButton.outline(
          onPressed: () => Navigator.pop(context),
          child: const Text('Annuler'),
        ),
      ],
    );
  }
}

class _PurchaseOrderFormPage extends StatelessWidget {
  const _PurchaseOrderFormPage();

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: AppBar(
        backgroundColor: theme.colorScheme.card,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            LucideIcons.arrowLeft,
            size: 20,
            color: theme.colorScheme.foreground,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(Intls.to.newPurchaseOrder),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(1),
          child: Divider(color: theme.colorScheme.border, height: 1),
        ),
      ),
      body: const SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: _PurchaseOrderFormContent(),
      ),
    );
  }
}

class _PurchaseOrderFormContent extends StatelessWidget {
  const _PurchaseOrderFormContent();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadInput(
          placeholder: Text(Intls.to.supplierPlaceholder),
          leading: const Icon(LucideIcons.building2, size: 14),
        ),
        const SizedBox(height: 10),
        ShadInput(
          placeholder: Text(Intls.to.deliveryAddress),
          leading: const Icon(LucideIcons.mapPin, size: 14),
        ),
        const SizedBox(height: 10),
        ShadInput(
          placeholder: Text(Intls.to.expectedDeliveryDate),
          leading: const Icon(LucideIcons.calendarDays, size: 14),
        ),
        const SizedBox(height: 10),
        ShadInput(placeholder: Text(Intls.to.notes), maxLines: 2),
        const SizedBox(height: 16),
        Text(Intls.to.items),
        const SizedBox(height: 8),
        ShadButton.outline(
          width: double.infinity,
          onPressed: () {},
          leading: const Icon(LucideIcons.plus, size: 14),
          child: Text(Intls.to.addItem),
        ),
        const SizedBox(height: 16),
        ShadButton(
          width: double.infinity,
          onPressed: () => Navigator.pop(context),
          child: Text(Intls.to.createPurchaseOrder),
        ),
      ],
    );
  }
}
