import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_theme.dart';
import '../../../utils/extensions/invoice.dart';
import '../../../utils/formatters.dart';
import '../../input/auto_complete.dart';
import 'payment_form_controller.dart';

/// Section for selecting a supplier.
class PaymentFormSection1 extends StatelessWidget {
  /// Creates a new [PaymentFormSection1] widget.
  const PaymentFormSection1({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PaymentFormController>();
    final isBillKnown = ctrl.isBillKnown;

    return ShadCard(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            Intls.to.supplier,
            style: ShadTheme.of(
              context,
            ).textTheme.small.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          AutoComplete<Supplier>(
            placeholder: isBillKnown
                ? ctrl.selectedSupplierId
                : Intls.to.searchSuppliers,
            searchPlaceholder: Intls.to.searchProductHint,
            enabled: !isBillKnown,
            canReturnDataWhenEmpty: true,
            optionsBuilder: (text) async {
              return await ctrl.searchSuppliers(text);
            },
            displayStringForOption: (option) => option.name,
            validator: (value) {
              if (value == null) {
                return Intls.to.isRequiredField.trParams({
                  'field': Intls.to.supplier,
                });
              }

              return null;
            },
            onSelected: (value) => ctrl.selectSupplier(value.refId),
          ),

          const SizedBox(height: 16),
          if (isBillKnown)
            ShadInputFormField(
              key: isBillKnown ? null : ValueKey(ctrl.amount),
              label: Text(Intls.to.amount),
              initialValue: ctrl.amount?.toStringAsFixed(0) ?? '',
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              enabled: isBillKnown,
              onChanged: (val) {
                final num = double.tryParse(val);
                if (num != null) {
                  context.read<PaymentFormController>().setAmount(num);
                }
              },
              trailing: const Text('XAF'),
            ),
        ],
      ),
    );
  }
}

/// Section for selecting a supplier.
class PaymentFormSection4 extends StatelessWidget {
  /// Creates a new [PaymentFormSection4] widget.
  const PaymentFormSection4({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PaymentFormController>();
    final isBillKnown = ctrl.isBillKnown;

    if (!isBillKnown && ctrl.supplierBills.isNotEmpty) {
      return ShadCard(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              Intls.to.bills,
              style: ShadTheme.of(
                context,
              ).textTheme.small.copyWith(fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 8),
            ...ctrl.supplierBills.map((b) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            b.refId,
                            style: ShadTheme.of(context).textTheme.p,
                          ),
                          Text(
                            '${Intls.to.balance}: ${Formatters.formatCurrency(b.totalAmount)}',
                            style: ShadTheme.of(
                              context,
                            ).textTheme.p.copyWith(fontSize: 12),
                          ),
                          Text(
                            '${Intls.to.balanceDue}: ${Formatters.formatCurrency(b.balanceDue)}',
                            style: ShadTheme.of(
                              context,
                            ).textTheme.muted.copyWith(fontSize: 12),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 12),
                    SizedBox(width: 140, child: _BillAmount(bill: b)),
                  ],
                ),
              );
            }),
            const SizedBox(height: 4),
          ],
        ),
      );
    }

    return const SizedBox();
  }
}

class _BillAmount extends StatelessWidget {
  final Bill bill;

  _BillAmount({required this.bill});

  final TextEditingController _controller = TextEditingController(text: '0');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ShadInput(
          controller: _controller,
          placeholder: const Text('0'),
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          onChanged: (val) {
            final num = double.tryParse(val) ?? 0;
            context.read<PaymentFormController>().setBillPaymentAmount(
              bill.refId,
              num,
            );
          },
          trailing: const Text('XAF'),
        ),
        ShadButton.link(
          child: Text(
            Intls.to.payInFull,
            style: ShadTheme.of(
              context,
            ).textTheme.muted.copyWith(color: SabitouColors.infoText),
          ),
          padding: EdgeInsets.zero,
          onPressed: () {
            final amount = bill.balanceDue;
            _controller.text = amount.toStringAsFixed(0);
            context.read<PaymentFormController>().setBillPaymentAmount(
              bill.refId,
              amount,
            );
          },
        ),
      ],
    );
  }
}

/// Section for selecting a payment method and date.
class PaymentFormSection2 extends StatelessWidget {
  /// Creates a new [PaymentFormSection2] widget.
  const PaymentFormSection2({super.key});

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PaymentFormController>();

    final paymentMethods = [
      PaymentMethod.PAYMENT_METHOD_CASH,
      PaymentMethod.PAYMENT_METHOD_CREDIT_CARD,
      PaymentMethod.PAYMENT_METHOD_ORANGE_MONEY,
      PaymentMethod.PAYMENT_METHOD_MTN_MONEY,
    ];

    return ShadCard(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 8),
          Text(
            Intls.to.date,
            style: ShadTheme.of(
              context,
            ).textTheme.small.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          ShadDatePickerFormField(
            width: double.infinity,
            initialValue: ctrl.paymentDate,
            onChanged: (date) {
              if (date != null) {
                context.read<PaymentFormController>().setPaymentDate(date);
              }
            },
          ),

          const SizedBox(height: 16),

          Text(
            Intls.to.paymentMethod,
            style: ShadTheme.of(
              context,
            ).textTheme.small.copyWith(fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 8),
          LayoutBuilder(
            builder: (context, contraint) {
              return ShadSelect<PaymentMethod>(
                minWidth: contraint.maxWidth,
                placeholder: Text(Intls.to.paymentMethod),
                initialValue: ctrl.selectedPaymentMethod,
                onChanged: (value) {
                  if (value != null) {
                    context.read<PaymentFormController>().selectPaymentMethod(
                      value,
                    );
                  }
                },
                options: paymentMethods
                    .map(
                      (method) =>
                          ShadOption(value: method, child: Text(method.label)),
                    )
                    .toList(),
                selectedOptionBuilder: (context, value) {
                  return Text(value.label);
                },
              );
            },
          ),
        ],
      ),
    );
  }
}

/// Section for adding notes to a payment.
class PaymentFormNotesSection extends StatelessWidget {
  /// Constructs a [PaymentFormNotesSection].
  const PaymentFormNotesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ctrl = context.watch<PaymentFormController>();

    return ShadCard(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ShadInputFormField(
            label: Text(Intls.to.referenceNumber),
            initialValue: ctrl.referenceNumber,
            onChanged: (val) {
              context.read<PaymentFormController>().referenceNumber = val;
            },
          ),
          const SizedBox(height: 16),
          ShadInputFormField(
            label: Text(Intls.to.notes),
            initialValue: ctrl.notes,
            maxLines: 3,
            onChanged: (val) {
              context.read<PaymentFormController>().notes = val;
            },
          ),
        ],
      ),
    );
  }
}
