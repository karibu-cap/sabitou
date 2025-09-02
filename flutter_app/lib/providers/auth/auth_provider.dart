import 'package:get/get.dart';
import 'package:sabitou_rpc/models.dart';

import '../../repositories/auth_repository.dart';

/// Auth status.
enum AuthStatus {
  unauthenticated,
  authenticating,
  authenticated,
  authenticationFailed,
}

/// Auth provider.
class AuthProvider extends GetxController {
  /// Reactive state.
  final Rxn<User> _currentUser = Rxn<User>();
  final Rx<AuthStatus> _status = AuthStatus.unauthenticated.obs;
  final RxnString _errorMessage = RxnString();

  /// Singleton access.
  static AuthProvider get instance => Get.find();

  /// Current user.
  User? get currentUser => _currentUser.value;

  /// The status.
  AuthStatus get status => _status.value;

  /// The error message (for direct value access).
  String? get errorMessage => _errorMessage.value;

  /// The error message as an observable (for Obx).
  RxnString get errorMessageRx => _errorMessage;

  /// Whether user is authenticated.
  bool get isAuthenticated => _status.value == AuthStatus.authenticated;

  /// Login logic.
  Future<bool> login(String email, String password) async {
    _setStatus(AuthStatus.authenticating);
    _errorMessage.value = null;

    _setStatus(AuthStatus.authenticating);
    final loginRequest = LoginRequest()
      ..email = email
      ..password = password;
    final response = await AuthRepository.instance.login(request: loginRequest);
    _currentUser.value = response;
    if (response != null) {
      _setStatus(AuthStatus.authenticated);

      return true;
    }
    _setStatus(AuthStatus.authenticationFailed);

    return false;
  }

  /// Logout logic.
  Future<void> logout() async {
    _currentUser.value = null;
    _setStatus(AuthStatus.unauthenticated);
    _errorMessage.value = null;
  }

  /// Register logic.
  Future<bool> register({
    required String userName,
    required String email,
    required String password,
    required String phoneNumber,
    required String firstName,
    required String lastName,
  }) async {
    _setStatus(AuthStatus.authenticating);
    print('1111111111111111111');
    final registerRequest = RegisterRequest()
      ..userName = userName
      ..password = password
      ..email = email;
    final response = await AuthRepository.instance.register(
      request: registerRequest,
    );

    print('2222222222222222222');
    _currentUser.value = response;
    if (response != null) {
      _setStatus(AuthStatus.authenticated);

      return true;
    }
    _setStatus(AuthStatus.authenticationFailed);

    return false;
  }

  /// Forgot password logic.
  Future<bool> forgetPassword(String email) async {
    try {
      await Future.delayed(const Duration(seconds: 1));
      // Simulate always success; replace with real API call.

      return true;
    } catch (e) {
      _setError('Forgot password failed: $e');

      return false;
    }
  }

  /// Change password.
  Future<bool> changePassword(String oldPassword, String newPassword) async {
    try {
      await Future.delayed(const Duration(seconds: 1));

      return true;
    } catch (e) {
      _setError('Password change failed: $e');

      return false;
    }
  }

  /// Internal helpers.
  void _setStatus(AuthStatus status) {
    _status.value = status;
  }

  void _setError(String message) {
    _errorMessage.value = message;
    _status.value = AuthStatus.authenticationFailed;
  }
}
