//
//  Generated code. Do not modify.
//  source: order/v1/receipt.proto
//

import "package:connectrpc/connect.dart" as connect;
import "receipt.pb.dart" as orderv1receipt;
import "receipt.connect.spec.dart" as specs;

extension type BillingServiceClient (connect.Transport _transport) {
  /// Generates a billing for the order.
  Future<orderv1receipt.GenerateBillingResponse> generateBilling(
    orderv1receipt.GenerateBillingRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.BillingService.generateBilling,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
