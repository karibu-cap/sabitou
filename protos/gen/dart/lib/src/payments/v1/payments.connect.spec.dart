//
//  Generated code. Do not modify.
//  source: payments/v1/payments.proto
//

import "package:connectrpc/connect.dart" as connect;
import "payments.pb.dart" as paymentsv1payments;

abstract final class PaymentService {
  /// Fully-qualified name of the PaymentService service.
  static const name = 'payments.v1.PaymentService';

  /// Record a payment
  static const createPayment = connect.Spec(
    '/$name/CreatePayment',
    connect.StreamType.unary,
    paymentsv1payments.CreatePaymentRequest.new,
    paymentsv1payments.CreatePaymentResponse.new,
  );

  /// Get payment details
  static const getPayment = connect.Spec(
    '/$name/GetPayment',
    connect.StreamType.unary,
    paymentsv1payments.GetPaymentRequest.new,
    paymentsv1payments.GetPaymentResponse.new,
  );

  /// List payments with filtering
  static const listPayments = connect.Spec(
    '/$name/ListPayments',
    connect.StreamType.unary,
    paymentsv1payments.ListPaymentsRequest.new,
    paymentsv1payments.ListPaymentsResponse.new,
  );
}
