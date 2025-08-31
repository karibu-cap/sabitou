import 'package:get/get.dart';

import 'package:sabitou_rpc/connect_servers.dart';
import 'package:sabitou_rpc/models.dart';

import 'user_repository.dart';

/// The auth service client.
final class AuthRepository extends GetxService {

  /// The user repository.
  final UserRepository userRepository = UserRepository.to;

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
  Future<User?> getMe({required GetMeRequest request}) async {
    final result = await userRepository.getMe(request: request);

    return result;
  }

  /// Logins by ID or email and password.
  Future<User?> login({required LoginRequest request}) async {
    await authClientService.login(request);

    return getMe(request: GetMeRequest());
  }

  /// Logins by ID or email and password.
  Future<User?> register({required LoginRequest request}) async {
    await authClientService.login(request);

    return getMe(request: GetMeRequest());
  }
}
