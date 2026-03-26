import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../core/database/base_repository.dart';
import '../core/database/local_data_source.dart';
import '../core/database/row_mapper.dart';
import '../services/powersync/schema.dart';
import '../utils/logger.dart';

/// The payments repository.
class PaymentsRepository extends BaseRepository<Payment> {
  final _logger = LoggerApp('PaymentsRepository');

  @override
  final LocalDataSource dataSource;

  @override
  String get tableName => CollectionName.payments;

  @override
  String get primaryKey => PaymentsFields.refId;

  @override
  Payment fromRow(RawRow row) => fromRowToPayment(row);

  @override
  RawRow toRow(Payment entity) => fromPaymentToRaw(entity);

  /// The instance of [PaymentsRepository].
  static final instance = GetIt.I.get<PaymentsRepository>();

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
}
