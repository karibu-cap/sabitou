import 'package:get/get.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:sabitou_rpc/models.dart';

import '../utils/logger.dart';

/// The business service client.
final class BusinessService extends GetxService {
  final _logger = LoggerApp('BusinessService');

  /// The user service client.
  final BusinessServiceClient businessService;

  /// The client channel.
  final GrpcOrGrpcWebClientChannel clientChannel;

  /// Access the singleton instance.
  static BusinessService get to => Get.find();

  /// Constructs a new [UserServiceClient].
  BusinessService({required this.clientChannel})
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

      return result.id;
    } on Exception catch (e) {
      _logger.severe('Caught error: $e');

      return null;
    } finally {
      await clientChannel.shutdown();
    }
  }
}
