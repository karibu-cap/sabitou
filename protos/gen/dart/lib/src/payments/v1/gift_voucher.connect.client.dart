//
//  Generated code. Do not modify.
//  source: payments/v1/gift_voucher.proto
//

import "package:connectrpc/connect.dart" as connect;
import "gift_voucher.pb.dart" as paymentsv1gift_voucher;
import "gift_voucher.connect.spec.dart" as specs;

extension type GiftVoucherServiceClient (connect.Transport _transport) {
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
}
