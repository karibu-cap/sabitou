//
//  Generated code. Do not modify.
//  source: order/v1/voucher.proto
//

import "package:connectrpc/connect.dart" as connect;
import "voucher.pb.dart" as orderv1voucher;

abstract final class VoucherService {
  /// Fully-qualified name of the VoucherService service.
  static const name = 'order.v1.VoucherService';

  static const createVoucher = connect.Spec(
    '/$name/CreateVoucher',
    connect.StreamType.unary,
    orderv1voucher.CreateVoucherRequest.new,
    orderv1voucher.CreateVoucherResponse.new,
  );

  static const getVoucher = connect.Spec(
    '/$name/GetVoucher',
    connect.StreamType.unary,
    orderv1voucher.GetVoucherRequest.new,
    orderv1voucher.GetVoucherResponse.new,
  );

  static const redeemVoucher = connect.Spec(
    '/$name/RedeemVoucher',
    connect.StreamType.unary,
    orderv1voucher.RedeemVoucherRequest.new,
    orderv1voucher.RedeemVoucherResponse.new,
  );
}
