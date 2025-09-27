import 'package:connectrpc/connect.dart' as connect;
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../utils/logger.dart';

/// Remote implementation for stock inbound operations.
class RemoteStockInboundRepository {
  final _logger = LoggerApp('RemoteStockInboundRepository');

  /// The product service client.
  final StockInboundServiceClient stockInboundServiceClient;

  /// Constructs a new [RemoteStockInboundRepository].
  RemoteStockInboundRepository({required connect.Transport transport})
    : stockInboundServiceClient = StockInboundServiceClient(transport);

  /// Creates a stock inbound via RPC.
  Future<bool> createStockInbound(CreateStockInboundRequest request) async {
    try {
      final response = await stockInboundServiceClient.createStockInbound(
        request,
      );

      return response.success;
    } on Exception catch (e) {
      _logger.severe('createStockInbound Error: $e');

      return false;
    }
  }

  /// Updates a stock inbound via RPC.
  Future<bool> updateStockInbound(UpdateStockInboundRequest request) async {
    try {
      final response = await stockInboundServiceClient.updateStockInbound(
        request,
      );

      return response.success;
    } on Exception catch (e) {
      _logger.severe('updateStockInbound Error: $e');

      return false;
    }
  }

  /// Finds the stock in bounds via RPC.
  Future<List<StockInbound>> findStockInbounds(
    FindStockInboundRequest request,
  ) async {
    try {
      final response = await stockInboundServiceClient.findStockInbounds(
        request,
      );

      return response.stockInbounds;
    } on Exception catch (e) {
      _logger.severe('findStockInbounds Error: $e');

      return [];
    }
  }
}
