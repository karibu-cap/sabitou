import 'package:get/get.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The transactions repository.
class TransactionsRepository extends GetxService {
  final _logger = LoggerApp('TransactionsRepository');

  /// The transaction service client.
  final TransactionServiceClient transactionServiceClient;

  /// The instance of [TransactionsRepository].
  static final instance = Get.find<TransactionsRepository>();

  /// Constructs a new [TransactionsRepository].
  TransactionsRepository()
    : transactionServiceClient = TransactionServiceClient(
        ConnectRPCService.to.clientChannel,
      );

  /// Gets the business transaction by business id.
  Future<List<Transaction>> getCompleteTransactionsByBusinessId({
    required String businessId,
    String? storeId,
    String? orderId,
    DateTime? startOfDay,
    DateTime? endOfDay,
  }) async {
    try {
      final response = await transactionServiceClient.findTransactions(
        FindTransactionsRequest(
          businessId: businessId,
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
      _logger.severe('getCompleteTransactionsByBusinessId Error: $e');

      return [];
    }
  }
}
