import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/extensions/invoice.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../widgets/custom_shad_button.dart';
import 'payment_controller.dart';

/// The payment section - Now a StatelessWidget
class PaymentSection extends StatelessWidget {
  const PaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => PaymentStateManager(),
      child: const _PaymentSectionContent(),
    );
  }
}

class _PaymentSectionContent extends StatelessWidget {
  const _PaymentSectionContent();

  @override
  Widget build(BuildContext context) {
    return Consumer<PaymentStateManager>(
      builder: (context, state, _) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 5),
            _PaymentSummary(state: state),
            const SizedBox(height: 5),
            Divider(
              thickness: 1,
              color: ShadTheme.of(context).colorScheme.background,
            ),
            const SizedBox(height: 5),
            _PaymentForm(state: state),
            const SizedBox(height: 8),
            _CompleteButton(state: state),
          ],
        );
      },
    );
  }
}

class _PaymentSummary extends StatelessWidget {
  final PaymentStateManager state;

  const _PaymentSummary({required this.state});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                '${Intls.to.totalPaid}: ',
                style: ShadTheme.of(context).textTheme.list,
              ),
            ),
            Text(
              Formatters.formatCurrency(state.amountReceived),
              style: ShadTheme.of(context).textTheme.list.copyWith(
                color: state.amountReceived > 0
                    ? AppColors.lightGreen
                    : AppColors.grey400,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8),
        if (state.remainingAmount > 0) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  '${Intls.to.remaining}: ',
                  style: ShadTheme.of(context).textTheme.list,
                ),
              ),
              Text(
                Formatters.formatCurrency(state.remainingAmount),
                style: ShadTheme.of(context).textTheme.list.copyWith(
                  color: AppColors.orange500,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ] else if (state.amountToBePaidBack > 0) ...[
          Row(
            children: [
              Expanded(
                child: Text(
                  '${Intls.to.amountToBePaidBack}: ',
                  style: ShadTheme.of(context).textTheme.list,
                ),
              ),
              Text(
                Formatters.formatCurrency(state.amountToBePaidBack),
                style: ShadTheme.of(context).textTheme.list.copyWith(
                  color: AppColors.cobalt,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ],
      ],
    );
  }
}

class _PaymentForm extends StatelessWidget {
  final PaymentStateManager state;

  const _PaymentForm({required this.state});

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: GetIt.I.get<CartManager>(),
      builder: (context, _) {
        if (CartManager.instance.getCartItems().isEmpty) {
          return const SizedBox.shrink();
        }

        return Column(
          children: [
            _PaymentBody(state: state),
            const SizedBox(height: 8),
            if (state.cart.payments.isNotEmpty && state.amountToBePaidBack > 0)
              _ChangeInputField(state: state),
          ],
        );
      },
    );
  }
}

class _ChangeInputField extends StatelessWidget {
  final PaymentStateManager state;

  const _ChangeInputField({required this.state});

  @override
  Widget build(BuildContext context) {
    return ShadInputFormField(
      label: Text(Intls.to.amountChangeGiven),
      placeholder: Text(Intls.to.amountChangeGiven),
      decoration: ShadTheme.of(context).inputTheme.decoration?.copyWith(
        color: ShadTheme.of(context).colorScheme.background,
      ),
      description: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            state.changeValidationError ??
                Intls.to.leaveEmptyIfYouDontWantToGiveChange,
            style: TextStyle(
              color: state.changeAmountExceedsMaximum
                  ? AppColors.red
                  : ShadTheme.of(context).textTheme.muted.color,
            ),
          ),
          if (state.amountToBePaidBack > 0 && !state.changeAmountExceedsMaximum)
            Text(
              'Montant maximum remboursable: ${Formatters.formatCurrency(state.amountToBePaidBack)}',
              style: const TextStyle(
                color: AppColors.cobalt,
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
        ],
      ),
      controller: state.changeController,
      keyboardType: TextInputType.number,
      leading: const Icon(Icons.attach_money),
      inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[0-9.]'))],
      onChanged: state.onChangeAmountChanged,
    );
  }
}

class _CompleteButton extends StatelessWidget {
  final PaymentStateManager state;

  const _CompleteButton({required this.state});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CustomShadButton(
        onPressed: () => state.completePayment(context),
        enabled:
            CartManager.instance.getCartItems().isNotEmpty &&
            state.cart.payments.isNotEmpty &&
            state.canComplete,
        text: Intls.to.completeOrder,
      ),
    );
  }
}

class _PaymentBody extends StatelessWidget {
  final PaymentStateManager state;

  const _PaymentBody({required this.state});

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          Intls.to.paymentMethod,
          style: ShadTheme.of(
            context,
          ).textTheme.list.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        if (state.cart.payments.isNotEmpty)
          ShadButton.link(
            padding: EdgeInsets.zero,
            height: 15,
            child: Text(
              Intls.to.viewThePaymentSelected,
              style: ShadTheme.of(
                context,
              ).textTheme.muted.copyWith(color: AppColors.cobalt),
            ),
            onPressed: () => showShadDialog(
              context: context,
              builder: (context) => _SelectedPaymentMethod(
                paymentSelected: state.cart.payments,
                onRemove: (_, index) => state.removePayment(index),
              ),
            ),
          ),
        const SizedBox(height: 8),
        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: isMobile ? 0 : 1,
              child: ShadSelect<PaymentMethod?>(
                initialValue: state.selectedPaymentMethod,
                padding: const EdgeInsets.all(12),
                decoration: ShadTheme.of(context).selectTheme.decoration
                    ?.copyWith(
                      color: ShadTheme.of(context).colorScheme.background,
                    ),
                placeholder: AutoSizeText(
                  Intls.to.paymentMethod,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
                options:
                    [
                          PaymentMethod.PAYMENT_METHOD_CASH,
                          PaymentMethod.PAYMENT_METHOD_CREDIT_CARD,
                          PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY,
                          PaymentMethod.PAYMENT_METHOD_VOUCHER,
                        ]
                        .map(
                          (payment) => ShadOption<PaymentMethod?>(
                            value: payment,
                            child: Text(
                              payment.label,
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        )
                        .toList(),
                selectedOptionBuilder: (context, value) => AutoSizeText(
                  value?.label ?? Intls.to.selectPaymentMethod,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  minFontSize: 8,
                ),
                onChanged: state.onMethodChanged,
              ),
            ),
            const SizedBox(width: 12, height: 12),
            Expanded(
              flex: isMobile ? 0 : 1,
              child: ShadInputFormField(
                id: 'payment_amount',
                controller: state.amountController,
                placeholder: Text(
                  '${Intls.to.amount} (Max: ${Formatters.formatCurrency(state.remainingAmount)})',
                ),
                leading: const Icon(LucideIcons.banknote),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9.]')),
                ],
                validator: (value) {
                  if (value.isEmpty) {
                    return Intls.to.requiredField.trParams({
                      'field': Intls.to.amount,
                    });
                  }
                  final amount = double.tryParse(value);
                  if (amount == null || amount <= 0) {
                    return Intls.to.invalidAmount;
                  }
                  if (amount > state.remainingAmount) {
                    return Intls.to.amountExceedsRemaining;
                  }

                  return null;
                },
              ),
            ),
            if (state.selectedPaymentMethod ==
                    PaymentMethod.PAYMENT_METHOD_CREDIT_CARD ||
                state.selectedPaymentMethod ==
                    PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY ||
                state.selectedPaymentMethod ==
                    PaymentMethod.PAYMENT_METHOD_VOUCHER) ...[
              const SizedBox(width: 12, height: 12),
              Expanded(
                flex: isMobile ? 0 : 1,
                child: ShadInputFormField(
                  id: 'reference_id',
                  controller: state.referenceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9\-]')),
                    UpperCaseTextFormatter(),
                  ],
                  placeholder: Text(
                    state.selectedPaymentMethod ==
                            PaymentMethod.PAYMENT_METHOD_VOUCHER
                        ? Intls.to.enterVoucherCode
                        : Intls.to.enterReference,
                  ),
                  onSubmitted: (value) =>
                      state.isProcessing ? null : state.addPayment(context),
                  leading: const Icon(LucideIcons.hash),
                ),
              ),
            ],
            const SizedBox(width: 12, height: 12),
            ShadButton(
              child: state.isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(LucideIcons.sendHorizontal400, size: 20),
              onPressed: state.isProcessing
                  ? null
                  : () => state.addPayment(context),
            ),
          ],
        ),
      ],
    );
  }
}

class _SelectedPaymentMethod extends StatelessWidget {
  final List<Payment> paymentSelected;
  final Function(Payment payment, int index) onRemove;

  const _SelectedPaymentMethod({
    required this.paymentSelected,
    required this.onRemove,
  });

  @override
  Widget build(BuildContext context) {
    return ShadDialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.selectedPayments,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          if (paymentSelected.isNotEmpty)
            Container(
              constraints: const BoxConstraints(maxHeight: 200),
              child: ListView.builder(
                itemCount: paymentSelected.length,
                itemBuilder: (context, index) {
                  final payment = paymentSelected[index];

                  return Material(
                    color: AppColors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Text(payment.paymentMethod.label),
                        subtitle: payment.hasReferenceNumber()
                            ? Text('Ref: ${payment.referenceNumber}')
                            : null,
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              Formatters.formatCurrency(
                                payment.amount.toDouble(),
                              ),
                              style: ShadTheme.of(context).textTheme.list,
                            ),
                            IconButton(
                              icon: const Icon(
                                LucideIcons.trash2400,
                                color: AppColors.red,
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                                onRemove(payment, index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

/// Text formatter to convert input to uppercase
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
