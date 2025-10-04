import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'remotes/remote_gift_voucher_repository.dart';

/// The audits repository.
class AuditsRepository {
  final _logger = LoggerApp('AuditsRepository');

  /// The instance of [AuditsRepository].
  static final instance = GetIt.I.get<AuditsRepository>();

  /// The audits service client.
  final AuditsServiceClient auditsServiceClient;

  /// The remote gift voucher repository.
  final RemoteGiftVoucherRepository remoteGiftVoucherRepository;

  /// Constructs a new [AuditsRepository].
  AuditsRepository({connect.Transport? transport})
    : remoteGiftVoucherRepository = RemoteGiftVoucherRepository(
        transport: transport ?? ConnectRPCService.to.clientChannel,
      ),
      auditsServiceClient = AuditsServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Gets the inventory transactions for a store.
  Future<List<VoucherTransaction>> getVoucherTransactions(
    GetVoucherTransactionAuditLogsRequest request,
  ) async {
    try {
      final result = await auditsServiceClient.getVoucherTransactionAuditLogs(
        request,
      );

      return result.voucherTransactions;
    } on Exception catch (e) {
      _logger.severe('getVoucherTransactions Error: $e');

      return [];
    }
  }

  /// Gets a voucher.
  Future<List<InventoryTransaction>> getInventoryTransactionAuditLogs(
    GetInventoryTransactionAuditLogsRequest request,
  ) async {
    try {
      final result = await auditsServiceClient.getInventoryTransactionAuditLogs(
        request,
      );

      return result.inventoryTransactions;
    } on Exception catch (e) {
      _logger.severe('getInventoryTransactionAuditLogs Error: $e');

      return [];
    }
  }
}
