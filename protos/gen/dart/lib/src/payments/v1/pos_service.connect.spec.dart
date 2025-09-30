//
//  Generated code. Do not modify.
//  source: payments/v1/pos_service.proto
//

import "package:connectrpc/connect.dart" as connect;
import "pos_service.pb.dart" as paymentsv1pos_service;

abstract final class PointOfSaleService {
  /// Fully-qualified name of the PointOfSaleService service.
  static const name = 'payments.v1.PointOfSaleService';

  /// Create a cash receipt (most common - 95% of transactions)
  static const createCashReceipt = connect.Spec(
    '/$name/CreateCashReceipt',
    connect.StreamType.unary,
    paymentsv1pos_service.CreateCashReceiptRequest.new,
    paymentsv1pos_service.CreateCashReceiptResponse.new,
  );

  /// Handle insufficient change scenario (create invoice + gift voucher)
  static const processSaleWithVoucher = connect.Spec(
    '/$name/ProcessSaleWithVoucher',
    connect.StreamType.unary,
    paymentsv1pos_service.ProcessSaleWithVoucherRequest.new,
    paymentsv1pos_service.ProcessSaleWithVoucherResponse.new,
  );

  /// Use gift voucher in payment
  static const payWithVoucher = connect.Spec(
    '/$name/PayWithVoucher',
    connect.StreamType.unary,
    paymentsv1pos_service.PayWithVoucherRequest.new,
    paymentsv1pos_service.PayWithVoucherResponse.new,
  );

  /// Get daily sales summary for a cashier
  static const getCashierDailySummary = connect.Spec(
    '/$name/GetCashierDailySummary',
    connect.StreamType.unary,
    paymentsv1pos_service.GetCashierDailySummaryRequest.new,
    paymentsv1pos_service.GetCashierDailySummaryResponse.new,
  );
}
