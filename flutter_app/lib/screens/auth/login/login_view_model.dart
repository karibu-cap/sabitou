import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../providers/auth/auth_provider.dart';
import '../../../services/internationalization/internationalization.dart';

/// Login view model.
class LoginViewModel {
  final _appIntl = AppInternationalizationService.to;
  /// The email controller.
  final emailController = TextEditingController();

  /// The password controller.
  final passwordController = TextEditingController();

  /// Email validation error message.
  final RxString emailError = ''.obs;

  /// Password validation error message.
  final RxString passwordError = ''.obs;

  /// Observable for password visibility toggle.
  final RxBool isPasswordVisible = false.obs;

  /// Constructs login view model.
  LoginViewModel();

   /// Disposes all controllers and animation resources used by the view model.
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
  }

  /// Validates email field.
  bool validateEmail() {
    final email = emailController.text.trim();
    if (email.isEmpty) {
      emailError.value = _appIntl.loginEmailRequired;

      return false;
    }
    if (!GetUtils.isEmail(email)) {
      emailError.value = _appIntl.loginEmailInvalid;

      return false;
    }
    emailError.value = '';

    return true;
  }

  /// Validates password field.
  bool validatePassword() {
    final password = passwordController.text.trim();
    if (password.isEmpty) {
      passwordError.value = _appIntl.loginPasswordRequired;

      return false;
    }
    if (password.length < 6) {
      passwordError.value = _appIntl.loginPasswordLength;

      return false;
    }
    passwordError.value = '';

    return true;
  }

  /// Validates all fields.
  bool validateAll() {
    final emailValid = validateEmail();
    final passwordValid = validatePassword();

    return emailValid && passwordValid;
  }

  /// Clears all validation errors.
  void clearEmailForm() {
    // Clear error when user starts typing.
    if (emailError.value.isNotEmpty) {
      emailError.value = '';
    }
  }

  /// Clears all validation errors.
  void clearPasswordForm() {
    // Clear error when user starts typing.
    if (passwordError.value.isNotEmpty) {
      passwordError.value = '';
    }
  }

  /// Clears all validation errors.
  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
  }

  /// Validates all fields and calls AuthProvider.login.
  Future<bool> loginUser() async {
    if (!validateAll()) {
      return false;
    }
    final auth = AuthProvider.instance;
    final result = await auth.login(
      emailController.text.trim(),
      passwordController.text.trim(),
    );

    return result;
  }
}
