//
//  Generated code. Do not modify.
//  source: payments/v1/gift_voucher.proto
//

import "package:connectrpc/connect.dart" as connect;
import "gift_voucher.pb.dart" as paymentsv1gift_voucher;
import "gift_voucher.connect.spec.dart" as specs;

extension type GiftVoucherServiceClient (connect.Transport _transport) {
  /// Create a gift voucher (manual or from change shortage)
  Future<paymentsv1gift_voucher.CreateGiftVoucherResponse> createGiftVoucher(
    paymentsv1gift_voucher.CreateGiftVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GiftVoucherService.createGiftVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Validate voucher before use
  Future<paymentsv1gift_voucher.ValidateVoucherResponse> validateVoucher(
    paymentsv1gift_voucher.ValidateVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GiftVoucherService.validateVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Use voucher in transaction (called by PointOfSaleService)
  Future<paymentsv1gift_voucher.UseVoucherResponse> useVoucher(
    paymentsv1gift_voucher.UseVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GiftVoucherService.useVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get voucher details
  Future<paymentsv1gift_voucher.GetVoucherResponse> getVoucher(
    paymentsv1gift_voucher.GetVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GiftVoucherService.getVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// List vouchers with filtering
  Future<paymentsv1gift_voucher.ListVouchersResponse> listVouchers(
    paymentsv1gift_voucher.ListVouchersRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GiftVoucherService.listVouchers,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Cancel a voucher
  Future<paymentsv1gift_voucher.CancelVoucherResponse> cancelVoucher(
    paymentsv1gift_voucher.CancelVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GiftVoucherService.cancelVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get voucher usage history
  Future<paymentsv1gift_voucher.GetVoucherHistoryResponse> getVoucherHistory(
    paymentsv1gift_voucher.GetVoucherHistoryRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.GiftVoucherService.getVoucherHistory,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
