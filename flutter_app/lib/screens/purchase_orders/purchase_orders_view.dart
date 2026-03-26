import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/error/loading_failed.dart';
import '../../../widgets/purchase_orders/form/purchase_order_form.dart';
import '../../router/app_router.dart';
import '../../router/page_routes.dart';
import '../../themes/app_theme.dart';
import '../../utils/responsive_utils.dart';
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

    return ChangeNotifierProvider<PurchaseOrdersController>(
      create: (_) => PurchaseOrdersController(
        PurchaseOrdersViewModel(storeId: store.refId),
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
        final isTablet = ResponsiveUtils.isTablet(context);

        return !isTablet ? const _DesktopSplitView() : const _MobileListView();
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
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: PurchaseOrderDetailScreen(
                        purchaseOrderId: selectedPo,
                        key: Key(selectedPo),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(LucideIcons.x400),
                        onPressed: controller.clearSelection,
                      ),
                    ),
                  ],
                )
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
    final controller = Provider.of<PurchaseOrdersController>(
      context,
      listen: false,
    );
    showPurchaseOrderForm(context, purchaseOrdersController: controller);
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
                isSelected: selected == PurchaseOrderStatus.PO_STATUS_ISSUED,
                onTap: () => controller.statusFilter.add(
                  PurchaseOrderStatus.PO_STATUS_ISSUED,
                ),
                activeStyle: PoStatusUtils.styleFor(
                  PurchaseOrderStatus.PO_STATUS_ISSUED,
                ),
              ),
              const SizedBox(width: 6),
              _StatusChip(
                label: Intls.to.received,
                isSelected: selected == PurchaseOrderStatus.PO_STATUS_CLOSED,
                onTap: () => controller.statusFilter.add(
                  PurchaseOrderStatus.PO_STATUS_CLOSED,
                ),
                activeStyle: PoStatusUtils.styleFor(
                  PurchaseOrderStatus.PO_STATUS_CLOSED,
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
        ? (activeStyle?.dot.withValues(alpha:.5) ?? SabitouColors.accentBorder)
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

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ShadInput(
        controller: controller.searchController,
        placeholder: Text(Intls.to.searchPurchaseOrder),
        leading: const Icon(LucideIcons.search, size: 16),
        onChanged: (v) => controller.searchQuery.add(v),
      ),
    );
  }
}

class _PoList extends StatelessWidget {
  const _PoList({required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    return Selector<PurchaseOrdersController, String?>(
      selector: (_, controller) => controller.selectedPo,
      builder: (context, selectedPo, _) {
        final controller = Provider.of<PurchaseOrdersController>(
          context,
          listen: false,
        );

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
                final isSelected = isDesktop && selectedPo == po.refId;

                return _PoListItem(
                  po: po,
                  isSelected: isSelected,
                  isDesktop: isDesktop,
                );
              },
            );
          },
        );
      },
    );
  }
}

class _PoListItem extends StatelessWidget {
  const _PoListItem({
    required this.po,
    required this.isSelected,
    required this.isDesktop,
  });

  final PurchaseOrder po;
  final bool isSelected;
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<PurchaseOrdersController>(
      context,
      listen: false,
    );

    return StreamBuilder<PurchaseOrderDetailSnapshot>(
      stream: controller.detailStream(po.refId),
      builder: (context, snapshot) {
        final snapshot_ = snapshot.data;
        final bills = snapshot_?.bills ?? [];
        final receivingNotes = snapshot_?.receivingNotes ?? [];

        return PurchaseOrderCard(
          po: po,
          isSelected: isSelected,
          bills: bills,
          receivingNotes: receivingNotes,
          onTap: () {
            if (isDesktop) {
              controller.selectPurchaseOrder(po.refId);
            } else {
              AppRouter.push(
                context,
                PagesRoutes.purchaseOrderDetail.create(
                  PurchaseOrderDetailParameters(
                    purchaseOrderId: po.refId,
                  ),
                ),
              );
            }
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
