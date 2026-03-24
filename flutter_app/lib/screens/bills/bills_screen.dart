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
import 'bills_controller.dart';
import 'bills_view_model.dart';
import 'components/bill_card.dart';
import 'components/empty_detail.dart';
import 'detail/bill_screen.dart';

const double _kDesktopBreakpoint = 800;

class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final store = userPreferences.store;
    final theme = ShadTheme.of(context);

    if (store == null) {
      return Center(
        child: Text(
          AppInternationalizationService.to.noStoreSelected,
          style: theme.textTheme.p,
        ),
      );
    }

    return ChangeNotifierProvider<BillsController>(
      create: (_) => BillsController(
        BillsViewModel(storeId: store.refId),
        AppInternationalizationService.to,
      ),
      child: const _BillsAdaptiveLayout(),
    );
  }
}

class _BillsAdaptiveLayout extends StatelessWidget {
  const _BillsAdaptiveLayout();

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isDesktop = constraints.maxWidth >= _kDesktopBreakpoint;

        return isDesktop ? const _DesktopSplitView() : const _MobileListView();
      },
    );
  }
}

class _DesktopSplitView extends StatelessWidget {
  const _DesktopSplitView();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BillsController>(context);
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final selectedBill = controller.selectedBill;

    return Row(
      children: [
        Expanded(
          flex: 4,
          child: Container(
            decoration: BoxDecoration(
              color: cs.card,
              border: Border(right: BorderSide(color: cs.border)),
            ),
            child: const Column(
              children: [
                _BillsListHeader(showNewButton: true),
                _SearchAndFilters(),
                Expanded(child: _BillsList(isDesktop: true)),
              ],
            ),
          ),
        ),

        Expanded(
          flex: 5,
          child: selectedBill != null
              ? Stack(
                  children: [
                    Positioned.fill(
                      child: BillDetailScreen(
                        billRefId: selectedBill,
                        onDeleted: () => controller.selectBill(null),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => controller.selectBill(null),
                      ),
                    ),
                  ],
                )
              : const EmptyDetailState(),
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
        _BillsListHeader(showNewButton: true),
        _SearchAndFilters(),
        Expanded(child: _BillsList(isDesktop: false)),
      ],
    );
  }
}

class _BillsListHeader extends StatelessWidget {
  const _BillsListHeader({required this.showNewButton});
  final bool showNewButton;

  void _openCreateDialog(BuildContext context) {
    // Bill creation dialog — opened from BillsView directly.
    // In full flow, bills are usually created from a PO.
    // This allows manual creation.
    showShadDialog(
      context: context,
      builder: (_) => ChangeNotifierProvider.value(
        value: Provider.of<BillsController>(context, listen: false),
        child: const _BillCreateDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BillsController>(context, listen: false);
    final theme = ShadTheme.of(context);

    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 12),
      child: StreamBuilder<List<Bill>>(
        stream: controller.billsStream,
        builder: (context, snapshot) {
          final count = snapshot.data?.length ?? 0;

          return Row(
            children: [
              // Amber accent bar
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
                      Intls.to.bills,
                      style: theme.textTheme.h4.copyWith(
                        fontSize: 16,
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

class _SearchAndFilters extends StatelessWidget {
  const _SearchAndFilters();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BillsController>(context, listen: false);
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: Column(
        children: [
          // Search input
          Container(
            decoration: BoxDecoration(
              color: cs.background,
              border: Border.fromBorderSide(BorderSide(color: cs.border)),
              borderRadius: const BorderRadius.all(Radius.circular(9)),
            ),
            child: Row(
              children: [
                const SizedBox(width: 12),
                Icon(LucideIcons.search, size: 14, color: cs.mutedForeground),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: controller.searchController,
                    onChanged: (v) => controller.searchQuery.add(v),
                    style: theme.textTheme.p.copyWith(fontSize: 13),
                    decoration: InputDecoration(
                      hintText: Intls.to.searchBill,
                      hintStyle: theme.textTheme.muted.copyWith(fontSize: 13),
                      border: InputBorder.none,
                      isDense: true,
                      contentPadding: const EdgeInsets.symmetric(vertical: 10),
                    ),
                  ),
                ),
                const SizedBox(width: 12),
              ],
            ),
          ),
          const SizedBox(height: 8),

          // Status chips
          StreamBuilder<BillStatus?>(
            stream: controller.statusFilter.stream,
            builder: (context, snapshot) {
              final selected = snapshot.data;

              return SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _StatusChip(
                      label: Intls.to.all,
                      icon: LucideIcons.layoutList,
                      isSelected: selected == null,
                      onTap: () => controller.statusFilter.add(null),
                    ),
                    const SizedBox(width: 6),
                    _StatusChip(
                      label: Intls.to.unpaid,
                      icon: LucideIcons.clock,
                      isSelected: selected == BillStatus.BILL_STATUS_OPEN,
                      onTap: () => controller.statusFilter.add(
                        BillStatus.BILL_STATUS_OPEN,
                      ),
                      selectedBg: SabitouColors.accentSoft,
                      selectedBorder: SabitouColors.accent,
                      selectedFg: SabitouColors.accentForeground,
                      selectedIcon: SabitouColors.accent,
                    ),
                    const SizedBox(width: 6),
                    _StatusChip(
                      label: Intls.to.overdue,
                      icon: LucideIcons.circleAlert,
                      isSelected: selected == BillStatus.BILL_STATUS_OVERDUE,
                      onTap: () => controller.statusFilter.add(
                        BillStatus.BILL_STATUS_OVERDUE,
                      ),
                      selectedBg: SabitouColors.accentSoft,
                      selectedBorder: SabitouColors.accent,
                      selectedFg: SabitouColors.dangerForeground,
                      selectedIcon: SabitouColors.danger,
                    ),
                    const SizedBox(width: 6),
                    _StatusChip(
                      label: Intls.to.paid,
                      icon: LucideIcons.circleCheck,
                      isSelected: selected == BillStatus.BILL_STATUS_PAID,
                      onTap: () => controller.statusFilter.add(
                        BillStatus.BILL_STATUS_PAID,
                      ),
                      selectedBg: SabitouColors.successSoft,
                      selectedBorder: SabitouColors.success,
                      selectedFg: SabitouColors.successForeground,
                      selectedIcon: SabitouColors.success,
                    ),
                    const SizedBox(width: 6),
                    _StatusChip(
                      label: Intls.to.draft,
                      icon: LucideIcons.filePen,
                      isSelected: selected == BillStatus.BILL_STATUS_DRAFT,
                      onTap: () => controller.statusFilter.add(
                        BillStatus.BILL_STATUS_DRAFT,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  const _StatusChip({
    required this.label,
    required this.icon,
    required this.isSelected,
    required this.onTap,
    this.selectedBg,
    this.selectedBorder,
    this.selectedFg,
    this.selectedIcon,
  });

  final String label;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;
  final Color? selectedBg;
  final Color? selectedBorder;
  final Color? selectedFg;
  final Color? selectedIcon;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    final bg = isSelected ? (selectedBg ?? SabitouColors.accentSoft) : cs.card;
    final border = isSelected
        ? (selectedBorder ?? SabitouColors.accentSoft)
        : cs.border;
    final fg = isSelected
        ? (selectedFg ?? SabitouColors.accentForeground)
        : cs.mutedForeground;
    final ic = isSelected
        ? (selectedIcon ?? SabitouColors.accent)
        : cs.mutedForeground;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.symmetric(horizontal: 11, vertical: 6),
        decoration: BoxDecoration(
          color: bg,
          border: Border.all(color: border),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: ic),
            const SizedBox(width: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: fg,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _BillsList extends StatelessWidget {
  const _BillsList({required this.isDesktop});
  final bool isDesktop;

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BillsController>(context);

    return StreamBuilder<List<Bill>>(
      stream: controller.filteredBillsStream,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const _BillsShimmer();
        }
        if (snapshot.hasError) {
          return LoadingFailedWidget(
            error: snapshot.error ?? Intls.to.unknownError,
          );
        }
        final bills = snapshot.data ?? [];
        if (bills.isEmpty) {
          return const _BillsEmptyState();
        }

        return ListView.separated(
          padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
          itemCount: bills.length,
          separatorBuilder: (_, __) => const SizedBox(height: 8),
          itemBuilder: (context, i) {
            final bill = bills[i];
            final isSelected =
                isDesktop && controller.selectedBill == bill.refId;

            return BillCard(
              bill: bill,
              isSelected: isSelected,
              onTap: () {
                if (isDesktop) {
                  controller.selectBill(bill.refId);
                } else {
                  AppRouter.push(
                    context,
                    PagesRoutes.billDetail.create(
                      BillDetailParameters(billId: bill.refId),
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

class _BillsEmptyState extends StatelessWidget {
  const _BillsEmptyState();

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
              LucideIcons.receipt,
              size: 40,
              color: theme.colorScheme.mutedForeground,
            ),
            const SizedBox(height: 14),
            Text(
              Intls.to.noBill,
              style: theme.textTheme.p.copyWith(
                fontWeight: FontWeight.w600,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              Intls.to.billsWillAppearHere,
              style: theme.textTheme.muted.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}

class _BillsShimmer extends StatelessWidget {
  const _BillsShimmer();

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    return ListView.separated(
      padding: const EdgeInsets.fromLTRB(12, 4, 12, 24),
      itemCount: 4,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (_, __) => Container(
        height: 86,
        decoration: BoxDecoration(
          color: cs.card,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          border: Border.fromBorderSide(BorderSide(color: cs.border)),
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
        border: Border.fromBorderSide(BorderSide(color: SabitouColors.accent)),
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

class _BillCreateDialog extends StatelessWidget {
  const _BillCreateDialog();

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      title: Text(Intls.to.newBill),
      description: Text(Intls.to.newBillMessage),
      actions: [
        ShadButton.outline(
          onPressed: () => Navigator.pop(context),
          child: Text(Intls.to.close),
        ),
      ],
    );
  }
}
