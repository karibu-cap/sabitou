//
//  Generated code. Do not modify.
//  source: order/v1/voucher.proto
//

import "package:connectrpc/connect.dart" as connect;
import "voucher.pb.dart" as orderv1voucher;
import "voucher.connect.spec.dart" as specs;

extension type VoucherServiceClient (connect.Transport _transport) {
  Future<orderv1voucher.CreateVoucherResponse> createVoucher(
    orderv1voucher.CreateVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.VoucherService.createVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<orderv1voucher.GetVoucherResponse> getVoucher(
    orderv1voucher.GetVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.VoucherService.getVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  Future<orderv1voucher.RedeemVoucherResponse> redeemVoucher(
    orderv1voucher.RedeemVoucherRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.VoucherService.redeemVoucher,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
