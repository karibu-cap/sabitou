import 'package:connectrpc/connect.dart' as connect;
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../utils/logger.dart';

/// Remote implementation for remote invoice operations.
class RemoteInvoiceRepository {
  final _logger = LoggerApp('RemoteInvoiceRepository');

  /// The invoice service client.
  final InvoiceServiceClient invoiceServiceClient;

  /// Constructs a new [RemoteInvoiceRepository].
  RemoteInvoiceRepository({required connect.Transport transport})
    : invoiceServiceClient = InvoiceServiceClient(transport);

  /// Creates a invoice via RPC.
  Future<bool> createInvoice(CreateInvoiceRequest request) async {
    try {
      final response = await invoiceServiceClient.createInvoice(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('createStockInbound Error: $e');

      return false;
    }
  }

  /// Updates a invoice via RPC.
  Future<bool> updateInvoice(UpdateInvoiceRequest request) async {
    try {
      final response = await invoiceServiceClient.updateInvoice(request);

      return response.success;
    } on Exception catch (e) {
      _logger.severe('updateStockInbound Error: $e');

      return false;
    }
  }
}
