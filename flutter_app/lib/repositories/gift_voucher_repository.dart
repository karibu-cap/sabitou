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

  /// Creates a gift voucher.
  Future<CreateGiftVoucherResponse?> createGiftVoucher(
    CreateGiftVoucherRequest request,
  ) async {
    try {
      return await remoteGiftVoucherRepository.createGiftVoucher(request);
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
      return await remoteGiftVoucherRepository.validateVoucher(request);
    } on Exception catch (e) {
      _logger.severe('validateVoucher Error: $e');

      return null;
    }
  }

  /// Uses a voucher.
  Future<UseVoucherResponse?> useVoucher(UseVoucherRequest request) async {
    try {
      return await remoteGiftVoucherRepository.useVoucher(request);
    } on Exception catch (e) {
      _logger.severe('useVoucher Error: $e');

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

  /// Cancels a voucher.
  Future<CancelVoucherResponse?> cancelVoucher(
    CancelVoucherRequest request,
  ) async {
    try {
      return await remoteGiftVoucherRepository.cancelVoucher(request);
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
      return await remoteGiftVoucherRepository.getVoucherHistory(request);
    } on Exception catch (e) {
      _logger.severe('getVoucherHistory Error: $e');

      return null;
    }
  }
}
