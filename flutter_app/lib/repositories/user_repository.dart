import 'package:get/get.dart';
import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';

/// The user repository.
final class UserRepository extends GetxService {
  final _logger = LoggerApp('UserRepository');

  /// The user service client.
  final UserServiceClient userClientService;

  /// Access the singleton instance.
  static UserRepository get to => Get.find();

  /// Constructs a new [AuthServiceClient].
  UserRepository()
    : userClientService = UserServiceClient(ConnectRPCService.to.clientChannel);

  /// Creates a new user.
  /*
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
  */

  /// Retrieves a user by ID or email and password.
  Future<User?> getMe({required GetMeRequest request}) async {
    try {
      final result = await userClientService.getMe(request);

      _logger.log('Retrieved user: ${result.me.writeToJson()}.');

      return result.me;
    } on Exception catch (e) {
      _logger.severe('Caught error: $e');

      return null;
    }
  }
}
