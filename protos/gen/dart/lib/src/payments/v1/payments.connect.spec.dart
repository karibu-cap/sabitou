//
//  Generated code. Do not modify.
//  source: payments/v1/payments.proto
//

import "package:connectrpc/connect.dart" as connect;
import "payments.pb.dart" as paymentsv1payments;

abstract final class PaymentsService {
  /// Fully-qualified name of the PaymentsService service.
  static const name = 'payments.v1.PaymentsService';

  /// Record a payment
  static const createPayment = connect.Spec(
    '/$name/CreatePayment',
    connect.StreamType.unary,
    paymentsv1payments.CreatePaymentRequest.new,
    paymentsv1payments.CreatePaymentResponse.new,
  );
}
