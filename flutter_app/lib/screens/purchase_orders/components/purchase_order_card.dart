import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import 'po_utils.dart';

/// Single purchase order card — used in both desktop
///  list panel and mobile list.
class PurchaseOrderCard extends StatelessWidget {
  /// A single purchase order card
  const PurchaseOrderCard({
    super.key,
    required this.po,
    required this.isSelected,
    required this.onTap,
    required this.bills,
    required this.receivingNotes,
  });

  /// The purchase order.
  final PurchaseOrder po;

  /// Whether the card is selected or not.
  final bool isSelected;

  /// The callback function to execute when the card is tapped.
  final VoidCallback onTap;

  /// The list of bills related to the purchase order.
  final List<Bill> bills;

  /// The list of receiving notes related to the purchase order.
  final List<ReceivingNote> receivingNotes;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final receiveProg = PoStatusUtils.receiveProgress(po);
    final billProg = PoStatusUtils.billProgress(po, bills);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 140),
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          color: isSelected ? SabitouColors.accentSoft : cs.card,
          border: Border.all(
            color: isSelected ? SabitouColors.accent : cs.border,
            width: isSelected ? 1.5 : 1,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    po.supplierName.isNotEmpty
                        ? po.supplierName
                        : po.supplierId,
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
                  Formatters.formatCurrency(po.totalAmount),
                  style: theme.textTheme.p.copyWith(
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 6),

            Row(
              children: [
                Text(
                  Formatters.fmtDate(po.orderDate.toDateTime()),
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                ),
                Container(
                  width: 3,
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 6),
                  decoration: BoxDecoration(
                    color: cs.mutedForeground.withValues(alpha: .4),
                    shape: BoxShape.circle,
                  ),
                ),
                Text(
                  po.refId,
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                ),
              ],
            ),
            const SizedBox(height: 10),

            Row(
              children: [
                PoProgressIndicator(
                  label: Intls.to.received,
                  progress: receiveProg,
                  activeColor: SabitouColors.infoText,
                ),
                const SizedBox(width: 10),
                PoProgressIndicator(
                  label: Intls.to.invoice,
                  progress: billProg,
                  activeColor: SabitouColors.success,
                ),
                const Spacer(),
                PoStatusPill(status: po.status),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
