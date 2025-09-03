import '../../../providers/auth/auth_provider.dart';

/// Login view model.
class LoginViewModel {
  /// Validates all fields and calls AuthProvider.login.
  Future<bool> loginUser({
    required String login,
    required String password,
  }) async {
    final auth = AuthProvider.instance;
    final result = await auth.login(login.trim(), password.trim());

    return result;
  }
}
