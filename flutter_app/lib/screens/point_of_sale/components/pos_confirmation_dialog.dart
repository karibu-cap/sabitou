import 'package:flutter/material.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/extensions/global_product_extension.dart';
import '../../../utils/extensions/invoice.dart';
import '../../../utils/formatters.dart';

/// Native confirmation dialog shown after the cashier clicks "Complete Order".
/// Two actions:
/// - **← Modifier** — dismisses the dialog so the cashier can adjust.
/// - **Confirmer & Encaisser** — calls [onConfirm] to process the payment.
class PosConfirmationDialog extends StatelessWidget {
  /// Creates a [PosConfirmationDialog].
  const PosConfirmationDialog({
    super.key,
    required this.cashReceipt,
    required this.payments,
    required this.changeGiven,
    required this.amountToBePaidBack,
    required this.onConfirm,
    required this.onCancel,
  });

  /// The current cash receipt to confirm.
  final CashReceipt cashReceipt;

  /// Payment entries collected by the cashier.
  final List<Payment> payments;

  /// Amount of change that has been (or will be) handed back.
  final double changeGiven;

  /// Total overpayment amount owed to the customer.
  final double amountToBePaidBack;

  /// Called when the cashier confirms and wants to complete the sale.
  final VoidCallback onConfirm;

  /// Called when the cashier wants to go back and modify the order.
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final screenHeight = MediaQuery.sizeOf(context).height;

    return ConstrainedBox(
      constraints: BoxConstraints(maxHeight: screenHeight * 0.85),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _DialogHeader(receiptId: cashReceipt.refId),
          const SizedBox(height: 16),

          Flexible(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _ArticleList(items: cashReceipt.items),
                  const SizedBox(height: 12),

                  _OrderTotals(cashReceipt: cashReceipt),
                  const SizedBox(height: 12),

                  _PaymentsBreakdown(payments: payments),
                  const SizedBox(height: 12),

                  if (amountToBePaidBack > 0)
                    _ChangeBanner(
                      amountToBePaidBack: amountToBePaidBack,
                      changeGiven: changeGiven,
                    ),

                  const SizedBox(height: 12),

                  _WarningBox(),
                ],
              ),
            ),
          ),

          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 12),

          Row(
            children: [
              ShadButton.outline(
                onPressed: onCancel,
                child: Row(
                  children: [
                    const Icon(LucideIcons.arrowLeft, size: 14),
                    const SizedBox(width: 6),
                    Text(Intls.to.modify),
                  ],
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: ShadButton(
                  onPressed: onConfirm,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(LucideIcons.circleCheck400, size: 15),
                      const SizedBox(width: 8),
                      Flexible(
                        child: Text(
                          '${Intls.to.confirmAndCollect} · ${Formatters.formatCurrency(cashReceipt.totalAmount)}',
                          style: theme.textTheme.small.copyWith(
                            color: theme.colorScheme.primaryForeground,
                            fontWeight: FontWeight.w600,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _DialogHeader extends StatelessWidget {
  const _DialogHeader({required this.receiptId});

  final String receiptId;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final shortRef = receiptId.length >= 6
        ? receiptId.substring(receiptId.length - 6).toUpperCase()
        : receiptId.toUpperCase();

    return Row(
      children: [
        Container(
          width: 36,
          height: 36,
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withValues(alpha: 0.1),
            borderRadius: const BorderRadius.all(Radius.circular(8)),
          ),
          child: Icon(
            LucideIcons.receiptText,
            size: 18,
            color: theme.colorScheme.primary,
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                Intls.to.orderConfirmation,
                style: theme.textTheme.p.copyWith(fontWeight: FontWeight.w700),
              ),
              Text('${Intls.to.sale} #$shortRef', style: theme.textTheme.muted),
            ],
          ),
        ),
      ],
    );
  }
}

class _ArticleList extends StatelessWidget {
  const _ArticleList({required this.items});

  final List<InvoiceLineItem> items;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: theme.colorScheme.border),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: List.generate(items.length, (i) {
          final item = items[i];
          final isLast = i == items.length - 1;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 6,
                        vertical: 2,
                      ),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.secondary,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(4),
                        ),
                      ),
                      child: Text(
                        '×${item.quantity}',
                        style: theme.textTheme.small.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            item.label,
                            style: theme.textTheme.small.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      Formatters.formatCurrency(item.total.toDouble()),
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLast) Divider(height: 1, color: theme.colorScheme.border),
            ],
          );
        }),
      ),
    );
  }
}

class _OrderTotals extends StatelessWidget {
  const _OrderTotals({required this.cashReceipt});

  final CashReceipt cashReceipt;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final items = cashReceipt.items;
    final subtotal = items.fold(0.0, (sum, i) => sum + i.subtotal);
    final taxTotal = items.fold(0.0, (sum, i) => sum + i.taxAmount);

    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          _SummaryRow(
            label: Intls.to.subtotal,
            value: Formatters.formatCurrency(subtotal),
          ),
          if (taxTotal > 0)
            _SummaryRow(
              label: '${Intls.to.taxIncluded} (19.25%)',
              value: Formatters.formatCurrency(taxTotal),
            ),
          Divider(height: 12, color: theme.colorScheme.border),
          _SummaryRow(
            label: Intls.to.totalToPay,
            value: Formatters.formatCurrency(cashReceipt.totalAmount),
            isTotal: true,
          ),
        ],
      ),
    );
  }
}

class _PaymentsBreakdown extends StatelessWidget {
  const _PaymentsBreakdown({required this.payments});

  final List<Payment> payments;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Intls.to.paymentMethod,
          style: theme.textTheme.small.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 6),
        ...payments.map(
          (p) => Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: _SummaryRow(
              label:
                  p.paymentMethod.label +
                  (p.hasReferenceNumber() ? ' — ${p.referenceNumber}' : ''),
              value: Formatters.formatCurrency(p.amount.toDouble()),
              valueColor: SabitouColors.success,
            ),
          ),
        ),
      ],
    );
  }
}

class _ChangeBanner extends StatelessWidget {
  const _ChangeBanner({
    required this.amountToBePaidBack,
    required this.changeGiven,
  });

  final double amountToBePaidBack;
  final double changeGiven;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: const BoxDecoration(
        color: SabitouColors.infoSoft,
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        children: [
          _SummaryRow(
            label: Intls.to.changeToGive,
            value: Formatters.formatCurrency(amountToBePaidBack),
            valueColor: SabitouColors.infoText,
            isTotal: true,
          ),
          if (changeGiven > 0)
            _SummaryRow(
              label: Intls.to.changeGiven,
              value: Formatters.formatCurrency(changeGiven),
              valueColor: SabitouColors.success,
            ),
        ],
      ),
    );
  }
}

class _WarningBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: SabitouColors.warningSoft,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: SabitouColors.warning.withValues(alpha: 0.4)),
      ),
      child: Row(
        children: [
          const Icon(
            LucideIcons.triangleAlert400,
            size: 15,
            color: SabitouColors.warningForeground,
          ),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              Intls.to.verifyAmountWithCustomer,
              style: const TextStyle(
                fontSize: 12,
                color: SabitouColors.warningForeground,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SummaryRow extends StatelessWidget {
  const _SummaryRow({
    required this.label,
    required this.value,
    this.isTotal = false,
    this.valueColor,
  });

  final String label;
  final String value;
  final bool isTotal;
  final Color? valueColor;

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final labelStyle = isTotal
        ? theme.textTheme.small.copyWith(fontWeight: FontWeight.w700)
        : theme.textTheme.small;
    final valueStyle = isTotal
        ? theme.textTheme.p.copyWith(
            fontWeight: FontWeight.w700,
            color: valueColor ?? theme.colorScheme.primary,
          )
        : theme.textTheme.small.copyWith(color: valueColor);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Expanded(child: Text(label, style: labelStyle)),
          Text(value, style: valueStyle),
        ],
      ),
    );
  }
}
