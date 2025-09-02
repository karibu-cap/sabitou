import 'package:get/get.dart';

import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import 'users_repository.dart';

/// The auth service client.
final class AuthRepository extends GetxService {
  /// The user repository.
  final UserRepository userRepository = UserRepository.instance;

  /// The auth service client.
  final AuthServiceClient authClientService;

  /// The client channel.
  final Transport clientChannel;

  /// Access the singleton instance.
  static AuthRepository get instance => Get.find();

  /// Constructs a new [AuthRepository].
  AuthRepository({required this.clientChannel})
    : authClientService = AuthServiceClient(clientChannel);

  /// Retrieves a auth by ID or email and password.
  Future<User?> getCurrentUser({required GetCurrentUserRequest request}) async {
    final result = await userRepository.getCurrentUser(request: request);

    return result;
  }

  /// Logins by ID or email and password.
  Future<User?> login({required LoginRequest request}) async {
    try {
      await authClientService.login(request);

      return getCurrentUser(request: GetCurrentUserRequest());
    } on Exception catch (e) {
      print('User registered: ${e.toString()}.');

      return null;
    }
  }

  /// Logins by ID or email and password.
  Future<User?> register({required RegisterRequest request}) async {
    print('333333333333333333333');
    try {
      await authClientService.register(request);

      print('User registered: ${request.writeToJson()}.');
      print(
        'User registered: ${await getCurrentUser(request: GetCurrentUserRequest())}.',
      );

      return getCurrentUser(request: GetCurrentUserRequest());
    } on Exception catch (e) {
      print('User registered: ${e.toString()}.');

      return null;
    }
  }
}
