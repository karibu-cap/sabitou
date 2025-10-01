import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The payments repository.
class PaymentsRepository {
  final _logger = LoggerApp('PaymentsRepository');

  /// The payment service client.
  final PaymentServiceClient paymentServiceClient;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// The instance of [PaymentsRepository].
  static final instance = GetIt.I.get<PaymentsRepository>();

  /// Constructs a new [PaymentsRepository].
  PaymentsRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : paymentServiceClient = PaymentServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Creates a payment.
  Future<CreatePaymentResponse?> createPayment(
    CreatePaymentRequest request,
  ) async {
    try {
      final response = await paymentServiceClient.createPayment(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('createPayment Error: $e');

      return null;
    }
  }

  /// Gets a payment.
  Future<GetPaymentResponse?> getPayment(GetPaymentRequest request) async {
    try {
      final response = await paymentServiceClient.getPayment(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('getPayment Error: $e');

      return null;
    }
  }

  /// Lists payments.
  Future<ListPaymentsResponse?> listPayments(
    ListPaymentsRequest request,
  ) async {
    try {
      final response = await paymentServiceClient.listPayments(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('listPayments Error: $e');

      return null;
    }
  }

  /// Creates a refund.
  Future<CreateRefundResponse?> createRefund(
    CreateRefundRequest request,
  ) async {
    try {
      final response = await paymentServiceClient.createRefund(request);

      return response;
    } on Exception catch (e) {
      _logger.severe('createRefund Error: $e');

      return null;
    }
  }
}
