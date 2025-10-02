import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The pos of repository.
class PosOfRepository {
  final _logger = LoggerApp('PosOfRepository');

  /// The pos of service client.
  final CashReceiptServiceClient cashReceiptServiceClient;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The instance of [PosOfRepository].
  static final instance = GetIt.I.get<PosOfRepository>();

  /// Constructs a new [PosOfRepository].
  PosOfRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : cashReceiptServiceClient = CashReceiptServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Creates a payment.
  Future<CreateCashReceiptResponse?> createCashReceipt(
    CreateCashReceiptRequest request,
  ) async {
    try {
      final response = await cashReceiptServiceClient.createCashReceipt(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('createPayment Error: $e');

      return null;
    }
  }
}
