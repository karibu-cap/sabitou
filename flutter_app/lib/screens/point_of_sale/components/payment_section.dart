import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/extensions/invoice.dart';
import '../../../utils/formatters.dart';
import '../../../widgets/loading.dart';
import '../utils/cart_provider.dart';
import '../utils/payment_controller.dart';
import 'pos_confirmation_dialog.dart';

/// Payment panel — manages method selection, amounts, and order completion.
///
/// Creates its own [PaymentStateManager] via [ChangeNotifierProvider].
/// Can be embedded directly (desktop right panel) or inside [CartFooter]
/// (mobile).
class PaymentSection extends StatelessWidget {
  /// Creates a [PaymentSection].
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentStateManager(),
      child: const _PaymentContent(),
    );
  }
}

/// Text formatter that converts all input characters to uppercase.
class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class _Banner extends StatelessWidget {
  final IconData icon;

  final String label;
  final double? amount;
  final Color bgColor;
  final Color textColor;
  const _Banner({
    required this.icon,
    required this.label,
    required this.amount,
    required this.bgColor,
    required this.textColor,
  });

  @override
  Widget build(BuildContext context) {
    final amount = this.amount;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Row(
        children: [
          Icon(icon, size: 15, color: textColor),
          const SizedBox(width: 8),
          Expanded(
            child: Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                color: textColor,
              ),
            ),
          ),
          if (amount != null)
            Text(
              Formatters.formatCurrency(amount),
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
        ],
      ),
    );
  }
}

/// Input for specifying how much change has been given back to the customer.
///
/// Only visible when [PaymentStateManager.amountToBePaidBack] > 0.
class _ChangeInputField extends StatelessWidget {
  final PaymentStateManager state;

  const _ChangeInputField({required this.state});

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      label: Text(Intls.to.amountChangeGiven),
      placeholder: Text(
        '${Intls.to.max}: ${Formatters.formatCurrency(state.amountToBePaidBack)}',
      ),
      controller: state.changeController,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      leading: const Icon(LucideIcons.coins, size: 15),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      description: state.changeValidationError != null
          ? Text(
              state.changeValidationError ?? '',
              style: TextStyle(
                fontSize: 11,
                color: state.changeAmountExceedsMaximum
                    ? SabitouColors.danger
                    : ShadTheme.of(context).colorScheme.mutedForeground,
              ),
            )
          : null,
      onEditingComplete: () =>
          state.onChangeAmountChanged(state.changeController.text),
    );
  }
}

/// Full-width button that opens [PosConfirmationDialog] before finalising.
///
/// The button is enabled only when [PaymentStateManager.canComplete] is true.
class _CompleteOrderButton extends StatelessWidget {
  final PaymentStateManager state;

  const _CompleteOrderButton({required this.state});

  bool get _canComplete =>
      CartProvider.instance.getCartItems().isNotEmpty &&
      state.cart.payments.isNotEmpty &&
      state.remainingAmount <= 0 &&
      state.changeGiven <= state.amountToBePaidBack;

  Future<void> _openConfirmation(BuildContext context) async {
    final receipt = CartProvider.instance.currentCashReceipt;
    if (receipt == null) return;

    final confirmed = await showShadDialog<bool>(
      context: context,
      builder: (ctx) => ShadDialog.alert(
        child: PosConfirmationDialog(
          cashReceipt: receipt,
          payments: state.cart.payments,
          changeGiven: state.changeGiven,
          amountToBePaidBack: state.amountToBePaidBack,
          onConfirm: () {
            Navigator.of(ctx).pop(true);
          },
          onCancel: () {
            Navigator.of(ctx).pop(false);
          },
        ),
      ),
    );

    if (confirmed == true && context.mounted) {
      await state.completePayment(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final receipt = CartProvider.instance.currentCashReceipt;
    final total = receipt?.totalAmount ?? 0.0;

    return SizedBox(
      width: double.infinity,
      child: ShadButton(
        enabled: _canComplete,
        onPressed: _canComplete ? () => _openConfirmation(context) : null,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(LucideIcons.circleCheck400, size: 16),
            const SizedBox(width: 8),
            Text(
              '${Intls.to.completeOrder} · ${Formatters.formatCurrency(total)}',
              style: theme.textTheme.small.copyWith(
                fontWeight: FontWeight.w600,
                color: theme.colorScheme.primaryForeground,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Individual tappable method chip.
class _MethodChip extends StatelessWidget {
  final _MethodMeta meta;

  final bool isSelected;
  final VoidCallback onTap;
  const _MethodChip({
    required this.meta,
    required this.isSelected,
    required this.onTap,
  });

  String _resolveLabel(BuildContext context) {
    switch (meta.labelKey) {
      case 'cash':
        return Intls.to.cash;
      case 'mobileMoney':
        return Intls.to.mobileMoney;
      case 'card':
        return Intls.to.card;
      case 'voucher':
        return Intls.to.voucher;
      default:
        return meta.method.label;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    final bg = isSelected
        ? theme.colorScheme.primary.withValues(alpha: 0.08)
        : theme.colorScheme.secondary;
    final borderColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.border;
    final iconColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.mutedForeground;
    final labelColor = isSelected
        ? theme.colorScheme.primary
        : theme.colorScheme.foreground;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
          color: bg,
          borderRadius: const BorderRadius.all(Radius.circular(8)),
          border: Border.all(color: borderColor),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(meta.icon, size: 14, color: iconColor),
            const SizedBox(width: 6),
            Text(
              _resolveLabel(context),
              style: theme.textTheme.small.copyWith(
                color: labelColor,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Metadata for a single payment method chip.
class _MethodMeta {
  final PaymentMethod method;

  final IconData icon;
  // Key used to resolve the human-readable label from Intls
  final String labelKey;
  const _MethodMeta({
    required this.method,
    required this.icon,
    required this.labelKey,
  });
}

/// Row of tappable payment-method chips.
///
/// Each chip shows an icon + short label. The selected chip renders with a
/// primary border and background highlight.
class _MethodSelector extends StatelessWidget {
  /// All supported payment methods with their display data.
  static const _methods = [
    _MethodMeta(
      method: PaymentMethod.PAYMENT_METHOD_CASH,
      icon: LucideIcons.banknote,
      labelKey: 'cash',
    ),
    _MethodMeta(
      method: PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY,
      icon: LucideIcons.smartphone,
      labelKey: 'mobileMoney',
    ),
    _MethodMeta(
      method: PaymentMethod.PAYMENT_METHOD_CREDIT_CARD,
      icon: LucideIcons.creditCard,
      labelKey: 'card',
    ),
    _MethodMeta(
      method: PaymentMethod.PAYMENT_METHOD_VOUCHER,
      icon: LucideIcons.ticket,
      labelKey: 'voucher',
    ),
  ];

  final PaymentStateManager state;
  const _MethodSelector({required this.state});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: _methods
          .map(
            (m) => _MethodChip(
              meta: m,
              isSelected: state.selectedPaymentMethod == m.method,
              onTap: () => state.onMethodChanged(m.method),
            ),
          )
          .toList(),
    );
  }
}

class _PaymentContent extends StatelessWidget {
  const _PaymentContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentStateManager>(
      builder: (context, state, _) {
        return ShadCard(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _SectionTitle(),
              const SizedBox(height: 14),

              _MethodSelector(state: state),
              const SizedBox(height: 14),

              _PaymentForm(state: state),
              const SizedBox(height: 10),

              if (state.cart.payments.isNotEmpty) ...[
                _PaymentsList(state: state),
                const SizedBox(height: 10),
              ],

              _PaymentStatusBanner(state: state),

              if (state.amountToBePaidBack > 0) ...[
                const SizedBox(height: 10),
                _ChangeInputField(state: state),
              ],

              const SizedBox(height: 16),
              const Divider(height: 1),
              const SizedBox(height: 14),

              _CompleteOrderButton(state: state),
            ],
          ),
        );
      },
    );
  }
}

class _PaymentForm extends StatelessWidget {
  final PaymentStateManager state;

  const _PaymentForm({required this.state});

  /// Whether the selected method requires a reference number.
  bool get _needsReference =>
      state.selectedPaymentMethod == PaymentMethod.PAYMENT_METHOD_CREDIT_CARD ||
      state.selectedPaymentMethod ==
          PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY ||
      state.selectedPaymentMethod == PaymentMethod.PAYMENT_METHOD_VOUCHER;

  @override
  Widget build(BuildContext context) {
    if (state.cart.getCartItems().isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Mobile money sub-label
        if (state.selectedPaymentMethod ==
            PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: Text(
              Intls.to.mobileMoneySubLabel,
              style: ShadTheme.of(context).textTheme.muted,
            ),
          ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Amount field
            Expanded(
              child: ShadInputFormField(
                id: 'payment_amount',
                controller: state.amountController,
                placeholder: Text(
                  '${Intls.to.amount} (${Formatters.formatCurrency(state.remainingAmount > 0 ? state.remainingAmount : (state.cart.currentCashReceipt?.totalAmount ?? 0))})',
                ),
                leading: const Icon(LucideIcons.banknote, size: 15),
                keyboardType: const TextInputType.numberWithOptions(
                  decimal: true,
                ),
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                onEditingComplete: state.isProcessing
                    ? null
                    : () => unawaited(state.addPayment(context)),
              ),
            ),
            const SizedBox(width: 8),
            // Add payment button
            ShadButton(
              enabled: !state.isProcessing,
              onPressed: () => unawaited(state.addPayment(context)),
              child: state.isProcessing
                  ? const Loading.button()
                  : const Icon(LucideIcons.plus, size: 16),
            ),
          ],
        ),

        // Reference field (mobile money / card / voucher)
        if (_needsReference) ...[
          const SizedBox(height: 8),
          ShadInputFormField(
            id: 'reference_id',
            controller: state.referenceController,
            placeholder: Text(_referencePlaceholder(context)),
            leading: const Icon(LucideIcons.hash, size: 15),
            inputFormatters: [
              if (state.selectedPaymentMethod ==
                  PaymentMethod.PAYMENT_METHOD_VOUCHER)
                UpperCaseTextFormatter(),
            ],
            onEditingComplete: state.isProcessing
                ? null
                : () => unawaited(state.addPayment(context)),
          ),
        ],
      ],
    );
  }

  String _referencePlaceholder(BuildContext context) {
    switch (state.selectedPaymentMethod) {
      case PaymentMethod.PAYMENT_METHOD_VOUCHER:
        return Intls.to.enterVoucherCode;
      case PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY:
        return Intls.to.enterReference;
      default:
        return Intls.to.enterReference;
    }
  }
}

/// Shows the payments already added to the current receipt.
class _PaymentsList extends StatelessWidget {
  final PaymentStateManager state;

  const _PaymentsList({required this.state});

  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);
    final payments = state.cart.payments;

    return Container(
      decoration: BoxDecoration(
        color: theme.colorScheme.secondary,
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        border: Border.all(color: theme.colorScheme.border),
      ),
      child: Column(
        children: List.generate(payments.length, (index) {
          final p = payments[index];
          final isLast = index == payments.length - 1;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 8,
                ),
                child: Row(
                  children: [
                    Icon(
                      p.paymentMethod.icon,
                      size: 14,
                      color: theme.colorScheme.mutedForeground,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            p.paymentMethod.label,
                            style: theme.textTheme.small.copyWith(
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          if (p.hasReferenceNumber())
                            Text(
                              p.referenceNumber,
                              style: theme.textTheme.muted,
                            ),
                        ],
                      ),
                    ),
                    Text(
                      Formatters.formatCurrency(p.amount.toDouble()),
                      style: theme.textTheme.small.copyWith(
                        fontWeight: FontWeight.w600,
                        color: SabitouColors.success,
                      ),
                    ),
                    const SizedBox(width: 6),
                    GestureDetector(
                      onTap: () => state.removePayment(index),
                      child: Icon(
                        LucideIcons.x,
                        size: 14,
                        color: theme.colorScheme.destructive,
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

/// Displays a colored banner indicating the payment status.
class _PaymentStatusBanner extends StatelessWidget {
  final PaymentStateManager state;

  const _PaymentStatusBanner({required this.state});

  @override
  Widget build(BuildContext context) {
    if (state.cart.getCartItems().isEmpty) return const SizedBox.shrink();
    if (state.amountReceived <= 0) return const SizedBox.shrink();

    // Fully paid — no remaining, no overpayment
    final isPaid = state.remainingAmount <= 0 && state.amountToBePaidBack <= 0;
    // Overpaid
    final hasChange = state.amountToBePaidBack > 0;

    if (isPaid && !hasChange) {
      return _Banner(
        icon: LucideIcons.circleCheck,
        label: Intls.to.paymentComplete,
        amount: null,
        bgColor: SabitouColors.successSoft,
        textColor: SabitouColors.successForeground,
      );
    }

    if (state.remainingAmount > 0) {
      return _Banner(
        icon: LucideIcons.circleAlert400,
        label: Intls.to.remaining,
        amount: state.remainingAmount,
        bgColor: SabitouColors.warningSoft,
        textColor: SabitouColors.warningForeground,
      );
    }

    if (hasChange) {
      return _Banner(
        icon: LucideIcons.arrowLeftRight,
        label: Intls.to.changeToGive,
        amount: state.amountToBePaidBack,
        bgColor: SabitouColors.infoSoft,
        textColor: SabitouColors.infoText,
      );
    }

    return const SizedBox.shrink();
  }
}

class _SectionTitle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final theme = ShadTheme.of(context);

    return Row(
      children: [
        const Icon(LucideIcons.creditCard, size: 16),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            Intls.to.payment,
            style: theme.textTheme.small.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
      ],
    );
  }
}
