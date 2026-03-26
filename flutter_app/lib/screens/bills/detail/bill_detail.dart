import 'package:auto_size_text/auto_size_text.dart';
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
import '../../../widgets/custom_grid.dart';
import '../components/bill_status.dart';
import 'bill_detail_controller.dart';

/// Full bill detail — used both as a right-panel (desktop) and
/// as a standalone scaffold content (mobile).
class BillDetail extends StatelessWidget {
  /// Displays a full bill detail.
  const BillDetail({
    super.key,
    required this.bill,
    this.onDeleted,
    this.onMarkedPaid,
  });

  /// The bill to be displayed.
  final Bill bill;

  /// Callback to be called when the bill is deleted.
  final VoidCallback? onDeleted;

  /// Callback to be called when the bill is marked as paid.
  final VoidCallback? onMarkedPaid;

  @override
  Widget build(BuildContext context) {
    final status = BillStatusUtils.effectiveStatus(bill);
    final style = BillStatusUtils.styleFor(status);

    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DetailHeader(
            bill: bill,
            status: status,
            onDeleted: onDeleted,
            onMarkedPaid: onMarkedPaid,
          ),
          const SizedBox(height: 18),

          _AmountHero(bill: bill, status: status, style: style),
          const SizedBox(height: 14),

          _MetaGrid(bill: bill),
          const SizedBox(height: 14),

          if (bill.relatedPurchaseOrderId.isNotEmpty) ...[
            _LinkedPoCard(purchaseOrderId: bill.relatedPurchaseOrderId),
            const SizedBox(height: 14),
          ],

          _LineItemsCard(bill: bill),

          if (bill.notes.isNotEmpty) ...[
            const SizedBox(height: 14),
            _NotesCard(notes: bill.notes),
          ],
        ],
      ),
    );
  }
}

class _DetailHeader extends StatelessWidget {
  const _DetailHeader({
    required this.bill,
    required this.status,
    this.onDeleted,
    this.onMarkedPaid,
  });

  final Bill bill;
  final BillStatus status;
  final VoidCallback? onDeleted;
  final VoidCallback? onMarkedPaid;

  Future<void> _confirmMarkPaid(BuildContext context) async {
    // In a full implementation, this would open a payment dialog
    // to select the payment method and record payment.
    // For now we use a simple confirm dialog.
    final ok = await showShadDialog<bool>(
      context: context,
      builder: (_) => ShadDialog(
        title: Text(Intls.to.confirmPayment),
        description: Text(
          Intls.to.markAsPaid,
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.pop(context, false),
            child: Text(Intls.to.cancel),
          ),
          ShadButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(Intls.to.save),
          ),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      await context.read<BillDetailController>().markBillAsPaid(
        bill: bill,
        paymentId: 'PMT-${DateTime.now().millisecondsSinceEpoch}',
      );
      onMarkedPaid?.call();
    }
  }

  Future<void> _confirmDelete(BuildContext context) async {
    final ok = await showShadDialog<bool>(
      context: context,
      builder: (_) => ShadDialog.alert(
        title: Text(Intls.to.deleteBill),
        description: Text(
          Intls.to.itemWillBeDelete.trParams({'item': bill.refId}),
        ),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.pop(context, false),
            child: Text(Intls.to.cancel),
          ),
          ShadButton.destructive(
            onPressed: () => Navigator.pop(context, true),
            child: Text(Intls.to.delete),
          ),
        ],
      ),
    );
    if (ok == true && context.mounted) {
      await context.read<BillDetailController>().deleteBill(bill.refId);
      onDeleted?.call();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
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
                bill.refId,
                style: theme.textTheme.h3.copyWith(
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.4,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                bill.relatedPurchaseOrderId.isNotEmpty
                    ? '${bill.supplierId} · ${bill.relatedPurchaseOrderId}'
                    : bill.supplierId,
                style: theme.textTheme.muted.copyWith(fontSize: 13),
              ),
            ],
          ),
        ),
        const SizedBox(width: 12),
        Wrap(
          spacing: 8,
          children: [
            if (status != BillStatus.BILL_STATUS_PAID &&
                status != BillStatus.BILL_STATUS_VOID)
              ShadButton.outline(
                size: ShadButtonSize.sm,
                onPressed: () => _confirmDelete(context),
                leading: Icon(
                  LucideIcons.trash2,
                  size: 13,
                  color: cs.destructive,
                ),
                decoration: ShadDecoration(
                  border: ShadBorder.all(
                    color: cs.destructive.withValues(alpha: 0.4),
                  ),
                ),
                child: Text(
                  Intls.to.delete,
                  style: TextStyle(color: cs.destructive, fontSize: 12.5),
                ),
              ),
            if (status == BillStatus.BILL_STATUS_OPEN ||
                status == BillStatus.BILL_STATUS_OVERDUE)
              ShadButton(
                onPressed: () => _confirmMarkPaid(context),
                leading: const Icon(LucideIcons.circleCheck, size: 13),
                child: AutoSizeText(
                  Intls.to.markAsPaid,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontSize: 12.5),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

class _AmountHero extends StatelessWidget {
  const _AmountHero({
    required this.bill,
    required this.status,
    required this.style,
  });

  final Bill bill;
  final BillStatus status;
  final BillStatusStyle style;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final isPending =
        status == BillStatus.BILL_STATUS_OPEN ||
        status == BillStatus.BILL_STATUS_OVERDUE;

    return ShadCard(
      padding: const EdgeInsets.all(18),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${Intls.to.totalAmount} TTC',
                      style: theme.textTheme.muted.copyWith(
                        fontSize: 11,
                        letterSpacing: 0.5,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      Formatters.formatCurrency(bill.totalAmount),
                      style: theme.textTheme.h2.copyWith(
                        fontSize: 28,
                        fontWeight: FontWeight.w700,
                        letterSpacing: -0.7,
                      ),
                    ),
                  ],
                ),
              ),
              BillStatusPill(status: status, large: true),
            ],
          ),

          if (isPending && bill.balanceDue > 0) ...[
            const SizedBox(height: 14),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 9),
              decoration: BoxDecoration(
                color: SabitouColors.dangerSoft,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(
                  color: SabitouColors.danger.withValues(alpha: 0.5),
                ),
              ),
              child: Row(
                children: [
                  const Icon(
                    LucideIcons.circleAlert,
                    size: 14,
                    color: SabitouColors.danger,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    Intls.to.remainAmountDu,
                    style: theme.textTheme.p.copyWith(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                      color: SabitouColors.danger,
                    ),
                  ),
                  const Spacer(),
                  Text(
                    Formatters.formatCurrency(bill.balanceDue),
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: SabitouColors.danger,
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

class _MetaGrid extends StatelessWidget {
  const _MetaGrid({required this.bill});

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    final billDate = bill.billDate.toDateTime().toLocal();
    final dueDate = bill.dueDate.toDateTime().toLocal();
    final isOverdue =
        dueDate.isBefore(DateTime.now()) &&
        bill.status != BillStatus.BILL_STATUS_PAID;

    return CustomGrid(
      minItemWidth: 200,
      mainAxisExtent: 100,
      mainAxisSpacing: 16,
      crossSpacing: 16,
      children: [
        _MetaTile(label: Intls.to.date, value: Formatters.fmtDate(billDate)),
        _MetaTile(
          label: Intls.to.dueDate,
          value: Formatters.fmtDate(dueDate),
          valueColor: isOverdue ? SabitouColors.danger : null,
        ),
        _MetaTile(label: Intls.to.supplier, value: bill.supplierId),
        _MetaTile(
          label: Intls.to.currency,
          value: bill.currency.isNotEmpty ? bill.currency : 'XAF',
        ),
      ],
    );
  }
}

class _MetaTile extends StatelessWidget {
  const _MetaTile({required this.label, required this.value, this.valueColor});

  final String label;
  final String value;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 11),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            label,
            style: theme.textTheme.muted.copyWith(
              fontSize: 11,
              letterSpacing: 0.4,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            value,
            style: theme.textTheme.p.copyWith(
              fontWeight: FontWeight.w500,
              fontSize: 13,
              color: valueColor ?? cs.foreground,
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

class _LinkedPoCard extends StatelessWidget {
  const _LinkedPoCard({required this.purchaseOrderId});

  final String purchaseOrderId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Intls.to.linkPurchaseOrder,
          style: theme.textTheme.muted.copyWith(
            fontSize: 11,
            fontWeight: FontWeight.w600,
            letterSpacing: 0.6,
          ),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () => AppRouter.push(
            context,
            PagesRoutes.purchaseOrderDetail.create(
              PurchaseOrderDetailParameters(purchaseOrderId: purchaseOrderId),
            ),
          ),
          child: ShadCard(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Row(
              children: [
                Container(
                  width: 36,
                  height: 36,
                  decoration: const BoxDecoration(
                    color: SabitouColors.accentSoft,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: const Icon(
                    LucideIcons.clipboardList,
                    size: 17,
                    color: SabitouColors.accentForeground,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    purchaseOrderId,
                    style: theme.textTheme.p.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                  ),
                ),
                Icon(
                  LucideIcons.chevronRight,
                  size: 16,
                  color: cs.mutedForeground,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _LineItemsCard extends StatelessWidget {
  const _LineItemsCard({required this.bill});

  final Bill bill;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: EdgeInsets.zero,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 11),
            decoration: BoxDecoration(
              color: cs.secondary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
              ),
            ),
            child: Row(
              children: [
                Text(
                  Intls.to.items,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                const Spacer(),
                Text(
                  Intls.to.amount,
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                ),
              ],
            ),
          ),

          // Items
          ...bill.items.map((item) => _LineItemRow(item: item)),

          // Totals
          Container(
            padding: const EdgeInsets.fromLTRB(16, 10, 16, 14),
            decoration: BoxDecoration(
              color: SabitouColors.infoSoft,
              border: Border(top: BorderSide(color: cs.border)),
            ),
            child: Column(
              children: [
                _TotalRow(
                  label: '${Intls.to.subtotal} HT',
                  amount: bill.subTotal,
                  muted: true,
                ),
                const SizedBox(height: 4),
                _TotalRow(label: 'TVA', amount: bill.taxTotal, muted: true),
                const SizedBox(height: 6),
                Divider(color: cs.border, height: 1),
                const SizedBox(height: 6),
                _TotalRow(
                  label: 'Total TTC',
                  amount: bill.totalAmount,
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
            color: muted ? SabitouColors.infoText.withValues(alpha: 08) : null,
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

class _LineItemRow extends StatelessWidget {
  const _LineItemRow({required this.item});

  final BillLineItem item;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

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
                  item.description.isNotEmpty
                      ? item.description
                      : item.productId,
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w500,
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${item.quantity} x ${Formatters.formatCurrency(item.unitPrice)}',
                  style: theme.textTheme.muted.copyWith(fontSize: 11.5),
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
              if (item.taxAmount > 0)
                Text(
                  'TVA: ${Formatters.formatCurrency(item.taxAmount)}',
                  style: theme.textTheme.muted.copyWith(fontSize: 11),
                ),
            ],
          ),
        ],
      ),
    );
  }
}

class _NotesCard extends StatelessWidget {
  const _NotesCard({required this.notes});

  final String notes;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    return ShadCard(
      padding: const EdgeInsets.all(14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(LucideIcons.messageSquare, size: 15, color: cs.mutedForeground),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              notes,
              style: theme.textTheme.muted.copyWith(fontSize: 13),
            ),
          ),
        ],
      ),
    );
  }
}
