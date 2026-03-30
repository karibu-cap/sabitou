import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/query/sql_condition.dart';
import '../core/database/row_mapper.dart';
import '../utils/app_constants.dart';
import '../utils/logger.dart';
import '../utils/utils.dart';

/// The payments repository.
class PaymentsRepository extends BaseRepository<Payment> {
  final _logger = LoggerApp('PaymentsRepository');

  /// The instance of [PaymentsRepository].
  static final instance = GetIt.I.get<PaymentsRepository>();

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.payments;

  @override
  Payment fromRow(RawRow row) => fromRowToPayment(row);

  @override
  RawRow toRow(Payment entity) => fromPaymentToRaw(entity);

  /// Constructs a new [PaymentsRepository].
  PaymentsRepository({required this.dataSource});

  /// Creates a payment in the local database.
  Future<Payment?> createPayment(Payment payment) async {
    try {
      payment.refId = AppUtils.generateSmartDatabaseId('PAY');
      await create(payment);

      return payment;
    } on Exception catch (e) {
      _logger.severe('createPayment Error: $e');

      return null;
    }
  }

  /// Gets a payment.
  Future<Payment?> getPayment(String paymentId) async {
    try {
      return await findById(paymentId);
    } on Exception catch (e) {
      _logger.severe('getPayment Error: $e');

      return null;
    }
  }

  /// Watch the payment collection.
  Stream<List<Payment>> watchPayments(List<SqlQuery> filters) {
    try {
      return watchWhere(filters);
    } on Exception catch (e) {
      _logger.severe('watchPayments Error: $e');

      return Stream.value([]);
    }
  }

  /// Deletes a payment.
  Future<bool> deletePayment(String paymentId) async {
    try {
      await delete(paymentId);

      return true;
    } on Exception catch (e) {
      _logger.severe('deletePayment Error: $e');

      return false;
    }
  }
}
