//
//  Generated code. Do not modify.
//  source: payments/v1/pos_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "pos_service.pb.dart" as paymentsv1pos_service;
import "pos_service.connect.spec.dart" as specs;

extension type PointOfSaleServiceClient (connect.Transport _transport) {
  /// Create a cash receipt (most common - 95% of transactions)
  Future<paymentsv1pos_service.CreateCashReceiptResponse> createCashReceipt(
    paymentsv1pos_service.CreateCashReceiptRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PointOfSaleService.createCashReceipt,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Handle insufficient change scenario (create invoice + gift voucher)
  Future<paymentsv1pos_service.ProcessSaleWithVoucherResponse> processSaleWithVoucher(
    paymentsv1pos_service.ProcessSaleWithVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PointOfSaleService.processSaleWithVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Use gift voucher in payment
  Future<paymentsv1pos_service.PayWithVoucherResponse> payWithVoucher(
    paymentsv1pos_service.PayWithVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PointOfSaleService.payWithVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get daily sales summary for a cashier
  Future<paymentsv1pos_service.GetCashierDailySummaryResponse> getCashierDailySummary(
    paymentsv1pos_service.GetCashierDailySummaryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PointOfSaleService.getCashierDailySummary,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
