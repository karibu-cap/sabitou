//
//  Generated code. Do not modify.
//  source: payments/v1/gift_voucher.proto
//

import "package:connectrpc/connect.dart" as connect;
import "gift_voucher.pb.dart" as paymentsv1gift_voucher;

abstract final class GiftVoucherService {
  /// Fully-qualified name of the GiftVoucherService service.
  static const name = 'payments.v1.GiftVoucherService';

  /// Validate voucher before use
  static const validateVoucher = connect.Spec(
    '/$name/ValidateVoucher',
    connect.StreamType.unary,
    paymentsv1gift_voucher.ValidateVoucherRequest.new,
    paymentsv1gift_voucher.ValidateVoucherResponse.new,
  );
}
