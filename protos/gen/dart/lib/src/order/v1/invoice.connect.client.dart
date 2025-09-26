//
//  Generated code. Do not modify.
//  source: order/v1/invoice.proto
//

import "package:connectrpc/connect.dart" as connect;
import "invoice.pb.dart" as orderv1invoice;
import "invoice.connect.spec.dart" as specs;

extension type InvoiceServiceClient (connect.Transport _transport) {
  /// Creates an invoice for the order.
  Future<orderv1invoice.CreateInvoiceResponse> createInvoice(
    orderv1invoice.CreateInvoiceRequest input, {
    connect.Headers? headers,
    connect.AbortSignal? signal,
    Function(connect.Headers)? onHeader,
    Function(connect.Headers)? onTrailer,
  }) {
    return connect.Client(_transport).unary(
      specs.InvoiceService.createInvoice,
      input,
      signal: signal,
      headers: headers,
      onHeader: onHeader,
      onTrailer: onTrailer,
    );
  }
}
