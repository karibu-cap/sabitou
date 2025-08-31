import 'package:connectrpc/connect.dart' as connect;
import 'package:get/get.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../utils/logger.dart';

/// The business service client.
final class BusinessRepository extends GetxService {
  /// Access the singleton instance.
  static BusinessRepository get to => Get.find();

  final _logger = LoggerApp('BusinessService');

  /// The user service client.
  final BusinessServiceClient businessService;

  /// The client channel.
  final connect.Transport clientChannel;

  /// Constructs a new [AuthServiceClient].
  BusinessRepository({required this.clientChannel})
      : businessService = BusinessServiceClient(
          clientChannel,
        );

  /// Creates a new user.
  Future<String?> createNewBusiness({required Business request}) async {
    try {
      final result = await businessService.createBusiness(
        CreateBusinessRequest(
          business: Business()
            ..name = request.name
            ..description = request.description,
        ),
      );

      _logger.log(
        'Created business: ${request.writeToJson()}.',
      );

      return result.businessId;
    } on Exception catch (e) {
      _logger.severe('Caught error: $e');

      return null;
    }
  }
}
