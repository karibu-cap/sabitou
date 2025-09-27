import 'package:connectrpc/connect.dart' as connect;
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../utils/logger.dart';

/// Remote implementation for voucher operations.
class RemoteVoucherRepository {
  final _logger = LoggerApp('RemoteVoucherRepository');

  /// The voucher service client.
  final VoucherServiceClient voucherServiceClient;

  /// Constructs a new [RemoteVoucherRepository].
  RemoteVoucherRepository({required connect.Transport transport})
    : voucherServiceClient = VoucherServiceClient(transport);

  /// Creates a voucher via RPC.
  Future<bool> createVoucher(CreateVoucherRequest request) async {
    try {
      final response = await voucherServiceClient.createVoucher(request);

      return response.hasRefId();
    } on Exception catch (e) {
      _logger.severe('createVoucher Error: $e');

      return false;
    }
  }

  /// Finds the vouchers via RPC.
  Future<List<Voucher>> findVouchers(FindVouchersRequest request) async {
    try {
      final response = await voucherServiceClient.findVouchers(request);

      return response.vouchers;
    } on Exception catch (e) {
      _logger.severe('findVouchers Error: $e');

      return [];
    }
  }
}
