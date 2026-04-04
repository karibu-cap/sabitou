import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/models.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';

/// The gift voucher repository.
final class GiftVoucherRepository extends BaseRepository<GiftVoucher> {
  final _logger = LoggerApp('GiftVoucherRepository');

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.giftVouchers;

  /// The instance of [GiftVoucherRepository].
  static GiftVoucherRepository get instance =>
      GetIt.I.get<GiftVoucherRepository>();

  @override
  GiftVoucher fromRow(RawRow row) => fromRowToGiftVoucher(row);

  @override
  RawRow toRow(GiftVoucher entity) => fromGiftVoucherToRaw(entity);

  /// Constructs a new [GiftVoucherRepository].
  GiftVoucherRepository({required this.dataSource});

  /// Validates a voucher by its code using the local database.
  Future<ValidateVoucherResponse> validateVoucher(String voucherCode) async {
    try {
      final _voucherCode = voucherCode.trim();
      if (_voucherCode.isEmpty) {
        return ValidateVoucherResponse(
          isValid: false,
          message: 'Voucher code is required',
        );
      }

      // Query the database for the voucher by code
      final vouchers = await findWhere([
        SqlQuery.equals(GiftVouchersFields.voucherCode, _voucherCode),
      ]);

      if (vouchers.isEmpty) {
        return ValidateVoucherResponse(
          isValid: false,
          message: 'Voucher not found',
        );
      }

      final voucher = vouchers.first;

      // Check if voucher is expired
      if (voucher.hasValidUntil()) {
        final now = DateTime.now();
        final te = voucher.validUntil;
        if (te.toDateTime().isBefore(now)) {
          return ValidateVoucherResponse(
            isValid: false,
            voucherId: voucher.refId,
            remainingValue: voucher.remainingValue,
            validUntil: voucher.validUntil,
            status: voucher.status,
            message: 'Voucher has expired',
          );
        }
      }

      // Check if voucher has remaining value
      if (voucher.remainingValue <= 0) {
        return ValidateVoucherResponse(
          isValid: false,
          voucherId: voucher.refId,
          remainingValue: 0,
          validUntil: voucher.validUntil,
          status: VoucherStatus.VOUCHER_STATUS_FULLY_USED,
          message: 'Voucher has no remaining value',
        );
      }

      // Check voucher status
      if (voucher.status == VoucherStatus.VOUCHER_STATUS_CANCELLED) {
        return ValidateVoucherResponse(
          isValid: false,
          voucherId: voucher.refId,
          remainingValue: voucher.remainingValue,
          validUntil: voucher.validUntil,
          status: voucher.status,
          message: 'Voucher has been cancelled',
        );
      }

      // Voucher is valid
      return ValidateVoucherResponse(
        isValid: true,
        voucherId: voucher.refId,
        remainingValue: voucher.remainingValue,
        validUntil: voucher.validUntil,
        status: voucher.status,
        message: 'Voucher is valid',
      );
    } on Exception catch (e) {
      _logger.severe('validateVoucher Error: $e');

      return ValidateVoucherResponse(
        isValid: false,
        message: 'Error validating voucher: $e',
      );
    }
  }
}
