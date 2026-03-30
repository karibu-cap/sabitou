import 'package:flutter/material.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../services/internationalization/internationalization.dart';
import '../../themes/app_theme.dart';
import '../../utils/extensions/invoice.dart';
import '../../utils/formatters.dart';

/// A card that displays payment details.
class PaymentCard extends StatelessWidget {
  /// Contructor of new [PaymentCard].
  const PaymentCard({
    super.key,
    required this.payment,
    required this.isSelected,
    this.onTap,
    this.onDelete,
  });

  /// The payment to display.
  final Payment payment;

  /// Indicates whether the card is currently selected.
  final bool isSelected;

  /// Callback to be called when the card is tapped.
  final VoidCallback? onTap;

  /// Callback to be called when the delete icon is tapped.
  final VoidCallback? onDelete;

  void _confirmDelete(BuildContext context) {
    showShadDialog<bool>(
      context: context,
      builder: (context) => ShadDialog.alert(
        title: Text(Intls.to.deleteConfirmation),
        description: Text(Intls.to.deleteConfirmationDescription),
        actions: [
          ShadButton.outline(
            onPressed: () => Navigator.pop(context),
            child: Text(Intls.to.cancel),
          ),
          ShadButton.destructive(
            onPressed: () {
              Navigator.pop(context);
              onDelete?.call();
            },
            child: Text(Intls.to.delete),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final cs = theme.colorScheme;

    final bg = isSelected ? SabitouColors.accentSoft : cs.card;
    final border = isSelected ? SabitouColors.accent : cs.border;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
          border: Border.fromBorderSide(BorderSide(color: border)),
          boxShadow: [
            if (!isSelected)
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 10,
                offset: const Offset(0, 2),
              ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Icon
            Container(
              padding: const EdgeInsets.all(10),
              decoration: const BoxDecoration(
                color: SabitouColors.successSoft,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                LucideIcons.banknote,
                color: SabitouColors.success,
                size: 20,
              ),
            ),
            const SizedBox(width: 14),

            // Details
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        payment.refId,
                        style: theme.textTheme.small.copyWith(
                          fontWeight: FontWeight.w600,
                          color: cs.primary,
                        ),
                      ),
                      Text(
                        Formatters.formatCurrency(payment.amount),
                        style: theme.textTheme.small.copyWith(
                          fontWeight: FontWeight.w700,
                          color: SabitouColors.success,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 6),
                  Row(
                    children: [
                      const Icon(
                        LucideIcons.calendar,
                        size: 12,
                        color: SabitouColors.neutralForeground,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        Formatters.fmtDate(payment.paymentDate.toDateTime()),
                        style: theme.textTheme.small.copyWith(
                          fontSize: 12,
                          color: cs.mutedForeground,
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Icon(
                        LucideIcons.creditCard,
                        size: 12,
                        color: SabitouColors.neutralForeground,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        payment.paymentMethod.label,
                        style: theme.textTheme.small.copyWith(
                          fontSize: 12,
                          color: cs.mutedForeground,
                        ),
                      ),
                    ],
                  ),
                  if (payment.receiverRef.isNotEmpty) ...[
                    const SizedBox(height: 6),
                    Text(
                      '${Intls.to.receiver} : ${payment.receiverRef}',
                      style: theme.textTheme.small.copyWith(fontSize: 12),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),

            // Delete Action
            if (onDelete != null) ...[
              const SizedBox(width: 8),
              ShadIconButton.ghost(
                icon: const Icon(LucideIcons.trash2, size: 16),
                foregroundColor: cs.mutedForeground,
                hoverForegroundColor: SabitouColors.danger,
                onPressed: () => _confirmDelete(context),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
