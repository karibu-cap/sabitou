import 'package:connectrpc/connect.dart' as connect;
import 'package:get_it/get_it.dart';
import 'package:sabitou_rpc/sabitou_rpc.dart';

import '../services/network_status_provider/network_status_provider.dart';
import '../services/rpc/connect_rpc.dart';
import '../utils/logger.dart';
import 'users_repository.dart';

/// The auth service client.
class AuthRepository {
  final _logger = LoggerApp('AuthRepository');

  /// The user repository.
  final UserRepository userRepository = UserRepository.instance;

  /// The auth service client.
  final AuthServiceClient authClientService;

  /// The network status provider.
  final NetworkStatusProvider networkStatusProvider;

  /// Access the singleton instance.
  static AuthRepository get instance => GetIt.I.get<AuthRepository>();

  /// Constructs a new [AuthRepository].
  AuthRepository({
    connect.Transport? transport,
    NetworkStatusProvider? networkStatusProvider,
  }) : authClientService = AuthServiceClient(
         transport ?? ConnectRPCService.to.clientChannel,
       ),
       networkStatusProvider =
           networkStatusProvider ?? GetIt.I.get<NetworkStatusProvider>();

  /// Retrieves a auth by ID or email and password.
  Future<User?> getCurrentUser({required GetCurrentUserRequest request}) async {
    final result = await userRepository.getCurrentUser(request);

    return result;
  }

  /// Logins by ID or email and password.
  Future<User?> login({required LoginRequest request}) async {
    try {
      await authClientService.login(request);

      return getCurrentUser(request: GetCurrentUserRequest());
    } on Exception catch (e) {
      _logger.severe('login Error: $e');

      return null;
    }
  }

  /// Logins by ID or email and password.
  Future<User?> register({required RegisterRequest request}) async {
    try {
      await authClientService.register(request);

      return getCurrentUser(request: GetCurrentUserRequest());
    } on Exception catch (e) {
      _logger.severe(' Error during user registration: ${e.toString()}.');

      return null;
    }
  }
}
