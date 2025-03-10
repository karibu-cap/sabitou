//
//  Generated code. Do not modify.
//  source: order/v1/receipt.proto
//

import "package:connectrpc/connect.dart" as connect;
import "receipt.pb.dart" as orderv1receipt;

abstract final class BillingService {
  /// Fully-qualified name of the BillingService service.
  static const name = 'order.v1.BillingService';

  /// Generates a billing for the order.
  static const generateBilling = connect.Spec(
    '/$name/GenerateBilling',
    connect.StreamType.unary,
    orderv1receipt.GenerateBillingRequest.new,
    orderv1receipt.GenerateBillingResponse.new,
  );
}
