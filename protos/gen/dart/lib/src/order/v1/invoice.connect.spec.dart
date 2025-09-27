//
//  Generated code. Do not modify.
//  source: order/v1/invoice.proto
//

import "package:connectrpc/connect.dart" as connect;
import "invoice.pb.dart" as orderv1invoice;

abstract final class InvoiceService {
  /// Fully-qualified name of the InvoiceService service.
  static const name = 'order.v1.InvoiceService';

  /// Creates an invoice for the order.
  static const createInvoice = connect.Spec(
    '/$name/CreateInvoice',
    connect.StreamType.unary,
    orderv1invoice.CreateInvoiceRequest.new,
    orderv1invoice.CreateInvoiceResponse.new,
  );

  /// Updates an invoice.
  static const updateInvoice = connect.Spec(
    '/$name/UpdateInvoice',
    connect.StreamType.unary,
    orderv1invoice.UpdateInvoiceRequest.new,
    orderv1invoice.UpdateInvoiceResponse.new,
  );

  /// Finds the invoices.
  static const findInvoices = connect.Spec(
    '/$name/FindInvoices',
    connect.StreamType.unary,
    orderv1invoice.FindInvoiceRequest.new,
    orderv1invoice.FindInvoiceResponse.new,
  );
}
