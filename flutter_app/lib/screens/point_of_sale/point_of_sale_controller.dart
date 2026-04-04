import 'dart:async';

import 'package:flutter/material.dart';
import 'package:pdf/pdf.dart';
import 'package:provider/provider.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../repositories/gift_voucher_repository.dart';
import '../../repositories/pos_repository.dart';
import '../../services/internationalization/internationalization.dart';
import '../../utils/button_state.dart';
import '../../utils/common_functions.dart';
import '../../utils/logger.dart';
import '../../utils/pos_exceptions.dart';
import '../../utils/printer_management.dart';
import '../../widgets/pdf/printers/app_printer_utils.dart';
import '../../widgets/pdf/template/pos_widget.dart';
import 'point_of_sale_view_model.dart';
import 'utils/cart_provider.dart';

/// Drives all POS business-logic actions from the UI layer.
class PointOfSaleController extends ChangeNotifier {
  final LoggerApp _log = LoggerApp('PointOfSaleController');
  final PointOfSaleViewModel _viewModel;

  /// Text controller shared with the search/scan input field.
  final searchQueryController = TextEditingController();

  /// State of the primary "Complete Order" action button.
  ButtonState completeOrderButtonState = ButtonState.initial;

  PosOperationResult? _currentError;
  PosOperationResult? _currentSuccess;

  /// Instance of the thermal printer manager.
  final _thermalPrinter = FlutterThermalPrinter.instance;

  /// List of available printers, updated via the [_devicesStreamSubscription].
  List<Printer> printers = [];

  /// Subscription to the [_thermalPrinter]'s devices stream, used to update [printers].
  StreamSubscription<List<Printer>>? _devicesStreamSubscription;

  /// The current store.
  Store get store => _viewModel.store;

  /// The current user.
  User get user => _viewModel.user;

  /// The most recent error result, or `null` when no error is active.
  PosOperationResult? get currentError => _currentError;

  /// The most recent success result, or `null` when no success is pending.
  PosOperationResult? get currentSuccess => _currentSuccess;

  /// Creates a [PointOfSaleController] and starts the BLE/USB scan.
  PointOfSaleController(this._viewModel) {
    startScan();
  }

  /// Starts listening for nearby USB/BLE thermal printers.
  void startScan() {
    _devicesStreamSubscription?.cancel();
    unawaited(
      _thermalPrinter.getPrinters(
        connectionTypes: [ConnectionType.USB, ConnectionType.BLE],
      ),
    );
    _devicesStreamSubscription = _thermalPrinter.devicesStream.listen((event) {
      printers = event
          .where(
            (p) =>
                p.name != null &&
                p.name?.isNotEmpty == true &&
                (p.name ?? '').toLowerCase().contains('print'),
          )
          .toList();
    });
  }

  /// Searches for products in the current store matching [query].
  Future<List<CustomProduct>> searchProducts(String query) =>
      _viewModel.searchProducts(query);

  /// Processes the payment, updates inventory, and prints the receipt.
  ///
  /// Orchestration order:
  /// 1. Guard: validate store / user / printer / cart.
  /// 2. Persist the draft receipt to SQL (so it exists before processing).
  /// 3. Call [PosRepository.processCashReceiptPayment] inside a transaction.
  /// 4. On success: print ticket, clear cart, broadcast success.
  /// 5. On failure: surface the appropriate error to the UI.
  ///
  /// Returns `true` when the sale was completed and the ticket printed.
  Future<bool> completeSimpleSale(
    BuildContext context, {
    bool isOverpayment = false,
  }) async {
    _showLoadingState();

    try {
      // final printer = await _getPrinter();
      // if (printer != null) {
      //   if (context.mounted) {
      //     showErrorToast(
      //       context: context,
      //       message: Intls.to.noPrinterConnected,
      //     );
      //   }

      //   return false;
      // }

      final cartProvider = context.read<CartProvider>();
      final receipt = cartProvider.currentCashReceipt;

      if (receipt == null || receipt.items.isEmpty) {
        return _fail(
          context,
          PosOperationResult.failure(
            Intls.to.emptyCart,
            PosErrorType.validation,
          ),
        );
      }

      final payments = cartProvider.payments;
      if (payments.isEmpty) {
        return _fail(
          context,
          PosOperationResult.failure(
            Intls.to.noPaymentAdded,
            PosErrorType.payment,
          ),
        );
      }

      await PosRepository.instance.saveDraftReceipt(receipt);

      final result = await PosRepository.instance.processCashReceiptPayment(
        receiptId: receipt.refId,
        payments: payments,
        cashierUserId: user.refId,
        storeId: store.refId,
        issueVoucherOnChange: isOverpayment,
      );

      // final printed = await _printReceipt(
      //   result.receipt,
      //   store,
      //   printer,
      //   context,
      // );

      // if (!printed) {
      //   if (context.mounted) {
      //     showErrorToast(context: context, message: Intls.to.printFailed);
      //   }
      // }

      _setSuccessState(
        PosOperationResult.success(Intls.to.saleCompletedSuccessfully),
      );
      if (context.mounted) {
        showSuccessToast(
          context: context,
          message: Intls.to.saleCompletedSuccessfully,
        );
      }

      // Remove completed receipt from drafts and reset cart.
      cartProvider.clearCart();

      _log.info('Sale completed: ${result.receipt.refId}');

      return true;
    } on IncompletePaymentException catch (e) {
      return _fail(
        context,
        PosOperationResult.failure(
          '${Intls.to.incompletePayment}: '
          '${e.shortfall.toStringAsFixed(0)} XAF ${Intls.to.remaining}',
          PosErrorType.payment,
        ),
      );
    } on InsufficientStockException catch (e) {
      return _fail(
        context,
        PosOperationResult.failure(
          '${Intls.to.insufficientStockFor.trParams({'product': e.productLabel})}'
          ' — ${Intls.to.available}: ${e.available}, '
          '${Intls.to.requested}: ${e.requested}',
          PosErrorType.inventory,
        ),
      );
    } on ReceiptNotFoundException catch (e) {
      return _fail(
        context,
        PosOperationResult.failure(e.message, PosErrorType.validation),
      );
    } on ReceiptAlreadyCompletedException catch (e) {
      return _fail(
        context,
        PosOperationResult.failure(e.message, PosErrorType.validation),
      );
    } on Exception catch (e) {
      _log.severe('completeSimpleSale failed: $e');

      return _fail(
        context,
        PosOperationResult.failure(
          '${Intls.to.saleError}: $e',
          PosErrorType.unknown,
        ),
      );
    } finally {
      _resetButtonState();
    }
  }

  /// Validates a voucher code and returns the [GiftVoucher] if valid.
  ///
  /// Returns `null` when the voucher is invalid or has no remaining balance.
  Future<GiftVoucher?> validateVoucher(String voucherCode) async {
    final response = await GiftVoucherRepository.instance.validateVoucher(
      voucherCode,
    );

    if (response.isValid != true || (response.remainingValue.toDouble()) <= 0) {
      return null;
    }

    return GiftVoucher(
      voucherCode: voucherCode,
      initialValue: response.remainingValue,
      remainingValue: response.remainingValue,
      refId: response.voucherId,
      validUntil: response.validUntil,
      status: response.status,
    );
  }

  /// Clears the active error state.
  void clearError() {
    _currentError = null;
    notifyListeners();
  }

  /// Clears the active success state.
  void clearSuccess() {
    _currentSuccess = null;
    notifyListeners();
  }

  /// Reads the saved printer preference from [AppStorage].
  Future<Printer?> _getPrinter() async {
    return null;
  }

  /// Prints the completed receipt on the thermal printer.
  Future<bool> _printReceipt(
    CashReceipt receipt,
    Store store,
    Printer printer,
    BuildContext context,
  ) async {
    final widget = await PosWidget(
      cashReceipt: receipt,
      store: store,
    ).buildInvoiceWidget();

    return AppPrinterUtils.directPrintPdf(
      context: context,
      printer: printer,
      name: 'receipt_${receipt.refId.substring(0, 8)}',
      format: PdfPageFormat.roll80,
      widget: widget,
    );
  }

  /// Sends the completed receipt to the backend gRPC service.
  ///
  /// This is fire-and-forget — PowerSync will retry on reconnect.
  // Future<void> _syncToBackend(
  //   PaymentResult result,
  //   List<Payment> payments,
  //   bool issueVoucherOnChange,
  // ) async {
  //   try {
  //     await PosRepository.instance; // no-op placeholder
  //     // TODO: call PosGrpcRepository.createCashReceipt(
  //     //   CreateCashReceiptRequest(
  //     //     receipt: result.receipt,
  //     //     payments: payments,
  //     //     issueVoucherOnChange: issueVoucherOnChange,
  //     //   ),
  //     // );
  //     _log.info('Backend sync queued for: ${result.receipt.refId}');
  //   } on Exception catch (e) {
  //     // Non-fatal — the local SQLite is the source of truth for offline.
  //     _log.warning('Backend sync failed (will retry): $e');
  //   }
  // }

  bool _fail(BuildContext context, PosOperationResult result) {
    _setErrorState(result);
    if (context.mounted) {
      showErrorToast(context: context, message: result.message);
    }

    return false;
  }

  void _resetButtonState() {
    completeOrderButtonState = ButtonState.initial;
    notifyListeners();
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

  @override
  void dispose() {
    searchQueryController.dispose();
    _devicesStreamSubscription?.cancel();
    super.dispose();
  }
}

/// Error categories for POS operations.
enum PosErrorType { network, validation, inventory, payment, voucher, unknown }

/// Outcome of a single POS controller operation.
class PosOperationResult {
  const PosOperationResult.success(this.message)
    : success = true,
      errorType = null;

  const PosOperationResult.failure(this.message, this.errorType)
    : success = false;

  /// Whether the operation succeeded.
  final bool success;

  /// Human-readable message for the UI.
  final String message;

  /// Category of the error, or `null` on success.
  final PosErrorType? errorType;
}
