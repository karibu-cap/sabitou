//
//  Generated code. Do not modify.
//  source: payments/v1/payments.proto
//

import "package:connectrpc/connect.dart" as connect;
import "payments.pb.dart" as paymentsv1payments;
import "payments.connect.spec.dart" as specs;

extension type PaymentServiceClient (connect.Transport _transport) {
  /// Record a payment
  Future<paymentsv1payments.CreatePaymentResponse> createPayment(
    paymentsv1payments.CreatePaymentRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.createPayment,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Get payment details
  Future<paymentsv1payments.GetPaymentResponse> getPayment(
    paymentsv1payments.GetPaymentRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.getPayment,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// List payments with filtering
  Future<paymentsv1payments.ListPaymentsResponse> listPayments(
    paymentsv1payments.ListPaymentsRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.listPayments,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }

  /// Process refund
  Future<paymentsv1payments.CreateRefundResponse> createRefund(
    paymentsv1payments.CreateRefundRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.PaymentService.createRefund,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
