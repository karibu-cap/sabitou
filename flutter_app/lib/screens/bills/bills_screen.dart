import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/error/loading_failed.dart';
import '../../themes/app_theme.dart';
import '../../widgets/bills/bill_card.dart';
import '../../widgets/bills/form/bill_form.dart';
import '../../widgets/no_business_view.dart';
import 'bills_controller.dart';
import 'bills_view_model.dart';
import 'components/empty_detail.dart';
import 'detail/bill_screen.dart';

const double _kDesktopBreakpoint = 800;

/// Thw bill screen view.
class BillsScreen extends StatelessWidget {
  /// Constructor of new [BillsScreen].
  const BillsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final userPreferences = context.watch<UserPreferences>();
    final store = userPreferences.store;

    if (store == null) {
      return const Scaffold(body: Center(child: NoBusinessView()));
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
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final selectedBill = context.select<BillsController, String?>(
      (e) => e.selectedBill,
    );

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
                        key: Key(selectedBill),
                        billRefId: selectedBill,
                        onDeleted: () =>
                            context.read<BillsController>().selectBill(null),
                      ),
                    ),

                    Positioned(
                      top: 10,
                      right: 10,
                      child: IconButton(
                        icon: const Icon(LucideIcons.x400),
                        onPressed: () =>
                            context.read<BillsController>().selectBill(null),
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
                  onPressed: () => showBillForm(context),
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

    return Padding(
      padding: const EdgeInsets.only(left: 12, right: 12, bottom: 10),
      child: Column(
        children: [
          const _SearchInput(),
          const SizedBox(height: 8),
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

class _SearchInput extends StatelessWidget {
  const _SearchInput();

  @override
  Widget build(BuildContext context) {
    final controller = Provider.of<BillsController>(context, listen: false);

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
    final controller = Provider.of<BillsController>(context, listen: false);

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

            return _BillListItem(
              key: ValueKey(bill.refId),
              bill: bill,
              isDesktop: isDesktop,
              onTap: () => controller.selectBill(bill.refId),
              onDelete: () => controller.deleteBill(bill.refId),
            );
          },
        );
      },
    );
  }
}

class _BillListItem extends StatelessWidget {
  final Bill bill;
  final bool isDesktop;
  final VoidCallback onTap;
  final VoidCallback onDelete;

  const _BillListItem({
    super.key,
    required this.bill,
    required this.isDesktop,
    required this.onTap,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final isSelected = context.select<BillsController, bool>(
      (c) => isDesktop && c.selectedBill == bill.refId,
    );

    return BillCard(
      bill: bill,
      isSelected: isSelected,
      onTap: onTap,
      onDelete: onDelete,
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
