import 'dart:async';

import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'remotes/remote_gift_voucher_repository.dart';

/// The gift voucher repository.
class GiftVoucherRepository {
  final _logger = LoggerApp('GiftVoucherRepository');

  /// The instance of [GiftVoucherRepository].
  static final instance = GetIt.I.get<GiftVoucherRepository>();

  /// The remote gift voucher repository.
  final RemoteGiftVoucherRepository remoteGiftVoucherRepository;

  /// Constructs a new [GiftVoucherRepository].
  GiftVoucherRepository({connect.Transport? transport})
    : remoteGiftVoucherRepository = RemoteGiftVoucherRepository(
        transport: transport ?? ConnectRPCService.to.clientChannel,
      );

  /// Validates a voucher.
  Future<ValidateVoucherResponse?> validateVoucher(
    ValidateVoucherRequest request,
  ) async {
    try {
      return await remoteGiftVoucherRepository.validateVoucher(request);
    } on Exception catch (e) {
      _logger.severe('validateVoucher Error: $e');

      return null;
    }
  }

  /// Gets a voucher.
  Future<GetVoucherResponse?> getVoucher(GetVoucherRequest request) async {
    try {
      return await remoteGiftVoucherRepository.getVoucher(request);
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
      return await remoteGiftVoucherRepository.listVouchers(request);
    } on Exception catch (e) {
      _logger.severe('listVouchers Error: $e');

      return null;
    }
  }
}
