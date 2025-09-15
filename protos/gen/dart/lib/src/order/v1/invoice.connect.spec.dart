//
//  Generated code. Do not modify.
//  source: order/v1/invoice.proto
//

import "package:connectrpc/connect.dart" as connect;
import "invoice.pb.dart" as orderv1invoice;

abstract final class InvoiceService {
  /// Fully-qualified name of the InvoiceService service.
  static const name = 'order.v1.InvoiceService';

  /// Generates an invoice for the order.
  static const generateInvoice = connect.Spec(
    '/$name/GenerateInvoice',
    connect.StreamType.unary,
    orderv1invoice.GenerateInvoiceRequest.new,
    orderv1invoice.GenerateInvoiceResponse.new,
  );
}
