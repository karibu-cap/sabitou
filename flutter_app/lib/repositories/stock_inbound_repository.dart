import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'remotes/remote_stock_In_bound_repository.dart';

/// The stock inbound repository.
class StockInboundRepository {
  final _logger = LoggerApp('StockInboundRepository');

  /// The instance of [StockInboundRepository].
  static final instance = GetIt.I.get<StockInboundRepository>();

  /// The network status provider.
  final NetworkStatusProvider _network;

  /// The remote stock inbound repository.
  final RemoteStockInboundRepository remoteStockInboundRepository;

  /// Constructs a new [StockInboundRepository].
  StockInboundRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : _network = networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>(),
       remoteStockInboundRepository = RemoteStockInboundRepository(
         transport: transport ?? ConnectRPCService.to.clientChannel,
       );

  /// Creates a stock inbound.
  Future<bool> createStockInbound(CreateStockInboundRequest request) async {
    try {
      final connection = await _network.checkConnectivity();
      if (connection) {
        return await remoteStockInboundRepository.createStockInbound(request);
      }
      // Fallback to false if offline, as stock inbound requires server for logging.
      _logger.warning('createStockInbound: Offline, skipping creation.');

      return false;
    } on Exception catch (e) {
      _logger.severe('createStockInbound Error: $e');

      return false;
    }
  }

  /// Updates a stock inbound.
  Future<bool> updateStockInbound(UpdateStockInboundRequest request) async {
    try {
      final connection = await _network.checkConnectivity();
      if (connection) {
        return await remoteStockInboundRepository.updateStockInbound(request);
      }
      _logger.warning('updateStockInbound: Offline, skipping update.');

      return false;
    } on Exception catch (e) {
      _logger.severe('updateStockInbound Error: $e');

      return false;
    }
  }
}
