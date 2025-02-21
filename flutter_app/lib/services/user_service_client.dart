import 'package:get/get.dart';
import 'package:grpc/grpc_or_grpcweb.dart';
import 'package:sabitou_dart/proto/user/v1/user.pbgrpc.dart';

import '../utils/logger.dart';

/// The user service client.
final class UserClientService extends GetxService {
  final _logger = LoggerApp('UserClientService');

  /// The user service client.
  final UserServiceClient userClientService;

  /// The client channel.
  final GrpcOrGrpcWebClientChannel clientChannel;

  /// Access the singleton instance.
  static UserClientService get to => Get.find();

  /// Constructs a new [UserServiceClient].
  UserClientService({required this.clientChannel})
      : userClientService = UserServiceClient(
          clientChannel,
        );

  /// Creates a new user.
  Future<String?> createUser({required CreateUserRequest request}) async {
    try {
      final result = await userClientService.createUser(
        CreateUserRequest()
          ..firstName = request.firstName
          ..lastName = request.lastName
          ..email = request.email
          ..password = request.password
          ..connectionType = request.connectionType,
      );

      _logger.log(
        'Created user: ${request.writeToJson()}.',
      );

      return result.id;
    } on Exception catch (e) {
      _logger.severe('Caught error: $e');

      return null;
    } finally {
      await clientChannel.shutdown();
    }
  }

  /// Retrieves a user by ID or email and password.
  Future<User?> getUser({required GetUserRequest request}) async {
    try {
      final result = await userClientService.getUser(
        GetUserRequest()
          ..id = request.id
          ..email = request.email
          ..password = request.password,
      );

      _logger.log(
        'Retrieved user: ${result.user.writeToJson()}.',
      );

      return result.user;
    } on Exception catch (e) {
      _logger.severe('Caught error: $e');

      return null;
    } finally {
      await clientChannel.shutdown();
    }
  }
}
