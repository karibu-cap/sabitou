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

  PaymentStateManager() {
    _changeController.addListener(_onChangeControllerChanged);
    _updateCalculations();
  }

  // Getters
  double get amountReceived => _amountReceived;
  double get remainingAmount => _remainingAmount;
  double get amountToBePaidBack => _amountToBePaidBack;
  double get changeGiven => _changeGiven;
  bool get changeAmountExceedsMaximum => _changeAmountExceedsMaximum;
  String? get changeValidationError => _changeValidationError;
  bool get isProcessing => _isProcessing;
  PaymentMethod? get selectedPaymentMethod => _selectedPaymentMethod;
  TextEditingController get amountController => _amountController;
  TextEditingController get referenceController => _referenceController;
  TextEditingController get changeController => _changeController;

  bool get canComplete {
    if (cart.payments.isEmpty) return false;
    if (_remainingAmount > 0) return false;

    // CORRECTION: Le caissier ne peut pas rembourser plus que la dette
    if (_amountToBePaidBack > 0 && _changeGiven > _amountToBePaidBack) {
      return false;
    }

    return true;
  }

  void _onChangeControllerChanged() {
    final value = double.tryParse(_changeController.text) ?? 0.0;
    _changeGiven = value;
    _validateChangeAmount();
    _updateCalculations();
    notifyListeners();
  }

  void _updateCalculations() {
    // Calculer le montant total reçu
    _amountReceived = cart.payments.fold(
      0.0,
      (sum, payment) => sum + payment.amount.toDouble(),
    );

    // CORRECTION: Le montant restant doit tenir compte du changeGiven
    // Si changeGiven > 0, cela signifie qu'on rembourse moins que prévu
    // donc le client doit encore ce montant non rembours
    _remainingAmount =
        (cart.currentCashReceipt?.totalAmount ?? 0) - _amountReceived;

    // Si le client a trop payé, calculer le montant à rembourser
    _amountToBePaidBack = _remainingAmount < 0 ? -_remainingAmount : 0.0;

    // Valider le montant de change en temps réel
    _validateChangeAmount();

    // CORRECTION: Gérer le champ de change automatiquement
    if (_amountToBePaidBack > 0) {
      // Si le champ est vide, proposer le remboursement total
      if (_changeController.text.isEmpty) {
        _changeController.text = _amountToBePaidBack.toStringAsFixed(0);
        _changeGiven = _amountToBePaidBack;
      }
    } else {
      // Si pas de remboursement nécessaire, réinitialiser
      if (_changeController.text.isNotEmpty) {
        _changeController.clear();
      }
      _changeGiven = 0.0;
      _changeAmountExceedsMaximum = false;
      _changeValidationError = null;
    }

    notifyListeners();
  }

  void _validateChangeAmount() {
    // EXIGENCE 5: La somme que le caissier peut rembourser ne doit pas être supérieure à la dette
    if (_amountToBePaidBack > 0 && _changeGiven > _amountToBePaidBack) {
      _changeAmountExceedsMaximum = true;
      _changeValidationError =
          '${Intls.to.changeGivenMustBeLessThan} ${Formatters.formatCurrency(_amountToBePaidBack)}';
    } else {
      _changeAmountExceedsMaximum = false;
      _changeValidationError = null;
    }
  }

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
        final amountToPay = _remainingAmount;

        double paymentAmount;
        paymentAmount = voucherAvailable >= amountToPay
            ? amountToPay
            : voucherAvailable;

        // CORRECTION: Vérifier que le montant saisi ne dépasse pas le montant disponible
        if (amount > voucherAvailable) {
          showErrorToast(
            context: context,
            message: Intls.to.insufficientVoucherAmount.trParams({
              'remainingAmount': voucherAvailable.toString(),
            }),
          );

          return;
        }

        // Enregistrer le paiement avec le bon
        cart.payments.add(
          Payment(
            paymentMethod: _selectedPaymentMethod,
            amount: amount,
            referenceNumber: voucherCode,
          ),
        );
      } else {
        final payment = Payment(
          paymentMethod: _selectedPaymentMethod,
          amount: amount,
          referenceNumber: _referenceController.text.trim().isEmpty
              ? null
              : _referenceController.text.trim(),
        );

        cart.payments.add(payment);
      }

      _updateCalculations();
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

  void removePayment(int index) {
    if (index >= 0 && index < cart.payments.length) {
      cart.payments.removeAt(index);
      // EXIGENCE 7: Mettre à jour les différents totaux
      _updateCalculations();
    }
  }

  void onChangeAmountChanged(String value) {
    final parsedValue = double.tryParse(value) ?? 0.0;

    // EXIGENCE 5: Valider que le montant ne dépasse pas le maximum remboursable
    if (_amountToBePaidBack > 0 && parsedValue > _amountToBePaidBack) {
      _changeAmountExceedsMaximum = true;
      _changeValidationError =
          'Le montant de remboursement ne peut pas dépasser ${Formatters.formatCurrency(_amountToBePaidBack)}';
    } else {
      _changeGiven = parsedValue;
      _changeAmountExceedsMaximum = false;
      _changeValidationError = null;
    }

    // EXIGENCE 7: Mettre à jour les totaux
    _updateCalculations();
  }

  Future<bool> completePayment(BuildContext context) async {
    if (!canComplete) return false;

    final controller = Provider.of<PointOfSaleController>(
      context,
      listen: false,
    );

    // EXIGENCE 4: Gérer le remboursement
    final isOverpayment = _amountToBePaidBack > 0;

    // Si c'est un remboursement, enregistrer le montant que le caissier peut rembourser
    if (isOverpayment) {
      // Le montant réellement remboursé est _changeGiven
      // Si _changeGiven < _amountToBePaidBack, la différence reste en dette client
      final debtRemaining = _amountToBePaidBack - _changeGiven;

      if (debtRemaining > 0) {
        // TODO: Enregistrer la dette client ici si nécessaire
        // Cette partie dépend de votre logique métier
        print('Dette restante du client: $debtRemaining');
      }
    }

    final success = await controller.completeSimpleSale(
      context,
      isOverpayment: isOverpayment,
    );

    if (success) {
      reset();
    }

    return success;
  }

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
    _changeController.removeListener(_onChangeControllerChanged);
    _amountController.dispose();
    _referenceController.dispose();
    _changeController.dispose();
    super.dispose();
  }
}
