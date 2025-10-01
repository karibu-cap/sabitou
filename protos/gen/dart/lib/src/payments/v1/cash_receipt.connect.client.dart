//
//  Generated code. Do not modify.
//  source: payments/v1/cash_receipt.proto
//

import "package:connectrpc/connect.dart" as connect;
import "cash_receipt.pb.dart" as paymentsv1cash_receipt;
import "cash_receipt.connect.spec.dart" as specs;

extension type CashReceiptServiceClient (connect.Transport _transport) {
  /// Create a cash receipt (most common - 95% of transactions)
  Future<paymentsv1cash_receipt.CreateCashReceiptResponse> createCashReceipt(
    paymentsv1cash_receipt.CreateCashReceiptRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.CashReceiptService.createCashReceipt,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
