import 'package:connectrpc/connect.dart' as connect;
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../../services/rpc/connect_rpc.dart';
import '../../utils/logger.dart';

/// Remote repository for gift voucher operations.
class RemoteGiftVoucherRepository {
  final _logger = LoggerApp('RemoteGiftVoucherRepository');

  /// The gift voucher service client.
  final GiftVoucherServiceClient giftVoucherServiceClient;

  /// Constructs a new [RemoteGiftVoucherRepository].
  RemoteGiftVoucherRepository({connect.Transport? transport})
    : giftVoucherServiceClient = GiftVoucherServiceClient(
        transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Validates a voucher.
  Future<ValidateVoucherResponse?> validateVoucher(
    ValidateVoucherRequest request,
  ) async {
    try {
      final response = await giftVoucherServiceClient.validateVoucher(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('validateVoucher Error: $e');

      return null;
    }
  }

  /// Gets a voucher.
  Future<GetVoucherResponse?> getVoucher(GetVoucherRequest request) async {
    try {
      final response = await giftVoucherServiceClient.getVoucher(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('getVoucher Error: $e');

      return null;
    }
  }

  /// Lists vouchers.
  Future<ListVouchersResponse?> listVouchers(
    ListVouchersRequest request,
  ) async {
    try {
      final response = await giftVoucherServiceClient.listVouchers(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('listVouchers Error: $e');

      return null;
    }
  }
}
