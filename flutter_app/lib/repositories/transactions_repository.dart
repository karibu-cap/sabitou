import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The transactions repository.
class TransactionsRepository {
  final _logger = LoggerApp('TransactionsRepository');

  /// The transaction service client.
  final TransactionServiceClient transactionServiceClient;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The instance of [TransactionsRepository].
  static final instance = GetIt.I.get<TransactionsRepository>();

  /// Constructs a new [TransactionsRepository].
  TransactionsRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : transactionServiceClient = TransactionServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Gets the store transaction by store id.
  Future<List<Transaction>> getCompleteTransactionsByStoreId({
    required String storeId,
    String? orderId,
    DateTime? startOfDay,
    DateTime? endOfDay,
  }) async {
    try {
      final response = await transactionServiceClient.findTransactions(
        FindTransactionsRequest(
          storeId: storeId,
          orderId: orderId,
          startDate: startOfDay != null
              ? Timestamp.fromDateTime(startOfDay)
              : null,
          endDate: endOfDay != null ? Timestamp.fromDateTime(endOfDay) : null,
        ),
      );

      return response.transactions;
    } on Exception catch (e) {
      _logger.severe('getCompleteTransactionsByStoreId Error: $e');

      return [];
    }
  }
}
