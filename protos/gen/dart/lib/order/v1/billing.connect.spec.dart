//
//  Generated code. Do not modify.
//  source: order/v1/billing.proto
//

import "package:connectrpc/connect.dart" as connect;
import "billing.pb.dart" as orderv1billing;

abstract final class BillingService {
  /// Fully-qualified name of the BillingService service.
  static const name = 'order.v1.BillingService';

  /// Generates a billing for the order.
  static const generateBilling = connect.Spec(
    '/$name/GenerateBilling',
    connect.StreamType.unary,
    orderv1billing.GenerateBillingRequest.new,
    orderv1billing.GenerateBillingResponse.new,
  );
}
