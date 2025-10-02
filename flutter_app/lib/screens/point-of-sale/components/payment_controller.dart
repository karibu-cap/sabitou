import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../providers/cart_provider.dart';
import '../../../repositories/gift_voucher_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/formatters.dart';
import '../../../utils/user_preference.dart';
import '../point_of_sale_controller.dart';

/// Payment state manager
class PaymentStateManager extends ChangeNotifier {
  /// The instance of [CartManager].
  final CartManager cart = CartManager.instance;

  double _amountReceived = 0.0;
  double _remainingAmount = 0.0;
  double _amountToBePaidBack = 0.0;
  double _changeGiven = 0.0;
  bool _changeAmountExceedsMaximum = false;
  String? _changeValidationError;
  bool _isProcessing = false;

  PaymentMethod? _selectedPaymentMethod = PaymentMethod.PAYMENT_METHOD_CASH;
  final _amountController = TextEditingController();
  final _referenceController = TextEditingController();
  final _changeController = TextEditingController();

  /// The total amount of money received from the customer.
  double get amountReceived => _amountReceived;

  /// The remaining amount that the customer needs to pay.
  double get remainingAmount => _remainingAmount;

  /// The amount that the cashier needs to pay back to the customer.
  double get amountToBePaidBack => _amountToBePaidBack;

  /// The amount that the cashier has given back to the customer.
  double get changeGiven => _changeGiven;

  /// Whether the amount given back exceeds the maximum amount that can be given back.
  bool get changeAmountExceedsMaximum => _changeAmountExceedsMaximum;

  /// The error message when the amount given back exceeds the maximum amount.
  String? get changeValidationError => _changeValidationError;

  /// Whether the payment process is currently in progress.
  bool get isProcessing => _isProcessing;

  /// The currently selected payment method.
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  /// The text controller for the amount text field.
  TextEditingController get amountController => _amountController;

  /// The text controller for the reference text field.
  TextEditingController get referenceController => _referenceController;

  /// The text controller for the change text field.
  TextEditingController get changeController => _changeController;

  /// Whether the payment can be completed.
  bool get canComplete => cart.canComplete;

  /// Constructor of new [PaymentStateManager].
  PaymentStateManager() {
    cart.addListener(_onCartChanged);
  }

  void _onCartChanged() {
    _updateCalculations();
    notifyListeners();
  }

  void _updateCalculations() {
    final receipt = cart.currentCashReceipt;
    if (receipt == null) return;

    _amountReceived = receipt.amountPaid;
    _remainingAmount = _amountReceived > 0
        ? receipt.totalAmount - _amountReceived
        : 0;
    _amountToBePaidBack = _remainingAmount < 0 ? -_remainingAmount : 0.0;
    _changeGiven = receipt.changeGiven;

    if (_amountToBePaidBack == 0) {
      _changeGiven = 0;
      _changeController.clear();
    }

    if (_amountToBePaidBack > 0 && _changeController.text.isEmpty) {
      final changeText = _amountToBePaidBack.toString();
      _changeController.text = changeText;
      cart.setChangeGiven(_amountToBePaidBack);
    }

    notifyListeners();
  }

  bool _validateChangeAmount(double change) {
    if (_amountToBePaidBack > 0 && change > _amountToBePaidBack) {
      _changeAmountExceedsMaximum = true;
      _changeValidationError =
          '${Intls.to.changeGivenMustBeLessThan} ${Formatters.formatCurrency(_amountToBePaidBack)}';
      notifyListeners();

      return false;
    }
    _changeAmountExceedsMaximum = false;
    _changeValidationError = null;

    return true;
  }

  /// Called when the payment method is changed.
  void onMethodChanged(PaymentMethod? value) {
    if (value == null) return;
    _selectedPaymentMethod = value;
    _referenceController.clear();
    notifyListeners();
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

  /// Adds payment.
  Future<void> addPayment(BuildContext context) async {
    final amount = double.tryParse(_amountController.text) ?? 0.0;

    if (_selectedPaymentMethod == null || amount <= 0) {
      showErrorToast(context: context, message: Intls.to.invalidPaymentAmount);

      return;
    }

    _isProcessing = true;
    notifyListeners();

    try {
      Payment payment;
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

        final voucherAvailable = voucher.remainingValue.toDouble();

        if (amount > voucherAvailable) {
          showErrorToast(
            context: context,
            message: Intls.to.insufficientVoucherAmount.trParams({
              'remainingAmount': voucherAvailable.toString(),
            }),
          );

          return;
        }

        payment = Payment(
          paymentMethod: _selectedPaymentMethod,
          amount: amount,
          referenceNumber: voucherCode,
        );
      } else {
        payment = Payment(
          paymentMethod: _selectedPaymentMethod,
          amount: amount,
          referenceNumber: _referenceController.text.trim().isEmpty
              ? null
              : _referenceController.text.trim(),
        );
      }

      cart.addPayment(payment);

      _amountController.clear();
      _referenceController.clear();
      _selectedPaymentMethod = PaymentMethod.PAYMENT_METHOD_CASH;

      notifyListeners();
    } catch (e) {
      showErrorToast(
        context: context,
        message: 'Erreur lors de l\'ajout du paiement: $e',
      );
    } finally {
      _isProcessing = false;
      notifyListeners();
    }
  }

  /// Removes payment.
  void removePayment(int index) {
    if (index >= 0 && index < cart.payments.length) {
      cart.removePayment(index);
    }
  }

  /// Called when the change amount is changed.
  void onChangeAmountChanged(String value) {
    final parsedValue = double.tryParse(value) ?? 0.0;

    final result = _validateChangeAmount(parsedValue);

    if (!result) {
      return;
    }

    _changeGiven = parsedValue;
    cart.setChangeGiven(parsedValue);
  }

  /// Completes the payment.
  Future<bool> completePayment(BuildContext context) async {
    if (!canComplete) return false;

    final controller = Provider.of<PointOfSaleController>(
      context,
      listen: false,
    );

    final isOverpayment = _amountToBePaidBack > 0;

    final success = await controller.completeSimpleSale(
      context,
      isOverpayment: isOverpayment,
    );

    if (success) {
      reset();
    }

    return success;
  }

  /// Resets the payment state.
  void reset() {
    cart.payments.clear();
    _amountReceived = 0.0;
    _remainingAmount = 0;
    _amountToBePaidBack = 0.0;
    _changeGiven = 0.0;
    _changeAmountExceedsMaximum = false;
    _changeValidationError = null;
    _changeController.clear();
    _amountController.clear();
    _referenceController.clear();
    _selectedPaymentMethod = PaymentMethod.PAYMENT_METHOD_CASH;
    notifyListeners();
  }

  @override
  void dispose() {
    cart.removeListener(_onCartChanged);
    _amountController.dispose();
    _referenceController.dispose();
    _changeController.dispose();
    super.dispose();
  }
}
