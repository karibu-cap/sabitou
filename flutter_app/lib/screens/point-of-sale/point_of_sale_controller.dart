// ignore_for_file: long-method

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../providers/cart_provider.dart';
import '../../repositories/gift_voucher_repository.dart';
import '../../repositories/inventory_repository.dart';
import '../../repositories/pos_of_repository.dart';
import '../../services/internationalization/internationalization.dart';
import '../../utils/button_state.dart';
import '../../utils/common_functions.dart';
import '../../utils/extensions/global_product_extension.dart';
import '../../utils/logger.dart';
import '../../utils/user_preference.dart';
import 'point_of_sale_view_model.dart';

/// Button state enum for POS operations
enum ButtonStateEnum {
  /// Gets the initial state.
  initial,

  /// Gets the loading state.
  loading,
}

/// Error types for POS operations
enum PosErrorType {
  /// Gets the network error type.
  network,

  /// Gets the validation error type.
  validation,

  /// Gets the inventory error type.
  inventory,

  /// Gets the payment error type.
  payment,

  /// Gets the voucher error type.
  voucher,

  /// Gets the unknown error type.
  unknown,
}

/// POS operation result
class PosOperationResult {
  /// Gets the success state.
  final bool success;

  /// Gets the message.
  final String message;

  /// Gets the error type.
  final PosErrorType? errorType;

  /// Constructor of [PosOperationResult].
  const PosOperationResult.success(this.message)
    : success = true,
      errorType = null;

  /// Constructor of [PosOperationResult].
  const PosOperationResult.failure(this.message, this.errorType)
    : success = false;
}

/// Controller for new order.
class PointOfSaleController extends ChangeNotifier {
  final LoggerApp _logger = LoggerApp('PointOfSaleController');

  final PointOfSaleViewModel _viewModel;

  /// The search query controller.
  final searchQueryController = TextEditingController();

  /// The complete order button state.
  ButtonState completeOrderButtonState = ButtonState.initial;

  /// The on hold order button state.
  final ButtonState onHoldOrderButtonState = ButtonState.initial;

  /// Currents error state.
  PosOperationResult? _currentError;

  /// Currents success state.
  PosOperationResult? _currentSuccess;

  /// Gets the filtered products stream.
  Stream<List<StoreProductWithGlobalProduct>> get filteredProductsStream =>
      _viewModel.filteredProductsStream;

  /// Gets the search query.
  BehaviorSubject<String> get searchQuery => _viewModel.searchQuery;

  /// Gets current error state.
  PosOperationResult? get currentError => _currentError;

  /// Gets current success state.
  PosOperationResult? get currentSuccess => _currentSuccess;

  /// Constructor of [PointOfSaleController].
  PointOfSaleController(this._viewModel);

  /// Clears error state.
  void clearError() {
    _currentError = null;
    notifyListeners();
  }

  /// Clears success state.
  void clearSuccess() {
    _currentSuccess = null;
    notifyListeners();
  }

  /// Completes simple cash sale (Scenario 1)
  /// Creates a CashReceipt and updates inventory
  Future<bool> completeSimpleSale(
    BuildContext context, {
    bool isOverpayment = false,
  }) async {
    try {
      // Get store and user data
      final store = UserPreferences.instance.store;
      final user = UserPreferences.instance.user;

      if (store == null || user == null) {
        _setErrorState(
          PosOperationResult.failure(
            Intls.to.storeNotConfigured,
            PosErrorType.validation,
          ),
        );
        showErrorToast(context: context, message: Intls.to.storeNotConfigured);

        return false;
      }

      _showLoadingState();

      final currentCashReceipt = CartManager.instance.currentCashReceipt;
      final cartItems = currentCashReceipt?.items ?? [];

      if (currentCashReceipt == null || cartItems.isEmpty) {
        _setErrorState(
          PosOperationResult.failure(
            Intls.to.emptyCart,
            PosErrorType.validation,
          ),
        );
        showErrorToast(context: context, message: Intls.to.emptyCart);

        return false;
      }

      final cartValidation = _isCartValid();
      if (!cartValidation.success) {
        _setErrorState(cartValidation);
        showErrorToast(context: context, message: cartValidation.message);

        return false;
      }

      // Validate inventory availability
      final inventoryValidation = await _validateInventoryAvailability();
      if (!inventoryValidation.success) {
        _setErrorState(inventoryValidation);
        showErrorToast(context: context, message: inventoryValidation.message);

        return false;
      }

      final request = CreateCashReceiptRequest(
        receipt: currentCashReceipt,
        payments: CartManager.instance.payments,
        issueVoucherOnChange: isOverpayment,
      );

      // Make actual backend call
      final response = await PosOfRepository.instance.createCashReceipt(
        request,
      );

      if (response == null) {
        _setErrorState(
          PosOperationResult.failure(
            Intls.to.failedToCreateCashReceipt,
            PosErrorType.network,
          ),
        );
        if (context.mounted) {
          showErrorToast(
            context: context,
            message: Intls.to.failedToCreateCashReceipt,
          );
        }

        return false;
      }

      // Success
      _setSuccessState(
        PosOperationResult.success(Intls.to.saleCompletedSuccessfully),
      );

      if (context.mounted) {
        showSuccessToast(
          context: context,
          message: Intls.to.saleCompletedSuccessfully,
        );
      }

      // Clear cart after successful sale
      CartManager.instance.clearCart();

      _logger.info('Simple sale completed successfully: $response');

      return true;
    } on Exception catch (e) {
      _logger.severe('Error completing simple sale: $e');
      _setErrorState(
        PosOperationResult.failure(
          'Échec de la vente: $e',
          PosErrorType.unknown,
        ),
      );

      if (context.mounted) {
        showErrorToast(context: context, message: 'Échec de la vente: $e');
      }

      return false;
    } finally {
      _resetButtonState();
    }
  }

  /// Validate if cart is ready for simple sale
  PosOperationResult _isCartValid() {
    try {
      final cartItems = CartManager.instance.getCartItems();

      if (cartItems.isEmpty) {
        return PosOperationResult.failure(
          Intls.to.emptyCart,
          PosErrorType.validation,
        );
      }

      for (final item in cartItems) {
        if (item.quantity <= 0) {
          return PosOperationResult.failure(
            Intls.to.invalidQuantityForProduct.trParams({
              'product': item.label,
            }),
            PosErrorType.validation,
          );
        }

        if (item.unitPrice <= 0) {
          return PosOperationResult.failure(
            Intls.to.invalidPriceForProduct.trParams({'product': item.label}),
            PosErrorType.validation,
          );
        }

        if (item.productId.isEmpty) {
          return PosOperationResult.failure(
            Intls.to.productNotIdentifiedInCart,
            PosErrorType.validation,
          );
        }
      }

      return PosOperationResult.success(Intls.to.validCart);
    } on Exception catch (e) {
      _logger.severe('Error validating cart: $e');

      return PosOperationResult.failure(
        'Erreur lors de la validation du panier: $e',
        PosErrorType.unknown,
      );
    }
  }

  /// Validate inventory availability for all cart items
  Future<PosOperationResult> _validateInventoryAvailability() async {
    try {
      final cartItems = CartManager.instance.getCartItems();
      final store = UserPreferences.instance.store;

      if (store == null) {
        return PosOperationResult.failure(
          Intls.to.storeNotConfigured,
          PosErrorType.validation,
        );
      }

      for (final item in cartItems) {
        try {
          final availabilityResponse = await InventoryRepository.instance
              .checkProductAvailability(
                CheckProductAvailabilityRequest(
                  productId: item.productId,
                  storeId: store.refId,
                  quantityNeeded: item.quantity.toDouble(),
                ),
              );

          if (!availabilityResponse.isAvailable) {
            return PosOperationResult.failure(
              '${Intls.to.insufficientStockFor.trParams({'product': item.label})}'
              '${Intls.to.available}: ${availabilityResponse.quantityAvailable}, '
              '${Intls.to.requested}: ${item.quantity}',
              PosErrorType.inventory,
            );
          }
        } on Exception catch (e) {
          return PosOperationResult.failure(
            '${Intls.to.inventoryCheckFailed.trParams({'product': item.label})}: $e',
            PosErrorType.network,
          );
        }
      }

      return PosOperationResult.success(Intls.to.inventoryAvailable);
    } on Exception catch (e) {
      _logger.severe('Error validating inventory: $e');

      return PosOperationResult.failure(
        'Erreur validation inventaire: $e',
        PosErrorType.unknown,
      );
    }
  }

  /// Validate voucher code
  Future<GiftVoucher?> validateVoucher(String voucherCode) async {
    final response = await GiftVoucherRepository.instance.validateVoucher(
      ValidateVoucherRequest(voucherCode: voucherCode),
    );

    return response?.isValid == true &&
            (response?.remainingValue.toDouble() ?? 0) > 0
        ? GiftVoucher(
            voucherCode: voucherCode,
            initialValue: response?.remainingValue ?? 0,
            remainingValue: response?.remainingValue ?? 0,
            documentId: response?.voucherId ?? '',
            validUntil: response?.validUntil,
            status: response?.status,
          )
        : null;
  }

  void _resetButtonState() {
    completeOrderButtonState = ButtonState.initial;
  }

  void _showLoadingState() {
    completeOrderButtonState = ButtonState.loading;
    notifyListeners();
  }

  void _setErrorState(PosOperationResult error) {
    _currentError = error;
    notifyListeners();
  }

  void _setSuccessState(PosOperationResult success) {
    _currentSuccess = success;
    notifyListeners();
  }
}
