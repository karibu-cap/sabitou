import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../services/internationalization/internationalization.dart';
import 'login_view_model.dart';

/// Login controller.
class LoginController extends GetxController {
  final LoginViewModel _viewModel;
  final _appIntl = AppInternationalizationService.to;

  /// Constructs login controller.
  LoginController({required LoginViewModel viewModel}) : _viewModel = viewModel;

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

  /// Singleton access.
  static LoginController get instance => Get.find();

  /// Disposes all controllers and animation resources used by the controller.
  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
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
    if (emailError.value.isNotEmpty) {
      emailError.value = '';
    }
  }

  /// Clears all validation errors.
  void clearPasswordForm() {
    if (passwordError.value.isNotEmpty) {
      passwordError.value = '';
    }
  }

  /// Clears all validation errors.
  void clearErrors() {
    emailError.value = '';
    passwordError.value = '';
  }

  /// Toggle password visibility.
  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  /// Validates all fields and calls AuthProvider.login.
  Future<bool> loginUser() async {
    if (!validateAll()) {
      return false;
    }

    return await _viewModel.loginUser(
      login: emailController.text.trim(),
      password: passwordController.text.trim(),
    );
  }
}
