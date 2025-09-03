import '../../../providers/auth/auth_provider.dart';

/// Registration view model.
class RegistrationViewModel {
  /// Handles user registration.
  Future<bool> registerUser({
    required String userName,
    required String email,
    required String phoneNumber,
    required String firstName,
    required String lastName,
    required String password,
  }) async {
    final success = await AuthProvider.instance.register(
      userName: userName,
      email: email,
      password: password,
      phoneNumber: phoneNumber,
      firstName: firstName,
      lastName: lastName,
    );

    return success;
  }
}
