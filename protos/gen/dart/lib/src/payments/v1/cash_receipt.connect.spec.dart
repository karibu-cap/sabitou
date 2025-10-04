//
//  Generated code. Do not modify.
//  source: payments/v1/cash_receipt.proto
//

import "package:connectrpc/connect.dart" as connect;
import "cash_receipt.pb.dart" as paymentsv1cash_receipt;

abstract final class CashReceiptService {
  /// Fully-qualified name of the CashReceiptService service.
  static const name = 'payments.v1.CashReceiptService';

  /// Create a cash receipt (most common - 95% of transactions)
  static const createCashReceipt = connect.Spec(
    '/$name/CreateCashReceipt',
    connect.StreamType.unary,
    paymentsv1cash_receipt.CreateCashReceiptRequest.new,
    paymentsv1cash_receipt.CreateCashReceiptResponse.new,
  );

  static const findCashReceipt = connect.Spec(
    '/$name/FindCashReceipt',
    connect.StreamType.unary,
    paymentsv1cash_receipt.FindCashReceiptRequest.new,
    paymentsv1cash_receipt.FindCashReceiptResponse.new,
  );
}
