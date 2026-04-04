import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../utils/logger.dart';

/// The audits repository.
class AuditsRepository {
  final _logger = LoggerApp('AuditsRepository');

  /// The instance of [AuditsRepository].
  static final instance = GetIt.I.get<AuditsRepository>();

  /// Constructs a new [AuditsRepository].
  AuditsRepository({connect.Transport? transport});

  /// Gets the inventory transactions for a store.
  Future<List<VoucherTransaction>> getVoucherTransactions(
    String storeId,
  ) async {
    try {
      // final result = await auditsServiceClient.getVoucherTransactionAuditLogs(
      //   request,
      // );

      return Future.value([]);
    } on Exception catch (e) {
      _logger.severe('getVoucherTransactions Error: $e');

      return [];
    }
  }

  /// Gets a voucher.
  Future<List<InventoryTransaction>> getInventoryTransactionAuditLogs(
    String storeId,
  ) async {
    try {
      // final result = await auditsServiceClient.getInventoryTransactionAuditLogs(
      //   request,
      // );

      return Future.value([]);
    } on Exception catch (e) {
      _logger.severe('getInventoryTransactionAuditLogs Error: $e');

      return [];
    }
  }
}
