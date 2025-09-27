import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'remotes/remote_invoice_repository.dart';

/// The invoice repository.
class InvoiceRepository {
  final _logger = LoggerApp('InvoiceRepository');

  /// The instance of [InvoiceRepository].
  static final instance = GetIt.I.get<InvoiceRepository>();

  /// The network status provider.
  final NetworkStatusProvider _network;

  /// The remote invoice repository.
  final RemoteInvoiceRepository remoteInvoiceRepository;

  /// Constructs a new [InvoiceRepository].
  InvoiceRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : _network = networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>(),
       remoteInvoiceRepository = RemoteInvoiceRepository(
         transport: transport ?? ConnectRPCService.to.clientChannel,
       );

  /// Creates a invoice.
  Future<bool> createInvoice(CreateInvoiceRequest request) async {
    try {
      final connection = await _network.checkConnectivity();
      if (connection) {
        return await remoteInvoiceRepository.createInvoice(request);
      }
      // Fallback to false if offline, as invoice requires server for logging.
      _logger.warning('createInvoice: Offline, skipping creation.');

      return false;
    } on Exception catch (e) {
      _logger.severe('createInvoice Error: $e');

      return false;
    }
  }

  /// Updates a invoice.
  Future<bool> updateInvoice(UpdateInvoiceRequest request) async {
    try {
      final connection = await _network.checkConnectivity();
      if (connection) {
        return await remoteInvoiceRepository.updateInvoice(request);
      }
      _logger.warning('updateInvoice: Offline, skipping update.');

      return false;
    } on Exception catch (e) {
      _logger.severe('updateInvoice Error: $e');

      return false;
    }
  }
}
