import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/app_constants.dart';
import '../../../utils/formatters.dart';
import '../../screens/bills/components/bill_status.dart';

/// A single bill card for use in the bills list.
class BillCard extends StatelessWidget {
  BillCard({
    super.key,
    required this.bill,
    required this.isSelected,
    required this.onTap,
    this.onDelete,
  });

  final Bill bill;
  final bool isSelected;
  final VoidCallback onTap;
  final VoidCallback? onDelete;
  final popoverController = ShadPopoverController();

  String _supplierLabel(Bill bill) {
    // Will be enriched with supplier name lookup later
    return bill.supplierId.isNotEmpty ? bill.supplierId : Intls.to.supplier;
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final status = BillStatusUtils.effectiveStatus(bill);

    final orderDate = bill.billDate.toDateTime().toLocal();
    final dateStr =
        '${orderDate.day.toString().padLeft(2, '0')} '
        '${months[orderDate.month].substring(0, 2)} '
        '${orderDate.year}';

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        decoration: BoxDecoration(
          color: isSelected ? SabitouColors.accentSoft : cs.card,
          border: Border.all(
            color: isSelected ? SabitouColors.accent : cs.border,
            width: isSelected ? 1.5 : 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    _supplierLabel(bill),
                    style: theme.textTheme.p.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 13.5,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  Formatters.formatCurrency(bill.totalAmount),
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
                ShadPopover(
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
                        icon: LucideIcons.trash2400,
                        label: Intls.to.delete,
                        onTap: () {
                          popoverController.toggle();
                          onDelete?.call();
                        },
                        isDestructive: true,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            Wrap(
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  dateStr,
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                ),
                Container(
                  width: 3,
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: cs.mutedForeground.withValues(alpha:.5),
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  bill.refId,
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                ),
                if (bill.relatedPurchaseOrderId.isNotEmpty) ...[
                  Container(
                    width: 3,
                    height: 3,
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: cs.mutedForeground.withValues(alpha: 0.5),
                      shape: BoxShape.circle,
                    ),
                  ),
                  Text(
                    bill.relatedPurchaseOrderId,
                    style: theme.textTheme.muted.copyWith(fontSize: 12),
                  ),
                ],
              ],
            ),
            const SizedBox(height: 10),

            // Bottom: balance due + status pill
            Row(
              children: [
                Expanded(
                  child: status == BillStatus.BILL_STATUS_PAID
                      ? Text(
                          Intls.to.paid,
                          style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                        )
                      : status == BillStatus.BILL_STATUS_VOID
                      ? Text(
                          Intls.to.cancel,
                          style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                        )
                      : RichText(
                          text: TextSpan(
                            style: theme.textTheme.muted.copyWith(
                              fontSize: 11.5,
                            ),
                            children: [
                              TextSpan(text: '${Intls.to.due}: '),
                              TextSpan(
                                text: Formatters.formatCurrency(
                                  bill.balanceDue,
                                ),
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: SabitouColors.danger,
                                ),
                              ),
                            ],
                          ),
                        ),
                ),

                BillStatusPill(status: status),
              ],
            ),
          ],
        ),
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
