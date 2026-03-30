import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/formatters.dart';
import '../../repositories/suppliers_repository.dart';
import '../../screens/bills/components/bill_status.dart';

/// A single bill card for use in the bills list.
class BillCard extends StatelessWidget {
  /// A single bill card for use in the bills list.
  BillCard({
    super.key,
    required this.bill,
    required this.isSelected,
    required this.onTap,
    this.onDelete,
  });

  /// The bill to display.
  final Bill bill;

  /// Whether the card is currently selected.
  final bool isSelected;

  /// Callback when the card is tapped.
  final VoidCallback onTap;

  /// Callback when the delete option is tapped.
  final VoidCallback? onDelete;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;
    final status = BillStatusUtils.effectiveStatus(bill);

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
                  child: FutureBuilder(
                    future: SuppliersRepository.instance.findById(
                      bill.supplierId,
                    ),
                    builder: (context, snapshot) {
                      return Text(
                        snapshot.data?.name ?? bill.supplierId,
                        style: theme.textTheme.p.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 13.5,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      );
                    },
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
              ],
            ),
            const SizedBox(height: 6),

            Wrap(
              spacing: 6,
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Text(
                  Formatters.fmtDate(bill.billDate.toDateTime()),
                  style: theme.textTheme.muted.copyWith(fontSize: 12),
                ),
                Container(
                  width: 3,
                  height: 3,
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  decoration: BoxDecoration(
                    color: cs.mutedForeground.withValues(alpha: .5),
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
                  child: switch (status) {
                    BillStatus.BILL_STATUS_PAID => Text(
                      Intls.to.paid,
                      style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                    ),
                    BillStatus.BILL_STATUS_VOID => Text(
                      Intls.to.cancel,
                      style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                    ),
                    _ => RichText(
                      text: TextSpan(
                        style: theme.textTheme.muted.copyWith(fontSize: 11.5),
                        children: [
                          TextSpan(text: '${Intls.to.due}: '),
                          TextSpan(
                            text: Formatters.formatCurrency(bill.balanceDue),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              color: SabitouColors.danger,
                            ),
                          ),
                        ],
                      ),
                    ),
                  },
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
