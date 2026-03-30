import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../router/app_router.dart';
import '../../../router/page_routes.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/bills/bill_card.dart';
import '../../../widgets/bills/form/bill_form.dart';
import '../../../widgets/custom_grid.dart';
import '../components/convert_to_bill_sheet.dart';
import '../components/po_receive_form.dart';
import '../components/po_utils.dart';
import 'purchase_order_detail_controller.dart';

/// The [PurchaseOrderDetail].
class PurchaseOrderDetail extends StatefulWidget {
  /// Creates a new instance of [PurchaseOrderDetail].
  const PurchaseOrderDetail({
    super.key,
    required this.po,
    required this.bills,
    required this.receivingNotes,
    required this.payments,
    required this.storeId,
    required this.currentUserId,
    this.onBack,
  });

  /// The [PurchaseOrder] object.
  final PurchaseOrder po;

  /// The list of [Bill]s.
  final List<Bill> bills;

  /// The list of [ReceivingNote]s.
  final List<ReceivingNote> receivingNotes;

  /// The list of [Payment]s.
  final List<Payment> payments;

  /// The ID of the store.
  final String storeId;

  /// The ID of the current user.
  final String currentUserId;

  /// The callback function to be called when the back button is pressed.
  final VoidCallback? onBack;

  @override
  State<PurchaseOrderDetail> createState() => _PurchaseOrderDetailState();
}

class _PurchaseOrderDetailState extends State<PurchaseOrderDetail>
    with SingleTickerProviderStateMixin {
  late TabController _tabs;

  @override
  void initState() {
    super.initState();
    _tabs = TabController(length: 3, vsync: this);
  }

  @override
  void dispose() {
    _tabs.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    final billCount = widget.bills.length;
    final receiveCount = widget.receivingNotes.length;
    final ctrl = context.watch<PurchaseOrderDetailController>();

    return Column(
      children: [
        Container(
          color: cs.card,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 20, top: 16, right: 20),
                child: _DetailTopRow(po: widget.po, theme: theme, cs: cs),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 12, 20, 14),
                child: _AmountHeroRow(po: widget.po, theme: theme, cs: cs),
              ),
              _DetailTabBar(
                tabController: _tabs,
                billCount: billCount,
                receiveCount: receiveCount,
              ),
            ],
          ),
        ),

        if (ctrl.isLoading)
          LinearProgressIndicator(
            minHeight: 2,
            backgroundColor: cs.border,
            color: SabitouColors.accent,
          ),

        Expanded(
          child: TabBarView(
            controller: _tabs,
            children: [
              _DetailsTab(
                po: widget.po,
                receivingNotes: widget.receivingNotes,
                bills: widget.bills,
                payments: widget.payments,
              ),
              _ReceivesTab(
                po: widget.po,
                receivingNotes: widget.receivingNotes,
              ),
              _BillsTab(
                po: widget.po,
                bills: widget.bills,
                receivingNotes: widget.receivingNotes,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _DetailTopRow extends StatelessWidget {
  const _DetailTopRow({
    required this.po,
    required this.theme,
    required this.cs,
  });

  final PurchaseOrder po;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PurchaseOrderDetailController>();
    final userId = context.select<UserPreferences, String?>((e) => e.userId);
    final isMobile = ResponsiveUtils.isMobile(context);

    return Flex(
      direction: isMobile ? Axis.vertical : Axis.horizontal,
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: isMobile ? 0 : 2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                po.refId,
                style: theme.textTheme.h3.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                po.supplierName.isNotEmpty ? po.supplierName : po.supplierId,
                style: theme.textTheme.muted.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),

        // Action buttons
        Wrap(
          spacing: 8,
          runSpacing: 8,
          alignment: WrapAlignment.end,
          children: [
            if (ctrl.canReceive(po.status) &&
                userId != null &&
                PoStatusUtils.receiveProgress(po) < 1.0)
              ShadButton(
                size: ShadButtonSize.sm,
                onPressed: () => showReceiveForm(
                  context,
                  po: po,
                  storeId: ctrl.storeId,
                  userId: userId,
                ),
                leading: const Icon(LucideIcons.packageCheck, size: 14),
                child: Text(Intls.to.receive),
              ),

            if (ctrl.canGenerateBill(po.status))
              ShadButton.outline(
                size: ShadButtonSize.sm,
                onPressed: () => showBillForm(context, purchaseOrder: po),
                leading: const Icon(LucideIcons.fileText, size: 14),
                child: Text(Intls.to.generateBill),
              ),

            _Menu(po: po),
          ],
        ),
      ],
    );
  }
}

class _Menu extends StatelessWidget {
  final PurchaseOrder po;

  final popoverController = ShadPopoverController();

  _Menu({required this.po});

  Future<void> _confirmCancel(
    BuildContext context,
    PurchaseOrderDetailController ctrl,
  ) async {
    final ok = await showShadDialog<bool>(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: Text(Intls.to.cancelPurchaseOrderQuestion),
        description: Text(Intls.to.thisActionIsIrreversible),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.pop(context, false),
            child: Text(Intls.to.no),
          ),
          ShadButton.destructive(
            onPressed: () => Navigator.pop(context, true),
            child: Text(Intls.to.confirmCancellation),
          ),
        ],
      ),
    );
    final userId = context.read<UserPreferences>().userId;
    if (ok == true && context.mounted && userId != null) {
      await ctrl.cancelPurchaseOrder(userId: userId);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PurchaseOrderDetailController>();

    return ShadPopover(
      controller: popoverController,
      child: ShadButton.ghost(
        size: ShadButtonSize.sm,
        onPressed: popoverController.toggle,
        leading: const Icon(LucideIcons.ellipsisVertical),
        child: const SizedBox.shrink(),
      ),
      popover: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _MenuTile(
            icon: LucideIcons.download,
            label: Intls.to.downloadPDF,
            onTap: () => Navigator.pop(context),
          ),
          _MenuTile(
            icon: LucideIcons.printer,
            label: Intls.to.print,
            onTap: () => Navigator.pop(context),
          ),
          _MenuTile(
            icon: LucideIcons.copy,
            label: Intls.to.clone,
            onTap: () => Navigator.pop(context),
          ),
          if (ctrl.canCancel(po.status))
            _MenuTile(
              icon: LucideIcons.ban,
              label: Intls.to.cancelOrder,
              isDestructive: true,
              onTap: () {
                Navigator.pop(context);
                _confirmCancel(context, ctrl);
              },
            ),
        ],
      ),
    );
  }
}

class _MenuTile extends StatelessWidget {
  const _MenuTile({
    required this.icon,
    required this.label,
    required this.onTap,
    this.isDestructive = false,
  });

  final IconData icon;
  final String label;
  final VoidCallback onTap;
  final bool isDestructive;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;
    final color = isDestructive ? cs.destructive : cs.foreground;

    return ShadButton.link(
      child: Text(label),
      leading: Icon(icon, size: 15, color: color),
      onPressed: onTap,
    );
  }
}

class _AmountHeroRow extends StatelessWidget {
  const _AmountHeroRow({
    required this.po,
    required this.theme,
    required this.cs,
  });

  final PurchaseOrder po;
  final ShadThemeData theme;
  final ShadColorScheme cs;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Formatters.formatCurrency(po.totalAmount),
              style: theme.textTheme.h2.copyWith(
                fontSize: 26,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.6,
              ),
            ),
            const SizedBox(height: 2),
            Text(
              Intls.to.totalAmountIncludingTax,
              style: theme.textTheme.muted.copyWith(fontSize: 12),
            ),
          ],
        ),
        const SizedBox(width: 24),
        _DateLabel(
          label: Intls.to.order,
          value: Formatters.fmtDate(po.orderDate.toDateTime()),
        ),
        const SizedBox(width: 16),
        _DateLabel(
          label: Intls.to.expectedDelivery,
          value: po.hasExpectedDeliveryDate()
              ? Formatters.fmtDate(po.expectedDeliveryDate.toDateTime())
              : '—',
        ),
        const Spacer(),
        PoStatusPill(status: po.status, large: true),
      ],
    );
  }
}

class _DateLabel extends StatelessWidget {
  const _DateLabel({required this.label, required this.value});

  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: theme.textTheme.muted.copyWith(fontSize: 11)),
        const SizedBox(height: 2),
        Text(
          value,
          style: theme.textTheme.p.copyWith(
            fontWeight: FontWeight.w500,
            fontSize: 12.5,
          ),
        ),
      ],
    );
  }
}

class _DetailTabBar extends StatelessWidget {
  const _DetailTabBar({
    required this.tabController,
    required this.billCount,
    required this.receiveCount,
  });

  final TabController tabController;
  final int billCount;
  final int receiveCount;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return TabBar(
      controller: tabController,
      labelPadding: const EdgeInsets.symmetric(horizontal: 16),
      indicatorSize: TabBarIndicatorSize.label,
      labelColor: cs.foreground,
      unselectedLabelColor: cs.mutedForeground,
      labelStyle: theme.textTheme.p.copyWith(
        fontWeight: FontWeight.w600,
        fontSize: 13,
      ),
      unselectedLabelStyle: theme.textTheme.p.copyWith(fontSize: 13),
      indicatorColor: cs.foreground,
      dividerColor: cs.border,
      tabs: [
        Tab(text: Intls.to.details),
        Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Intls.to.receive),
              if (receiveCount > 0) ...[
                const SizedBox(width: 6),
                _TabBadge(count: receiveCount),
              ],
            ],
          ),
        ),
        Tab(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(Intls.to.bills),
              if (billCount > 0) ...[
                const SizedBox(width: 6),
                _TabBadge(count: billCount),
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _TabBadge extends StatelessWidget {
  const _TabBadge({required this.count});
  final int count;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 1),
      decoration: BoxDecoration(
        color: SabitouColors.accentSoft,
        border: Border.all(color: SabitouColors.accent.withValues(alpha: 0.4)),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: Text(
        '$count',
        style: const TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w600,
          color: SabitouColors.accentForeground,
        ),
      ),
    );
  }
}

class _DetailsTab extends StatelessWidget {
  const _DetailsTab({
    required this.po,
    required this.receivingNotes,
    required this.bills,
    required this.payments,
  });

  final PurchaseOrder po;
  final List<ReceivingNote> receivingNotes;
  final List<Bill> bills;
  final List<Payment> payments;

  @override
  Widget build(BuildContext context) {
    final receiveProg = PoStatusUtils.receiveProgress(po);
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomGrid(
            minItemWidth: 200,
            mainAxisExtent: 100,
            mainAxisSpacing: 16,
            crossSpacing: 16,
            children: [
              _MetaTile(
                label: Intls.to.supplier,
                value: po.hasSupplierName() ? po.supplierName : po.supplierId,
              ),
              _MetaTile(
                label: Intls.to.deliveryTo,
                value: po.destinationAddress.isNotEmpty
                    ? po.destinationAddress
                    : po.storeName,
              ),
              _MetaTile(
                label: Intls.to.subtotalHT,
                value: Formatters.formatCurrency(po.subTotal),
              ),
              _MetaTile(
                label: Intls.to.tva,
                value: Formatters.formatCurrency(po.taxTotal),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Items card
          _SectionLabel(label: Intls.to.orderedItems),
          const SizedBox(height: 8),
          _ItemsCard(po: po),
          const SizedBox(height: 16),

          Row(
            children: [
              _ProgressTile(
                icon: LucideIcons.package,
                iconBg: SabitouColors.infoSoft,
                iconColor: SabitouColors.infoText,
                label: Intls.to.receivals,
                value: '${receivingNotes.length}',
              ),
              const SizedBox(width: 10),
              _ProgressTile(
                icon: LucideIcons.fileText,
                iconBg: SabitouColors.successSoft,
                iconColor: SabitouColors.successForeground,
                label: Intls.to.bills,
                value: '${bills.length}',
              ),
              const SizedBox(width: 10),
              _ProgressTile(
                icon: LucideIcons.percent,
                iconBg: SabitouColors.accentSoft,
                iconColor: SabitouColors.accentForeground,
                label: Intls.to.receip,
                value: '${(receiveProg * 100).round()}%',
              ),
            ],
          ),
          if (po.notes.isNotEmpty) ...[
            const SizedBox(height: 16),
            ShadCard(
              padding: const EdgeInsets.all(14),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    LucideIcons.messageSquare,
                    size: 14,
                    color: cs.mutedForeground,
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Text(
                      po.notes,
                      style: theme.textTheme.muted.copyWith(fontSize: 13),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ],
      ),
    );
  }
}

class _ItemsCard extends StatelessWidget {
  const _ItemsCard({required this.po});

  final PurchaseOrder po;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: cs.secondary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    Intls.to.productHeader,
                    style: theme.textTheme.muted.copyWith(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                Text(
                  Intls.to.amountHeader,
                  style: theme.textTheme.muted.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          ...po.items.map((item) => _ItemRow(item: item)),
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
            decoration: BoxDecoration(
              color: const Color(0xFFFAFAF9),
              border: Border(top: BorderSide(color: cs.border)),
            ),
            child: Column(
              children: [
                _TotalRow(
                  label: Intls.to.subtotalHT,
                  amount: po.subTotal,
                  muted: true,
                ),
                const SizedBox(height: 4),
                _TotalRow(
                  label: Intls.to.tva,
                  amount: po.taxTotal,
                  muted: true,
                ),
                const SizedBox(height: 6),
                Divider(color: cs.border, height: 1),
                const SizedBox(height: 6),
                _TotalRow(
                  label: Intls.to.totalTTC,
                  amount: po.totalAmount,
                  bold: true,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ItemRow extends StatelessWidget {
  const _ItemRow({required this.item});

  final PurchaseOrderLineItems item;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final name = item.productName.fr.isNotEmpty
        ? item.productName.fr
        : item.productName.en.isNotEmpty
        ? item.productName.en
        : item.productId;
    final receivePct = item.quantityOrdered > 0
        ? item.quantityReceived / item.quantityOrdered
        : 0.0;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: cs.border.withValues(alpha: .5)),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Expanded(
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(2),
                        ),
                        child: LinearProgressIndicator(
                          value: receivePct.toDouble().clamp(0.0, 1.0),
                          minHeight: 3,
                          backgroundColor: cs.border,
                          color: SabitouColors.infoText,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      '${item.quantityReceived}/${item.quantityOrdered}',
                      style: theme.textTheme.muted.copyWith(fontSize: 11),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                Formatters.formatCurrency(item.total),
                style: theme.textTheme.p.copyWith(
                  fontWeight: FontWeight.w600,
                  fontSize: 13,
                ),
              ),
              Text(
                '${item.quantityOrdered} × ${Formatters.formatCurrency(item.unitPrice)}',
                style: theme.textTheme.muted.copyWith(fontSize: 11.5),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TotalRow extends StatelessWidget {
  const _TotalRow({
    required this.label,
    required this.amount,
    this.muted = false,
    this.bold = false,
  });

  final String label;
  final double amount;
  final bool muted;
  final bool bold;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        Text(
          label,
          style: theme.textTheme.p.copyWith(
            fontSize: bold ? 14 : 12.5,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w400,
            color: muted
                ? SabitouColors.accentForeground.withValues(alpha: 0.6)
                : null,
          ),
        ),
        const Spacer(),
        Text(
          Formatters.formatCurrency(amount),
          style: theme.textTheme.p.copyWith(
            fontSize: bold ? 14 : 12.5,
            fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
          ),
        ),
      ],
    );
  }
}

class _BillsTab extends StatelessWidget {
  const _BillsTab({
    required this.po,
    required this.bills,
    required this.receivingNotes,
  });

  final PurchaseOrder po;
  final List<Bill> bills;
  final List<ReceivingNote> receivingNotes;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PurchaseOrderDetailController>();

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _SectionLabel(label: Intls.to.linkedBills),
              const Spacer(),
              if (ctrl.canGenerateBill(po.status))
                ShadButton(
                  size: ShadButtonSize.sm,
                  onPressed: () => showConvertToBillSheet(
                    context,
                    po: po,
                    receivingNotes: receivingNotes,
                    existingBills: bills,
                  ),
                  leading: const Icon(LucideIcons.plus, size: 14),
                  child: Text(Intls.to.add),
                ),
            ],
          ),
          const SizedBox(height: 10),
          if (bills.isEmpty)
            _EmptyTabState(
              icon: LucideIcons.fileText,
              message: Intls.to.noBillForPurchaseOrder,
            )
          else
            Column(
              children: [
                for (int i = 0; i < bills.length; i++) ...[
                  if (i > 0) const SizedBox(height: 8),
                  BillCard(
                    bill: bills[i],
                    isSelected: false,
                    onTap: () => AppRouter.push(
                      context,
                      PagesRoutes.billDetail.create(
                        BillDetailParameters(billId: bills[i].refId),
                      ),
                    ),
                    onDelete: () => ctrl.deleteBill(bills[i].refId),
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

class _ReceivesTab extends StatelessWidget {
  const _ReceivesTab({required this.po, required this.receivingNotes});

  final PurchaseOrder po;
  final List<ReceivingNote> receivingNotes;

  @override
  Widget build(BuildContext context) {
    final ctrl = context.read<PurchaseOrderDetailController>();
    final userId = context.select<UserPreferences, String?>((e) => e.userId);

    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _SectionLabel(label: Intls.to.receivingNotes),
              const Spacer(),
              if (ctrl.canReceive(po.status) &&
                  userId != null &&
                  PoStatusUtils.receiveProgress(po) < 1.0)
                ShadButton(
                  size: ShadButtonSize.sm,
                  onPressed: () => showReceiveForm(
                    context,
                    po: po,
                    storeId: ctrl.storeId,
                    userId: userId,
                  ),
                  leading: const Icon(LucideIcons.plus, size: 14),
                  child: Text(Intls.to.receive),
                ),
            ],
          ),
          const SizedBox(height: 10),
          if (receivingNotes.isEmpty)
            _EmptyTabState(
              icon: LucideIcons.package,
              message: Intls.to.noReceivingRecorded,
            )
          else
            Column(
              children: [
                for (int i = 0; i < receivingNotes.length; i++) ...[
                  if (i > 0) const SizedBox(height: 8),
                  _ReceiveNoteCard(note: receivingNotes[i]),
                ],
              ],
            ),
        ],
      ),
    );
  }
}

class _ReceiveNoteCard extends StatelessWidget {
  const _ReceiveNoteCard({required this.note});

  final ReceivingNote note;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final totalReceived = note.items.fold<double>(
      0,
      (s, i) => s + i.quantityReceived,
    );
    final totalRejected = note.items.fold<double>(
      0,
      (s, i) => s + i.quantityRejected,
    );

    return GestureDetector(
      onTap: () => AppRouter.push(
        context,
        PagesRoutes.receivingNoteDetail.create(
          ReceivingNoteDetailParameters(receivingNoteId: note.refId),
        ),
      ),
      child: ShadCard(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: SabitouColors.infoSoft,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: const Icon(
                    LucideIcons.packageCheck,
                    size: 17,
                    color: SabitouColors.infoText,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        note.refId,
                        style: theme.textTheme.p.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                        ),
                      ),
                      Text(
                        Formatters.fmtDate(note.receivedAt.toDateTime()),
                        style: theme.textTheme.muted.copyWith(fontSize: 12),
                      ),
                    ],
                  ),
                ),
                if (totalRejected > 0)
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 3,
                    ),
                    decoration: const BoxDecoration(
                      color: SabitouColors.dangerSoft,
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    child: Text(
                      Intls.to.differences,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: SabitouColors.dangerForeground,
                      ),
                    ),
                  ),
              ],
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 6,
              children: [
                _InfoChip(
                  icon: LucideIcons.packageCheck,
                  label: '${totalReceived.toInt()} reçus',
                ),
                if (totalRejected > 0)
                  _InfoChip(
                    icon: LucideIcons.packageX,
                    label: '${totalRejected.toInt()} rejetés',
                    bgColor: SabitouColors.dangerSoft,
                    iconColor: SabitouColors.dangerForeground,
                  ),
                if (note.notes.isNotEmpty)
                  _InfoChip(
                    icon: LucideIcons.messageSquare,
                    label: note.notes,
                    maxWidth: 180,
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  const _InfoChip({
    required this.icon,
    required this.label,
    this.bgColor,
    this.iconColor,
    this.maxWidth,
  });

  final IconData icon;
  final String label;
  final Color? bgColor;
  final Color? iconColor;
  final double? maxWidth;

  @override
  Widget build(BuildContext context) {
    final cs = ShadTheme.of(context).colorScheme;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth ?? double.infinity),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 4),
        decoration: BoxDecoration(
          color: bgColor ?? cs.background,
          border: Border.fromBorderSide(BorderSide(color: cs.border)),
          borderRadius: const BorderRadius.all(Radius.circular(20)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 12, color: iconColor ?? cs.mutedForeground),
            const SizedBox(width: 5),
            Flexible(
              child: Text(
                label,
                style: ShadTheme.of(
                  context,
                ).textTheme.muted.copyWith(fontSize: 11.5),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _SectionLabel extends StatelessWidget {
  const _SectionLabel({required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: ShadTheme.of(context).textTheme.muted.copyWith(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        letterSpacing: .5,
      ),
    );
  }
}

class _MetaTile extends StatelessWidget {
  const _MetaTile({required this.label, required this.value});
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return ShadCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: theme.textTheme.muted.copyWith(
              fontSize: 11,
              letterSpacing: .4,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _ProgressTile extends StatelessWidget {
  const _ProgressTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.label,
    required this.value,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Expanded(
      child: ShadCard(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
        child: Row(
          children: [
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: iconBg,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
              ),
              child: Icon(icon, size: 15, color: iconColor),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label,
                  style: theme.textTheme.muted.copyWith(fontSize: 11),
                ),
                Text(
                  value,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w700,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _EmptyTabState extends StatelessWidget {
  const _EmptyTabState({required this.icon, required this.message});
  final IconData icon;
  final String message;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 32),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 36, color: theme.colorScheme.mutedForeground),
            const SizedBox(height: 12),
            Text(
              message,
              style: theme.textTheme.muted.copyWith(fontSize: 13),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
