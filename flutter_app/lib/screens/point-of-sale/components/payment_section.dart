import 'dart:async';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../../../providers/cart_provider.dart';
import '../../../repositories/gift_voucher_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../themes/app_colors.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/extensions/invoice.dart';
import '../../../utils/formatters.dart';
import '../../../utils/responsive_utils.dart';
import '../../../utils/user_preference.dart';
import '../../../widgets/custom_shad_button.dart';
import '../point_of_sale_controller.dart';

/// The payment section.
class PaymentSection extends StatefulWidget {
  /// The total amount to be paid.
  final double total;

  /// Constructor of new [PaymentSection].
  const PaymentSection({super.key, required this.total});

  @override
  State<PaymentSection> createState() => _PaymentSectionState();
}

class _PaymentSectionState extends State<PaymentSection> {
  final cart = CartManager.instance;
  double _total = 0.0;
  double _amountReceived = 0.0;
  double _remainingAmount = 0.0;
  double _amountToBePaidBack = 0.0;
  bool _isProcessing = false;

  // Current payment being added
  PaymentMethod? _selectedPaymentMethod = PaymentMethod.PAYMENT_METHOD_CASH;
  final _amountController = TextEditingController();
  final _referenceController = TextEditingController();
  final _changeController = TextEditingController();
  double _changeGiven = 0.0;

  @override
  void initState() {
    super.initState();
    _total = widget.total;

    _changeController.addListener(() {
      final value = double.tryParse(_changeController.text) ?? 0.0;
      setState(() {
        _changeGiven = value;
      });
    });
  }

  void _updateCalculations() {
    _amountReceived = cart.payments.fold(
      0.0,
      (sum, payment) => sum + payment.amount.toDouble(),
    );
    _remainingAmount = _total - _amountReceived + _changeGiven;

    print('_remainingAmount: $_remainingAmount');
    _amountToBePaidBack = _remainingAmount < 0 ? -_remainingAmount : 0.0;

    if (_amountToBePaidBack > 0) {
      if (_changeController.text.isEmpty) {
        _changeController.text = _amountToBePaidBack.toString();
      }
    } else {
      _changeController.clear();
    }

    unawaited(_processPayment(completeTheOrder: false));
  }

  void _onMethodChanged(PaymentMethod? value) {
    if (value == null) return;
    setState(() {
      _selectedPaymentMethod = value;
      _referenceController.clear();
    });
  }

  Future<ValidateVoucherResponse?> _validateVoucher(String voucherCode) async {
    final user = UserPreferences.instance.user;
    final store = UserPreferences.instance.store;
    if (user == null || store == null) return ValidateVoucherResponse();
    if (voucherCode.isEmpty) return ValidateVoucherResponse();

    final response = await GiftVoucherRepository.instance.validateVoucher(
      ValidateVoucherRequest(voucherCode: voucherCode),
    );

    return response;
  }

  Future<void> _onAddPayment() async {
    final amount = double.tryParse(_amountController.text) ?? 0.0;
    if (_selectedPaymentMethod == null || amount <= 0) {
      showErrorToast(context: context, message: Intls.to.invalidPaymentAmount);

      return;
    }

    setState(() {
      _isProcessing = true;
    });

    try {
      // Validate voucher if payment method is store credit
      if (_selectedPaymentMethod == PaymentMethod.PAYMENT_METHOD_VOUCHER) {
        final voucherCode = _referenceController.text.trim();
        if (voucherCode.isEmpty) {
          showErrorToast(
            context: context,
            message: Intls.to.requiredField.trParams({
              'field': Intls.to.voucher,
            }),
          );

          return;
        }

        final voucher = await _validateVoucher(voucherCode);
        if (voucher == null || !voucher.isValid) {
          showErrorToast(
            context: context,
            message: Intls.to.invalidOrExpiredVoucher,
          );

          return;
        }

        /// if the voucher amount is less than the reaming generate and error
        if (amount < _remainingAmount) {
          showErrorToast(
            context: context,
            message: Intls.to.insufficientVoucherAmount.trParams({
              'remainingAmount': voucher.remainingValue.toString(),
            }),
          );

          return;
        }
      }

      // Add payment to list
      final payment = Payment(
        paymentMethod: _selectedPaymentMethod,
        amount: amount,
        referenceNumber: _referenceController.text.trim().isEmpty
            ? null
            : _referenceController.text.trim(),
      );

      setState(() {
        cart.payments.add(payment);
        _updateCalculations();
        _amountController.clear();
        _referenceController.clear();
        _selectedPaymentMethod = PaymentMethod.PAYMENT_METHOD_CASH;
      });
    } finally {
      setState(() {
        _isProcessing = false;
      });
    }
  }

  void _onRemovePayment(_, int index) {
    setState(() {
      cart.payments.removeAt(index);
      _updateCalculations();
    });
  }

  bool get _canComplete {
    if (cart.payments.isEmpty) {
      return false;
    }
    if (_remainingAmount > 0) {
      return false;
    }
    if (_remainingAmount > 0) {
      return false;
    }
    if (_amountToBePaidBack > 0 && _changeGiven > _amountToBePaidBack) {
      return false;
    }

    return true;
  }

  Future<void> _processPayment({bool completeTheOrder = true}) async {
    if (completeTheOrder) {
      if (!_canComplete) return;
    }

    // Get the POS controller from the context
    final controller = Provider.of<PointOfSaleController>(
      context,
      listen: false,
    );

    // Determine if this is an overpayment scenario
    final isOverpayment = _amountToBePaidBack > 0;

    final success = await controller.completeSimpleSale(
      context,
      isOverpayment: isOverpayment,
    );
    if (success) {
      // Clear local payment state on success
      setState(() {
        cart.payments.clear();
        _amountReceived = 0.0;
        _remainingAmount = 0.0;
        _amountToBePaidBack = 0.0;
        _changeGiven = 0.0;
        _changeController.clear();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 5,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          spacing: 8,
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
                  '${Formatters.formatCurrency(_amountReceived.toDouble())}',
                  style: ShadTheme.of(context).textTheme.list.copyWith(
                    color: _amountReceived > 0
                        ? AppColors.lightGreen
                        : AppColors.grey400,
                  ),
                ),
              ],
            ),
            if (_remainingAmount > 0) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${Intls.to.remaining}: ',
                      style: ShadTheme.of(context).textTheme.list,
                    ),
                  ),
                  Text(
                    '${Formatters.formatCurrency(_remainingAmount)}',
                    style: ShadTheme.of(context).textTheme.list.copyWith(
                      color: AppColors.orange500,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ] else if (_amountToBePaidBack > 0) ...[
              Row(
                children: [
                  Expanded(
                    child: Text(
                      '${Intls.to.amountToBePaidBack}: ',
                      style: ShadTheme.of(context).textTheme.list,
                    ),
                  ),
                  Text(
                    '${Formatters.formatCurrency(_amountToBePaidBack)}',
                    style: ShadTheme.of(context).textTheme.list.copyWith(
                      color: AppColors.cobalt,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ],
          ],
        ),
        Divider(
          thickness: 1,
          color: ShadTheme.of(context).colorScheme.background,
        ),
        ListenableBuilder(
          listenable: GetIt.I.get<CartManager>(),
          builder: (context, value) {
            if (CartManager.instance.getCartItems().isEmpty) {
              return const SizedBox.shrink();
            }

            return Column(
              spacing: 8,
              children: [
                _PaymentBody(
                  payments: cart.payments,
                  selectedPaymentMethod: _selectedPaymentMethod,
                  onMethodChanged: _onMethodChanged,
                  onRemovePayment: _onRemovePayment,
                  onAddPayment: _onAddPayment,
                  amountController: _amountController,
                  referenceController: _referenceController,
                  remainingAmount: _remainingAmount,
                  isProcessing: _isProcessing,
                ),
                if (cart.payments.isNotEmpty && _remainingAmount < 0)
                  ShadInputFormField(
                    initialValue: _remainingAmount.toString(),
                    label: Text(Intls.to.amountChangeGiven),
                    placeholder: Text(Intls.to.amountChangeGiven),
                    decoration: ShadTheme.of(context).inputTheme.decoration
                        ?.copyWith(
                          color: ShadTheme.of(context).colorScheme.background,
                        ),
                    description: Text(
                      Intls.to.leaveEmptyIfYouDontWantToGiveChange,
                    ),
                    controller: _changeController,
                    keyboardType: TextInputType.number,
                    onSubmitted: (value) => _processPayment(),
                    leading: const Icon(Icons.attach_money),
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
                    ],
                    onChanged: (value) {
                      final parsedValue = double.tryParse(value) ?? 0;

                      if (parsedValue <= _remainingAmount) {
                        _updateCalculations();
                        _changeGiven = parsedValue;
                      }
                    },
                  ),
              ],
            );
          },
        ),

        SizedBox(
          width: double.infinity,
          child: CustomShadButton(
            onPressed: _processPayment,
            enabled:
                CartManager.instance.getCartItems().isNotEmpty &&
                cart.payments.isNotEmpty &&
                _remainingAmount <= 0,
            text: Intls.to.completeOrder,
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    _amountController.dispose();
    _referenceController.dispose();
    _changeController.dispose();
    super.dispose();
  }
}

class _PaymentBody extends StatelessWidget {
  const _PaymentBody({
    Key? key,
    required this.payments,
    required this.selectedPaymentMethod,
    required this.onMethodChanged,
    required this.onRemovePayment,
    required this.onAddPayment,
    required this.amountController,
    required this.referenceController,
    required this.remainingAmount,
    required this.isProcessing,
  }) : super(key: key);

  final List<Payment> payments;
  final PaymentMethod? selectedPaymentMethod;
  final void Function(PaymentMethod? paymentMethod)? onMethodChanged;
  final void Function(Payment payment, int index) onRemovePayment;
  final void Function() onAddPayment;

  final TextEditingController amountController;
  final TextEditingController referenceController;
  final double remainingAmount;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    final isMobile = ResponsiveUtils.isMobile(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: 8,
      children: [
        Text(
          Intls.to.paymentMethod,
          style: ShadTheme.of(
            context,
          ).textTheme.list.copyWith(fontWeight: FontWeight.bold),
        ),
        if (payments.isNotEmpty)
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
                key: UniqueKey(),
                paymentSelected: payments,
                onRemove: onRemovePayment,
              ),
            ),
          ),

        Flex(
          direction: isMobile ? Axis.vertical : Axis.horizontal,
          spacing: 12,
          children: [
            Expanded(
              flex: isMobile ? 0 : 1,
              child: ShadSelect<PaymentMethod?>(
                initialValue: selectedPaymentMethod,
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
                onChanged: onMethodChanged,
              ),
            ),

            // Amount Input
            Expanded(
              flex: isMobile ? 0 : 1,
              child: ShadInputFormField(
                id: 'payment_amount',
                controller: amountController,
                placeholder: Text(
                  '${Intls.to.amount} (Max: ${Formatters.formatCurrency(remainingAmount)})',
                ),
                leading: const Icon(LucideIcons.banknote),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.allow(RegExp(r'[0-9\-]')),
                  UpperCaseTextFormatter(),
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
                  if (amount > remainingAmount) {
                    return Intls.to.amountExceedsRemaining;
                  }

                  return null;
                },
              ),
            ),

            if (selectedPaymentMethod ==
                    PaymentMethod.PAYMENT_METHOD_CREDIT_CARD ||
                selectedPaymentMethod ==
                    PaymentMethod.PAYMENT_METHOD_MOBILE_MONEY ||
                selectedPaymentMethod ==
                    PaymentMethod.PAYMENT_METHOD_VOUCHER) ...[
              Expanded(
                flex: isMobile ? 0 : 1,
                child: ShadInputFormField(
                  id: 'reference_id',
                  controller: referenceController,
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(RegExp(r'[A-Z0-9\-]')),
                    UpperCaseTextFormatter(),
                  ],
                  placeholder: Text(
                    selectedPaymentMethod ==
                            PaymentMethod.PAYMENT_METHOD_VOUCHER
                        ? Intls.to.enterVoucherCode
                        : Intls.to.enterReference,
                  ),
                  onSubmitted: (value) => isProcessing ? null : onAddPayment,
                  leading: const Icon(LucideIcons.hash),
                ),
              ),
            ],

            ShadButton(
              child: isProcessing
                  ? const SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(LucideIcons.sendHorizontal400, size: 20),
              onPressed: isProcessing ? null : onAddPayment,
            ),
          ],
        ),
      ],
    );
  }
}

class _SelectedPaymentMethod extends StatelessWidget {
  const _SelectedPaymentMethod({
    Key? key,
    required this.paymentSelected,
    required this.onRemove,
  }) : super(key: key);

  final List<Payment> paymentSelected;
  final Function(Payment payment, int index) onRemove;

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
              child: CustomScrollView(
                shrinkWrap: true,
                slivers: [
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: paymentSelected.length,
                      (context, index) {
                        if (index >= paymentSelected.length) {
                          return const SizedBox.shrink();
                        }
                        final payment = paymentSelected[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Material(
                            color: AppColors.transparent,
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
