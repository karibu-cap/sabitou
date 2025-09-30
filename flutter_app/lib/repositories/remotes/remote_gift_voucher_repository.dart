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

  /// Creates a gift voucher.
  Future<CreateGiftVoucherResponse?> createGiftVoucher(
    CreateGiftVoucherRequest request,
  ) async {
    try {
      final response = await giftVoucherServiceClient.createGiftVoucher(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('createGiftVoucher Error: $e');

      return null;
    }
  }

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

  /// Uses a voucher.
  Future<UseVoucherResponse?> useVoucher(UseVoucherRequest request) async {
    try {
      final response = await giftVoucherServiceClient.useVoucher(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('useVoucher Error: $e');

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

  /// Cancels a voucher.
  Future<CancelVoucherResponse?> cancelVoucher(
    CancelVoucherRequest request,
  ) async {
    try {
      final response = await giftVoucherServiceClient.cancelVoucher(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('cancelVoucher Error: $e');

      return null;
    }
  }

  /// Gets voucher history.
  Future<GetVoucherHistoryResponse?> getVoucherHistory(
    GetVoucherHistoryRequest request,
  ) async {
    try {
      final response = await giftVoucherServiceClient.getVoucherHistory(
        request,
      );

      return response;
    } on Exception catch (e) {
      _logger.severe('getVoucherHistory Error: $e');

      return null;
    }
  }
}
