import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'remotes/remote_voucher_repository.dart';

/// The voucher repository.
class VoucherRepository {
  final _logger = LoggerApp('VoucherRepository');

  /// The instance of [VoucherRepository].
  static final instance = GetIt.I.get<VoucherRepository>();

  /// The network status provider.
  final NetworkStatusProvider _network;

  /// The remote voucher repository.
  final RemoteVoucherRepository remoteVoucherRepository;

  /// Constructs a new [VoucherRepository].
  VoucherRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : _network = networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>(),
       remoteVoucherRepository = RemoteVoucherRepository(
         transport: transport ?? ConnectRPCService.to.clientChannel,
       );

  /// Creates a voucher.
  Future<bool> createVoucher(CreateVoucherRequest request) async {
    try {
      final connection = await _network.checkConnectivity();
      if (connection) {
        return await remoteVoucherRepository.createVoucher(request);
      }
      // Fallback to false if offline, as stock inbound requires server for logging.
      _logger.warning('createVoucher: Offline, skipping creation.');

      return false;
    } on Exception catch (e) {
      _logger.severe('createVoucher Error: $e');

      return false;
    }
  }

  /// Updates a voucher.
  Future<List<Voucher>> findVouchers(FindVouchersRequest request) async {
    try {
      final connection = await _network.checkConnectivity();
      if (connection) {
        return await remoteVoucherRepository.findVouchers(request);
      }
      _logger.warning('findVouchers: Offline, skipping update.');

      return [];
    } on Exception catch (e) {
      _logger.severe('findVouchers Error: $e');

      return [];
    }
  }
}
