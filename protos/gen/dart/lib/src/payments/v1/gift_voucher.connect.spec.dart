//
//  Generated code. Do not modify.
//  source: payments/v1/gift_voucher.proto
//

import "package:connectrpc/connect.dart" as connect;
import "gift_voucher.pb.dart" as paymentsv1gift_voucher;

abstract final class GiftVoucherService {
  /// Fully-qualified name of the GiftVoucherService service.
  static const name = 'payments.v1.GiftVoucherService';

  /// Create a gift voucher (manual or from change shortage)
  static const createGiftVoucher = connect.Spec(
    '/$name/CreateGiftVoucher',
    connect.StreamType.unary,
    paymentsv1gift_voucher.CreateGiftVoucherRequest.new,
    paymentsv1gift_voucher.CreateGiftVoucherResponse.new,
  );

  /// Validate voucher before use
  static const validateVoucher = connect.Spec(
    '/$name/ValidateVoucher',
    connect.StreamType.unary,
    paymentsv1gift_voucher.ValidateVoucherRequest.new,
    paymentsv1gift_voucher.ValidateVoucherResponse.new,
  );

  /// Use voucher in transaction (called by PointOfSaleService)
  static const useVoucher = connect.Spec(
    '/$name/UseVoucher',
    connect.StreamType.unary,
    paymentsv1gift_voucher.UseVoucherRequest.new,
    paymentsv1gift_voucher.UseVoucherResponse.new,
  );

  /// Get voucher details
  static const getVoucher = connect.Spec(
    '/$name/GetVoucher',
    connect.StreamType.unary,
    paymentsv1gift_voucher.GetVoucherRequest.new,
    paymentsv1gift_voucher.GetVoucherResponse.new,
  );

  /// List vouchers with filtering
  static const listVouchers = connect.Spec(
    '/$name/ListVouchers',
    connect.StreamType.unary,
    paymentsv1gift_voucher.ListVouchersRequest.new,
    paymentsv1gift_voucher.ListVouchersResponse.new,
  );

  /// Cancel a voucher
  static const cancelVoucher = connect.Spec(
    '/$name/CancelVoucher',
    connect.StreamType.unary,
    paymentsv1gift_voucher.CancelVoucherRequest.new,
    paymentsv1gift_voucher.CancelVoucherResponse.new,
  );

  /// Get voucher usage history
  static const getVoucherHistory = connect.Spec(
    '/$name/GetVoucherHistory',
    connect.StreamType.unary,
    paymentsv1gift_voucher.GetVoucherHistoryRequest.new,
    paymentsv1gift_voucher.GetVoucherHistoryResponse.new,
  );
}
