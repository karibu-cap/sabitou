import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/models.dart';

import '../../../repositories/gift_voucher_repository.dart';
import '../../../services/internationalization/internationalization.dart';
import '../../../utils/common_functions.dart';
import '../../../utils/formatters.dart';
import '../../../utils/user_preference.dart';
import '../point_of_sale_controller.dart';
import 'cart_provider.dart';

/// State manager for the payment panel.
/// Provided by [PaymentSection] via [ChangeNotifierProvider].
class PaymentStateManager extends ChangeNotifier {
  /// Shared cart instance.
  final CartProvider cart = CartProvider.instance;

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

  /// Total money received from the customer across all payment entries.
  double get amountReceived => _amountReceived;

  /// Amount still owed by the customer (totalAmount − amountReceived).
  ///
  /// Is 0 when fully paid.
  double get remainingAmount => _remainingAmount;

  /// Amount the cashier needs to return to the customer (overpayment).
  ///
  /// Is 0 when the customer has not overpaid.
  double get amountToBePaidBack => _amountToBePaidBack;

  /// Amount of change that has already been given back.
  double get changeGiven => _changeGiven;

  /// True when the entered change amount exceeds [amountToBePaidBack].
  bool get changeAmountExceedsMaximum => _changeAmountExceedsMaximum;

  /// Validation error message for the change input field, or `null`.
  String? get changeValidationError => _changeValidationError;

  /// True while an async payment operation is in progress.
  bool get isProcessing => _isProcessing;

  /// The payment method currently selected in the UI.
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;

  /// Controller bound to the "amount" text field.
  TextEditingController get amountController => _amountController;

  /// Controller bound to the "reference" text field.
  TextEditingController get referenceController => _referenceController;

  /// Controller bound to the "change given" text field.
  TextEditingController get changeController => _changeController;

  /// Whether the receipt can be completed (all conditions satisfied).
  bool get canComplete => cart.canComplete;

  /// Creates a [PaymentStateManager] and starts listening to [CartProvider].
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
      _changeController.text = _amountToBePaidBack.toString();
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

  /// Updates [selectedPaymentMethod] and clears the reference field.
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

    return GiftVoucherRepository.instance.validateVoucher(
      ValidateVoucherRequest(voucherCode: voucherCode),
    );
  }

  /// Validates inputs and appends a [Payment] to the current cart receipt.
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

        final available = voucher.remainingValue.toDouble();
        if (amount > available) {
          showErrorToast(
            context: context,
            message: Intls.to.insufficientVoucherAmount.trParams({
              'remainingAmount': available.toString(),
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

  /// Removes a payment entry at [index].
  void removePayment(int index) {
    if (index >= 0 && index < cart.payments.length) {
      cart.removePayment(index);
    }
  }

  /// Updates [changeGiven] after validating that it does not exceed
  /// [amountToBePaidBack].
  void onChangeAmountChanged(String value) {
    final parsed = double.tryParse(value) ?? 0.0;
    if (!_validateChangeAmount(parsed)) return;

    _changeGiven = parsed;
    cart.setChangeGiven(parsed);
  }

  /// Finalises the sale by calling [PointOfSaleController.completeSimpleSale].
  ///
  /// Returns `true` on success. Resets local state on success.
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

    if (success) reset();

    return success;
  }

  /// Resets all payment state (called after a successful sale).
  void reset() {
    cart.payments.clear();
    _amountReceived = 0.0;
    _remainingAmount = 0.0;
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
